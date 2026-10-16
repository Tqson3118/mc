# Empirical Challenge Report: R1 Progression & R4 Daemon

**Agent**: Challenger 1 (critic, specialist)  
**Date**: 2026-10-12  
**Target Project**: Paper 1.21.4 Skyblock Server  
**Scope**: R1 (Progression Enforcement) & R4 (Economy Daemon Reliability)

---

## Challenge Summary

**Overall risk assessment**: LOW  
**Verdict**: **APPROVE**

Both Requirement 1 (Progression Enforcement) and Requirement 4 (Economy Daemon Reliability) have been subjected to rigorous adversarial test harnesses and empirical stress simulation on Windows. All 120 equipment upgrade trades enforce strict Tier N-1 component parity, and the daemon tail loop successfully survives concurrent Windows file locking, Log4j rename rotation, truncation, and transient file absence.

---

## Challenges & Stress Hypotheses

### Challenge 1 (R1 - Trade Skipping / Vanilla Bypass)
- **Assumption challenged**: Players cannot skip tiers or bypass progression by trading vanilla diamonds/netherite directly for high-tier gear (T2..T15).
- **Attack scenario**: A player brings a vanilla Netherite Pickaxe or vanilla diamond gear into a Tier 10 Villager trade to acquire high-tier gear without grinding lower tiers.
- **Blast radius**: Complete collapse of RPG gear economy; endgame gear acquired immediately with vanilla resources.
- **Empirical Test Result**:
  - Test Harness: `tests/test_r1_progression.py`
  - Result: **PASS**. In `world/datapacks/skyblock_spawn/data/skyblock/function/build_evolution_npc.mcfunction`, 100% of trades from Tier 2 to Tier 15 across all 8 equipment categories (Pickaxe, Axe, Sword, Helmet, Chestplate, Leggings, Boots, Bow) demand an exact Tier N-1 item with matching Data Components:
    - Item ID matches prior tier output
    - `minecraft:custom_data` requires exact `tier: N-1` and capability flags (e.g. `explosive_mining: 1b`, `ancient_lifesteal: 1b`)
    - `minecraft:custom_name`, `minecraft:lore`, `minecraft:enchantments`, and `minecraft:unbreakable` match precisely.
  - Vanilla diamond items are accepted **only** at Tier 1 (`buy:{id:"minecraft:diamond_*",count:1}` without custom components).
  - Armor 4-slot coverage is complete (Helmet 15/15, Chestplate 15/15, Leggings 15/15, Boots 15/15).

### Challenge 2 (R4 - Windows File Locking / WinError 32 on Rotation)
- **Assumption challenged**: Standard file operations on Windows allow Log4j to rotate and rename `logs/latest.log` while the daemon holds the file open.
- **Attack scenario**: When Log4j triggers rollover (`latest.log` -> `latest.log.1.gz`), Windows NTFS file locking prevents file rename if the tail reader holds a handle without `FILE_SHARE_DELETE`, causing Paper server crash or Log4j lockup (`WinError 32: The process cannot access the file because it is being used by another process`).
- **Blast radius**: Server logging failure, daemon disconnection, or unhandled file handle exceptions crashing the economy daemon.
- **Empirical Test Result**:
  - Test Harness: `tests/test_r4_daemon.py` (Test 2)
  - Result: **PASS**. `open_log_shared` utilizes `ctypes.windll.kernel32.CreateFileW` with flags `FILE_SHARE_READ (1) | FILE_SHARE_WRITE (2) | FILE_SHARE_DELETE (4)`.
  - Empirically verified: concurrent processes can append to the file, and concurrent processes can rename the open file without error.

### Challenge 3 (R4 - Tail Loop Desynchronization on Rotation & Truncation)
- **Assumption challenged**: When log rotation or truncation occurs, the tail loop detects the change, flushes residual lines, reopens the new file at position 0, and resumes listening without dropping commands or hanging.
- **Attack scenario**:
  1. High log traffic during rotation causing lines written immediately before rename to be skipped.
  2. Server restart truncating `latest.log` causing `file.tell()` to exceed `file.size()`, causing the reader to stall indefinitely at EOF.
  3. Brief milliseconds between file unlinking and recreation causing `FileNotFoundError`.
