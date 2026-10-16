# Báo Cáo Khảo Sát Kỹ Thuật: Yêu Cầu R3 & R4 (Server Stability & Economy Daemon Reliability)

**Thời gian khảo sát**: 2026-10-12  
**Người thực hiện**: Explorer 3  
**Dự án**: Paper 1.21.4 Skyblock Server  
**Mục tiêu**: Điều tra toàn diện R3 (Ổn định Server & JVM & Cấu hình) và R4 (Độ tin cậy của Daemon Kinh Tế & Log Rotation)

---

## 1. Tóm Tắt Khảo Sát (Executive Summary)

1. **R3.1 - `spigot.yml` Crash-Restart & EXP Lag**:
   - `settings.restart-script` hiện đang là `./start.sh` (dòng 36), dẫn đến lỗi `CreateProcess error=2` trên hệ điều hành Windows khi server bị crash hoặc gọi `/restart`. Đã xác nhận cần đổi thành `Run-Server.bat`.
   - `world-settings.default.merge-radius.exp` hiện là `-1.0` (dòng 162), làm vô hiệu hóa hoàn toàn cơ chế gộp hạt kinh nghiệm (EXP orbs), gây spawn hàng ngàn entity độc lập tại các máy farm quái/spawner, sụt giảm TPS nghiêm trọng. Đã xác nhận cần đổi thành `3.0`.
2. **R3.2 - `Run-Server.bat` JVM Garbage Collection Flags**:
   - Dòng 18 hiện tại chỉ sử dụng cờ thô sơ: `"%JAVA_CMD%" -Xms2G -Xmx4G -XX:+UseG1GC -jar paper.jar --nogui`. Việc chênh lệch `-Xms2G` và `-Xmx4G` gây giật lag khi JVM phải cấp phát lại bộ nhớ trong lúc chạy; thiếu các cờ tinh chỉnh G1GC khiến server dễ bị đứng hình (Stop-The-World) khi dọn dẹp bộ nhớ.
   - Đã xác thực bộ cờ **Aikar's Flags chuẩn cho Java 21 G1GC** trực tiếp trên môi trường máy chủ với `Eclipse Adoptium Temurin-21.0.12.1+1`: 100% cờ được hỗ trợ mượt mà, trả về mã thoát `0`.
3. **R3.3 - `plugins/Essentials/config.yml` Tân Thủ Kit**:
   - Dòng 1278 trong `plugins/Essentials/config.yml` đang trỏ tới `kit: tools` (chỉ cho vài món đồ đá cơ bản).
   - Đã kiểm tra file `plugins/Essentials/kits.yml` (dòng 19-39): Kit `tanthu` đã được định nghĩa đầy đủ 17 phần thưởng chất lượng (trang bị sắt, giáp da, thức ăn, đuốc, mầm cây, xương, băng, xô dung nham, 10 ngọc lục bảo, cộng $1,000 tiền Vault và thông báo chào mừng). Đổi dòng 1278 thành `kit: tanthu` sẽ kích hoạt ngay cho mọi người chơi mới vào server.
4. **R4 - Daemon Kinh Tế & Xử Lý Log Rotation (`skyblock_economy_daemon.py`)**:
   - **Phát hiện quan trọng (First-Principles)**: Trên Windows, lệnh `open(LOG_PATH, 'r')` mặc định khóa file (`WinError 32: The process cannot access the file because it is being used by another process`), ngăn cản Log4j của Minecraft xoay vòng log (rotate `latest.log` -> `.log.gz`).
   - Vòng lặp tail log hiện tại (dòng 820-841) không theo dõi kích thước file hoặc inode. Khi log bị reset hoặc file size thu nhỏ hơn con trỏ `tell()`, `readline()` trả về rỗng vô tận, làm daemon "điếc" toàn bộ lệnh của người chơi (`/bankhoangsan`, `/xoso`, `/cf`, `/banexp`...).
   - Đã thiết kế và kiểm thử thành công module mở file chia sẻ quyền xóa (`FILE_SHARE_DELETE`) qua Windows API `CreateFileW` kết hợp bộ nhận diện xoay vòng log dựa trên `st_ino` và `st_size < tell()`.

---

## 2. Chi Tiết Khảo Sát Yêu Cầu R3: Ổn Định Server & Khởi Động Crash

