# -*- coding: utf-8 -*-
"""
Independent Forensic Verification Script - Auditor 2 (Milestone M6 / Iteration 2)
Author: Forensic Auditor (teamwork_preview_auditor_2)
"""

import os
import sys
import json
import re
import yaml
import py_compile
import subprocess
import time

sys.stdout.reconfigure(encoding='utf-8')

ROOT_DIR = r"C:\Users\Administrator\.gemini\antigravity\scratch\Skyblock-Server"
DATAPACK_DIR = os.path.join(ROOT_DIR, "world", "datapacks", "skyblock_spawn", "data", "skyblock", "function")

# -----------------------------------------------------------------------------
# Robust SNBT Parser for Minecraft 1.21.4 Trade Data
# -----------------------------------------------------------------------------
class SnbtParser:
    def __init__(self, text):
        self.text = text
        self.pos = 0
        self.length = len(text)

    def skip_whitespace(self):
        while self.pos < self.length and self.text[self.pos] in " \t\r\n":
            self.pos += 1

    def parse_value(self):
        self.skip_whitespace()
        if self.pos >= self.length:
            return None
        c = self.text[self.pos]
        if c == "{":
            return self.parse_compound()
        elif c == "[":
            return self.parse_list()
        elif c in ('"', "'"):
            return self.parse_quoted_string()
        else:
            return self.parse_unquoted_literal()

    def parse_quoted_string(self):
        quote_char = self.text[self.pos]
        self.pos += 1
        chars = []
        while self.pos < self.length:
            c = self.text[self.pos]
            if c == "\\":
                self.pos += 1
                if self.pos < self.length:
                    chars.append(self.text[self.pos])
                    self.pos += 1
                continue
            elif c == quote_char:
                self.pos += 1
                break
            else:
                chars.append(c)
                self.pos += 1
        return "".join(chars)

    def parse_unquoted_literal(self):
        start = self.pos
        while self.pos < self.length and self.text[self.pos] not in " \t\r\n:,{}[]":
            self.pos += 1
        return self.text[start:self.pos]

    def parse_compound(self):
        self.pos += 1
        res = {}
        while True:
            self.skip_whitespace()
            if self.pos >= self.length or self.text[self.pos] == "}":
                if self.pos < self.length:
                    self.pos += 1
                break
            key = self.parse_key()
            self.skip_whitespace()
            if self.pos < self.length and self.text[self.pos] == ":":
                self.pos += 1
            val = self.parse_value()
            res[key] = val
            self.skip_whitespace()
            if self.pos < self.length and self.text[self.pos] == ",":
                self.pos += 1
            elif self.pos < self.length and self.text[self.pos] == "}":
                self.pos += 1
                break
        return res

    def parse_key(self):
        self.skip_whitespace()
        c = self.text[self.pos]
        if c in ('"', "'"):
            return self.parse_quoted_string()
        start = self.pos
        while self.pos < self.length and self.text[self.pos] not in " \t\r\n:":
            self.pos += 1
        return self.text[start:self.pos]

    def parse_list(self):
        self.pos += 1
        res = []
        while True:
            self.skip_whitespace()
            if self.pos >= self.length or self.text[self.pos] == "]":
                if self.pos < self.length:
                    self.pos += 1
                break
            val = self.parse_value()
            res.append(val)
            self.skip_whitespace()
            if self.pos < self.length and self.text[self.pos] == ",":
                self.pos += 1
        return res

report = []

def log(msg):
    print(msg)
    report.append(msg)

def ok(msg):
    log(f"  [PASS] {msg}")

log("=" * 80)
log("INDEPENDENT FORENSIC AUDIT SUITE - AUDITOR 2")
log("=" * 80)

# ------------------------------------------------------------------------------
# 1. FORENSIC CHECK R1: PROGRESSION & DATA COMPONENTS INTEGRITY
# ------------------------------------------------------------------------------
log("\n--- [AUDIT R1] Progression Enforcement & Data Components Verification ---")
build_npc_path = os.path.join(DATAPACK_DIR, "build_evolution_npc.mcfunction")
assert os.path.exists(build_npc_path), "build_evolution_npc.mcfunction does not exist!"

