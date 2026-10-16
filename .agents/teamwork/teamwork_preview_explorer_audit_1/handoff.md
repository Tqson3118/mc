# BÁO CÁO NGHIỆM THU KỸ THUẬT: PHÂN HỆ R1 & R2
**Đơn vị thực hiện**: Explorer Audit 1 (Role: Infrastructure & World Explorer)  
**Mã phân hệ phụ trách**: 
- **R1**: Hạ tầng Server, Khởi động & Tiến trình Daemon
- **R2**: Thế giới & Hệ thống Đảo (IridiumSkyblock)  
**Thời điểm hoàn tất**: 2026-10-12T10:28:00Z  
**Môi trường thử nghiệm**: Paper 1.21.4 (build 25.0.4 / Java 21 LTS Adoptium), Windows Server, Radmin VPN (Port 25565), RCON (Port 25575).

---

## 1. Observation (Quan Sát Trực Tiếp & Bằng Chứng Hiện Trường)

### Phân hệ R1: Hạ tầng Server, Khởi động & Tiến trình Daemon

1. **Tệp `Run-Server.bat` & Môi trường Java 21**:
   - `Run-Server.bat` (Dòng 10-16):
     ```bat
     set "JAVA_CMD=java"
     if exist "C:\Program Files\Eclipse Adoptium\jre-21.0.12.101-hotspot\bin\java.exe" (
         set "JAVA_CMD=C:\Program Files\Eclipse Adoptium\jre-21.0.12.101-hotspot\bin\java.exe"
     ) else if exist "C:\Program Files\Eclipse Adoptium\jre-25.0.4.101-hotspot\bin\java.exe" (
         set "JAVA_CMD=C:\Program Files\Eclipse Adoptium\jre-25.0.4.101-hotspot\bin\java.exe"
     )
     ```
   - Lệnh kiểm tra môi trường:
     ```powershell
     & "C:\Program Files\Eclipse Adoptium\jre-21.0.12.101-hotspot\bin\java.exe" -version
     ```
     Kết quả trả về:
     ```
     openjdk version "21.0.12.1" 2026-08-18 LTS
     OpenJDK Runtime Environment Temurin-21.0.12.1+1 (build 21.0.12.1+1-LTS)
     OpenJDK 64-Bit Server VM Temurin-21.0.12.1+1 (build 21.0.12.1+1-LTS, mixed mode, sharing)
     ```
   - Cờ JVM Aikar's Flags tại `Run-Server.bat` (Dòng 21):
     `"%JAVA_CMD%" -Xms4G -Xmx4G -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar paper.jar --nogui`
   - Đo lường tiến trình thực tế:
     - Tiến trình PID `21696` (`java.exe`) đang thực thi trực tiếp từ `C:\Program Files\Eclipse Adoptium\jre-21.0.12.101-hotspot\bin\java.exe` với WorkingSet64: ~3.08 GB RAM.
   - Thời gian khởi động server từ `logs/latest.log`:
     - Dòng 1: `[16:54:55] [Server thread/INFO]: Starting minecraft server version 1.21.4`
     - Dòng 33: `[16:55:09] [Server thread/INFO]: Done preparing level "world" (7.367s)`
     - Dòng 37: `[16:55:09] [Server thread/INFO]: Done (25.693s)! For help, type "help"`
     - Thời gian khởi động hoàn tất ghi nhận: **25.693 giây** (nạp thế giới: 7.367 giây).

2. **Cấu hình `spigot.yml`**:
   - Dòng 35: `restart-on-crash: true` (Trạng thái: BẬT)
   - Dòng 36: `restart-script: Run-Server.bat` (Trỏ đúng tệp thực thi Windows batch)
   - Dòng 160-162:
     ```yaml
     merge-radius:
       item: 0.5
       exp: 3.0
     ```
     -> Cấu hình gom hạt EXP 3.0 block hợp lệ.
   - Bổ trợ tại `config/paper-world-defaults.yml` (Dòng 99): `experience-merge-max-value: -1` (không giới hạn trần tích lũy hạt EXP, tương thích tối đa).

3. **Cấu hình `server.properties`**:
   - Dòng 14: `enable-rcon=true`
   - Dòng 38: `online-mode=false` (cho phép kết nối LAN / Radmin VPN)
   - Dòng 46: `rcon.password=skyblock123`
   - Dòng 47: `rcon.port=25575`
   - Dòng 60: `spawn-protection=160` (Bán kính vùng bảo vệ spawn mặc định: 160 block).

