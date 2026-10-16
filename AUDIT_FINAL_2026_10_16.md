# 📋 BÁO CÁO TOÀN DIỆN & ĐIỀU TRA ĐỘC LẬP HỆ THỐNG SKYBLOCK PAPER 1.21.4
**Mã tài liệu:** `AUDIT_FINAL_2026_10_16.md`  
**Ngày thực hiện:** 16/10/2026  
**Môi trường:** Paper 1.21.4 (Java 21.0.12) | RCON Port 25575 | Daemon v3.0 | Headless Bot Client  
**Chế độ:** Điều tra thực tế độc lập (Investigation Mode - Zero Source Alteration)  

---

## I. TỔNG QUAN ĐIỀU TRA & ĐÁNH GIÁ THỰC TRẠNG (EXECUTIVE SUMMARY)

Trước đó, các báo cáo `MASTER_ACCEPTANCE_AUDIT.md` và `MASTER_BOT_ACCEPTANCE_REPORT.md` đã công bố "100% PASS TIÊU CHUẨN NGHIỆM THU". Tuy nhiên, qua quá trình rà soát độc lập bằng công cụ tĩnh (`verify_syntax.py`, rà soát code các generator Python, kiểm tra cấu hình WorldGuard, DeluxeMenus, ScoreboardPL) và kiểm chứng động qua RCON cùng client headless bot (`Tester_Bot`), chúng tôi phát hiện kết luận "100% PASS" trước đây là **hoàn toàn sai lệch và che giấu nhiều lỗi chí mạng (fatal defects)**.

Thực tế hệ thống hiện tại đang gặp các vấn đề nghiêm trọng:
1. **24 lỗi cú pháp** trong 6 file `.mcfunction` khiến server Paper từ chối tải chức năng (`Failed to load function`).
2. **Kẹt điểm Spawn**: Người chơi mới đăng nhập bị ngạt thở trong khối gỗ và bị cơ chế safe-spawn đẩy lên độ cao Y=167 (nóc tán cây Cổ Thụ Yggdrasil) thay vì Y=122.
3. **Mất kết nối hoàn toàn Boss 5 & Boss 6**: Đấu trường Boss 5 & 6 nằm tại `world_boss`, nhưng datapack lại triệu hồi và trao thưởng tại tọa độ `overworld`. Đánh bại boss tại `world_boss` **hoàn toàn không nhận được báu vật/thưởng**.
4. **Xung đột lệnh `/scoreboard`**: Plugin `ScoreboardPL` đã chiếm quyền điều khiển lệnh `/scoreboard`, khiến toàn bộ tiến trình đồng bộ cấp kỹ năng từ `skyblock_economy_daemon.py` sang scoreboard bị nuốt chửng, vĩnh viễn khóa người chơi trước cửa 6 Đấu trường Boss (`askill_fighting = 0`).
5. **Khóa chặt việc thu hoạch nông sản**: WorldGuard tại `world_farm` đặt cờ `block-break: deny` trên toàn bộ thế giới mà không có vùng con cho ruộng lúa, khiến người chơi thường không thể đập lúa/cà rốt/khoai tây.
6. **Lỗi font hiển thị**: Ký tự emoji 4-byte UTF-8 bị biến thành ô vuông hỏng `` trên client Minecraft 1.21.4.

---

## II. BẢNG PHÂN LOẠI & THỐNG KÊ CHI TIẾT (DEFECT MATRIX)

| Phân loại | Số lượng | Mức độ nghiêm trọng | Tác động chính |
| :--- | :---: | :---: | :--- |
| **BROKEN** | 8 | **Chí mạng (Fatal)** | Server load error, kẹt spawn, mất kết nối boss, liệt đồng bộ kỹ năng, liệt nông trại. |
| **MISSING** | 3 | **Nghiêm trọng (High)** | Thiếu Sách hướng dẫn tân thủ tương tác, thiếu drop nguyên liệu câu cá & quái dungeon. |
| **UGLY** | 5 | **Trung bình (Medium)** | Đấu trường trụ hình học thô ráp, cầu xích 1 block lơ lửng, lỗi font ``, lệch lore Tier 20 vs 15. |
| **DEAD_TECH**| 5 | **Thấp (Low / Tech Debt)** | Thư mục lồng nhau, menu/warp trùng lặp, config rác tại root, generator cũ đè hub. |

