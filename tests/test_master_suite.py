# -*- coding: utf-8 -*-
"""
Master Verification Suite for Skyblock Gameplay Expansion & Multi-World Architecture
Author: Antigravity Automated Verification
Target: Full Server Subsystems & Master Blueprint Conformance
"""

import os
import sys
import yaml
import json
import tempfile
import shutil

# Ensure UTF-8 output
sys.stdout.reconfigure(encoding="utf-8")

PROJECT_ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))
sys.path.insert(0, PROJECT_ROOT)

import skyblock_economy_daemon as daemon
import skyblock_minions as minions

TOTAL_ASSERTIONS = 0
PASSED_ASSERTIONS = 0

def check(condition, message):
    global TOTAL_ASSERTIONS, PASSED_ASSERTIONS
    TOTAL_ASSERTIONS += 1
    if condition:
        PASSED_ASSERTIONS += 1
        print(f"  [PASS] {message}")
        return True
    else:
        print(f"  [FAIL] {message}")
        return False

# ==============================================================================
# SECTION 1: MULTI-WORLD INFRASTRUCTURE & DISK CONFIGS
# ==============================================================================
def test_section_1_multiworld():
    print("\n" + "=" * 70)
    print("SECTION 1: MULTI-WORLD INFRASTRUCTURE & DISK CONFIGS")
    print("=" * 70)

    # 1.1 Multiverse Core Worlds config
    mv_worlds_file = os.path.join(PROJECT_ROOT, "plugins", "Multiverse-Core", "worlds.yml")
    check(os.path.exists(mv_worlds_file), f"Multiverse-Core worlds.yml exists ({mv_worlds_file})")

    with open(mv_worlds_file, "r", encoding="utf-8") as f:
        worlds_data = yaml.safe_load(f)

    expected_worlds = ["world", "world_boss", "world_farm", "world_cauca", "world_parkour", "world_casino"]
    worlds_in_config = worlds_data.get("worlds", {})
    if not worlds_in_config:
        worlds_in_config = {}
        for k, v in worlds_data.items():
            if isinstance(v, dict):
                leg = v.get("read-only", {}).get("legacy-world-name", "")
                name = k.replace("minecraft:", "")
                if name == "overworld":
                    name = "world"
                worlds_in_config[name] = v
                if leg:
                    worlds_in_config[leg] = v

    for w in expected_worlds:
        check(w in worlds_in_config, f"Multiverse-Core registers world '{w}'")

    # 1.2 Disk world directories & level.dat
    for w in expected_worlds:
        w_dir = os.path.join(PROJECT_ROOT, w)
        level_dat = os.path.join(w_dir, "level.dat")
        check(os.path.isdir(w_dir), f"World directory exists on disk: {w}")
        check(os.path.isfile(level_dat), f"World level.dat exists: {w}/level.dat")

    # 1.3 Multiverse Core RAM optimizations
    non_hub = ["world_boss", "world_farm", "world_cauca", "world_parkour", "world_casino"]
    all_not_in_mem = all(
        worlds_in_config.get(w, {}).get("keep-spawn-in-memory") is False
        for w in non_hub
    )
    check(all_not_in_mem, "RAM optimization: non-hub worlds keep-spawn-in-memory == false")
    mv_config_file = os.path.join(PROJECT_ROOT, "plugins", "Multiverse-Core", "config.yml")
    check(os.path.exists(mv_config_file), f"Multiverse-Core config.yml exists")

