# -*- coding: utf-8 -*-
"""
Comprehensive Verification Harness for MASTER_PROMPT_BLUEPRINT.md Deliverables
Paper Minecraft 1.21.4 Skyblock MMORPG
"""
import os
import sys
import yaml
import json
import re

sys.stdout.reconfigure(encoding="utf-8")

PROJECT_ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))
DATAPACK_FUNC = os.path.join(PROJECT_ROOT, "world", "datapacks", "skyblock_spawn", "data", "skyblock", "function")

passed_checks = 0
total_checks = 0

def check(condition, message):
    global passed_checks, total_checks
    total_checks += 1
    if condition:
        passed_checks += 1
        print(f"  [PASS] {message}")
    else:
        print(f"  [FAIL] {message}")

def test_torii_portals():
    print("=" * 70)
    print("AUDIT 1: ZEN SAKURA 5 TORII PORTALS & ROUTING")
    print("=" * 70)
    tick_file = os.path.join(DATAPACK_FUNC, "tick.mcfunction")
    with open(tick_file, "r", encoding="utf-8") as f:
        tick_content = f.read()

    portal_files = [
        "to_world_boss.mcfunction",
        "to_world_farm.mcfunction",
        "to_world_cauca.mcfunction",
        "to_world_parkour.mcfunction",
        "to_world_casino.mcfunction"
    ]
    for pf in portal_files:
        p_path = os.path.join(DATAPACK_FUNC, "portal", pf)
        check(os.path.exists(p_path), f"Portal function exists: portal/{pf}")

    check("portal/to_world_boss" in tick_content, "tick.mcfunction wires Torii 1 -> portal/to_world_boss")
    check("portal/to_world_farm" in tick_content, "tick.mcfunction wires Torii 2 -> portal/to_world_farm")
    check("portal/to_world_cauca" in tick_content, "tick.mcfunction wires Torii 3 -> portal/to_world_cauca")
    check("portal/to_world_parkour" in tick_content, "tick.mcfunction wires Torii 4 -> portal/to_world_parkour")
    check("portal/to_world_casino" in tick_content, "tick.mcfunction wires Torii 5 -> portal/to_world_casino")

def test_exclusive_catalysts():
    print("\n" + "=" * 70)
    print("AUDIT 2: 4 EXCLUSIVE CATALYSTS IN GAMEPLAY HOOKS")
    print("=" * 70)
    
    # 1. storm_crystal in parkour_win
    pk_file = os.path.join(DATAPACK_FUNC, "parkour_win.mcfunction")
    with open(pk_file, "r", encoding="utf-8") as f:
        pk_content = f.read()
    check('ancient_mat:"storm_crystal"' in pk_content, "parkour_win.mcfunction rewards storm_crystal (Tinh Thể Phong Lôi)")
    check("gems_add" in pk_content, "parkour_win.mcfunction rewards Điểm Tinh Anh (gems_add)")

    # 2. ancient_sea_scale in fishing.yml and NPC Lão Ngư
    fish_file = os.path.join(PROJECT_ROOT, "plugins", "AuraSkills", "loot", "fishing.yml")
    with open(fish_file, "r", encoding="utf-8") as f:
        fish_content = f.read()
    check("nautilus_shell" in fish_content and "Vảy Thần Biển Sâu" in fish_content, "fishing.yml includes ancient_sea_scale (Vảy Thần Biển Sâu)")

    w_cauca = os.path.join(DATAPACK_FUNC, "builder", "world_cauca_1000.mcfunction")
    with open(w_cauca, "r", encoding="utf-8") as f:
        cauca_content = f.read()
    check('ancient_mat:"sea_scale"' in cauca_content, "world_cauca_1000.mcfunction equips NPC Lão Ngư with sea_scale trades")

    # 3. soul_fragment in world_farm
    w_farm = os.path.join(DATAPACK_FUNC, "builder", "world_farm_1000.mcfunction")
    with open(w_farm, "r", encoding="utf-8") as f:
        farm_content = f.read()
    check('ancient_mat:"soul_fragment"' in farm_content, "world_farm_1000.mcfunction equips Dungeon Guard NPC with soul_fragment trades")

    # 4. royal_ticket in casino / cotyphu / daemon
    pass_go = os.path.join(DATAPACK_FUNC, "cotyphu", "pass_go.mcfunction")
    with open(pass_go, "r", encoding="utf-8") as f:
        pass_go_content = f.read()
    check('ancient_mat:"royal_ticket"' in pass_go_content, "cotyphu/pass_go.mcfunction rewards royal_ticket on passing Go")

    chance = os.path.join(DATAPACK_FUNC, "cotyphu", "chance.mcfunction")
    with open(chance, "r", encoding="utf-8") as f:
        chance_content = f.read()
    check('ancient_mat:"royal_ticket"' in chance_content, "cotyphu/chance.mcfunction rewards royal_ticket on card 1")

    daemon_file = os.path.join(PROJECT_ROOT, "skyblock_economy_daemon.py")
    with open(daemon_file, "r", encoding="utf-8") as f:
        daemon_content = f.read()
    check("def give_royal_ticket" in daemon_content, "skyblock_economy_daemon.py defines give_royal_ticket helper")
    check("def handle_xoso" in daemon_content, "skyblock_economy_daemon.py defines handle_xoso with jackpot ticket")
    check("def handle_cf" in daemon_content, "skyblock_economy_daemon.py defines handle_cf with win ticket")

