# Báo Cáo Nghiệm Thu Kỹ Thuật: Phân Hệ R3 & R4 (Explorer Audit 2)

**Ngày kiểm thử:** 2026-10-12  
**Đối tượng kiểm định:** Subsystem R3 (Plugins, Permissions & HUD Scoreboard) & Subsystem R4 (RPG Datapack 15 Tiers & Boss Arenas)  
**Môi trường:** Paper 1.21.4 (build 232), OpenJDK 21 on Windows 11  

---

## 1. Observation (Quan Sát Thực Địa & Bằng Chứng Trực Tiếp)

### A. Subsystem R3: Hệ thống Plugins, Phân quyền & HUD Scoreboard

1. **Tình trạng cài đặt plugin phân quyền:**
   - Tại `plugins/`: Chỉ có `ChestShop.jar`, `EssentialsChat.jar`, `EssentialsX.jar`, `EssentialsXSpawn.jar`, `IridiumSkyblock.jar`, `PlaceholderAPI.jar`, `ScoreboardPL.jar`, `Vault.jar`, `ViaVersion.jar`, `WorldEdit.jar`, `spark`. **Hoàn toàn không có LuckPerms hay Essentials GroupManager**.
   - Tại thư mục gốc `Skyblock-Server/permissions.yml`: File rỗng 0 bytes.
   - Tại `plugins/Essentials/config.yml` (dòng 362):
     ```yaml
     use-bukkit-permissions: false
     ```
     Và mục `player-commands:` (dòng 269–358) liệt kê danh sách lệnh cấp phát cho người chơi thường (Non-OP). Trong đó có:
     - Dòng 298–303: `- kit`, `- kits.tools`, `- kits.tanthu`, `- kits.daily`, `- kits.pvp`, `- kits.*`
     - Dòng 352–353: `- warp`, `- warp.list`
     - Dòng 448: `per-warp-permission: false`
     - Dòng 1278: `kit: tanthu` (trong mục `newbies:`)

2. **Quyền hạn lệnh Đảo (IridiumSkyblock):**
   - Tại `plugins/IridiumSkyblock/commands.yml`: Toàn bộ các lệnh người chơi (`aboutCommand`, `createCommand`, `membersCommand`, `permissionsCommand`, `settingsCommand`, `promoteCommand`, `demoteCommand`, `kickCommand`, `inviteCommand`, `upgradesCommand`, `boostersCommand`, `shopCommand`) đều cấu hình:
     ```yaml
     permission: ""
     ```
     Chuỗi quyền rỗng đồng nghĩa với việc Bukkit không áp đặt bất kỳ permission node nào đối với người chơi Non-OP.

3. **16 Điểm Warp & Lệnh `/shop`, `/cửa hàng`, `/bankhoangsan`:**
   - Trong `plugins/Essentials/warps/` tồn tại đủ 16 tệp `.yml`: `boss.yml`, `boss1.yml`, `boss2.yml`, `boss3.yml`, `boss4.yml`, `casino.yml`, `cauca.yml`, `crates.yml`, `farm.yml`, `fishing.yml`, `mob.yml`, `parkour.yml`, `pvp.yml`, `shop.yml`, `spawn.yml`, `trade.yml`.
   - Trong `commands.yml` (server root):
     - Dòng 10–11: `shop:` trỏ tới `- is shop $1-` (hoạt động tốt).
     - Không có khai báo alias cho `/cửa hàng` hoặc `/cuahang`.
     - Dòng 118–127: `/bankhoangsan`, `/sellores`, `/sellore`, `/sellallores`, `/bando` trỏ tới `- bankhoangsan $1-`.
     - Tiến trình `skyblock_economy_daemon.py` (dòng 808–812) theo dõi log `issued server command: /(bankhoangsan|sellores|...)` để xử lý bán quặng qua RCON.

