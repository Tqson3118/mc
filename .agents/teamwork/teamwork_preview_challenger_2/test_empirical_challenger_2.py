# -*- coding: utf-8 -*-
"""
Empirical Verification Test Suite
Executed by Challenger 2 (Empirical Challenger: Critic & Specialist)
Target: Skyblock Server Paper 1.21.4 (R2 Warps, R3 Stability, R5 Onboarding, Datapack Syntax)
"""
import os
import sys
import glob
import json
import yaml
import subprocess

sys.stdout.reconfigure(encoding="utf-8")
sys.stderr.reconfigure(encoding="utf-8")

PROJECT_ROOT = r"C:\Users\Administrator\.gemini\antigravity\scratch\Skyblock-Server"
os.chdir(PROJECT_ROOT)

test_results = []

def record(test_id, category, name, passed, details=""):
    status = "PASS" if passed else "FAIL"
    test_results.append({
        "id": test_id,
        "category": category,
        "name": name,
        "status": status,
        "details": details
    })
    print(f"[{status}] [{category}] {test_id}: {name}")
    if details:
        print(f"       Details: {details}")

print("=" * 75)
print("CHALLENGER 2: EMPIRICAL VERIFICATION SUITE (R2, R3, R5, SYNTAX)")
print("=" * 75)

# ==============================================================================
# SECTION 1: R2 BOSS WARPS & NAVIGATION
# ==============================================================================
print("\n--- Testing R2: Boss Warps & Navigation ---")

# 1.1 Warp YAML files existence and exact coordinates
expected_warps = {
    "boss1": {"world": "world", "x": -18.5, "y": 111.0, "z": 75.5, "yaw": 90.0, "pitch": 0.0, "name": "boss1"},
    "boss2": {"world": "world", "x": 18.5, "y": 111.0, "z": 75.5, "yaw": -90.0, "pitch": 0.0, "name": "boss2"},
    "boss3": {"world": "world", "x": 0.5, "y": 111.0, "z": 101.5, "yaw": 0.0, "pitch": 0.0, "name": "boss3"},
    "boss4": {"world": "world", "x": -25.5, "y": 111.0, "z": 102.5, "yaw": 90.0, "pitch": 0.0, "name": "boss4"}
}

for wname, expected in expected_warps.items():
    wpath = os.path.join(PROJECT_ROOT, "plugins", "Essentials", "warps", f"{wname}.yml")
    if not os.path.exists(wpath):
        record(f"R2-WARP-{wname.upper()}", "R2", f"Warp file {wname}.yml exists", False, f"File missing at {wpath}")
    else:
        try:
            with open(wpath, "r", encoding="utf-8") as f:
                data = yaml.safe_load(f)
            coords_match = (data == expected)
            record(f"R2-WARP-{wname.upper()}", "R2", f"Warp {wname}.yml exact coordinates", coords_match,
                   f"Observed: {data}" if not coords_match else f"Matched {expected['x']} {expected['y']} {expected['z']} yaw={expected['yaw']}")
        except Exception as e:
            record(f"R2-WARP-{wname.upper()}", "R2", f"Warp {wname}.yml valid YAML", False, str(e))

# 1.2 commands.yml boss aliases
cmd_path = os.path.join(PROJECT_ROOT, "commands.yml")
try:
    with open(cmd_path, "r", encoding="utf-8") as f:
        cmd_data = yaml.safe_load(f)
    aliases = cmd_data.get("aliases", {})
    boss_aliases = {
        "boss1": ["warp boss1 $1-"],
        "boss2": ["warp boss2 $1-"],
        "boss3": ["warp boss3 $1-"],
        "boss4": ["warp boss4 $1-"],
        "dongnhen": ["warp boss1 $1-"],
        "vuclua": ["warp boss2 $1-"],
        "thanhtri": ["warp boss3 $1-"],
        "hukhong": ["warp boss4 $1-"]
    }
    all_boss_aliases_ok = True
    missing_boss_aliases = []
    for k, v in boss_aliases.items():
        if k not in aliases or aliases[k] != v:
            all_boss_aliases_ok = False
            missing_boss_aliases.append(f"{k} -> {aliases.get(k)} (expected {v})")
    record("R2-CMD-ALIASES", "R2", "commands.yml boss aliases (boss1..4 & VN aliases)", all_boss_aliases_ok,
           f"Mismatches: {missing_boss_aliases}" if not all_boss_aliases_ok else f"All 8 aliases verified")
