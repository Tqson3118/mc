# KẾ HOẠCH KHẮC PHỤC LỖI TÍNH TOÀN VẸN & HỒI QUY KIẾN TRÚC
## (REMEDIATION PLAN FOR WORKER)

- **Dự án**: Paper 1.21.4 Skyblock Server
- **Tác giả lập kế hoạch**: Explorer Remediation 1 (`teamwork_preview_explorer_remediation_1`)
- **Đối tượng thực thi**: Implementation Worker / Remediation Worker
- **Mục tiêu**: Khắc phục triệt để lỗi ghi đè dữ liệu (clobber regression) của `generate_all.py` đối với `setup.mcfunction` và `tick.mcfunction`, đồng thời sửa lỗi cú pháp JSON trong `exp/menu.mcfunction` và lỗi dấu nháy đơn trong các file đóng chai EXP.

---

## I. TỔNG QUAN NGUYÊN NHÂN GỐC RỄ (ROOT CAUSE ANALYSIS)

1. **Lỗi Hồi Quy Kiến Trúc trong `generate_all.py` (Critical Integrity Regression)**:
   - File `generate_all.py` chứa 2 hàm `update_setup_mcfunction()` (dòng 598–640) và `update_tick_mcfunction()` (dòng 689–794) sử dụng các chuỗi template tĩnh được viết từ thời điểm Milestone M1.
   - Khi các Worker sau (M2 và M5) bổ sung tính năng tương tác NPC Thợ Săn Boss, bệ dịch chuyển rút lui khẩn cấp (M2), NPC Hướng Dẫn Viên, và trigger `/huongdan` (M5), họ chỉ sửa trực tiếp vào file `.mcfunction` trên đĩa mà không cập nhật lại vào các template trong `generate_all.py`.
   - Kết quả: Khi chạy `python generate_all.py` (bước bắt buộc theo Tiêu chí Nghiệm thu 1), script đã ghi đè và xóa sổ toàn bộ mã của M2 và M5, khiến `test_m2.py` bị sập với `AssertionError` ở dòng 62 và làm tê liệt các NPC tương tác trong game.

2. **Lỗi Cú Pháp JSON trong `exp/menu.mcfunction` (JSON Syntax Crash)**:
   - Tại dòng 4 của `world/datapacks/skyblock_spawn/data/skyblock/function/exp/menu.mcfunction`, có đúng 3 vị trí kết thúc phần tử `hoverEvent` bị thừa 1 dấu ngoặc nhọn đóng (chứa `}}}` thay vì `}}`):
     - Nút "BÁN 10 LEVEL"
     - Nút "BÁN 30 LEVEL"
     - Nút "BÁN TẤT CẢ LEVEL"
   - Hậu quả: Trình phân tích JSON của Minecraft sập với `JSONDecodeError: Expecting ',' delimiter: line 1 column 1081 (char 1080)` và `Curly mismatch (-3)`. Lệnh `/banexp` hoặc `/bottle` không thể mở được menu tương tác trong chat.

3. **Lỗi Ký Tự Nháy Đơn trong các file `exp/bottle_*.mcfunction` (Odd Quote Mismatch)**:
   - Các file `bottle_1.mcfunction` (dòng 10), `bottle_16.mcfunction` (dòng 10), và `bottle_all.mcfunction` (dòng 19) chứa chuỗi tiếng Anh `(Bottle o' Enchanting)`.
   - Dấu nháy đơn `'` trong từ `o'` khiến các công cụ kiểm tra cú pháp nghiêm ngặt báo lỗi `Quote mismatch (1)`.

---

## II. KẾ HOẠCH THỰC THI TỪNG BƯỚC CHO WORKER (STEP-BY-STEP REMEDIATION)

Worker thực hiện chính xác theo 4 bước tuần tự sau:

---

### BƯỚC 1: CẬP NHẬT `generate_all.py` (ĐỒNG BỘ NGUỒN CHÂN LÝ SSOT)

**File mục tiêu**: `C:\Users\Administrator\.gemini\antigravity\scratch\Skyblock-Server\generate_all.py`