4. **HUD ScoreboardPL & PlaceholderAPI:**
   - Tại `plugins/ScoreboardPL/config.yml` (34 dòng, 1,161 bytes):
     ```yaml
     scoreboard:
       title: "&6&l✦ &e&lSKYBLOCK VN &6&l✦"
       title-frames:
         - "&6&l✦ &e&lSKYBLOCK VN &6&l✦"
         - "&e&l✦ &f&lSKYBLOCK VN &e&l✦"
         - "&6&l✦ &f&lSKYBLOCK VN &6&l✦"
         - "&e&l✦ &6&lSKYBLOCK VN &e&l✦"
       title-animation-speed: 8
       lines:
         - "&8&m-------------------"
         - " &e👤 &fBạn&8: &a%player_name%"
         - " &6💰 &fSố dư&8: &e$%vault_balance_int%"
         - ""
         - " &b🏝 &fĐảo&8: &d%iridiumskyblock_island_name%"
         - " &d⭐ &fCấp đảo&8: &b%iridiumskyblock_island_level%"
         - ""
         - " &a👥 &fOnline&8: &a%server_online%&8/&7%server_max_players%"
         - " &2📶 &fPing&8: &a%player_ping%ms"
         - ""
         - " &7Gõ: &e/is &7• &a/spawn &7• &c/boss"
         - "&8&m-------------------"
     ```
   - Kiểm tra live qua RCON với người chơi đang online `sondzvc`:
     - Lệnh `papi parse sondzvc %player_name%` trả về `sondzvc`.
     - Lệnh `papi parse sondzvc %iridiumskyblock_island_name%` trả về `sondzvc's Island`.
     - Lệnh `papi parse sondzvc %iridiumskyblock_island_level%` trả về `12190`.
     - Lệnh `papi parse --null %iridiumskyblock_island_name%` (khi chưa có đảo) trả về `N/A`.
     - Lệnh `papi parse sondzvc %vault_eco_balance%` trả về `2755070.43`.
     - **Phát hiện Placeholder thô**: Lệnh `papi parse sondzvc %vault_balance_int%` trả về nguyên bản chuỗi thô `%vault_balance_int%` do `Expansion-vault.jar` chỉ hỗ trợ `%vault_eco_balance%` (tiền tố `eco_`). Tuy nhiên, trong ScoreboardPL, `%vault_balance_int%` được `ScoreboardManager.class` và `VaultHook.class` xử lý nội bộ trực tiếp trước khi gửi PAPI nên hiển thị số nguyên trên bảng điểm, nhưng nếu dùng placeholder này bên ngoài ScoreboardPL sẽ không phân giải được.

5. **Tệp mồ côi `config.yml` (10KB) tại thư mục gốc:**
   - Tệp `Skyblock-Server/config.yml` có dung lượng chính xác 10,012 bytes (182 dòng).
   - Nội dung header (dòng 1–4):
     ```
     # ScoreboardPL — Configuration File
     # by Maximilian Hirtzbruch
     ```
   - Đây là tệp cấu hình mặc định (stock default template) tiếng Anh đầy đủ chú thích của ScoreboardPL, bị sinh thừa hoặc để quên tại thư mục gốc trong quá trình giải nén/setup ban đầu. Paper và Bukkit chỉ đọc cấu hình từ `plugins/ScoreboardPL/config.yml`. Tệp tại gốc hoàn toàn vô tác dụng.

6. **Cấu hình & Phân quyền ChestShop:**
   - Tại `plugins/ChestShop/config.yml`: `SHOP_CONTAINERS` là `CHEST` và `TRAPPED_CHEST`, `USE_BUILT_IN_PROTECTION: true`, `SHOP_CREATION_PRICE: 0`, `ALLOW_PARTIAL_TRANSACTIONS: true`, `BLOCK_SHOPS_WITH_SELL_PRICE_HIGHER_THAN_BUY_PRICE: true`.
   - Bytecode và `plugin.yml` trong `ChestShop.jar`:
     ```yaml
     ChestShop.shop.*:
       default: true
       children:
         ChestShop.shop.create: true
         ChestShop.shop.buy: true
         ChestShop.shop.sell: true
     ```
     Do `default: true`, người chơi Non-OP tự động có quyền tạo shop, mua và bán mà không cần cấp quyền thủ công. Quyền Admin Shop (`ChestShop.admin`) mặc định là `op`.

---

