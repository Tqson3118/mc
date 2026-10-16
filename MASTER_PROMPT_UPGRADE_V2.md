# 🚀 MASTER PROMPT NÂNG CẤP GAMEPLAY V2 — SKYBLOCK SERVER (PAPER 1.21.4)

> **Dùng prompt này cho phiên làm việc mới**: Copy toàn bộ nội dung dưới đây (từ dòng "BẮT ĐẦU PROMPT") vào chat để AI thực thi.
> **Ngày chốt spec**: 16/10/2026 — dựa trên phỏng vấn thiết kế 8 vòng với chủ server.

---

# BẮT ĐẦU PROMPT

## 1. NHIỆM VỤ & BỐI CẢNH

Nâng cấp gameplay cho máy chủ Minecraft **Skyblock MMORPG Paper 1.21.4** tại:
`C:\Users\Administrator\.gemini\antigravity\scratch\Skyblock-Server`

**Hiện trạng server (đã audit & ổn định, APPROVED FOR RELEASE):**
- 6 thế giới chuyên biệt: `world` (spawn hub), `world_boss`, `world_farm`, `world_cauca` (câu cá), `world_parkour`, `world_casino` + `IridiumSkyblock` (đảo cá nhân).
- Datapack `skyblock_spawn` tại `world/datapacks/skyblock_spawn/` (functions: boss, crates, casino, parkour, trade, title, tick loop...).
- Daemon Python qua RCON: `skyblock_economy_daemon.py` (kinh tế, casino, title), `skyblock_minions.py` (minion 4 loại T1-T12, SQLite `minions.db`, offline catch-up, quick-sell, fuel).
- Plugins: IridiumSkyblock, AuraSkills, DeluxeMenus (`plugins/DeluxeMenus/gui_menus/`), ChestShop, Essentials, ScoreboardPL, PlaceholderAPI, Vault, Multiverse-Core, WorldEdit, WorldGuard, ViaVersion.
- Tiến trình 15 Tiers hoàn chỉnh: Skills → Bùa Triệu Hồi → Boss 1-6 → 120 công thức rèn.
- Kiểm thử hiện có: `verify_syntax.py`, `tests/` (Python harness), audit trong `MASTER_ACCEPTANCE_AUDIT.md`.

**Triết lý bắt buộc giữ nguyên:** Grind-to-Win / Play-to-Earn, 100% in-game, **KHÔNG pay-to-win**. Điểm Tinh Anh (Ancient Tokens) là tiền tệ grind.

---

## 2. RÀNG BUỘC BẮT BUỘC (BẤT KHẢ XÂM PHẠM)

1. **KHÔNG wipe dữ liệu**: giữ nguyên `minions.db`, `IridiumSkyblock.db`, `economy*`, vault, dữ liệu người chơi. Mọi schema mới phải migration tương thích ngược (ALTER TABLE / bảng mới, không DROP).
2. **Backup trước khi sửa**: copy file bị ảnh hưởng vào `backups/` kèm timestamp trước mỗi lần thay đổi lớn.
3. **Paper 1.21.4 + Java 21** — dùng cú pháp Data Components mới (`custom_data`, `custom_name`, `item_model`), không dùng cú pháp cũ đã xóa.
4. **Tuân thủ các fix bảo mật đã audit**: không tạo lệnh chạy RCON OP không kiểm tra quyền; không nhúng tỷ lệ may rủi ẩn cho tên riêng; tôn trọng Singleton Lock của daemon; lọc `[!custom_data,!custom_name]` khi bán item.
5. **Text nội dung tiếng Việt**, dùng MiniMessage (Paper 1.21.4 hỗ trợ) cho format màu/hover/click. Thông báo lệnh phải đồng bộ 1 prefix chung.
6. **Tương thích hệ thống hiện có**: không phá 15 Tiers, không phá Boss 1-6, không phá checkpoints parkour/casino/crates đã nghiệm thu.
7. **Quy mô 5-15 người chơi** — ưu tiên trải nghiệm đẹp & vui; không cần tối ưu cực đoan nhưng entity minion phải có ngân sách hợp lý (khuyến nghị ≤ 12 minion hiển thị/đảo, cache NPC khi chủ đảo offline).
8. **Hybrid triển khai**: ưu tiên in-house (datapack + daemon Python RCON + DeluxeMenus). Được phép thêm plugin miễn phí từ Modrinth/SpigotMC khi giải pháp in-house bất khả thi (ví dụ: Citizens miễn phí cho NPC minion có skin/animation/click). Không dùng plugin trả phí, không dùng plugin có telemetry bắt buộc.