#### 1.1. Cập nhật hàm `update_setup_mcfunction()`:
- **Vị trí**: Khoảng dòng 624–627.
- **Mục đích**: Đăng ký Scoreboard trigger objective `huongdan` để lệnh `/huongdan` và `/guide` không bị báo lỗi "Unknown scoreboard objective".
- **Đoạn mã hiện tại (Target)**:
```python
# Scoreboards cho các hệ thống
scoreboard objectives add nung trigger {"text":"Lệnh Nung Nhanh","color":"gold"}
scoreboard objectives add evolution trigger {"text":"Nhận Đồ Test Tiến Hóa","color":"gold"}
scoreboard objectives add setup trigger {"text":"Cài Đặt Lại Hệ Thống","color":"green"}
scoreboard objectives add temp dummy
scoreboard objectives add smelted dummy
```
- **Đoạn mã thay thế (Replacement)**:
```python
# Scoreboards cho các hệ thống
scoreboard objectives add nung trigger {"text":"Lệnh Nung Nhanh","color":"gold"}
scoreboard objectives add evolution trigger {"text":"Nhận Đồ Test Tiến Hóa","color":"gold"}
scoreboard objectives add setup trigger {"text":"Cài Đặt Lại Hệ Thống","color":"green"}
scoreboard objectives add huongdan trigger {"text":"Hướng Dẫn Tân Thủ","color":"gold"}
scoreboard objectives add temp dummy
scoreboard objectives add smelted dummy
```

#### 1.2. Cập nhật hàm `update_tick_mcfunction()`:
- **Vị trí**: Khoảng dòng 721–733.
- **Mục đích**:
  1. Kích hoạt trigger `huongdan` cho toàn bộ người chơi.
  2. Lắng nghe và xử lý khi người chơi gõ `/huongdan` hoặc `/guide` (`scores={huongdan=1..}`).
  3. Xử lý tương tác click chuột phải vào NPC Thợ Săn Boss (`boss_hunter_interact`) -> Mở menu `skyblock:boss/hunter_menu`.
  4. Xử lý tương tác click chuột phải vào NPC Hướng Dẫn Viên (`guide_interact`) -> Mở menu `skyblock:guide/menu`.
  5. Thiết lập cơ chế kiểm tra tọa độ Fail-Safe tự động dịch chuyển người chơi về Sảnh Boss (`0.5 111.0 58.0`) tại 4 đấu trường boss phòng khi redstone bị lag.

- **Đoạn mã hiện tại (Target)**:
```python
# Enable trigger cho toan bo nguoi choi
scoreboard players enable @a nung
scoreboard players enable @a evolution
scoreboard players enable @a setup

# Khi nguoi choi go /nung (kich hoat trigger nung >= 1)
execute as @a[scores={nung=1..}] at @s run function skyblock:smelt_ores

# Khi nguoi choi go /trigger evolution (kich hoat nhan vat pham test tien hoa)
execute as @a[scores={evolution=1..}] at @s run function skyblock:build_evolution_items
scoreboard players set @a[scores={evolution=1..}] evolution 0

# Khi nguoi choi go /trigger setup (kich hoat cai dat lai he thong)
execute as @a[scores={setup=1..}] at @s run function skyblock:setup
scoreboard players set @a[scores={setup=1..}] setup 0
```

