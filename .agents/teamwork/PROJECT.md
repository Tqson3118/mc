# Project: Skyblock Server Enhancement & Bug Fixes (Paper 1.21.4)

## Architecture
- **Server Platform**: Paper Minecraft 1.21.4 (Java 21, Windows x64), EssentialsX 2.22.0, Vault, IridiumSkyblock.
- **Custom RPG System**: Datapack `skyblock_spawn` (`world/datapacks/skyblock_spawn/data/skyblock/function/`).
  - Item Progression: 15 Tiers Evolution for Pickaxe, Axe, Sword, Armor (Helmet, Chestplate, Leggings, Boots), and Bow generated via `generate_all.py`.
  - Trading System: Villagers summoned with Minecraft 1.21.4 Data Components (`minecraft:custom_data`, `minecraft:enchantments`, `minecraft:custom_name`, `minecraft:lore`, `minecraft:unbreakable`).
  - Boss Arenas: 4 separate boss arenas (Spider Queen 150HP, Nether Executioner 300HP, Shadow Lord 600HP, Void Entity 1200HP) connected to Central Boss Sanctuary (`0.5, 111, 58`).
  - Newbie Onboarding: Spawn Hub interaction (`0.5, 121, 3.5`), Kit Tân Thủ, Paper `help.yml`.
- **Server Daemon & Scripts**:
  - `skyblock_economy_daemon.py`: Python daemon tailing `logs/latest.log` for chat commands (`/bankhoangsan`, `/cf`, `/xoso`, `/banexp`).
  - `Run-Server.bat`: Windows startup script with Aikar's Flags Java 21 G1GC.
  - `spigot.yml`: Watchdog crash recovery script and EXP orb merge radius.

## Feature Inventory
| # | Feature | Description | Milestone | Source |
|---|---------|-------------|-----------|--------|
| 1 | Progression Enforcement | All Tier 2-15 trades require Tier N-1 item in `buy` slot with exact components in `generate_all.py` | M1 | ORIGINAL_REQUEST §R1 |
| 2 | Armor 4-Slot Completeness | Expand all 4 armor slots across all 15 tiers in Villager trades | M1 | ORIGINAL_REQUEST §R1 |
| 3 | Trade Syntax Validity | Ensure 100% bracket and quote balance in `build_evolution_npc.mcfunction` passing `verify_syntax.py` | M1 | ORIGINAL_REQUEST §R1 |
| 4 | Boss Warp Files | Create 4 warp YAML files (`boss1`, `boss2`, `boss3`, `boss4`) in `plugins/Essentials/warps/` | M2 | ORIGINAL_REQUEST §R2 |
| 5 | Command Aliases for Bosses | Add `boss1`..`boss4` and Vietnamese aliases in `commands.yml` | M2 | ORIGINAL_REQUEST §R2 |
| 6 | Boss Hunter NPC & Tellraw | Summon NPC Thợ Săn Boss at `0.5 111 61.5` with interactive tellraw menu in `boss/hunter_menu.mcfunction` | M2 | ORIGINAL_REQUEST §R2 |
| 7 | Return Teleport Mechanism | 2-layer return TP (pressure plate command block + tick fail-safe) at all 4 arenas | M2 | ORIGINAL_REQUEST §R2 |
| 8 | Dynamic Boss Status Signs | Event-driven sign updates for ready / fighting states at Central Hall gates | M2 | ORIGINAL_REQUEST §R2 |
| 9 | Spigot Crash Restart Script | Set `settings.restart-script: Run-Server.bat` in `spigot.yml` | M3 | ORIGINAL_REQUEST §R3 |
| 10 | Spigot EXP Orb Merging | Set `world-settings.default.merge-radius.exp: 3.0` in `spigot.yml` | M3 | ORIGINAL_REQUEST §R3 |
| 11 | Java 21 Aikar's Flags | Configure standard Aikar's Flags for G1GC in `Run-Server.bat` | M3 | ORIGINAL_REQUEST §R3 |
| 12 | Essentials Kit Tân Thủ | Set `newbies.kit: tanthu` in `plugins/Essentials/config.yml` | M3 | ORIGINAL_REQUEST §R3 |
| 13 | Daemon Shared File Handle | Implement `open_log_shared` with `FILE_SHARE_DELETE` on Windows to avoid WinError 32 | M4 | ORIGINAL_REQUEST §R4 |
| 14 | Daemon Rotation & Truncation Detection | Detect `st_ino` change and `st_size < tell()` to reopen and reset file pointer | M4 | ORIGINAL_REQUEST §R4 |
| 15 | Guide NPC at Spawn Hub | Summon NPC Hướng Dẫn Viên at `0.5 121 3.5` with interactive tellraw menu in `guide/menu.mcfunction` | M5 | ORIGINAL_REQUEST §R5 |
| 16 | Paper Help System Overhaul | Populate `help.yml` with comprehensive topics (/is, /warp, /bankhoangsan, /tanthu, /daily, /boss, /ah, /nung...) | M5 | ORIGINAL_REQUEST §R5 |
| 17 | Comprehensive Verification & Gating | Full syntax checks, compilation tests, YAML parse validation, and Forensic Integrity Audit | M6 | ORIGINAL_REQUEST Acceptance Criteria |

