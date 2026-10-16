# 📜 SIÊU PROMPT TOÀN DIỆN & BẢN THIẾT KẾ TRIỂN KHAI (MASTER BLUEPRINT)
## HỆ THỐNG SKYBLOCK MMORPG PAPER 1.21.4 - GRIND-TO-WIN 15 TIERS

---

### PHẦN I: MASTER PROMPT (SỬ DỤNG ĐỂ THỰC THI / CHUYỂN GIAO)

```markdown
# MASTER PROMPT: HOÀN THIỆN TOÀN DIỆN SERVER MINECRAFT SKYBLOCK MMORPG (PAPER 1.21.4)

## 1. MỤC TIÊU & TRIẾT LÝ HỆ THỐNG
- **Dự án**: Máy chủ Minecraft Skyblock RPG Paper 1.21.4 tại đường dẫn:
  `C:\Users\Administrator\.gemini\antigravity\scratch\Skyblock-Server`
- **Triết lý Gameplay cốt lõi**: **Grind-to-Win / Play-to-Earn (100% In-Game, Phi Thương Mại Hóa, Không Pay-to-Win)**.
  - Người chơi cày cuốc càng lâu, đầu tư thời gian và kỹ năng càng nhiều thì mở khóa các bộ trang bị VIP, Danh hiệu và Đặc quyền tối thượng.
  - Mọi vật phẩm cao cấp đều yêu cầu nỗ lực cày cuốc đa trụ cột, không thể bỏ tiền nạp thẻ để vượt cấp.

---

## 2. KIẾN TRÚC MÔ HÌNH THẾ GIỚI HYBRID & 6 THẾ GIỚI CHUYÊN BIỆT
Áp dụng **Mô Hình Kết Hợp (Hybrid Core & Portals)**:
1. **`world` (Spawn Hub Trung Tâm 1000x1000)**:
   - **Trung tâm**: Cây Thế Giới Yggdrasil thần thoại tỏa bóng xuống Quảng Trường Cổ Thần (Điểm xuất hiện người chơi, NPC Hướng Dẫn Viên, Bảng Xếp Hạng Top Đảo/Kỹ Năng).
   - **Phân khu Giao Thương & Thần Rèn (Trade & Blacksmith)**: Thiết kế pháo đài đá trung cổ, cờ xí rêu phong, lò rèn cổ xưa bốc khói rực lửa; gồm NPC Thần Rèn Cổ Đại (15 Tiers Evolution), Rương Crates (Common, Rare, Mythic), và dãy phố Chợ Dân Làng (ChestShop guide, đổi nông sản/quặng).
   - **Phân khu Thư Thái & Cổng Trời Liên Giới (Zen Sakura Portals)**: Kiến trúc Á Đông đền đài mái cong, vườn hoa anh đào rực rỡ, hồ cá Koi phát sáng và 5 Cổng Torii Thần Đạo (Portals) dẫn sang 5 thế giới chuyên biệt.
2. **`world_boss` (Vực Thẳm Đấu Trường Boss Cổ Đại)**:
   - Sảnh Chỉ Huy trung tâm kết nối 6 Đại Đấu Trường riêng biệt (Động Nhện, Vực Lửa, Hắc Ám, Hư Không, Sculk Cổ Đại, Thiên Cung Hủy Diệt).
3. **`world_farm` (Vườn Thượng Uyển Sakura & Hầm Ngục Quái)**:
   - Tầng trên: Ruộng bậc thang công cộng trồng lúa, cà rốt, khoai tây cho tân thủ cày AuraSkills Farming.
   - Tầng dưới: Hầm ngục công cộng 5 tầng quái (Zombie, Skeleton, Spider, Blaze...) có khe chém an toàn để cày Fighting/Defense và thu thập nguyên liệu.
4. **`world_cauca` (Biển Hồ Trên Mây - Celestial Oasis)**:
   - Quần đảo hồ sen phát sáng, bến cảng Cầu Nguyệt Cung, NPC Lão Ngư; khu vực chuyên dụng cày AuraSkills Fishing và săn thủy quái.
5. **`world_parkour` (Siêu Tháp Thử Thách Phong Lôi 50 Tầng)**:
   - Tháp bay từ Y=70 lên Y=230 với 5 trạm Checkpoint (mỗi 10 tầng), tích hợp cơ chế Slime, Breeze, gió lốc; rèn luyện AuraSkills Agility.
6. **`world_casino` (Cung Điện Hoàng Gia Las Vegas)**:
   - Khu giải trí tiêu tiền Vault: Sảnh Coinflip 50/50, Quầy Vé Số Jackpot Mega 6/45, Bàn Cờ Tỷ Phú 40x40.
7. **`IridiumSkyblock` (Cõi Đảo Cá Nhân)**:
   - Không gian sinh tồn tự do, nâng cấp quy mô đảo, lắp đặt Minion tự động hóa (Miner, Farmer, Slayer, Builder) và máy tạo quặng cá nhân.

---

## 3. LIÊN KẾT GAMEPLAY TIẾN TRÌNH: SKILLS ➔ BÙA TRIỆU HỒI ➔ BOSS ➔ 15 TIERS
Hệ thống tiến trình là một chuỗi mắt xích khép kín tuần hoàn (Gating Loop):

### 3.1. Cổng Kỹ Năng (AuraSkills Gate) & Bùa Triệu Hồi (Summon Totem)
Người chơi không thể đánh Boss cấp cao nếu chưa đủ trình độ rèn luyện. Mỗi Boss yêu cầu cấp kỹ năng tối thiểu và tiêu tốn một Bùa Triệu Hồi (chế tạo từ nông sản, quặng trên đảo và cá hiếm):
- **Boss 1 - Nữ Hoàng Nhện**: Yêu cầu Kỹ năng Chiến Đấu (Fighting) Lv.5 + **Bùa Nhện Độc** (Chế từ: 16 Mạng nhện + 32 Lúa mì vàng).
- **Boss 2 - Đao Phủ Địa Ngục**: Yêu cầu Fighting Lv.10 + **Bùa Hỏa Ngục** (Chế từ: 16 Que Blaze + 64 Quặng than).
- **Boss 3 - Chúa Tể Bóng Tối**: Yêu cầu Fighting Lv.20 + **Bùa Hắc Ám** (Chế từ: 32 Khối Sắt + 16 Mắt nhện lên men).
- **Boss 4 - Hoàng Tử Hư Không**: Yêu cầu Fighting Lv.30 + **Bùa Hư Không** (Chế từ: 16 Khối Kim Cương + 32 Ngọc Ender).
- **Boss 5 - Cổ Thần Vực Thẳm (Sculk Guardian)**: Yêu cầu Fighting Lv.40 + **Bùa Vực Thẳm** (Chế từ: 32 Khối Ngọc Lục Bảo + 1 Vảy Thần Biển Sâu từ world_cauca).
- **Boss 6 - Thần Diệt Thế Thiên Cung (Cosmic Overlord)**: Yêu cầu Fighting Lv.50 + **Bùa Thần Diệt Thế** (Chế từ: 8 Khối Netherite + 1 Tinh Thể Phong Lôi từ world_parkour + 1 Mảnh Linh Hồn từ world_farm).

### 3.2. Cây Tiến Hóa Vũ Khí & Giáp Trụ 15 Bậc (15 Tiers Evolution Tree)
- **Bậc 1 - 5 (Sơ Khai)**: Dùng **Mảnh Quặng Cổ Đại** (Prismarine Shard - rơi từ Boss 1 & Quặng đảo).
- **Bậc 6 - 9 (Thần Thoại)**: Dùng **Tinh Thể Cổ Đại** (Amethyst Shard - rơi từ Boss 2 & Minion T8+).
- **Bậc 10 - 12 (Hắc Ám Đột Phá)**: Bắt buộc dùng **Trái Tim Của Quỷ** (Fermented Spider Eye - rơi 100% từ Boss 3).
- **Bậc 13 - 14 (Hư Không)**: Bắt buộc dùng **Lõi Hư Không** (Echo Shard - rơi từ Boss 4 & 5).
- **Bậc 15 (Vĩnh Cửu Tối Thượng - VIP God Gear)**: Bắt buộc dùng **Tinh Hoa Vũ Trụ** (Nether Star - rơi từ Boss 6) + Bộ Catalysts độc quyền từ 4 cõi.

---

## 4. MẢNH GHÉP NGUYÊN LIỆU ĐỘC QUYỀN (EXCLUSIVE CATALYSTS) TỪ 4 KHU VỰC PHỤ
Để rèn các mốc trang bị VIP T12 - T15, người chơi bắt buộc phải trải nghiệm đầy đủ các hoạt động trong server:
1. **`world_cauca`**: Câu cá có tỷ lệ bắt được **Vảy Thần Biển Sâu (Ancient Sea Scale)** dùng để chế Bùa Boss 5 và cường hóa giáp phòng thủ.
2. **`world_parkour`**: Chinh phục Tầng 50 Tháp Phong Lôi nhận **Tinh Thể Phong Lôi (Storm Crystal)** dùng chế Bùa Boss 6 và khảm ngọc tốc độ/chí mạng.
3. **`world_farm`**: Săn quái tầng sâu trong hầm ngục thu thập **Mảnh Linh Hồn (Soul Fragment)** dùng rèn vũ khí hút máu.
4. **`world_casino`**: Tích lũy điểm cược hoặc trúng thưởng Vé Số / Cờ Tỷ Phú nhận **Vé Vàng Hoàng Gia (Royal Gold Ticket)** để quy đổi danh hiệu VIP hoặc phôi trang phục đặc quyền.

---

## 5. HỆ THỐNG KINH TẾ SONG TỆ (DUAL CURRENCY & NO PAY-TO-WIN)
1. **Tiền Mặt Vault (`$`)**:
   - Kiếm từ: Bán nông sản, quặng, cá tại NPC Shop, Minion tự động hóa, giao dịch ChestShop giữa người chơi.
   - Sử dụng: Nâng cấp đảo, mua hạt giống, trả phí di chuyển, cược Coinflip/Vé Số/Cờ Tỷ Phú, phí ép ngọc cơ bản.
2. **Điểm Tinh Anh (`Ancient Tokens / Điểm Cày Cuốc`)**:
   - Kiếm từ: Tiêu diệt Boss 1-6, hoàn thành chuỗi tầng Parkour, đạt mốc cấp độ AuraSkills, và mốc thời gian Playtime cày cuốc.
   - Sử dụng: Đổi Phôi Rèn VIP, Cánh Hiệu Ứng, Thú Cưỡi, Danh Hiệu Chat hiển thị và Mở Rương Thần Thoại (Mythic Crates). Tuyệt đối không bán bằng tiền nạp ngoài đời!

---

## 6. GIAO DIỆN & ĐIỀU HƯỚNG NGƯỜI CHƠI (NAVIGATION & UI)
1. **Menu GUI DeluxeMenus (`/menu`, `/warp`)**:
   - Giao diện trực quan phân chia 6 mục chính: [🏝 Đảo Cá Nhân] [⚔ Sảnh Boss 1-6] [🌾 Hầm Quái & Nông Trại] [🎣 Biển Hồ Câu Cá] [🏃 Tháp Parkour] [🎰 Cung Điện Casino].
   - Kiểm tra trực tiếp điều kiện Kỹ năng (AuraSkills) ngay trên icon trước khi cho phép dịch chuyển.
2. **5 Cổng Trời Vật Lý (Physical Torii Portals)**:
   - Xây dựng quanh hồ nước phong cách Zen Sakura tại Spawn Hub. Bước vào cổng có hiệu ứng âm thanh và hạt portal đưa đến thế giới tương ứng.
3. **Bảng Thông Tin Scoreboard (ScoreboardPL)**:
   - Hiển thị đầy đủ: Tên, Tiền Vault (`%vault_balance_int%`), Điểm Tinh Anh (`%player_points%`), Cấp Kỹ Năng (`%auraskills_power_level%`), Tên Đảo & Cấp Đảo, Trạng thái Ping/Online.

---

## 7. CẤU HÌNH BẢO VỆ & AN TOÀN HỆ THỐNG (WORLDGUARD & SERVER SETTINGS)
- `server.properties`: `spawn-protection=0` (để WorldGuard quản lý toàn quyền).
- WorldGuard 7 phân vùng chặt chẽ:
  - Hub trung tâm: `build: deny`, `pvp: deny`, `mob-spawning: deny`, `use: allow`, `interact: allow`.
  - Đấu trường Boss (`world_boss`): `build: deny`, `mob-spawning: allow`, `use: allow`, `interact: allow`.
  - Khu câu cá & Parkour: `build: deny`, `fall-damage: deny` (tại điểm tiếp đất), `pvp: deny`.
- Đảm bảo tương thích 100% cú pháp Minecraft 1.21.4 (Data Components, `item_modifier`, Tellraw JSON phong phú).
```