- **Đoạn mã thay thế (Replacement)**:
```python
# Enable trigger cho toan bo nguoi choi
scoreboard players enable @a nung
scoreboard players enable @a evolution
scoreboard players enable @a setup
scoreboard players enable @a huongdan

# Khi nguoi choi go /nung (kich hoat trigger nung >= 1)
execute as @a[scores={nung=1..}] at @s run function skyblock:smelt_ores

# Khi nguoi choi go /trigger evolution (kich hoat nhan vat pham test tien hoa)
execute as @a[scores={evolution=1..}] at @s run function skyblock:build_evolution_items
scoreboard players set @a[scores={evolution=1..}] evolution 0

# Khi nguoi choi go /trigger setup (kich hoat cai dat lai he thong)
execute as @a[scores={setup=1..}] at @s run function skyblock:setup
scoreboard players set @a[scores={setup=1..}] setup 0

# Khi nguoi choi go /huongdan hoac /guide (kich hoat trigger huongdan >= 1)
execute as @a[scores={huongdan=1..}] at @s run function skyblock:guide/menu
scoreboard players set @a[scores={huongdan=1..}] huongdan 0

# ==============================================================================
# HỆ THỐNG TƯƠNG TÁC NPC & DỊCH CHUYỂN AN TOÀN (M2 & M5)
# ==============================================================================

# Tương tác NPC Thợ Săn Boss (Milestone M2)
execute as @e[type=interaction,tag=boss_hunter_interact] if data entity @s interaction on target run function skyblock:boss/hunter_menu
execute as @e[type=interaction,tag=boss_hunter_interact] run data remove entity @s interaction

# Tương tác NPC Hướng Dẫn Viên Tân Thủ (Milestone M5)
execute as @e[type=interaction,tag=guide_interact] if data entity @s interaction on target run function skyblock:guide/menu
execute as @e[type=interaction,tag=guide_interact] run data remove entity @s interaction

# Bệ Dịch Chuyển Rút Lui Khẩn Cấp 4 Đấu Trường Boss (Milestone M2 Fail-Safe)
execute in minecraft:overworld as @a[x=-19,y=110,z=74,dx=1,dy=2,dz=1] run teleport @s 0.5 111.0 58.0 0.0 0.0
execute in minecraft:overworld as @a[x=18,y=110,z=74,dx=1,dy=2,dz=1] run teleport @s 0.5 111.0 58.0 0.0 0.0
execute in minecraft:overworld as @a[x=2,y=110,z=101,dx=1,dy=2,dz=1] run teleport @s 0.5 111.0 58.0 0.0 0.0
execute in minecraft:overworld as @a[x=-26,y=110,z=101,dx=1,dy=2,dz=1] run teleport @s 0.5 111.0 58.0 0.0 0.0
```

---

### BƯỚC 2: KHẮC PHỤC LỖI CÚ PHÁP TRONG `exp/menu.mcfunction`

**File mục tiêu**: `C:\Users\Administrator\.gemini\antigravity\scratch\Skyblock-Server\world\datapacks\skyblock_spawn\data\skyblock\function\exp\menu.mcfunction`

- **Vị trí**: Dòng 4.
- **Hành động**: Thay thế đúng 3 cụm `}}}` bằng `}}`.
- **Chi tiết 3 vị trí**:
  1. Vị trí 1 (sau nút bán 10 level):
     - Trước: `...Click để bán 10 Cấp độ nhận ngay +$1,500 vào Số Dư"}}},{"text":"\n  ▶ "`
     - Sau: `...Click để bán 10 Cấp độ nhận ngay +$1,500 vào Số Dư"}},{"text":"\n  ▶ "`
  2. Vị trí 2 (sau nút bán 30 level):
     - Trước: `...Click để bán 30 Cấp độ nhận ngay +$5,500 vào Số Dư"}}},{"text":"\n  ▶ "`
     - Sau: `...Click để bán 30 Cấp độ nhận ngay +$5,500 vào Số Dư"}},{"text":"\n  ▶ "`
  3. Vị trí 3 (sau nút bán tất cả level):
     - Trước: `...Click để bán toàn bộ Cấp độ EXP hiện có lấy Số Dư!"}}},{"text":"\n──────`
     - Sau: `...Click để bán toàn bộ Cấp độ EXP hiện có lấy Số Dư!"}},{"text":"\n──────`