---

## 3. PHẠM VI — 3 GIAI ĐOẠN

### GIAI ĐOẠN 1: LỆNH / & GUI MỚI + NÂNG CẤP UX/UI LỆNH

**1.1. Nâng cấp `/menu` tổng** (`plugins/DeluxeMenus/gui_menus/menu.yml`):
- Thêm mục mới: [🐾 Pets] [👹 Boss 7-8] [🌍 World Boss] [🏪 Shop] [💰 Chợ Đấu Giá] bên cạnh 6 mục cũ.
- Icon hiển thị trực tiếp điều kiện mở khóa (ví dụ pet chưa unlock → icon barrier + lore "Cần X Điểm Tinh Anh").

**1.2. GUI Minion (click trực tiếp vào minion):**
- Daemon `skyblock_minions.py` phát hiện tương tác (theo mô hình `crate_interact` của datapack hoặc Citizens click listener).
- Menu gồm: `[Thu hoạch toàn bộ]` `[Nâng cấp bậc]` `[Tầm đào >]` `[Tốc độ >]` `[Kho chứa >]` `[Thay Tool]` `[Đổi Skin]` `[Bán tài nguyên trong kho]`.
- Toàn bộ mua/nâng cấp trừ **Điểm Tinh Anh** (không dùng tiền nạp).

**1.3. GUI Pets (`/pets`):**
- Bộ sưu tập dạng grid: pet đã sở hữu (màu sáng) / chưa sở hữu (xám + điều kiện unlock).
- Hover hiển thị buff chi tiết. Click trái = trang bị (theo sau), click phải = nâng cấp buff.
- Unlock & nâng cấp bằng Điểm Tinh Anh.

**1.4. GUI Shop (`/shop`):**
- Phân trang theo danh mục: Nông sản / Quặng & Khoáng sản / Hải sản / Nguyên liệu hiếm.
- Mua: chuột trái (x1), shift-click (x64). Bán: chuột phải (x1), shift-click (bán hết loại đó trong túi).
- Giá khớp với daemon hiện tại (1 nguồn sự thật duy nhất — giá định nghĩa trong daemon, GUI đọc qua placeholder hoặc config chung).

**1.5. Chợ đấu giá (`/chợ`, alias `/ah`):**
- Người chơi đăng bán item (chọn item từ tay/túi, đặt giá, thời hạn 48h).
- Duyệt chợ, lọc theo loại, mua bằng Vault. Thuế 5% (phá hủy, chống lạm phát).
- Hết hạn → trả về "Hộp thư" (`/chợ mail`) để nhận lại item.
- Lưu trong bảng SQLite mới `auction.db` (tách riêng, không đụng DB hiện có).
- Bảo mật: validate item (chặn item có `custom_data` hệ thống không được phép giao dịch như Bùa Triệu Hồi, Catalyst, Vé Vàng).

**1.6. Nâng cấp UX/UI toàn bộ lệnh server:**
- Chuẩn hóa prefix chung (ví dụ `⟨Skyblock⟩`), bảng phân tách, màu semantic (xanh = thành công, đỏ = lỗi, vàng = cảnh báo, xám = hướng dẫn).
- Mọi phản hồi lỗi thân thiện tiếng Việt + gợi ý cách sửa ("Sai cú pháp. Dùng: /chợ bán <giá>").
- Hover/click component: lệnh gợi ý click-to-run, item link hover hiển thị chỉ số.
- Tab-completion cho lệnh do DeluxeMenus quản lý; lệnh daemon giữ đơn giản + help rõ.
- Cập nhật `help.yml` khớp thực tế, xóa alias chết gây cảnh báo khởi động (theo audit DEF-11, giữ `messages.unknown-command: ""`).
- Âm thanh phản hồi (click thành công/lỗi) + action bar cho hành động nhanh.

### GIAI ĐOẠN 2: MINION NÂNG CẤP — PET — COMBAT SKILL