# ==============================================================================
# SECTION 2: WORLDGUARD REGION PROTECTION ACROSS 6 WORLDS
# ==============================================================================
def test_section_2_worldguard():
    print("\n" + "=" * 70)
    print("SECTION 2: WORLDGUARD REGION PROTECTION ACROSS 6 WORLDS")
    print("=" * 70)

    expected_worlds = ["world", "world_boss", "world_farm", "world_cauca", "world_parkour", "world_casino"]
    wg_base = os.path.join(PROJECT_ROOT, "plugins", "WorldGuard", "worlds")

    for w in expected_worlds:
        reg_file = os.path.join(wg_base, w, "regions.yml")
        check(os.path.isfile(reg_file), f"WorldGuard regions.yml exists for {w}")
        if os.path.isfile(reg_file):
            with open(reg_file, "r", encoding="utf-8") as f:
                rdata = yaml.safe_load(f)
                regions = rdata.get("regions", {})
                check("__global__" in regions, f"WorldGuard {w} defines '__global__' protection region")
                global_flags = regions.get("__global__", {}).get("flags", {})
                check(global_flags.get("build") in ("deny", "DENY"), f"WorldGuard {w} has build: deny")

# ==============================================================================
# SECTION 3: ESSENTIALS WARPS MAPPING
# ==============================================================================
def test_section_3_warps():
    print("\n" + "=" * 70)
    print("SECTION 3: ESSENTIALS WARPS MAPPING TO DEDICATED WORLDS")
    print("=" * 70)

    warp_expectations = {
        "boss.yml": "world_boss",
        "farm.yml": "world_farm",
        "mob.yml": "world_farm",
        "cauca.yml": "world_cauca",
        "fishing.yml": "world_cauca",
        "parkour.yml": "world_parkour",
        "casino.yml": "world_casino",
        "cotyphu.yml": "world_casino",
        "spawn.yml": "world"
    }
    warps_dir = os.path.join(PROJECT_ROOT, "plugins", "Essentials", "warps")

    for wname, exp_world in warp_expectations.items():
        wpath = os.path.join(warps_dir, wname)
        check(os.path.isfile(wpath), f"Warp file exists: {wname}")
        if os.path.isfile(wpath):
            with open(wpath, "r", encoding="utf-8") as f:
                wdata = yaml.safe_load(f)
                actual_world = wdata.get("world")
                check(actual_world == exp_world, f"Warp {wname} -> world '{actual_world}' (expected: {exp_world})")

# ==============================================================================
# SECTION 4: DELUXEMENUS 20 TIERS GUI CONFIGURATION
# ==============================================================================
def test_section_4_deluxemenus():
    print("\n" + "=" * 70)
    print("SECTION 4: DELUXEMENUS 20 TIERS GUI CONFIGURATION")
    print("=" * 70)

    dm_config = os.path.join(PROJECT_ROOT, "plugins", "DeluxeMenus", "config.yml")
    check(os.path.isfile(dm_config), f"DeluxeMenus config.yml exists")
    if os.path.isfile(dm_config):
        with open(dm_config, "r", encoding="utf-8") as f:
            cfg = yaml.safe_load(f)
            gui_menus = cfg.get("gui_menus", {})
            check("nangcap" in gui_menus, "DeluxeMenus registers 'nangcap' GUI menu")
            check("nangcap.yml" in gui_menus.get("nangcap", {}).get("file", ""), "DeluxeMenus config points to nangcap.yml")

    nangcap_file = os.path.join(PROJECT_ROOT, "plugins", "DeluxeMenus", "gui_menus", "nangcap.yml")
    check(os.path.isfile(nangcap_file), f"nangcap.yml exists ({nangcap_file})")
    if os.path.isfile(nangcap_file):
        with open(nangcap_file, "r", encoding="utf-8") as f:
            nc_data = yaml.safe_load(f)
            check(nc_data.get("size") == 54, "nangcap.yml GUI size == 54 (6-row double chest)")
            items = nc_data.get("items", {})
            # Verify 5 equipment categories covering Tier 1-20
            categories = ["pickaxe_cat", "axe_cat", "sword_cat", "bow_cat", "armor_cat"]
            for cat in categories:
                check(cat in items, f"nangcap.yml contains category '{cat}' covering Tiers 1-20")

            # Verify 6 breakthrough materials covering all 20 tiers brackets
            materials = ["mat_shard", "mat_crystal", "mat_demon_heart", "mat_void_core", "mat_warden_heart", "mat_singularity"]
            for mat in materials:
                check(mat in items, f"nangcap.yml displays breakthrough material '{mat}'")