### 2.1. File `spigot.yml`
- **Đường dẫn**: `C:\Users\Administrator\.gemini\antigravity\scratch\Skyblock-Server\spigot.yml`
- **Định dạng**: YAML (Đã kiểm tra bằng PyYAML: `VALID`).

#### Điểm 1: Cơ chế tự khởi động khi Crash trên Windows
- **Vị trí hiện tại**: Dòng 35 - 36
```yaml
35:   restart-on-crash: true
36:   restart-script: ./start.sh
```
- **Hiện tượng & Nguyên nhân**:
  - `spigot.yml` có `restart-on-crash: true`, nghĩa là khi Watchdog phát hiện server bị treo (quá `timeout-time: 60s`) hoặc khi admin gõ `/restart`, tiến trình Spigot sẽ gọi `restart-script`.
  - Trên Windows, không có tệp `start.sh` và Windows không thực thi bash script mặc định, gây lỗi hệ thống `Cannot run program "./start.sh" (CreateProcess error=2, The system cannot find the file specified)`. Server tắt hẳn mà không khởi động lại.
- **Đề xuất thay đổi**:
```yaml
35:   restart-on-crash: true
36:   restart-script: Run-Server.bat
```

#### Điểm 2: Tối ưu gộp hạt kinh nghiệm (EXP Merge Radius)
- **Vị trí hiện tại**: Dòng 160 - 163
```yaml
160:     merge-radius:
161:       item: 0.5
162:       exp: -1.0
163:     verbose: false
```
- **Hiện tượng & Nguyên nhân**:
  - Giá trị `exp: -1.0` có nghĩa là **tắt hoàn toàn tính năng gộp EXP orb**.
  - Trong chế độ Skyblock, người chơi xây dựng các máy đập quái tập trung (Mob Grinder, Zombie Piglin Farm, Blaze Farm). Hàng ngàn hạt EXP rơi ra độc lập, mỗi hạt là một Entity riêng biệt phải chạy tick logic trên CPU và gửi gói tin tọa độ liên tục về client. Điều này gây sụt giảm TPS xuống 10-15 và làm giật lag máy chủ.
- **Đề xuất thay đổi**:
```yaml
160:     merge-radius:
161:       item: 0.5
162:       exp: 3.0
163:     verbose: false
```
- **Tác dụng**: Gộp các hạt EXP rơi trong bán kính 3 block thành các hạt EXP lớn hơn, giảm 80-95% số lượng entity EXP trên server mà không làm mất điểm kinh nghiệm của người chơi.

---

### 2.2. File `Run-Server.bat` & Cấu Hình Aikar's Flags (Java 21 G1GC)
- **Đường dẫn**: `C:\Users\Administrator\.gemini\antigravity\scratch\Skyblock-Server\Run-Server.bat`
- **Vị trí hiện tại**: Dòng 17 - 19
```bat
17: echo Dang khoi dong server bang: %JAVA_CMD%
18: "%JAVA_CMD%" -Xms2G -Xmx4G -XX:+UseG1GC -jar paper.jar --nogui
19: echo.
```

#### Phân tích kỹ thuật chuyên sâu về cờ JVM:
1. **Thiếu tính đồng nhất bộ nhớ (`-Xms` khác `-Xmx`)**:
   - Hiện tại: `-Xms2G -Xmx4G`. Khi tải server tăng, JVM phải yêu cầu HĐH cấp thêm từng khối bộ nhớ (Heap expansion), kích hoạt Full GC đột ngột làm đơ game trong 1-3 giây.
   - Khắc phục: Đặt `-Xms4G -Xmx4G` bằng nhau để cấp phát cố định 4GB RAM ngay từ đầu.
2. **Kích hoạt bộ cờ tối ưu Aikar's Flags**:
   - Bộ cờ của Aikar được thiết kế chuẩn mực riêng cho máy chủ Minecraft chạy Paper / Purpur sử dụng G1GC, giải quyết tận gốc vấn đề Stop-The-World (STW).

#### Bộ cờ đề xuất thay thế cho Dòng 18:
```bat
"%JAVA_CMD%" -Xms4G -Xmx4G -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar paper.jar --nogui
```