---

## III. CHI TIẾT ĐIỀU TRA TỪNG HẠNG MỤC

### 1. NHÓM VẤN ĐỀ CHÍ MẠNG (BROKEN)

#### 1.1. 24 Lỗi Cú Pháp Datapack Khiến Paper Từ Chối Load Function
- **Vị trí phát hiện:**
  - `world/datapacks/skyblock_spawn/data/skyblock/function/boss/announce_boss_5.mcfunction` (dòng 4-9)
  - `world/datapacks/skyblock_spawn/data/skyblock/function/boss/announce_boss_6.mcfunction` (dòng 4-9)
  - `world/datapacks/skyblock_spawn/data/skyblock/function/boss/hunter_menu.mcfunction` (dòng 4-19)
  - `world/datapacks/skyblock_spawn/data/skyblock/function/build_ore_generator.mcfunction` (dòng 89-94)
  - `world/datapacks/skyblock_spawn/data/skyblock/function/builder/build_dragonforge.mcfunction` (dòng 50-52)
  - `world/datapacks/skyblock_spawn/data/skyblock/function/builder/build_palace.mcfunction` (dòng 66-68 và dòng 22)
- **Bằng chứng code thực tế:**
  Tại `build_palace.mcfunction:22`:
  ```mcfunction
  # 2. 8 Đại Trụ Thạch Anh Khảm Vàng Hoàng Gia (Y=1..7)
  for_coords = [("-7","4"),("7","4"),("-7","18"),("7","18"),("-7","11"),("7","11"),("-3","4"),("3","4")]
  execute at @s rotated ~ 0 run fill ^-7 ^1 ^4 ^-7 ^7 ^4 quartz_pillar
  ```
  Xuất phát từ lỗi sinh mã trong file nguồn `generate_all.py:973`, mã Python nội bộ bị dán trực tiếp vào file `.mcfunction`.
  Đồng thời, các lệnh `tellraw` bị xuống dòng không hợp lệ trong cú pháp Minecraft `.mcfunction`, sinh ra thông báo lỗi khởi động của Paper: `[ServerMain/ERROR]: Failed to load function`.

#### 1.2. Kẹt Spawn & Lỗi Độ Cao (Spawn Suffocation & Height Glitch)
- **Vị trí:** `plugins/Essentials/spawn.yml` và `builder/world_spawn_1000.mcfunction:11`
- **Bằng chứng code thực tế:**
  Tọa độ cấu hình spawn tại `spawn.yml`:
  ```yaml
  spawns:
    default:
      world: world
      x: 0.5
      y: 122.0
      z: 0.5
  ```
  Nhưng trong `world_spawn_1000.mcfunction:11-12`:
  ```mcfunction
  # 1. Thân Cây Cổ Thụ Yggdrasil (Y=121..165)
  fill -3 121 -3 3 145 3 cherry_log
  fill -2 145 -2 2 165 2 cherry_log
  ```
  Lệnh `fill` đặt một khối gỗ đặc `cherry_log` kích thước $7 \times 7$ chiếm trọn từ Y=121 đến Y=145, và tiếp tục đặc đến Y=165, trên cùng là lá cây `cherry_leaves` dày đặc. Khi người chơi đăng nhập, thuật toán chống ngạt (safe-spawn search) của Paper buộc phải dịch chuyển người chơi lên không gian thoáng gần nhất tại **Y=167** (đứng cheo leo trên ngọn cây, nhìn xuống bục Beacon trống rỗng).