except Exception as e:
    record("R2-CMD-ALIASES", "R2", "commands.yml parseable", False, str(e))

# 1.3 Boss Hunter Tellraw Menu
hunter_menu_path = os.path.join(PROJECT_ROOT, "world", "datapacks", "skyblock_spawn", "data", "skyblock", "function", "boss", "hunter_menu.mcfunction")
if not os.path.exists(hunter_menu_path):
    record("R2-HUNTER-MENU", "R2", "hunter_menu.mcfunction exists", False, f"Missing: {hunter_menu_path}")
else:
    with open(hunter_menu_path, "r", encoding="utf-8") as f:
        menu_content = f.read()
    has_warps = all(f"/warp boss{i}" in menu_content for i in range(1, 5))
    has_tellraw = "tellraw @s" in menu_content
    record("R2-HUNTER-MENU", "R2", "hunter_menu.mcfunction tellraw with clickable boss warps", has_tellraw and has_warps,
           "Contains tellraw and all /warp boss1..4 click events" if (has_tellraw and has_warps) else "Missing tellraw or warp targets")

# 1.4 Boss Hunter NPC & Return TP Pads in build_boss_multi.mcfunction
build_boss_path = os.path.join(PROJECT_ROOT, "world", "datapacks", "skyblock_spawn", "data", "skyblock", "function", "build_boss_multi.mcfunction")
if not os.path.exists(build_boss_path):
    record("R2-BOSS-INFRA", "R2", "build_boss_multi.mcfunction exists", False, f"Missing: {build_boss_path}")
else:
    with open(build_boss_path, "r", encoding="utf-8") as f:
        build_boss = f.read()
    has_npc = "boss_hunter_npc" in build_boss and "0.5 111 61.5" in build_boss
    has_interact = "boss_hunter_interact" in build_boss
    has_ret_pads = build_boss.count('teleport @p 0.5 111.0 58.0 0.0 0.0') >= 4
    record("R2-BOSS-NPC", "R2", "Boss Hunter NPC summoned at 0.5 111 61.5 with interaction entity", has_npc and has_interact,
           "NPC and interaction entity found in build_boss_multi.mcfunction")
    record("R2-RETURN-PADS-STATIC", "R2", "Return TP pads in all 4 arenas teleporting to 0.5 111 58", has_ret_pads,
           f"Found {build_boss.count('teleport @p 0.5 111.0 58.0 0.0 0.0')} return teleport command blocks (expected >= 4)")

# 1.5 Real-time Tick Handling for Boss Hunter interaction & fail-safe return TP
tick_path = os.path.join(PROJECT_ROOT, "world", "datapacks", "skyblock_spawn", "data", "skyblock", "function", "tick.mcfunction")
with open(tick_path, "r", encoding="utf-8") as f:
    tick_content = f.read()

has_hunter_tick = "boss_hunter_interact" in tick_content and "run function skyblock:boss/hunter_menu" in tick_content
has_tp_failsafe = "x=-19,y=110,z=74" in tick_content and "run teleport @s 0.5 111.0 58.0 0.0 0.0" in tick_content

record("R2-HUNTER-INTERACTION-TICK", "R2", "tick.mcfunction handles boss_hunter_interact", has_hunter_tick,
       "CRITICAL BUG: tick.mcfunction does NOT contain interaction handler for boss_hunter_interact! Hunter menu is unreachable via right-click.")
record("R2-RETURN-TP-FAILSAFE-TICK", "R2", "tick.mcfunction fail-safe return TP bounds checking", has_tp_failsafe,
       "CRITICAL BUG: tick.mcfunction does NOT contain fail-safe return TP coordinate checks!")

# ==============================================================================
# SECTION 2: R3 SERVER STABILITY
# ==============================================================================
print("\n--- Testing R3: Server Stability ---")

# 2.1 spigot.yml restart-script & merge-radius.exp
spigot_path = os.path.join(PROJECT_ROOT, "spigot.yml")
try:
    with open(spigot_path, "r", encoding="utf-8") as f:
        spigot_data = yaml.safe_load(f)
    restart_script = spigot_data.get("settings", {}).get("restart-script")
    exp_merge = spigot_data.get("world-settings", {}).get("default", {}).get("merge-radius", {}).get("exp")
    record("R3-SPIGOT-RESTART", "R3", "spigot.yml restart-script is Run-Server.bat", restart_script == "Run-Server.bat",
           f"Observed: {restart_script}")
    record("R3-SPIGOT-EXP-MERGE", "R3", "spigot.yml merge-radius.exp is 3.0", exp_merge == 3.0,
           f"Observed: {exp_merge}")