- **Nội dung hoàn chỉnh dòng 4 sau khi sửa**:
```mcfunction
tellraw @s [{"text":"\n═══════════════════════════════════════════════\n","color":"gold","bold":true},{"text":"         ⚡ TRUNG TÂM GIAO DỊCH KINH NGHIỆM (EXP) ⚡\n","color":"yellow","bold":true},{"text":"  Cấp độ hiện tại của bạn: ","color":"gray"},{"score":{"name":"@s","objective":"player_lvl"},"color":"green","bold":true},{"text":" Cấp (Level)\n","color":"green"},{"text":"───────────────────────────────────────────────\n","color":"dark_gray"},{"text":"  💰 BÁN CẤP ĐỘ EXP LẤY SỐ DƯ ($):\n","color":"gold","bold":true},{"text":"  ▶ ","color":"yellow"},{"text":"[ BÁN 5 LEVEL  ➔ NHẬN +$500 SỐ DƯ ]","color":"green","bold":true,"underlined":true,"clickEvent":{"action":"run_command","value":"/banexp 5"},"hoverEvent":{"action":"show_text","contents":"Click để bán 5 Cấp độ nhận ngay +$500 vào Số Dư"}},{"text":"\n  ▶ ","color":"yellow"},{"text":"[ BÁN 10 LEVEL ➔ NHẬN +$1,500 SỐ DƯ ]","color":"aqua","bold":true,"underlined":true,"clickEvent":{"action":"run_command","value":"/banexp 10"},"hoverEvent":{"action":"show_text","contents":"Click để bán 10 Cấp độ nhận ngay +$1,500 vào Số Dư"}},{"text":"\n  ▶ ","color":"yellow"},{"text":"[ BÁN 30 LEVEL ➔ NHẬN +$5,500 SỐ DƯ ]","color":"light_purple","bold":true,"underlined":true,"clickEvent":{"action":"run_command","value":"/banexp 30"},"hoverEvent":{"action":"show_text","contents":"Click để bán 30 Cấp độ nhận ngay +$5,500 vào Số Dư"}},{"text":"\n  ▶ ","color":"yellow"},{"text":"[ 🔥 BÁN TẤT CẢ LEVEL HIỆN CÓ ➔ QUY ĐỔI TOÀN BỘ ]","color":"gold","bold":true,"underlined":true,"clickEvent":{"action":"run_command","value":"/banexp all"},"hoverEvent":{"action":"show_text","contents":"Click để bán toàn bộ Cấp độ EXP hiện có lấy Số Dư!"}},{"text":"\n───────────────────────────────────────────────\n","color":"dark_gray"},{"text":"  🧪 ĐÓNG CHAI KINH NGHIỆM (BÌNH EXP):\n","color":"aqua","bold":true},{"text":"  ▶ ","color":"yellow"},{"text":"[ ĐÓNG 1 BÌNH EXP ]","color":"green","bold":true,"underlined":true,"clickEvent":{"action":"run_command","value":"/bottle 1"},"hoverEvent":{"action":"show_text","contents":"Rút 1 level thành 1 Bình Kinh Nghiệm"}},{"text":"  ","color":"gray"},{"text":"[ ĐÓNG 16 BÌNH EXP ]","color":"aqua","bold":true,"underlined":true,"clickEvent":{"action":"run_command","value":"/bottle 16"},"hoverEvent":{"action":"show_text","contents":"Rút 16 level thành 16 Bình Kinh Nghiệm"}},{"text":"  ","color":"gray"},{"text":"[ ĐÓNG TẤT CẢ ]","color":"gold","bold":true,"underlined":true,"clickEvent":{"action":"run_command","value":"/bottle all"},"hoverEvent":{"action":"show_text","contents":"Rút toàn bộ cấp độ hiện có thành các Bình Kinh Nghiệm"}},{"text":"\n───────────────────────────────────────────────\n","color":"dark_gray"},{"text":"  💡 Lệnh gõ nhanh: ","color":"gray"},{"text":"/banexp [số level / all]","color":"yellow","bold":true},{"text":" | ","color":"dark_gray"},{"text":"/bottle [số lượng / all]\n","color":"aqua","bold":true},{"text":"═══════════════════════════════════════════════\n","color":"gold","bold":true}]
```

---

### BƯỚC 3: TỐI ƯU HÓA DẤU NHÁY ĐƠN TRONG CÁC FILE ĐÓNG CHAI EXP (DEFENSIVE CLEANUP)

Để đảm bảo bộ kiểm tra cú pháp không bị cảnh báo do dấu nháy đơn tiếng Anh `o'`, cập nhật 3 dòng thông báo trong thư mục `exp/`:

1. **`world/datapacks/skyblock_spawn/data/skyblock/function/exp/bottle_1.mcfunction`** (Dòng 10):
   - Thay `(Bottle o' Enchanting)` thành `(Bottle of Enchanting)`

2. **`world/datapacks/skyblock_spawn/data/skyblock/function/exp/bottle_16.mcfunction`** (Dòng 10):
   - Thay `(Bottle o' Enchanting)` thành `(Bottle of Enchanting)`

3. **`world/datapacks/skyblock_spawn/data/skyblock/function/exp/bottle_all.mcfunction`** (Dòng 19):
   - Thay `(Bottle o' Enchanting)` thành `(Bottle of Enchanting)`

---

