# Báo Cáo Handoff: Khảo Sát Yêu Cầu R2 & R5

- **Tác giả**: Teamwork Explorer 2
- **Thư mục làm việc**: `C:\Users\Administrator\.gemini\antigravity\scratch\Skyblock-Server\.agents\teamwork\teamwork_preview_explorer_survey_2`
- **File báo cáo chi tiết**: `C:\Users\Administrator\.gemini\antigravity\scratch\Skyblock-Server\.agents\teamwork\teamwork_preview_explorer_survey_2\survey_r2_r5.md`
- **Người nhận bàn giao**: Parent Orchestrator (`b445c53f-6e97-46d8-9262-8bf409bdae88`) và các implementer phụ trách R2, R5

---

## 1. Observation (Quan Sát Thực Tế)

1. **Warps Essentials**:
   - Thư mục `plugins/Essentials/warps/` chứa 12 file YAML: `boss.yml`, `casino.yml`, `cauca.yml`, `crates.yml`, `farm.yml`, `fishing.yml`, `mob.yml`, `parkour.yml`, `pvp.yml`, `shop.yml`, `spawn.yml`, `trade.yml`.
   - File `plugins/Essentials/warps/boss.yml`:
     ```yaml
     world: world
     x: 0.5
     y: 111.0
     z: 58.0
     yaw: 0.0
     pitch: 0.0
     name: boss
     ```
   - Chưa tồn tại 4 file: `boss1.yml`, `boss2.yml`, `boss3.yml`, `boss4.yml`.

2. **Cấu hình Alias Lệnh**:
   - File `commands.yml` (dòng 24-25) có:
     ```yaml
       boss:
       - warp boss $1-
     ```
   - Chưa khai báo alias cho `boss1`, `boss2`, `boss3`, `boss4`, `huongdan`, `guide`.

3. **File Trợ Giúp**:
   - File `help.yml` tại thư mục gốc server tồn tại nhưng hoàn toàn rỗng (kích thước 0 bytes).

4. **Kiến trúc Sảnh Boss & 4 Đấu Trường**:
   - Trích xuất từ `world/datapacks/skyblock_spawn/data/skyblock/function/build_boss_multi.mcfunction`:
     - Sảnh Trung Tâm: `Z: 56..70, X: -15..15, Y=110` (dòng 4). Bàn tiện ích và hòm ender tại `X: -3..3, Z: 58..59`. Biển chỉ dẫn 4 hướng tại dòng 96-109.
     - Đại Điện 1 (Động Nhện - Cấp 1): `Z: 75..95, X: -40..-18` (dòng 5). Cổng vào từ cầu Tây tại `X=-18, Z: 74..76` (dòng 173). Trụ kích hoạt triệu hồi tại `X=-20, Y=111, Z=77` (dòng 185). Tâm bệ tế lễ tại `X=-29, Z=85` (dòng 182).
     - Đại Điện 2 (Vực Lửa - Cấp 2): `Z: 75..95, X: 18..40` (dòng 6). Cổng vào từ cầu Đông tại `X=18, Z: 74..76` (dòng 218). Trụ kích hoạt triệu hồi tại `X=20, Y=111, Z=77` (dòng 223). Tâm bệ tế lễ tại `X=29, Z=85` (dòng 220).
     - Đại Điện 3 (Thành Trì Bóng Tối - Tuần Cấp 3): `Z: 100..130, X: -18..18` (dòng 7). Cổng vòm phía Bắc tại `X: -2..2, Z=100` (dòng 257). Trụ kích hoạt triệu hồi tại `X=0, Y=111, Z=103` (dòng 268). Tâm bệ tế lễ tại `X=0, Z=115` (dòng 264).
     - Đại Điện 4 (Thánh Địa Hư Không - World Boss Cấp 4): `Z: 100..130, X: -45..-25` (dòng 8). Cổng vào phía Đông cầu tím tại `X=-25, Z: 101..104` (dòng 307). Trụ kích hoạt triệu hồi tại `X=-27, Y=111, Z=103` (dòng 315). Tâm bệ tế lễ tại `X=-35, Z=115` (dòng 311).