with open(build_npc_path, "r", encoding="utf-8") as f:
    npc_lines = f.readlines()

summon_lines = [l.strip() for l in npc_lines if l.strip().startswith("summon villager")]
log(f"Found {len(summon_lines)} summon villager commands.")
assert len(summon_lines) == 3, f"Expected 3 villager summon commands, found {len(summon_lines)}"

def parse_villager_recipes(line):
    idx = line.find("{")
    snbt_str = line[idx:]
    parsed = SnbtParser(snbt_str).parse_value()
    return parsed.get("Offers", {}).get("Recipes", [])

alch_recipes = parse_villager_recipes(summon_lines[0])
tool_recipes = parse_villager_recipes(summon_lines[1])
combat_recipes = parse_villager_recipes(summon_lines[2])

log(f"Alchemist recipes: {len(alch_recipes)} (expected 10)")
log(f"Toolsmith recipes: {len(tool_recipes)} (expected 30: 15 picks + 15 axes)")
log(f"Combat recipes: {len(combat_recipes)} (expected 90: 15 swords + 60 armor + 15 bows)")

assert len(alch_recipes) == 10, f"Expected 10 alchemist recipes, got {len(alch_recipes)}"
assert len(tool_recipes) == 30, f"Expected 30 tool recipes, got {len(tool_recipes)}"
assert len(combat_recipes) == 90, f"Expected 90 combat recipes, got {len(combat_recipes)}"
ok("Trade offer counts strictly match 10 Alchemist + 30 Tools + 90 Combat = 130 total trades.")

def verify_tier_progression(recipes, category_name, count=15, offset=0):
    for i in range(count):
        tier = i + 1
        r = recipes[offset + i]
        sell = r.get("sell", {})
        sell_comp = sell.get("components", {})
        sell_custom_data = sell_comp.get("minecraft:custom_data", {})
        assert sell_custom_data.get("tier") == str(tier) or sell_custom_data.get("tier") == tier, \
            f"{category_name} Tier {tier}: sell missing tier {tier}"
        assert "minecraft:custom_name" in sell_comp, f"{category_name} Tier {tier}: sell missing custom_name"
        assert "minecraft:lore" in sell_comp, f"{category_name} Tier {tier}: sell missing lore"
        assert "minecraft:enchantments" in sell_comp, f"{category_name} Tier {tier}: sell missing enchantments"

        buy = r.get("buy", {})
        buy_comp = buy.get("components", {})
        buy_custom_data = buy_comp.get("minecraft:custom_data", {})

        if tier == 1:
            # Tier 1 must require vanilla base without ancient custom_data
            assert "ancient_pickaxe" not in buy_custom_data
            assert "ancient_axe" not in buy_custom_data
            assert "ancient_sword" not in buy_custom_data
            assert "ancient_armor" not in buy_custom_data
            assert "ancient_bow" not in buy_custom_data
        else:
            prev_tier = tier - 1
            assert buy_custom_data.get("tier") == str(prev_tier) or buy_custom_data.get("tier") == prev_tier, \
                f"{category_name} Tier {tier}: buy slot does not require Tier {prev_tier}"
            assert "minecraft:custom_name" in buy_comp, f"{category_name} Tier {tier}: buy missing custom_name"
            assert "minecraft:lore" in buy_comp, f"{category_name} Tier {tier}: buy missing lore"
            assert "minecraft:enchantments" in buy_comp, f"{category_name} Tier {tier}: buy missing enchantments"

verify_tier_progression(tool_recipes, "Pickaxe", 15, 0)
ok("Pickaxe: 15/15 Tiers strict N-1 progression verified.")
verify_tier_progression(tool_recipes, "Axe", 15, 15)
ok("Axe: 15/15 Tiers strict N-1 progression verified.")

