# Changes - Milestone M2: Boss Navigation Overhaul

## 1. Warp Files Created (`plugins/Essentials/warps/`)
- `boss1.yml`:
  - `world: world`, `x: -18.5`, `y: 111.0`, `z: 75.5`, `yaw: 90.0`, `pitch: 0.0`, `name: boss1`
  - Targets entrance to Spider Queen's Lair facing West into the cavern.
- `boss2.yml`:
  - `world: world`, `x: 18.5`, `y: 111.0`, `z: 75.5`, `yaw: -90.0`, `pitch: 0.0`, `name: boss2`
  - Targets entrance to Nether Executioner's Pit facing East into the lava chasm.
- `boss3.yml`:
  - `world: world`, `x: 0.5`, `y: 111.0`, `z: 101.5`, `yaw: 0.0`, `pitch: 0.0`, `name: boss3`
  - Targets entrance to Darkness Citadel facing South into the castle throne.
- `boss4.yml`:
  - `world: world`, `x: -25.5`, `y: 111.0`, `z: 102.5`, `yaw: 90.0`, `pitch: 0.0`, `name: boss4`
  - Targets entrance to Void Sanctuary facing West into the crystal grounds.

## 2. Command Aliases Updated (`commands.yml`)
- Added direct aliases and Vietnamese aliases for all 4 boss warps:
  - `boss1` & `dongnhen` -> `- warp boss1 $1-`
  - `boss2` & `vuclua` -> `- warp boss2 $1-`
  - `boss3` & `thanhtri` -> `- warp boss3 $1-`
  - `boss4` & `hukhong` -> `- warp boss4 $1-`

## 3. Interactive Boss Hunter Menu Created (`world/datapacks/skyblock_spawn/data/skyblock/function/boss/hunter_menu.mcfunction`)
- Comprehensive interactive `tellraw` menu displaying:
  - Boss 1: Động Nữ Hoàng Nhện (150 HP, drops Mảnh Quặng Cổ Đại) with clickEvent `/warp boss1`.
  - Boss 2: Vực Đao Phủ Địa Ngục (300 HP, drops Tinh Thể Cổ Đại) with clickEvent `/warp boss2`.
  - Boss 3: Thành Trì Chúa Tể Bóng Tối (600 HP, drops Trái Tim Của Quỷ) with clickEvent `/warp boss3`.
  - Boss 4: Thánh Địa Hư Không (1200 HP, drops Lõi Hư Không) with clickEvent `/warp boss4`.
  - Plays `minecraft:entity.experience_orb.pickup` sound on menu opening.

## 4. Multi-Boss Sanctuary Updated (`world/datapacks/skyblock_spawn/data/skyblock/function/build_boss_multi.mcfunction`)
- NPC "Thợ Săn Boss" summoned at Central Hall (`0.5 111 61.5`) with:
  - Villager tag `boss_hunter_npc` (Weaponsmith, Taiga, Level 5, facing North 180f).
  - Interaction entity `boss_hunter_interact` (`width: 1.2f, height: 1.9f, response: 1b`).
  - Hologram `boss_hunter_hologram` (`[ CLICK ĐỂ CHỌN BOSS ]`).
- Return Teleport Pads installed at all 4 boss arenas:
  - Arena 1: Command block at `-19 109 74` (`teleport @p 0.5 111.0 58.0 0.0 0.0`), pressure plate at `-19 110 74`, wall & sign at `-19 111..112 73`.
  - Arena 2: Command block at `18 109 74` (`teleport @p 0.5 111.0 58.0 0.0 0.0`), pressure plate at `18 110 74`, wall & sign at `18 111..112 73`.
  - Arena 3: Command block at `2 109 101` (`teleport @p 0.5 111.0 58.0 0.0 0.0`), pressure plate at `2 110 101`, wall & sign at `2 111..112 100`.
  - Arena 4: Command block at `-26 109 101` (`teleport @p 0.5 111.0 58.0 0.0 0.0`), pressure plate at `-26 110 101`, wall & sign at `-26 111..112 100`.
- 4 Dynamic Status Signs initialized at Central Hall gates (`Y=113`, `● SẴN SÀNG`):
  - Boss 1: `-13 113 60 oak_wall_sign[facing=east]`
  - Boss 2: `13 113 60 oak_wall_sign[facing=west]`
  - Boss 3: `-1 113 69 oak_wall_sign[facing=south]`
  - Boss 4: `-13 113 66 oak_wall_sign[facing=east]`

## 5. Event-Driven Dynamic Status Signs (`summon_boss_1..4.mcfunction` & `boss_1..4_defeated.mcfunction`)
- `summon_boss_1.mcfunction` .. `summon_boss_4.mcfunction`:
  - When boss spawns, sign updates to `☠ ĐANG CHIẾN ĐẤU` (red text, glowing).
- `boss_1_defeated.mcfunction` .. `boss_4_defeated.mcfunction`:
  - When boss is killed, sign returns to `● SẴN SÀNG` (green text, glowing).

## 6. Real-time Tick Handling (`world/datapacks/skyblock_spawn/data/skyblock/function/tick.mcfunction`)
- Boss Hunter NPC Click Handling:
  - Detects `interaction` entity `boss_hunter_interact` on target, runs `skyblock:boss/hunter_menu`, and removes interaction tag.
- Fail-Safe Return TP Area Checks:
  - Continuously checks bounding boxes around Return TP pads at all 4 arenas and safely teleports players to Central Hall (`0.5 111.0 58.0 0.0 0.0`) even in case of redstone lag:
    - Arena 1: `x=-19,y=110,z=74,dx=1,dy=2,dz=1`
    - Arena 2: `x=18,y=110,z=74,dx=1,dy=2,dz=1`
    - Arena 3: `x=2,y=110,z=101,dx=1,dy=2,dz=1`
    - Arena 4: `x=-26,y=110,z=101,dx=1,dy=2,dz=1`