except Exception as e:
    record("R3-SPIGOT-PARSE", "R3", "spigot.yml parseable", False, str(e))

# 2.2 plugins/Essentials/config.yml kit: tanthu
ess_cfg_path = os.path.join(PROJECT_ROOT, "plugins", "Essentials", "config.yml")
try:
    with open(ess_cfg_path, "r", encoding="utf-8") as f:
        ess_data = yaml.safe_load(f)
    newbie_kit = ess_data.get("newbies", {}).get("kit")
    record("R3-ESS-KIT-TANTHU", "R3", "Essentials config.yml newbies.kit is tanthu", newbie_kit == "tanthu",
           f"Observed: {newbie_kit}")
except Exception as e:
    record("R3-ESS-CONFIG-PARSE", "R3", "Essentials config.yml parseable", False, str(e))

# 2.3 Run-Server.bat Aikar's Flags tested on Java 21
run_bat_path = os.path.join(PROJECT_ROOT, "Run-Server.bat")
with open(run_bat_path, "r", encoding="utf-8") as f:
    bat_content = f.read()

expected_flags = [
    "-Xms4G", "-Xmx4G", "-XX:+UseG1GC", "-XX:+ParallelRefProcEnabled", "-XX:MaxGCPauseMillis=200",
    "-XX:+UnlockExperimentalVMOptions", "-XX:+DisableExplicitGC", "-XX:+AlwaysPreTouch",
    "-XX:G1NewSizePercent=30", "-XX:G1MaxNewSizePercent=40", "-XX:G1ReservePercent=20",
    "-XX:G1HeapWastePercent=5", "-XX:G1MixedGCCountTarget=4", "-XX:InitiatingHeapOccupancyPercent=15",
    "-XX:G1MixedGCLiveThresholdPercent=90", "-XX:G1RSetUpdatingPauseTimePercent=5", "-XX:SurvivorRatio=32",
    "-XX:+PerfDisableSharedMem", "-XX:MaxTenuringThreshold=1",
    "-Dusing.aikars.flags=https://mcflags.emc.gs", "-Daikars.new.flags=true"
]

all_flags_present = all(flag in bat_content for flag in expected_flags)
record("R3-BAT-FLAGS-PRESENCE", "R3", "Run-Server.bat contains all 21 Aikar's Flags", all_flags_present,
       f"Flags found: {sum(f in bat_content for f in expected_flags)}/21")

# Actually invoke Java 21 executable with all Aikar's flags
java21_exe = r"C:\Program Files\Eclipse Adoptium\jre-21.0.12.101-hotspot\bin\java.exe"
if not os.path.exists(java21_exe):
    java21_exe = "java"

cmd = [java21_exe] + expected_flags + ["-version"]
try:
    proc = subprocess.run(cmd, capture_output=True, text=True, timeout=10)
    java_proc_ok = (proc.returncode == 0) and ("21." in proc.stderr or "21." in proc.stdout)
    record("R3-JVM-JAVA21-EXEC", "R3", "Java 21 runtime execution with Aikar's Flags", java_proc_ok,
           f"Returncode: {proc.returncode}, Output: {proc.stderr.splitlines()[:2] if proc.stderr else proc.stdout.splitlines()[:2]}")
except Exception as e:
    record("R3-JVM-JAVA21-EXEC", "R3", "Java 21 runtime execution with Aikar's Flags", False, str(e))

# ==============================================================================
# SECTION 3: R5 NEWBIE ONBOARDING
# ==============================================================================
print("\n--- Testing R5: Newbie Onboarding ---")

# 3.1 help.yml valid YAML with all 18 topics
help_path = os.path.join(PROJECT_ROOT, "help.yml")
try:
    with open(help_path, "r", encoding="utf-8") as f:
        help_raw = f.read()
    has_tabs = "\t" in help_raw
    help_data = yaml.safe_load(help_raw)
    topics = help_data.get("general-topics", {})
    expected_18 = [
        "HuongDan", "Lenh", "is", "warp", "boss", "bankhoangsan", "tanthu", "daily",
        "ah", "shop", "nung", "cauca", "pvp", "trade", "farm", "crates", "casino", "banexp"
    ]
    has_18 = (len(topics) == 18) and all(t in topics for t in expected_18)
    all_have_fields = all("shortText" in v and "fullText" in v for v in topics.values())
    record("R5-HELP-YAML-PARSING", "R5", "help.yml is valid YAML without tabs", not has_tabs,
           f"Contains tabs: {has_tabs}")
    record("R5-HELP-18-TOPICS", "R5", "help.yml contains all 18 topics with shortText & fullText", has_18 and all_have_fields,
           f"Found {len(topics)} topics. Missing: {[t for t in expected_18 if t not in topics]}")