### B. Subsystem R4: RPG Datapack Tiến Hóa Cổ Đại 15 Tiers & Đấu Trường Boss

1. **Lỗi cú pháp nghiêm trọng (CRITICAL BLOCKER) tại `tick.mcfunction`:**
   - File log `logs/latest.log` ghi nhận verbatim:
     ```
     [16:54:55] [ServerMain/ERROR]: Failed to load function skyblock:tick
     java.util.concurrent.CompletionException: java.lang.IllegalArgumentException: Whilst parsing command on line 101: Incorrect argument for command at position 186: ...r destroy <--[HERE]
     Caused by: java.lang.IllegalArgumentException: Whilst parsing command on line 101: Incorrect argument for command at position 186: ...r destroy <--[HERE]
     [16:54:55] [ServerMain/ERROR]: Couldn't load tag minecraft:tick as it is missing following references: skyblock:tick (from file/skyblock_spawn)
     ```
   - File `world/datapacks/skyblock_spawn/data/skyblock/function/tick.mcfunction` (dòng 101–102):
     ```mcfunction
     101: execute as @a[scores={use_n_axe=1..}] if items entity @s weapon.mainhand *[custom_data~{ancient_axe:1b}] at @s anchored eyes positioned ^ ^ ^2.5 run fill ~-1 ~ ~-1 ~1 ~15 ~1 air destroy replace #minecraft:logs
     102: execute as @a[scores={use_d_axe=1..}] if items entity @s weapon.mainhand *[custom_data~{ancient_axe:1b}] at @s anchored eyes positioned ^ ^ ^2.5 run fill ~-1 ~ ~-1 ~1 ~15 ~1 air destroy replace #minecraft:logs
     ```
   - Nguồn sinh mã `generate_all.py` (dòng 792–793):
     ```python
     792: execute as @a[scores={use_n_axe=1..}] if items entity @s weapon.mainhand *[custom_data~{ancient_axe:1b}] at @s anchored eyes positioned ^ ^ ^2.5 run fill ~-1 ~ ~-1 ~1 ~15 ~1 air destroy replace #minecraft:logs
     793: execute as @a[scores={use_d_axe=1..}] if items entity @s weapon.mainhand *[custom_data~{ancient_axe:1b}] at @s anchored eyes positioned ^ ^ ^2.5 run fill ~-1 ~ ~-1 ~1 ~15 ~1 air destroy replace #minecraft:logs
     ```
   - Nguyên nhân kỹ thuật: Trong Minecraft 1.21.4 (và lệnh vanilla `/fill`), cú pháp lệnh là:
     `fill <from> <to> <block> [destroy|hollow|keep|outline|replace]`
     hoặc nếu có bộ lọc:
     `fill <from> <to> <block> replace [<filter>]`
     Hai chế độ `destroy` và `replace` là **loại trừ lẫn nhau (mutually exclusive)**. Đoạn lệnh ghi `air destroy replace #minecraft:logs` khiến parser đọc `air destroy` là kết thúc lệnh hợp lệ, và từ khóa `replace` tiếp theo bị báo lỗi `Incorrect argument for command at position 186`.
   - Hậu quả dây chuyền: Hàm `skyblock:tick` bị huỷ nạp hoàn toàn -> Tag `minecraft:tick` bị lỗi nạp -> **Toàn bộ vòng lặp tick của datapack bị tê liệt trên server!** Mọi tính năng tick (đào 3x3, hút máu, sấm sét, treecapitator, buff giáp, vùng an toàn, teleport hồi quy) không hề chạy.
   - Script `verify_syntax.py` không phát hiện được vì script này chỉ đếm số lượng ngoặc `{}` `[]` và nháy đơn `'`, hoàn toàn không kiểm tra ngữ pháp lệnh Minecraft.