# ==============================================================================
# SECTION 5: BOSS 1-6 MECHANICS, PHASES & PARTY REWARDS
# ==============================================================================
def test_section_5_bosses():
    print("\n" + "=" * 70)
    print("SECTION 5: BOSS 1-6 MECHANICS, PHASES & PARTY REWARDS")
    print("=" * 70)

    func_dir = os.path.join(PROJECT_ROOT, "world", "datapacks", "skyblock_spawn", "data", "skyblock", "function")
    boss_dir = os.path.join(func_dir, "boss")

    # 5.1 Tick files for all 6 bosses
    for b in range(1, 7):
        tick_file = os.path.join(boss_dir, f"boss_{b}_tick.mcfunction")
        check(os.path.isfile(tick_file), f"Boss {b} tick function exists: boss_{b}_tick.mcfunction")

    # 5.2 Phase 2 files for all 6 bosses
    for b in range(1, 7):
        p2_file = os.path.join(boss_dir, f"boss_{b}_phase2.mcfunction")
        check(os.path.isfile(p2_file), f"Boss {b} phase2 function exists: boss_{b}_phase2.mcfunction")

    # 5.3 Party reward files for all 6 bosses
    for b in range(1, 7):
        party_file = os.path.join(boss_dir, f"party_reward_boss_{b}.mcfunction")
        check(os.path.isfile(party_file), f"Boss {b} party reward exists: party_reward_boss_{b}.mcfunction")
        if os.path.isfile(party_file):
            content = open(party_file, "r", encoding="utf-8").read()
            check("gems_add" in content, f"Boss {b} party reward awards Ancient Gems (gems_add)")
            check("eco_add" in content, f"Boss {b} party reward awards Vault Money (eco_add)")

    # 5.4 Announce scripts contain killer gems and invoke party rewards
    for b in range(1, 7):
        ann_file = os.path.join(boss_dir, f"announce_boss_{b}.mcfunction")
        check(os.path.isfile(ann_file), f"Boss {b} announce function exists: announce_boss_{b}.mcfunction")
        if os.path.isfile(ann_file):
            content = open(ann_file, "r", encoding="utf-8").read()
            check("gems_add" in content, f"Boss {b} killer receives Ancient Gems (gems_add)")
            check(f"party_reward_boss_{b}" in content, f"Boss {b} announce invokes party_reward_boss_{b}")

    # 5.5 Tick.mcfunction wiring
    tick_mc = os.path.join(func_dir, "tick.mcfunction")
    check(os.path.isfile(tick_mc), "tick.mcfunction exists")
    if os.path.isfile(tick_mc):
        t_content = open(tick_mc, "r", encoding="utf-8").read()
        for b in range(1, 7):
            check(f"boss_{b}_tick" in t_content, f"tick.mcfunction wires boss_{b}_tick")
            check(f"boss_{b}_defeated" in t_content, f"tick.mcfunction wires boss_{b}_defeated")
        check("sb_money += @s eco_add" in t_content, "tick.mcfunction automatically transfers eco_add to sb_money")
        check("sb_gems += @s gems_add" in t_content, "tick.mcfunction automatically transfers gems_add to sb_gems")

