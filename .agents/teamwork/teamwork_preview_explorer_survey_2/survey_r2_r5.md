# Báo Cáo Khảo Sát Chi Tiết R2 & R5: Boss Navigation Overhaul & Newbie Onboarding

- **Người thực hiện**: Teamwork Explorer 2
- **Ngày khảo sát**: 2026-10-12
- **Mục tiêu**: Điều tra toàn diện cấu trúc file, tọa độ, cơ chế lệnh, cú pháp YAML và datapack mcfunction cho Yêu cầu R2 (Boss Navigation Overhaul) và R5 (Newbie Onboarding).
- **Môi trường**: Paper 1.21.4 (Minecraft Java Edition, Windows), EssentialsX 2.22.0, IridiumSkyblock.

---

## MỤC LỤC
1. [Khảo Sát Hiện Trạng Hệ Thống](#1-khảo-sát-hiện-trạng-hệ-thống)
2. [Yêu Cầu R2: Tối Ưu UX Và Điều Hướng Boss](#2-yêu-cầu-r2-tối-ưu-ux-và-điều-hướng-boss)
   - [2.1. Tọa độ chính xác 4 Đấu Trường Boss & Sảnh Boss Trung Tâm](#21-tọa-độ-chính-xác-4-đấu-trường-boss--sảnh-boss-trung-tâm)
   - [2.2. Cấu trúc YAML 4 Warp Boss (`plugins/Essentials/warps/`)](#22-cấu-trúc-yaml-4-warp-boss-pluginsessentialswarps)
   - [2.3. Cấu hình Alias Lệnh Trong `commands.yml`](#23-cấu-hình-alias-lệnh-trong-commandsyml)
   - [2.4. NPC "Thợ Săn Boss" & Menu Tellraw Tương Tác](#24-npc-thợ-săn-boss--menu-tellraw-tương-tác)
   - [2.5. Cơ Chế Dịch Chuyển Ngược Về Sảnh Boss (Return TP)](#25-cơ-chế-dịch-chuyển-ngược-về-sảnh-boss-return-tp)
   - [2.6. Cơ Chế Hiển Thị Trạng Thái Boss (Scoreboard & Biển Báo)](#26-cơ-chế-hiển-thị-trạng-thái-boss-scoreboard--biển-báo)
3. [Yêu Cầu R5: Hướng Dẫn Tân Thủ & Tra Cứu Lệnh Cơ Bản](#3-yêu-cầu-r5-hướng-dẫn-tân-thủ--tra-cứu-lệnh-cơ-bản)
   - [3.1. Khu vực Spawn Hub & Vị Trí Đặt NPC](#31-khu-vực-spawn-hub--vị-trí-đặt-npc)
   - [3.2. NPC "Hướng Dẫn Viên" & Menu Tellraw Tân Thủ](#32-npc-hướng-dẫn-viên--menu-tellraw-tân-thủ)
   - [3.3. Cấu Trúc Toàn Diện Cho `help.yml`](#33-cấu-trúc-toàn-diện-cho-helpyml)
4. [Tác Động Và Phụ Thuộc Cần Lưu Ý](#4-tác-động-và-phụ-thuộc-cần-lưu-ý)
5. [Kế Hoạch Triển Khai Chi Tiết Cho Implementer](#5-kế-hoạch-triển-khai-chi-tiết-cho-implementer)

---

## 1. Khảo Sát Hiện Trạng Hệ Thống

Qua khảo sát thực tế toàn bộ thư mục server, ghi nhận hiện trạng như sau:

| Thành phần | Đường dẫn thực tế | Hiện trạng quan sát |
|---|---|---|
| **Warps Essentials** | `plugins/Essentials/warps/` | Đã có 12 file: `boss.yml`, `spawn.yml`, `pvp.yml`, `farm.yml`, `trade.yml`, `fishing.yml`, `cauca.yml`, `crates.yml`, `casino.yml`, `parkour.yml`, `mob.yml`, `shop.yml`. **Chưa có 4 file riêng biệt: `boss1.yml`, `boss2.yml`, `boss3.yml`, `boss4.yml`**. |
| **Warp Boss Trung Tâm** | `plugins/Essentials/warps/boss.yml` | Đã tồn tại: `world: world, x: 0.5, y: 111.0, z: 58.0, yaw: 0.0, pitch: 0.0, name: boss`. Đây chính là tọa độ Sảnh Boss Trung Tâm. |
| **Cấu hình Alias** | `commands.yml` | Có alias `boss: - warp boss $1-`, nhưng **chưa có alias cho `boss1`, `boss2`, `boss3`, `boss4`**. |
| **File Tra cứu Trợ giúp** | `help.yml` | File tồn tại ở thư mục gốc server nhưng **hoàn toàn trống (0 bytes)**. |
| **Hệ thống Xây dựng Boss** | `world/datapacks/skyblock_spawn/data/skyblock/function/build_boss_multi.mcfunction` | Định nghĩa toàn bộ kiến trúc Sảnh Trung Tâm và 4 đại điện biệt lập, đã có trụ triệu hồi nhưng **chưa có NPC Thợ Săn Boss, chưa có bệ TP ngược về sảnh, biển trạng thái boss chưa cập nhật động**. |
| **Scoreboard Trạng thái Boss** | `setup.mcfunction` & `tick.mcfunction` | Scoreboard objective `boss_status` (dummy) đã được khai báo. Tick function theo dõi `#boss_1_alive` .. `#boss_4_alive` (1 = đang sống/đang đánh, 0 = đã hạ gục). |
| **Hệ thống NPC Tương tác** | `build_casino.mcfunction`, `build_crates.mcfunction` | Server sử dụng thực thể Minecraft 1.20+ `type=interaction` kết hợp Villager/Armor Stand, xử lý qua `tick.mcfunction` với mẫu `execute as @e[type=interaction,tag=...] if data entity @s interaction on target run function ...`. |
| **Khu vực Spawn Hub** | `build_spawn.mcfunction` | Spawn warp tại `X: 0.5, Y: 121.0, Z: 0.5`, đài Beacon trung tâm tại `X: 0, Y: 120, Z: 0`. Chưa có NPC Hướng Dẫn Viên Tân Thủ. |

---

## 2. Yêu Cầu R2: Tối Ưu UX Và Điều Hướng Boss

### 2.1. Tọa độ chính xác 4 Đấu Trường Boss & Sảnh Boss Trung Tâm

Dựa trên cấu trúc hình học được dựng trong `build_boss_multi.mcfunction`:

1. **Sảnh Boss Trung Tâm (Central Boss Sanctuary Hall)**:
   - Phạm vi: `X: -15..15`, `Z: 56..70`, sàn đá đen mạ vàng tại `Y=110`, người đứng tại `Y=111.0`.
   - Warp trung tâm hiện tại: `X: 0.5, Y: 111.0, Z: 58.0`, nhìn hướng Nam (`yaw: 0.0`, `pitch: 0.0`).
   - Cổng dẫn:
     - Hướng Bắc (`Z=56`): Cầu đá nối từ Spawn Nam.
     - Hướng Tây (`X=-14, Z: 61..65`): Cầu rêu dẫn sang Boss 1 & Cầu tím dẫn sang Boss 4.
     - Hướng Đông (`X=14, Z: 61..65`): Cầu gạch địa ngục dẫn sang Boss 2.
     - Hướng Nam (`X: -2..2, Z=70`): Đại lộ đá đen dẫn sang Boss 3.

2. **Đại Điện 1: Động Nữ Hoàng Nhện (Boss 1 - 150 HP)**:
   - Phạm vi: `X: -40..-18`, `Z: 75..95`, `Y=110`.
   - Tâm bệ tế lễ (Boss spawn altar): `X: -29, Y: 111, Z: 85`.
   - Cổng vào phía Đông cầu: `X: -18, Z: 74..76`.
   - Trụ kích hoạt triệu hồi: `X: -20, Y: 111, Z: 77` (Nút bấm tại `Y=113` kích hoạt `skyblock:summon_boss_1`).
   - **Tọa độ warp đề xuất cho `boss1`**:
     - `x: -18.5`, `y: 111.0`, `z: 75.5`, `yaw: 90.0` (mặt hướng Tây nhìn thẳng vào lòng hang động), `pitch: 0.0`.

3. **Đại Điện 2: Vực Lửa Đao Phủ Địa Ngục (Boss 2 - 300 HP)**:
   - Phạm vi: `X: 18..40`, `Z: 75..95`, `Y=110`.
   - Tâm bệ tế lễ (Boss spawn altar): `X: 29, Y: 111, Z: 85`.
   - Cổng vào phía Tây cầu: `X: 18, Z: 74..76`.
   - Trụ kích hoạt triệu hồi: `X: 20, Y: 111, Z: 77` (Nút bấm tại `Y=113` kích hoạt `skyblock:summon_boss_2`).
   - **Tọa độ warp đề xuất cho `boss2`**:
     - `x: 18.5`, `y: 111.0`, `z: 75.5`, `yaw: -90.0` (mặt hướng Đông nhìn thẳng vào vực dung nham), `pitch: 0.0`.

4. **Đại Điện 3: Thành Trì Chúa Tể Bóng Tối (Boss Tuần Cấp 3 - 600 HP)**:
   - Phạm vi: `X: -18..18`, `Z: 100..130`, `Y=110` (quy mô 37x31 block).
   - Tâm bệ tế lễ (Boss spawn altar): `X: 0, Y: 111, Z: 115`.
   - Cổng vòm vào thành trì phía Bắc: `X: -2..2, Z: 100`.
   - Trụ kích hoạt triệu hồi: `X: 0, Y: 111, Z: 103` (Nút bấm tại `Y=113` kích hoạt `skyblock:summon_boss_3`).
   - **Tọa độ warp đề xuất cho `boss3`**:
     - `x: 0.5`, `y: 111.0`, `z: 101.5`, `yaw: 0.0` (mặt hướng Nam nhìn thẳng vào ngai vàng thành trì), `pitch: 0.0`.

5. **Đại Điện 4: Thánh Địa Hư Không (World Boss Cấp 4 - 1200 HP)**:
   - Phạm vi: `X: -45..-25`, `Z: 100..130`, `Y=110`.
   - Tâm bệ tế lễ (Boss spawn altar): `X: -35, Y: 111, Z: 115`.
   - Cổng vào phía Đông cầu tím: `X: -25, Z: 101..104`.
   - Trụ kích hoạt triệu hồi: `X: -27, Y: 111, Z: 103` (Nút bấm tại `Y=113` kích hoạt `skyblock:summon_boss_4`).
   - **Tọa độ warp đề xuất cho `boss4`**:
     - `x: -25.5`, `y: 111.0`, `z: 102.5`, `yaw: 90.0` (mặt hướng Tây nhìn thẳng vào thánh địa giác ngọc), `pitch: 0.0`.

---

### 2.2. Cấu trúc YAML 4 Warp Boss (`plugins/Essentials/warps/`)

Tạo 4 file YAML chuẩn EssentialsX:

#### `plugins/Essentials/warps/boss1.yml`
```yaml
world: world
x: -18.5
y: 111.0
z: 75.5
yaw: 90.0
pitch: 0.0
name: boss1
```

#### `plugins/Essentials/warps/boss2.yml`
```yaml
world: world
x: 18.5
y: 111.0
z: 75.5
yaw: -90.0
pitch: 0.0
name: boss2
```

#### `plugins/Essentials/warps/boss3.yml`
```yaml
world: world
x: 0.5
y: 111.0
z: 101.5
yaw: 0.0
pitch: 0.0
name: boss3
```

#### `plugins/Essentials/warps/boss4.yml`
```yaml
world: world
x: -25.5
y: 111.0
z: 102.5
yaw: 90.0
pitch: 0.0
name: boss4
```

---

### 2.3. Cấu hình Alias Lệnh Trong `commands.yml`

Bổ sung vào mục `aliases` của `commands.yml`:
```yaml
  boss1:
  - warp boss1 $1-
  boss2:
  - warp boss2 $1-
  boss3:
  - warp boss3 $1-
  boss4:
  - warp boss4 $1-
```
Và các alias tiếng Việt tương ứng:
```yaml
  dongnhen:
  - warp boss1 $1-
  vuclua:
  - warp boss2 $1-
  thanhtri:
  - warp boss3 $1-
  hukhong:
  - warp boss4 $1-
```

---

### 2.4. NPC "Thợ Săn Boss" & Menu Tellraw Tương Tác

#### Vị trí xuất hiện NPC
- Tại Sảnh Boss Trung Tâm: `X: 0.5, Y: 111.0, Z: 61.5`.
- Người chơi gõ `/warp boss` xuất hiện tại `X: 0.5, Y: 111.0, Z: 58.0`, nhìn hướng Nam sẽ thấy ngay NPC Thợ Săn Boss đứng đối diện (NPC quay mặt hướng Bắc `yaw: 180.0`).

#### Lệnh triệu hồi NPC (trong `build_boss_multi.mcfunction`)
```mcfunction
# Dọn dẹp NPC cũ nếu có
kill @e[type=villager,tag=boss_hunter_npc]
kill @e[type=interaction,tag=boss_hunter_interact]
kill @e[type=armor_stand,tag=boss_hunter_hologram]

# Triệu hồi Villager Thợ Săn Boss
summon villager 0.5 111 61.5 {Tags:["boss_hunter_npc"],CustomName:'{"text":"⚔ THỢ SĂN BOSS ⚔","color":"red","bold":true}',CustomNameVisible:1b,NoAI:1b,Invulnerable:1b,PersistenceRequired:1b,Silent:1b,VillagerData:{profession:weaponsmith,type:taiga,level:5},Rotation:[180f,0f]}

# Thực thể tương tác Interaction
summon interaction 0.5 111 61.5 {Tags:["boss_hunter_interact"],width:1.2f,height:1.9f,response:1b}

# Hologram bảng chữ nổi
summon armor_stand 0.5 113.2 61.5 {Tags:["boss_hunter_hologram"],Invisible:1b,Marker:1b,NoGravity:1b,CustomNameVisible:1b,CustomName:'{"text":"[ CLICK ĐỂ CHỌN BOSS ]","color":"yellow","bold":true}'}
```

#### Xử lý tương tác trong `tick.mcfunction`
```mcfunction
# Xử lý click NPC Thợ Săn Boss
execute as @e[type=interaction,tag=boss_hunter_interact] if data entity @s interaction on target run function skyblock:boss/hunter_menu
execute as @e[type=interaction,tag=boss_hunter_interact] if data entity @s interaction run data remove entity @s interaction
```

#### Menu Tellraw tương tác (`skyblock:boss/hunter_menu.mcfunction`)
```mcfunction
tellraw @s [{"text":"═══════════════════════════════════════════════\n","color":"gold","bold":true},{"text":"         ⚔  MENU ĐIỀU HƯỚNG BOSS  ⚔\n","color":"red","bold":true},{"text":"═══════════════════════════════════════════════\n","color":"gold","bold":true},{"text":"1. ","color":"gray"},{"text":"🕷 ĐỘNG NỮ HOÀNG NHỆN (Cấp 1 - 150 HP)\n","color":"green","bold":true},{"text":"   • Rơi: ","color":"gray"},{"text":"Mảnh Quặng Cổ Đại (Dùng rèn Tier 1-5)\n","color":"aqua"},{"text":"   • ","color":"gray"},{"text":"[DỊCH CHUYỂN TỚI ĐỘNG NHỆN (/WARP BOSS1)]\n","color":"yellow","bold":true,"clickEvent":{"action":"run_command","value":"/warp boss1"}},{"text":"\n2. ","color":"gray"},{"text":"🔥 VỰC ĐAO PHỦ ĐỊA NGỤC (Cấp 2 - 300 HP)\n","color":"red","bold":true},{"text":"   • Rơi: ","color":"gray"},{"text":"Tinh Thể Cổ Đại (Dùng rèn Tier 6-9)\n","color":"light_purple"},{"text":"   • ","color":"gray"},{"text":"[DỊCH CHUYỂN TỚI VỰC LỬA (/WARP BOSS2)]\n","color":"yellow","bold":true,"clickEvent":{"action":"run_command","value":"/warp boss2"}},{"text":"\n3. ","color":"gray"},{"text":"🏰 THÀNH TRÌ CHÚA TỂ BÓNG TỐI (Boss Tuần - 600 HP)\n","color":"dark_red","bold":true},{"text":"   • Rơi: ","color":"gray"},{"text":"☠ Trái Tim Của Quỷ ☠ (Đột phá Tier 10)\n","color":"red","bold":true},{"text":"   • ","color":"gray"},{"text":"[DỊCH CHUYỂN TỚI THÀNH TRÌ (/WARP BOSS3)]\n","color":"yellow","bold":true,"clickEvent":{"action":"run_command","value":"/warp boss3"}},{"text":"\n4. ","color":"gray"},{"text":"🌀 THÁNH ĐỊA HƯ KHÔNG (World Boss - 1200 HP)\n","color":"dark_purple","bold":true},{"text":"   • Rơi: ","color":"gray"},{"text":"🌀 Lõi Hư Không 🌀 (Đột phá Tier 13-15)\n","color":"light_purple","bold":true},{"text":"   • ","color":"gray"},{"text":"[DỊCH CHUYỂN TỚI THÁNH ĐỊA (/WARP BOSS4)]\n","color":"yellow","bold":true,"clickEvent":{"action":"run_command","value":"/warp boss4"}},{"text":"═══════════════════════════════════════════════","color":"gold","bold":true}]

playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 1.0 1.2
```

---

### 2.5. Cơ Chế Dịch Chuyển Ngược Về Sảnh Boss (Return TP)

Tại mỗi đại điện Boss, lắp đặt một bệ dịch chuyển rút lui khẩn cấp (Return Teleport Pad) với 2 lớp cơ chế đảm bảo hoạt động 100%:

1. **Lớp 1: Khối lệnh Redstone + Tấm áp suất (Pressure Plate Command Block)**
   - Đặt command block ngầm tại `Y=109` chứa lệnh `teleport @p 0.5 111.0 58.0 0.0 0.0`.
   - Phía trên tại `Y=110` đặt `polished_blackstone_pressure_plate` hoặc `stone_pressure_plate`.
   - Bên cạnh dựng cột đá có biển huỳnh quang ghi rõ hướng dẫn.
2. **Lớp 2: Kiểm tra vùng trong `tick.mcfunction` (Fail-safe)**
   - Đảm bảo ngay cả khi người chơi đi vào mà không kích hoạt được redstone (ví dụ do lag mạng hoặc tick delay), hệ thống vẫn tự động đưa về sảnh:
     - Arena 1: `execute in minecraft:overworld as @a[x=-19,y=110,z=74,dx=1,dy=2,dz=1] run teleport @s 0.5 111.0 58.0 0.0 0.0`
     - Arena 2: `execute in minecraft:overworld as @a[x=18,y=110,z=74,dx=1,dy=2,dz=1] run teleport @s 0.5 111.0 58.0 0.0 0.0`
     - Arena 3: `execute in minecraft:overworld as @a[x=2,y=110,z=101,dx=1,dy=2,dz=1] run teleport @s 0.5 111.0 58.0 0.0 0.0`
     - Arena 4: `execute in minecraft:overworld as @a[x=-26,y=110,z=101,dx=1,dy=2,dz=1] run teleport @s 0.5 111.0 58.0 0.0 0.0`

---

### 2.6. Cơ Chế Hiển Thị Trạng Thái Boss (Scoreboard & Biển Báo)

1. **Scoreboard**:
   - `boss_status` đã tồn tại trong `setup.mcfunction`.
   - Giá trị quy ước:
     - `#boss_1_alive boss_status = 1`: Boss Động Nhện đang chiến đấu / còn sống.
     - `#boss_1_alive boss_status = 0`: Boss Động Nhện đã bị hạ gục / sẵn sàng triệu hồi.
     - Tương tự cho `#boss_2_alive`, `#boss_3_alive`, `#boss_4_alive`.
2. **Biển Báo Trạng Thái Động Tại Sảnh Boss Trung Tâm**:
   - Vị trí: Đặt 4 biển trạng thái tại 4 cổng dẫn sang các đại điện (ngay trên đầu biển chỉ dẫn hiện có ở `Y=113`):
     - **Boss 1 (Cổng Tây)**: `X=-13, Y=113, Z=60` (quay mặt hướng Đông)
     - **Boss 2 (Cổng Đông)**: `X=13, Y=113, Z=60` (quay mặt hướng Tây)
     - **Boss 3 (Cổng Nam)**: `X=-1, Y=113, Z=69` (quay mặt hướng Nam)
     - **Boss 4 (Cổng Tây Nam)**: `X=-13, Y=113, Z=66` (quay mặt hướng Đông)
   - Trạng thái `SẴN SÀNG` (Màu xanh lá):
     `messages:['{"text":"[ BOSS X ]","color":"gold","bold":true}','{"text":"<TÊN ĐẠI ĐIỆN>","color":"yellow"}','{"text":"Trạng thái:","color":"gray"}','{"text":"● SẴN SÀNG","color":"green","bold":true}']`
   - Trạng thái `ĐANG CHIẾN ĐẤU` (Màu đỏ rực):
     `messages:['{"text":"[ BOSS X ]","color":"gold","bold":true}','{"text":"<TÊN ĐẠI ĐIỆN>","color":"yellow"}','{"text":"Trạng thái:","color":"gray"}','{"text":"☠ ĐANG CHIẾN ĐẤU","color":"red","bold":true}']`
   - **Kích hoạt sự kiện**:
     - Khi chạy `build_boss_multi.mcfunction`: khởi tạo 4 biển về `● SẴN SÀNG`.
     - Khi chạy `summon_boss_X.mcfunction`: cập nhật biển tương ứng sang `☠ ĐANG CHIẾN ĐẤU`.
     - Khi chạy `boss_X_defeated.mcfunction`: cập nhật biển tương ứng về `● SẴN SÀNG`.

---

## 3. Yêu Cầu R5: Hướng Dẫn Tân Thủ & Tra Cứu Lệnh Cơ Bản

### 3.1. Khu vực Spawn Hub & Vị Trí Đặt NPC

- Tọa độ người chơi xuất hiện (`plugins/Essentials/warps/spawn.yml`):
  - `world: world`, `x: 0.5`, `y: 121.0`, `z: 0.5`, `yaw: 0.0` (nhìn về hướng Nam `+Z`), `pitch: 0.0`.
- Đài Beacon trung tâm nằm tại `X: 0, Y: 120, Z: 0`.
- **Vị trí đặt NPC Hướng Dẫn Viên tối ưu nhất**:
  - `X: 0.5, Y: 121.0, Z: 3.5` (ngay trên trục đường chính phía Nam đài Beacon).
  - NPC quay mặt về hướng Bắc (`yaw: 180.0`).
  - Khi tân thủ mới vào server hoặc gõ `/spawn`, họ lập tức nhìn thấy NPC Hướng Dẫn Viên với bảng chữ nổi màu vàng rực rỡ ngay trước mặt.

---

### 3.2. NPC "Hướng Dẫn Viên" & Menu Tellraw Tân Thủ

#### Lệnh triệu hồi NPC (trong `build_spawn.mcfunction`)
```mcfunction
# Dọn dẹp NPC cũ nếu có
kill @e[type=villager,tag=guide_npc]
kill @e[type=interaction,tag=guide_interact]
kill @e[type=armor_stand,tag=guide_hologram]

# Triệu hồi Villager Hướng Dẫn Viên Tân Thủ
summon villager 0.5 121 3.5 {Tags:["guide_npc"],CustomName:'{"text":"🧭 HƯỚNG DẪN VIÊN TÂN THỦ 🧭","color":"gold","bold":true}',CustomNameVisible:1b,NoAI:1b,Invulnerable:1b,PersistenceRequired:1b,Silent:1b,VillagerData:{profession:librarian,type:plains,level:5},Rotation:[180f,0f]}

# Thực thể tương tác Interaction
summon interaction 0.5 121 3.5 {Tags:["guide_interact"],width:1.2f,height:1.9f,response:1b}

# Hologram chữ nổi
summon armor_stand 0.5 123.2 3.5 {Tags:["guide_hologram"],Invisible:1b,Marker:1b,NoGravity:1b,CustomNameVisible:1b,CustomName:'{"text":"[ CLICK ĐỂ XEM HƯỚNG DẪN ]","color":"yellow","bold":true}'}
```

#### Xử lý tương tác trong `tick.mcfunction` & trigger
```mcfunction
# Xử lý click NPC Hướng Dẫn Viên
execute as @e[type=interaction,tag=guide_interact] if data entity @s interaction on target run function skyblock:guide/menu
execute as @e[type=interaction,tag=guide_interact] if data entity @s interaction run data remove entity @s interaction

# Hỗ trợ gõ lệnh /huongdan hoặc /guide thông qua trigger
scoreboard players enable @a huongdan
execute as @a[scores={huongdan=1..}] at @s run function skyblock:guide/menu
scoreboard players set @a[scores={huongdan=1..}] huongdan 0
```
Trong `setup.mcfunction` bổ sung:
```mcfunction
scoreboard objectives add huongdan trigger {"text":"Hướng Dẫn Tân Thủ","color":"gold"}
```
Trong `commands.yml` bổ sung:
```yaml
  huongdan:
  - trigger huongdan
  guide:
  - trigger huongdan
```

#### File Function Menu Tân Thủ (`skyblock:guide/menu.mcfunction`)
Chứa tellraw đa tầng định dạng chuyên nghiệp với các nút click:
- `[NHẬN QUÀ TÂN THỦ /TANTHU]` -> `clickEvent: run_command: "/tanthu"`
- `[NHẬN QUÀ HẰNG NGÀY /DAILY]` -> `clickEvent: run_command: "/daily"`
- `[MỞ MENU ĐẢO /IS]` -> `clickEvent: run_command: "/is"`
- `[BÁN KHOÁNG SẢN /BANKHOANGSAN]` -> `clickEvent: run_command: "/bankhoangsan"`
- `[NUNG QUẶNG TỰ ĐỘNG /NUNG]` -> `clickEvent: run_command: "/nung"`
- `[SÀN ĐẤU GIÁ /AH]` -> `clickEvent: run_command: "/ah"`
- `[SẢNH BOSS /BOSS]` -> `clickEvent: run_command: "/boss"`
- `[NÔNG TRẠI /WARP FARM]` -> `clickEvent: run_command: "/warp farm"`
- `[ĐẤU TRƯỜNG /WARP PVP]` -> `clickEvent: run_command: "/warp pvp"`
- `[BẾN CÂU CÁ /WARP FISHING]` -> `clickEvent: run_command: "/warp fishing"`
- `[KHU THƯƠNG GIA /WARP TRADE]` -> `clickEvent: run_command: "/warp trade"`
- `[MỞ HÒM BÁU /WARP CRATES]` -> `clickEvent: run_command: "/warp crates"`
- Tóm tắt 6 bước luồng chơi RPG: Khởi đầu -> Đào khoáng & Farm -> Săn Boss 1-4 -> Nâng cấp trang bị Cổ Đại Tier 1-15.

---

### 3.3. Cấu Trúc Toàn Diện Cho `help.yml`

File `help.yml` hiện tại đang rỗng (0 bytes). Cần cấu hình chuẩn Paper 1.21.4 `general-topics` hỗ trợ tra cứu trực tiếp bằng lệnh `/help <chủ đề>` hoặc `/help <tên lệnh>`.

Nội dung đề xuất hoàn chỉnh:

```yaml
# ==============================================================================
# HỆ THỐNG TRỢ GIÚP SKYBLOCK VN (HELP.YML)
# ==============================================================================
ignore-plugins: []
command-topics-in-master-index: true

general-topics:
  HuongDan:
    shortText: "Hướng dẫn cơ bản và luồng tiến trình chơi Skyblock"
    fullText: |
      &6&l═══════════════════════════════════════════════
      &e&l        ✦ HƯỚNG DẪN CƠ BẢN SKYBLOCK VN ✦
      &6&l═══════════════════════════════════════════════
      &a1. Khởi Đầu:&f Gõ &a/tanthu&f nhận kit khởi nghiệp, gõ &a/is&f tạo đảo sinh tồn.
      &a2. Kiếm Tiền:&f Đào đá, farm quái, gõ &a/bankhoangsan&f hoặc &a/bando&f bán lấy xu.
      &a3. Săn Boss:&f Gõ &c/boss&f (hoặc &c/boss1&f..&c/boss4&f) để kiếm nguyên liệu Cổ Đại.
      &a4. Rèn Cổ Đại:&f Đến &b/warp trade&f gặp Thần Rèn nâng cấp trang bị Bậc 1 - 15.
      &7Gõ &e/help <tên lệnh>&7 để xem hướng dẫn chi tiết từng lệnh!

  Lenh:
    shortText: "Danh sách tổng hợp các lệnh thường dùng trên server"
    fullText: |
      &6&l═══════════════════════════════════════════════
      &e&l           ✦ DANH SÁCH LỆNH CƠ BẢN ✦
      &6&l═══════════════════════════════════════════════
      &a/is &7- Mở giao diện menu đảo, tạo đảo, dịch chuyển về đảo
      &a/tanthu &7- Nhận bộ trang bị và tài nguyên khởi đầu tân thủ
      &a/warp <tên> &7- Dịch chuyển đến các khu vực công cộng
      &a/boss &7- Đến Sảnh Boss Trung Tâm (/boss1, /boss2, /boss3, /boss4)
      &a/bankhoangsan &7- Bán nhanh toàn bộ khoáng sản lấy tiền (/bando)
      &a/daily &7- Nhận phần thưởng điểm danh hằng ngày
      &a/nung &7- Tự động nung quặng trên người (/smelt)
      &a/ah &7- Mở sàn đấu giá và chợ người chơi (/chotroi)
      &a/shop &7- Mở shop hệ thống
      &a/cauca &7- Đến bến câu cá (/warp fishing)
      &a/banexp &7- Bán cấp độ EXP đổi tiền Vault
      &a/bottle &7- Đóng chai EXP lưu trữ

  is:
    shortText: "Lệnh quản lý đảo Skyblock (/is)"
    fullText: |
      &6&l✦ HƯỚNG DẪN LỆNH ĐẢO (/IS) ✦
      &a/is &7- Mở bảng điều khiển giao diện menu đảo
      &a/is create &7- Tạo hòn đảo sinh tồn mới
      &a/is go &7(hoặc &a/is home&7) - Dịch chuyển về đảo cá nhân
      &a/is sethome &7- Đặt điểm xuất hiện trên đảo
      &a/is level &7- Quét và tính cấp độ hòn đảo
      &a/is team &7- Quản lý đồng đội và nhóm sinh tồn
      &a/is invite <tên> &7- Mời người chơi khác vào đảo
      &a/is kick <tên> &7- Xóa thành viên khỏi đảo
      &a/is warp <tên> &7- Đến thăm đảo của người chơi khác

  warp:
    shortText: "Danh sách các điểm dịch chuyển công cộng (/warp)"
    fullText: |
      &6&l✦ HỆ THỐNG ĐIỂM WARP (/WARP) ✦
      &a/warp spawn &7- Sảnh chính Spawn Hub
      &a/warp boss &7- Sảnh Boss Trung Tâm (/boss1, /boss2, /boss3, /boss4)
      &a/warp farm &7- Nông trại & Mob farm luyện cấp
      &a/warp trade &7- Chợ thương gia & Thần Rèn Cổ Đại
      &a/warp pvp &7- Đấu trường đọ kiếm 1v1 & Pháo đài Siege
      &a/warp fishing &7- Bến câu cá thư giãn & đổi cá (/cauca)
      &a/warp crates &7- Khu mở hòm báu Neon
      &a/warp casino &7- Sòng bạc Coinflip (/cf) & Vé số (/xoso)
      &a/warp parkour &7- Thử thách nhảy Parkour leo tháp

  boss:
    shortText: "Điều hướng và thông tin Đấu Trường Boss (/boss)"
    fullText: |
      &6&l✦ HỆ THỐNG ĐẤU TRƯỜNG BOSS (/BOSS) ✦
      &c/boss &7- Sảnh Boss Trung Tâm (gặp NPC Thợ Săn Boss)
      &a/boss1 &7- Boss 1: Nữ Hoàng Nhện (150 HP) -> Rơi Mảnh Quặng Cổ Đại (Tier 1-5)
      &a/boss2 &7- Boss 2: Đao Phủ Địa Ngục (300 HP) -> Rơi Tinh Thể Cổ Đại (Tier 6-9)
      &a/boss3 &7- Boss 3: Chúa Tể Bóng Tối (600 HP) -> Rơi Trái Tim Của Quỷ (Tier 10)
      &a/boss4 &7- World Boss: Thực Thể Hư Không (1200 HP) -> Rơi Lõi Hư Không (Tier 13-15)
      &7Tại mỗi đại điện đều có bệ áp suất để dịch chuyển ngược về Sảnh Boss!

  bankhoangsan:
    shortText: "Bán nhanh khoáng sản lấy tiền Vault (/bankhoangsan)"
    fullText: |
      &6&l✦ BÁN KHOÁNG SẢN (/BANKHOANGSAN) ✦
      &7Cú pháp: &a/bankhoangsan&7 hoặc alias: &a/bando&7, &a/sellores
      &7Tác dụng: Bán tức thì tất cả than, sắt, vàng, đồng, kim cương trong túi đồ.
      &7Tiền sẽ được daemon tự động cộng vào tài khoản Vault của bạn.

  tanthu:
    shortText: "Nhận Kit Tân Thủ khởi nghiệp (/tanthu)"
    fullText: |
      &6&l✦ QUÀ TÂN THỦ (/TANTHU) ✦
      &7Cú pháp: &a/tanthu&7 hoặc &a/kit tanthu
      &7Phần thưởng: Bộ dụng cụ sắt cường hóa, giáp da, 32 bò nướng, xô dung nham, băng, ngọc lục bảo và $1,000 khởi nghiệp.
      &7Thời gian hồi: 24 giờ.

  daily:
    shortText: "Nhận thưởng điểm danh hằng ngày (/daily)"
    fullText: |
      &6&l✦ ĐIỂM DANH HẰNG NGÀY (/DAILY) ✦
      &7Cú pháp: &a/daily&7 hoặc &a/kit daily
      &7Phần thưởng: 16 bò nướng, than đá, 2 kim cương, Chìa Khóa Hòm Đồng và $500.
      &7Thời gian hồi: 24 giờ (mỗi ngày nhận 1 lần).

  ah:
    shortText: "Sàn đấu giá & Hướng dẫn mở shop cá nhân (/ah)"
    fullText: |
      &6&l✦ SÀN ĐẤU GIÁ & CHỢ TỰ DO (/AH) ✦
      &7Cú pháp: &a/ah&7 hoặc &a/chotroi
      &7Tạo shop rương trên đảo cá nhân (ChestShop):
      &eDòng 1: [Để trống tự điền tên]
      &eDòng 2: [Số lượng vật phẩm bán]
      &eDòng 3: B <giá mua> : S <giá bán>
      &eDòng 4: [Tên vật phẩm hoặc click ? trên rương]

  shop:
    shortText: "Cửa hàng hệ thống IridiumSkyblock (/shop)"
    fullText: |
      &6&l✦ CỬA HÀNG HỆ THỐNG (/SHOP) ✦
      &7Cú pháp: &a/shop&7 hoặc &a/is shop
      &7Mua bán các khối xây dựng, hạt giống, mob drops và vật phẩm tiện ích cơ bản.

  nung:
    shortText: "Tự động nung nhanh quặng thô (/nung)"
    fullText: |
      &6&l✦ LỆNH NUNG NHANH (/NUNG) ✦
      &7Cú pháp: &a/nung&7 hoặc &a/smelt
      &7Tác dụng: Nung lập tức toàn bộ quặng sắt thô, vàng thô, đồng thô, cát, đất sét trong túi đồ mà không cần dùng lò nung!

  cauca:
    shortText: "Đến bến câu cá giải trí & đổi thưởng (/cauca)"
    fullText: |
      &6&l✦ HỒ CÂU CÁ (/CAUCA) ✦
      &7Cú pháp: &a/cauca&7 hoặc &a/warp fishing
      &7Gặp NPC Lão Ngư để đổi cá lấy Ngọc Lục Bảo và mua Cần Câu Thần Kỳ!

  pvp:
    shortText: "Đấu trường sinh tử PvP (/pvp)"
    fullText: |
      &6&l✦ ĐẤU TRƯỜNG PVP (/PVP) ✦
      &7Cú pháp: &a/pvp&7 hoặc &a/warp pvp
      &7Trang bị kit chiến binh: &a/pvpkit
      &7Có 2 khu vực: Võ đài La Mã 1v1 và Pháo đài công thành Hỗn Chiến Team Siege!

  trade:
    shortText: "Khu thương gia & Thần Rèn Cổ Đại (/trade)"
    fullText: |
      &6&l✦ KHU THƯƠNG GIA & THẦN RÈN (/TRADE) ✦
      &7Cú pháp: &a/trade&7 hoặc &a/warp trade
      &7Nơi tập hợp Đại Sư Luyện Kim, Thần Rèn Cúp/Rìu, Thần Rèn Kiếm/Giáp để tiến hóa trang bị từ Tier 1 lên Tier 15!
```

---

## 4. Tác Động Và Phụ Thuộc Cần Lưu Ý

1. **Tương thích parser YAML**:
   - `help.yml`, `commands.yml`, và 4 file warps `boss1.yml` .. `boss4.yml` phải được lưu dưới định dạng **UTF-8 (no BOM)**, sử dụng dấu thụt lề bằng space (tuyệt đối không dùng Tab).
2. **Kiểm tra cú pháp Datapack (`verify_syntax.py`)**:
   - Các file function chỉnh sửa (`build_boss_multi.mcfunction`, `build_spawn.mcfunction`, `tick.mcfunction`, `setup.mcfunction`, `summon_boss_1..4.mcfunction`, `boss_1..4_defeated.mcfunction`) và các file mới (`hunter_menu.mcfunction`, `menu.mcfunction` hướng dẫn) phải bảo đảm cân bằng 100% các cặp ngoặc `{}` và `[]`, cũng như số lượng nháy đơn `'` chẵn.
3. **Phân quyền và chế độ chơi Adventure**:
   - Tại Overworld, người chơi bình thường ở chế độ Adventure (`gamemode adventure`). Tấm áp suất `pressure_plate` và nút bấm `stone_button` hoạt động bình thường trong Adventure mode.
   - Các lệnh `/warp boss1..4` và `/tanthu`, `/daily`, `/bankhoangsan` là lệnh Essentials/Bukkit cho phép người chơi gõ trực tiếp mà không cần OP.
4. **Hiệu năng Server**:
   - Biển trạng thái boss được cập nhật dựa trên sự kiện (Event-driven khi Boss xuất hiện và khi Boss chết), hoàn toàn không spam lệnh `setblock` mỗi tick, giữ nguyên TPS 20.0 ổn định.

---

## 5. Kế Hoạch Triển Khai Chi Tiết Cho Implementer

| Bước | Hành động | File tác động | Nội dung chính |
|---|---|---|---|
| **1** | Tạo 4 file Warp Boss | `plugins/Essentials/warps/boss1.yml`<br>`plugins/Essentials/warps/boss2.yml`<br>`plugins/Essentials/warps/boss3.yml`<br>`plugins/Essentials/warps/boss4.yml` | Khai báo tọa độ 4 đấu trường chuẩn format Essentials |
| **2** | Cập nhật Alias lệnh | `commands.yml` | Bổ sung `boss1`, `boss2`, `boss3`, `boss4`, `huongdan`, `guide` |
| **3** | Cập nhật nội dung Help | `help.yml` | Ghi đè toàn bộ các chủ đề trợ giúp tra cứu chuẩn |
| **4** | Thêm NPC Thợ Săn Boss & Biển Trạng Thái | `world/.../build_boss_multi.mcfunction` | Triệu hồi NPC Thợ Săn Boss tại Sảnh, dựng bệ Return TP tại 4 đại điện, khởi tạo 4 biển trạng thái |
| **5** | Tạo Menu Tellraw Thợ Săn Boss | `world/.../boss/hunter_menu.mcfunction` | Viết file function hiển thị menu tellraw chọn boss |
| **6** | Cập nhật Trạng Thái Động Khi Triệu Hồi/Bị Tiêu Diệt | `world/.../summon_boss_1..4.mcfunction`<br>`world/.../boss/boss_1..4_defeated.mcfunction` | Cập nhật biển trạng thái tương ứng sang `ĐANG CHIẾN ĐẤU` và trả về `SẴN SÀNG` |
| **7** | Thêm NPC Hướng Dẫn Viên Tân Thủ | `world/.../build_spawn.mcfunction` | Triệu hồi NPC Hướng Dẫn Viên tại trục Nam đài Beacon Spawn |
| **8** | Tạo Menu Tellraw Tân Thủ | `world/.../guide/menu.mcfunction` | Viết file function hiển thị menu tellraw newbie đầy đủ |
| **9** | Đăng ký Trigger & Tương Tác | `world/.../setup.mcfunction`<br>`world/.../tick.mcfunction` | Đăng ký trigger `huongdan`, thêm lệnh xử lý interaction cho `boss_hunter_interact` và `guide_interact`, xử lý fail-safe return TP |
| **10** | Chạy kiểm tra cú pháp | `verify_syntax.py` | Chạy xác minh cú pháp 100% PASS cho toàn bộ file mcfunction |