verify_tier_progression(combat_recipes, "Sword", 15, 0)
ok("Sword: 15/15 Tiers strict N-1 progression verified.")
verify_tier_progression(combat_recipes, "Helmet", 15, 15)
ok("Armor Helmet: 15/15 Tiers strict N-1 progression verified.")
verify_tier_progression(combat_recipes, "Chestplate", 15, 30)
ok("Armor Chestplate: 15/15 Tiers strict N-1 progression verified.")
verify_tier_progression(combat_recipes, "Leggings", 15, 45)
ok("Armor Leggings: 15/15 Tiers strict N-1 progression verified.")
verify_tier_progression(combat_recipes, "Boots", 15, 60)
ok("Armor Boots: 15/15 Tiers strict N-1 progression verified.")
verify_tier_progression(combat_recipes, "Bow", 15, 75)
ok("Bow: 15/15 Tiers strict N-1 progression verified.")

# ------------------------------------------------------------------------------
# 2. FORENSIC CHECK R2: BOSS NAVIGATION & WARPS INTEGRITY
# ------------------------------------------------------------------------------
log("\n--- [AUDIT R2] Boss Navigation, Warps & Commands Aliases Verification ---")
warps = {
    "boss1.yml": {"x": -18.5, "y": 111.0, "z": 75.5, "yaw": 90.0, "pitch": 0.0},
    "boss2.yml": {"x": 18.5, "y": 111.0, "z": 75.5, "yaw": -90.0, "pitch": 0.0},
    "boss3.yml": {"x": 0.5, "y": 111.0, "z": 101.5, "yaw": 0.0, "pitch": 0.0},
    "boss4.yml": {"x": -25.5, "y": 111.0, "z": 102.5, "yaw": 90.0, "pitch": 0.0},
}
for wfile, expected in warps.items():
    wpath = os.path.join(ROOT_DIR, "plugins", "Essentials", "warps", wfile)
    assert os.path.exists(wpath), f"Warp file {wfile} missing!"
    with open(wpath, "r", encoding="utf-8") as f:
        wdata = yaml.safe_load(f)
    for k, v in expected.items():
        assert wdata[k] == v, f"Warp {wfile} key {k}: expected {v}, got {wdata[k]}"
    ok(f"Warp {wfile} coordinates verified: {expected['x']}, {expected['y']}, {expected['z']}, yaw={expected['yaw']}")

cmd_path = os.path.join(ROOT_DIR, "commands.yml")
with open(cmd_path, "r", encoding="utf-8") as f:
    cmd_data = yaml.safe_load(f)
aliases = cmd_data.get("aliases", {})
log(f"commands.yml aliases count: {len(aliases)} (expected 79)")
assert len(aliases) == 79, f"Expected 79 aliases, found {len(aliases)}"

for balias in ["boss1", "boss2", "boss3", "boss4", "dongnhen", "vuclua", "thanhtri", "hukhong"]:
    assert balias in aliases, f"Alias {balias} missing from commands.yml!"
ok("All 8 Boss aliases present in commands.yml.")

hunter_menu_path = os.path.join(DATAPACK_DIR, "boss", "hunter_menu.mcfunction")
assert os.path.exists(hunter_menu_path), "hunter_menu.mcfunction missing!"
with open(hunter_menu_path, "r", encoding="utf-8") as f:
    hunter_menu_content = f.read()
assert "tellraw @s" in hunter_menu_content
for w in ["/warp boss1", "/warp boss2", "/warp boss3", "/warp boss4"]:
    assert w in hunter_menu_content, f"Hunter menu missing {w} clickEvent!"
ok("boss/hunter_menu.mcfunction verified with tellraw and 4 clickEvents.")

boss_multi_path = os.path.join(DATAPACK_DIR, "build_boss_multi.mcfunction")
with open(boss_multi_path, "r", encoding="utf-8") as f:
    bm_content = f.read()
assert "summon villager 0.5 111 61.5" in bm_content
assert "summon interaction 0.5 111 61.5" in bm_content
assert "teleport @p 0.5 111.0 58.0 0.0 0.0" in bm_content
ok("build_boss_multi.mcfunction summons Boss Hunter NPC and places Return TP pads.")

# ------------------------------------------------------------------------------
# 3. FORENSIC CHECK R3: SERVER STABILITY & JVM GC
# ------------------------------------------------------------------------------
log("\n--- [AUDIT R3] Server Stability, Spigot Config & JVM Flags Verification ---")
spigot_path = os.path.join(ROOT_DIR, "spigot.yml")
with open(spigot_path, "r", encoding="utf-8") as f:
    spigot_data = yaml.safe_load(f)
