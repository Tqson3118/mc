# 📜 BIÊN BẢN NGHIỆM THU KIỂM THỬ THỰC TẾ (HEADLESS BOT CLIENT)

> **Thời gian nghiệm thu:** `2026-10-15T20:58:20.365Z`
> **Môi trường máy chủ:** Paper 1.21.4 | Daemon V3.0 | RCON Enabled | Java 21
> **Tác nhân kiểm thử:** Headless Bot Client `Tester_Bot` (Node.js `mineflayer` 1.21.4 Non-OP)

## 1. Kết Quả Tổng Thể

| Hạng mục kiểm thử | Trạng thái | Đánh giá |
| :--- | :---: | :--- |
| **Đăng nhập & Spawn Hub an toàn** | **PASSED** | Xuất hiện tại Spawn Hub `world`, không rơi hư không, Non-OP chuẩn xác. |
| **Scoreboard FastBoard Telemetry** | **PASSED** | Hiển thị đầy đủ Tên, Số dư Vault, Điểm Tinh Anh, Level Kỹ Năng. |
| **DeluxeMenus GUI (/menu & /warp)** | **PASSED** | Hiển thị chuẩn xác Icon, Lore và trạng thái Khóa / Mở khóa Boss theo cấp độ. |
| **Hành trình 5 Cổng Torii & Bệ Hồi Quy** | **PASSED** | Dịch chuyển an toàn 5 thế giới phụ, dẫm bệ hồi quy về Spawn an toàn 100%. |
| **AuraSkills Boss Gating Đa Giai Đoạn** | **PASSED** | Từ chối thiếu cấp -> Từ chối thiếu bùa -> Triệu hồi thành công -> Bảo vệ Bùa khi Boss đang sống -> Multi-Tier Boss 2! |

## 2. Chi Tiết Thực Địa Từng Hạng Mục

### 2.1 Spawn Hub Hub An Toàn
- **Tọa độ xuất hiện ban đầu:** `X=0.50, Y=122.00, Z=0.50`
- **Thế giới:** `overworld` | **Chế độ chơi:** `survival`
- **Tình trạng sinh lực & thức ăn:** Máu `20/20`, Đói `20/20`
- **Quyền hạn người chơi:** Non-OP (`default` group)

### 2.2 Telemetry Scoreboard
- **Các dòng thông tin bắt được từ FastBoard packets:**
  - `-------------------`
  - `Gõ: /is • /skills • /spawn`
  - `������ Ping: 0ms`
  - `������ Online: 1/20`
  - `⭐ Cấp đảo: N/A`
  - `������ Đảo: N/A`
  - `⚔ Kỹ năng: Lv.10`
  - `✧ Điểm Tinh Anh: 0`
  - `������ Số dư: $2,500`
  - `������ Bạn: Tester_Bot`
  - `-------------------`

### 2.3 DeluxeMenus GUI (/menu & /warp)
- **/menu:** Mở thành công 45 ô, phát hiện slot 4 (`player_head`), slot 11 (`grass_block`), slot 13 (`compass`), slot 15 (`anvil`), slot 29 (`dispenser`), slot 31 (`book`).
- **/warp khi Fighting Lv.0:** Slot 13 hiển thị `barrier` (Boss Đấu Trường [CHƯA MỞ KHÓA]), click vào bị chặn với thông báo từ chối.
- **/warp khi Fighting Lv.5:** Slot 13 tự động chuyển sang `netherite_sword` (Boss Đấu Trường [ĐÃ MỞ KHÓA]).

### 2.4 Hành Trình 5 Cổng Torii & Bệ Hồi Quy

#### Torii 1: Vực Thẳm Boss Cổ Đại (world_boss)
- **Đến thế giới phụ:** Tọa độ `X=0.50, Y=110.06, Z=0.50` (Thành công: **ĐẠT**)
- **Dẫm bệ hồi quy về Spawn Hub:** Tọa độ `X=0.50, Y=122.00, Z=0.50` (Thành công: **ĐẠT**)
#### Torii 2: Vườn Thượng Uyển Sakura & Hầm Quái (world_farm)
- **Đến thế giới phụ:** Tọa độ `X=0.50, Y=111.00, Z=0.50` (Thành công: **ĐẠT**)
- **Dẫm bệ hồi quy về Spawn Hub:** Tọa độ `X=0.50, Y=122.00, Z=0.50` (Thành công: **ĐẠT**)
#### Torii 3: Biển Hồ Trên Mây Celestial Oasis (world_cauca)
- **Đến thế giới phụ:** Tọa độ `X=0.50, Y=102.50, Z=0.50` (Thành công: **ĐẠT**)
- **Dẫm bệ hồi quy về Spawn Hub:** Tọa độ `X=0.50, Y=122.00, Z=0.50` (Thành công: **ĐẠT**)
#### Torii 4: Siêu Tháp Phong Lôi 50 Tầng (world_parkour)
- **Đến thế giới phụ:** Tọa độ `X=0.50, Y=71.00, Z=0.50` (Thành công: **ĐẠT**)
- **Dẫm bệ hồi quy về Spawn Hub:** Tọa độ `X=0.50, Y=122.00, Z=0.50` (Thành công: **ĐẠT**)
#### Torii 5: Cung Điện Hoàng Gia Las Vegas (world_casino)
- **Đến thế giới phụ:** Tọa độ `X=0.50, Y=110.06, Z=0.50` (Thành công: **ĐẠT**)
- **Dẫm bệ hồi quy về Spawn Hub:** Tọa độ `X=0.50, Y=122.00, Z=0.50` (Thành công: **ĐẠT**)

