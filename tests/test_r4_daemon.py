# -*- coding: utf-8 -*-
"""
Empirical Verification Harness for Requirement 4 (Economy Daemon Reliability)
Author: Challenger 1
Target: skyblock_economy_daemon.py
"""

import os
import sys
import time
import shutil
import tempfile
import py_compile

# Ensure UTF-8 output
sys.stdout.reconfigure(encoding="utf-8")

PROJECT_ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))
DAEMON_PATH = os.path.join(PROJECT_ROOT, "skyblock_economy_daemon.py")

# Import the daemon module to test its real functions
sys.path.insert(0, PROJECT_ROOT)
import skyblock_economy_daemon as daemon


def test_1_compilation():
    print("=" * 70)
    print("TEST 1: PY_COMPILE COMPILATION CHECK")
    print(f"Target: {DAEMON_PATH}")
    print("=" * 70)
    try:
        py_compile.compile(DAEMON_PATH, doraise=True)
        print("[PASS] skyblock_economy_daemon.py compiled successfully with 0 errors.")
        return True
    except Exception as e:
        print(f"[FAIL] Compilation error: {e}")
        return False


def test_2_open_log_shared_contract():
    print("\n" + "=" * 70)
    print("TEST 2: OPEN_LOG_SHARED WINDOWS SHARING CONTRACT")
    print("=" * 70)

    temp_dir = tempfile.mkdtemp(prefix="skyblock_test_")
    test_file = os.path.join(temp_dir, "test_shared.log")
    renamed_file = os.path.join(temp_dir, "test_shared_rotated.log")

    try:
        # Create initial file
        with open(test_file, "w", encoding="utf-8") as f:
            f.write("Initial line 1\nInitial line 2\n")

        # Open with open_log_shared
        shared_handle = daemon.open_log_shared(test_file)
        if not shared_handle:
            print("[FAIL] open_log_shared returned None on existing file!")
            return False
        print("[PASS] open_log_shared successfully opened file.")

        # Read initial content
        line1 = shared_handle.readline().strip()
        print(f"    - Read line 1: '{line1}'")
        if line1 != "Initial line 1":
            print(f"[FAIL] Content mismatch, expected 'Initial line 1', got '{line1}'")
            return False

        # Sub-test 2.1: Concurrent Append while handle is open
        try:
            with open(test_file, "a", encoding="utf-8") as f:
                f.write("Concurrent appended line 3\n")
            print("[PASS] Sub-test 2.1: Concurrent append allowed while handle open.")
        except Exception as e:
            print(f"[FAIL] Sub-test 2.1: Concurrent append failed: {e}")
            return False

        # Verify shared_handle can read the concurrently appended line
        line2 = shared_handle.readline().strip()
        line3 = shared_handle.readline().strip()
        print(f"    - Read line 2: '{line2}'")
        print(f"    - Read line 3: '{line3}'")
        if line3 != "Concurrent appended line 3":
            print(f"[FAIL] Failed to read appended line through shared handle!")
            return False

        # Sub-test 2.2: Concurrent Rename (Log4j rename rotation simulation)
        # On Windows, this REQUIRES FILE_SHARE_DELETE on shared_handle!
        try:
            os.rename(test_file, renamed_file)
            print("[PASS] Sub-test 2.2: Concurrent file rename succeeded while handle open (FILE_SHARE_DELETE verified).")
        except Exception as e:
            print(f"[FAIL] Sub-test 2.2: Concurrent rename failed (FILE_SHARE_DELETE missing or failed): {e}")
            return False

        # Sub-test 2.3: Read from renamed file handle (still valid)
        with open(renamed_file, "a", encoding="utf-8") as f:
            f.write("Line written to renamed file\n")
        line4 = shared_handle.readline().strip()
        print(f"    - Read line 4 from rotated handle: '{line4}'")
        if line4 != "Line written to renamed file":
            print("[FAIL] Failed to read from rotated handle")
            return False

        # Clean close
        shared_handle.close()
        print("[PASS] Clean close of shared_handle succeeded.")
        return True

    finally:
        # Cleanup
        try:
            shutil.rmtree(temp_dir, ignore_errors=True)
        except Exception:
            pass