assert spigot_data["settings"]["restart-script"] == "Run-Server.bat", "spigot.yml restart-script mismatch!"
assert spigot_data["world-settings"]["default"]["merge-radius"]["exp"] == 3.0, "spigot.yml merge-radius.exp mismatch!"
ok("spigot.yml settings.restart-script is Run-Server.bat")
ok("spigot.yml world-settings.default.merge-radius.exp is 3.0")

ess_cfg_path = os.path.join(ROOT_DIR, "plugins", "Essentials", "config.yml")
with open(ess_cfg_path, "r", encoding="utf-8") as f:
    ess_data = yaml.safe_load(f)
assert ess_data["newbies"]["kit"] == "tanthu", "Essentials newbies.kit is not tanthu!"
ok("plugins/Essentials/config.yml newbies.kit is tanthu")

bat_path = os.path.join(ROOT_DIR, "Run-Server.bat")
with open(bat_path, "r", encoding="utf-8") as f:
    bat_content = f.read()
for flag in ["-Xms4G", "-Xmx4G", "-XX:+UseG1GC", "-XX:+AlwaysPreTouch", "-XX:MaxGCPauseMillis=200", "-XX:InitiatingHeapOccupancyPercent=15"]:
    assert flag in bat_content, f"Run-Server.bat missing flag {flag}!"
ok("Run-Server.bat contains standard Aikar's Flags for Java 21 G1GC.")

# ------------------------------------------------------------------------------
# 4. FORENSIC CHECK R4: ECONOMY DAEMON RELIABILITY & LOG ROTATION
# ------------------------------------------------------------------------------
log("\n--- [AUDIT R4] Economy Daemon Concurrency & Log Rotation Verification ---")
daemon_path = os.path.join(ROOT_DIR, "skyblock_economy_daemon.py")
py_compile.compile(daemon_path, doraise=True)
ok("skyblock_economy_daemon.py compiled cleanly with py_compile.")

with open(daemon_path, "r", encoding="utf-8") as f:
    daemon_code = f.read()

assert "def open_log_shared" in daemon_code
assert "FILE_SHARE_DELETE" in daemon_code
assert "st.st_size < curr_pos" in daemon_code or "st.st_size <" in daemon_code
assert "st.st_ino != current_ino" in daemon_code
ok("skyblock_economy_daemon.py contains open_log_shared with FILE_SHARE_DELETE, truncation and rotation detection.")

# ------------------------------------------------------------------------------
# 5. FORENSIC CHECK R5: NEWBIE ONBOARDING & HELP SYSTEM
# ------------------------------------------------------------------------------
log("\n--- [AUDIT R5] Newbie Onboarding, Guide NPC & Help Topics Verification ---")
help_path = os.path.join(ROOT_DIR, "help.yml")
with open(help_path, "r", encoding="utf-8") as f:
    raw_help = f.read()
assert "\t" not in raw_help, "help.yml contains TAB characters!"
help_data = yaml.safe_load(raw_help)
topics = help_data.get("general-topics", {})
assert len(topics) == 18, f"help.yml expected 18 topics, found {len(topics)}"
for req_topic in ["is", "warp", "bankhoangsan", "tanthu", "daily", "boss", "ah", "nung"]:
    assert req_topic in topics, f"Topic {req_topic} missing from help.yml!"
ok("help.yml contains 18 topics, 0 tabs, all required commands present.")

guide_menu_path = os.path.join(DATAPACK_DIR, "guide", "menu.mcfunction")
with open(guide_menu_path, "r", encoding="utf-8") as f:
    guide_content = f.read()
assert "tellraw @s" in guide_content
t_line = [l for l in guide_content.splitlines() if l.startswith("tellraw @s ")][0]
json_str = t_line[len("tellraw @s "):].strip()
parsed_json = json.loads(json_str)
assert len(parsed_json) > 10, "Guide menu JSON payload unexpectedly short!"
ok(f"guide/menu.mcfunction tellraw parsed cleanly as valid JSON ({len(parsed_json)} elements).")

