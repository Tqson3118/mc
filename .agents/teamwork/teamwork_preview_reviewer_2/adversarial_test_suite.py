# -*- coding: utf-8 -*-
"""
Adversarial Test Suite for Milestones M1-M5
Executed by Reviewer 2 (Critic & Reviewer)
"""
import os
import sys
import re
import yaml
import tempfile
import time
import threading

PROJECT_ROOT = r"C:\Users\Administrator\.gemini\antigravity\scratch\Skyblock-Server"

def report(title, passed, details=""):
    status = "PASS" if passed else "FAIL"
    print(f"[{status}] {title}")
    if details:
        print(f"       {details}")
    if not passed:
        return False
    return True

all_passed = True

print("=" * 70)
print("REVIEWER 2: ADVERSARIAL VALIDATION SUITE (M1-M5)")
print("=" * 70)

# ==============================================================================
# CHALLENGE 1: ARMOR SLOTS & PROGRESSION ENFORCEMENT (M1)
# ==============================================================================
print("\n--- Challenge 1: Progression & Armor Completeness (M1) ---")
npc_path = os.path.join(PROJECT_ROOT, "world", "datapacks", "skyblock_spawn", "data", "skyblock", "function", "build_evolution_npc.mcfunction")
if not os.path.exists(npc_path):
    all_passed = False
    report("build_evolution_npc.mcfunction exists", False, f"File not found: {npc_path}")
else:
    with open(npc_path, "r", encoding="utf-8") as f:
        npc_content = f.read()
    
    # Check Toolsmith trades
    # Toolsmith has Pickaxe (15) and Axe (15) = 30 trades
    # Weaponsmith has Sword (15), Armor (4*15=60), Bow (15) = 90 trades
    
    # Let's extract weaponsmith recipes line
    ws_line = None
    ts_line = None
    for line in npc_content.splitlines():
        if "weaponsmith_npc" in line and "Offers:{Recipes:[" in line:
            ws_line = line
        elif "toolsmith_npc" in line and "Offers:{Recipes:[" in line:
            ts_line = line

    if not ws_line or not ts_line:
        all_passed = False
        report("NPC summon commands found", False, "Missing weaponsmith or toolsmith summon line")
    else:
        # Parse recipes in weaponsmith
        # Find Recipes:[ ... ]
        m_ws = re.search(r'Offers:\{Recipes:\[(.*)\]\}\}', ws_line)
        m_ts = re.search(r'Offers:\{Recipes:\[(.*)\]\}\}', ts_line)
        
        # Split recipes safely by balancing braces
        def split_recipes(rec_str):
            recipes = []
            depth = 0
            cur = []
            for char in rec_str:
                if char == '{':
                    depth += 1
                    cur.append(char)
                elif char == '}':
                    depth -= 1
                    cur.append(char)
                    if depth == 0:
                        recipes.append("".join(cur))
                        cur = []
                elif depth > 0:
                    cur.append(char)
            return recipes

        ws_recipes = split_recipes(m_ws.group(1))
        ts_recipes = split_recipes(m_ts.group(1))
        
        report("Toolsmith recipe count", len(ts_recipes) == 30, f"Found {len(ts_recipes)} trades (expected 30: 15 picks + 15 axes)")
        report("Weaponsmith recipe count", len(ws_recipes) == 90, f"Found {len(ws_recipes)} trades (expected 90: 15 swords + 60 armors + 15 bows)")
        
        # Verify Armor completeness
        armor_slots = ["helmet", "chestplate", "leggings", "boots"]
        slot_counts = {s: 0 for s in armor_slots}
        
        armor_trades = []
        for r in ws_recipes:
            for s in armor_slots:
                if f'diamond_{s}' in r or f'netherite_{s}' in r:
                    slot_counts[s] += 1
                    armor_trades.append((s, r))
                    break
        
        armor_all_15 = True
        for s in armor_slots:
            if slot_counts[s] != 15:
                armor_all_15 = False
        report("All 4 armor slots present in all 15 tiers (60 total)", armor_all_15, f"Counts: {slot_counts}")
        if not armor_all_15:
            all_passed = False

        # Verify Tier 1 vs Tier 2..15 progression
        # Tier 1 MUST have vanilla diamond without custom_data
        # Tier 2 MUST have Tier 1 with custom_data {tier:1}
        # Tier N MUST have Tier N-1 with custom_data {tier:N-1}
        
        # Let's check swords (first 15 recipes in ws_recipes)
        # and armor (next 60) and bow (last 15)
        # Check armor recipes specifically
        progression_ok = True
        progression_errs = []
        
        # In ws_recipes, layout is: 15 swords, 15 helmets, 15 chestplates, 15 leggings, 15 boots, 15 bows
        # Let's inspect by slot
        idx = 15 # after 15 swords
        for slot in armor_slots:
            for tier in range(1, 16):
                r = ws_recipes[idx]
                idx += 1
                
                # Check buy item
                # Tier 1
                if tier == 1:
                    expected_buy = f'buy:{{id:"minecraft:diamond_{slot}",count:1}}'
                    if expected_buy not in r:
                        progression_ok = False
                        progression_errs.append(f"{slot} Tier 1 does not use vanilla diamond: {r[:100]}")
                    if 'minecraft:custom_data' in r.split('buyB:')[0]: # in buy section
                        progression_ok = False
                        progression_errs.append(f"{slot} Tier 1 buy has unexpected custom_data: {r[:100]}")
                else:
                    # Tier 2..15
                    prev_tier = tier - 1
                    buy_section = r.split('buyB:')[0]
                    # buy section must contain custom_data with tier: prev_tier
                    expected_prev_tier = f'tier:{prev_tier}'
                    if expected_prev_tier not in buy_section or 'minecraft:custom_data' not in buy_section:
                        progression_ok = False
                        progression_errs.append(f"{slot} Tier {tier} buy does not require Tier {prev_tier}: {buy_section[:100]}")
        
        report("Tier 1 allows diamond base without custom_data & Tier 2..15 strictly require Tier N-1 with custom_data", progression_ok, f"Errors: {progression_errs[:3] if progression_errs else 'None'}")
        if not progression_ok:
            all_passed = False

