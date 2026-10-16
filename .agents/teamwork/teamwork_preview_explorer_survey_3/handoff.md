# Handoff Report: Khảo Sát Yêu Cầu R3 & R4

## 1. Observation
- **`spigot.yml`**:
  - Dòng 35-36:
    ```yaml
    settings:
      restart-on-crash: true
      restart-script: ./start.sh
    ```
  - Dòng 160-162:
    ```yaml
        merge-radius:
          item: 0.5
          exp: -1.0
    ```
  - Lệnh kiểm tra YAML: `python -c "import yaml; yaml.safe_load(open('spigot.yml', encoding='utf-8'))"` -> Thành công (VALID).
- **`Run-Server.bat`**:
  - Dòng 18:
    ```bat
    "%JAVA_CMD%" -Xms2G -Xmx4G -XX:+UseG1GC -jar paper.jar --nogui
    ```
  - JVM có sẵn: `C:\Program Files\Eclipse Adoptium\jre-21.0.12.101-hotspot\bin\java.exe` (Temurin 21.0.12.1+1 LTS).
  - Lệnh kiểm tra chạy thử cờ Aikar trên Java 21:
    `& "C:\Program Files\Eclipse Adoptium\jre-21.0.12.101-hotspot\bin\java.exe" -Xms4G -Xmx4G -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 "-Dusing.aikars.flags=https://mcflags.emc.gs" "-Daikars.new.flags=true" -version`
    -> Mã thoát 0, hoàn toàn tương thích.
- **`plugins/Essentials/config.yml`**:
  - Dòng 1278:
    ```yaml
      kit: tools
    ```
- **`plugins/Essentials/kits.yml`**:
  - Dòng 19-39: Định nghĩa đầy đủ `kits.tanthu` với 17 items/lệnh, bao gồm vũ khí sắt cường hóa, giáp da, thức ăn, vật phẩm khởi tạo Skyblock, ngọc lục bảo và lệnh tặng tiền Vault `/eco give {USERNAME} 1000`.
- **`skyblock_economy_daemon.py`**:
  - Dòng 8: `LOG_PATH = os.path.join(os.path.dirname(__file__), 'logs', 'latest.log')`
  - Dòng 821-840: Vòng lặp `main()` chỉ mở `latest.log` một lần duy nhất lúc khởi động bằng `open(LOG_PATH, 'r', ...)`.
  - Kiểm tra thực nghiệm trên Windows: Mở file bằng `open()` mặc định gây lỗi `WinError 32: The process cannot access the file because it is being used by another process` khi có tiến trình khác cố gắng xoay vòng / đổi tên log.
  - Lệnh `python -m py_compile skyblock_economy_daemon.py` -> Mã thoát 0.
  - Đã chạy unit test mô phỏng mở file chia sẻ với `FILE_SHARE_DELETE`, phát hiện thay đổi `st_ino` khi rotate và `st_size < tell()` khi truncate -> Thành công 100%.

## 2. Logic Chain
1. **Từ Observation về `spigot.yml:36`**: Trên hệ điều hành Windows, hệ thống không có file `./start.sh` và hàm `ProcessBuilder` của Java không thể thực thi file shell Linux -> Dẫn đến lỗi `CreateProcess error=2` làm sập server vĩnh viễn khi crash hoặc restart -> **Cần đổi thành `Run-Server.bat`**.
2. **Từ Observation về `spigot.yml:162`**: Giá trị `-1.0` vô hiệu hóa hoàn toàn cơ chế gộp EXP orb -> Các máy farm quái sinh ra hàng nghìn orb độc lập, mỗi orb là một entity chạy tick CPU và phát packet -> Gây sụt giảm TPS trầm trọng -> **Cần đổi thành `3.0` để gộp các orb trong bán kính 3 block**.
3. **Từ Observation về `Run-Server.bat:18`**: Chênh lệch bộ nhớ `-Xms2G` và `-Xmx4G` gây giật lag khi mở rộng heap; thiếu các cờ tinh chỉnh G1GC khiến server dễ bị pause dài STW khi thu gom rác -> **Cần nâng cấp lên đầy đủ bộ cờ Aikar's Flags đã kiểm chứng thành công trên Java 21**.
4. **Từ Observation về `plugins/Essentials/config.yml:1278` và `kits.yml:19-39`**: Dòng 1278 đang phát kit `tools` thay vì `tanthu`. Trong khi đó kit `tanthu` đã được xây dựng hoàn chỉnh và cân bằng trong `kits.yml` -> **Cần đổi `newbies.kit` thành `tanthu`**.
5. **Từ Observation về `skyblock_economy_daemon.py:821-840`**: Daemon giữ handle cũ mà không kiểm tra kích thước hay định danh file -> Khi Log4j đổi tên `latest.log` hoặc làm trống file, daemon đọc rỗng mãi mãi và bỏ sót mọi lệnh kinh tế của người chơi. Đồng thời chế độ mở file mặc định khóa file cấm Log4j rotate -> **Cần bổ sung hàm mở file chia sẻ `open_log_shared` và logic reset con trỏ đọc khi phát hiện `st_ino` thay đổi hoặc `st_size < curr_pos`**.

## 3. Caveats
- Việc mở file bằng cờ `FILE_SHARE_DELETE` sử dụng `ctypes` và `msvcrt` là giải pháp tối ưu riêng cho Windows. Khi chạy trên môi trường POSIX (Linux/macOS), hàm `open_log_shared` cần fallback về `open()` tiêu chuẩn của Python.
- Bộ cờ Aikar cấp phát cố định 4GB RAM (`-Xms4G -Xmx4G`). Máy chủ cần có tối thiểu 6GB RAM vật lý khả dụng để tránh OOM hệ điều hành.

## 4. Conclusion
- Đã hoàn tất khảo sát 100% mục tiêu của R3 và R4.
- Mọi nguyên nhân gốc rễ (Root Cause) đã được xác định kèm số dòng chính xác và giải pháp cụ thể.
- Đã sẵn sàng cho giai đoạn chỉnh sửa (Implementation) của các agent tiếp theo mà không gặp bất kỳ vướng mắc nào.

## 5. Verification Method
1. **Kiểm tra `spigot.yml`**:
   ```bash
   python -c "import yaml; d=yaml.safe_load(open('spigot.yml', encoding='utf-8')); assert d['settings']['restart-script']=='Run-Server.bat'; assert d['world-settings']['default']['merge-radius']['exp']==3.0; print('PASS')"
   ```
2. **Kiểm tra `Run-Server.bat`**:
   Xem dòng 18 chứa đầy đủ các cờ Aikar: `-Xms4G -Xmx4G -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 ...`
3. **Kiểm tra `plugins/Essentials/config.yml`**:
   ```bash
   python -c "import yaml; d=yaml.safe_load(open('plugins/Essentials/config.yml', encoding='utf-8')); assert d['newbies']['kit']=='tanthu'; print('PASS')"
   ```
4. **Kiểm tra `skyblock_economy_daemon.py`**:
   ```bash
   python -m py_compile skyblock_economy_daemon.py
   ```
   Chạy thử kịch bản mô phỏng xoay log để kiểm tra khả năng bắt lệnh liên tục.