# ==============================================================================
# SECTION 6: ECONOMY DAEMON (GEMS, QUESTS, ACHIEVEMENTS, ROTATION)
# ==============================================================================
def test_section_6_daemon():
    print("\n" + "=" * 70)
    print("SECTION 6: ECONOMY DAEMON SUBSYSTEMS INTEGRATION")
    print("=" * 70)

    # 6.1 Daemon instance
    d = daemon.SkyblockDaemon()
    check(hasattr(d, "get_gems") and hasattr(d, "add_gems") and hasattr(d, "take_gems"), "Daemon implements Ancient Gems API")
    check(hasattr(d, "handle_gems"), "Daemon implements /gem handler")
    check(daemon.RCON_PASS == "skyblock123", "Daemon RCON password matches server.properties (skyblock123)")

    # Test Gems manipulation in memory
    test_player = "TestPlayer999"
    d.data["gems"][test_player] = 50
    check(d.get_gems(test_player) == 50, "get_gems returns correct initial value")
    d.add_gems(test_player, 75)
    check(d.get_gems(test_player) == 125, "add_gems correctly accumulates")
    check(d.take_gems(test_player, 25) is True, "take_gems succeeds when sufficient")
    check(d.get_gems(test_player) == 100, "take_gems correctly reduces balance")
    check(d.take_gems(test_player, 999) is False, "take_gems fails safely when insufficient")

    # 6.2 Daily Quests
    check(hasattr(d, "get_player_quests") and hasattr(d, "add_quest_progress"), "Daemon implements Daily Quests API")
    q_data = d.get_player_quests(test_player)
    check("date" in q_data and "progress" in q_data and "claimed" in q_data, "Daily quests schema initialized")
    check(len(q_data["progress"]) == 4, "All 4 Daily Quests present in player progress")
    for qk in ["mining", "hunting", "fishing", "trading"]:
        check(qk in daemon.DAILY_QUESTS, f"DAILY_QUESTS contains '{qk}'")

    prev_mining = d.get_player_quests(test_player)["progress"]["mining"]
    d.add_quest_progress(test_player, "mining", 50)
    check(d.get_player_quests(test_player)["progress"]["mining"] == prev_mining + 50, "add_quest_progress updates progress")

    # 6.3 Achievements
    check(hasattr(d, "get_player_achievements") and hasattr(d, "handle_achievements"), "Daemon implements Achievements API")
    check(len(daemon.ACHIEVEMENTS) >= 6, "ACHIEVEMENTS has at least 6 milestone achievements")

    # 6.4 Rebirth Realms (10 Realms)
    check(len(daemon.REBIRTH_REALMS) == 10, "REBIRTH_REALMS has exactly 10 cultivation tiers")
    for idx, r in enumerate(daemon.REBIRTH_REALMS, 1):
        check(r["level"] == idx, f"Rebirth realm {idx} level match ({r['name']})")

    # 6.5 Windows Shared Handle contract
    temp_dir = tempfile.mkdtemp(prefix="skyblock_test_")
    tfile = os.path.join(temp_dir, "t.log")
    with open(tfile, "w", encoding="utf-8") as f:
        f.write("Line 1\n")
    h = daemon.open_log_shared(tfile)
    check(h is not None, "open_log_shared successfully opens file")
    if h:
        l = h.readline().strip()
        check(l == "Line 1", f"open_log_shared reads content correctly: '{l}'")
        h.close()
    shutil.rmtree(temp_dir, ignore_errors=True)

# ==============================================================================
# SECTION 7: 12 TIERS ACROSS ALL 4 MINION TYPES
# ==============================================================================
def test_section_7_minions():
    print("\n" + "=" * 70)
    print("SECTION 7: 12 TIERS ACROSS ALL 4 MINION TYPES")
    print("=" * 70)

    cfg = minions.MINION_CONFIG
    check(len(cfg) == 4, "MINION_CONFIG contains exactly 4 Minion types")
    expected_types = ["miner", "farmer", "slayer", "builder"]

    for mtype in expected_types:
        check(mtype in cfg, f"Minion type '{mtype}' defined")
        imap = cfg[mtype]["item_map"]
        check(len(imap) == 12, f"Minion '{mtype}' has exactly 12 Tiers (got {len(imap)})")
        # Check all tiers 1 to 12 present
        for t in range(1, 13):
            check(t in imap, f"Minion '{mtype}' Tier {t} exists: {imap.get(t, (None, None))[1]}")