#### 1.3. Đấu Trường Boss 5 & Boss 6 Bị Ngắt Kết Nối Khỏi `world_boss`
- **Vị trí:**
  - `summon_boss_5.mcfunction:3, 9, 19`
  - `summon_boss_6.mcfunction:3, 9, 19`
  - `boss/boss_5_defeated.mcfunction:2, 3`
  - `boss/boss_6_defeated.mcfunction:2, 3`
- **Bằng chứng code thực tế:**
  Trong thế giới `world_boss`, đấu trường Boss 5 được xây tại `(0, 75, -300)` và Boss 6 tại `(0, 241, 0)`. Warp `/warp boss5` và `/warp boss6` đưa người chơi đến tọa độ đó trong `world_boss`.
  Tuy nhiên, file triệu hồi `summon_boss_5.mcfunction` lại ghi:
  ```mcfunction
  # Vị trí: Thâm Uyên Cổ Điện Đông Nam (X=35, Y=111, Z=115)
  summon wither_skeleton 35 111 115 ...
  ```
  Và `summon_boss_6.mcfunction`:
  ```mcfunction
  # Vị trí: Thiên Cung Sáng Thế (X=0, Y=137, Z=115)
  summon wither_skeleton 0 137 115 ...
  ```
  Cả hai hàm đều triệu hồi mặc định trong `minecraft:overworld` ở vị trí tàn tích cũ.
  Nguy hiểm hơn, tại `boss_5_defeated.mcfunction`:
  ```mcfunction
  scoreboard players set #boss_5_alive boss_status 0
  execute in minecraft:overworld as @p[x=23,y=108,z=98,dx=24,dy=20,dz=34] at @s run function skyblock:boss/announce_boss_5
  execute in minecraft:overworld unless entity @p[x=23,y=108,z=98,dx=24,dy=20,dz=34] as @p[x=35,y=111,z=115,distance=..45] at @s run function skyblock:boss/announce_boss_5
  ```
  Hàm chỉ quét người chơi trong `minecraft:overworld`. Khi người chơi đánh boss tại `world_boss`, việc tiêu diệt boss **hoàn toàn không kích hoạt phát thưởng, không trao Trái Tim Thâm Uyên / Dị Điểm Vĩnh Hằng, không cộng tiền và đá quý**.

#### 1.4. Lệnh `/scoreboard` Bị Chiếm Quyền Bởi ScoreboardPL
- **Vị trí:** `skyblock_economy_daemon.py:563, 572, 1147-1151, 1194-1198`
- **Bằng chứng thử nghiệm thực tế (RCON Output):**
  Lệnh kiểm tra: `python run_rcon.py "scoreboard players set Bot_Master askill_fighting 10"`
  ```text
  Output: §8[§6Skyblock§8] §r§7Usage§8: §f/scoreboard <toggle|reload>
  ```
  Lệnh kiểm tra với namespace: `python run_rcon.py "minecraft:scoreboard players set Bot_Master askill_fighting 10"`
  ```text
  Output: Set [Cấp Chiến Đấu] for Bot_Master to 10
  ```
- **Hậu quả:**
  `ScoreboardPL` đăng ký lệnh `/scoreboard` để bật/tắt bảng hiển thị, ghi đè lệnh gốc của Minecraft.
  Trong daemon, tổng cộng có **12 lệnh RCON** gọi `scoreboard` trần không có namespace `minecraft:`, bao gồm cả lệnh cập nhật số dư tiền mặt `sb_money` (dòng 563) và đá quý `sb_gems` (dòng 572). Do đó, 100% các lệnh đồng bộ cấp độ kỹ năng lẫn tiền tệ/đá quý đều bị ScoreboardPL nuốt chửng. Điểm số `askill_fighting` luôn là 0, vĩnh viễn khóa người chơi trước cửa 6 Đấu trường Boss (`gate_boss_X`).

