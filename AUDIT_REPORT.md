# BÁO CÁO TỔNG HỢP KIỂM ĐỊNH VÀ NGHIỆM THU KỸ THUẬT CUỐI CÙNG
## (FINAL ACCEPTANCE AUDIT REPORT)

**Dự Án**: Hệ Thống Máy Chủ Paper 1.21.4 Skyblock Server (Hệ Thống Đảo Hư Không & Tiến Hóa Cổ Đại 15 Tiers)  
**Mã Dự Án**: `Skyblock-Server-Paper-1.21.4`  
**Đơn Vị Thực Hiện**: Đội Ngũ Kiểm Thử Kỹ Thuật Độc Lập & Kiểm Toán Pháp Y Mã Nguồn (Forensic Audit & Verification Team)  
**Thời Điểm Lập Báo Cáo**: 2026-10-12T10:55:00Z  
**Phân Vùng Không Gian Làm Việc**: `C:\Users\Administrator\.gemini\antigravity\scratch\Skyblock-Server`  
**Chế Độ Kiểm Định (Audit Mode)**: Development / Rigorous Forensic Integrity Verification  

---

## MỤC LỤC
1. [Thông Tin Tổng Quan Dự Án & Bối Cảnh Kiểm Thử](#1-thông-tin-tổng-quan-dự-án--bối-cảnh-kiểm-thử)
2. [Bảng Tổng Hợp Đánh Giá 6 Phân Hệ Kỹ Thuật (R1–R6)](#2-bảng-tổng-hợp-đánh-giá-6-phân-hệ-kỹ-thuật-r1r6)
3. [Báo Cáo Thực Nghiệm Kiểm Thử Tự Động (Automated Test Suites)](#3-báo-cáo-thực-nghiệm-kiểm-thử-tự-động-automated-test-suites)
4. [Danh Mục Lỗi Chi Tiết (Defect Log Theo 4 Cấp Độ Nghiêm Trọng)](#4-danh-mục-lỗi-chi-tiết-defect-log-theo-4-cấp-độ-nghiêm-trọng)
   - [4.1 Cấp Độ BLOCKER (Lỗi Tê Liệt Hệ Thống)](#41-cấp-độ-blocker-lỗi-tê-liệt-hệ-thống)
   - [4.2 Cấp Độ HIGH (Lỗi An Ninh, Kinh Tế & Tương Tác Nghiêm Trọng)](#42-cấp-độ-high-lỗi-an-ninh-kinh-tế--tương-tác-nghiêm-trọng)
   - [4.3 Cấp Độ MEDIUM (Lỗi Xung Đột Trải Nghiệm, Tiến Trình & Khóa CSDL)](#43-cấp-độ-medium-lỗi-xung-đột-trải-nghiệm-tiến-trình--khóa-csdl)
   - [4.4 Cấp Độ LOW (Cảnh Báo Cấu Hình, Trợ Giúp & Tệp Rác)](#44-cấp-độ-low-cảnh-báo-cấu-hình-trợ-giúp--tệp-rác)
5. [Đánh Giá Khách Quan Về Công Cụ Kiểm Tra Cú Pháp `verify_syntax.py`](#5-đánh-giá-khách-quan-về-công-cụ-kiểm-tra-cú-pháp-verify_syntaxpy)
6. [Kế Hoạch Khắc Phục Khẩn Cấp Trước Phát Hành (Actionable Pre-Launch Remediation Plan)](#6-kế-hoạch-khắc-phục-khẩn-cấp-trước-phát-hành-actionable-pre-launch-remediation-plan)
7. [Kết Luận Nghiệm Thu & Khuyến Nghị Vận Hành](#7-kết-luận-nghiệm-thu--khuyến-nghị-vận-hành)

---

## 1. THÔNG TIN TỔNG QUAN DỰ ÁN & BỐI CẢNH KIỂM THỬ

### 1.1 Mục Tiêu Thẩm Định
Thực hiện đánh giá thực địa toàn diện (Hands-on Verification), đối soát mã nguồn và kiểm toán pháp y (Forensic Audit) tính toàn vẹn kỹ thuật đối với toàn bộ hệ thống Paper 1.21.4 Skyblock Server. Quá trình kiểm định nhằm đánh giá sự ổn định của hạ tầng máy chủ, tính tương thích của hệ thống đảo IridiumSkyblock, cơ chế phân quyền người chơi Non-OP, tiến trình RPG Datapack 15 bậc, độ tin cậy của daemon kinh tế ngầm, và rà soát các lỗ hổng bảo mật hoặc gian lận kinh tế trước khi đưa vào phát hành chính thức (Public Launch).

### 1.2 Môi Trường & Thông Số Kỹ Thuật Kiểm Định

| Thành phần môi trường | Phiên bản & Thông số kỹ thuật | Ghi chú vận hành thực tế |
| :--- | :--- | :--- |
| **Hệ Điều Hành** | Windows 10/Server x86_64 | Môi trường PowerShell host |
| **Máy Chủ Minecraft** | Paper version 1.21.4 (build 232 / Git-12d8fe0) | Nạp 9 plugins Bukkit/Paper chính thức |
| **Môi Trường Java** | Eclipse Adoptium OpenJDK 21.0.12.1+1 LTS | `C:\Program Files\Eclipse Adoptium\jre-21.0.12.101-hotspot\bin\java.exe` |
| **JVM Heap & Cờ GC** | 4GB RAM (`-Xms4G -Xmx4G`), G1GC, Aikar's Flags chuẩn | Kích hoạt `AlwaysPreTouch`, `ParallelRefProcEnabled` |
| **Mạng & Cổng Giao Tiếp** | Port 25565 (Radmin VPN LAN), Port 25575 (TCP RCON) | `online-mode=false`, `enable-rcon=true`, pass `skyblock123` |
| **Thời Gian Khởi Động** | 25.693 giây (Chuẩn bị thế giới: 7.367 giây) | Trích xuất từ `logs/latest.log` |
| **Bộ Thông Dịch Python** | Python 3.12.10 64-bit | Chạy Daemon Kinh tế & Harness kiểm thử tự động |
| **Cơ Sở Dữ Liệu Đảo** | SQLite 3 (`plugins/IridiumSkyblock/IridiumSkyblock.db`) | Dung lượng 244 KB, PRAGMA integrity_check: `ok` |

---

## 2. BẢNG TỔNG HỢP ĐÁNH GIÁ 6 PHÂN HỆ KỸ THUẬT (R1–R6)

Bảng tổng hợp dưới đây ghi nhận trạng thái kiểm định thực tế trên từng phân hệ chức năng, phân loại rõ mức độ rủi ro kỹ thuật và bằng chứng tại hiện trường:

| Phân hệ | Hạng mục kiểm tra | Trạng thái | Mức độ rủi ro | Bằng chứng thực tế & Tệp liên quan | Tóm tắt phát hiện & Đánh giá kỹ thuật |
| :--- | :--- | :---: | :---: | :--- | :--- |
| **R1.1** | JVM Java 21 & Cờ tối ưu Aikar's Flags | **PASS** | None | `Run-Server.bat` (dòng 10-21)<br>`logs/latest.log` | Chạy đúng JRE 21 LTS Adoptium, cờ Aikar's Flags chuẩn G1GC cho Java 21, thời gian boot 25.693s ổn định. |
| **R1.2** | Tự động phục hồi Crash & Gom hạt EXP | **PASS** | None | `spigot.yml` (dòng 35-36, 160-162)<br>`paper-world-defaults.yml` | `restart-on-crash: true`, `restart-script: Run-Server.bat`, `merge-radius.exp: 3.0` chính xác 100%. |
| **R1.3** | Cấu hình Mạng & Kết nối RCON | **PASS** | None | `server.properties` (dòng 14, 38, 46, 47) | `online-mode=false`, RCON port 25575, pass `skyblock123`. Cổng mạng TCP mở lắng nghe chuẩn xác. |
| **R1.4** | Bán kính bảo vệ Spawn & Tương tác Non-OP | **WARN** | **Medium** | `server.properties` (dòng 60)<br>`ops.json`, Thiếu `WorldGuard` | `spawn-protection=160` khóa toàn bộ rương công cộng, Ender Chest tại Sảnh Boss và cấm đặt ChestShop quanh Hub do thiếu WorldGuard. |
| **R1.5** | Khởi động song song & Độc bản Daemon | **WARN** | **Medium** | `Run-Server.bat` (dòng 18)<br>`skyblock_economy_daemon.py` | Daemon tự phục hồi RCON đạt chuẩn, nhưng THIẾU cơ chế Singleton Lock, dẫn đến nguy cơ nhân đôi tiến trình khi server crash-restart. |
| **R2.1** | Nhóm lệnh Quản lý Đảo IridiumSkyblock | **WARN** | **Medium** | `plugins/IridiumSkyblock/commands.yml`<br>`commands.yml` gốc | `/is create, home, sethome, level`, `/upgrade`, `/boosters` hoạt động tốt. **LỖI**: Lệnh `/is team` trả về `Unknown Command` do thiếu alias. |
| **R2.2** | Cơ chế sinh Thế giới Void World | **PASS** | None | `plugins/IridiumSkyblock/configuration.yml`<br>`VoidGenerator.class` | Thế giới `IridiumSkyblock` sinh chuẩn Void thông qua generator tích hợp, các chunk hoàn toàn trống rỗng chuẩn mực. |
| **R2.3** | Cách ly dữ liệu cũ BentoBox | **PASS** | None | Thư mục `disabled_plugins/`<br>`bskyblock_world*` (~12.89 MB) | BentoBox đã cách ly an toàn trong `disabled_plugins/`, 3 thế giới cũ không bị nạp vào server runtime. |
| **R2.4** | Tính toàn vẹn CSDL SQLite Đảo | **PASS** | None | `plugins/IridiumSkyblock/IridiumSkyblock.db` | CSDL đạt 100% nguyên vẹn (`PRAGMA integrity_check: ok`). Đang chạy chế độ `delete` journal, khuyến nghị chuyển sang WAL. |
| **R3.1** | Phân quyền người chơi Non-OP | **PASS** | **Low** | `plugins/Essentials/config.yml`<br>`permissions.yml` | Không có LuckPerms nhưng cơ chế fallback nội bộ hoạt động tốt; Non-OP dùng được 16 warps, kits, lệnh đảo. Thiếu alias `/cuahang`. |
| **R3.2** | Hiển thị HUD Scoreboard & PAPI | **PASS** | **Low** | `plugins/ScoreboardPL/config.yml`<br>`Expansion-vault.jar` | HUD hiển thị đẹp mắt, phân giải chuẩn tên và cấp đảo. Biến `%vault_balance_int%` chỉ hỗ trợ nội bộ trong ScoreboardPL. |
| **R3.3** | Tệp cấu hình mồ côi tại thư mục gốc | **WARN** | **Low** | `Skyblock-Server/config.yml` (10KB, 182 dòng) | Tệp mẫu tiếng Anh mặc định của ScoreboardPL bị bỏ quên ở gốc server, hoàn toàn không có tác dụng runtime. |
| **R3.4** | Tính năng Tạo & Giao dịch ChestShop | **PASS** | None | `plugins/ChestShop/config.yml`<br>`ChestShop.jar` bytecode | Quyền tạo/mua/bán shop đặt `default: true`, tự động chống phá rương người chơi khác, có bảng hướng dẫn tạo shop tại Spawn. |
| **R4.1** | Tình trạng nạp Datapack Tick Loop | **FAIL** | **BLOCKER** | `generate_all.py` (dòng 792-793)<br>`tick.mcfunction` (dòng 101-102)<br>`logs/latest.log` (dòng 9-24) | Lỗi cú pháp lệnh `fill ... air destroy replace #minecraft:logs` khiến Paper từ chối nạp `skyblock:tick`, làm tê liệt 100% logic tick của datapack. |
| **R4.2** | Cây Tiến Hóa RPG 15 Tiers & Hiệu ứng | **PASS** | None | `tests/test_r1_progression.py`<br>`build_evolution_npc.mcfunction` | 120/120 công thức nâng cấp đạt chuẩn Data Components nghiêm ngặt. Logic đặc biệt (nổ 3x3, hút máu, giáp buff) đã viết chuẩn nhưng bị kẹt do R4.1. |
| **R4.3** | Sảnh Boss Sanctuary & Drop Boss 3 | **WARN** | **Medium** | `summon_boss_3.mcfunction`<br>`announce_boss_3.mcfunction` (dòng 9) | Sảnh và 4 Arena xuất sắc, Fail-Safe TP chuẩn. Lệch ID: Boss 3 rơi `fermented_spider_eye` nhưng hàm announce vinh danh lại phát `nether_wart`. |
| **R4.4** | NPC Hướng Dẫn Viên & Mở Hòm Crates | **WARN** | **High** | `build_crates.mcfunction`<br>`tick.mcfunction` (dòng 54-60) | NPC Hướng Dẫn Viên hoạt động tốt. Ngược lại, Crates thiếu listener `crate_interact` trong `tick.mcfunction`, click hòm không phản hồi. |
| **R5.1** | Kết nối RCON & Real-time Log Listener | **PASS** | None | `skyblock_economy_daemon.py`<br>`tests/test_r4_daemon.py` | Cơ chế socket RCON tự động kết nối lại khi server restart; xử lý chia sẻ file Windows API `open_log_shared` và xoay log đạt 100%. |
| **R5.2** | Xử lý Alias Lệnh Bán Quặng | **WARN** | **Low** | `commands.yml` (dòng 118-127)<br>`logs/latest.log` (dòng 151-155) | Khai báo alias tự trỏ khiến Paper ném 22 cảnh báo [WARN] khi khởi động và báo lỗi đỏ "Unknown command" trong khung chat người chơi. |
| **R5.3** | Bảng giá quặng & An toàn đồ Cổ Đại | **PASS** | None | `skyblock_economy_daemon.py` (dòng 485-525) | Bộ lọc phủ định `[!custom_data,!custom_name]` bảo vệ an toàn 100% trang bị Cổ Đại, chìa khóa và nguyên liệu rèn không bị xóa nhầm. |
| **R5.4** | Hệ thống Casino & Interaction Listener | **FAIL** | **High** | `build_casino.mcfunction` (dòng 70, 90)<br>`tick.mcfunction` | Thiếu interaction listener cho `cf_interact` và `xoso_interact` trong `tick.mcfunction`. Click NPC/Bàn Casino không có tác dụng. |
| **R5.5** | Liêm chính May rủi (VIP Easter Eggs) | **FAIL** | **HIGH RISK** | `skyblock_economy_daemon.py` (dòng 197-207, 287-296) | Gian lận tỷ lệ Coinflip (85% cho `sondzvc`, 25% cho `hieudzvc`) và ép vé trúng/trượt Xổ số, gây nguy cơ siêu lạm phát phá vỡ nền kinh tế. |
| **R5.6** | Lỗ hổng Leo thang Đặc quyền `/haidang` | **FAIL** | **HIGH RISK** | `skyblock_economy_daemon.py` (dòng 620-735, 759-761) | Lệnh `/haidang` chạy qua RCON OP 4 không kiểm tra quyền, cho phép mọi người chơi thường tạo miễn phí 164 block Netherite/Diamond và xóa địa hình. |
| **R5.7** | Kiểm thử Độ tin cậy Daemon R4 | **PASS** | None | `tests/test_r4_daemon.py` | 3/3 module kiểm thử độ tin cậy vượt qua kiểm tra (Biên dịch, Chia sẻ file Windows, Thích ứng xoay vòng/thu nhỏ file log). |
| **R6.1** | Rà soát Nhật ký Máy Chủ (`latest.log`) | **PASS** | None | `logs/latest.log` | Định vị và phân tích chi tiết toàn bộ 8 nhóm thông điệp WARN/ERROR, xác định nguồn gốc lỗi nạp `skyblock:tick` và cảnh báo alias. |
| **R6.2** | Từ Điển Trợ Giúp `help.yml` | **WARN** | **Low** | `help.yml` (18 chuyên mục) | Cấu trúc YAML hợp lệ, trình bày đẹp mắt. Tuy nhiên cú pháp `/cf` và `/xoso` mô tả sai so với bộ phân tích tham số thực tế của daemon. |
| **R6.3** | Trình sinh mã `generate_all.py` | **FAIL** | **BLOCKER** | `generate_all.py` (dòng 792-793) | Sinh thành công 120 công thức tiến hóa, nhưng sinh ra lệnh `fill` sai cú pháp, liên tục ghi đè lỗi Blocker vào `tick.mcfunction`. |

---

## 3. BÁO CÁO THỰC NGHIỆM KIỂM THỬ TỰ ĐỘNG (AUTOMATED TEST SUITES)

Đội ngũ kiểm định đã thực thi độc lập và khách quan 2 bộ kịch bản kiểm thử tự động chính thức của dự án trên nền tảng Windows PowerShell. Kết quả thực nghiệm được ghi nhận trực tiếp như sau:

```
========================================================================================
BẢNG TỔNG HỢP KẾT QUẢ THỰC THI BỘ TEST TỰ ĐỘNG (EMPIRICAL TEST EXECUTION)
========================================================================================
Kịch Bản Kiểm Thử       Mục Tiêu Kiểm Định                  Số Ca Test    Exit Code   Kết Quả
----------------------------------------------------------------------------------------
test_r1_progression.py  Tính toàn vẹn Cây Tiến Hóa RPG       120 / 120         0       100% PASS
test_r4_daemon.py       Độ tin cậy Daemon & Win32 File Share   7 / 7           0       100% PASS
========================================================================================
TỔNG KẾT: 2/2 TEST SUITES ĐẠT CHUẨN TUYỆT ĐỐI (ZERO FAILURES, ZERO EXCEPTIONS)
========================================================================================
```

### 3.1 Suite 1: `tests/test_r1_progression.py` (Kiểm Chứng Tiến Trình 15 Tiers)
- **Lệnh thực thi**: `python tests/test_r1_progression.py`
- **Thời gian thực hiện**: 2026-10-12T10:38:33Z | **Exit Code**: `0`
- **Mục tiêu phân tích**: Tệp `world/datapacks/skyblock_spawn/data/skyblock/function/build_evolution_npc.mcfunction`.
- **Trích đoạn Log Thực Nghiệm Nguyên Bản (Verbatim Output)**:
```text
======================================================================
EMPIRICAL VERIFICATION HARNESS: R1 PROGRESSION ENFORCEMENT
Target: C:\Users\Administrator\.gemini\antigravity\scratch\Skyblock-Server\world\datapacks\skyblock_spawn\data\skyblock\function\build_evolution_npc.mcfunction
======================================================================
[+] Found 3 NPC summon commands:
    - NPC_Alchemist (Line 44): 10 recipes
    - NPC_Toolsmith (Line 47): 30 recipes
    - NPC_Weaponsmith (Line 50): 90 recipes

[*] Testing Category: Pickaxe (15 Tiers, Expected Vanilla: minecraft:diamond_pickaxe)
    [PASS] All 15 Tiers in Pickaxe verified strictly.

[*] Testing Category: Axe (15 Tiers, Expected Vanilla: minecraft:diamond_axe)
    [PASS] All 15 Tiers in Axe verified strictly.

[*] Testing Category: Sword (15 Tiers, Expected Vanilla: minecraft:diamond_sword)
    [PASS] All 15 Tiers in Sword verified strictly.

[*] Testing Category: Helmet (15 Tiers, Expected Vanilla: minecraft:diamond_helmet)
    [PASS] All 15 Tiers in Helmet verified strictly.

[*] Testing Category: Chestplate (15 Tiers, Expected Vanilla: minecraft:diamond_chestplate)
    [PASS] All 15 Tiers in Chestplate verified strictly.

[*] Testing Category: Leggings (15 Tiers, Expected Vanilla: minecraft:diamond_leggings)
    [PASS] All 15 Tiers in Leggings verified strictly.

[*] Testing Category: Boots (15 Tiers, Expected Vanilla: minecraft:diamond_boots)
    [PASS] All 15 Tiers in Boots verified strictly.

[*] Testing Category: Bow (15 Tiers, Expected Vanilla: minecraft:bow)
    [PASS] All 15 Tiers in Bow verified strictly.

======================================================================
ARMOR 4-SLOT COVERAGE AUDIT:
    - Helmet: 15/15 Tiers verified
    - Chestplate: 15/15 Tiers verified
    - Leggings: 15/15 Tiers verified
    - Boots: 15/15 Tiers verified

SUMMARY OF PROGRESSION ENFORCEMENT AUDIT:
    - Total Equipment Categories: 8 (4 Armor Slots + 4 Weapons/Tools)
    - Total Tier Upgrade Steps Verified: 120
    - Total Passed Verification Steps: 120
    - Success Rate: 100.00%

>>> FINAL VERDICT FOR R1: PASS (100% Progression Integrity Verified) <<<
```
- **Phân Tích Kỹ Thuật Độc Lập**:
  1. Trình kiểm thử sử dụng bộ phân tích SNBT động, quét trực tiếp cấu trúc NBT của 3 thực thể NPC Villager.
  2. Toàn bộ 120 công thức nâng cấp từ Tier 2 đến Tier 15 trên 8 nhóm trang bị bắt buộc phải có nguyên liệu đầu vào `buy` là vật phẩm Tier $N-1$ của công thức trước đó.
  3. Đối soát nghiêm ngặt 6 thành phần Data Component: `id`, `custom_data` (chứa `ancient_tier: N-1`), `custom_name`, `lore`, `enchantments`, và `unbreakable`. Không phát hiện bất kỳ trường hợp nào người chơi có thể dùng phôi vanilla nhảy bậc chế đồ cấp cao.

---

### 3.2 Suite 2: `tests/test_r4_daemon.py` (Kiểm Chứng Độ Tin Cậy Daemon Kinh Tế)
- **Lệnh thực thi**: `python tests/test_r4_daemon.py`
- **Thời gian thực hiện**: 2026-10-12T10:38:40Z | **Exit Code**: `0`
- **Mục tiêu phân tích**: Tệp `skyblock_economy_daemon.py` và cơ chế tương tác file log thời gian thực trên Windows.
- **Trích đoạn Log Thực Nghiệm Nguyên Bản (Verbatim Output)**:
```text
======================================================================
TEST 1: PY_COMPILE COMPILATION CHECK
Target: C:\Users\Administrator\.gemini\antigravity\scratch\Skyblock-Server\skyblock_economy_daemon.py
======================================================================
[PASS] skyblock_economy_daemon.py compiled successfully with 0 errors.

======================================================================
TEST 2: OPEN_LOG_SHARED WINDOWS SHARING CONTRACT
======================================================================
[PASS] open_log_shared successfully opened file.
    - Read line 1: 'Initial line 1'
[PASS] Sub-test 2.1: Concurrent append allowed while handle open.
    - Read line 2: 'Initial line 2'
    - Read line 3: 'Concurrent appended line 3'
[PASS] Sub-test 2.2: Concurrent file rename succeeded while handle open (FILE_SHARE_DELETE verified).
    - Read line 4 from rotated handle: 'Line written to renamed file'
[PASS] Clean close of shared_handle succeeded.

======================================================================
TEST 3: TAIL LOOP ADAPTATION SIMULATION
Testing: Append, Rename Rotation, Truncation, Temporary Absence
======================================================================
[*] Scenario A: Initial tailing
    [PASS] Initial header line read.
[*] Scenario B: Real-time Append
    [PASS] Appended log lines processed immediately.
[*] Scenario C: Log Rename Rotation (latest.log -> 2026-10-12-1.log)
    [PASS] Leftover line from rotated file captured before close.
    [PASS] New file lines detected and read after rotation.
[*] Scenario D: Log Truncation / Overwrite
    [PASS] Truncated file detected (st_size < curr_pos), reopened and read.
[*] Scenario E: Temporary File Disappearance & Reappearance
    [PASS] Handled temporary missing file without raising exception.
    [PASS] Re-created file picked up automatically and tailed.

======================================================================
>>> FINAL VERDICT FOR R4: PASS (All Daemon Reliability Scenarios Verified) <<<

======================================================================
R4 ECONOMY DAEMON VERIFICATION SUMMARY: ALL PASSED
======================================================================
```
- **Phân Tích Kỹ Thuật Độc Lập**:
  1. **Win32 File Sharing Contract**: Hàm `open_log_shared` tận dụng Windows Kernel API (`CreateFileW`) thông qua `ctypes` với cờ `FILE_SHARE_READ | FILE_SHARE_WRITE | FILE_SHARE_DELETE`. Điều này giải quyết triệt để lỗi kinh điển `WinError 32: The process cannot access the file` khi Log4j của Paper thực hiện xoay vòng nén file log trên Windows.
  2. **Thích Ứng Tail Loop**: Xử lý hoàn hảo 5 kịch bản khắc nghiệt (Đọc nối tiếp thời gian thực, đọc cạn dữ liệu khi file bị rename, tự động reset con trỏ file khi phát hiện truncation/thu nhỏ dung lượng, và chịu lỗi khi file log tạm thời biến mất).

---

## 4. DANH MỤC LỖI CHI TIẾT (DEFECT LOG THEO 4 CẤP ĐỘ NGHIÊM TRỌNG)

Qua quá trình rà soát đối soát thực địa, đội ngũ kiểm định phát hiện 13 lỗi kỹ thuật và phân loại theo 4 cấp độ nghiêm trọng tiêu chuẩn:

---

### 4.1 Cấp Độ BLOCKER (Lỗi Tê Liệt Hệ Thống)

#### [DEF-BLK-01] Xung Đột Cú Pháp Lệnh `fill` Làm Paper Từ Chối Nạp `skyblock:tick` và Tê Liệt Toàn Bộ Datapack
- **Vị trí phát hiện**:
  - `generate_all.py` (Dòng 792–793):
    ```python
    execute as @a[scores={use_n_axe=1..}] if items entity @s weapon.mainhand *[custom_data~{ancient_axe:1b}] at @s anchored eyes positioned ^ ^ ^2.5 run fill ~-1 ~ ~-1 ~1 ~15 ~1 air destroy replace #minecraft:logs
    execute as @a[scores={use_d_axe=1..}] if items entity @s weapon.mainhand *[custom_data~{ancient_axe:1b}] at @s anchored eyes positioned ^ ^ ^2.5 run fill ~-1 ~ ~-1 ~1 ~15 ~1 air destroy replace #minecraft:logs
    ```
  - `world/datapacks/skyblock_spawn/data/skyblock/function/tick.mcfunction` (Dòng 101–102).
  - `logs/latest.log` (Dòng 9–24, 313–328).
- **Mô tả hiện tượng & Bằng chứng Log Server**:
  Khi Paper Server khởi động, bộ nạp hàm của Minecraft ném ngoại lệ dừng nạp tệp:
  ```text
  [16:54:55] [ServerMain/ERROR]: Failed to load function skyblock:tick
  java.util.concurrent.CompletionException: java.lang.IllegalArgumentException: Whilst parsing command on line 101: Incorrect argument for command at position 186: ...r destroy <--[HERE]
  Caused by: java.lang.IllegalArgumentException: Whilst parsing command on line 101: Incorrect argument for command at position 186: ...r destroy <--[HERE]
  [16:54:55] [ServerMain/ERROR]: Couldn't load tag minecraft:tick as it is missing following references: skyblock:tick (from file/skyblock_spawn)
  ```
- **Phân tích nguyên nhân gốc rễ (Root Cause)**:
  Theo đặc tả ngữ pháp lệnh của Minecraft 1.21.4, cú pháp lệnh `/fill` là:
  `fill <từ> <đến> <khối> [destroy|hollow|keep|outline|replace]` hoặc `fill <từ> <đến> <khối> replace [<bộ_lọc>]`.
  Hai chế độ `destroy` (phá hủy rơi hạt/vật phẩm) và `replace` (thay thế theo bộ lọc) là **loại trừ lẫn nhau (mutually exclusive)**. Việc ghép nối `air destroy replace #minecraft:logs` là cú pháp không hợp lệ. Trình phân tích lệnh của Minecraft đọc `air destroy` là kết thúc hợp lệ và coi từ khóa `replace` kế tiếp là tham số sai cú pháp tại vị trí ký tự 186.
- **Mức độ ảnh hưởng**:
  **TÊ LIỆT 100% DATAPACK**. Vì `skyblock:tick` bị lỗi cú pháp, Paper từ chối nạp toàn bộ tag `#minecraft:tick`. Toàn bộ vòng lặp tick thời gian thực của datapack bị ngừng hoàn toàn trong runtime:
  - Hiệu ứng Cúp Cổ Đại đào nổ 3x3 không hoạt động.
  - Hiệu ứng Kiếm Cổ Đại hút máu và giáng sấm sét không kích hoạt.
  - Hiệu ứng Áo/Giày Cổ Đại buff giáp Kháng Sát Thương, Hồi Phục, Tốc Độ bị vô hiệu hóa.
  - Hệ thống bẫy dịch chuyển hồi quy khẩn cấp tại 4 Đấu trường Boss không chạy.
  - Hệ thống bắt tương tác Menu NPC Thợ Săn Boss và Hướng Dẫn Viên bị tê liệt.
- **Giải pháp khắc phục**:
  Chỉnh sửa dòng 792–793 trong `generate_all.py` và dòng 101–102 trong `tick.mcfunction`: Đổi `air destroy replace #minecraft:logs` thành `air replace #minecraft:logs`.

---

### 4.2 Cấp Độ HIGH (Lỗi An Ninh, Kinh Tế & Tương Tác Nghiêm Trọng)

#### [DEF-HIGH-01] Lỗ Hổng Bảo Mật & Leo Thang Đặc Quyền Tại Tiện Ích Đài Hải Đăng `/haidang`
- **Vị trí phát hiện**: `skyblock_economy_daemon.py` (Dòng 620–735 và dòng 759–761).
- **Mô tả hiện tượng**:
  Daemon bắt chuỗi log console khi người chơi gõ lệnh:
  `[Server thread/INFO]: (\w+) issued server command: /(beacon|becon|haidang|xaybeacon|thaphaidang|lighthouse)(?:\s+(.*))?$`
  Sau đó, daemon gửi lệnh RCON với quyền hạn Server Console (OP Level 4) để thi công đài hải đăng ngay tại tọa độ của người chơi:
  ```python
  rcon.cmd(f'minecraft:execute as {player} at @s run fill ~ ~1 ~ ~ 319 ~ air replace')
  if tiers >= 4:
      rcon.cmd(f'minecraft:execute as {player} at @s run fill ~-4 ~-4 ~-4 ~4 ~-4 ~4 {mat}')
  rcon.cmd(f'minecraft:execute as {player} at @s run setblock ~ ~ ~ beacon')
  rcon.cmd(f'minecraft:execute as {player} run effect give @s minecraft:haste 99999 1 true')
  ```
- **Phân tích nguyên nhân & Rủi ro an ninh**:
  Mã nguồn daemon **HOÀN TOÀN KHÔNG KIỂM TRA QUYỀN HẠN** (không kiểm tra `is_op`, không kiểm tra permission, không kiểm tra tag `admin`, không trừ bất kỳ chi phí tiền tệ nào).
  Bất kỳ người chơi Non-OP nào cũng có thể gõ `/haidang netherite 4` để:
  1. Tạo lập miễn phí ngay lập tức 1 kim tự tháp 4 tầng gồm **164 khối Netherite nguyên chất** (`minecraft:netherite_block`) và 1 khối Beacon.
  2. Xóa sạch cột địa hình từ chân lên tận nóc thế giới Y=319 (`fill ~ ~1 ~ ~ 319 ~ air replace`), cho phép phá hủy đảo của người chơi khác hoặc khu vực công cộng.
  3. Nhận vĩnh viễn hiệu ứng Haste II, Speed II, Night Vision (99999s).
- **Giải pháp khắc phục**:
  Bổ sung kiểm tra xác thực quyền OP hoặc tag admin trước khi xử lý, hoặc loại bỏ hoàn toàn các subcommand sinh khối miễn phí cho người chơi thường.

---

#### [DEF-HIGH-02] Gian Lận Tỷ Lệ May Rủi Cứng Cho Người Chơi Cụ Thể Trong Daemon Kinh Tế
- **Vị trí phát hiện**: `skyblock_economy_daemon.py`:
  - Hàm `handle_xoso_cmd` (Dòng 197–207):
    ```python
    # Troll đặc biệt cho hieudzvc: 65% cơ hội bị ép về vé trượt nếu lỡ trúng
    if player.lower() == 'hieudzvc' and roll > 800:
        if random.random() < 0.65:
            roll = random.randint(1, 800)

    # May mắn VIP độc quyền cho sondzvc: ~85% trúng giải & nhận chìa khóa
    if player.lower() == 'sondzvc':
        if roll <= 800:
            if random.random() < 0.80:
                roll = random.choice([850, 880, 920, 960, 970, 990, 995])
    ```
  - Hàm `handle_cf_cmd` (Dòng 287–296):
    ```python
    # Tỷ lệ thắng (sondzvc: 85% thắng, hieudzvc: 25% thắng troll, người khác 50%)
    p_name = player.lower()
    if p_name == 'sondzvc':
        win_chance = 0.85
    elif p_name == 'hieudzvc':
        win_chance = 0.25
    else:
        win_chance = 0.50
    ```
- **Phân tích rủi ro kinh tế & Liêm chính (Integrity Violation)**:
  1. Đây là hành vi can thiệp kết quả có chủ đích (Hardcoded Backdoor/Easter Egg) gán cứng theo tên người chơi (`username`).
  2. Kỳ vọng toán học (Expected Value - EV) của Coinflip cho `sondzvc`:
     $$\text{EV} = 0.85 \times (+1 \times \text{bet}) + 0.15 \times (-1 \times \text{bet}) = +0.70 \times \text{bet}$$
     Với mức cược tối đa $10,000,000, mỗi lần gõ `/cf`, người chơi này thu lãi ròng trung bình $7,000,000. Điều này dẫn tới siêu lạm phát tức thì, phá hủy hoàn toàn cân bằng kinh tế thị trường chỉ sau vài phút gõ lệnh.
  3. Ngược lại, người chơi `hieudzvc` bị tước đoạt cơ hội thắng với tỷ lệ thắng chỉ 25% ở Coinflip và 65% cơ hội bị hủy kết quả trúng vé số.
- **Giải pháp khắc phục**:
  Xóa bỏ hoàn toàn các khối lệnh kiểm tra `player.lower() == 'sondzvc'` và `'hieudzvc'` tại cả 2 hàm. Áp dụng tỷ lệ công bằng 50.0% đồng nhất cho Coinflip và giữ nguyên phân phối xác suất ngẫu nhiên cho Xổ số.

---

#### [DEF-HIGH-03] Thiếu Interaction Listener Cho Khu Vực Rương Báu Crates (`/warp crates`)
- **Vị trí phát hiện**:
  - `world/datapacks/skyblock_spawn/data/skyblock/function/build_crates.mcfunction` (Dòng 7, 33, 54, 75).
  - `world/datapacks/skyblock_spawn/data/skyblock/function/tick.mcfunction` (Dòng 54–60).
- **Mô tả hiện tượng**:
  Tệp `build_crates.mcfunction` triệu hồi 4 thực thể tương tác mang tag `crate_interact` (`crate_common`, `crate_rare`, `crate_mythic`). Tuy nhiên, trong `tick.mcfunction`, hoàn toàn không có bất kỳ dòng lệnh nào lắng nghe dữ liệu `interaction` của các thực thể này.
- **Hậu quả**:
  Người chơi cầm chìa khóa bấm chuột phải vào các hòm Crates tại `/warp crates` hoàn toàn không nhận được phản hồi, hòm không mở và không trao quà.
- **Giải pháp khắc phục**:
  Bổ sung bộ lắng nghe tương tác và điều phối tới các hàm `crates/open_common`, `crates/open_rare`, `crates/open_mythic` trong `tick.mcfunction`.

---

#### [DEF-HIGH-04] Thiếu Interaction Listener Cho Quầy Casino Tung Đồng Xu & Vé Số
- **Vị trí phát hiện**:
  - `world/datapacks/skyblock_spawn/data/skyblock/function/build_casino.mcfunction` (Dòng 69, 70, 89, 90).
  - `world/datapacks/skyblock_spawn/data/skyblock/function/tick.mcfunction`.
- **Mô tả hiện tượng**:
  Tại khu vực Casino, hệ thống đặt các biển báo: `"Click hoặc gõ /cf"` và `"Click hoặc gõ /xoso"`, đồng thời triệu hồi thực thể `interaction` mang tag `cf_interact` và `xoso_interact`. Tuy nhiên, trong `tick.mcfunction` không có lệnh xử lý tương tác cho hai tag này.
- **Hậu quả**:
  Người chơi làm theo hướng dẫn trên biển báo, click vào bàn cược hoặc NPC Casino nhưng không có menu hay phản hồi nào xuất hiện, bắt buộc phải tự biết gõ lệnh chat.
- **Giải pháp khắc phục**:
  Bổ sung bộ lắng nghe `cf_interact` và `xoso_interact` trong `tick.mcfunction` để gửi thực đơn `tellraw` hướng dẫn mức cược nhanh khi click chuột.

---

### 4.3 Cấp Độ MEDIUM (Lỗi Xung Đột Trải Nghiệm, Tiến Trình & Khóa CSDL)

#### [DEF-MED-01] Sai Lệch ID Vật Phẩm Vinh Danh Boss 3 Giữa Announce Script Và Yêu Cầu Rèn Đồ
- **Vị trí phát hiện**:
  - `world/datapacks/skyblock_spawn/data/skyblock/function/summon_boss_3.mcfunction` (Dòng 26).
  - `world/datapacks/skyblock_spawn/data/skyblock/function/boss/announce_boss_3.mcfunction` (Dòng 9).
  - `world/datapacks/skyblock_spawn/data/skyblock/function/build_evolution_npc.mcfunction` (Dòng 47).
- **Mô tả hiện tượng**:
  - Khi Boss 3 bị tiêu diệt, vật phẩm rơi thực tế từ tay phụ của mob là `minecraft:fermented_spider_eye` (Mắt Nhện Lên Men) mang tag `custom_data:{ancient_mat:"demon_heart"}` (Tỷ lệ rơi 100%).
  - Công thức nâng cấp Tier 10–12 tại NPC Alchemist yêu cầu nguyên liệu đầu vào `buyB` có ID `minecraft:fermented_spider_eye`.
  - Tuy nhiên, trong script thông báo vinh danh người hạ Boss (`announce_boss_3.mcfunction`), lệnh trao thưởng trực tiếp lại ghi:
    `give @s nether_wart[custom_data={ancient_mat:"demon_heart"},item_name='{"text":"☠ Trái Tim Của Quỷ ☠",...}'] 1`
- **Hậu quả**:
  Người chơi nhận vật phẩm từ phần thưởng announce mang ID `nether_wart` (Bướu Địa Ngục) không thể nộp vào NPC Alchemist để rèn trang bị Tier 10–12 do sai lệch ID vật phẩm cơ sở.
- **Giải pháp khắc phục**:
  Đổi ID vật phẩm trao thưởng tại dòng 9 của `announce_boss_3.mcfunction` từ `nether_wart` thành `fermented_spider_eye`.

---

#### [DEF-MED-02] Thiếu Cơ Chế Khóa Độc Bản (Singleton Lock) Cho Tiến Trình Daemon Kinh Tế
- **Vị trí phát hiện**: `Run-Server.bat` (Dòng 18) & `skyblock_economy_daemon.py`.
- **Mô tả hiện tượng**:
  Tệp `Run-Server.bat` luôn thực thi lệnh `start "Skyblock Economy Daemon" python -u skyblock_economy_daemon.py` mỗi khi khởi chạy. Khi server gặp sự cố crash hoặc lệnh `/restart`, cấu hình `restart-script: Run-Server.bat` trong `spigot.yml` sẽ kích hoạt lại batch script, sinh ra tiến trình daemon thứ hai trong khi tiến trình daemon cũ vẫn đang chạy nền.
- **Hậu quả**:
  Cả 2 daemon cùng đồng thời đọc `latest.log`. Khi người chơi gõ lệnh giao dịch (`/cf`, `/xoso`, `/bankhoangsan`), cả 2 daemon cùng bắt được log và gửi lệnh RCON thực thi 2 lần (Race condition / duplicate transaction nghiêm trọng), khiến người chơi bị trừ tiền 2 lần hoặc nhận thưởng gấp đôi.
- **Giải pháp khắc phục**:
  Bổ sung cơ chế Windows Named Mutex, Socket Bind Lock hoặc File Lock PID vào đầu hàm `main()` của `skyblock_economy_daemon.py`.

---

#### [DEF-MED-03] Xung Đột `spawn-protection=160` Khóa Rương Công Cộng Quanh Spawn Do Thiếu WorldGuard
- **Vị trí phát hiện**: `server.properties` (Dòng 60) & thư mục `plugins/`.
- **Mô tả hiện tượng**:
  Cấu hình đặt `spawn-protection=160`. Máy chủ chỉ cài đặt `WorldEdit`, hoàn toàn không có `WorldGuard`. Theo cơ chế bảo vệ gốc của Vanilla Minecraft Dedicated Server, toàn bộ tương tác đặt khối, phá khối và mở rương/kho chứa đồ (`isSpawnProtected`) trong bán kính 160 block quanh Spawn đều bị chặn đối với người chơi Non-OP.
- **Hậu quả**:
  Người chơi Non-OP không thể mở Ender Chest tại Sảnh Boss (`-3 111 58`, cách spawn 58 block), rương Safe Gallery tại Nông Trại (`-60 111 -5`), rương Đấu trường PvP và không thể đặt rương để tạo ChestShop tại khu vực chợ Spawn.
- **Giải pháp khắc phục**:
  Thiết lập `spawn-protection=0` trong `server.properties` (vì khu vực Spawn đã có thể được bảo vệ bằng ranh giới phiêu lưu/datapack), hoặc cài đặt `WorldGuard` để cấp quyền `chest-access: allow` tại các khu vực công cộng.

---

#### [DEF-MED-04] Lỗi Lệnh `/is team` Trả Về `Unknown Command` Trong IridiumSkyblock
- **Vị trí phát hiện**: `plugins/IridiumSkyblock/commands.yml` (Dòng 18–25).
- **Mô tả hiện tượng**:
  Trong cấu hình lệnh của IridiumSkyblock, lệnh quản lý thành viên đảo được khai báo dưới mục `membersCommand` với alias duy nhất là `["members"]`. Không có alias `team`.
  Kiểm tra thực tế qua RCON:
  - Gõ `is members` -> Phản hồi hợp lệ: `You must be a player to execute this command.`
  - Gõ `is team` -> Báo lỗi: `§9§lIridiumSkyblock §8» §7Unknown Command, Try /is help.`
- **Hậu quả**:
  Phần lớn người chơi Skyblock quen sử dụng cú pháp kinh điển `/is team` sẽ gặp lỗi lệnh không tồn tại, gây khó chịu và gián đoạn trải nghiệm người dùng.
- **Giải pháp khắc phục**:
  Thêm `- "team"` vào danh sách `aliases` của `membersCommand` trong `plugins/IridiumSkyblock/commands.yml` hoặc thêm alias ánh xạ trong `commands.yml` gốc.

---

### 4.4 Cấp Độ LOW (Cảnh Báo Cấu Hình, Trợ Giúp & Tệp Rác)

#### [DEF-LOW-01] 22 Alias Tự Trỏ Sai Cấu Trúc Trong `commands.yml` Gây Bão Cảnh Báo Console
- **Vị trí phát hiện**: `commands.yml` (Dòng 118–161) & `logs/latest.log` (Dòng 151–172).
- **Mô tả hiện tượng**:
  Tệp `commands.yml` khai báo 22 alias trỏ vào chính nó hoặc vào lệnh chưa đăng ký trong Bukkit CommandMap (ví dụ: `bankhoangsan: - bankhoangsan $1-`, `beacon: - beacon $1-`). Bukkit ném 22 cảnh báo [WARN] liên tiếp:
  `[Server thread/WARN]: Could not register alias <name> because it contains commands that do not exist: <name> $1-`
- **Hậu quả**:
  Console log bị rác. Khi người chơi gõ lệnh trong game, client nhận thông báo lỗi đỏ "Unknown or incomplete command" trước khi daemon bắt được log và thực thi.
- **Giải pháp khắc phục**:
  Xóa bỏ 22 khai báo alias tự trỏ này khỏi `commands.yml`, hoặc thay thế bằng cơ chế đăng ký command thông qua scoreboard trigger hợp lệ.

---

#### [DEF-LOW-02] Tệp Cấu Hình Rác Mồ Côi `config.yml` (10KB) Tại Thư Mục Gốc Máy Chủ
- **Vị trí phát hiện**: `Skyblock-Server/config.yml` (Dung lượng 10,012 bytes, 182 dòng).
- **Mô tả hiện tượng**:
  Tệp cấu hình mẫu tiếng Anh mặc định của plugin `ScoreboardPL` bị bỏ quên tại thư mục gốc trong quá trình giải nén hoặc cài đặt. Paper chỉ đọc cấu hình từ `plugins/ScoreboardPL/config.yml`.
- **Hậu quả**:
  Tệp rác không được sử dụng, gây nhầm lẫn cho quản trị viên khi điều chỉnh cấu hình hệ thống.
- **Giải pháp khắc phục**:
  Xóa bỏ hoặc chuyển tệp này vào thư mục lưu trữ tài liệu tham khảo.

---

#### [DEF-LOW-03] Bất Nhất Cú Pháp Lệnh Casino Giữa `help.yml` Và Bộ Phân Tích Của Daemon
- **Vị trí phát hiện**: `help.yml` (Dòng 173–174) & `skyblock_economy_daemon.py` (Hàm `parse_bet`).
- **Mô tả hiện tượng**:
  Trong `help.yml` hướng dẫn người chơi gõ: `/cf <tiền> <ngửa/sấp>` và `/xoso <tiền> <số>`.
  Trong thực tế mã nguồn daemon, hàm `parse_bet` chỉ chấp nhận duy nhất một đối số là số tiền cược (`/cf 5000`, `/xoso 1000`). Nếu người chơi gõ thêm chữ `ngua` hoặc số dự đoán, daemon sẽ báo lỗi: `"Mức cược không hợp lệ!"`.
- **Giải pháp khắc phục**:
  Đồng bộ lại tài liệu hướng dẫn trong `help.yml` thành: `&a/cf <tiền cược>` và `&a/xoso <tiền mua vé>`.

---

#### [DEF-LOW-04] Thiếu Khai Báo Alias Tiếng Việt `/cuahang` Trong `commands.yml`
- **Vị trí phát hiện**: `commands.yml` (Dòng 10–11).
- **Mô tả hiện tượng**:
  Hệ thống đã khai báo alias `shop: - is shop $1-`, nhưng chưa có alias tiếng Việt `/cuahang`. Khi người chơi gõ `/cuahang` sẽ nhận thông báo Unknown command.
- **Giải pháp khắc phục**:
  Bổ sung `cuahang: - is shop $1-` vào `commands.yml`.

---

## 5. ĐÁNH GIÁ KHÁCH QUAN VỀ CÔNG CỤ KIỂM TRA CÚ PHÁP `verify_syntax.py`

Trong quá trình nghiệm thu, công cụ kiểm tra cú pháp nội bộ `verify_syntax.py` được đối soát độc lập với kết quả runtime của máy chủ Paper. Kết quả phân tích pháp y cho thấy công cụ này tồn tại các **điểm mù kỹ thuật nghiêm trọng**:

### 5.1 Cơ Chế Hoạt Động Hiện Tại Của `verify_syntax.py`
Mã nguồn của `verify_syntax.py` chỉ thực hiện duyệt từng dòng trong các tệp `.mcfunction` và thực hiện 3 phép đếm ký tự cơ bản:
```python
curly = line.count("{") - line.count("}")
square = line.count("[") - line.count("]")
if single_quotes % 2 != 0:
    # Báo lỗi nháy đơn
```

### 5.2 Điểm Mù Kỹ Thuật (Technical Blind Spots)
1. **Không Phân Tích Cú Pháp Lệnh Minecraft (Zero Command Grammar Parsing)**:
   Công cụ hoàn toàn không có khả năng nhận diện cấu trúc ngữ pháp của các lệnh Minecraft như `fill`, `execute`, `give`, `summon`, `teleport`.
2. **Cung Cấp Bằng Chứng Đúng Đắn Giả Mạo (False Sense of Correctness)**:
   Tại dòng 101–102 của `tick.mcfunction`:
   `run fill ~-1 ~ ~-1 ~1 ~15 ~1 air destroy replace #minecraft:logs`
   Dòng lệnh này hoàn toàn cân bằng về dấu ngoặc (`curly = 0`, `square = 0`, `single_quotes = 0`). Do đó, `verify_syntax.py` báo cáo dòng này là hợp lệ và in ra kết luận:
   `SUCCESS: ALL FILES PASSED SYNTAX AND BRACKET CHECKS! (0 errors)`
   Tuy nhiên, khi Paper Server nạp tệp này, máy chủ lập tức ném ngoại lệ dừng nạp và vô hiệu hóa toàn bộ datapack (Lỗi Blocker DEF-BLK-01).

### 5.3 Kết Luận Đánh Giá Về `verify_syntax.py`
Công cụ `verify_syntax.py` hiện tại chỉ là một **bộ đếm ngoặc thô sơ (Naive Bracket Counter)**, không thể dùng làm thước đo chứng nhận chất lượng cú pháp cho các tệp Minecraft Datapack. Báo cáo "100% PASS" của công cụ này không có giá trị bảo chứng cho khả năng vận hành thực tế trên máy chủ.

---

## 6. KẾ HOẠCH KHẮC PHỤC KHẨN CẤP TRƯỚC PHÁT HÀNH (ACTIONABLE PRE-LAUNCH REMEDIATION PLAN)

Để đưa hệ thống máy chủ vào trạng thái sẵn sàng phát hành chính thức (Production Ready), đội ngũ kỹ thuật cần thực thi lộ trình khắc phục 11 bước dưới đây theo đúng thứ tự ưu tiên:

```
========================================================================================
LỘ TRÌNH KHẮC PHỤC KHẨN CẤP TRƯỚC PHÁT HÀNH (PRE-LAUNCH REMEDIATION ROADMAP)
========================================================================================
Bước   Mức Độ      Tệp Cần Chỉnh Sửa                    Hành Động Khắc Phục Cụ Thể
----------------------------------------------------------------------------------------
01     P0-BLOCKER  generate_all.py (792-793)            Sửa 'air destroy replace' thành 'air replace'
02     P0-BLOCKER  tick.mcfunction (101-102)            Đồng bộ lệnh fill không chứa từ khóa destroy
03     P1-HIGH     skyblock_economy_daemon.py (197-207) Xóa bỏ logic can thiệp tỷ lệ trúng/trượt Xổ số
04     P1-HIGH     skyblock_economy_daemon.py (287-296) Xóa bỏ tỷ lệ Coinflip 85%/25%, đặt chuẩn 50.0%
05     P1-HIGH     skyblock_economy_daemon.py (620-735) Thêm kiểm tra quyền OP/Admin cho lệnh /haidang
06     P1-HIGH     tick.mcfunction & generate_all.py    Bổ sung interaction listener cho hòm Crates
07     P1-HIGH     tick.mcfunction & generate_all.py    Bổ sung interaction listener cho quầy Casino
08     P2-MEDIUM   announce_boss_3.mcfunction (Dòng 9)  Đổi ID thưởng từ nether_wart thành fermented_spider_eye
09     P2-MEDIUM   skyblock_economy_daemon.py           Bổ sung Singleton Named Mutex / Socket Lock
10     P2-MEDIUM   server.properties (Dòng 60)          Đặt spawn-protection=0 để mở rương công cộng
11     P2-MEDIUM   plugins/IridiumSkyblock/commands.yml Thêm alias "team" vào membersCommand
12     P3-LOW      commands.yml (Dòng 118-161)          Dọn sạch 22 alias tự trỏ, thêm alias /cuahang
13     P3-LOW      help.yml (Dòng 173-174)              Chỉnh sửa cú pháp /cf và /xoso về 1 tham số tiền
14     P3-LOW      Thư mục gốc Skyblock-Server          Xóa/lưu trữ tệp cấu hình mồ côi config.yml (10KB)
========================================================================================
```

### Chi Tiết Kỹ Thuật Các Bước Sửa Đổi Trọng Yếu:

1. **Khắc phục lỗi cú pháp Datapack (Bước 01 & 02)**:
   Thay thế tại `generate_all.py`:
   ```python
   # Dòng 792-793 sửa thành:
   execute as @a[scores={use_n_axe=1..}] if items entity @s weapon.mainhand *[custom_data~{ancient_axe:1b}] at @s anchored eyes positioned ^ ^ ^2.5 run fill ~-1 ~ ~-1 ~1 ~15 ~1 air replace #minecraft:logs
   execute as @a[scores={use_d_axe=1..}] if items entity @s weapon.mainhand *[custom_data~{ancient_axe:1b}] at @s anchored eyes positioned ^ ^ ^2.5 run fill ~-1 ~ ~-1 ~1 ~15 ~1 air replace #minecraft:logs
   ```
   Chạy lệnh `python generate_all.py` để tái sinh toàn bộ các tệp `.mcfunction` đồng bộ.

2. **Loại bỏ mã gian lận Casino (Bước 03 & 04)**:
   Xóa sạch các dòng gán tỷ lệ riêng cho `sondzvc` và `hieudzvc`. Trong `handle_cf_cmd`, đặt mặc định:
   ```python
   win_chance = 0.50
   is_win = random.random() < win_chance
   ```

3. **Vá lỗ hổng bảo mật `/haidang` (Bước 05)**:
   Trong hàm `handle_beacon_cmd`, thêm khối xác thực trước khi gửi lệnh RCON:
   ```python
   # Kiểm tra quyền quản trị trước khi xử lý
   if not is_player_op(player):
       rcon.cmd(f'tellraw {player} {{"text":"[Hải Đăng] Bạn không có quyền sử dụng lệnh này!","color":"red"}}')
       return
   ```

4. **Bổ sung Listeners tương tác trong `tick.mcfunction` (Bước 06 & 07)**:
   Thêm vào `tick.mcfunction` các khối lệnh điều phối:
   ```mcfunction
   # Xử lý mở Rương Báu Crates
   execute as @e[type=interaction,tag=crate_common] if data entity @s interaction on target run function skyblock:crates/open_common
   execute as @e[type=interaction,tag=crate_rare] if data entity @s interaction on target run function skyblock:crates/open_rare
   execute as @e[type=interaction,tag=crate_mythic] if data entity @s interaction on target run function skyblock:crates/open_mythic
   execute as @e[type=interaction,tag=crate_interact] run data remove entity @s interaction

   # Xử lý tương tác Menu Casino
   execute as @e[type=interaction,tag=cf_interact] if data entity @s interaction on target run tellraw @s [{"text":"[Casino] ","color":"gold","bold":true},{"text":"Bấm để cược: ","color":"yellow"},{"text":"[CƯỢC $1,000] ","color":"green","bold":true,"clickEvent":{"action":"run_command","value":"/cf 1000"}},{"text":"[CƯỢC $10,000]","color":"aqua","bold":true,"clickEvent":{"action":"run_command","value":"/cf 10000"}}]
   execute as @e[type=interaction,tag=cf_interact] run data remove entity @s interaction

   execute as @e[type=interaction,tag=xoso_interact] if data entity @s interaction on target run tellraw @s [{"text":"[Casino] ","color":"green","bold":true},{"text":"Bấm để mua vé: ","color":"yellow"},{"text":"[MUA VÉ $1,000] ","color":"gold","bold":true,"clickEvent":{"action":"run_command","value":"/xoso 1000"}},{"text":"[MUA VÉ $5,000]","color":"light_purple","bold":true,"clickEvent":{"action":"run_command","value":"/xoso 5000"}}]
   execute as @e[type=interaction,tag=xoso_interact] run data remove entity @s interaction
   ```

---

## 7. KẾT LUẬN NGHIỆM THU & KHUYẾN NGHỊ VẬN HÀNH

### 7.1 Phán Quyết Kiểm Toán Cuối Cùng (Final Audit Verdict)

$$\mathbf{VERDICT: \quad INTEGRITY \ VIOLATION \ / \ REJECTED \ FOR \ PUBLIC \ LAUNCH}$$

**PHÁN QUYẾT: TỪ CHỐI NGHIỆM THU PHÁT HÀNH TẠI THỜI ĐIỂM HIỆN TẠI.**

### 7.2 Căn Cứ Phán Quyết Kỹ Thuật
Mặc dù hệ thống đã vượt qua xuất sắc hai bộ kiểm thử tự động ngoại tuyến (`test_r1_progression.py` và `test_r4_daemon.py` đạt 100% PASS), việc chấp thuận nghiệm thu chính thức **BỊ TỪ CHỐI** dựa trên 3 vi phạm kỹ thuật cốt lõi:
1. **Lỗi Tê Liệt Runtime (Blocker Defect)**: Lỗi cú pháp lệnh `fill` trong `generate_all.py` khiến Paper Server từ chối nạp `skyblock:tick`. Toàn bộ hệ thống kỹ năng vũ khí, buff giáp, và cơ chế hồi quy đấu trường của Datapack hoàn toàn không hoạt động trong môi trường thực tế.
2. **Vi Phạm Liêm Chính Kinh Tế (Code Integrity Violation)**: Mã nguồn backend chứa các đoạn mã gian lận tỷ lệ Coinflip và Xổ số được gán cứng theo tên người chơi, đe dọa trực tiếp đến sự cân bằng kinh tế và uy tín của máy chủ.
3. **Lỗ Hổng An Ninh Nghiêm Trọng (Security Exploit)**: Tính năng `/haidang` cho phép người chơi không có quyền hạn lợi dụng RCON OP Level 4 để sinh khối tài nguyên quý vô hạn và phá hủy địa hình thế giới.

### 7.3 Điều Kiện Tiên Quyết Để Nghiệm Thu Lại (Re-Audit Prerequisites)
Hệ thống sẽ được cấp chứng chỉ Nghiệm Thu Chính Thức (PASS) sau khi đáp ứng đầy đủ các điều kiện sau:
1. Hoàn tất toàn bộ 14 bước trong **Kế Hoạch Khắc Phục Khẩn Cấp Trước Phát Hành**.
2. Thực thi lệnh `python generate_all.py` không phát sinh lỗi.
3. Khởi động lại Paper Server, ghi nhận log `logs/latest.log` nạp thành công `skyblock:tick` và tag `minecraft:tick` với 0 lỗi ngoại lệ `CompletionException`.
4. Không còn bất kỳ đoạn mã can thiệp tỷ lệ may rủi cứng nào trong `skyblock_economy_daemon.py`.
5. Đội ngũ kiểm toán độc lập tiến hành thẩm định và xác nhận các tiêu chí trên trong phiên Re-Audit.

---
*Báo cáo được lập và lưu trữ chính thức tại thư mục gốc dự án: `C:\Users\Administrator\.gemini\antigravity\scratch\Skyblock-Server\AUDIT_REPORT.md`.*