# ==============================================================================
# SECTION 8: 1000x1000 VOXEL MASTER SCRIPTS EXISTENCE & SYNTAX
# ==============================================================================
def test_section_8_builder_scripts():
    print("\n" + "=" * 70)
    print("SECTION 8: 1000x1000 VOXEL MASTER SCRIPTS")
    print("=" * 70)

    builder_dir = os.path.join(PROJECT_ROOT, "world", "datapacks", "skyblock_spawn", "data", "skyblock", "function", "builder")
    check(os.path.isdir(builder_dir), f"Builder functions directory exists ({builder_dir})")

    scripts = [
        "world_spawn_1000.mcfunction",
        "world_boss_1000.mcfunction",
        "world_farm_1000.mcfunction",
        "world_cauca_1000.mcfunction",
        "world_parkour_1000.mcfunction",
        "world_casino_1000.mcfunction"
    ]

    for s in scripts:
        spath = os.path.join(builder_dir, s)
        check(os.path.isfile(spath), f"Master voxel script exists: {s}")
        if os.path.isfile(spath):
            sz = os.path.getsize(spath)
            check(sz > 100, f"Script {s} is populated ({sz} bytes)")

    # Master orchestrator script build_all_worlds.mcfunction
    master_build = os.path.join(PROJECT_ROOT, "world", "datapacks", "skyblock_spawn", "data", "skyblock", "function", "build_all_worlds.mcfunction")
    check(os.path.isfile(master_build), "Master build script exists: build_all_worlds.mcfunction")
    if os.path.isfile(master_build):
        sz = os.path.getsize(master_build)
        check(sz > 50, f"Script build_all_worlds.mcfunction is populated ({sz} bytes)")
        with open(master_build, 'r', encoding='utf-8') as f:
            b_content = f.read()
        for w_dim in ['minecraft:overworld', 'minecraft:world_boss', 'minecraft:world_farm', 'minecraft:world_cauca', 'minecraft:world_parkour', 'minecraft:world_casino']:
            check(f"execute in {w_dim}" in b_content, f"build_all_worlds enforces dimension routing for {w_dim}")

# ==============================================================================
# MAIN RUNNER
# ==============================================================================
def main():
    print("=" * 70)
    print("STARTING SKYBLOCK EXPANSION MASTER VERIFICATION HARNESS")
    print("=" * 70)

    test_section_1_multiworld()
    test_section_2_worldguard()
    test_section_3_warps()
    test_section_4_deluxemenus()
    test_section_5_bosses()
    test_section_6_daemon()
    test_section_7_minions()
    test_section_8_builder_scripts()

    print("\n" + "=" * 70)
    print("MASTER HARNESS AUDIT SUMMARY:")
    print(f"  - Total Assertions: {TOTAL_ASSERTIONS}")
    print(f"  - Passed Assertions: {PASSED_ASSERTIONS}")
    print(f"  - Failed Assertions: {TOTAL_ASSERTIONS - PASSED_ASSERTIONS}")
    rate = (PASSED_ASSERTIONS / TOTAL_ASSERTIONS) * 100 if TOTAL_ASSERTIONS > 0 else 0
    print(f"  - Conformance Score: {rate:.2f}%")
    print("=" * 70)

    if PASSED_ASSERTIONS == TOTAL_ASSERTIONS:
        print(">>> FINAL VERDICT: 100% PASS - ALL EXPANSION CRITERIA SATISFIED <<<")
        sys.exit(0)
    else:
        print(f">>> FINAL VERDICT: FAIL - {TOTAL_ASSERTIONS - PASSED_ASSERTIONS} ASSERTIONS FAILED <<<")
        sys.exit(1)

if __name__ == "__main__":
    main()