## Milestones
| # | Name | Scope | Dependencies | Status |
|---|------|-------|-------------|--------|
| M1 | Progression Enforcement | `generate_all.py`, regenerate `build_evolution_npc.mcfunction`, verify `verify_syntax.py` | none | DONE |
| M2 | Boss Navigation Overhaul | `plugins/Essentials/warps/boss{1..4}.yml`, `commands.yml`, `build_boss_multi.mcfunction`, `hunter_menu.mcfunction`, return TP, status signs | none | DONE |
| M3 | Server Stability | `spigot.yml`, `Run-Server.bat`, `plugins/Essentials/config.yml` | none | DONE |
| M4 | Economy Daemon Reliability | `skyblock_economy_daemon.py` log rotation & truncation detection | none | DONE |
| M5 | Newbie Onboarding | `build_spawn.mcfunction`, `guide/menu.mcfunction`, `setup.mcfunction`, `tick.mcfunction`, `help.yml` | none | DONE |
| M6 | Comprehensive Verification & Auditing | Verify syntax, compile scripts, parse YAML, challenge edge cases, forensic integrity audit | M1, M2, M3, M4, M5 | DONE |

## Interface Contracts
### `generate_all.py` ↔ Minecraft Villager Trade
- `buy`: Exact item from Tier N-1 matching:
  - `id`: Base diamond/netherite/bow item ID
  - `count`: 1
  - `components`: `{ "minecraft:custom_name": '...', "minecraft:lore": [...], "minecraft:enchantments": {levels: {...}}, "minecraft:unbreakable": {show_in_tooltip: false}, "minecraft:custom_data": {ancient_*: 1b, tier: N-1, ...} }`
- `buyB`: Required upgrade material (prismarine shard, amethyst shard, fermented spider eye, echo shard, nether star)
- `sell`: Exact Tier N item with upgraded components.

### `commands.yml` ↔ Essentials Warps
- `/boss1` -> `/warp boss1` (teleport to `-18.5 111.0 75.5 90.0 0.0`)
- `/boss2` -> `/warp boss2` (teleport to `18.5 111.0 75.5 -90.0 0.0`)
- `/boss3` -> `/warp boss3` (teleport to `0.5 111.0 101.5 0.0 0.0`)
- `/boss4` -> `/warp boss4` (teleport to `-25.5 111.0 102.5 90.0 0.0`)

### `skyblock_economy_daemon.py` ↔ Paper `logs/latest.log`
- File Opening: Windows `CreateFileW` with `FILE_SHARE_READ | FILE_SHARE_WRITE | FILE_SHARE_DELETE`.
- Tail Loop: Check `os.stat(LOG_PATH)`. If `st.st_size < tell()` or `st.st_ino != current_ino`, close handle, reopen, seek to 0.

## Code Layout
- Root: `C:\Users\Administrator\.gemini\antigravity\scratch\Skyblock-Server`
- Python generator & scripts:
  - `generate_all.py`
  - `verify_syntax.py`
  - `skyblock_economy_daemon.py`
- Server configuration files:
  - `spigot.yml`
  - `Run-Server.bat`
  - `commands.yml`
  - `help.yml`
- Essentials configuration:
  - `plugins/Essentials/config.yml`
  - `plugins/Essentials/warps/` (`boss1.yml`, `boss2.yml`, `boss3.yml`, `boss4.yml`)
- Datapack functions:
  - `world/datapacks/skyblock_spawn/data/skyblock/function/`
    - `build_evolution_npc.mcfunction`
    - `build_boss_multi.mcfunction`
    - `build_spawn.mcfunction`
    - `tick.mcfunction`
    - `setup.mcfunction`
    - `boss/hunter_menu.mcfunction`
    - `boss/boss_1..4_defeated.mcfunction`
    - `summon_boss_1..4.mcfunction`
    - `guide/menu.mcfunction`