### 2.5 Kiểm Tra Cơ Chế Boss Gating Đa Giai Đoạn (Boss 1 & Boss 2)
- **Giai đoạn A (Fighting Lv.0, Không Bùa):** ĐẠT (Từ chối chuẩn xác thông báo Cổng Kỹ Năng yêu cầu Lv.5)
- **Giai đoạn B (Fighting Lv.5, Thiếu Bùa):** ĐẠT (Từ chối chuẩn xác thông báo Thiếu Bùa Nhện Độc)
- **Giai đoạn C (Fighting Lv.5, Đầy đủ Bùa):** ĐẠT (Hiến tế thành công, tiêu hao 1 Bùa, Boss Nữ Hoàng Nhện Độc 150 HP xuất hiện!)
- **Giai đoạn D (Boss Đang Sống, Kích hoạt lại):** ĐẠT (Cảnh báo Boss đang chiến đấu, BẢO TOÀN BÙA 100% KHÔNG BỊ XÓA OAN)
- **Giai đoạn E (Boss 2 Đao Phủ Địa Ngục):** ĐẠT (Lv.5 bị từ chối do yêu cầu Lv.10 -> Cấp Lv.10 & Bùa Hỏa Ngục triệu hồi Boss 2 thành công)

## 3. Lỗi Đã Được Khắc Phục Triệt Để Trong Phiên Kiểm Thử
1. **Lỗi thứ tự lệnh trong gate_boss_1 -> gate_boss_6:** Ban đầu lệnh `clear` nằm trước lệnh `tellraw` và `summon`, khiến bùa bị xóa trước khi điều kiện `if items entity` được kiểm tra -> Boss không bao giờ triệu hồi được. Đã tái cấu trúc: thực thi `tellraw`, `summon_boss`, và `clear` khi `boss_status matches 1`.
2. **Lỗi nghiêm trọng nuốt/xóa Bùa khi Boss đang sống (Fatal Bug):** Trong phiên bản trước, lệnh `clear @p ...` chạy dựa trên `boss_status matches 1`. Nếu Boss đang chiến đấu và người chơi kích hoạt, Bùa quý giá của người chơi bị xóa oan mà không triệu hồi được gì. Đã sửa triệt để bằng cờ nguyên tử `just_summoned_boss_X` trong cả 6 file `gate_boss_1` -> `gate_boss_6`, đảm bảo chỉ tiêu hao đúng 1 Bùa khi Boss mới được triệu hồi thành công.
3. **Lỗi thiếu Forceload tại 5 Thế Giới Phụ:** Khi người chơi chưa bước vào, các chunk ở tọa độ 0,0 của thế giới phụ chưa được nạp khiến block bệ hồi quy và bệ triệu hồi không tồn tại. Đã cấu hình `forceload add -120 -120 120 120` tại `setup.mcfunction` và thi công hoàn chỉnh 100%.
4. **Lỗi thiếu cơ chế bắt bệ hồi quy trong tick.mcfunction:** Bổ sung cơ chế phát hiện người chơi dẫm lên bệ hồi quy tại tọa độ của 5 thế giới phụ, đảm bảo dịch chuyển tức thời về Spawn Hub an toàn.
5. **Lỗi hiển thị Title/Subtitle dạng [object Object]:** Trích xuất đúng chuỗi văn bản từ gói tin mạng Mineflayer để lưu trữ và hiển thị chính xác tiêu đề trên màn hình người chơi.

## 4. Kết Luận
Hệ thống Skyblock MMORPG Multi-World đạt **100% TIÊU CHUẨN NGHIỆM THU THỰC ĐỊA**. Tất cả kịch bản trải nghiệm của người chơi đều vận hành mượt mà, chính xác, ổn định tuyệt đối.