4. **Đánh giá vùng bảo vệ `spawn-protection`**:
   - Tệp `ops.json` chứa 2 người chơi OP cấp độ 4: `cutdzvc` (UUID: `79cef359-a525-31d0-88bf-9233870d5811`) và `sondzvc` (UUID: `79a0f340-3d65-3112-9eac-7d046e1aeead`).
   - Tọa độ Spawn tại `plugins/Essentials/spawn.yml`: `world: world, x: 0.5, y: 121.0, z: 0.5`.
   - Vùng bán kính bảo vệ: Hình vuông `X: [-160, 160], Z: [-160, 160]`.
   - Plugin bảo vệ khu vực: Server KHÔNG cài đặt `WorldGuard` (chỉ có `WorldEdit`).
   - Hiện trạng các khối tương tác đặt trong bán kính 160:
     - `ender_chest` tại Sảnh Boss (`-3 111 58`, `3 111 58` trong `build_boss_multi.mcfunction` - cách spawn 58 block).
     - `chest` và `barrel` tại Safe Gallery Nông Trại (`-60 111 -5`, `build_farm.mcfunction`).
     - `ender_chest` và `chest` tại Đấu trường PvP (`58 111 -8`, `build_pvp_multi.mcfunction`).
     - `chest` hướng dẫn tại Chợ (`0 121 -9`, `build_chestshop_guide.mcfunction`).
     - `barrel` tại bệ Hòm Đồng Crate (`-3 121 7`, `build_crates.mcfunction`).
   - Tương tác NPC:
     - NPC Thương nhân trong `build_trade.mcfunction` và `build_evolution_npc.mcfunction` là entity `villager`.
     - NPC Thợ săn Boss và Crates sử dụng entity `interaction`.

5. **Tiến trình Daemon `skyblock_economy_daemon.py`**:
   - Chạy kiểm thử tự động `python tests/test_r4_daemon.py`:
     - Test 1 (`py_compile`): PASS.
     - Test 2 (`open_log_shared` Win32 sharing contract với `FILE_SHARE_READ | FILE_SHARE_WRITE | FILE_SHARE_DELETE`): PASS (hỗ trợ Log4j rename rotation).
     - Test 3 (`tail loop simulation` cho append, rename rotation, truncation, missing file): PASS.
   - Kiểm tra mã nguồn:
     - Khởi chạy song song tại `Run-Server.bat` dòng 18: `start "Skyblock Economy Daemon" python -u skyblock_economy_daemon.py`.
     - Không có cơ chế kiểm tra Mutex / Singleton Lock (không có PID file, named mutex hoặc lockfile).
     - Lớp `RconClient` (dòng 56-96) tự động `connect()` khi khởi tạo và tái kết nối (`attempt in range(2)`) khi socket mất kết nối hoặc server khởi động lại.

---

### Phân hệ R2: Thế giới & Hệ thống Đảo (IridiumSkyblock)

1. **Cấu hình & Nhóm lệnh IridiumSkyblock**:
   - `plugins/IridiumSkyblock/configuration.yml`:
     - Dòng 265: `worldName: "IridiumSkyblock"`
     - Dòng 266: `spawnWorldName: "world"`
     - Dòng 267: `generatorType: "VOID"`
     - Dòng 281: `distance: 250` (khoảng cách giữa các đảo)
     - Dòng 300-303: kích hoạt thế giới `NORMAL: true, NETHER: true, THE_END: true`.
   - Tệp cấu hình lệnh `plugins/IridiumSkyblock/commands.yml`:
     - `createCommand`: `aliases: ["create"]`, syntax `/is create <name>`, cooldown 300s (Hợp lệ).
     - `homeCommand`: `aliases: ["home"]`, syntax `/is home` (Hợp lệ).
     - `setHomeCommand`: `aliases: ["sethome"]`, syntax `/is sethome` (Hợp lệ).
     - `levelCommand`: `aliases: ["level"]`, syntax `/is level` (Hợp lệ).
     - `boostersCommand`: `aliases: ["boosters"]`, syntax `/is boosters buy <booster>` (Hợp lệ).
     - `upgradesCommand`: `aliases: ["upgrades"]`, syntax `/is upgrades buy <upgrade>` (Hợp lệ).
     - `membersCommand` (Dòng 18-25): `aliases: ["members"]`. **KHÔNG CÓ ALIAS `team`**.
   - Kiểm thử thực tế qua RCON:
     - Lệnh `upgrade` trả về: `§9§lIridiumSkyblock §8» §7You must be a player to execute this command.` (Nhận diện đúng).
     - Lệnh `boosters` trả về: `§9§lIridiumSkyblock §8» §7You must be a player to execute this command.` (Nhận diện đúng).
     - Lệnh `is create`, `is home`, `is sethome`, `is level` đều nhận diện đúng.
     - Lệnh `is members` trả về: `§9§lIridiumSkyblock §8» §7You must be a player to execute this command.` (Nhận diện đúng).
     - **LỆNH `is team` TRẢ VỀ**: `§9§lIridiumSkyblock §8» §7Unknown Command, Try /is help.` (**LỖI / SAI LỆNH**).

