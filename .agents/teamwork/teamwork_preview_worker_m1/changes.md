# Changes Report: Milestone M1 — Progression Enforcement

**Tác giả**: Worker M1  
**Ngày thực hiện**: 2026-10-12  
**Mã Milestone**: M1 (Progression Enforcement)  
**File chỉnh sửa trực tiếp**: `C:\Users\Administrator\.gemini\antigravity\scratch\Skyblock-Server\generate_all.py`  
**File sinh lại qua generator**: `C:\Users\Administrator\.gemini\antigravity\scratch\Skyblock-Server\world\datapacks\skyblock_spawn\data\skyblock\function\build_evolution_npc.mcfunction`

---

## 1. Chi tiết chỉnh sửa trong `generate_all.py`

Tại hàm `generate_evolution_npc_mcfunction()` (dòng 501–585):

### 1.1. Cúp & Rìu (`toolsmith_npc`)
- **Trước**:
  - Tier 1..5 yêu cầu phôi `minecraft:diamond_*` vanilla.
  - Tier 6..9 yêu cầu phôi `minecraft:netherite_*` vanilla.
  - Tier 10..15 loại bỏ hoàn toàn phôi cúp/rìu, thay thế `buy` và `buyB` bằng 2 loại quặng.
- **Sau**:
  - Tier 1: `buy` yêu cầu phôi `minecraft:diamond_pickaxe` / `minecraft:diamond_axe` vanilla (không components), `buyB` yêu cầu 4 Mảnh Quặng Cổ Đại (`minecraft:prismarine_shard`, count: 4).
  - Tier 2..15: `buy` yêu cầu chính xác vật phẩm Tier N-1 thông qua `item_to_trade_sell(prev_item)` với `prev_item = make_*(TIER_INFO[tier - 2])`, bảo toàn toàn bộ Data Components (`custom_name`, `lore`, `enchantments`, `unbreakable`, `custom_data: {tier: N-1}`). `buyB` yêu cầu đúng nguyên liệu của Tier đó từ `TIER_INFO`.

### 1.2. Kiếm & Cung (`weaponsmith_npc`)
- **Trước**:
  - Kiếm và Cung có cùng lỗi nhảy Tier như Cúp/Rìu (dùng phôi vanilla ở Tier 1..9, mất phôi ở Tier 10..15).
- **Sau**:
  - Tier 1: `buy` yêu cầu `minecraft:diamond_sword` / `minecraft:bow` vanilla, `buyB` yêu cầu 4 Mảnh Quặng Cổ Đại.
  - Tier 2..15: `buy` yêu cầu chính xác Kiếm / Cung Tier N-1 với đầy đủ components. `buyB` yêu cầu nguyên liệu của Tier tương ứng.

### 1.3. Bộ Giáp 4 món (`weaponsmith_npc`)
- **Trước**:
  - Bị lọc bởi điều kiện `if slot in ["helmet", "leggings"] and t["tier"] not in [1, 5, 10, 13, 15]: continue` khiến Mũ và Quần chỉ có 5 tiers, gây đứt gãy tiến trình nâng cấp.
  - Dùng phôi vanilla ở Tier 1..9 và mất phôi ở Tier 10..15.
- **Sau**:
  - Mở rộng đầy đủ cả 4 slot: `helmet`, `chestplate`, `leggings`, `boots` xuyên suốt 15 Tiers (tổng cộng 60 giao dịch giáp).
  - Tier 1: `buy` yêu cầu `minecraft:diamond_{slot}` vanilla + `buyB` yêu cầu 4 Mảnh Quặng Cổ Đại.
  - Tier 2..15: `buy` yêu cầu đúng giáp slot tương ứng của Tier N-1 (`make_armor(TIER_INFO[tier - 2], slot)`).

---

## 2. Thống kê giao dịch sau khi tái tạo `build_evolution_npc.mcfunction`

- **NPC 1 (Đại Sư Luyện Kim)**: 10 giao dịch (nguyên liệu).
- **NPC 2 (Thần Rèn Cúp & Rìu)**: 30 giao dịch (15 Cúp + 15 Rìu).
- **NPC 3 (Thần Rèn Vũ Khí & Giáp)**: 90 giao dịch (15 Kiếm + 15 Mũ + 15 Áo + 15 Quần + 15 Ủng + 15 Cung).
- **Tổng số giao dịch nâng cấp**: 120 giao dịch.

---

## 3. Kết quả kiểm thử & xác minh

1. `python generate_all.py`: Chạy thành công 100%, không phát sinh lỗi runtime.
2. `python verify_syntax.py`:
   - `build_evolution_items.mcfunction`: PASS
   - `build_evolution_npc.mcfunction`: PASS (0 lỗi dấu ngoặc nhọn/vuông, 0 lỗi nháy đơn)
   - `setup.mcfunction`: PASS
   - `summon_boss.mcfunction`: PASS
   - `tick.mcfunction`: PASS
3. Kịch bản kiểm thử độc lập (depth-based offer parser):
   - 120/120 giao dịch đạt chuẩn Progression Enforcement (Tier N đòi hỏi chính xác Tier N-1 ở ô `buy`).
   - 0 trường hợp nhảy tier hoặc mất phôi trang bị.