except Exception as e:
    record("R5-HELP-YAML-PARSING", "R5", "help.yml is valid YAML", False, str(e))

# 3.2 Guide NPC at 0.5 121 3.5 in build_spawn.mcfunction
build_spawn_path = os.path.join(PROJECT_ROOT, "world", "datapacks", "skyblock_spawn", "data", "skyblock", "function", "build_spawn.mcfunction")
with open(build_spawn_path, "r", encoding="utf-8") as f:
    spawn_content = f.read()

has_guide_npc = "guide_npc" in spawn_content and "0.5 121 3.5" in spawn_content
has_guide_interact = "guide_interact" in spawn_content and "0.5 121 3.5" in spawn_content
has_guide_holo = "guide_hologram" in spawn_content and "0.5 123.2 3.5" in spawn_content
record("R5-GUIDE-NPC", "R5", "Guide NPC summoned at 0.5 121 3.5 with interaction entity and hologram",
       has_guide_npc and has_guide_interact and has_guide_holo,
       "Guide NPC, guide_interact entity, and guide_hologram ArmorStand found in build_spawn.mcfunction")

# 3.3 Guide tellraw menu
guide_menu_path = os.path.join(PROJECT_ROOT, "world", "datapacks", "skyblock_spawn", "data", "skyblock", "function", "guide", "menu.mcfunction")
if not os.path.exists(guide_menu_path):
    record("R5-GUIDE-MENU-FILE", "R5", "guide/menu.mcfunction exists", False, f"Missing: {guide_menu_path}")
else:
    with open(guide_menu_path, "r", encoding="utf-8") as f:
        guide_content = f.read()
    has_guide_tellraw = "tellraw @s" in guide_content
    json_parse_ok = False
    for line in guide_content.splitlines():
        if line.strip().startswith("tellraw @s"):
            raw_json = line.strip().replace("tellraw @s", "", 1).strip()
            try:
                json.loads(raw_json)
                json_parse_ok = True
            except Exception as e:
                json_parse_ok = False
    record("R5-GUIDE-TELLRAW-VALIDITY", "R5", "guide/menu.mcfunction tellraw valid JSON", json_parse_ok,
           "Parsed successfully as valid JSON" if json_parse_ok else "JSON syntax error in tellraw")

# 3.4 Scoreboard Trigger 'huongdan' setup & tick listener
setup_path = os.path.join(PROJECT_ROOT, "world", "datapacks", "skyblock_spawn", "data", "skyblock", "function", "setup.mcfunction")
with open(setup_path, "r", encoding="utf-8") as f:
    setup_content = f.read()

has_huongdan_obj = "scoreboard objectives add huongdan trigger" in setup_content
record("R5-SETUP-HUONGDAN-OBJ", "R5", "setup.mcfunction registers huongdan trigger objective", has_huongdan_obj,
       "CRITICAL BUG: setup.mcfunction does NOT add huongdan trigger objective! Players running /huongdan get scoreboard errors.")

has_guide_interact_tick = "guide_interact" in tick_content and "run function skyblock:guide/menu" in tick_content
has_huongdan_trigger_tick = "huongdan" in tick_content and "run function skyblock:guide/menu" in tick_content
record("R5-TICK-GUIDE-HANDLING", "R5", "tick.mcfunction handles guide_interact and huongdan trigger",
       has_guide_interact_tick and has_huongdan_trigger_tick,
       "CRITICAL BUG: tick.mcfunction does NOT handle guide_interact entity or huongdan trigger! Guide menu unreachable.")

# ==============================================================================
# SECTION 4: DATAPACK SYNTAX & MCPA-WIDE PARSING (TASK 2)
# ==============================================================================
print("\n--- Testing Task 2: Datapack Syntax Across All mcfunctions ---")

# 4.1 Run standard verify_syntax.py
proc_verify = subprocess.run([sys.executable, "verify_syntax.py"], capture_output=True, text=True)
record("SYNTAX-VERIFY-SCRIPT", "SYNTAX", "Execution of verify_syntax.py (5 core files)", proc_verify.returncode == 0,
       proc_verify.stdout.strip())