---

### PHẦN II: KẾ HOẠCH TRIỂN KHAI THEO GIAI ĐOẠN (EXECUTION BLUEPRINT)

#### Chi Tiết Các Hạng Mục Thực Thi:
1. **Giai Đoạn 1: Kiến trúc Hub `world` (3 phong cách hòa quyện)**:
   - Vùng lõi (Yggdrasil & Cổ Thần): Cây thế giới cổ thụ tỏa rễ sáng rực, đài phun nước phát sáng, điểm xuất hiện người chơi.
   - Vùng Tây/Bắc (Pháo đài Trung cổ): Khu phố giao thương thợ rèn, rương Crates, quầy ChestShop.
   - Vùng Đông/Nam (Zen Sakura): Hồ sen, vườn hoa anh đào nở rộ, 5 cổng Torii kết nối sang `world_boss`, `world_farm`, `world_cauca`, `world_parkour`, `world_casino`.
2. **Giai Đoạn 2: Logic Boss Gating & Bùa Triệu Hồi**:
   - Viết các hàm `.mcfunction` kiểm tra level AuraSkills của người chơi trước khi kích hoạt khối lệnh triệu hồi Boss.
   - Tạo công thức chế tạo Bùa Triệu Hồi (Boss Totems) tại Bàn Chế Tạo hoặc NPC Thuật Sĩ.