**2.1. Minion kiểu Hypixel (NPC đào thật):**
- Minion là NPC hiển thị thật đứng trên đảo: có skin (player-head hoặc Citizens NPC), **cầm tool trên tay** (cúp/kiếm/rìu tùy loại), có **animation vung tool** theo nhịp làm việc, name tag hiển thị tên + bậc + trạng thái kho.
- Hoạt động: tự đào/chặt/hút tài nguyên trong bán kính quanh nó theo chu kỳ → lưu vào kho riêng (storage) → click minion mở GUI thu hoạch (GĐ1).
- Khi có item bay vào minion: hiệu ứng particle + animation nhặt.
- Khi chủ đảo offline: minion vẫn chạy logic (offline catch-up giữ nguyên từ v2 hiện tại) nhưng NPC ẩn để tiết kiệm entity.
- **Cây nâng cấp minion** (mỗi cấp tăng chỉ số, chi phí bằng Điểm Tinh Anh + nguyên liệu):
  - Tầm đào (radius, ví dụ 3 → 9 block, "độ dài tay" tăng trực quan).
  - Tốc độ làm việc (chu kỳ đào giảm).
  - Sức chứa kho (64 → 512+).
  - Thay Tool: tool mới (gỗ → đá → sắt → kim cương → netherite) tăng sản lượng; tool có `custom_data` để daemon nhận diện.
  - Đổi Skin: vài skin mở bằng Điểm Tinh Anh/casino.

**2.2. Minion mới (thêm vào `skyblock_minions.py`):**
- **Lumberjack**: chặt gỗ trong bán kính, trồng lại cây non (giữ mật độ rừng đảo).
- **Fisher**: câu cá tại hồ nước trên đảo (bán kính quanh điểm nước), tỷ lệ cá hiếm thấp hơn câu tay để cân bằng.
- (Tùy chọn mở rộng nếu dư thời gian: Hunter, Alchemist — marker cho đợt sau, không bắt buộc đợt này.)
- Mỗi loại có 12 bậc như Miner/Farmer hiện có, đúng cấu trúc `MINION_CONFIG` hiện tại.

**2.3. Pet có buff gameplay:**
- Pet theo sau người chơi (mob thuần hóa được thuần / Citizens NPC follower — chọn phương án rẻ entity nhất).
- Buff ví dụ: +5% XP AuraSkills (loại kỹ năng cụ thể), +10% tốc độ đào, +5% tỷ lệ drop, hồi máu nhẹ khi đứng yên.
- Unlock bằng Điểm Tinh Anh (giá tăng dần theo sức mạnh buff); nâng cấp pet tăng % buff.
- Buff áp dụng qua daemon (potion effects định kỳ có tag phân biệt để không đè buff hệ thống) + placeholder hiển thị trong `/pets` và Scoreboard (nếu cần).
- Bộ sưu tập ~8-12 pet đợt đầu, tên & ngoại hình theo theme server (Ví dụ: Rồng Con Sakura, Cáo Lửa, Mèo May Mắn...).

**2.4. Combat Skill cho vũ khí người chơi:**
- Triển khai qua hệ thống Ability của **AuraSkills** (abilities.yml/config) + item `custom_data` để gate skill lên vũ khí rèn từ 15 Tiers; bổ sung kích hoạt datapack nếu AuraSkills không đủ.
- 3 skill chủ lực:
  - **Hút máu (Lifesteal)**: hồi X% sát thương gây ra (cap theo % HP tối đa), kèm particle đỏ.
  - **Gọi Sét (Chain Lightning)**: đòn đánh có % triệu hồi sét lan sang quái gần (giới hạn 3-5 mục tiêu, có cooldown nội bộ).
  - **Gây Mù (Blindness Strike)**: đòn đánh có % làm mù + chậm mục tiêu 3-5s (chống lạm dụng PvP: giảm hiệu lực khi đánh người chơi).
- 2-3 skill bổ sung tùy chọn: **Hút giáp/Shield**, **Nổ diện rộng/Explosion hit**, **Đóng băng/Slow**.
- Mở khóa skill bằng nguyên liệu drop từ Boss 7-8 (xem GĐ3) → chế "Ngọc Kỹ Năng" khảm vào vũ khí.
- Cân bằng: cooldown rõ ràng, không stack vô hạn; log lại để chống gian lận.