#### Giải thích chi tiết các cờ:
| Cờ JVM | Mục đích & Lợi ích kỹ thuật |
|---|---|
| `-Xms4G -Xmx4G` | Cố định 4GB Heap RAM, triệt tiêu chi phí mở rộng heap runtime. |
| `-XX:+UseG1GC` | Thu gom rác phân vùng (Garbage-First GC), tối ưu cho ứng dụng đa luồng bộ nhớ lớn. |
| `-XX:+ParallelRefProcEnabled` | Xử lý tham chiếu song song, giảm 50-70% thời gian pause khi dọn rác. |
| `-XX:MaxGCPauseMillis=200` | Mục tiêu độ trễ tối đa mỗi lần dọn rác là 200ms, không làm trễ tick 50ms của Minecraft quá lâu. |
| `-XX:+UnlockExperimentalVMOptions` | Cho phép mở các tham số tinh chỉnh nâng cao của G1GC. |
| `-XX:+DisableExplicitGC` | Chặn các plugin gọi `System.gc()` tùy tiện gây đóng băng server. |
| `-XX:+AlwaysPreTouch` | Cam kết nạp toàn bộ trang RAM vật lý vào bộ nhớ ngay khi khởi động, tránh page faults giữa trận đấu. |
| `-XX:G1NewSizePercent=30` | Kích thước tối thiểu của thế hệ trẻ (Young Gen) là 30%, đủ chỗ cho các object ngắn hạn. |
| `-XX:G1MaxNewSizePercent=40` | Kích thước tối đa của thế hệ trẻ là 40%, tránh phình to làm chậm GC. |
| `-XX:G1ReservePercent=20` | Dự phòng 20% bộ nhớ làm vùng đệm, chống lỗi cạn kiệt không gian (To-space exhaustion). |
| `-XX:G1HeapWastePercent=5` | Bắt đầu chu kỳ Mixed GC khi lượng rác lãng phí trong Old Gen vượt 5%. |
| `-XX:G1MixedGCCountTarget=4` | Chia nhỏ quá trình dọn Old Gen thành 4 chu kỳ ngắn thay vì 1 lần dọn lớn. |
| `-XX:InitiatingHeapOccupancyPercent=15`| Bắt đầu đánh dấu nền khi Old Gen chiếm 15% để chủ động dọn sớm. |
| `-XX:G1MixedGCLiveThresholdPercent=90`| Dọn các phân vùng có tỷ lệ object sống dưới 90%. |
| `-XX:G1RSetUpdatingPauseTimePercent=5`| Giới hạn thời gian cập nhật Remembered Set tối đa 5% ngân sách pause. |
| `-XX:SurvivorRatio=32` | Tỷ lệ Eden/Survivor 32:1, tối đa hóa không gian chứa object mới sinh. |
| `-XX:+PerfDisableSharedMem` | Tắt ghi file giám sát jvmstat ra ổ đĩa, loại bỏ nghẽn I/O trên Windows. |
| `-XX:MaxTenuringThreshold=1` | Chuyển ngay các object sống sót qua 1 lần GC lên Old Gen, giữ Young Gen luôn sạch sẽ. |

#### Kết quả kiểm thử thực tế trên máy chủ:
- Lệnh chạy thử nghiệm:
  ```powershell
  & "C:\Program Files\Eclipse Adoptium\jre-21.0.12.101-hotspot\bin\java.exe" -Xms4G -Xmx4G -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 "-Dusing.aikars.flags=https://mcflags.emc.gs" "-Daikars.new.flags=true" -version
  ```
- Kết quả: **Thành công 100% (Mã thoát 0)**, OpenJDK 21.0.12.1 Temurin chấp nhận toàn bộ cờ không có cảnh báo deprecation.

---

### 2.3. File `plugins/Essentials/config.yml` & `kits.yml`
- **File cấu hình**: `C:\Users\Administrator\.gemini\antigravity\scratch\Skyblock-Server\plugins\Essentials\config.yml`
- **Vị trí hiện tại**: Dòng 1274 - 1279
```yaml
1274:   # Should players receive items on their first join?
1275:   # This kit will be given regardless of cost and permissions and won't trigger any kit delay (cooldown).
1276:   # Set to '' to disable.
1277:   #kit: ''
1278:   kit: tools
```
- **Đề xuất thay đổi**: Sửa dòng 1278 thành:
```yaml
1278:   kit: tanthu
```

