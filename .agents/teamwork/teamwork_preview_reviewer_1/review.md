# BÁO CÁO REVIEW CHI TIẾT (MILESTONES M1 - M5)
**Dự án**: Paper 1.21.4 Skyblock Server  
**Reviewer**: Reviewer 1 (Teamwork Reviewer & Adversarial Critic)  
**Ngày thực hiện**: 2026-10-12  
**Thư mục làm việc**: `C:\Users\Administrator\.gemini\antigravity\scratch\Skyblock-Server\.agents\teamwork\teamwork_preview_reviewer_1`  
**Yêu cầu gốc**: `ORIGINAL_REQUEST.md` (R1 - R5) & `PROJECT.md`  

---

## I. TỔNG KẾT REVIEW (REVIEW SUMMARY)

**KẾT LUẬN (VERDICT)**: ❌ **REQUEST_CHANGES**

### Tóm tắt lý do:
Mặc dù các Worker M1, M2, M3, M4, M5 đã hoàn thành phần lớn logic chuyên biệt cho từng tính năng, đã xảy ra một **xung đột kiến trúc nghiêm trọng (Architectural Conflict & Regression)** giữa script sinh mã `generate_all.py` (M1) và các file runtime `tick.mcfunction` / `setup.mcfunction` (M2, M5):
- Hàm `update_tick_mcfunction()` và `update_setup_mcfunction()` trong `generate_all.py` chứa mã tĩnh cũ.
- Khi `generate_all.py` được thực thi (đây là bước bắt buộc theo Acceptance Criteria 1), script này đã **ghi đè và xóa sổ hoàn toàn** các đoạn mã xử lý tương tác click NPC Thợ Săn Boss (`boss_hunter_interact`), 4 bệ dịch chuyển rút lui khẩn cấp (Fail-Safe Return TP Pads), tương tác click NPC Hướng Dẫn Viên (`guide_interact`), và trigger `/huongdan` trong `tick.mcfunction` và `setup.mcfunction`.
- Hậu quả: Script kiểm thử tự động `test_m2.py` bị sập với lỗi `AssertionError` (dòng 62), và trong game thực tế, người chơi click chuột phải vào cả 2 NPC quan trọng đều hoàn toàn không có phản hồi!

---

## II. PHÁT HIỆN LỖI (FINDINGS)

### [CRITICAL] Finding 1: `generate_all.py` ghi đè và phá hủy logic runtime của M2 & M5 trong `tick.mcfunction` và `setup.mcfunction`
- **Vị trí**:
  - `generate_all.py` (dòng 598–644 và dòng 689–793)
  - `world/datapacks/skyblock_spawn/data/skyblock/function/tick.mcfunction`
  - `world/datapacks/skyblock_spawn/data/skyblock/function/setup.mcfunction`
- **Hiện tượng & Bằng chứng thực tế**:
  1. Chạy test `python .agents/teamwork/teamwork_preview_worker_m2/test_m2.py`:
     ```
     Check 1 (Warps): PASS
     Check 2 (Aliases): PASS
     Check 3 (Hunter Menu): PASS
     Check 4 (build_boss_multi): PASS
     Traceback (most recent call last):
       File ".../test_m2.py", line 62, in <module>
         assert 'execute as @e[type=interaction,tag=boss_hunter_interact]' in tick
     AssertionError
     ```
  2. Kiểm tra `tick.mcfunction` thực tế trên đĩa: file hiện chỉ có đúng 100 dòng (chính xác bằng chuỗi template tĩnh được định nghĩa bên trong `generate_all.py`).
  3. Hoàn toàn thiếu các đoạn mã sau trong `tick.mcfunction`:
     - **Tương tác Thợ Săn Boss (M2)**:
       ```mcfunction
       execute as @e[type=interaction,tag=boss_hunter_interact] if data entity @s interaction on target run function skyblock:boss/hunter_menu
       execute as @e[type=interaction,tag=boss_hunter_interact] run data remove entity @s interaction
       ```
     - **Fail-safe Return TP 4 Đấu Trường Boss (M2)**:
       ```mcfunction
       execute in minecraft:overworld as @a[x=-19,y=110,z=74,dx=1,dy=2,dz=1] run teleport @s 0.5 111.0 58.0 0.0 0.0
       execute in minecraft:overworld as @a[x=18,y=110,z=74,dx=1,dy=2,dz=1] run teleport @s 0.5 111.0 58.0 0.0 0.0
       execute in minecraft:overworld as @a[x=2,y=110,z=101,dx=1,dy=2,dz=1] run teleport @s 0.5 111.0 58.0 0.0 0.0
       execute in minecraft:overworld as @a[x=-26,y=110,z=101,dx=1,dy=2,dz=1] run teleport @s 0.5 111.0 58.0 0.0 0.0
       ```
     - **Tương tác NPC Hướng Dẫn Viên Tân Thủ (M5)**:
       ```mcfunction
       execute as @e[type=interaction,tag=guide_interact] if data entity @s interaction on target run function skyblock:guide/menu
       execute as @e[type=interaction,tag=guide_interact] run data remove entity @s interaction
       ```
     - **Lắng nghe Scoreboard Trigger `/huongdan` (M5)**:
       ```mcfunction
       scoreboard players enable @a huongdan
       execute as @a[scores={huongdan=1..}] at @s run function skyblock:guide/menu
       scoreboard players set @a[scores={huongdan=1..}] huongdan 0
       ```
  4. Kiểm tra `setup.mcfunction` thực tế trên đĩa: file chỉ có 36 dòng, hoàn toàn thiếu:
     ```mcfunction
     scoreboard objectives add huongdan trigger {"text":"Hướng Dẫn Tân Thủ","color":"gold"}
     ```