### BƯỚC 4: TÁI TẠO DATAPACK TỰ ĐỘNG (CODE GENERATION)

Sau khi hoàn thành Bước 1, chạy lệnh:
```powershell
python generate_all.py
```
**Kết quả mong đợi**:
```
Generated ...\build_evolution_items.mcfunction
Generated ...\build_evolution_npc.mcfunction
Updated ...\setup.mcfunction
Updated ...\summon_boss.mcfunction
Updated ...\tick.mcfunction
ALL 5 FILES GENERATED & UPDATED SUCCESSFULLY!
```
Lúc này, `generate_all.py` sẽ tự động ghi ra `setup.mcfunction` và `tick.mcfunction` phiên bản đầy đủ nhất, hoàn toàn bảo toàn các tính năng M2 và M5.

---

## III. QUY TRÌNH XÁC MINH TOÀN DIỆN (COMPREHENSIVE VERIFICATION SUITE)

Worker chạy toàn bộ các lệnh kiểm thử sau và ghi nhận kết quả:

### 1. Kiểm tra tích hợp Boss Navigation (Milestone M2):
```powershell
python .agents\teamwork\teamwork_preview_worker_m2\test_m2.py
```
- **Tiêu chuẩn đạt**: 100% PASS tất cả 7 Checks:
  - Check 1 (Warps): PASS
  - Check 2 (Aliases): PASS
  - Check 3 (Hunter Menu): PASS
  - Check 4 (build_boss_multi): PASS
  - Check 5 (tick.mcfunction): PASS
  - Check 6 (Summon & Defeated signs): PASS
  - Check 7 (M2 mcfunction syntax): PASS
  - Output: `=== ALL M2 VERIFICATION CHECKS PASSED 100% PERFECTLY! ===`

### 2. Kiểm tra Newbie Onboarding (Milestone M5):
```powershell
python .agents\teamwork\teamwork_preview_worker_m5\test_m5.py
```
- **Tiêu chuẩn đạt**: PASS toàn bộ 18 topics trong `help.yml`, 79 aliases trong `commands.yml`, và cú pháp 7 core files.

### 3. Kiểm tra cú pháp Datapack cốt lõi (`verify_syntax.py`):
```powershell
python verify_syntax.py
```
- **Tiêu chuẩn đạt**: `SUCCESS: ALL FILES PASSED SYNTAX AND BRACKET CHECKS!`.

### 4. Kiểm tra đối kháng toàn diện (Adversarial Suite M1-M5):
```powershell
python .agents\teamwork\teamwork_preview_reviewer_2\adversarial_test_suite.py
```
- **Tiêu chuẩn đạt**: 100% PASS cả 6 Challenges (Progression N-1, Aliases 79, Help 18 topics, Economy Daemon rotation/shared lock, Server stability & JVM, Boss warps).
- Output: `FINAL ADVERSARIAL VERDICT: ALL CHECKS PASSED PERFECTLY (APPROVE CANDIDATE)`.

### 5. Kiểm tra toàn bộ 70 file `.mcfunction` trong Datapack:
```powershell
python .agents\teamwork\teamwork_preview_explorer_remediation_1\test_syntax_all.py
```
- **Tiêu chuẩn đạt**: `Tested all 70 files with proposed fix. Errors: 0`.

---

## IV. BẢN ĐỒ RỦI RO & PHƯƠNG ÁN DỰ PHÒNG (CONTINGENCY & ROLLBACK)

| Rủi ro tiềm ẩn | Dấu hiệu nhận biết | Phương án xử lý |
|---|---|---|
| Quên chạy `python generate_all.py` sau khi sửa code | `test_m2.py` vẫn báo `AssertionError` ở dòng 62 | Chạy lại `python generate_all.py` để cập nhật `tick.mcfunction` trên đĩa |
| Nhầm lẫn vị trí thay thế trong `generate_all.py` | Lỗi cú pháp Python (`SyntaxError`) khi chạy `generate_all.py` | Kiểm tra lại cú pháp string `"""..."""` không dùng f-string, giữ nguyên indentation |
| Sửa nhầm ký tự trong `exp/menu.mcfunction` | `json.loads` báo lỗi delimiter hoặc số phần tử khác 29 | Đối chiếu với đoạn mã dòng 4 được cung cấp nguyên mẫu ở Mục II, Bước 2 |