3. **Giai Đoạn 3: 4 Catalysts Độc Quyền**:
   - Thêm loot table câu cá tại `world_cauca` rơi `Vảy Thần Biển Sâu`.
   - Kết nối đĩa áp suất tầng 50 `world_parkour` trao `Tinh Thể Phong Lôi`.
   - Thiết lập loot rơi từ quái hầm ngục `world_farm` trao `Mảnh Linh Hồn`.
   - Bổ sung vật phẩm `Vé Vàng Hoàng Gia` vào hệ thống Casino của `skyblock_economy_daemon.py`.
4. **Giai Đoạn 4: Đồng bộ 120 Công Thức Rèn Tier 15**:
   - Cập nhật `build_evolution_system.py` để công thức T10 - T15 yêu cầu đúng các Catalysts trên.
5. **Giai Đoạn 5: UI & Song Tệ**:
   - Cập nhật DeluxeMenus cho menu `/warp` và `/menu` kiểm tra điều kiện cấp kỹ năng.
   - Tích hợp điểm Tinh Anh vào Scoreboard và NPC Đổi Thưởng VIP.
6. **Giai Đoạn 6: Nghiệm thu thực địa**:
   - Đăng nhập kiểm thử bằng tài khoản Non-OP, đi qua từng cổng, kiểm tra bấm nút, rèn đồ, câu cá, leo tháp, săn boss không phát sinh lỗi.