- **Nguyên nhân gốc rễ**:
  - `generate_all.py` được thiết kế ban đầu để sinh toàn bộ datapack (bao gồm cả `setup.mcfunction` và `tick.mcfunction`).
  - Khi Worker M1 chỉnh sửa logic trade và chạy `python generate_all.py` theo Acceptance Criteria 1, hàm `update_setup_mcfunction()` và `update_tick_mcfunction()` đã ghi đè lên đĩa bằng chuỗi template tĩnh lỗi thời, xóa sạch các chỉnh sửa mà Worker M2 và Worker M5 đã làm trước đó trên đĩa.
  - Bất cứ khi nào ai đó chạy lại `python generate_all.py`, lỗi này sẽ lại tái diễn nếu không được sửa tận gốc trong `generate_all.py`.
- **Đề xuất khắc phục**:
  - **Phương án 1 (Khuyến nghị)**: Cập nhật nội dung template trong `update_tick_mcfunction()` và `update_setup_mcfunction()` của `generate_all.py` để bao gồm đầy đủ toàn bộ mã của M2 và M5. Khi đó, chạy `python generate_all.py` sẽ bảo toàn 100% tính năng.
  - **Phương án 2**: Loại bỏ lệnh gọi `update_tick_mcfunction()` và `update_setup_mcfunction()` khỏi hàm `main()` của `generate_all.py` (chỉ để script này sinh `build_evolution_items.mcfunction` và `build_evolution_npc.mcfunction`), đồng thời khôi phục lại nội dung đầy đủ cho `tick.mcfunction` và `setup.mcfunction`.

---

## III. XÁC MINH CÁC YÊU CẦU & HẠNG MỤC ĐẠT CHUẨN (VERIFIED CLAIMS)

### 1. R1: Tiến trình Trang bị Cổ Đại 15 Bậc (Progression Enforcement) — ✅ ĐẠT (PASS)
- Đã kiểm tra logic sinh trade trong `generate_all.py` (dòng 500–585):
  - Tier 1: `buy` yêu cầu phôi vanilla (diamond pickaxe/axe/sword, diamond armor 4 món, vanilla bow), `buyB` yêu cầu 4 Mảnh Quặng Cổ Đại (`prismarine_shard`).
  - Tier 2..15: `buy` bắt buộc lấy vật phẩm Tier N-1 sinh ra từ `item_to_trade_sell(prev_item)` với đầy đủ components (`custom_name`, `lore`, `enchantments`, `unbreakable`, `custom_data: {tier: N-1}`). `buyB` yêu cầu nguyên liệu tương ứng.
  - Bộ giáp mở rộng đầy đủ 4 món (`helmet`, `chestplate`, `leggings`, `boots`) xuyên suốt 15 Tiers (tổng 60 recipes giáp).
  - Tổng cộng: 30 recipes công cụ + 90 recipes vũ khí/giáp/cung = 120 recipes nâng cấp.