### GIAI ĐOẠN 3: BOSS 7-8 & WORLD BOSS

**3.1. Boss 7 — [TÊN SẼ CHỐT KHI TRIỂN KHAI] (kế thừa toàn bộ skill Boss 1-6 + 1 skill đặc biệt):**
- Điều kiện: Fighting Lv.60 + Bùa Triệu Hồi mới (chế từ nguyên liệu của Boss 5-6 + catalyst từ world_parkour/world_cauca).
- Skill: gọi tuần tự/cách quãng các chiêu đặc trưng của Boss 1→6 (nhện độc, lửa, bóng tối, hư không, sculk, thiên cung) + 1 skill đặc biệt riêng (ví dụ: "Vòng Xoáy Hủy Diệt" — hút người chơi vào tâm và nổ diện rộng).
- Drop: nguyên liệu mới (ví dụ "Mảnh Vỡ Thời Không") dùng chế Ngọc Kỹ Năng combat (2.4).

**3.2. Boss 8 — [TÊN] (kế thừa toàn bộ skill Boss 1-7 + 1 skill đặc biệt):**
- Điều kiện: Fighting Lv.70 + Bùa tương ứng (nguyên liệu Boss 7 + 4 catalyst độc quyền).
- Skill đặc biệt riêng scale mạnh hơn (ví dụ: "Thiên Thạch Rơi" — nhiều vùng cảnh báo nổ liên tiếp).
- Drop: nguyên liệu trấn phái cuối (dùng nâng Ngọc Kỹ Năng lên cấp tối đa + skin VIP).

**3.3. World Boss theo giờ (sự kiện toàn server):**
- Scheduler trong daemon (Python): mỗi 3-4 giờ (khung giờ cấu hình), tự summon World Boss tại `world_boss` qua RCON + announce toàn server (title + sound + countdown 60s trước khi spawn).
- Cơ chế: HP lớn (scale theo số người tham gia), nhiều phase skill, có thời gian giới hạn (ví dụ 10 phút).
- **Thưởng theo sát thương**: bảng xếp hạng sát thương realtime (action bar/scoreboard tạm), top 1/2/3 + mốc tham gia đều có thưởng; người top nhận Điểm Tinh Anh + nguyên liệu hiếm.
- Bảo vệ: mỗi người chơi chỉ tính sát thương 1 lần vào mỗi World Boss (chống multi-account đứng multiple); chống spam vô hạn (giới hạn 1 boss sống cùng lúc/1 world).
- Fail-safe: nếu không ai đánh trong 5 phút → despawn + hoàn trả môi trường.

---

## 4. TIÊU CHÍ NGHIỆM THU (MỖI GIAI ĐOẠN)

**Kiểm thử tự động bắt buộc trước khi báo cáo:**
1. `python verify_syntax.py` — pass toàn bộ.
2. `python -m py_compile skyblock_minions.py skyblock_economy_daemon.py` (file bị sửa) — pass.
3. Chạy `tests/` hiện có — không hồi quy (mọi test cũ vẫn pass) + bổ sung test mới cho: schema mới (auction.db, migration minions.db), hàm tính damage/skill, luồng daemon mới.
4. Khởi động server (`Run-Server.bat`) → quét `logs/latest.log`: 0 ERROR, 0 lỗi đọc datapack, 0 lỗi function load.
5. Mở server bằng RCON: chạy thử toàn bộ function mới/khối lệnh mới không lỗi parse.

**Checklist test in-game (tài khoản Non-OP) — chủ server tự chạy:**
- [ ] GĐ1: mở `/menu`, `/shop`, `/pets`, `/chợ`; đăng bán → mua → nhận tiền; mua/bán shop; click minion mở GUI.
- [ ] GĐ2: đặt minion mới xuống đảo → thấy NPC cầm tool có animation; để 10 phút → thu hoạch đúng; nâng cấp tầm đào → quan sát bán kính tăng; pet theo sau + buff thực sự có hiệu lực; trang bị vũ khí có skill → đánh quái kiểm tra hút máu/sét/mù.
- [ ] GĐ3: đủ điều kiện → triệu hồi Boss 7/8; kiểm tra kế thừa skill 1-6/1-7; chờ mốc giờ → World Boss spawn, đánh, nhận thưởng theo sát thương.
- [ ] Không phát sinh lỗi console khi cả 3 giai đoạn hoạt động đồng thời.