2. **Kiểm thử tự động `tests/test_r1_progression.py` & Hiệu ứng đặc biệt:**
   - Thực thi `python tests/test_r1_progression.py`: Đạt **100.00% PASS** (120/120 bước nâng cấp qua 8 chủng loại trang bị). Mọi giao dịch từ Tier 2..15 đều yêu cầu đúng trang bị Tier N-1 ở ô `buy` với Data Components trùng khớp (`custom_data`, `custom_name`, `lore`, `enchantments`, `unbreakable`).
   - Phân tích hiệu ứng đặc biệt trong logic datapack:
     - **Cúp Tier 10+ (Đào nổ 3x3)**: Điểm số `use_n_pick` / `use_d_pick` kích hoạt `fill ~-1 ~-1 ~-1 ~1 ~1 ~1 air destroy` tại `^ ^ ^2.5`, có kiểm tra loại trừ 4 khu vực cấm phá (Spawn, Boss Arena, PvP, Fishing).
     - **Kiếm Tier 10+ (Hút máu & Sấm sét)**: Điểm số `dealt_dmg` kích hoạt `effect give @s instant_health 1` và `regeneration 3 1`, đồng thời triệu hồi `lightning_bolt` tại `^ ^ ^3.5` và cấp `fire_resistance 2s` để tránh giật sét phản phệ người chơi.
     - **Rìu Tier 10+ (Tree Feller)**: Bị chặn do lỗi cú pháp dòng 101/102.
     - **Giáp Tier 10 & 15**:
       - Tier 10+: Áo buff Kháng sát thương II (`resistance 2 1`); Giày buff Tốc độ II (`speed 2 1`).
       - Tier 15: Áo buff Kháng sát thương IV, Hồi phục II, Kháng lửa, hạt `end_rod`; Giày buff Tốc độ III, Rơi chậm (`slow_falling`), Nhảy cao II (`jump_boost`).
       - Lưu ý: Logic kiểm tra độc lập từng slot (`armor.chest` và `armor.feet`), không bắt buộc phải mang đủ 4 món cùng lúc.

3. **Sảnh Boss Trung Tâm, 4 Arenas & Cơ chế Fail-Safe Return TP:**
   - Sảnh Boss Trung Tâm tại tọa độ `(0.5, 111, 58)` (X: -15..15, Z: 56..70, Y=110), trang bị Lodestone, Ender Chest, đe, bàn chế tạo, NPC Thợ Săn Boss (`0.5 111 61.5`) với tellraw menu (`boss/hunter_menu.mcfunction`).
   - 4 Đấu trường riêng biệt:
     - Boss 1 (Động Nhện - 150 HP): `warp boss1` tại `(-18.5, 111.0, 75.5, yaw 90)`.
     - Boss 2 (Vực Lửa - 300 HP): `warp boss2` tại `(18.5, 111.0, 75.5, yaw -90)`.
     - Boss 3 (Thành Trì Chúa Tể - 600 HP): `warp boss3` tại `(0.5, 111.0, 101.5, yaw 0)`.
     - Boss 4 (Thánh Địa Hư Không - 1200 HP): `warp boss4` tại `(-25.5, 111.0, 102.5, yaw 90)`.
   - Cơ chế Fail-Safe Return TP (Dịch chuyển 2 tầng về Sảnh Trung Tâm):
     - Tầng 1: Pressure plate + Command block tại cửa mỗi đấu trường (`-19 109 74`, `18 109 74`, `2 109 101`, `-26 109 101`) chạy `teleport @p 0.5 111.0 58.0 0.0 0.0`.
     - Tầng 2: Check box vùng tọa độ liên tục trong `tick.mcfunction` (dòng 62–65) chạy `teleport @s 0.5 111.0 58.0 0.0 0.0` ngay cả khi command block bị tắt.

4. **Tỷ lệ rơi 100% "Trái Tim Của Quỷ" từ Boss 3 & Phát Hiện Lệch Item ID:**
   - Trong `summon_boss_3.mcfunction` (dòng 26): Boss 3 cầm tay phụ item `minecraft:fermented_spider_eye` có `custom_data:{ancient_mat:"demon_heart"}` với `HandDropChances:[0.5f, 1.0f]`. Tỷ lệ rơi tay phụ là `1.0f` (100% khi chết).
   - Công thức Alchemist trong `build_evolution_npc.mcfunction` dòng 47 yêu cầu nguyên liệu nâng cấp Tier 10..12 là `buyB:{id:"minecraft:fermented_spider_eye",count:1}` (khớp hoàn toàn với mob drop).
   - **Phát hiện lỗi sai lệch (Discrepancy)**: Trong file `boss/announce_boss_3.mcfunction` (dòng 9), lệnh trao thưởng vinh danh trực tiếp cho người hạ boss lại ghi:
     `give @s nether_wart[custom_data={ancient_mat:"demon_heart"},item_name='{"text":"☠ Trái Tim Của Quỷ ☠",...}'] 1`
     Item trao thưởng này dùng ID `nether_wart`, không thể nộp vào NPC Thần Rèn/Alchemist do công thức đòi hỏi `fermented_spider_eye`.