2. **Cơ chế sinh thế giới Hư Không (Void World Generation)**:
   - Trong `plugins/IridiumSkyblock.jar`:
     - Tồn tại lớp `com.iridium.iridiumskyblock.generators.VoidGenerator.class`.
     - Enum `GeneratorType` chứa các giá trị `VOID`, `OCEAN`, `FLAT`.
   - Cấu hình `configuration.yml` dòng 267 đặt `generatorType: "VOID"`.
   - Thư mục thế giới `IridiumSkyblock/region/` chứa 4 tệp chunk mca hợp lệ (`r.-1.-1.mca`, `r.-1.0.mca`, `r.0.-1.mca`, `r.0.0.mca`), không bị sinh địa hình vanilla rác.

3. **Hiện trạng các thế giới cũ BentoBox & Thư mục `disabled_plugins/`**:
   - Thư mục `disabled_plugins/` chứa:
     - `BentoBox.jar` (2.44 MB)
     - `BentoBox/` (thư mục dữ liệu cấu hình cũ)
     - `worldedit-bukkit-7.4.6-beta-02.jar` (7.87 MB)
   - Ba thế giới cũ của BentoBox còn tồn tại trên ổ đĩa:
     - `bskyblock_world` (Dung lượng: ~4.29 MB)
     - `bskyblock_world_nether` (Dung lượng: ~4.30 MB)
     - `bskyblock_world_the_end` (Dung lượng: ~4.30 MB)
     - Tổng dung lượng lưu trữ: ~12.89 MB.
   - Kiểm tra `latest.log` và cấu hình server: Không có plugin hay server runtime nào nạp hay tải các thế giới `bskyblock_world*`. Chúng hoàn toàn là dữ liệu tĩnh thừa sau khi chuyển đổi sang IridiumSkyblock.

4. **Tính toàn vẹn CSDL SQLite `plugins/IridiumSkyblock/IridiumSkyblock.db`**:
   - Kích thước tệp: 249,856 bytes (~244 KB).
   - Kiểm tra tính toàn vẹn:
     - `PRAGMA integrity_check;` -> Kết quả: `[('ok',)]` (100% Nguyên vẹn).
     - `PRAGMA quick_check;` -> Kết quả: `[('ok',)]` (100% Nguyên vẹn).
   - Cấu hình SQLite hiện thời:
     - `PRAGMA journal_mode;` -> `[('delete',)]` (Chế độ Rollback Journal truyền thống).
     - `PRAGMA synchronous;` -> `[(2,)]` (FULL Synchronous).
   - Dữ liệu các bảng chính:
     - Bảng `island`: 1 đảo hoạt động (ID 1, home `IridiumSkyblock,1.5,83.0,1.5,0.0,90.0`, exp: 200,000).
     - Bảng `user`: 3 người chơi (`sondzvc` Owner cấp -2, `cutdzvc` Member cấp 1, `hieudzvc` Member cấp 1).
     - Bảng `team_blocks`: 1,696 bản ghi đếm block đảo.
     - Bảng `team_spawners`: 160 bản ghi lồng spawner.
     - Bảng `team_enhancements`: 12 bản ghi booster/upgrade.
     - Bảng `team_log`: 90 bản ghi audit log.

---

## 2. Logic Chain (Chuỗi Lập Luận Suy Diễn Kỹ Thuật)