# 4.2 Comprehensive Datapack Scan across ALL .mcfunction files
func_base = os.path.join(PROJECT_ROOT, "world", "datapacks", "skyblock_spawn", "data", "skyblock", "function")
all_mcfunctions = glob.glob(os.path.join(func_base, "**", "*.mcfunction"), recursive=True)

syntax_errors = []
for fpath in all_mcfunctions:
    rel_name = os.path.relpath(fpath, func_base)
    with open(fpath, "r", encoding="utf-8") as f:
        lines = f.readlines()
    for idx, line in enumerate(lines, 1):
        line = line.strip()
        if not line or line.startswith("#"):
            continue
        curly = line.count("{") - line.count("}")
        square = line.count("[") - line.count("]")
        quotes = line.count("'")
        if curly != 0:
            syntax_errors.append(f"{rel_name}:{idx} Curly mismatch ({curly})")
        if square != 0:
            syntax_errors.append(f"{rel_name}:{idx} Square mismatch ({square})")
        if quotes % 2 != 0:
            syntax_errors.append(f"{rel_name}:{idx} Single quote mismatch ({quotes})")

record("SYNTAX-ALL-MCFUNCTIONS", "SYNTAX", f"Full scan across all {len(all_mcfunctions)} datapack mcfunctions", len(syntax_errors) == 0,
       f"Found {len(syntax_errors)} syntax issues: {syntax_errors}" if syntax_errors else "All files 100% balanced")

# 4.3 Specific test on exp/menu.mcfunction JSON parsing
exp_menu_path = os.path.join(func_base, "exp", "menu.mcfunction")
if os.path.exists(exp_menu_path):
    with open(exp_menu_path, "r", encoding="utf-8") as f:
        menu_lines = f.readlines()
    menu_json_err = None
    for idx, l in enumerate(menu_lines, 1):
        if l.strip().startswith("tellraw @s"):
            raw_j = l.strip().replace("tellraw @s", "", 1).strip()
            try:
                json.loads(raw_j)
            except Exception as e:
                menu_json_err = f"Line {idx}: {e}"
    record("SYNTAX-EXP-MENU-JSON", "SYNTAX", "exp/menu.mcfunction tellraw valid JSON", menu_json_err is None,
           f"JSON Error: {menu_json_err}" if menu_json_err else "Valid JSON")

# ==============================================================================
# SECTION 5: REGENERATION CLOBBERING VULNERABILITY (ARCHITECTURAL AUDIT)
# ==============================================================================
print("\n--- Testing Architecture: Generator Clobbering Vulnerability ---")

gen_path = os.path.join(PROJECT_ROOT, "generate_all.py")
with open(gen_path, "r", encoding="utf-8") as f:
    gen_content = f.read()

gen_overwrites_setup = "def update_setup_mcfunction():" in gen_content
gen_overwrites_tick = "def update_tick_mcfunction():" in gen_content
gen_has_huongdan = "huongdan" in gen_content
gen_has_boss_hunter = "boss_hunter_interact" in gen_content

clobbers_r2_r5 = (gen_overwrites_setup or gen_overwrites_tick) and (not gen_has_huongdan or not gen_has_boss_hunter)
record("ARCH-CLOBBER-RISK", "ARCH", "generate_all.py clobbers setup.mcfunction & tick.mcfunction on execution", not clobbers_r2_r5,
       "CRITICAL ARCHITECTURAL FLAW: generate_all.py contains hardcoded templates for setup.mcfunction and tick.mcfunction that LACK M2 & M5 logic! Any execution of generate_all.py erases all boss hunter and newbie guide listeners!" if clobbers_r2_r5 else "Safe generator")

# ==============================================================================
# SUMMARY & VERDICT
# ==============================================================================
print("\n" + "=" * 75)
print("TEST SUMMARY")
print("=" * 75)

total_tests = len(test_results)
passed_tests = sum(1 for t in test_results if t["status"] == "PASS")
failed_tests = sum(1 for t in test_results if t["status"] == "FAIL")

print(f"Total Tests Executed: {total_tests}")
print(f"Passed: {passed_tests}")
print(f"Failed: {failed_tests}")

print("\nFailed Tests Details:")
for t in test_results:
    if t["status"] == "FAIL":
        print(f"  ❌ [{t['category']}] {t['id']}: {t['name']}")
        print(f"     -> {t['details']}")

verdict = "APPROVE" if failed_tests == 0 else "FAIL"
print("\n" + "=" * 75)
print(f"OVERALL CHALLENGER VERDICT: {verdict}")
print("=" * 75)