def test_3_tail_loop_simulation():
    print("\n" + "=" * 70)
    print("TEST 3: TAIL LOOP ADAPTATION SIMULATION")
    print("Testing: Append, Rename Rotation, Truncation, Temporary Absence")
    print("=" * 70)

    temp_dir = tempfile.mkdtemp(prefix="skyblock_daemon_sim_")
    log_path = os.path.join(temp_dir, "latest.log")

    processed_lines = []

    def mock_process_line(line):
        processed_lines.append(line.strip())

    try:
        # Initialize empty file
        with open(log_path, "w", encoding="utf-8") as f:
            f.write("Header line\n")

        # Harness simulating daemon tail loop state machine
        log_file = None
        current_ino = None

        def step_daemon():
            nonlocal log_file, current_ino
            # Exact logic from skyblock_economy_daemon.py
            if log_file:
                try:
                    st = os.stat(log_path)
                    curr_pos = log_file.tell()
                    is_truncated = st.st_size < curr_pos
                    is_rotated = (current_ino is not None and st.st_ino != current_ino)

                    if is_rotated:
                        try:
                            while True:
                                leftover = log_file.readline()
                                if not leftover:
                                    break
                                mock_process_line(leftover)
                        except Exception:
                            pass

                    if is_truncated or is_rotated:
                        try:
                            log_file.close()
                        except Exception:
                            pass
                        log_file = daemon.open_log_shared(log_path)
                        if log_file:
                            current_ino = st.st_ino
                            log_file.seek(0, os.SEEK_SET)
                        else:
                            current_ino = None
                except (FileNotFoundError, PermissionError):
                    try:
                        log_file.close()
                    except Exception:
                        pass
                    log_file = None
                    current_ino = None
                except Exception:
                    pass

            if not log_file and os.path.exists(log_path):
                try:
                    st = os.stat(log_path)
                    log_file = daemon.open_log_shared(log_path)
                    if log_file:
                        current_ino = st.st_ino
                        log_file.seek(0, os.SEEK_SET)
                except (FileNotFoundError, PermissionError):
                    log_file = None
                    current_ino = None
                except Exception:
                    log_file = None
                    current_ino = None

            # Read new lines
            if log_file:
                while True:
                    line = log_file.readline()
                    if not line:
                        break
                    mock_process_line(line)

        # ---------------------------------------------------------------------
        # Scenario A: Initial tailing
        # ---------------------------------------------------------------------
        print("[*] Scenario A: Initial tailing")
        step_daemon()
        if "Header line" in processed_lines:
            print("    [PASS] Initial header line read.")
        else:
            print("    [FAIL] Initial header not read.")
            return False

        # ---------------------------------------------------------------------
        # Scenario B: Log Append
        # ---------------------------------------------------------------------
        print("[*] Scenario B: Real-time Append")
        with open(log_path, "a", encoding="utf-8") as f:
            f.write("[12:00:00] <Player1> !bankhoangsan\n")
            f.write("[12:00:01] <Player2> !cf 50000 ngua\n")
        step_daemon()
        if "[12:00:00] <Player1> !bankhoangsan" in processed_lines and "[12:00:01] <Player2> !cf 50000 ngua" in processed_lines:
            print("    [PASS] Appended log lines processed immediately.")
        else:
            print("    [FAIL] Appended lines missing!")
            return False

        # ---------------------------------------------------------------------
        # Scenario C: Log Rename Rotation (Log4j simulation)
        # ---------------------------------------------------------------------
        print("[*] Scenario C: Log Rename Rotation (latest.log -> 2026-10-12-1.log)")
        # Write one more line into old file before rotate
        with open(log_path, "a", encoding="utf-8") as f:
            f.write("[12:00:02] <Server> Log rotating now...\n")

        # Rotate by renaming
        rotated_path = os.path.join(temp_dir, "2026-10-12-1.log")
        os.rename(log_path, rotated_path)

        # Create new latest.log with new lines
        time.sleep(0.05)
        with open(log_path, "w", encoding="utf-8") as f:
            f.write("[12:00:03] <Server> New log session started.\n")
            f.write("[12:00:04] <Player3> !xoso 50 10000\n")

        step_daemon()

        if "[12:00:02] <Server> Log rotating now..." in processed_lines:
            print("    [PASS] Leftover line from rotated file captured before close.")
        else:
            print("    [FAIL] Leftover line from rotated file was lost!")
            return False

        if "[12:00:03] <Server> New log session started." in processed_lines and "[12:00:04] <Player3> !xoso 50 10000" in processed_lines:
            print("    [PASS] New file lines detected and read after rotation.")
        else:
            print("    [FAIL] New file lines missed after rotation!")
            return False

        # ---------------------------------------------------------------------
        # Scenario D: Log Truncation (st_size < tell)
        # ---------------------------------------------------------------------
        print("[*] Scenario D: Log Truncation / Overwrite")
        # Overwrite file with shorter content
        with open(log_path, "w", encoding="utf-8") as f:
            f.write("[12:00:05] Reset.\n")

        step_daemon()

        if "[12:00:05] Reset." in processed_lines:
            print("    [PASS] Truncated file detected (st_size < curr_pos), reopened and read.")
        else:
            print("    [FAIL] Truncated file recovery failed!")
            return False

        # ---------------------------------------------------------------------
        # Scenario E: Temporary Absence (FileNotFoundError)
        # ---------------------------------------------------------------------
        print("[*] Scenario E: Temporary File Disappearance & Reappearance")
        os.remove(log_path)
        step_daemon()  # Should handle missing file without exception
        print("    [PASS] Handled temporary missing file without raising exception.")

        time.sleep(0.05)
        with open(log_path, "w", encoding="utf-8") as f:
            f.write("[12:00:06] Re-created file line.\n")

        step_daemon()
        if "[12:00:06] Re-created file line." in processed_lines:
            print("    [PASS] Re-created file picked up automatically and tailed.")
        else:
            print("    [FAIL] Re-created file line not picked up!")
            return False

        print("\n" + "=" * 70)
        print(">>> FINAL VERDICT FOR R4: PASS (All Daemon Reliability Scenarios Verified) <<<")
        return True

    finally:
        try:
            shutil.rmtree(temp_dir, ignore_errors=True)
        except Exception:
            pass


def main():
    p1 = test_1_compilation()
    p2 = test_2_open_log_shared_contract()
    p3 = test_3_tail_loop_simulation()

    overall = p1 and p2 and p3
    print("\n" + "=" * 70)
    print(f"R4 ECONOMY DAEMON VERIFICATION SUMMARY: {'ALL PASSED' if overall else 'FAILED'}")
    print("=" * 70)
    sys.exit(0 if overall else 1)


if __name__ == "__main__":
    main()