#### 1.5. Khóa Quyền Phá Khối Nông Nghiệp Tại `world_farm`
- **Vị trí:** `plugins/WorldGuard/worlds/world_farm/regions.yml:9-24`
- **Bằng chứng code thực tế:**
  ```yaml
  farm_world:
    min: {x: -500, y: -64, z: -500}
    max: {x: 500, y: 319, z: 500}
    flags:
      build: deny
      block-break: deny
      block-place: deny
      mob-spawning: allow
      use: allow
      interact: allow
      chest-access: allow
      pvp: deny
    type: cuboid
    priority: 10
  ```
  Vùng bảo vệ `farm_world` bao phủ toàn bộ phạm vi tọa độ -500 đến 500 với cờ `block-break: deny`. Không hề có vùng con (child region) nào được thiết lập tại khu vực ruộng bậc thang `(-190..-110, Y=110, -40..40)` để cho phép phá nông sản. Người chơi sinh tồn không thể thu hoạch lúa mì, cà rốt hay khoai tây.

#### 1.6. Chặn Mở Rương & Liệt Logic Checkpoint / Cứu Hộ Tại `world_parkour` 50 Tầng
- **Vị trí:** `plugins/WorldGuard/worlds/world_parkour/regions.yml:9-24`, `generate_multiworld_1000x1000.py:405-407`, và `tick.mcfunction:214-233`
- **Bằng chứng code thực tế:**
  1. Khu vực `parkour_world` thiếu cờ `chest-access: allow`, khiến người chơi lên đỉnh tháp 50 tầng không thể mở rương kho báu nhận thưởng.
  2. Tại mỗi 10 tầng của Tháp 50 tầng trong `world_parkour`, generator chỉ đặt 1 đĩa áp suất `light_weighted_pressure_plate` trên 1 khối `sea_lantern` mà **không hề có command block hay tag checkpoint nào bên dưới**.
  3. Ngược lại, trong `tick.mcfunction`, logic checkpoint và cứu hộ rơi vẫn hardcode ở tọa độ của tháp 30 tầng cũ tại `minecraft:overworld` (`x=48, y=129, z=-37`).
  - **Hậu quả:** Người chơi leo tháp tại `world_parkour` khi giẫm lên checkpoint không hề được lưu vị trí. Khi sảy chân rơi xuống void (Y < 65), không có cơ chế cứu hộ đưa về checkpoint, người chơi rơi thẳng xuống hư không chết mất toàn bộ trang bị. Khi lên đỉnh tháp Y=230, nút bấm gọi `parkour_win.mcfunction` lại bắn pháo hoa ở tọa độ overworld cũ và teleport người chơi về điểm spawn cũ bị kẹt trong cây cherry.

#### 1.7. Bất Nhất Dữ Liệu Catalyst (NBT & Base Item Mismatch)
- **Vị trí:**
  - `plugins/AuraSkills/loot/fishing.yml:114-123`
  - `skyblock_economy_daemon.py:257` so với `skyblock_economy_daemon.py:1036` và `build_evolution_system.py:115`
- **Bằng chứng:**
  - Trong `fishing.yml`, cá câu được trao vật phẩm:
    ```yaml
    - type: item
      material: nautilus_shell
      weight: 3
      amount: 1
      custom_name: '{"text":"🌊 Vảy Thần Biển Sâu 🌊","color":"aqua","bold":true}'
    ```
    Vật phẩm này hoàn toàn thiếu tag NBT `custom_data: {ancient_mat:"sea_scale"}`. Khi người chơi mang vỏ ốc này đến NPC Thuật Sĩ hoặc Lò Luyện Kim, các hàm kiểm tra NBT `custom_data~{ancient_mat:"sea_scale"}` sẽ từ chối nhận diện.
  - Trong `skyblock_economy_daemon.py:257`, Gem Shop bán `royal_ticket` bằng lệnh `give {player} minecraft:paper[...]`.
    Trong khi tại dòng 1036 của chính file đó và `build_evolution_system.py:115`, `royal_ticket` lại được định nghĩa bằng `minecraft:gold_nugget[...]`.
    Hai vật phẩm có base item khác nhau (`paper` vs `gold_nugget`) không thể cộng dồn (stack) và gây lỗi khi chế tạo đồ tiến hóa.