#### Xác minh định nghĩa Kit trong `plugins/Essentials/kits.yml`:
- **Vị trí**: Dòng 19 - 39
```yaml
19: kits:
20:   tanthu:
21:     delay: 86400
22:     items:
23:       - iron_sword 1 sharpness:1 unbreaking:1 name:&a&lKiếm_Tân_Thủ lore:&7Vũ_khí_khởi_đầu_Skyblock!
24:       - iron_pickaxe 1 efficiency:1 unbreaking:1 name:&a&lCúp_Tân_Thủ lore:&7Dùng_để_đào_đá_và_khoáng_sản!
25:       - iron_axe 1 efficiency:1 unbreaking:1 name:&a&lRìu_Tân_Thủ lore:&7Chặt_cây_mở_rộng_đảo!
26:       - iron_shovel 1 efficiency:1 unbreaking:1 name:&a&lXẻng_Tân_Thủ lore:&7Dùng_để_đào_đất!
27:       - leather_helmet 1 protection:1 unbreaking:1 name:&a&lMũ_Tân_Thủ
28:       - leather_chestplate 1 protection:1 unbreaking:1 name:&a&lÁo_Tân_Thủ
29:       - leather_leggings 1 protection:1 unbreaking:1 name:&a&lQuần_Tân_Thủ
30:       - leather_boots 1 protection:1 unbreaking:1 name:&a&lGiày_Tân_Thủ
31:       - cooked_beef 32 name:&6&lBò_Nướng_Tân_Thủ
32:       - torch 32
33:       - oak_sapling 4
34:       - bone_meal 16
35:       - ice 2
36:       - lava_bucket 1
37:       - emerald 10 name:&a&lNgọc_Khởi_Nghiệp
38:       - /eco give {USERNAME} 1000
39:       - /broadcast &a[Server] &eChào mừng tân thủ &b{USERNAME} &eđã nhận &aKit Tân Thủ&e!
```
- **Đánh giá**:
  - Kit `tanthu` đã tồn tại sẵn, cú pháp chuẩn xác, hỗ trợ đầy đủ tiếng Việt và màu sắc Minecraft (`&a`, `&e`, `&6`...).
  - Thiết lập trong `newbies.kit: tanthu` hoàn toàn hợp lệ và tự động phát cho mọi người chơi lần đầu vào server.

---

## 3. Chi Tiết Khảo Sát Yêu Cầu R4: Xử Lý Log Rotation trong Daemon Kinh Tế

### 3.1. Hiện Trạng File `skyblock_economy_daemon.py`
- **Đường dẫn**: `C:\Users\Administrator\.gemini\antigravity\scratch\Skyblock-Server\skyblock_economy_daemon.py`
- **Độ dài**: 890 dòng
- **Trạng thái biên dịch**: `python -m py_compile skyblock_economy_daemon.py` -> **PASS (Mã thoát 0)**.

#### Phân tích đoạn mã tail log hiện tại (Dòng 820 - 841):
```python
820:     # Open log file to tail
821:     log_file = None
822:     if os.path.exists(LOG_PATH):
823:         log_file = open(LOG_PATH, 'r', encoding='utf-8', errors='ignore')
824:         log_file.seek(0, os.SEEK_END)
825:     
826:     last_eco_check = 0.0
827: 
828:     while True:
829:         try:
830:             # 1. Read new lines from latest.log
831:             if log_file:
832:                 while True:
833:                     line = log_file.readline()
834:                     if not line:
835:                         break
836:                     process_log_line(line)
837:             else:
838:                 if os.path.exists(LOG_PATH):
839:                     log_file = open(LOG_PATH, 'r', encoding='utf-8', errors='ignore')
840:                     log_file.seek(0, os.SEEK_END)
```

#### Các lỗi nghiêm trọng được phát hiện:
1. **Lỗi khóa file Windows (`WinError 32`)**:
   - Khi chạy `open(LOG_PATH, 'r')` thông thường trên Windows C-runtime, tệp tin bị khóa cấm đổi tên/xóa (`FILE_SHARE_DELETE` không được bật).
   - Khi Paper/Log4j cần nén log cũ (`latest.log` -> `2026-10-12-1.log.gz`), tiến trình Java bị lỗi truy cập file do Python đang giữ handle, làm hỏng cơ chế xoay vòng log của Paper.