5. **Scoreboard Trạng Thái Boss & Quản Lý Thực Thể**:
   - `world/.../function/setup.mcfunction` (dòng 44):
     `scoreboard objectives add boss_status dummy {"text":"Trạng Thái Boss","color":"red"}`
   - `world/.../function/tick.mcfunction` (dòng 99-107): Theo dõi `#boss_1_alive` .. `#boss_4_alive` (`boss_status = 1` khi có quái mang tag `boss_1`..`boss_4`, và chạy hàm `boss_X_defeated` khi quái biến mất).
   - `world/.../function/summon_boss_1..4.mcfunction`: Đặt điểm score thành 1 khi triệu hồi boss.

6. **Khu vực Spawn Hub**:
   - File `plugins/Essentials/warps/spawn.yml`: `world: world, x: 0.5, y: 121.0, z: 0.5, yaw: 0.0, pitch: 0.0`.
   - File `build_spawn.mcfunction`: Đài Beacon tại `X: 0, Y: 120, Z: 0`, trục đường chính Bắc-Nam tại `X: -2..2, Z: -15..15`. Trục Nam dẫn thẳng tới cầu Đấu Trường Boss.

---

## 2. Logic Chain (Chuỗi Suy Luận)

1. Từ **Observation 1 & 4**: Để đáp ứng yêu cầu người chơi gõ `/warp boss1`..`boss4` dịch chuyển tức thời đến cửa 4 đấu trường:
   - Cần tạo 4 file `boss1.yml` .. `boss4.yml` trong `plugins/Essentials/warps/` với tọa độ đặt tại cổng vào của từng đại điện:
     - `boss1`: `X: -18.5, Y: 111.0, Z: 75.5, yaw: 90.0`
     - `boss2`: `X: 18.5, Y: 111.0, Z: 75.5, yaw: -90.0`
     - `boss3`: `X: 0.5, Y: 111.0, Z: 101.5, yaw: 0.0`
     - `boss4`: `X: -25.5, Y: 111.0, Z: 102.5, yaw: 90.0`
2. Từ **Observation 2**: Khai báo alias `boss1`, `boss2`, `boss3`, `boss4` trong `commands.yml` cho phép người chơi gõ tắt trực tiếp `/boss1` thay vì phải gõ `/warp boss1`.
3. Từ **Observation 4 & Mẫu NPC Interaction**:
   - Tại Sảnh Boss Trung Tâm (`X: 0.5, Y: 111.0, Z: 58.0`), người chơi spawn nhìn về hướng Nam (`yaw: 0.0`). Đặt NPC "Thợ Săn Boss" tại `X: 0.5, Y: 111.0, Z: 61.5` (quay mặt hướng Bắc `yaw: 180.0`) tạo góc nhìn đối diện trực diện trực quan.
   - Khi người chơi tương tác với NPC, trigger function `skyblock:boss/hunter_menu` xuất menu tellraw có `clickEvent: run_command` đến `/warp boss1`..`/warp boss4`.
4. Từ **Observation 4 & Chế độ chơi Adventure**:
   - Để người chơi rút lui an toàn về Sảnh Boss Trung Tâm sau khi đánh xong hoặc khi nguy cấp, đặt bệ áp suất (Pressure Plate) trên một command block ngầm tại cửa ra vào mỗi đại điện chứa lệnh `teleport @p 0.5 111.0 58.0 0.0 0.0`. Đồng thời bổ sung kiểm tra vùng trong `tick.mcfunction` làm lớp bảo hiểm thứ 2 tránh sót trường hợp.
5. Từ **Observation 5**:
   - Thay vì chạy lệnh `setblock` mỗi tick gây tốn tài nguyên server, biển báo trạng thái boss tại Sảnh Boss Trung Tâm được thiết kế theo mô hình hướng sự kiện (Event-driven):
     - Khởi tạo `● SẴN SÀNG` trong `build_boss_multi.mcfunction`.
     - Chuyển thành `☠ ĐANG CHIẾN ĐẤU` trong `summon_boss_1..4.mcfunction`.
     - Trả về `● SẴN SÀNG` trong `boss_1..4_defeated.mcfunction`.