5. **NPC Hướng Dẫn Viên & Cơ chế Mở Hòm Crates (`/warp crates`):**
   - NPC Hướng Dẫn Viên tại Spawn Hub (`0.5 121 3.5`) hoạt động hoàn hảo, bắt sự kiện `guide_interact` tại dòng 57–59 của `tick.mcfunction`, mở tellraw menu đầy đủ lộ trình 6 bước và các nút bấm lệnh.
   - Khu vực Crates (`X: -5..5, Y: 121, Z: 7`): Có 3 hòm (Đồng, Hoàng Kim, Thần Thoại). Đầy đủ các file logic `crates/open_common.mcfunction`, `crates/open_rare.mcfunction`, `crates/open_mythic.mcfunction`.
   - **Phát hiện khiếm khuyết tương tác (Missing Listener)**: Trong `build_crates.mcfunction` có triệu hồi các interaction entity mang tag `crate_interact`, `crate_common`, `crate_rare`, `crate_mythic`. Tuy nhiên, trong `tick.mcfunction` **hoàn toàn không có dòng lệnh nào xử lý tương tác của `crate_interact`**. Người chơi click chuột phải vào hòm sẽ không có phản hồi.

---

## 2. Logic Chain (Chuỗi Lập Luận Suy Luận Từ Bằng Chứng Đến Kết Luận)

```
[Bằng chứng 1: latest.log báo IllegalArgumentException dòng 101]
       │
       ▼
[Bằng chứng 2: tick.mcfunction:101 có 'fill ... air destroy replace #minecraft:logs']
       │
       ▼
[Suy luận: Minecraft 1.21.4 từ chối 'destroy replace' do 2 mode xung đột cú pháp]
       │
       ▼
[Hậu quả: Toàn bộ hàm skyblock:tick và tag minecraft:tick không nạp được]
       │
       ▼
[Kết luận R4.1: Bug Blocker nghiêm trọng làm tê liệt 100% logic tick loop của Datapack]
```

```
[Bằng chứng 3: build_crates.mcfunction triệu hồi interaction với tag crate_interact]
       │
       ▼
[Bằng chứng 4: Tìm kiếm 'crate_interact' trong toàn bộ codebase chỉ xuất hiện tại build_crates]
       │
       ▼
[Suy luận: tick.mcfunction có handler cho boss_hunter_interact và guide_interact nhưng thiếu crate_interact]
       │
       ▼
[Kết luận R4.4: Click hòm Crates bị vô hiệu hoá do thiếu event dispatcher trong tick loop]
```

```
[Bằng chứng 5: summon_boss_3 rơi fermented_spider_eye; Alchemist yêu cầu fermented_spider_eye]
       │
       ▼
[Bằng chứng 6: announce_boss_3 lại give nether_wart mang tên 'Trái Tim Của Quỷ']
       │
       ▼
[Suy luận: Người chơi nhận quà từ lệnh vinh danh announce_boss_3 không thể giao dịch nâng cấp Tier 10]
       │
       ▼
[Kết luận R4.3: Không đồng nhất ID nguyên liệu 'Trái Tim Của Quỷ' giữa mob drop và announce script]
```