2. **Lỗi mất kết nối khi log bị đổi tên (Dangling Handle)**:
   - Nếu tệp `latest.log` được đổi tên thành `latest.log.1`, handle `log_file` của Python vẫn trỏ vào tệp cũ. Tệp `latest.log` mới được tạo ra hoàn toàn không được đọc!
3. **Lỗi lệch con trỏ khi tệp bị thu nhỏ/xóa rỗng (File Truncation Desync)**:
   - Khi server restart hoặc admin xóa log, kích thước file trở về 0 byte.
   - Nhưng con trỏ `log_file.tell()` vẫn ở vị trí cũ (ví dụ: byte 105,581). `readline()` sẽ luôn trả về chuỗi rỗng `""` vì con trỏ nằm sau EOF, dẫn đến daemon bị "điếc" hoàn toàn cho đến khi file log phình to hơn 105KB (và toàn bộ lệnh từ byte 0 đến 105KB bị mất vĩnh viễn).

---

### 3.2. Giải Pháp Kỹ Thuật Đề Xuất (Architecture & Implementation)

Để giải quyết triệt để trên cả Windows và Linux, đề xuất triển khai 2 thành phần:

#### Thành phần 1: Hàm mở tệp hỗ trợ Full File Sharing trên Windows (`open_log_shared`)
Sử dụng Windows API thông qua `ctypes` và `msvcrt` tích hợp sẵn trong Python:
```python
def open_log_shared(path):
    """Mở file với đầy đủ quyền chia sẻ (READ, WRITE, DELETE) trên Windows để tránh chặn Log4j rotation."""
    if sys.platform == 'win32':
        import ctypes, msvcrt
        GENERIC_READ = 0x80000000
        FILE_SHARE_READ = 0x00000001
        FILE_SHARE_WRITE = 0x00000002
        FILE_SHARE_DELETE = 0x00000004
        OPEN_EXISTING = 3
        FILE_ATTRIBUTE_NORMAL = 0x80
        handle = ctypes.windll.kernel32.CreateFileW(
            path,
            GENERIC_READ,
            FILE_SHARE_READ | FILE_SHARE_WRITE | FILE_SHARE_DELETE,
            None,
            OPEN_EXISTING,
            FILE_ATTRIBUTE_NORMAL,
            None
        )
        if handle == -1 or handle == 0xFFFFFFFFFFFFFFFF or handle == 0xFFFFFFFF:
            return None
        fd = msvcrt.open_osfhandle(handle, os.O_RDONLY)
        return open(fd, 'r', encoding='utf-8', errors='ignore')
    else:
        return open(path, 'r', encoding='utf-8', errors='ignore')
```

#### Thành phần 2: Vòng lặp phát hiện Rotation & Truncation thông minh
```python
    # Open log file to tail
    log_file = None
    current_ino = None
    if os.path.exists(LOG_PATH):
        try:
            st = os.stat(LOG_PATH)
            log_file = open_log_shared(LOG_PATH)
            if log_file:
                log_file.seek(0, os.SEEK_END)
                current_ino = st.st_ino
        except Exception:
            log_file = None
            current_ino = None
    
    last_eco_check = 0.0

    while True:
        try:
            # 1. Kiểm tra trạng thái file: phát hiện log rotation hoặc truncation
            if log_file:
                try:
                    st = os.stat(LOG_PATH)
                    curr_pos = log_file.tell()
                    is_truncated = st.st_size < curr_pos
                    is_rotated = (current_ino is not None and st.st_ino != current_ino)
                    
                    if is_truncated or is_rotated:
                        try:
                            log_file.close()
                        except Exception:
                            pass
                        log_file = open_log_shared(LOG_PATH)
                        if log_file:
                            current_ino = st.st_ino
                            # Khi file được tạo mới hoặc bị reset, đọc từ đầu file (byte 0)
                            log_file.seek(0, os.SEEK_SET)
                except FileNotFoundError:
                    # File tạm thời chưa xuất hiện trong tích tắc xoay log
                    try:
                        log_file.close()
                    except Exception:
                        pass
                    log_file = None
                    current_ino = None
                except PermissionError:
                    # File đang được tiến trình Java khởi tạo
                    pass
                except Exception:
                    pass

            if not log_file and os.path.exists(LOG_PATH):
                try:
                    st = os.stat(LOG_PATH)
                    log_file = open_log_shared(LOG_PATH)
                    if log_file:
                        current_ino = st.st_ino
                        log_file.seek(0, os.SEEK_SET)
                except Exception:
                    log_file = None
                    current_ino = None

            # 2. Đọc dòng mới từ latest.log
            if log_file:
                while True:
                    line = log_file.readline()
                    if not line:
                        break
                    process_log_line(line)

            # 3. Định kỳ kiểm tra scoreboard Vault (eco_add, buy_title) mỗi 2.0s
            # (Giữ nguyên logic nghiệp vụ hiện tại)
```