**Sau mỗi giai đoạn, báo cáo gồm:** file đã thêm/sửa (kèm dòng), lệnh/function mới, kết quả kiểm thử tự động (dán output), checklist việc còn lại cho người dùng test.

---

## 5. NGOÀI PHẠM VI (KHÔNG LÀM ĐỢT NÀY)

- ❌ Quest/Daily Mission system.
- ❌ Tái cân bằng kinh tế (giá, loot rate, thưởng parkour/casino giữ nguyên).
- ❌ Dungeon instance nhiều phòng.
- ❌ T16+ gear mới (Boss 7-8 đợt này drop nguyên liệu mở hệ skill, không mở thêm bậc trang bị).
- ❌ Tái cấu trúc lại các hệ thống đã nghiệm thu (Boss 1-6, 15 Tiers, parkour, casino, crates).

---

## 6. THỨ TỰ THỰC THI & QUY TẮC LÀM VIỆC

1. Làm **tuần tự từng giai đoạn**, mỗi giai đoạn chia thành các bước nhỏ có thể kiểm chứng độc lập (incremental).
2. Trước mỗi thay đổi lớn: backup file.
3. Ưu tiên sửa gọn — bám đúng hiện trạng code (`skyblock_minions.py` 743 dòng, daemon kinh tế, DeluxeMenus configs, datapack functions) thay vì viết lại từ đầu.
4. Sau khi hoàn tất 1 giai đoạn: dừng, báo cáo × chờ người dùng test in-game rồi mới sang giai đoạn kế.
5. Nếu gặp quyết định thiết kế phát sinh chưa chốt (tên boss, con số cân bằng...): ghi vào mục "QUYẾT ĐỊNH ĐỀ XUẤT" trong báo cáo + chọn phương án hợp lý nhất và tiếp tục, không tự ý mở rộng phạm vi.
6. Mọi con số cân bằng (giá, tỷ lệ, thời gian) đặt tập trung trong config/dict đầu file để dễ chỉnh sau.

---

## 7. PHỤ LỤC — GỢI Ý TRIỂN KHAI KỸ THUẬT (KHÔNG BẮT BUỘC, ƯU TIÊN NẾU KHẢ THI)

| Tính năng | Phương án ưu tiên | Phương án dự phòng |
|---|---|---|
| GUI (menu/shop/pets/chợ) | DeluxeMenus + PlaceholderAPI | GUI trong daemon qua RCON mappings |
| NPC Minion trực quan | Citizens (miễn phí) + skin/animation cho minion | ArmorStand/Zombie AI-off + equipment + pose animation mỗi tick trong datapack |
| Click minion | Citizens click listener → daemon | Datapack interaction entity + `crate_interact` model |
| Kho minion | SQLite bảng mới `minion_storage` (migration ALTER) | JSON sidecar nếu SQLite phức tạp |
| Pet theo sau | Mob vanilla thuần + follow AI + name platoid | Citizens follower NPC |
| Combat skill | AuraSkills abilities + item `custom_data` gate | Datapack scoreboard damage detection + RCON buff |
| World Boss | Daemon scheduler + datapack boss functions tái sử dụng | — |
| Hover/click lệnh | MiniMessage trong Tellraw + DeluxeMenus bindings | — |

**Lưu ý kỹ thuật quan trọng:**
- Khi thêm alias lệnh mới: TẮT `messages.unknown-command` đã cấu hình rỗng; không lặp lại lỗi alias chết từ audit cũ (kiểm tra `commands.yml` trước khi khai báo).
- Lệnh mới do daemon xử lý phải qua cơ chế phân quyền hiện có (không bypass qua RCON OP trần cho người chơi thường).
- Mọi item hệ thống (Ngọc Kỹ Năng, Bùa, kho minion) phải có `custom_data` chuẩn hóa + hiển thị lore tiếng Việt + không bán được cho shop nếu không nằm trong whitelist.
- Khi đăng ký event định kỳ trong daemon: dùng vòng lặp chính hiện có, không thêm thread mới không giới hạn (tránh trôi tiến trình khi restart).

# KẾT THÚC PROMPT