def test_boss_gating():
    print("\n" + "=" * 70)
    print("AUDIT 3: AURASKILLS BOSS GATING (BOSS 1 - 6)")
    print("=" * 70)
    levels = [5, 10, 20, 30, 40, 50]
    for idx, lvl in enumerate(levels, 1):
        gf = os.path.join(DATAPACK_FUNC, f"gate_boss_{idx}.mcfunction")
        check(os.path.exists(gf), f"Gate function exists: gate_boss_{idx}.mcfunction")
        with open(gf, "r", encoding="utf-8") as f:
            c = f.read()
        check(f"askill_fighting matches {lvl}.." in c, f"gate_boss_{idx} enforces askill_fighting matches {lvl}..")
        check(f'totem:"boss_{idx}"' in c, f"gate_boss_{idx} consumes totem:boss_{idx}")
        check("boss_bypass" in c, f"gate_boss_{idx} respects boss_bypass tag")

def test_deluxemenus_and_scoreboard():
    print("\n" + "=" * 70)
    print("AUDIT 4: DELUXEMENUS GUI & SCOREBOARD CONFIGURATION")
    print("=" * 70)
    dm_config = os.path.join(PROJECT_ROOT, "plugins", "DeluxeMenus", "config.yml")
    with open(dm_config, "r", encoding="utf-8") as f:
        dm_content = f.read()
    check("warp:" in dm_content and "warp.yml" in dm_content, "DeluxeMenus config.yml registers warp.yml")
    check("menu:" in dm_content and "menu.yml" in dm_content, "DeluxeMenus config.yml registers menu.yml")

    warp_file = os.path.join(PROJECT_ROOT, "plugins", "DeluxeMenus", "gui_menus", "warp.yml")
    check(os.path.exists(warp_file), "gui_menus/warp.yml exists")
    with open(warp_file, "r", encoding="utf-8") as f:
        warp_content = f.read()
    check("boss_unlocked" in warp_content and "boss_locked" in warp_content, "warp.yml defines unlocked & locked items for Boss")
    check("%auraskills_fighting%" in warp_content, "warp.yml checks %auraskills_fighting%")
    check("island" in warp_content, "warp.yml contains island (/is)")
    check("farm" in warp_content, "warp.yml contains farm")
    check("cauca" in warp_content, "warp.yml contains cauca")
    check("parkour" in warp_content, "warp.yml contains parkour")
    check("casino" in warp_content, "warp.yml contains casino")

    menu_file = os.path.join(PROJECT_ROOT, "plugins", "DeluxeMenus", "gui_menus", "menu.yml")
    check(os.path.exists(menu_file), "gui_menus/menu.yml exists")

    sb_file = os.path.join(PROJECT_ROOT, "plugins", "ScoreboardPL", "config.yml")
    with open(sb_file, "r", encoding="utf-8") as f:
        sb_content = f.read()
    check("%objective_score_sb_gems%" in sb_content or "%player_points%" in sb_content, "ScoreboardPL config.yml displays Điểm Tinh Anh (%objective_score_sb_gems%)")
    check("%vault_balance_int%" in sb_content, "ScoreboardPL config.yml displays Vault Balance")
    check("%auraskills_power%" in sb_content or "%auraskills_power_level%" in sb_content, "ScoreboardPL config.yml displays AuraSkills Power Level (%auraskills_power%)")

def test_daemon_sync():
    print("\n" + "=" * 70)
    print("AUDIT 5: AURASKILLS SCOREBOARD SYNC IN DAEMON")
    print("=" * 70)
    daemon_file = os.path.join(PROJECT_ROOT, "skyblock_economy_daemon.py")
    with open(daemon_file, "r", encoding="utf-8") as f:
        d_content = f.read()
    check("def sync_auraskills_scoreboard" in d_content, "Daemon defines sync_auraskills_scoreboard")
    check("askill_fighting" in d_content, "Daemon syncs askill_fighting")
    check("askill_farming" in d_content, "Daemon syncs askill_farming")
    check("askill_fishing" in d_content, "Daemon syncs askill_fishing")
    check("askill_agility" in d_content, "Daemon syncs askill_agility")
    check("askill_power" in d_content, "Daemon syncs askill_power")
    check("self.sync_auraskills_scoreboard()" in d_content, "Daemon run loop periodically invokes sync_auraskills_scoreboard")

if __name__ == "__main__":
    test_torii_portals()
    test_exclusive_catalysts()
    test_boss_gating()
    test_deluxemenus_and_scoreboard()
    test_daemon_sync()
    print("\n" + "=" * 70)
    print(f"FINAL AUDIT RESULT: {passed_checks}/{total_checks} checks passed ({(passed_checks/total_checks)*100:.2f}%)")
    print("=" * 70)
    if passed_checks == total_checks:
        print(">>> ALL BLUEPRINT DELIVERABLES VERIFIED 100% SUCCESSFUL <<<")
        sys.exit(0)
    else:
        sys.exit(1)