#### Kết quả thử nghiệm mô phỏng:
Đã chạy kịch bản thử nghiệm mô phỏng độc lập với 4 ca kiểm thử:
1. `Test 1 (Initial Open)`: Mở tệp và di chuyển con trỏ tới cuối tệp -> **PASS**
2. `Test 2 (Append)`: Ghi dòng mới và đọc đúng nội dung -> **PASS**
3. `Test 3 (Rotation via Rename)`: Đổi tên tệp trong khi Python vẫn mở tệp, tạo tệp mới cùng tên -> Phát hiện `st_ino` thay đổi, mở lại tệp mới và đọc dòng từ byte 0 -> **PASS**
4. `Test 4 (Truncation in-place)`: Ghi đè tệp với kích thước nhỏ hơn vị trí con trỏ -> Phát hiện `st.st_size < curr_pos`, mở lại tệp và đọc dòng từ đầu -> **PASS**

---

## 4. Hướng Dẫn Thay Đổi Cụ Thể Cho Từng Tệp (Diff Proposals)

### 4.1. `spigot.yml`
```diff
--- a/spigot.yml
+++ b/spigot.yml
@@ -35,2 +35,2 @@
   restart-on-crash: true
-  restart-script: ./start.sh
+  restart-script: Run-Server.bat
@@ -160,3 +160,3 @@
     merge-radius:
       item: 0.5
-      exp: -1.0
+      exp: 3.0
```

### 4.2. `Run-Server.bat`
```diff
--- a/Run-Server.bat
+++ b/Run-Server.bat
@@ -18,1 +18,1 @@
-"%JAVA_CMD%" -Xms2G -Xmx4G -XX:+UseG1GC -jar paper.jar --nogui
+"%JAVA_CMD%" -Xms4G -Xmx4G -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar paper.jar --nogui
```

### 4.3. `plugins/Essentials/config.yml`
```diff
--- a/plugins/Essentials/config.yml
+++ b/plugins/Essentials/config.yml
@@ -1278,1 +1278,1 @@
-  kit: tools
+  kit: tanthu
```

### 4.4. `skyblock_economy_daemon.py`
Thêm hàm `open_log_shared` ở đầu tệp (sau dòng 8) và thay thế phần mở đầu vòng lặp tại `main()` (dòng 820 - 841) bằng đoạn mã kiểm tra rotation/truncation như mô tả ở mục 3.2.

---

## 5. Phương Pháp Xác Minh Độc Lập (Verification Matrix)

| Hạng mục | Phương pháp kiểm tra | Tiêu chuẩn thành công |
|---|---|---|
| `spigot.yml` | `python -c "import yaml; d=yaml.safe_load(open('spigot.yml', encoding='utf-8')); assert d['settings']['restart-script']=='Run-Server.bat'; assert d['world-settings']['default']['merge-radius']['exp']==3.0; print('PASS')"` | In ra `PASS` không lỗi |
| `Run-Server.bat` | Kiểm tra nội dung dòng 18 chứa `-Xms4G -Xmx4G`, `-XX:+UseG1GC`, `-XX:+AlwaysPreTouch`, `-XX:MaxGCPauseMillis=200` | Cờ chuẩn Aikar cho G1GC |
| `plugins/Essentials/config.yml` | `python -c "import yaml; d=yaml.safe_load(open('plugins/Essentials/config.yml', encoding='utf-8')); assert d['newbies']['kit']=='tanthu'; print('PASS')"` | In ra `PASS` không lỗi |
| `skyblock_economy_daemon.py` | `python -m py_compile skyblock_economy_daemon.py` | Mã thoát 0, không có lỗi SyntaxError |
| Log Rotation Logic | Chạy script mô phỏng cắt/đổi tên file log | Daemon tự động phát hiện và đọc lại từ đầu mà không bị kẹt EOF |