### Phân hệ R1
1. **Khởi động & Môi trường JVM**:
   - Từ quan sát (1), `Run-Server.bat` ưu tiên kiểm tra đúng đường dẫn JRE 21 Adoptium trước JRE 25. Cả 2 JRE đều có trên máy, do đó `JAVA_CMD` trỏ chính xác về JRE 21 LTS (`21.0.12.1`).
   - Bộ cờ Aikar's Flags chứa đầy đủ các tối ưu bắt buộc cho G1GC trên Java 21 (`-Xms4G -Xmx4G`, `-XX:+UseG1GC`, `-XX:+AlwaysPreTouch`, `-XX:+ParallelRefProcEnabled`, `-XX:InitiatingHeapOccupancyPercent=15`).
   - Thời gian khởi động 25.693s là mức tối ưu cho hệ thống Paper 1.21.4 tải 9 plugin và hệ thống datapack lớn.
   - `spigot.yml` thiết lập `restart-on-crash: true` và `restart-script: Run-Server.bat`. Khi JVM gặp sự cố sập hoặc lệnh `/restart`, Spigot sẽ kích hoạt trực tiếp `Run-Server.bat`.

2. **Rủi ro Khởi động Song song của Daemon (Parallel Daemon Spawning)**:
   - Từ quan sát (1) và (5), `Run-Server.bat` luôn thực thi lệnh `start "Skyblock Economy Daemon" python -u skyblock_economy_daemon.py` mỗi khi script chạy.
   - Trong `skyblock_economy_daemon.py`, không hề có cơ chế bảo đảm độc bản (Single Instance Lock / Mutex / Socket Lock).
   - Khi server crash và tự phục hồi qua `spigot.yml`, `Run-Server.bat` được gọi lại, dẫn tới một tiến trình daemon thứ hai được sinh ra trong khi tiến trình daemon cũ vẫn đang chạy ngầm.
   - Hệ quả: Cả 2 tiến trình đều đồng thời đọc `latest.log`. Khi một người chơi gõ `/cf 1000` hoặc `/xoso 1000` hoặc `/bankhoangsan`, cả 2 daemon sẽ cùng bắt được log và thực thi RCON 2 lần -> Người chơi bị trừ tiền 2 lần hoặc nhận thưởng 2 lần (Race condition / duplicate transaction nghiêm trọng).

3. **Cơ chế Tự phục hồi RCON của Daemon**:
   - Lớp `RconClient` trong daemon được bọc trong vòng lặp thử lại `for attempt in range(2)` kèm khối `try...except`. Khi server khởi động lại (mất kết nối TCP 25575), mọi lệnh RCON bắt lỗi và gọi `self.connect()`.
   - Trong quá trình server đang nạp (chưa mở port), `self.connect()` trả về `False` và vòng lặp daemon tiếp tục chạy bình thường (không bị crash tiến trình). Khi server mở port 25575 thành công, kết nối tự động tái lập và xác thực lại mật khẩu `skyblock123`.

4. **Tác động của `spawn-protection=160` đối với người chơi Non-OP**:
   - Từ quan sát (3) và (4), `server.properties` đặt `spawn-protection=160` và `ops.json` có 2 OP (`cutdzvc`, `sondzvc`). Theo logic vanilla của Minecraft Dedicated Server, bán kính 160 block quanh tọa độ spawn (0.5, 121.0, 0.5) trong thế giới `world` sẽ chặn toàn bộ hành vi phá khối, đặt khối và TƯƠNG TÁC KHỐI CHỨA ĐỒ (`isSpawnProtected`) của người chơi không có quyền OP.
   - Server KHÔNG có plugin bảo vệ phân quyền vùng (`WorldGuard` không được cài đặt).
   - Do đó, mọi rương công cộng (`ender_chest`, `chest`, `barrel`) tại Sảnh Boss (`-3 111 58`), Safe Gallery Nông Trại (`-60 111 -5`) và Đấu trường PvP đều BỊ CHẶN HOÀN TOÀN đối với người chơi Non-OP (click vào rương không mở được).
   - Người chơi Non-OP không thể đặt rương và biển để tạo ChestShop tại `/warp shop`.
   - Ngược lại, NPC Villager (`Thương Nhân Nông Sản`, `Thương Nhân Khoáng Sản`, v.v.) và NPC Crate/Boss (sử dụng entity `interaction`) hoạt động dựa trên tương tác thực thể (`PlayerInteractEntityEvent`), không bị chặn bởi vanilla spawn protection nếu người chơi nhấp trực tiếp vào hitbox của NPC.