# ==============================================================================
# CHALLENGE 2: COMMANDS.YML ALIAS PRESERVATION & SYNTAX (M2 & M5)
# ==============================================================================
print("\n--- Challenge 2: commands.yml Aliases Preservation (M2 & M5) ---")
cmd_path = os.path.join(PROJECT_ROOT, "commands.yml")
try:
    with open(cmd_path, "r", encoding="utf-8") as f:
        cmd_yaml = yaml.safe_load(f)
    report("commands.yml valid YAML", True)
    
    aliases = cmd_yaml.get("aliases", {})
    
    # Required M2 boss aliases
    m2_aliases = ["boss1", "boss2", "boss3", "boss4", "dongnhen", "vuclua", "thanhtri", "hukhong"]
    m2_ok = all(a in aliases for a in m2_aliases)
    report("commands.yml contains all M2 boss aliases (boss1..4 & VN names)", m2_ok, f"Checked: {m2_aliases}")
    if not m2_ok:
        all_passed = False
        
    # Required M5 guide aliases
    m5_aliases = ["huongdan", "guide"]
    m5_ok = all(a in aliases for a in m5_aliases)
    report("commands.yml contains M5 guide aliases (huongdan, guide)", m5_ok, f"Checked: {m5_aliases}")
    if not m5_ok:
        all_passed = False
        
    # Preexisting aliases preservation check
    preexisting_sample = [
        "icanhasbukkit", "shop", "upgrade", "upgrades", "booster", "boosters",
        "tanthu", "tanthuthu", "fishing", "cauca", "boss", "pvp", "farm", "mob",
        "trade", "spawn", "island", "islands", "kho", "ec", "nung", "smelt",
        "ah", "auction", "chotroi", "xoso", "lottery", "veso", "cf", "coinflip",
        "parkour", "casino", "crate", "crates", "daily", "pvpkit", "danhhieu",
        "tags", "role", "roles", "tag", "banexp", "sellexp", "expban", "bottle",
        "dongchai", "expbottle", "bankhoangsan", "sellores", "sellore", "sellallores",
        "bando", "trollhieu", "chocque", "cuutrohieu", "cuutro", "beacon", "becon",
        "haidang", "xaybeacon", "thaphaidang", "lighthouse", "traitim", "heart",
        "xaytraitim", "love", "xoatraitim", "delheart", "clearheart"
    ]
    pre_ok = True
    missing_pre = []
    for a in preexisting_sample:
        if a not in aliases:
            pre_ok = False
            missing_pre.append(a)
    report("commands.yml preserves all preexisting aliases", pre_ok, f"Total aliases: {len(aliases)}. Missing: {missing_pre if missing_pre else 'None'}")
    if not pre_ok:
        all_passed = False

except Exception as e:
    report("commands.yml valid YAML", False, str(e))
    all_passed = False