# ------------------------------------------------------------------------------
# 6. FORENSIC CHECK: COMPLETE DATAPACK SYNTAX & JSON VALIDITY (ALL 70 FILES)
# ------------------------------------------------------------------------------
log("\n--- [AUDIT DATAPACK SYNTAX] Scanning All Datapack mcfunctions ---")
all_mcfunctions = []
for root, dirs, files in os.walk(DATAPACK_DIR):
    for file in files:
        if file.endswith(".mcfunction"):
            all_mcfunctions.append(os.path.join(root, file))

log(f"Discovered {len(all_mcfunctions)} .mcfunction files in datapack.")
assert len(all_mcfunctions) >= 70, f"Expected at least 70 mcfunction files, found {len(all_mcfunctions)}"

syntax_errors = []
for p in all_mcfunctions:
    rel = os.path.relpath(p, ROOT_DIR)
    with open(p, "r", encoding="utf-8") as f:
        lines = f.readlines()
    for lno, line in enumerate(lines, 1):
        s = line.strip()
        if not s or s.startswith("#"):
            continue
        b_curly = s.count("{") - s.count("}")
        b_square = s.count("[") - s.count("]")
        b_round = s.count("(") - s.count(")")
        if b_curly != 0 or b_square != 0 or b_round != 0:
            syntax_errors.append(f"{rel}:{lno} Bracket mismatch (curly={b_curly}, square={b_square}, round={b_round})")
        if s.startswith("tellraw "):
            parts = s.split(" ", 2)
            if len(parts) >= 3:
                raw_json = parts[2]
                try:
                    json.loads(raw_json)
                except Exception as e:
                    syntax_errors.append(f"{rel}:{lno} Invalid JSON in tellraw: {e}")

if syntax_errors:
    for e in syntax_errors:
        log(f"  [ERROR] {e}")
    assert False, f"Datapack syntax audit found {len(syntax_errors)} errors!"
else:
    ok(f"100% of all {len(all_mcfunctions)} mcfunction files passed syntax and tellraw JSON checks without a single error!")

# ------------------------------------------------------------------------------
# 7. FORENSIC CHECK: IDEMPOTENCY & CLOBBER-RESISTANCE STRESS TEST
# ------------------------------------------------------------------------------
log("\n--- [AUDIT CLOBBER RESISTANCE] Multi-Execution Idempotency Stress Test ---")
tick_path = os.path.join(DATAPACK_DIR, "tick.mcfunction")
setup_path = os.path.join(DATAPACK_DIR, "setup.mcfunction")

for iteration in range(1, 4):
    log(f"Stress-test run #{iteration}: Executing generate_all.py...")
    res = subprocess.run([sys.executable, "generate_all.py"], cwd=ROOT_DIR, capture_output=True, text=True)
    assert res.returncode == 0, f"generate_all.py failed on run #{iteration}: {res.stderr}"
    
    with open(tick_path, "r", encoding="utf-8") as f:
        tick = f.read()
    with open(setup_path, "r", encoding="utf-8") as f:
        setup = f.read()
    
    assert "boss_hunter_interact" in tick, f"Run #{iteration}: boss_hunter_interact lost from tick!"
    assert "guide_interact" in tick, f"Run #{iteration}: guide_interact lost from tick!"
    assert "scores={huongdan=1..}" in tick, f"Run #{iteration}: huongdan trigger lost from tick!"
    assert "x=-19,y=110,z=74" in tick, f"Run #{iteration}: Boss 1 return TP lost from tick!"
    assert "x=18,y=110,z=74" in tick, f"Run #{iteration}: Boss 2 return TP lost from tick!"
    assert "x=2,y=110,z=101" in tick, f"Run #{iteration}: Boss 3 return TP lost from tick!"
    assert "x=-26,y=110,z=101" in tick, f"Run #{iteration}: Boss 4 return TP lost from tick!"
    assert "scoreboard objectives add huongdan trigger" in setup, f"Run #{iteration}: huongdan objective lost from setup!"

ok("Clobber-resistance stress test: 3 consecutive regenerations preserved all M2 and M5 listeners with 100% fidelity!")

log("\n" + "=" * 80)
log("INDEPENDENT FORENSIC VERDICT: 100% CLEAN - ALL CHECKS PASSED PERFECTLY")
log("=" * 80)