#### 1.8. Thất Bại Kiểm Thử Giai Đoạn E (Boss 2 Gating Failure)
- **Vị trí:** `tests/bot_client/master_bot_acceptance.js:474` và log thực tế `task-270.log:614`
- **Bằng chứng:**
  ```text
  [CHAT] [Triệu Hồi Boss] Đao Phủ Địa Ngục hiện đang chiến đấu! Hãy tham chiến hỗ trợ đồng đội!
  [PHASE E RESULT] Lv.5 Denied: false, Lv.10 Summoned: false, Boss 2 Status: #boss_2_alive has 1 [boss_status]
  ```
  Do biến `#boss_2_alive` không được dọn dẹp trước bài kiểm tra, server luôn ở trạng thái "Boss 2 đang chiến đấu", dẫn đến việc kiểm tra cấp độ Fighting Lv.5 và Lv.10 bị bỏ qua hoàn toàn. Báo cáo trước đây đã cố tình giấu kết quả này và đánh dấu "PASSED 100%".

---

### 2. NHÓM TÍNH NĂNG BỊ THIẾU (MISSING)

#### 2.1. Sách Hướng Dẫn Tân Thủ Tương Tác (Interactive Guidebook)
- **Yêu cầu Blueprint:** Cung cấp sách viết tay (`written_book`) có hình ảnh minh họa, chỉ dẫn từng bước phát triển từ đảo trống đến săn boss thần thoại, hoặc giao diện Book GUI trực quan khi gõ `/huongdan` hoặc click NPC Tân thủ.
- **Thực trạng:** Hiện tại chỉ có một lệnh `tellraw` sơ sài trong `guide/menu.mcfunction`, nội dung lỗi thời (vẫn nhắc "săn Boss 1..4 nhặt nguyên liệu Cổ Đại"). Không có sách vật phẩm được trao cho người chơi mới khi khởi tạo đảo.

#### 2.2. Cơ Chế Drop Quái Cho Catalyst `soul_fragment` Tại `world_farm`
- **Yêu cầu Blueprint:** Quái vật trong Hầm ngục `world_farm` có tỷ lệ rơi trực tiếp `Mảnh Linh Hồn` (`soul_fragment`).
- **Thực trạng:** 5 tầng spawner trong hầm ngục chỉ sinh ra quái vanilla tiêu chuẩn, không có cơ chế loot table hay hook can thiệp drop. Người chơi buộc phải gom 32 xương + 32 thịt thối đem đổi với NPC `Người Canh Hầm Ngục`.

#### 2.3. Thiếu Tỷ Lệ Drop Đầy Đủ Cho Catalyst `sea_scale` Khi Câu Cá
- **Thực trạng:** Như đã nêu ở mục 1.7, cấu hình `fishing.yml` của AuraSkills không thể gán NBT component `custom_data` trên bản 1.21.4 nếu không dùng cú pháp loot nâng cao hoặc script daemon bổ trợ, khiến việc câu cá kiếm catalyst bị đứt gãy.

---

### 3. NHÓM THẨM MỸ & CHI TIẾT KIẾN TRÚC THÔ RÁP (UGLY)