- **Blast radius**: Chat economy commands (`/bankhoangsan`, `/cf`, `/xoso`, `/banexp`) silently ignored, player loss of currency.
- **Empirical Test Result**:
  - Test Harness: `tests/test_r4_daemon.py` (Test 3)
  - Result: **PASS**.
    - Residual line drain before handle close verified.
    - Detection of rotation via `st.st_ino != current_ino` verified.
    - Detection of truncation via `st.st_size < curr_pos` verified.
    - Transient `FileNotFoundError` safely caught and recovered upon file recreation.

---

## Stress Test Results

| Test ID | Test Scenario | Expected Behavior | Actual Behavior | Result |
|---|---|---|---|---|
| **R1-01** | Datapack syntax & bracket balance (`verify_syntax.py`) | 0 syntax/bracket/quote mismatches | 5/5 files checked, 0 errors | **PASS** |
| **R1-02** | Generator execution (`generate_all.py`) | Executes cleanly with code 0, regenerates mcfunction | 5 files generated cleanly, code 0 | **PASS** |
| **R1-03** | Tier 1 Vanilla Input Acceptance | Requires vanilla diamond gear / bow, count=1, no components | 8/8 categories verified | **PASS** |
| **R1-04** | Tier 2..15 Component Match (Pickaxe) | Exact Tier N-1 components in `buy` slot | 14/14 tiers verified | **PASS** |
| **R1-05** | Tier 2..15 Component Match (Axe) | Exact Tier N-1 components in `buy` slot | 14/14 tiers verified | **PASS** |
| **R1-06** | Tier 2..15 Component Match (Sword) | Exact Tier N-1 components in `buy` slot | 14/14 tiers verified | **PASS** |
| **R1-07** | Tier 2..15 Component Match (Helmet) | Exact Tier N-1 components in `buy` slot | 14/14 tiers verified | **PASS** |
| **R1-08** | Tier 2..15 Component Match (Chestplate) | Exact Tier N-1 components in `buy` slot | 14/14 tiers verified | **PASS** |
| **R1-09** | Tier 2..15 Component Match (Leggings) | Exact Tier N-1 components in `buy` slot | 14/14 tiers verified | **PASS** |
| **R1-10** | Tier 2..15 Component Match (Boots) | Exact Tier N-1 components in `buy` slot | 14/14 tiers verified | **PASS** |
| **R1-11** | Tier 2..15 Component Match (Bow) | Exact Tier N-1 components in `buy` slot | 14/14 tiers verified | **PASS** |
| **R1-12** | Armor 4-Slot Completeness (15 Tiers) | All 4 armor slots contain 15 tiers (60 trades) | 60/60 trades present and enforced | **PASS** |
| **R4-01** | Python Daemon Compilation | `py_compile` succeeds with exit code 0 | Exit code 0, 0 syntax/runtime compile errors | **PASS** |
| **R4-02** | Windows Shared Handle (`CreateFileW`) | File opened with `FILE_SHARE_READ|WRITE|DELETE` | Valid Python text I/O handle returned | **PASS** |
| **R4-03** | Concurrent Append on Active Handle | External process can write to log while tailed | Concurrent writes read immediately | **PASS** |
| **R4-04** | Concurrent Rename on Active Handle | External process can rename file while open (Log4j rotation) | Rename succeeds without WinError 32 | **PASS** |
| **R4-05** | Leftover Drain on Rotated Handle | Lines written prior to rotation are drained before close | Rotated buffer drained completely | **PASS** |
| **R4-06** | Inode Change Detection | Detects new `latest.log` via `st_ino` difference | New file opened at offset 0, lines read | **PASS** |
| **R4-07** | File Truncation Recovery | Detects `st_size < curr_pos`, resets pointer | Reopened at offset 0, new content read | **PASS** |
| **R4-08** | Transient Disappearance Recovery | Handles `FileNotFoundError` during unlinking/recreation | No crash; resumes when file appears | **PASS** |

---

## Unchallenged Areas

- **In-game Client Interaction**: Verification was executed empirically via parser analysis, file system simulations, Win32 API contracts, and Python harnesses. Live client gameplay testing with connected players was not performed as Paper server is not actively booted in this preview gate.
- **R2, R3, R5 Scope**: Handled by Challenger 2 per task partition.