- Đã chạy kiểm thử độc lập: `python .agents/teamwork/teamwork_preview_explorer_survey_1/test_r1_logic.py` -> Kết quả: `ALL 120 TRADES STRICTLY ENFORCE N-1 PROGRESSION AND PASS ALL SYNTAX CHECKS!`

### 2. R2: Hạ tầng & Điều hướng Boss (Boss Navigation) — ⚠️ ĐẠT MỘT PHẦN (PARTIAL)
- **Hạng mục đạt**:
  - 4 file warp `boss1.yml`, `boss2.yml`, `boss3.yml`, `boss4.yml` trong `plugins/Essentials/warps/` tồn tại với tọa độ và góc nhìn chuẩn xác trước cửa từng đại điện.
  - `commands.yml` khai báo đầy đủ 8 aliases (`boss1`..`boss4` và `dongnhen`, `vuclua`, `thanhtri`, `hukhong`).
  - `hunter_menu.mcfunction` hiển thị menu tellraw đẹp mắt, click event `/warp boss1`..`/warp boss4` chính xác.
  - Trong `build_boss_multi.mcfunction`: triệu hồi NPC Thợ Săn Boss (`0.5 111 61.5`), đặt 4 Command Block return teleport (`teleport @p 0.5 111.0 58.0 0.0 0.0`) tại 4 arena, và 4 biển báo trạng thái khởi tạo `● SẴN SÀNG`.
  - `summon_boss_1..4.mcfunction` cập nhật biển sang `☠ ĐANG CHIẾN ĐẤU`; `boss_1..4_defeated.mcfunction` trả biển về `● SẴN SÀNG`.
- **Hạng mục bị lỗi**:
  - Logic bắt tương tác chuột phải vào NPC Thợ Săn Boss và logic bệ return TP fail-safe trong `tick.mcfunction` bị xóa do Finding 1.

### 3. R3: Cấu hình Server & Tối ưu JVM (Server Stability) — ✅ ĐẠT (PASS)
- `spigot.yml`:
  - `settings.restart-script: Run-Server.bat` (dòng 36) -> Đã xác minh. Khắc phục lỗi crash restart trên Windows.
  - `world-settings.default.merge-radius.exp: 3.0` (dòng 162) -> Đã xác minh. Gộp EXP orb trong bán kính 3 block, giảm lag entity.
- `Run-Server.bat`:
  - Dòng 18 cấu hình đầy đủ 20 cờ tối ưu Aikar's Flags cho Java 21 G1GC (`-Xms4G -Xmx4G`, `-XX:+UseG1GC`, `-XX:+ParallelRefProcEnabled`, `-XX:MaxGCPauseMillis=200`, `-XX:G1NewSizePercent=30`, v.v.).
- `plugins/Essentials/config.yml`:
  - `newbies.kit: tanthu` (dòng 1278) -> Đã xác minh. Tự động phát kit tân thủ khi người chơi mới vào server.
  - Kiểm tra `plugins/Essentials/kits.yml`: kit `tanthu` đã được định nghĩa đầy đủ đồ nghề sắt, giáp da, thức ăn, khối xây dựng và $1,000 Vault.

### 4. R4: Xử lý Log Rotation trong Daemon Kinh Tế — ✅ ĐẠT (PASS)
- `skyblock_economy_daemon.py`:
  - Hàm `open_log_shared(path)` (dòng 10–45) sử dụng Windows API `CreateFileW` với cờ `FILE_SHARE_READ | FILE_SHARE_WRITE | FILE_SHARE_DELETE`, ngăn chặn triệt để lỗi `WinError 32: The process cannot access the file because it is being used by another process` khi Log4j xoay vòng file `latest.log`.
  - Vòng lặp tailing (dòng 875–935) theo dõi `st.st_ino != current_ino` (phát hiện rotation) và `st.st_size < curr_pos` (phát hiện truncation), xả hết dữ liệu tồn đọng, đóng handle cũ, mở lại file mới và seek về 0.
  - Đã chạy kiểm tra cú pháp: `python -m py_compile skyblock_economy_daemon.py` -> Thành công (mã thoát 0).
  - Đã chạy mô phỏng đổi tên file đa luồng trên Windows: `RENAME PASS` thành công, không gặp xung đột khóa file.