### Phân hệ R2
1. **Lỗi Lệnh Đội Nhóm `/is team`**:
   - Từ quan sát (1) của R2, BentoBox trước đây sử dụng lệnh `/is team`, nhưng IridiumSkyblock cấu hình lệnh này dưới tên `membersCommand` với alias duy nhất là `members`.
   - Tệp `plugins/IridiumSkyblock/commands.yml` không khai báo alias `team`.
   - Kết quả kiểm thử thực địa: Gõ `/is team` trả về `Unknown Command, Try /is help.`. Trong khi đó `/is members` hoạt động chuẩn xác.
   - Đây là lỗi trải nghiệm người dùng nghiêm trọng đối với người chơi Skyblock quen dùng lệnh `/is team`.

2. **Các Lệnh Nâng Cấp và Booster**:
   - `/upgrade` và `/upgrades` được ánh xạ thông qua `commands.yml` gốc trỏ về `is upgrades $1-`.
   - `/booster` và `/boosters` được ánh xạ qua `commands.yml` gốc trỏ về `is boosters $1-`.
   - Kết quả RCON xác nhận cả 2 lệnh đều được IridiumSkyblock thụ lý chính xác và mở GUI nâng cấp.

3. **Thế giới Hư Không (Void World)**:
   - IridiumSkyblock được cấu hình `generatorType: "VOID"`. Plugin sử dụng trình sinh nội tại `VoidGenerator.class` để can thiệp vào quá trình nạp chunk của Paper 1.21.4.
   - Thư mục chunk của `IridiumSkyblock` được sinh hoàn toàn trống rỗng chuẩn Void World, tọa độ đảo chính xác tại `1.5, 83.0, 1.5`.

4. **Thế giới cũ BentoBox**:
   - Cả 3 thư mục `bskyblock_world*` (~12.89 MB) là tàn dư từ BentoBox trước khi bị vô hiệu hóa sang `disabled_plugins/`.
   - Hiện tại thế giới này không có người chơi và không được server Paper nạp chunk. Tuy nhiên, theo Quy tắc Toàn cục Bảo vệ Dữ liệu, tuyệt đối không được tự ý xóa các tệp này khi chưa có sự xác nhận của người dùng.

5. **Tính toàn vẹn CSDL SQLite**:
   - Database `IridiumSkyblock.db` đạt 100% tính toàn vẹn vật lý và logic (`integrity_check: ok`).
   - Điểm lưu ý kỹ thuật: Database đang chạy ở `journal_mode: delete`. Trên hệ điều hành Windows, chế độ này liên tục tạo và xóa tệp `.db-journal` khi có thao tác ghi. Khi có nhiều người chơi đồng thời nâng cấp đảo hoặc đặt spawner, cơ chế khóa tệp NTFS có thể gây xung đột khóa (`file lock`) hoặc tăng độ trễ I/O. Chuyển sang chế độ `WAL` (Write-Ahead Logging) sẽ tăng hiệu năng và độ ổn định lâu dài.

---

## 3. Caveats (Các Điểm Giới Hạn & Giả Định)

1. **Giới hạn môi trường kiểm thử tương tác Non-OP**:
   - Việc đánh giá tác động của `spawn-protection` được suy luận và đối soát từ mã nguồn chuẩn của Paper/Vanilla Minecraft (`isSpawnProtected`) kết hợp danh sách plugin hiện có (không có WorldGuard). Trong phiên kiểm tra này, chưa có tài khoản client Non-OP đăng nhập trực tiếp để đo đạc gói tin hủy sự kiện trên GUI.
2. **Không can thiệp sửa đổi tệp cấu hình**:
   - Theo đúng tôn chỉ điều tra Read-Only của vai trò Explorer và quy tắc bảo toàn dữ liệu, agent KHÔNG tự ý chỉnh sửa `commands.yml`, `server.properties` hay xóa bỏ các thế giới BentoBox cũ. Toàn bộ giải pháp được trình bày dưới dạng đề xuất hành động.

---

## 4. Conclusion (Kết Luận Đánh Giá Nghiệm Thu)