#### 3.1. Các Đấu Trường Boss Là Khối Trụ Hình Học Trơ Trọi
- **Vị trí:** `generate_multiworld_1000x1000.py:141-210`
- **Hiện trạng:**
  - Đấu trường Boss 1: Cắt lát hình trụ bằng `bone_block` và `soul_sand` phẳng lỳ bán kính R=35.
  - Đấu trường Boss 2: Cắt lát hình trụ bằng `basalt` và `magma_block` với một vũng dung nham hình vuông ở giữa.
  - Đấu trường Boss 3: Cắt lát hình trụ bằng `polished_blackstone_bricks` và `crying_obsidian`.
  - Đấu trường Boss 4: Khối trụ `end_stone_bricks` và `purpur_block`.
  - Đấu trường Boss 5: Khối trụ `reinforced_deepslate` và `sculk`.
  Tất cả các đấu trường đều là đĩa tròn phẳng 2D, thiếu hoàn toàn các chi tiết kiến trúc 3D: cột vòm gothic, phế tích đổ nát, bậc thang giật cấp, lan can bảo vệ, đài tế lễ và các khối trang trí tương phản.

#### 3.2. Cầu Xích 1 Block Lơ Lửng Giữa Hư Không
- **Vị trí:** `generate_multiworld_1000x1000.py:216-219`
- **Code hiện tại:**
  ```python
  cmds.append("fill 0 110 25 0 110 140 chain[axis=z]")
  cmds.append("fill 0 110 -25 0 110 -260 chain[axis=z]")
  cmds.append("fill -25 110 0 -140 110 0 chain[axis=x]")
  cmds.append("fill 25 110 0 140 110 0 chain[axis=x]")
  ```
  Đây là những đường thẳng độc đạo chỉ rộng **đúng 1 block dây xích** nối từ sảnh trung tâm ra các đấu trường xuyên qua khoảng không hư không (void). Người chơi bước đi cực kỳ dễ trượt chân rơi xuống void, hoàn toàn không tương xứng với quy mô của một thế giới MMORPG hoành tráng. Cần được xây dựng thành các đại lộ cầu vòm đá đen hoặc cầu năng lượng thần bí rộng 5-7 blocks có lan can và trụ đỡ.

#### 3.3. Sai Lệch Chủ Đề Đấu Trường Boss 1
- Boss 1 là **Nữ Hoàng Nhện Độc** (`cave_spider`), nhưng đấu trường lại được tạo hình thành "Hầm Mộ Xương" (Bone Catacombs) với toàn khối xương `bone_block`, cát linh hồn `soul_sand` và hoa `wither_rose`. Cần đại tu thành Hang Mạng Nhện Cổ Xưa (Arachnid Grotto) với mạng nhện `cobweb`, rêu xanh, đá thạch nhũ và gỗ sồi sẫm màu.

#### 3.4. Lỗi Font Hiển Thị Ký Tự Emoji (Mojibake ``)
- **Vị trí:**
  - `plugins/ScoreboardPL/config.yml:18-27`
  - Các thông báo `tellraw` trong datapack
- **Hiện trạng:**
  Các emoji 4-byte UTF-8 như `👤`, `💰`, `🏝`, `👥`, `📶` không nằm trong bảng mã bitmap tiêu chuẩn của client Minecraft vanilla, khiến người chơi nhìn thấy các ký tự lỗi `` hoặc ô vuông rỗng. Bắt buộc phải thay thế bằng các ký tự Unicode 2-byte (BMP) tương thích 100% với Minecraft: `✦`, `✧`, `⚔`, `★`, `✪`, `⚡`, `❤`, `⛏`, `●`, `■`, `▶`.

#### 3.5. Lệch Lore & Cấp Bậc Trang Bị (Outdated Tiers)
- `announce_boss_5.mcfunction:10` ghi: `"⚡ Nguyên liệu ĐỘT PHÁ THẦN THOẠI cho TIER 16 - 18!"`
- `announce_boss_6.mcfunction:10` ghi: `"⚡ Nguyên liệu SÁNG THẾ TỐI CAO cho TIER 19 - 20 [MAX]!"`
- `hunter_menu.mcfunction:15-18` quảng bá Tier 16-18 và Tier 19-20.
Trong khi đó, tài liệu thiết kế gốc `MASTER_PROMPT_BLUEPRINT.md` quy định hệ thống trang bị chỉ có **tối đa 15 Tiers**. Thông tin này làm người chơi hoang mang và hiểu lầm về lộ trình nâng cấp.