6. Từ **Observation 3 & 6**:
   - Tân thủ xuất hiện tại `X: 0.5, Y: 121.0, Z: 0.5` nhìn hướng Nam (`yaw: 0.0`). Đặt NPC "Hướng Dẫn Viên Tân Thủ" tại `X: 0.5, Y: 121.0, Z: 3.5` nhìn hướng Bắc (`yaw: 180.0`) giúp tân thủ nhìn thấy ngay biển hướng dẫn khi bước chân vào server.
   - Tương tác với NPC mở menu tellraw hướng dẫn đầy đủ luồng chơi, các warp và lệnh cơ bản.
   - File `help.yml` được cấu hình đầy đủ mục `general-topics` cho các lệnh `/is`, `/warp`, `/bankhoangsan`, `/tanthu`, `/daily`, `/boss`, `/ah`, `/nung`, `/cauca`, `/pvp`, `/trade`, `/shop`, `/banexp`, `/bottle`... theo chuẩn Paper.

---

## 3. Caveats (Giới Hạn & Điểm Cần Lưu Ý)

1. **Chế độ Adventure tại Overworld**: Mọi khối đặt tại Overworld không thể bị phá bởi người chơi thông thường. Tấm áp suất bằng đá/đá đen và nút bấm hoàn toàn hoạt động bình thường cho người chơi phi OP trong Adventure mode.
2. **Quyền hạn lệnh của người chơi**: Các lệnh `/warp boss1..4`, `/tanthu`, `/daily`, `/bankhoangsan` được cấu hình thông qua Bukkit/Essentials/Commands.yml, không yêu cầu quyền OP. Lệnh `/huongdan` nên được gắn qua cơ chế `trigger huongdan` trong `commands.yml` để mọi người chơi đều gõ được mà không bị chặn permission.
3. **Mã hóa file**: Cả 4 file warp, `commands.yml`, `help.yml` và các file `.mcfunction` phải được lưu dưới mã hóa UTF-8 (no BOM).

---

## 4. Conclusion (Kết Luận & Giải Pháp)

Khảo sát hoàn tất 100% mục tiêu của R2 và R5. Toàn bộ thông số tọa độ, mã nguồn YAML, mã lệnh mcfunction và cấu trúc tương tác đã được kiểm chứng và ghi chép chi tiết tại `survey_r2_r5.md`.

Các artifact sẵn sàng bàn giao cho Implementer:
1. Thông số chi tiết 4 file warp: `boss1.yml`, `boss2.yml`, `boss3.yml`, `boss4.yml`.
2. Đoạn mã bổ sung vào `commands.yml` (alias cho boss warps và lệnh hướng dẫn).
3. Nội dung toàn diện cho `help.yml` (chuẩn Paper `general-topics`).
4. Mã nguồn cập nhật cho `build_boss_multi.mcfunction`, `build_spawn.mcfunction`, `summon_boss_1..4.mcfunction`, `boss_1..4_defeated.mcfunction`, `tick.mcfunction`, `setup.mcfunction`.
5. Mã nguồn tạo mới 2 function menu tellraw: `world/.../boss/hunter_menu.mcfunction` và `world/.../guide/menu.mcfunction`.

---

## 5. Verification Method (Phương Pháp Xác Minh)

Sau khi implementer tiến hành chỉnh sửa:
1. **Kiểm tra cú pháp Datapack**:
   - Chạy script kiểm tra cú pháp:
     ```powershell
     python C:\Users\Administrator\.gemini\antigravity\scratch\Skyblock-Server\verify_syntax.py
     ```
   - Tiêu chí: Báo cáo `SUCCESS: ALL FILES PASSED SYNTAX AND BRACKET CHECKS!`.
2. **Kiểm tra tính hợp lệ của YAML**:
   - Sử dụng Python yaml parser để kiểm tra cú pháp các file YAML:
     ```powershell
     python -c "import yaml; [yaml.safe_load(open(f, encoding='utf-8')) for f in ['commands.yml', 'help.yml', 'plugins/Essentials/warps/boss1.yml', 'plugins/Essentials/warps/boss2.yml', 'plugins/Essentials/warps/boss3.yml', 'plugins/Essentials/warps/boss4.yml']]; print('ALL YAML VALID')"
     ```
   - Tiêu chí: In ra `ALL YAML VALID` không gặp SyntaxError.
3. **Kiểm tra sự tồn tại của file**:
   - Xác nhận có đủ 4 file warp trong `plugins/Essentials/warps/`.
   - Xác nhận `help.yml` có dung lượng > 0 bytes và chứa các section `is`, `warp`, `bankhoangsan`, `tanthu`, `daily`, `boss`.
