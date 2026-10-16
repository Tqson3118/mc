# Summary of Changes — Milestone M5: Newbie Onboarding

## Overview
Milestone M5 enhances the newbie onboarding experience on Paper 1.21.4 Skyblock Server by implementing:
1. Spawn Hub Guide NPC with interaction entity and floating hologram.
2. An interactive tellraw guide menu with quick-access commands and a 6-step RPG progression roadmap.
3. Scoreboard trigger objective registration for `/huongdan` and `/guide`.
4. Continuous tick interaction handling and trigger processing in `tick.mcfunction` while preserving all existing gameplay logic.
5. Command aliases in `commands.yml` mapping `/huongdan` and `/guide` to `trigger huongdan`.
6. Complete Paper 1.21.4 `help.yml` populated with 18 comprehensive help topics.

---

## Detailed File Modifications

### 1. `world/datapacks/skyblock_spawn/data/skyblock/function/build_spawn.mcfunction`
- Appended summoning routine for NPC "Hướng Dẫn Viên Tân Thủ":
  - Cleaned up previous entities with tags `guide_npc`, `guide_interact`, `guide_hologram`.
  - Summoned Villager at `0.5 121 3.5` facing North (`180f, 0f`), librarian type, invulnerable, silent, NoAI.
  - Summoned Minecraft interaction entity (`guide_interact`) at `0.5 121 3.5` (width 1.2, height 1.9, response 1b).
  - Summoned floating Armor Stand hologram (`guide_hologram`) at `0.5 123.2 3.5` displaying `[ CLICK ĐỂ XEM HƯỚNG DẪN ]` in bold yellow text.

### 2. `world/datapacks/skyblock_spawn/data/skyblock/function/guide/menu.mcfunction` (New File)
- Created professional tellraw interactive menu:
  - Welcome banner and introduction.
  - Reward buttons: `[NHẬN QUÀ TÂN THỦ /TANTHU]`, `[NHẬN QUÀ HẰNG NGÀY /DAILY]`.
  - Utilities & Economy buttons: `[MỞ MENU ĐẢO /IS]`, `[BÁN KHOÁNG SẢN /BANKHOANGSAN]`, `[NUNG QUẶNG TỰ ĐỘNG /NUNG]`, `[SÀN ĐẤU GIÁ /AH]`.
  - Public warp buttons: `[SẢNH BOSS /BOSS]`, `[NÔNG TRẠI /WARP FARM]`, `[ĐẤU TRƯỜNG /WARP PVP]`, `[BẾN CÂU CÁ /WARP FISHING]`, `[KHU THƯƠNG GIA /WARP TRADE]`, `[MỞ HÒM BÁU /WARP CRATES]`.
  - 6-step RPG progression guide detailing Start -> Survival -> Economy -> Leveling -> Boss Hunting -> Ancient Gear Evolution (Tier 1-15).
  - Sound effect on trigger: `playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 1.0 1.2`.

### 3. `world/datapacks/skyblock_spawn/data/skyblock/function/setup.mcfunction`
- Added scoreboard trigger objective:
  `scoreboard objectives add huongdan trigger {"text":"Hướng Dẫn Tân Thủ","color":"gold"}`.

### 4. `world/datapacks/skyblock_spawn/data/skyblock/function/tick.mcfunction`
- Added interaction handler for `guide_interact`:
  - Executes `skyblock:guide/menu` as player on target.
  - Removes interaction data from the entity to allow repeated clicks.
- Added trigger listener for `huongdan`:
  - Enables `huongdan` trigger for `@a`.
  - Executes `skyblock:guide/menu` for players with score `1..`.
  - Resets `huongdan` score to `0`.
- Fully preserved all existing tick logic: boss hunter interaction, fail-safe return TP pads, ancient pickaxe explosive mining, ancient sword lifesteal/lightning, ancient axe treecapitator, and ancient armor buffs.

### 5. `commands.yml`
- Added aliases under `aliases:`:
  ```yaml
  huongdan:
  - trigger huongdan
  guide:
  - trigger huongdan
  ```
- Preserved all 77 existing aliases including boss aliases (`boss1`..`boss4`), `tanthu`, `daily`, `bankhoangsan`, etc. (Total aliases count: 79).

### 6. `help.yml`
- Overwrote empty 0-byte file with 18 comprehensive help topics:
  1. `HuongDan`: Overview of server and 4 core stages of gameplay.
  2. `Lenh`: Master summary of essential player commands.
  3. `is`: Island management commands (`/is create`, `/is go`, `/is level`, `/is team`, etc.).
  4. `warp`: Public warp system list.
  5. `boss`: Boss navigation, arena rewards, and return teleport pads.
  6. `bankhoangsan`: Ore selling mechanics and Vault economy credit.
  7. `tanthu`: Starter kit contents and cooldown.
  8. `daily`: Daily check-in rewards and cooldown.
  9. `ah`: Auction house and player ChestShop setup guide.
  10. `shop`: System store info.
  11. `nung`: Auto ore smelting utility (`/smelt`, `/nung`).
  12. `cauca`: Fishing pier, Emerald trade, and fishing rod upgrades.
  13. `pvp`: 1v1 arena and team siege fortress.
  14. `trade`: Merchant bazaar and Ancient Blacksmiths (Tier 1-15).
  15. `farm`: Mob farm and agricultural zone for EXP grinding.
  16. `crates`: Neon loot crate opening and keys.
  17. `casino`: Gambling mini-games (`/cf`, `/xoso`).
  18. `banexp`: EXP level selling and bottling (`/banexp`, `/bottle`).

---

## Verification Results
- `yaml.safe_load("help.yml")`: PASS (18 topics parsed, shortText & fullText verified).
- `yaml.safe_load("commands.yml")`: PASS (79 aliases verified, huongdan and guide registered).
- `verify_syntax.py`: PASS (0 errors across mcfunction files).
- `test_m5.py`: PASS (100% bracket and quote balance across all core and M5 mcfunctions).