---

### 4. NHÓM CODE THỪA & XUNG ĐỘT (DEAD_TECH)

#### 4.1. Thư Mục Lồng Nhau Trong DeluxeMenus
- Thư mục con `plugins/DeluxeMenus/gui_menus/gui_menus/` chứa 2 file trùng lặp cũ: `builder.yml` (882 bytes) và `minions.yml` (882 bytes). Đây là vết tích còn sót lại từ các đợt di chuyển file trước đây.

#### 4.2. Các File Menu Mẫu Chưa Đăng Ký
- Các file `basics_menu.yml`, `advanced_menu.yml`, `requirements_menu.yml` trong `plugins/DeluxeMenus/gui_menus/` không hề được khai báo trong `plugins/DeluxeMenus/config.yml`. Chúng là file mẫu của plugin chiếm dụng dung lượng và làm rối cấu trúc thư mục.

#### 4.3. File `config.yml` Rác Tại Thư Mục Gốc Máy Chủ
- File `C:\Users\Administrator\.gemini\antigravity\scratch\Skyblock-Server\config.yml` (dung lượng 10 KB) là một bản copy mặc định của ScoreboardPL bị lưu nhầm vào thư mục gốc của server thay vì nằm trong `plugins/ScoreboardPL/`.

#### 4.4. Các Cặp Warp Alias Trong Essentials (Cần Giữ Lại)
- Có 4 cặp warp trùng tọa độ:
  - `fishing.yml` & `cauca.yml` -> `world_cauca (0.5, 101.0, 0.5)`
  - `trade.yml` & `forge.yml` -> `world (0.5, 121.0, -55.0)`
  - `bazaar.yml` & `shop.yml` -> `world (-55.0, 121.0, -7.0)`
  - `mob.yml` & `farm.yml` -> `world_farm (0.5, 111.0, 0.5)`
  - **Lưu ý quan trọng:** Không được xóa các warp này! Menu tân thủ `guide/menu.mcfunction` đang gọi `/warp fishing`, `/warp trade` trong khi menu DeluxeMenus `warp.yml` đang gọi `/warp cauca`, `/warp farm`. Việc giữ lại cả hai tên đảm bảo người chơi gõ lệnh hay click menu đều hoạt động bình thường (Alias tương thích).

#### 4.5. Generator Cũ Sinh Kiến Trúc Đè Lên Hub Mới Trong `setup.mcfunction`
- Tại `setup.mcfunction:29-35`, server vẫn gọi thực thi các hàm thế hệ cũ: `build_farm`, `build_fishing`, `build_boss`, `build_casino`, `build_parkour`. Các hàm này xây dựng các hòn đảo đơn lẻ ngay bên trong `overworld`, đè lên tọa độ của hệ thống Cổng Torii và đường đi của Spawn Hub mới.

---

## IV. BẢN ĐỒ KHẮC PHỤC THEO GIAI ĐOẠN (STAGE 2 REMEDIATION ROADMAP)

Để đưa hệ thống đạt chuẩn 100% thực chất mà không làm gián đoạn vận hành máy chủ, lộ trình sửa đổi cần chia thành 4 Cụm hành động rõ ràng:

```
┌────────────────────────────────────────────────────────────────────────┐
│                      LỘ TRÌNH TRIỂN KHAI STAGE 2                       │
└────────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌────────────────────────────────────────────────────────────────────────┐
│ CỤM 1: NỀN TẢNG CỐT LÕI, SPAWN HUB & SỬA LỖI ĐỒNG BỘ DAEMON           │
│ • Khoét rỗng buồng Spawn Hub dưới gốc Yggdrasil (hết kẹt Y=167).       │
│ • Thay thế toàn bộ /scoreboard thành /minecraft:scoreboard trong daemon│
│ • Sửa dứt điểm 24 lỗi cú pháp .mcfunction (xóa Python code thừa).      │
│ • Dọn sạch DEAD_TECH (thư mục lồng, config rác; bảo toàn các warp alias).│
└────────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌────────────────────────────────────────────────────────────────────────┐
│ CỤM 2: TÁI THIẾT 6 ĐẤU TRƯỜNG BOSS & ĐỒNG BỘ ĐA THẾ GIỚI               │
│ • Dual-home Boss 5 & Boss 6: Summon và Defeat chuẩn tọa độ world_boss. │
│ • Đại tu kiến trúc 6 Đấu trường: Thay đĩa tròn bằng phế tích 3D chi tiết│
│ • Xây đại lộ cầu vòm / cầu đá kiên cố rộng 5 blocks thay cầu xích 1 ô. │
│ • Sửa Đấu trường 1 thành Hang Mạng Nhện Cổ Xưa (phù hợp Spider Queen). │
│ • Chuẩn hóa Lore toàn bộ báu vật và thông báo về chuẩn tối đa 15 Tiers. │
└────────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌────────────────────────────────────────────────────────────────────────┐
│ CỤM 3: KHAI THÔNG NÔNG NGHIỆP, CÂU CÁ & CHUẨN HÓA CATALYST             │
│ • Thêm vùng WorldGuard farm_crops cho phép bẻ lúa/cà rốt/khoai tây.    │
│ • Thêm cờ chest-access: allow cho vùng world_parkour.                  │
│ • Đồng nhất base item của royal_ticket về gold_nugget.                 │
│ • Cấu hình daemon hook bổ trợ NBT sea_scale và soul_fragment.          │
└────────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌────────────────────────────────────────────────────────────────────────┐
│ CỤM 4: GIAO DIỆN NGƯỜI DÙNG, SÁCH TÂN THỦ & KIỂM THỬ TẬN GỐC (BOT)    │
│ • Thay toàn bộ emoji 4-byte lỗi  bằng ký tự Unicode BMP tiêu chuẩn.   │
│ • Xuất bản Sách Hướng Dẫn Tân Thủ tương tác (Written Book).            │
│ • Chạy bot client kiểm thử độc lập 6 giai đoạn (Phase A -> F) đạt 100%.│
└────────────────────────────────────────────────────────────────────────┘
```

---

## V. CÂU HỎI TỒN ĐỌNG & KHOẢNG TRỐNG CẦN LÀM RÕ (REMAINING QUESTIONS & GAPS)

1. **Cơ chế hồi sinh nông sản tự động tại `world_farm`**:
   - Khi cho phép người chơi bẻ lúa mì/cà rốt tại `world_farm`, hiện server chưa cài đặt plugin tự trồng lại cây (Auto-Replant) hay cơ chế tick tự phục hồi ruộng bậc thang bằng datapack. Cần quyết định: dùng datapack quét vùng để `setblock ...[age=7]` định kỳ hay bổ sung logic vào daemon?
2. **Khu vực tàn tích cũ trong `world`**:
   - Trong `world` (overworld), các công trình cũ của `build_farm`, `build_fishing`, `build_boss` từ thời kỳ single-world vẫn còn dấu vết khối block nếu trước đây đã từng chạy. Trong Stage 2, có nên cho chạy một lệnh dọn dẹp không gian (`air fill`) tại các tọa độ rác này để làm trong sạch bầu trời Spawn Hub không?
3. **Ưu tiên cho điều tra viên / kỹ sư tiếp theo**:
   - Ưu tiên số 1: Xử lý Cụm 1 ngay lập tức để giải phóng người chơi khỏi kẹt Spawn Y=167 và khắc phục lỗi đồng bộ `minecraft:scoreboard` của daemon.
   - Ưu tiên số 2: Triển khai Cụm 2 để khôi phục tính năng rơi đồ của Boss 5 & Boss 6.