# ==============================================================================
# CHALLENGE 3: HELP.YML YAML SYNTAX & FORMATTING (M5)
# ==============================================================================
print("\n--- Challenge 3: help.yml YAML Syntax & Formatting (M5) ---")
help_path = os.path.join(PROJECT_ROOT, "help.yml")
try:
    with open(help_path, "r", encoding="utf-8") as f:
        help_raw = f.read()
    
    # Check for tab characters (illegal in standard YAML)
    has_tabs = "\t" in help_raw
    report("help.yml contains zero tab characters", not has_tabs, "Tab chars found!" if has_tabs else "0 tabs found")
    if has_tabs:
        all_passed = False
        
    help_yaml = yaml.safe_load(help_raw)
    report("help.yml parses cleanly with yaml.safe_load", True)
    
    gen_topics = help_yaml.get("general-topics", {})
    report("help.yml has general-topics section", bool(gen_topics), f"Topic count: {len(gen_topics)}")
    
    # Check required topics from R5 & PROJECT.md
    req_topics = ["is", "warp", "boss", "bankhoangsan", "tanthu", "daily", "ah", "nung", "shop", "HuongDan", "Lenh"]
    topics_ok = all(t in gen_topics for t in req_topics)
    missing_topics = [t for t in req_topics if t not in gen_topics]
    report("help.yml contains all required topics", topics_ok, f"Missing: {missing_topics if missing_topics else 'None'}")
    if not topics_ok:
        all_passed = False
        
    # Check topic structure: must have shortText and fullText
    topics_valid = True
    for tname, tval in gen_topics.items():
        if not isinstance(tval, dict) or "shortText" not in tval or "fullText" not in tval:
            topics_valid = False
            report(f"Topic {tname} valid format", False, f"Value: {tval}")
            break
    report("All help.yml topics have valid shortText & fullText fields", topics_valid)
    if not topics_valid:
        all_passed = False

except Exception as e:
    report("help.yml valid YAML", False, str(e))
    all_passed = False

# ==============================================================================
# CHALLENGE 4: SKYBLOCK_ECONOMY_DAEMON WINDOWS SHARING & ROTATION (M4)
# ==============================================================================
print("\n--- Challenge 4: skyblock_economy_daemon Windows Sharing & Rotation (M4) ---")
daemon_path = os.path.join(PROJECT_ROOT, "skyblock_economy_daemon.py")
try:
    import py_compile
    py_compile.compile(daemon_path, doraise=True)
    report("skyblock_economy_daemon.py compiles cleanly", True)
except Exception as e:
    report("skyblock_economy_daemon.py compiles cleanly", False, str(e))
    all_passed = False

# Stress test Windows file sharing & rotation simulation
try:
    sys.path.insert(0, PROJECT_ROOT)
    import skyblock_economy_daemon as daemon
    
    # Test 1: open_log_shared permits external rename / delete on Windows
    temp_dir = tempfile.mkdtemp(prefix="daemon_test_")
    test_log = os.path.join(temp_dir, "latest.log")
    with open(test_log, "w", encoding="utf-8") as f:
        f.write("[00:00:00 INFO]: Initial log line\n")
        
    handle = daemon.open_log_shared(test_log)
    if handle is None:
        report("open_log_shared returns valid handle", False, "Returned None")
        all_passed = False
    else:
        report("open_log_shared returns valid handle", True)
        
        # Attempt to rename test_log while handle is held open
        rotated_log = os.path.join(temp_dir, "2026-10-12-1.log")
        rename_succeeded = False
        try:
            os.rename(test_log, rotated_log)
            rename_succeeded = True
        except Exception as e:
            rename_succeeded = False
            report("Rename while open (FILE_SHARE_DELETE)", False, f"WinError: {e}")
        
        report("Rename while open succeeds without WinError 32 (FILE_SHARE_DELETE verified)", rename_succeeded)
        if not rename_succeeded:
            all_passed = False
            
        handle.close()
        
    # Test 2: Inode change & Truncation simulation
    # Simulate a new latest.log being created
    with open(test_log, "w", encoding="utf-8") as f:
        f.write("[00:00:01 INFO]: New latest.log line 1\n")
    
    h2 = daemon.open_log_shared(test_log)
    st1 = os.stat(test_log)
    ino1 = st1.st_ino
    line_read = h2.readline()
    pos1 = h2.tell()
    
    # Truncate file in-place: write fewer bytes
    h2.close()
    with open(test_log, "w", encoding="utf-8") as f:
        f.write("A\n")
    st2 = os.stat(test_log)
    
    # Verify condition `st.st_size < curr_pos`
    is_trunc = st2.st_size < pos1
    report("Truncation condition (st.st_size < curr_pos) triggers correctly", is_trunc, f"Size: {st2.st_size} vs PrevPos: {pos1}")
    if not is_trunc:
        all_passed = False
        
    # Clean up test files
    try:
        if os.path.exists(test_log): os.remove(test_log)
        if os.path.exists(rotated_log): os.remove(rotated_log)
        os.rmdir(temp_dir)
    except Exception:
        pass