### 5. R5: Hướng dẫn Tân thủ & Trợ giúp (Newbie Onboarding) — ⚠️ ĐẠT MỘT PHẦN (PARTIAL)
- **Hạng mục đạt**:
  - `build_spawn.mcfunction`: Triệu hồi NPC "Hướng Dẫn Viên Tân Thủ" tại `0.5 121 3.5` kèm thực thể interaction và hologram `[ CLICK ĐỂ XEM HƯỚNG DẪN ]`.
  - `guide/menu.mcfunction`: Menu tellraw tương tác đầy đủ các nút nhận kit, lệnh đảo, tiện ích kinh tế, điểm dịch chuyển và lộ trình RPG 6 bước.
  - `help.yml`: Nạp thành công 18 chuyên mục trợ giúp chi tiết theo chuẩn Paper 1.21.4 `general-topics`.
  - `commands.yml`: Khai báo 2 aliases `/huongdan` và `/guide` trỏ đến `trigger huongdan`.
- **Hạng mục bị lỗi**:
  - `setup.mcfunction` bị mất dòng đăng ký objective `huongdan trigger` do Finding 1.
  - `tick.mcfunction` bị mất logic bắt tương tác chuột phải vào Guide NPC và bộ lắng nghe `huongdan=1..` do Finding 1.

---

## IV. BÁO CÁO THỬ THÁCH ĐỐI KHÁNG (ADVERSARIAL CHALLENGES)

### [HIGH] Challenge 1: Kiến trúc Monolithic Generator thiếu cơ chế bảo vệ file con
- **Giả định bị thách thức**: Giả định rằng `generate_all.py` có thể an toàn sinh lại toàn bộ datapack bất cứ lúc nào.
- **Kịch bản tấn công / lỗi**: Một lập trình viên hoặc CI/CD pipeline chạy lại `python generate_all.py` sau khi các tính năng khác đã được commit lên datapack. Kết quả là toàn bộ các thay đổi thủ công trong `tick.mcfunction`, `setup.mcfunction`, `summon_boss.mcfunction` đều bị ghi đè thầm lặng mà không có cảnh báo.
- **Biện pháp giảm thiểu**: Hoặc đưa toàn bộ logic `tick` và `setup` vào một nguồn chân lý duy nhất (SSOT) bên trong `generate_all.py`, hoặc tách riêng `generate_all.py` thành `generate_items.py` chỉ phụ trách sinh đồ và NPC trade.

### [MEDIUM] Challenge 2: Nguy cơ nghẽn tải Tick khi quét `@e[type=interaction]` mỗi tick
- **Giả định bị thách thức**: Giả định rằng việc chạy `execute as @e[type=interaction,tag=...]` ở tần số 20 TPS là an toàn vô điều kiện.
- **Kịch bản**: Nếu server bị lỗi spawn lặp lại hàng trăm thực thể `interaction` tại Spawn Hub mà không dọn dẹp, lệnh này sẽ lặp qua toàn bộ và gây tụt TPS.
- **Biện pháp giảm thiểu**: Hiện tại trong `build_spawn.mcfunction` và `build_boss_multi.mcfunction` đã có lệnh `kill @e[type=interaction,tag=...]` trước khi summon. Tuy nhiên, nên thêm giới hạn tọa độ (ví dụ `@e[type=interaction,tag=...,distance=..5]`) để tối ưu hóa phạm vi tìm kiếm của Paper engine.

---

## V. KẾT LUẬN & HƯỚNG XỬ LÝ (ACTIONABLE NEXT STEPS)

Do phát hiện lỗi Critical Finding 1 (hỏng tính năng tương tác NPC Thợ Săn Boss, NPC Hướng Dẫn Viên, bệ dịch chuyển rút lui và lệnh `/huongdan`), Reviewer 1 phát lệnh **REQUEST_CHANGES**.

**Nhiệm vụ cần phân công khắc phục**:
1. Cập nhật `generate_all.py`:
   - Bổ sung `scoreboard objectives add huongdan trigger ...` vào hàm `update_setup_mcfunction()`.
   - Bổ sung logic bắt tương tác `boss_hunter_interact`, `guide_interact`, 4 fail-safe return TP pads, và trigger `huongdan` vào hàm `update_tick_mcfunction()`.
2. Chạy `python generate_all.py` để tái tạo đồng bộ cả 5 file datapack.
3. Chạy lại `python .agents/teamwork/teamwork_preview_worker_m2/test_m2.py` và `python .agents/teamwork/teamwork_preview_worker_m5/test_m5.py` để đảm bảo 100% PASS.