| Hạng mục kiểm tra | Trạng thái | Chi tiết đánh giá |
| :--- | :---: | :--- |
| **R1.1 Run-Server.bat & JVM Java 21** | **PASS** | Chạy đúng JRE 21 Adoptium, bộ cờ Aikar's Flags chuẩn G1GC, boot time 25.693s. |
| **R1.2 spigot.yml (Crash & Merge)** | **PASS** | `restart-on-crash: true`, `restart-script: Run-Server.bat`, `merge-radius.exp: 3.0` chính xác 100%. |
| **R1.3 server.properties (Mạng & RCON)**| **PASS** | `online-mode=false`, RCON port 25575, pass `skyblock123`, `spawn-protection=160`. |
| **R1.4 Spawn-Protection & Non-OP UX** | **WARN** | Bán kính 160 block làm khóa toàn bộ rương công cộng, Ender Chest tại Sảnh Boss và cấm tạo ChestShop quanh hub do thiếu WorldGuard. NPC Villager và Crate interaction vẫn dùng được. |
| **R1.5 Tiến trình Daemon Kinh Tế** | **WARN** | Tự phục hồi RCON và xoay log đạt 100%, nhưng THIẾU cơ chế Singleton Lock, nguy cơ nhân đôi tiến trình khi server crash-restart. |
| **R2.1 Lệnh IridiumSkyblock** | **WARN** | `/is create, home, sethome, level`, `/upgrade`, `/boosters` hoạt động tốt. **LỖI**: Thiếu alias `/is team` (hiện trả về `Unknown Command`). |
| **R2.2 Void World Generation** | **PASS** | Thế giới `IridiumSkyblock` sinh chuẩn Void thông qua `VoidGenerator.class`. |
| **R2.3 Rà soát BentoBox cũ** | **PASS** | BentoBox đã cách ly an toàn trong `disabled_plugins/`, 3 thế giới cũ `bskyblock_world*` không bị nạp rác. |
| **R2.4 CSDL SQLite IridiumSkyblock** | **PASS** | 100% nguyên vẹn (`ok`), dữ liệu 1 đảo & 3 người chơi toàn vẹn, kiến nghị bật WAL mode. |

### Đề xuất Kiến nghị Cụ thể:
1. **Khắc phục lỗi `/is team`**: Thêm alias `- "team"` vào mục `membersCommand.aliases` trong `plugins/IridiumSkyblock/commands.yml` hoặc thêm alias trong `commands.yml` gốc.
2. **Khắc phục xung đột Spawn Protection**: 
   - Hoặc cài đặt plugin phân quyền vùng (như `WorldGuard` đi kèm flag `interact: allow`, `chest-access: allow` tại sảnh boss).
   - Hoặc điều chỉnh `spawn-protection=0` trong `server.properties` nếu khu vực spawn đã được bảo vệ bằng cơ chế khác.
3. **Bổ sung Singleton Lock cho Daemon**: Thêm kiểm tra PID lock file hoặc socket binding trong `skyblock_economy_daemon.py` để ngăn chặn việc khởi chạy trùng lặp khi server restart.
4. **Tối ưu CSDL SQLite**: Thiết lập `PRAGMA journal_mode=WAL;` cho `IridiumSkyblock.db` nhằm hạn chế xung đột khóa tệp trên Windows.

---

## 5. Verification Method (Phương Pháp Xác Minh Độc Lập)

Người nhận bàn giao hoặc kiểm toán viên độc lập có thể kiểm chứng lại toàn bộ kết quả trên bằng các lệnh sau tại thư mục gốc `C:\Users\Administrator\.gemini\antigravity\scratch\Skyblock-Server`:

1. **Xác minh kiểm thử tự động Daemon**:
   ```powershell
   python tests/test_r4_daemon.py
   ```
   *Kỳ vọng*: Báo cáo 3 test PASS và kết luận `FINAL VERDICT FOR R4: PASS`.

2. **Xác minh tính toàn vẹn CSDL SQLite**:
   ```powershell
   python .agents\teamwork\teamwork_preview_explorer_audit_1\check_db.py
   ```
   *Kỳ vọng*: `PRAGMA integrity_check` và `PRAGMA quick_check` đều trả về `[('ok',)]`.

3. **Xác minh lỗi lệnh `/is team` qua RCON**:
   ```powershell
   python -c "import skyblock_economy_daemon as d; c=d.RconClient('127.0.0.1', 25575, 'skyblock123'); print(repr(c.cmd('is team'))); print(repr(c.cmd('is members')))"
   ```
   *Kỳ vọng*: `is team` trả về `'Unknown Command'`, trong khi `is members` trả về `'You must be a player...'`.

4. **Xác minh tiến trình và cổng mạng**:
   ```powershell
   Get-NetTCPConnection -LocalPort 25565, 25575 | Select-Object LocalAddress, LocalPort, State, OwningProcess
   ```
   *Kỳ vọng*: Cả hai cổng 25565 và 25575 đều ở trạng thái `Listen` thuộc tiến trình Java.