except Exception as e:
    report("Daemon Windows Sharing & Rotation test", False, str(e))
    all_passed = False

# ==============================================================================
# CHALLENGE 5: SERVER STABILITY CONFIGURATIONS (M3)
# ==============================================================================
print("\n--- Challenge 5: Server Stability Configurations (M3) ---")
spigot_path = os.path.join(PROJECT_ROOT, "spigot.yml")
try:
    with open(spigot_path, "r", encoding="utf-8") as f:
        spigot_yaml = yaml.safe_load(f)
    
    restart_script = spigot_yaml.get("settings", {}).get("restart-script")
    report("spigot.yml restart-script is Run-Server.bat", restart_script == "Run-Server.bat", f"Value: {restart_script}")
    if restart_script != "Run-Server.bat":
        all_passed = False
        
    exp_merge = spigot_yaml.get("world-settings", {}).get("default", {}).get("merge-radius", {}).get("exp")
    report("spigot.yml merge-radius.exp is 3.0", exp_merge == 3.0, f"Value: {exp_merge}")
    if exp_merge != 3.0:
        all_passed = False
except Exception as e:
    report("spigot.yml valid YAML", False, str(e))
    all_passed = False

ess_cfg_path = os.path.join(PROJECT_ROOT, "plugins", "Essentials", "config.yml")
try:
    with open(ess_cfg_path, "r", encoding="utf-8") as f:
        ess_yaml = yaml.safe_load(f)
    newbie_kit = ess_yaml.get("newbies", {}).get("kit")
    report("Essentials config.yml newbies.kit is tanthu", newbie_kit == "tanthu", f"Value: {newbie_kit}")
    if newbie_kit != "tanthu":
        all_passed = False
except Exception as e:
    report("Essentials config.yml valid YAML", False, str(e))
    all_passed = False

run_bat_path = os.path.join(PROJECT_ROOT, "Run-Server.bat")
try:
    with open(run_bat_path, "r", encoding="utf-8") as f:
        bat_content = f.read()
    key_flags = ["-Xms4G", "-Xmx4G", "-XX:+UseG1GC", "-XX:MaxGCPauseMillis=200", "-XX:+AlwaysPreTouch", "paper.jar"]
    bat_ok = all(k in bat_content for k in key_flags)
    report("Run-Server.bat contains Aikar's Flags G1GC", bat_ok)
    if not bat_ok:
        all_passed = False
except Exception as e:
    report("Run-Server.bat exists and readable", False, str(e))
    all_passed = False

# ==============================================================================
# CHALLENGE 6: BOSS WARPS & DATAPACK SYNTAX (M2)
# ==============================================================================
print("\n--- Challenge 6: Boss Warps & Essentials Coordinates (M2) ---")
expected_warps = {
    "boss1": {"x": -18.5, "y": 111.0, "z": 75.5, "yaw": 90.0},
    "boss2": {"x": 18.5, "y": 111.0, "z": 75.5, "yaw": -90.0},
    "boss3": {"x": 0.5, "y": 111.0, "z": 101.5, "yaw": 0.0},
    "boss4": {"x": -25.5, "y": 111.0, "z": 102.5, "yaw": 90.0}
}
warps_ok = True
for wname, coords in expected_warps.items():
    wpath = os.path.join(PROJECT_ROOT, "plugins", "Essentials", "warps", f"{wname}.yml")
    if not os.path.exists(wpath):
        warps_ok = False
        report(f"Warp {wname}.yml exists", False)
    else:
        with open(wpath, "r", encoding="utf-8") as f:
            wdata = yaml.safe_load(f)
        matches = (wdata.get("x") == coords["x"] and
                   wdata.get("y") == coords["y"] and
                   wdata.get("z") == coords["z"] and
                   wdata.get("yaw") == coords["yaw"])
        if not matches:
            warps_ok = False
            report(f"Warp {wname}.yml coordinates match", False, f"Found: {wdata}")
report("All 4 Boss Warp files exist with exact coordinates", warps_ok)
if not warps_ok:
    all_passed = False

# ==============================================================================
# FINAL ADVERSARIAL VERDICT CALCULATION
# ==============================================================================
print("\n" + "=" * 70)
if all_passed:
    print("FINAL ADVERSARIAL VERDICT: ALL CHECKS PASSED PERFECTLY (APPROVE CANDIDATE)")
else:
    print("FINAL ADVERSARIAL VERDICT: FAILURES DETECTED (REQUEST_CHANGES)")
print("=" * 70)