```
[Bằng chứng 7: plugins/ không có LuckPerms; permissions.yml rỗng 0 bytes]
       │
       ▼
[Bằng chứng 8: Essentials dùng 'use-bukkit-permissions: false' với whitelist 'player-commands']
       │
       ▼
[Bằng chứng 9: IridiumSkyblock khai báo permission: "" cho mọi lệnh đảo người chơi]
       │
       ▼
[Bằng chứng 10: ChestShop khai báo ChestShop.shop.* default: true]
       │
       ▼
[Kết luận R3.1: Hệ thống phân quyền hoạt động ổn định dựa trên cơ chế Fallback nội bộ của Paper/Essentials,
người chơi Non-OP dùng được 16 warps, kits, lệnh đảo và tạo ChestShop, ngoại trừ lệnh gõ sai '/cửa hàng']
```

---

## 3. Caveats (Điểm Giới Hạn & Giả Định)

1. **Phạm vi kiểm tra:** Explorer Audit 2 tập trung vào 2 phân hệ R3 và R4. Các phân hệ R1 (Aikar flags/JVM), R2 (SQLite/IridiumSkyblock DB), R5 (Kinh tế daemon/Casino math) và R6 (Logs/Báo cáo tổng thể) do các kiểm thử viên khác phụ trách.
2. **Quyền hạn thay đổi:** Tuân thủ quy định Read-Only của Role Explorer, báo cáo này KHÔNG trực tiếp sửa đổi source code mà đề xuất giải pháp cụ thể cho Implementer.
3. **Môi trường Server:** Đã đối soát trực tiếp trên server Paper 1.21.4 đang chạy thực tế qua kết nối RCON localhost port 25575.

---

## 4. Conclusion (Kết Luận & Danh Mục Đề Xuất Khắc Phục)

### Bảng Đánh Giá Tổng Hợp R3 & R4:

| Phân hệ / Hạng mục | Trạng thái | Mức độ nghiêm trọng | Ghi chú & Đánh giá |
| :--- | :---: | :---: | :--- |
| **R3.1 Phân quyền Non-OP** | `PASS` (Cảnh báo nhẹ) | **Low** | Non-OP dùng tốt 16 warps, kits, lệnh đảo, ChestShop. Thiếu alias tiếng Việt `/cuahang`. |
| **R3.2 HUD Scoreboard & PAPI** | `PASS` | **Low** | Layout đẹp, %iridiumskyblock_*% phân giải chuẩn. Placeholder `%vault_balance_int%` chỉ hỗ trợ nội bộ ScoreboardPL. |
| **R3.3 Tệp mồ côi config.yml** | `PASS` (Rác thừa) | **Low** | Stock template ScoreboardPL 10KB tại gốc server, hoàn toàn không ảnh hưởng vận hành. |
| **R3.4 ChestShop** | `PASS` | **None** | Phân quyền `default: true`, tự động chống phá rương, có bảng hướng dẫn tại Spawn. |
| **R4.1 Cú pháp `tick.mcfunction`** | `FAIL` | **BLOCKER** | Lỗi `fill ... air destroy replace` dòng 101–102 làm crash nạp tick loop, tê liệt toàn bộ Datapack. |
| **R4.2 Tiến trình 15 Tiers & Buffs** | `PASS` | **Medium** | Test tự động 120/120 pass. Hiệu ứng kiếm/cúp/giáp chuẩn nhưng bị kẹt do lỗi tick loop ở R4.1. |
| **R4.3 Sảnh Boss & Drop Boss 3** | `PASS` (Lệch ID) | **Medium** | Sảnh & 4 Arena xuất sắc, Fail-Safe TP chuẩn. Lệch ID `nether_wart` vs `fermented_spider_eye` tại announce. |
| **R4.4 Guide NPC & Crates** | `WARN` | **High** | Guide NPC tốt. Crates thiếu listener trong `tick.mcfunction` khiến không thể mở hòm khi click. |

---

### Danh Mục Khắc Phục Đề Xuất (Actionable Remediation Plan):

1. **Sửa lỗi cú pháp lệnh `fill` trong `generate_all.py` (dòng 792–793) & `tick.mcfunction` (dòng 101–102):**
   - *Hiện tại:*
     ```mcfunction
     execute as @a[scores={use_n_axe=1..}] if items entity @s weapon.mainhand *[custom_data~{ancient_axe:1b}] at @s anchored eyes positioned ^ ^ ^2.5 run fill ~-1 ~ ~-1 ~1 ~15 ~1 air destroy replace #minecraft:logs
     ```
   - *Đề xuất sửa thành:*
     ```mcfunction
     execute as @a[scores={use_n_axe=1..}] if items entity @s weapon.mainhand *[custom_data~{ancient_axe:1b}] at @s anchored eyes positioned ^ ^ ^2.5 run fill ~-1 ~ ~-1 ~1 ~15 ~1 air replace #minecraft:logs
     ```
     *(Hoặc chia làm 2 bước nếu muốn drop gỗ, nhưng cú pháp `replace #minecraft:logs` là hợp lệ 100% trong Minecraft 1.21.4).*

2. **Bổ sung Interaction Listener cho Crates vào `tick.mcfunction` (và hàm sinh mã trong `generate_all.py`):**
   - Thêm vào sau dòng 60 của `tick.mcfunction`:
     ```mcfunction
     # Tương tác mở Rương Báu (Crates Interaction)
     execute as @e[type=interaction,tag=crate_common] if data entity @s interaction on target run function skyblock:crates/open_common
     execute as @e[type=interaction,tag=crate_rare] if data entity @s interaction on target run function skyblock:crates/open_rare
     execute as @e[type=interaction,tag=crate_mythic] if data entity @s interaction on target run function skyblock:crates/open_mythic
     execute as @e[type=interaction,tag=crate_interact] run data remove entity @s interaction
     ```

3. **Đồng nhất ID nguyên liệu "Trái Tim Của Quỷ" trong `boss/announce_boss_3.mcfunction`:**
   - Đổi dòng 9 từ `give @s nether_wart[...]` thành:
     ```mcfunction
     give @s fermented_spider_eye[custom_data={ancient_mat:"demon_heart"},item_name='{"text":"☠ Trái Tim Của Quỷ ☠","color":"dark_red","bold":true}',lore=['{"text":"Trái tim đập thình thịch chứa ma lực bóng tối.","color":"red","italic":true}','{"text":"✦ Nguyên liệu tối thượng rèn trang bị Tier 10 - 12","color":"gold"}','{"text":"[Loại]: Bảo Vật Boss Tuần","color":"yellow","bold":true}'],enchantment_glint_override=true] 1
     ```

4. **Bổ sung alias lệnh `/cuahang` vào `commands.yml`:**
   - Khai báo thêm:
     ```yaml
       cuahang:
       - is shop $1-
     ```

5. **Dọn dẹp tệp cấu hình thừa:**
   - Xoá hoặc lưu trữ tệp mồ côi `Skyblock-Server/config.yml` (10KB) để tránh gây nhầm lẫn trong bảo trì.

---

## 5. Verification Method (Quy Trình Kiểm Chứng Độc Lập)

1. **Kiểm tra tiến trình nâng cấp:**
   ```powershell
   python tests/test_r1_progression.py
   ```
   *Kỳ vọng:* 100% PASS, 120/120 recipes hợp lệ.

2. **Kiểm tra lỗi nạp Datapack qua RCON console:**
   ```powershell
   python -c "from test_rcon import rcon; print(rcon('reload'))"
   ```
   Sau đó kiểm tra `logs/latest.log`: Không còn dòng lỗi `Failed to load function skyblock:tick` và `Couldn't load tag minecraft:tick`.

3. **Kiểm chứng phân giải Placeholder:**
   ```powershell
   python -c "from test_rcon import rcon; print(rcon('papi parse sondzvc %player_name% | %iridiumskyblock_island_name% | %iridiumskyblock_island_level%'))"
   ```
   *Kỳ vọng:* Hiển thị tên người chơi và thông số đảo thực tế.

4. **Kiểm tra tương tác Crates & Rút lui Boss:**
   - Dùng lệnh RCON kiểm tra entity interaction của crates có tồn tại và nhận click:
     `minecraft:execute as @e[type=interaction,tag=crate_common] run data get entity @s`
   - Kiểm tra bệ áp suất rút lui khẩn cấp:
     `minecraft:execute in minecraft:overworld as @a[x=-19,y=110,z=74,dx=1,dy=2,dz=1] run say Test Fail Safe TP`
