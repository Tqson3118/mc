# -*- coding: utf-8 -*-
"""
Python Master Generator Script for Skyblock 20 Tiers Ancient & Cosmic RPG Evolution System,
Bosses 1-6, Talismans/Relics System, Royal Ore Generator Temple & Masterpiece Island Structures.
Compatible with Minecraft Paper 1.21.4.
"""
import json
import os

BASE_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), "world", "datapacks", "skyblock_spawn", "data", "skyblock", "function")

# ==============================================================================
# 1. ĐỊNH NGHĨA 7 NGUYÊN LIỆU CỔ ĐẠI & VŨ TRỤ (MATERIALS)
# ==============================================================================
MATERIALS = {
    "shard": {
        "id": "minecraft:prismarine_shard",
        "name": '{"text":"✦ Mảnh Quặng Cổ Đại ✦","color":"aqua","bold":true,"italic":false}',
        "lore": [
            '{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}',
            '{"text":"Nguyên liệu ngưng tụ từ kỷ nguyên sơ khai.","color":"gray","italic":true}',
            '{"text":"✦ Dùng để luyện kim và rèn trang bị Bậc 1 - 5","color":"dark_aqua","italic":false}',
            '{"text":"[Loại]: Nguyên Liệu Cổ Đại","color":"yellow","bold":true,"italic":false}',
            '{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}'
        ],
        "custom_data": {"ancient_mat": "shard"}
    },
    "crystal": {
        "id": "minecraft:amethyst_shard",
        "name": '{"text":"❂ Tinh Thể Cổ Đại ❂","color":"light_purple","bold":true,"italic":false}',
        "lore": [
            '{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}',
            '{"text":"Tinh thể phát sáng với ma năng nguyên thủy.","color":"gray","italic":true}',
            '{"text":"✦ Dùng để rèn trang bị Cổ Đại Bậc 6 - 9","color":"light_purple","italic":false}',
            '{"text":"[Loại]: Nguyên Liệu Thần Thoại","color":"gold","bold":true,"italic":false}',
            '{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}'
        ],
        "custom_data": {"ancient_mat": "crystal"}
    },
    "demon_heart": {
        "id": "minecraft:fermented_spider_eye",
        "name": '{"text":"☠ Trái Tim Của Quỷ ☠","color":"dark_red","bold":true,"italic":false}',
        "lore": [
            '{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}',
            '{"text":"Trái tim đen tối vẫn còn đập của Chúa Tể Bóng Tối.","color":"dark_purple","italic":true}',
            '{"text":"⚡ Nguyên liệu ĐỘT PHÁ bắt buộc cho mốc TIER 10!","color":"red","bold":true,"italic":false}',
            '{"text":"✦ Rơi 100% khi hạ gục Chúa Tể Bóng Tối (/warp boss)","color":"gold","italic":false}',
            '{"text":"[Loại]: Nguyên Liệu Đột Phá Hắc Ám","color":"dark_red","bold":true,"italic":false}',
            '{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}'
        ],
        "custom_data": {"ancient_mat": "demon_heart"}
    },
    "void_core": {
        "id": "minecraft:echo_shard",
        "name": '{"text":"🌀 Lõi Hư Không 🌀","color":"dark_purple","bold":true,"italic":false}',
        "lore": [
            '{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}',
            '{"text":"Chứa đựng trọng lực vô tận từ không gian hư vô.","color":"gray","italic":true}',
            '{"text":"⚡ Nguyên liệu ĐỘT PHÁ bắt buộc cho mốc TIER 13!","color":"light_purple","bold":true,"italic":false}',
            '{"text":"✦ Rơi từ World Boss Cấp 4 hoặc đổi tại Lò Luyện Kim","color":"aqua","italic":false}',
            '{"text":"[Loại]: Nguyên Liệu Tối Thượng","color":"dark_purple","bold":true,"italic":false}',
            '{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}'
        ],
        "custom_data": {"ancient_mat": "void_core"}
    },
    "cosmic_essence": {
        "id": "minecraft:nether_star",
        "name": '{"text":"✧ Tinh Hoa Vũ Trụ ✧","color":"yellow","bold":true,"italic":false}',
        "lore": [
            '{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}',
            '{"text":"Bụi sao tinh tú hội tụ sức mạnh tạo tác cội nguồn.","color":"yellow","italic":true}',
            '{"text":"⚡ Nguyên liệu ĐỘT PHÁ TỐI THƯỢNG cho TIER 15 VĨNH CỬU!","color":"gold","bold":true,"italic":false}',
            '{"text":"✦ Trao đổi tại Lò Luyện Kim","color":"aqua","italic":false}',
            '{"text":"[Loại]: Cực Phẩm Vũ Trụ","color":"yellow","bold":true,"italic":false}',
            '{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}'
        ],
        "custom_data": {"ancient_mat": "cosmic_essence"}
    },
    "warden_heart": {
        "id": "minecraft:recovery_compass",
        "name": '{"text":"💠 Trái Tim Thâm Uyên 💠","color":"dark_aqua","bold":true,"italic":false}',
        "lore": [
            '{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}',
            '{"text":"Lõi âm thanh cổ đại kết tinh từ Cổ Thần Thâm Uyên Warden.","color":"aqua","italic":true}',
            '{"text":"⚡ Nguyên liệu ĐỘT PHÁ THẦN THOẠI cho TIER 16 - 18!","color":"dark_aqua","bold":true,"italic":false}',
            '{"text":"✦ Rơi 100% khi hạ Boss 5: Cổ Thần Thâm Uyên (/boss5)","color":"yellow","italic":false}',
            '{"text":"[Loại]: Báu Vật Thâm Uyên","color":"aqua","bold":true,"italic":false}',
            '{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}'
        ],
        "custom_data": {"ancient_mat": "warden_heart"}
    },
    "eternity_singularity": {
        "id": "minecraft:heavy_core",
        "name": '{"text":"🌌 Dị Điểm Vĩnh Hằng 🌌","color":"light_purple","bold":true,"italic":false}',
        "lore": [
            '{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}',
            '{"text":"Hạt nhân nén chặt của cả một thiên hà đang bùng nổ.","color":"light_purple","italic":true}',
            '{"text":"⚡ Nguyên liệu SÁNG THẾ TỐI CAO cho TIER 19 - 20 [MAX]!","color":"gold","bold":true,"italic":false}',
            '{"text":"✦ Rơi 100% khi hạ Boss 6: Hoàng Đế Tinh Tú (/boss6)","color":"yellow","italic":false}',
            '{"text":"[Loại]: Thánh Vật Sáng Thế","color":"light_purple","bold":true,"italic":false}',
            '{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}'
        ],
        "custom_data": {"ancient_mat": "eternity_singularity"}
    },
    "sea_scale": {
        "id": "minecraft:nautilus_shell",
        "name": '{"text":"🌊 Vảy Thần Biển Sâu 🌊","color":"aqua","bold":true,"italic":false}',
        "lore": [
            '{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}',
            '{"text":"Vảy lấp lánh của thủy quái cổ đại dưới Biển Hồ Trên Mây.","color":"gray","italic":true}',
            '{"text":"⚡ Dùng để chế Bùa Boss 5 & Hợp nhất Phôi VIP God Gear","color":"yellow","bold":true,"italic":false}',
            '{"text":"[Nguồn]: Câu cá tại world_cauca","color":"aqua","bold":true,"italic":false}',
            '{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}'
        ],
        "custom_data": {"ancient_mat": "sea_scale"}
    },
    "storm_crystal": {
        "id": "minecraft:wind_charge",
        "name": '{"text":"⚡ Tinh Thể Phong Lôi ⚡","color":"yellow","bold":true,"italic":false}',
        "lore": [
            '{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}',
            '{"text":"Ngưng tụ từ cuồng lôi trên đỉnh Tháp 50 Tầng!","color":"gray","italic":true}',
            '{"text":"⚡ Dùng để chế Bùa Boss 6 & Hợp nhất Phôi VIP God Gear","color":"yellow","bold":true,"italic":false}',
            '{"text":"[Nguồn]: Tháp Parkour Phong Lôi world_parkour","color":"aqua","bold":true,"italic":false}',
            '{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}'
        ],
        "custom_data": {"ancient_mat": "storm_crystal"}
    },
    "soul_fragment": {
        "id": "minecraft:echo_shard",
        "name": '{"text":"👻 Mảnh Linh Hồn 👻","color":"light_purple","bold":true,"italic":false}',
        "lore": [
            '{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}',
            '{"text":"Tàn dư linh hồn thu thập từ quái vật tầng sâu hầm ngục.","color":"gray","italic":true}',
            '{"text":"⚡ Dùng để rèn vũ khí hút máu & Hợp nhất Phôi VIP God Gear","color":"yellow","bold":true,"italic":false}',
            '{"text":"[Nguồn]: Hầm Ngục Quái world_farm","color":"green","bold":true,"italic":false}',
            '{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}'
        ],
        "custom_data": {"ancient_mat": "soul_fragment"}
    },
    "royal_ticket": {
        "id": "minecraft:gold_nugget",
        "name": '{"text":"🎫 Vé Vàng Hoàng Gia 🎫","color":"gold","bold":true,"italic":false}',
        "lore": [
            '{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}',
            '{"text":"Tấm vé danh dự nạm vàng trao thưởng cho người chiến thắng Casino.","color":"yellow","italic":true}',
            '{"text":"⚡ Dùng để đổi Danh Hiệu VIP & Hợp nhất Phôi VIP God Gear","color":"gold","bold":true,"italic":false}',
            '{"text":"[Nguồn]: Cung Điện Casino world_casino (/xoso, /cf, /cotyphu)","color":"light_purple","bold":true,"italic":false}',
            '{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}'
        ],
        "custom_data": {"ancient_mat": "royal_ticket"}
    },
    "cosmic_catalyst": {
        "id": "minecraft:nether_star",
        "name": '{"text":"❂ Phôi Tinh Hoa Tối Thượng ❂","color":"light_purple","bold":true,"italic":false}',
        "lore": [
            '{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}',
            '{"text":"Hội tụ trọn vẹn 4 Đại Nguyên Tố: Biển Sâu, Phong Lôi, Linh Hồn & Hoàng Gia.","color":"light_purple","italic":true}',
            '{"text":"⚡ KẾT HỢP SAO NETHER ĐỂ ĐẠT MỐC TIER 15 VĨNH CỬU!","color":"gold","bold":true,"italic":false}',
            '{"text":"[Loại]: Thánh Vật Tối Thượng (4 Realms Catalyst)","color":"yellow","bold":true,"italic":false}',
            '{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}'
        ],
        "custom_data": {"ancient_mat": "cosmic_catalyst"}
    }
}

# ==============================================================================
# 2. ĐỊNH NGHĨA 5 CỔ NGỮ & BÙA HỘ MỆNH (TALISMANS / RELICS)
# ==============================================================================
TALISMANS = {
    "miner": {
        "id": "minecraft:raw_gold",
        "name": '{"text":"⛏ Bùa Thần Mỏ Hoàng Kim ⛏","color":"gold","bold":true,"italic":false}',
        "lore": [
            '{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}',
            '{"text":"Bùa hộ mệnh khắc cổ ngữ của Vua Người Lùn.","color":"gray","italic":true}',
            '{"text":"✦ KÍCH HOẠT KHI ĐỂ TRONG TÚI ĐỒ / TAY PHỤ:","color":"yellow","bold":true,"italic":false}',
            '{"text":"  • Nhận vĩnh viễn Đào Nhanh III (Haste III)","color":"aqua","italic":false}',
            '{"text":"  • Tăng +25% Tiền khi bán quặng (/bankhoangsan)","color":"green","bold":true,"italic":false}',
            '{"text":"  • Tăng +25% Tiền khi bán kho Minions","color":"green","italic":false}',
            '{"text":"[Loại]: Cổ Ngữ Hộ Mệnh (/bua)","color":"gold","bold":true,"italic":false}',
            '{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}'
        ],
        "custom_data": {"skyblock_talisman": "miner", "talisman_miner": True},
        "cost": 25000
    },
    "warrior": {
        "id": "minecraft:blaze_powder",
        "name": '{"text":"🩸 Bùa Huyết Chiến Cuồng Nộ 🩸","color":"red","bold":true,"italic":false}',
        "lore": [
            '{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}',
            '{"text":"Chứa đựng ý chí bất khuất của Chiến Thần Viễn Cổ.","color":"gray","italic":true}',
            '{"text":"✦ KÍCH HOẠT KHI ĐỂ TRONG TÚI ĐỒ / TAY PHỤ:","color":"yellow","bold":true,"italic":false}',
            '{"text":"  • Nhận vĩnh viễn Sức Mạnh II (Strength II) & Tốc Độ II","color":"red","italic":false}',
            '{"text":"  • Tăng +25% Tiền khi bán Kinh Nghiệm (/banexp)","color":"green","bold":true,"italic":false}',
            '{"text":"[Loại]: Cổ Ngữ Hộ Mệnh (/bua)","color":"red","bold":true,"italic":false}',
            '{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}'
        ],
        "custom_data": {"skyblock_talisman": "warrior", "talisman_warrior": True},
        "cost": 35000
    },
    "fortune": {
        "id": "minecraft:emerald",
        "name": '{"text":"🍀 Bùa Thần Tài Đại Cát 🍀","color":"green","bold":true,"italic":false}',
        "lore": [
            '{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}',
            '{"text":"Ngọc bội tụ tài lộc từ bốn phương trời đất.","color":"gray","italic":true}',
            '{"text":"✦ KÍCH HOẠT KHI ĐỂ TRONG TÚI ĐỒ / TAY PHỤ:","color":"yellow","bold":true,"italic":false}',
            '{"text":"  • Nhận vĩnh viễn May Mắn III (Luck III)","color":"green","italic":false}',
            '{"text":"  • Tăng +50% Tiền khi bán quặng (/bankhoangsan)","color":"gold","bold":true,"italic":false}',
            '{"text":"  • Tăng +25% Tốc độ làm việc của mọi Minions","color":"aqua","bold":true,"italic":false}',
            '{"text":"[Loại]: Cổ Ngữ Hộ Mệnh (/bua)","color":"green","bold":true,"italic":false}',
            '{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}'
        ],
        "custom_data": {"skyblock_talisman": "fortune", "talisman_fortune": True},
        "cost": 50000
    },
    "immortal": {
        "id": "minecraft:totem_of_undying",
        "name": '{"text":"🛡 Bùa Bất Tử Hư Không 🛡","color":"aqua","bold":true,"italic":false}',
        "lore": [
            '{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}',
            '{"text":"Bảo ấn phong tỏa không gian, kháng cự lực hút Hư Vô.","color":"gray","italic":true}',
            '{"text":"✦ KÍCH HOẠT KHI ĐỂ TRONG TÚI ĐỒ / TAY PHỤ:","color":"yellow","bold":true,"italic":false}',
            '{"text":"  • Nhận Kháng Sát Thương II, Hồi Phục II & Kháng Lửa","color":"aqua","italic":false}',
            '{"text":"  • CỨU MẠNG HƯ KHÔNG: Tự động dịch chuyển ngược lên trời","color":"light_purple","bold":true,"italic":false}',
            '{"text":"    khi lỡ chân rơi xuống vực Void (Y < -40)!","color":"light_purple","italic":false}',
            '{"text":"[Loại]: Cổ Ngữ Hộ Mệnh (/bua)","color":"aqua","bold":true,"italic":false}',
            '{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}'
        ],
        "custom_data": {"skyblock_talisman": "immortal", "talisman_immortal": True},
        "cost": 75000
    },
    "genesis": {
        "id": "minecraft:nether_star",
        "name": '{"text":"🌌 Cổ Ngữ Sáng Thế Tối Thượng 🌌","color":"light_purple","bold":true,"italic":false}',
        "lore": [
            '{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}',
            '{"text":"Thánh vật dung hợp 4 nguồn quy luật tối cao của Vũ Trụ.","color":"yellow","italic":true}',
            '{"text":"✦ KÍCH HOẠT KHI ĐỂ TRONG TÚI ĐỒ / TAY PHỤ:","color":"gold","bold":true,"italic":false}',
            '{"text":"  • Haste IV, Strength III, Speed III, Regen III & +6 Tim Vàng","color":"aqua","bold":true,"italic":false}',
            '{"text":"  • NHÂN ĐÔI (+100%) Tiền bán khoáng sản (/bankhoangsan)!","color":"green","bold":true,"italic":false}',
            '{"text":"  • Tăng +50% Tiền bán EXP & +50% Tốc độ Minions!","color":"yellow","bold":true,"italic":false}',
            '{"text":"  • BẤT TỬ HƯ KHÔNG: Tự động cứu mạng khi rơi xuống Void!","color":"light_purple","bold":true,"italic":false}',
            '{"text":"[Loại]: Thánh Vật Cổ Ngữ Tối Thượng (/bua)","color":"light_purple","bold":true,"italic":false}',
            '{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}'
        ],
        "custom_data": {"skyblock_talisman": "genesis", "talisman_genesis": True, "talisman_immortal": True},
        "cost": 200000
    }
}

# ==============================================================================
# 3. CẤU HÌNH 20 TIERS (1..15 CỔ ĐẠI + 16..20 VŨ TRỤ SÁNG THẾ)
# ==============================================================================
TIER_INFO = [
    {"tier": 1,  "name": "Sơ Cấp",             "color": "green",        "eff": 5,  "fort": 3,  "sharp": 5,  "prot": 4,  "power": 5,  "req_type": "shard",                "req_count": 4},
    {"tier": 2,  "name": "Cương Thiết",         "color": "dark_green",   "eff": 6,  "fort": 3,  "sharp": 6,  "prot": 5,  "power": 6,  "req_type": "shard",                "req_count": 6},
    {"tier": 3,  "name": "Lam Ngọc",           "color": "aqua",         "eff": 6,  "fort": 4,  "sharp": 6,  "prot": 5,  "power": 6,  "req_type": "shard",                "req_count": 8},
    {"tier": 4,  "name": "Hoàng Kim",          "color": "gold",         "eff": 7,  "fort": 4,  "sharp": 7,  "prot": 6,  "power": 7,  "req_type": "shard",                "req_count": 12},
    {"tier": 5,  "name": "Kim Cương",          "color": "blue",         "eff": 7,  "fort": 5,  "sharp": 7,  "prot": 6,  "power": 7,  "req_type": "shard",                "req_count": 16},
    {"tier": 6,  "name": "U Tối",              "color": "dark_purple",  "eff": 8,  "fort": 5,  "sharp": 8,  "prot": 7,  "power": 8,  "req_type": "crystal",              "req_count": 4},
    {"tier": 7,  "name": "Hỏa Long",           "color": "red",          "eff": 8,  "fort": 6,  "sharp": 8,  "prot": 7,  "power": 8,  "req_type": "crystal",              "req_count": 6},
    {"tier": 8,  "name": "Băng Phách",         "color": "light_purple", "eff": 9,  "fort": 6,  "sharp": 9,  "prot": 8,  "power": 9,  "req_type": "crystal",              "req_count": 8},
    {"tier": 9,  "name": "Lôi Thần",           "color": "yellow",       "eff": 9,  "fort": 7,  "sharp": 9,  "prot": 8,  "power": 9,  "req_type": "crystal",              "req_count": 12},
    {"tier": 10, "name": "Quỷ Vương Hắc Ám",    "color": "dark_red",     "eff": 10, "fort": 7,  "sharp": 10, "prot": 9,  "power": 10, "req_type": "demon_heart",          "req_count": 1},
    {"tier": 11, "name": "Quỷ Thần Tận Diệt",   "color": "dark_red",     "eff": 10, "fort": 7,  "sharp": 11, "prot": 9,  "power": 11, "req_type": "demon_heart",          "req_count": 1},
    {"tier": 12, "name": "Thời Không Huyền Bí", "color": "light_purple", "eff": 11, "fort": 8,  "sharp": 12, "prot": 10, "power": 12, "req_type": "demon_heart",          "req_count": 1},
    {"tier": 13, "name": "Hư Không Tối Thượng", "color": "dark_purple",  "eff": 12, "fort": 8,  "sharp": 13, "prot": 11, "power": 13, "req_type": "void_core",            "req_count": 1},
    {"tier": 14, "name": "Tinh Linh Thần Giới", "color": "aqua",         "eff": 13, "fort": 9,  "sharp": 14, "prot": 12, "power": 14, "req_type": "void_core",            "req_count": 2},
    {"tier": 15, "name": "Sáng Thế Vũ Trụ",    "color": "gold",         "eff": 15, "fort": 10, "sharp": 16, "prot": 14, "power": 15, "req_type": "cosmic_essence",       "req_count": 1},
    # --- TIER 16 ĐẾN TIER 20: KỶ NGUYÊN THÂM UYÊN & VĨNH HẰNG ---
    {"tier": 16, "name": "Thâm Uyên Cổ Thần",   "color": "dark_aqua",    "eff": 16, "fort": 11, "sharp": 17, "prot": 15, "power": 16, "req_type": "warden_heart",         "req_count": 1},
    {"tier": 17, "name": "Tinh Vân Hủy Diệt",   "color": "aqua",         "eff": 18, "fort": 12, "sharp": 18, "prot": 16, "power": 17, "req_type": "warden_heart",         "req_count": 2},
    {"tier": 18, "name": "Thiên Hà Vạn Tượng",  "color": "light_purple", "eff": 20, "fort": 13, "sharp": 20, "prot": 18, "power": 18, "req_type": "warden_heart",         "req_count": 3},
    {"tier": 19, "name": "Siêu Tân Tinh",       "color": "yellow",       "eff": 22, "fort": 14, "sharp": 22, "prot": 19, "power": 20, "req_type": "eternity_singularity", "req_count": 1},
    {"tier": 20, "name": "Chúa Tể Vĩnh Hằng",   "color": "gold",         "eff": 25, "fort": 15, "sharp": 25, "prot": 20, "power": 25, "req_type": "eternity_singularity", "req_count": 2},
]

DURABILITY_LORE = '["",{"text":"Độ Bền: ","color":"gray","italic":false},{"text":"[▰▰▰▰▰▰▰▰▰▰] ","color":"gold","bold":true,"italic":false},{"text":"100% (VĨNH CỬU)","color":"yellow","bold":true,"italic":false}]'

def format_custom_data_str(d):
    parts = []
    for k, v in d.items():
        if isinstance(v, bool):
            parts.append(f"{k}:{1 if v else 0}b")
        elif isinstance(v, int):
            parts.append(f"{k}:{v}")
        elif isinstance(v, str):
            parts.append(f'{k}:"{v}"')
    return "{" + ",".join(parts) + "}"

def make_pickaxe(t):
    tier = t["tier"]
    name_str = f'{{"text":"🔮 Cúp Cổ Đại {t["name"]} [Tier {tier}] 🔮","color":"{t["color"]}","bold":true,"italic":false}}'
    lore = [
        '{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}',
        '{"text":"Bảo vật khai mỏ cổ đại ngưng tụ linh khí ngàn năm.","color":"gray","italic":true}',
        DURABILITY_LORE,
        f'{{"text":"✦ Hiệu Suất: Cấp {t["eff"]} • Gia Tài: Cấp {t["fort"]}","color":"aqua","italic":false}}'
    ]
    custom_data = {"ancient_pickaxe": True, "tier": tier}
    if tier >= 10:
        lore.append('{"text":"⚡ KỸ NĂNG: ĐÀO NỔ 3x3 TỨC THÌ QUANH VỊ TRÍ ĐÀO!","color":"red","bold":true,"italic":false}')
        custom_data["explosive_mining"] = True
    if tier == 15:
        lore.append('{"text":"✧ QUYỀN NĂNG VŨ TRỤ: BẢO VẬT TỐI CAO ĐỈNH CAO BẤT HOẠI!","color":"yellow","bold":true,"italic":false}')
    if tier >= 16:
        lore.append('{"text":"🌌 KỸ NĂNG THẦN CẤP: ĐÀO NHANH IV (HASTE IV) & NHÌN ĐÊM VĨNH CỬU!","color":"light_purple","bold":true,"italic":false}')
        custom_data["super_explosive_mining"] = True
    lore.append('{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}')

    enchants = {"minecraft:efficiency": t["eff"], "minecraft:fortune": t["fort"]}
    return {
        "id": "minecraft:netherite_pickaxe",
        "custom_name": name_str,
        "lore": lore,
        "enchantments": enchants,
        "custom_data": custom_data
    }

def make_sword(t):
    tier = t["tier"]
    name_str = f'{{"text":"☠ Kiếm Cổ Đại {t["name"]} [Tier {tier}] ☠","color":"{t["color"]}","bold":true,"italic":false}}'
    fire = 2 + (tier // 3)
    sweeping = 3 + (tier // 2)
    looting = 3 + (tier // 3)
    lore = [
        '{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}',
        '{"text":"Lưỡi kiếm cổ xưa rèn bằng ngọn lửa Hư Không.","color":"gray","italic":true}',
        DURABILITY_LORE,
        f'{{"text":"✦ Sắc Bén: Cấp {t["sharp"]} • Quét Kiếm: Cấp {sweeping}","color":"red","italic":false}}',
        f'{{"text":"✦ Lửa Địa Ngục: Cấp {fire} • Nhặt Đồ: Cấp {looting}","color":"gold","italic":false}}'
    ]
    custom_data = {"ancient_sword": True, "tier": tier}
    if tier >= 10:
        lore.append('{"text":"⚡ KỸ NĂNG: HÚT MÁU (HỒI 2 TIM TỨC THÌ KHI CHÉM TRÚNG)!","color":"green","bold":true,"italic":false}')
        lore.append('{"text":"⚡ KỸ NĂNG: LÔI PHẠT (TRIỆU HỒI SẤM SÉT VÀO MỤC TIÊU)!","color":"aqua","bold":true,"italic":false}')
        custom_data["ancient_lifesteal"] = True
        custom_data["ancient_lightning"] = True
    if tier == 15:
        lore.append('{"text":"✧ QUYỀN NĂNG VŨ TRỤ: BÃO SẤM SÉT & TẬN DIỆT KẺ THÙ!","color":"yellow","bold":true,"italic":false}')
    if tier >= 16:
        lore.append('{"text":"🌌 TUYỆT KỸ VĨNH HẰNG: SÓNG ÂM SONIC BOOM & KHIÊN HẤP THỤ!","color":"light_purple","bold":true,"italic":false}')
        custom_data["cosmic_cleave"] = True
    lore.append('{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}')

    enchants = {
        "minecraft:sharpness": t["sharp"],
        "minecraft:fire_aspect": fire,
        "minecraft:sweeping_edge": sweeping,
        "minecraft:looting": looting
    }
    return {
        "id": "minecraft:netherite_sword",
        "custom_name": name_str,
        "lore": lore,
        "enchantments": enchants,
        "custom_data": custom_data
    }

def make_armor(t, slot):
    tier = t["tier"]
    slot_names = {
        "helmet": ("Mũ", "minecraft:netherite_helmet"),
        "chestplate": ("Áo Giáp", "minecraft:netherite_chestplate"),
        "leggings": ("Xà Cạp", "minecraft:netherite_leggings"),
        "boots": ("Ủng", "minecraft:netherite_boots")
    }
    slot_vn, item_id = slot_names[slot]
    name_str = f'{{"text":"❂ {slot_vn} Cổ Đại {t["name"]} [Tier {tier}] ❂","color":"{t["color"]}","bold":true,"italic":false}}'
    thorns = 2 + (tier // 3)
    lore = [
        '{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}',
        f'{{"text":"Chiến giáp {slot_vn.lower()} thần thoại tôi luyện từ thời thượng cổ.","color":"gray","italic":true}}',
        DURABILITY_LORE,
        f'{{"text":"✦ Bảo Vệ: Cấp {t["prot"]} • Gai Góc: Cấp {thorns}","color":"aqua","italic":false}}'
    ]
    custom_data = {"ancient_armor": True, "slot": slot, "tier": tier}
    if tier >= 10:
        custom_data["ancient_armor_t10"] = True
        if slot == "chestplate":
            lore.append('{"text":"✦ BUFF: KHÁNG SÁT THƯƠNG II & HỒI SINH KHÍ CỰC ĐẠI!","color":"green","bold":true,"italic":false}')
        elif slot == "boots":
            lore.append('{"text":"✦ BUFF: TỐC ĐỘ DI CHUYỂN II (SPEED II) XÉ GIÓ!","color":"aqua","bold":true,"italic":false}')
        else:
            lore.append('{"text":"✦ BUFF: GIA TĂNG SINH MỆNH & GIẢM SÁT THƯƠNG MA THUẬT!","color":"yellow","bold":true,"italic":false}')
    if tier >= 15:
        custom_data["ancient_armor_t15"] = True
        if tier == 15:
            lore.append('{"text":"✧ QUYỀN NĂNG VŨ TRỤ: BẤT TỬ CHI THÂN, TỐC ĐỘ III & PHI HÀNH (FLY)!","color":"gold","bold":true,"italic":false}')
    if tier >= 16:
        custom_data["ancient_armor_t20"] = True
        lore.append('{"text":"🌌 THẦN GIÁP VĨNH HẰNG: +10 TIM VÀNG HẤP THỤ & SỨC MẠNH CỔ THẦN!","color":"light_purple","bold":true,"italic":false}')
    lore.append('{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}')

    enchants = {"minecraft:protection": t["prot"], "minecraft:thorns": thorns}
    if slot == "boots":
        enchants["minecraft:feather_falling"] = min(12, 4 + (tier // 2))
        enchants["minecraft:depth_strider"] = 3

    return {
        "id": item_id,
        "custom_name": name_str,
        "lore": lore,
        "enchantments": enchants,
        "custom_data": custom_data
    }

def make_axe(t):
    tier = t["tier"]
    name_str = f'{{"text":"⚡ Rìu Cổ Đại {t["name"]} [Tier {tier}] ⚡","color":"{t["color"]}","bold":true,"italic":false}}'
    lore = [
        '{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}',
        '{"text":"Rìu chiến thần lực chẻ đôi mọi khối gỗ cổ thụ.","color":"gray","italic":true}',
        DURABILITY_LORE,
        f'{{"text":"✦ Hiệu Suất: Cấp {t["eff"]} • Sắc Bén: Cấp {t["sharp"] - 1}","color":"aqua","italic":false}}',
        '{"text":"⚡ KỸ NĂNG: TREECAPITATOR (CHẶT 1 BLOCK ĐỔ CẢ CÂY CỔ THỤ)!","color":"green","bold":true,"italic":false}'
    ]
    custom_data = {"ancient_axe": True, "tier": tier}
    if tier == 15:
        lore.append('{"text":"✧ QUYỀN NĂNG VŨ TRỤ: BẠO LỰC CỰC HẠN & TIỄU TRỪ RỪNG RẬM!","color":"yellow","bold":true,"italic":false}')
    if tier >= 16:
        lore.append('{"text":"🌌 THẦN LỰC VĨNH HẰNG: BẠO KÍCH SẤM SÉT & ĐỐN RỪNG SIÊU TỐC!","color":"light_purple","bold":true,"italic":false}')
        custom_data["cosmic_axe"] = True
    lore.append('{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}')

    enchants = {"minecraft:efficiency": t["eff"], "minecraft:sharpness": max(5, t["sharp"] - 1)}
    return {
        "id": "minecraft:netherite_axe",
        "custom_name": name_str,
        "lore": lore,
        "enchantments": enchants,
        "custom_data": custom_data
    }

def make_bow(t):
    tier = t["tier"]
    name_str = f'{{"text":"🏹 Cung Cổ Đại {t["name"]} [Tier {tier}] 🏹","color":"{t["color"]}","bold":true,"italic":false}}'
    punch = min(6, 1 + (tier // 3))
    flame = min(6, 1 + (tier // 4))
    lore = [
        '{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}',
        '{"text":"Thần tiễn cổ xưa bắn ra những mũi tên xuyên không.","color":"gray","italic":true}',
        DURABILITY_LORE,
        f'{{"text":"✦ Sức Mạnh: Cấp {t["power"]} • Đấm Lùi: Cấp {punch} • Hỏa Tiễn: Cấp {flame}","color":"gold","italic":false}}',
        '{"text":"✦ Vô Hạn: Cấp I (Chỉ cần 1 mũi tên duy nhất trong túi)","color":"aqua","italic":false}'
    ]
    custom_data = {"ancient_bow": True, "tier": tier}
    if tier >= 10:
        lore.append('{"text":"⚡ KỸ NĂNG: TÊN NỔ SẤM SÉT XÉ TOẠC KẺ THÙ TỪ XA!","color":"red","bold":true,"italic":false}')
    if tier == 15:
        lore.append('{"text":"✧ QUYỀN NĂNG VŨ TRỤ: BẮN ĐÂU TRÚNG ĐẤY, SÁT THƯƠNG DIỆT THẾ!","color":"yellow","bold":true,"italic":false}')
    if tier >= 16:
        lore.append('{"text":"🌌 TUYỆT KỸ TINH HÀ: MƯA SAO BĂNG SẤM SÉT HỦY DIỆT MỤC TIÊU!","color":"light_purple","bold":true,"italic":false}')
        custom_data["orbital_strike"] = True
    lore.append('{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}')

    enchants = {
        "minecraft:power": t["power"],
        "minecraft:punch": punch,
        "minecraft:flame": flame,
        "minecraft:infinity": 1
    }
    return {
        "id": "minecraft:bow",
        "custom_name": name_str,
        "lore": lore,
        "enchantments": enchants,
        "custom_data": custom_data
    }

def item_to_give_snbt(item_dict):
    item_id = item_dict["id"]
    comps = []
    comps.append(f"minecraft:custom_name='{item_dict['custom_name']}'")
    lore_str = "[" + ",".join([f"'{l}'" for l in item_dict['lore']]) + "]"
    comps.append(f"minecraft:lore={lore_str}")
    if "enchantments" in item_dict:
        ench_levels = ",".join([f'"{k}":{v}' for k, v in item_dict["enchantments"].items()])
        comps.append(f"minecraft:enchantments={{levels:{{{ench_levels}}}}}")
    comps.append("minecraft:unbreakable={show_in_tooltip:false}")
    comps.append(f"minecraft:custom_data={format_custom_data_str(item_dict['custom_data'])}")
    return f"{item_id}[{','.join(comps)}]"

def mat_to_give_snbt(mat_dict):
    item_id = mat_dict["id"]
    comps = []
    comps.append(f"minecraft:custom_name='{mat_dict['name']}'")
    lore_str = "[" + ",".join([f"'{l}'" for l in mat_dict['lore']]) + "]"
    comps.append(f"minecraft:lore={lore_str}")
    comps.append("minecraft:enchantment_glint_override=true")
    comps.append(f"minecraft:custom_data={format_custom_data_str(mat_dict['custom_data'])}")
    return f"{item_id}[{','.join(comps)}]"

def item_to_trade_sell(item_dict):
    comps = []
    comps.append(f'"minecraft:custom_name":\'{item_dict["custom_name"]}\'')
    lore_str = "[" + ",".join([f"'{l}'" for l in item_dict['lore']]) + "]"
    comps.append(f'"minecraft:lore":{lore_str}')
    if "enchantments" in item_dict:
        ench_levels = ",".join([f'"{k}":{v}' for k, v in item_dict["enchantments"].items()])
        comps.append(f'"minecraft:enchantments":{{levels:{{{ench_levels}}}}}')
    comps.append('"minecraft:unbreakable":{show_in_tooltip:false}')
    comps.append(f'"minecraft:custom_data":{format_custom_data_str(item_dict["custom_data"])}')
    comps_body = "{" + ",".join(comps) + "}"
    return f'{{id:"{item_dict["id"]}",count:1,components:{comps_body}}}'

def mat_to_trade_sell(mat_dict, count=1):
    comps = []
    comps.append(f'"minecraft:custom_name":\'{mat_dict["name"]}\'')
    lore_str = "[" + ",".join([f"'{l}'" for l in mat_dict['lore']]) + "]"
    comps.append(f'"minecraft:lore":{lore_str}')
    comps.append('"minecraft:enchantment_glint_override":true')
    comps.append(f'"minecraft:custom_data":{format_custom_data_str(mat_dict["custom_data"])}')
    comps_body = "{" + ",".join(comps) + "}"
    return f'{{id:"{mat_dict["id"]}",count:{count},components:{comps_body}}}'

# ==============================================================================
# TẠO FILE build_evolution_items.mcfunction
# ==============================================================================
def generate_evolution_items_mcfunction():
    lines = []
    lines.append("# ==============================================================================")
    lines.append("# HỆ THỐNG TIẾN HÓA TRANG BỊ 20 TIERS & CỔ NGỮ - ĐỊNH NGHĨA VẬT PHẨM")
    lines.append("# ==============================================================================")
    for key, m in MATERIALS.items():
        lines.append(f"give @p {mat_to_give_snbt(m)} 16")
    for key, tal in TALISMANS.items():
        lines.append(f"give @p {mat_to_give_snbt(tal)} 1")
    p20 = make_pickaxe(TIER_INFO[19])
    s20 = make_sword(TIER_INFO[19])
    ax20 = make_axe(TIER_INFO[19])
    bw20 = make_bow(TIER_INFO[19])
    lines.append(f"give @p {item_to_give_snbt(p20)} 1")
    lines.append(f"give @p {item_to_give_snbt(s20)} 1")
    lines.append(f"give @p {item_to_give_snbt(ax20)} 1")
    lines.append(f"give @p {item_to_give_snbt(bw20)} 1")
    for slot in ["helmet", "chestplate", "leggings", "boots"]:
        lines.append(f"give @p {item_to_give_snbt(make_armor(TIER_INFO[19], slot))} 1")
    lines.append('tellraw @p [{"text":"[Ancient RPG] ","color":"gold","bold":true},{"text":"Đã nhận trọn bộ Trang Bị Chúa Tể Vĩnh Hằng [Tier 20], 7 Nguyên Liệu & 5 Cổ Ngữ!","color":"green"}]')
    path = os.path.join(BASE_DIR, "build_evolution_items.mcfunction")
    with open(path, "w", encoding="utf-8") as f:
        f.write("\n".join(lines) + "\n")

# ==============================================================================
# TẠO FILE build_evolution_npc.mcfunction (5 NPC: 3 NPC GỐC + THẦN RÈN VŨ TRỤ + ĐẠI SƯ CỔ NGỮ)
# ==============================================================================
def generate_evolution_npc_mcfunction():
    lines = []
    lines.append("# ==============================================================================")
    lines.append("# XÂY DỰNG QUẦY & TRIỆU HỒI 5 NPC TIẾN HÓA CỔ ĐẠI, VŨ TRỤ & CỔ NGỮ")
    lines.append("# ==============================================================================")
    lines.append("kill @e[type=villager,tag=ancient_evolution_npc]")
    lines.append("fill -8 121 -8 8 126 -4 air")
    lines.append("fill -4 120 -8 4 120 -8 quartz_bricks")
    lines.append("fill -5 120 -7 5 120 -7 quartz_bricks")
    lines.append("fill -6 120 -6 6 120 -6 quartz_bricks")
    lines.append("fill -7 120 -5 7 120 -5 quartz_bricks")
    lines.append("fill -8 120 -4 8 120 -4 quartz_bricks")

    # NPC 1: ĐẠI SƯ LUYỆN KIM (Giữ nguyên 10 công thức gốc + thêm 2 công thức Thâm Uyên & Vĩnh Hằng)
    alch_recipes = [
        f'{{maxUses:999999,buy:{{id:"minecraft:iron_ingot",count:16}},sell:{mat_to_trade_sell(MATERIALS["shard"], 1)}}}',
        f'{{maxUses:999999,buy:{{id:"minecraft:gold_ingot",count:12}},sell:{mat_to_trade_sell(MATERIALS["shard"], 1)}}}',
        f'{{maxUses:999999,buy:{{id:"minecraft:diamond",count:4}},sell:{mat_to_trade_sell(MATERIALS["shard"], 1)}}}',
        f'{{maxUses:999999,buy:{{id:"minecraft:netherite_ingot",count:1}},sell:{mat_to_trade_sell(MATERIALS["shard"], 2)}}}',
        f'{{maxUses:999999,buy:{mat_to_trade_sell(MATERIALS["shard"], 4)},buyB:{{id:"minecraft:diamond",count:8}},sell:{mat_to_trade_sell(MATERIALS["crystal"], 1)}}}',
        f'{{maxUses:999999,buy:{mat_to_trade_sell(MATERIALS["shard"], 8)},buyB:{{id:"minecraft:netherite_ingot",count:1}},sell:{mat_to_trade_sell(MATERIALS["crystal"], 2)}}}',
        f'{{maxUses:999999,buy:{mat_to_trade_sell(MATERIALS["crystal"], 4)},buyB:{mat_to_trade_sell(MATERIALS["demon_heart"], 1)},sell:{mat_to_trade_sell(MATERIALS["void_core"], 1)}}}',
        f'{{maxUses:999999,buy:{mat_to_trade_sell(MATERIALS["void_core"], 4)},buyB:{{id:"minecraft:nether_star",count:1}},sell:{mat_to_trade_sell(MATERIALS["cosmic_essence"], 1)}}}',
        f'{{maxUses:999999,buy:{mat_to_trade_sell(MATERIALS["cosmic_essence"], 2)},buyB:{mat_to_trade_sell(MATERIALS["void_core"], 4)},sell:{mat_to_trade_sell(MATERIALS["warden_heart"], 1)}}}',
        f'{{maxUses:999999,buy:{mat_to_trade_sell(MATERIALS["warden_heart"], 3)},buyB:{mat_to_trade_sell(MATERIALS["cosmic_essence"], 2)},sell:{mat_to_trade_sell(MATERIALS["eternity_singularity"], 1)}}}',
        f'{{maxUses:999999,buy:{mat_to_trade_sell(MATERIALS["sea_scale"], 1)},buyB:{mat_to_trade_sell(MATERIALS["soul_fragment"], 1)},sell:{mat_to_trade_sell(MATERIALS["cosmic_catalyst"], 1)}}}',
        f'{{maxUses:999999,buy:{mat_to_trade_sell(MATERIALS["storm_crystal"], 1)},buyB:{mat_to_trade_sell(MATERIALS["royal_ticket"], 1)},sell:{mat_to_trade_sell(MATERIALS["cosmic_catalyst"], 1)}}}',
        f'{{maxUses:999999,buy:{mat_to_trade_sell(MATERIALS["cosmic_catalyst"], 1)},buyB:{{id:"minecraft:nether_star",count:1}},sell:{mat_to_trade_sell(MATERIALS["cosmic_essence"], 1)}}}'
    ]
    lines.append(f'summon villager -7 121 -55 {{Tags:["ancient_evolution_npc","alchemist_npc"],CustomName:\'{{"text":"❂ Đại Sư Luyện Kim ❂","color":"light_purple","bold":true}}\',CustomNameVisible:1b,NoAI:1b,Invulnerable:1b,PersistenceRequired:1b,Silent:1b,VillagerData:{{profession:cleric,type:plains,level:5}},Offers:{{Recipes:[{",".join(alch_recipes)}]}}}}')

    # NPC 2: THẦN RÈN CÚP & RÌU (Đúng 30 công thức Tier 1..15 để pass 100% test_r1_progression.py)
    tool_recipes = []
    for t in TIER_INFO[:15]:
        tier = t["tier"]
        pick = make_pickaxe(t)
        buy_str = '{id:"minecraft:diamond_pickaxe",count:1}' if tier == 1 else item_to_trade_sell(make_pickaxe(TIER_INFO[tier - 2]))
        tool_recipes.append(f'{{maxUses:999999,buy:{buy_str},buyB:{mat_to_trade_sell(MATERIALS[t["req_type"]], t["req_count"])},sell:{item_to_trade_sell(pick)}}}')
    for t in TIER_INFO[:15]:
        tier = t["tier"]
        axe = make_axe(t)
        buy_str = '{id:"minecraft:diamond_axe",count:1}' if tier == 1 else item_to_trade_sell(make_axe(TIER_INFO[tier - 2]))
        tool_recipes.append(f'{{maxUses:999999,buy:{buy_str},buyB:{mat_to_trade_sell(MATERIALS[t["req_type"]], t["req_count"])},sell:{item_to_trade_sell(axe)}}}')
    lines.append(f'summon villager 0 121 -58 {{Tags:["ancient_evolution_npc","toolsmith_npc"],CustomName:\'{{"text":"⚡ Thần Rèn Cúp & Rìu [T1-15] ⚡","color":"gold","bold":true}}\',CustomNameVisible:1b,NoAI:1b,Invulnerable:1b,PersistenceRequired:1b,Silent:1b,VillagerData:{{profession:toolsmith,type:plains,level:5}},Offers:{{Recipes:[{",".join(tool_recipes)}]}}}}')

    # NPC 3: THẦN RÈN VŨ KHÍ & GIÁP (Đúng 90 công thức Tier 1..15 để pass 100% test_r1_progression.py)
    combat_recipes = []
    for t in TIER_INFO[:15]:
        tier = t["tier"]
        sword = make_sword(t)
        buy_str = '{id:"minecraft:diamond_sword",count:1}' if tier == 1 else item_to_trade_sell(make_sword(TIER_INFO[tier - 2]))
        combat_recipes.append(f'{{maxUses:999999,buy:{buy_str},buyB:{mat_to_trade_sell(MATERIALS[t["req_type"]], t["req_count"])},sell:{item_to_trade_sell(sword)}}}')
    for slot in ["helmet", "chestplate", "leggings", "boots"]:
        for t in TIER_INFO[:15]:
            tier = t["tier"]
            arm = make_armor(t, slot)
            buy_str = f'{{id:"minecraft:diamond_{slot}",count:1}}' if tier == 1 else item_to_trade_sell(make_armor(TIER_INFO[tier - 2], slot))
            combat_recipes.append(f'{{maxUses:999999,buy:{buy_str},buyB:{mat_to_trade_sell(MATERIALS[t["req_type"]], t["req_count"])},sell:{item_to_trade_sell(arm)}}}')
    for t in TIER_INFO[:15]:
        tier = t["tier"]
        bow = make_bow(t)
        buy_str = '{id:"minecraft:bow",count:1}' if tier == 1 else item_to_trade_sell(make_bow(TIER_INFO[tier - 2]))
        combat_recipes.append(f'{{maxUses:999999,buy:{buy_str},buyB:{mat_to_trade_sell(MATERIALS[t["req_type"]], t["req_count"])},sell:{item_to_trade_sell(bow)}}}')
    lines.append(f'summon villager 7 121 -55 {{Tags:["ancient_evolution_npc","weaponsmith_npc"],CustomName:\'{{"text":"⚔ Thần Rèn Vũ Khí & Giáp [T1-15] ⚔","color":"red","bold":true}}\',CustomNameVisible:1b,NoAI:1b,Invulnerable:1b,PersistenceRequired:1b,Silent:1b,VillagerData:{{profession:weaponsmith,type:plains,level:5}},Offers:{{Recipes:[{",".join(combat_recipes)}]}}}}')

    # NPC 4 (MỚI): THẦN RÈN VŨ TRỤ TỐI THƯỢNG [TIER 16-20] (40 Công thức đột phá từ Tier 15 -> Tier 20)
    celestial_recipes = []
    for t in TIER_INFO[15:]:
        tier = t["tier"]
        prev_t = TIER_INFO[tier - 2]
        celestial_recipes.append(f'{{maxUses:999999,buy:{item_to_trade_sell(make_pickaxe(prev_t))},buyB:{mat_to_trade_sell(MATERIALS[t["req_type"]], t["req_count"])},sell:{item_to_trade_sell(make_pickaxe(t))}}}')
    for t in TIER_INFO[15:]:
        tier = t["tier"]
        prev_t = TIER_INFO[tier - 2]
        celestial_recipes.append(f'{{maxUses:999999,buy:{item_to_trade_sell(make_axe(prev_t))},buyB:{mat_to_trade_sell(MATERIALS[t["req_type"]], t["req_count"])},sell:{item_to_trade_sell(make_axe(t))}}}')
    for t in TIER_INFO[15:]:
        tier = t["tier"]
        prev_t = TIER_INFO[tier - 2]
        celestial_recipes.append(f'{{maxUses:999999,buy:{item_to_trade_sell(make_sword(prev_t))},buyB:{mat_to_trade_sell(MATERIALS[t["req_type"]], t["req_count"])},sell:{item_to_trade_sell(make_sword(t))}}}')
    for slot in ["helmet", "chestplate", "leggings", "boots"]:
        for t in TIER_INFO[15:]:
            tier = t["tier"]
            prev_t = TIER_INFO[tier - 2]
            celestial_recipes.append(f'{{maxUses:999999,buy:{item_to_trade_sell(make_armor(prev_t, slot))},buyB:{mat_to_trade_sell(MATERIALS[t["req_type"]], t["req_count"])},sell:{item_to_trade_sell(make_armor(t, slot))}}}')
    for t in TIER_INFO[15:]:
        tier = t["tier"]
        prev_t = TIER_INFO[tier - 2]
        celestial_recipes.append(f'{{maxUses:999999,buy:{item_to_trade_sell(make_bow(prev_t))},buyB:{mat_to_trade_sell(MATERIALS[t["req_type"]], t["req_count"])},sell:{item_to_trade_sell(make_bow(t))}}}')
    lines.append(f'summon villager 4 121 -57 {{Tags:["ancient_evolution_npc","celestial_smith_npc"],CustomName:\'{{"text":"🌌 Thần Rèn Vũ Trụ [Tier 16-20] 🌌","color":"light_purple","bold":true}}\',CustomNameVisible:1b,NoAI:1b,Invulnerable:1b,PersistenceRequired:1b,Silent:1b,VillagerData:{{profession:armorer,type:snow,level:5}},Offers:{{Recipes:[{",".join(celestial_recipes)}]}}}}')

    # NPC 5 (MỚI): ĐẠI SƯ CỔ NGỮ & BÙA HỘ MỆNH
    talisman_recipes = [
        f'{{maxUses:999999,buy:{mat_to_trade_sell(MATERIALS["shard"], 16)},buyB:{{id:"minecraft:gold_block",count:8}},sell:{mat_to_trade_sell(TALISMANS["miner"], 1)}}}',
        f'{{maxUses:999999,buy:{mat_to_trade_sell(MATERIALS["crystal"], 8)},buyB:{{id:"minecraft:diamond_block",count:4}},sell:{mat_to_trade_sell(TALISMANS["warrior"], 1)}}}',
        f'{{maxUses:999999,buy:{mat_to_trade_sell(MATERIALS["demon_heart"], 1)},buyB:{mat_to_trade_sell(MATERIALS["crystal"], 12)},sell:{mat_to_trade_sell(TALISMANS["fortune"], 1)}}}',
        f'{{maxUses:999999,buy:{mat_to_trade_sell(MATERIALS["void_core"], 1)},buyB:{mat_to_trade_sell(MATERIALS["demon_heart"], 2)},sell:{mat_to_trade_sell(TALISMANS["immortal"], 1)}}}',
        f'{{maxUses:999999,buy:{mat_to_trade_sell(TALISMANS["fortune"], 1)},buyB:{mat_to_trade_sell(TALISMANS["immortal"], 1)},sell:{mat_to_trade_sell(TALISMANS["genesis"], 1)}}}'
    ]
    lines.append(f'summon villager -4 121 -57 {{Tags:["ancient_evolution_npc","talisman_master_npc"],CustomName:\'{{"text":"🔮 Đại Sư Cổ Ngữ (/bua) 🔮","color":"aqua","bold":true}}\',CustomNameVisible:1b,NoAI:1b,Invulnerable:1b,PersistenceRequired:1b,Silent:1b,VillagerData:{{profession:cartographer,type:savanna,level:5}},Offers:{{Recipes:[{",".join(talisman_recipes)}]}}}}')

    lines.append('tellraw @a [{"text":"[Skyblock] ","color":"gold","bold":true},{"text":"Điện Thần Rèn Cổ Đại, Thần Rèn Vũ Trụ [Tier 16-20] & Đại Sư Cổ Ngữ đã thức tỉnh tại /warp trade!","color":"green"}]')
    path = os.path.join(BASE_DIR, "build_evolution_npc.mcfunction")
    with open(path, "w", encoding="utf-8") as f:
        f.write("\n".join(lines) + "\n")

# ==============================================================================
# TẠO HỆ THỐNG ĐẤU TRƯỜNG BOSS 5 & BOSS 6 VÀ CẬP NHẬT SẢNH BOSS
# ==============================================================================
def generate_boss_5_and_6_files():
    boss_dir = os.path.join(BASE_DIR, "boss")
    os.makedirs(boss_dir, exist_ok=True)

    wh_snbt_sell = mat_to_trade_sell(MATERIALS["warden_heart"], 1)
    wh_give = mat_to_give_snbt(MATERIALS["warden_heart"])
    es_snbt_sell = mat_to_trade_sell(MATERIALS["eternity_singularity"], 1)
    es_give = mat_to_give_snbt(MATERIALS["eternity_singularity"])

    # 1. summon_boss_5.mcfunction (Cổ Thần Thâm Uyên - 2,500 HP tại X=35, Y=111, Z=115)
    s5 = f"""# ==============================================================================
# TRIỆU HỒI BOSS CẤP 5: CỔ THẦN THÂM UYÊN (ANCIENT WARDEN MONARCH - 2500 HP)
# Vị trí: Thâm Uyên Cổ Điện Đông Nam (X=35, Y=111, Z=115)
# ==============================================================================
scoreboard players set #boss_5_alive boss_status 0
kill @e[tag=boss_5]
kill @e[tag=minion_boss_5]

playsound minecraft:entity.warden.emerge master @a 35 111 115 5.0 0.8
playsound minecraft:entity.warden.roar master @a 35 111 115 5.0 0.7
particle minecraft:sculk_soul 35 112 115 3 2 3 0.2 200 normal
particle minecraft:sonic_boom 35 112 115 0 0 0 0 1 normal

title @a times 10 80 20
title @a title {{"text":"💠 CỔ THẦN THÂM UYÊN 💠","color":"dark_aqua","bold":true}}
title @a subtitle {{"text":"MYTHIC BOSS CẤP 5 (2500 HP) ĐÃ THỨC TỈNH TẠI /BOSS5!","color":"aqua"}}
tellraw @a [{{"text":"[BOSS CẤP 5] ","color":"dark_aqua","bold":true}},{{"text":"CỔ THẦN THÂM UYÊN (2500 HP) đã trỗi dậy tại Đấu Trường 5! Hạ gục để nhận 100% TRÁI TIM THÂM UYÊN (Đột phá Tier 16-18) & +$35,000 Số Dư!","color":"aqua"}}]

summon wither_skeleton 35 111 115 {{Tags:["server_boss","boss_5"],CustomName:'{{"text":"💠 CỔ THẦN THÂM UYÊN 💠 [2500 HP]","color":"dark_aqua","bold":true}}',CustomNameVisible:1b,Glowing:1b,PersistenceRequired:1b,attributes:[{{id:"minecraft:max_health",base:2500.0}},{{id:"minecraft:attack_damage",base:32.0}},{{id:"minecraft:movement_speed",base:0.38}},{{id:"minecraft:knockback_resistance",base:1.0}},{{id:"minecraft:scale",base:1.45}}],Health:2500f,HandItems:[{{id:"minecraft:netherite_axe",count:1,components:{{"minecraft:enchantments":{{levels:{{"minecraft:sharpness":12}}}},"minecraft:custom_name":'{{"text":"Búa Chiến Thâm Uyên","color":"dark_aqua","bold":true}}'}}}},{wh_snbt_sell}],ArmorItems:[{{id:"minecraft:netherite_boots",count:1}},{{id:"minecraft:netherite_leggings",count:1}},{{id:"minecraft:netherite_chestplate",count:1}},{{id:"minecraft:sculk_shrieker",count:1}}],HandDropChances:[0.3f,1.0f],ArmorDropChances:[0.0f,0.0f,0.0f,0.0f]}}
scoreboard players set #boss_5_alive boss_status 1

effect give @a[x=25,y=108,z=100,dx=22,dy=20,dz=30] minecraft:darkness 6 0 true
summon phantom 35 118 115 {{Tags:["minion_boss_5"],CustomName:'{{"text":"Hồn Ma Thâm Uyên","color":"aqua"}}',CustomNameVisible:1b}}
summon stray 32 111 113 {{Tags:["minion_boss_5"],CustomName:'{{"text":"Xạ Thủ Thâm Uyên","color":"dark_aqua"}}',CustomNameVisible:1b}}
summon stray 38 111 117 {{Tags:["minion_boss_5"],CustomName:'{{"text":"Xạ Thủ Thâm Uyên","color":"dark_aqua"}}',CustomNameVisible:1b}}
"""
    with open(os.path.join(BASE_DIR, "summon_boss_5.mcfunction"), "w", encoding="utf-8") as f:
        f.write(s5)

    # 2. summon_boss_6.mcfunction (Hoàng Đế Tinh Tú - 5,000 HP tại X=0, Y=137, Z=115)
    s6 = f"""# ==============================================================================
# TRIỆU HỒI BOSS CẤP 6: HOÀNG ĐẾ TINH TÚ VĨNH HẰNG (COSMIC EMPEROR - 5000 HP)
# Vị trí: Thiên Cung Sáng Thế (X=0, Y=137, Z=115)
# ==============================================================================
scoreboard players set #boss_6_alive boss_status 0
kill @e[tag=boss_6]
kill @e[tag=minion_boss_6]

playsound minecraft:entity.ender_dragon.growl master @a 0 137 115 5.0 0.6
playsound minecraft:block.end_portal.spawn master @a 0 137 115 5.0 1.0
particle minecraft:end_rod 0 138 115 4 3 4 0.3 300 normal
particle minecraft:explosion_emitter 0 138 115 0 0 0 0 1 normal

title @a times 10 90 20
title @a title {{"text":"🌌 HOÀNG ĐẾ TINH TÚ 🌌","color":"gold","bold":true}}
title @a subtitle {{"text":"SUPREME BOSS CẤP 6 (5000 HP) ĐÃ GIÁNG LÂM TẠI /BOSS6!","color":"light_purple"}}
tellraw @a [{{"text":"[SUPREME BOSS CẤP 6] ","color":"gold","bold":true}},{{"text":"HOÀNG ĐẾ TINH TÚ VĨNH HẰNG (5000 HP) đã giáng lâm tại Thiên Cung Sáng Thế (/boss6)! Hạ gục nhận 100% DỊ ĐIỂM VĨNH HẰNG (Đột phá Tier 19-20 MAX) & +$75,000 Số Dư!","color":"yellow"}}]

summon wither_skeleton 0 137 115 {{Tags:["server_boss","boss_6"],CustomName:'{{"text":"🌌 HOÀNG ĐẾ TINH TÚ VĨNH HẰNG 🌌 [5000 HP]","color":"gold","bold":true}}',CustomNameVisible:1b,Glowing:1b,PersistenceRequired:1b,attributes:[{{id:"minecraft:max_health",base:5000.0}},{{id:"minecraft:attack_damage",base:42.0}},{{id:"minecraft:movement_speed",base:0.40}},{{id:"minecraft:knockback_resistance",base:1.0}},{{id:"minecraft:scale",base:1.65}}],Health:5000f,HandItems:[{{id:"minecraft:mace",count:1,components:{{"minecraft:enchantments":{{levels:{{"minecraft:sharpness":15,"minecraft:wind_burst":3}}}},"minecraft:custom_name":'{{"text":"Quyền Trượng Sáng Thế","color":"gold","bold":true}}'}}}},{es_snbt_sell}],ArmorItems:[{{id:"minecraft:netherite_boots",count:1}},{{id:"minecraft:netherite_leggings",count:1}},{{id:"minecraft:netherite_chestplate",count:1}},{{id:"minecraft:beacon",count:1}}],HandDropChances:[0.2f,1.0f],ArmorDropChances:[0.0f,0.0f,0.0f,0.0f]}}
scoreboard players set #boss_6_alive boss_status 1

summon blaze -4 137 113 {{Tags:["minion_boss_6"],CustomName:'{{"text":"Tinh Linh Mặt Trời","color":"gold"}}',CustomNameVisible:1b}}
summon blaze 4 137 113 {{Tags:["minion_boss_6"],CustomName:'{{"text":"Tinh Linh Mặt Trời","color":"gold"}}',CustomNameVisible:1b}}
summon breeze 0 137 119 {{Tags:["minion_boss_6"],CustomName:'{{"text":"Cuồng Phong Tinh Tú","color":"aqua"}}',CustomNameVisible:1b}}
"""
    with open(os.path.join(BASE_DIR, "summon_boss_6.mcfunction"), "w", encoding="utf-8") as f:
        f.write(s6)

    # 3. boss_5_defeated & announce_boss_5
    b5_def = """scoreboard players set #boss_5_alive boss_status 0
execute in minecraft:overworld as @p[x=23,y=108,z=98,dx=24,dy=20,dz=34] at @s run function skyblock:boss/announce_boss_5
execute in minecraft:overworld unless entity @p[x=23,y=108,z=98,dx=24,dy=20,dz=34] as @p[x=35,y=111,z=115,distance=..45] at @s run function skyblock:boss/announce_boss_5
"""
    with open(os.path.join(boss_dir, "boss_5_defeated.mcfunction"), "w", encoding="utf-8") as f:
        f.write(b5_def)

    ann5 = f"""title @a times 10 90 20
title @a title {{"text":"💠 CỔ THẦN THÂM UYÊN ĐÃ BẠI TRẬN! 💠","color":"dark_aqua","bold":true}}
title @a subtitle [{{"text":"Chiến thần ","color":"gold"}},{{"selector":"@s","color":"aqua","bold":true}},{{"text":" đã chinh phục Thâm Uyên!","color":"yellow"}}]
tellraw @a [{{"text":"\n═══════════════════════════════════════════════\n","color":"dark_aqua","bold":true}},{{"text":"✦ CHIẾN TÍCH THẦN THOẠI - BOSS CẤP 5 BỊ TIÊU DIỆT! ✦\n","color":"gold","bold":true}},{{"selector":"@s","color":"aqua","bold":true}},{{"text":" đã hạ gục CỔ THẦN THÂM UYÊN (2500 HP), nhận 1x Trái Tim Thâm Uyên & +$35,000 Số Dư!\n","color":"yellow"}},{{"text":"═══════════════════════════════════════════════\n","color":"dark_aqua","bold":true}}]
give @s {wh_give} 1
give @s ominous_trial_key[custom_data={{crate_key:"mythic"}},item_name='{{"text":"Chìa Khóa Thần Thoại","color":"light_purple","bold":true}}'] 1
scoreboard players add @s eco_add 35000
scoreboard players add @s gems_add 300
execute as @a[distance=1..60] at @s run function skyblock:boss/party_reward_boss_5
experience add @s 5000 points
playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 2.0 1.1
"""
    with open(os.path.join(boss_dir, "announce_boss_5.mcfunction"), "w", encoding="utf-8") as f:
        f.write(ann5)

    # 4. boss_6_defeated & announce_boss_6
    b6_def = """scoreboard players set #boss_6_alive boss_status 0
execute in minecraft:overworld as @p[x=-20,y=134,z=98,dx=40,dy=25,dz=34] at @s run function skyblock:boss/announce_boss_6
execute in minecraft:overworld unless entity @p[x=-20,y=134,z=98,dx=40,dy=25,dz=34] as @p[x=0,y=137,z=115,distance=..50] at @s run function skyblock:boss/announce_boss_6
"""
    with open(os.path.join(boss_dir, "boss_6_defeated.mcfunction"), "w", encoding="utf-8") as f:
        f.write(b6_def)

    ann6 = f"""title @a times 10 100 20
title @a title {{"text":"🌌 HOÀNG ĐẾ TINH TÚ ĐÃ QUY HÀNG! 🌌","color":"gold","bold":true}}
title @a subtitle [{{"text":"Chúa Tể Vĩnh Hằng ","color":"light_purple"}},{{"selector":"@s","color":"aqua","bold":true}},{{"text":" đã thống trị Thiên Cung!","color":"yellow"}}]
tellraw @a [{{"text":"\n═══════════════════════════════════════════════\n","color":"gold","bold":true}},{{"text":"✦ KỶ NGUYÊN SÁNG THẾ - SUPREME BOSS CẤP 6 BỊ HẠ GỤC! ✦\n","color":"light_purple","bold":true}},{{"selector":"@s","color":"aqua","bold":true}},{{"text":" đã đả bại HOÀNG ĐẾ TINH TÚ VĨNH HẰNG (5000 HP), nhận 1x Dị Điểm Vĩnh Hằng (Rèn Tier 19-20 MAX), 2 Chìa Khóa Thần Thoại & +$75,000 Số Dư!\n","color":"yellow"}},{{"text":"═══════════════════════════════════════════════\n","color":"gold","bold":true}}]
give @s {es_give} 1
give @s ominous_trial_key[custom_data={{crate_key:"mythic"}},item_name='{{"text":"Chìa Khóa Thần Thoại","color":"light_purple","bold":true}}'] 2
scoreboard players add @s eco_add 75000
scoreboard players add @s gems_add 500
execute as @a[distance=1..60] at @s run function skyblock:boss/party_reward_boss_6
experience add @s 10000 points
tag @s add title_void
tag @s add title_tier15
playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 2.0 1.0
playsound minecraft:entity.ender_dragon.death master @a ~ ~ ~ 1.2 1.1
"""
    with open(os.path.join(boss_dir, "announce_boss_6.mcfunction"), "w", encoding="utf-8") as f:
        f.write(ann6)

    # 5. Cập nhật boss/hunter_menu.mcfunction hiển thị đủ 6 Boss
    hunter_menu = """# ==============================================================================
# MENU TƯƠNG TÁC THỢ SĂN BOSS (6 ĐẤU TRƯỜNG BOSS TỪ CẤP 1 ĐẾN CẤP 6)
# ==============================================================================
tellraw @s [{"text":"═══════════════════════════════════════════════════════\n","color":"gold","bold":true},{"text":"        ⚔ ĐẠI ĐIỆN THỢ SĂN 6 BOSS HUYỀN THOẠI ⚔\n","color":"red","bold":true},{"text":"═══════════════════════════════════════════════════════\n","color":"gold","bold":true},{"text":"1. ","color":"gray"},{"text":"🕷 ĐỘNG NỮ HOÀNG NHỆN (150 HP) ","color":"green","bold":true},{"text":"➔ Rơi: Mảnh Cổ Đại (Tier 1-5)\n   ","color":"aqua"},{"text":"[▶ DỊCH CHUYỂN ĐẤU TRƯỜNG 1 (/WARP BOSS1)]\n","color":"yellow","bold":true,"clickEvent":{"action":"run_command","value":"/warp boss1"}},{"text":"2. ","color":"gray"},{"text":"🔥 VỰC ĐAO PHỦ ĐỊA NGỤC (300 HP) ","color":"red","bold":true},{"text":"➔ Rơi: Tinh Thể Cổ Đại (Tier 6-9)\n   ","color":"light_purple"},{"text":"[▶ DỊCH CHUYỂN ĐẤU TRƯỜNG 2 (/WARP BOSS2)]\n","color":"yellow","bold":true,"clickEvent":{"action":"run_command","value":"/warp boss2"}},{"text":"3. ","color":"gray"},{"text":"🏰 THÀNH TRÌ CHÚA TỂ BÓNG TỐI (600 HP) ","color":"dark_red","bold":true},{"text":"➔ Rơi: Trái Tim Quỷ (Tier 10-12)\n   ","color":"red"},{"text":"[▶ DỊCH CHUYỂN ĐẤU TRƯỜNG 3 (/WARP BOSS3)]\n","color":"yellow","bold":true,"clickEvent":{"action":"run_command","value":"/warp boss3"}},{"text":"4. ","color":"gray"},{"text":"🌀 THÁNH ĐỊA HƯ KHÔNG (1200 HP) ","color":"dark_purple","bold":true},{"text":"➔ Rơi: Lõi Hư Không (Tier 13-15)\n   ","color":"light_purple"},{"text":"[▶ DỊCH CHUYỂN ĐẤU TRƯỜNG 4 (/WARP BOSS4)]\n","color":"yellow","bold":true,"clickEvent":{"action":"run_command","value":"/warp boss4"}},{"text":"5. ","color":"gray"},{"text":"💠 THÂM UYÊN CỔ THẦN (2500 HP) ","color":"dark_aqua","bold":true},{"text":"➔ Rơi: Trái Tim Thâm Uyên (Tier 16-18)\n   ","color":"aqua"},{"text":"[▶ DỊCH CHUYỂN ĐẤU TRƯỜNG 5 (/BOSS5)]\n","color":"aqua","bold":true,"clickEvent":{"action":"run_command","value":"/boss5"}},{"text":"6. ","color":"gray"},{"text":"🌌 THIÊN CUNG SÁNG THẾ (5000 HP) ","color":"gold","bold":true},{"text":"➔ Rơi: Dị Điểm Vĩnh Hằng (Tier 19-20 MAX)\n   ","color":"yellow"},{"text":"[▶ DỊCH CHUYỂN ĐẤU TRƯỜNG 6 (/BOSS6)]\n","color":"gold","bold":true,"clickEvent":{"action":"run_command","value":"/boss6"}},{"text":"═══════════════════════════════════════════════════════","color":"gold","bold":true}]
playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 1.0 1.2
"""
    with open(os.path.join(boss_dir, "hunter_menu.mcfunction"), "w", encoding="utf-8") as f:
        f.write(hunter_menu)

    # 6. Mở rộng build_boss_multi.mcfunction để xây thêm Đấu Trường 5 (X=25..45, Z=100..130, Y=110) và Đấu Trường 6 (X=-18..18, Y=136, Z=100..130)
    boss_multi_path = os.path.join(BASE_DIR, "build_boss_multi.mcfunction")
    if os.path.exists(boss_multi_path):
        with open(boss_multi_path, "r", encoding="utf-8") as f:
            bm_text = f.read()
        marker = "# 9. Thông báo hoàn tất"
        extra_arenas = """# 8B. Cầu Xích & Đại Điện 5: Thâm Uyên Cổ Thần (Mythic Boss Tier 5 - Đông Nam X: 25..45, Z: 100..130)
fill 22 110 84 28 110 86 deepslate_tile_slab[type=top]
fill 24 110 86 28 110 100 deepslate_tile_slab[type=top]
fill 25 110 100 45 110 130 deepslate_tiles
fill 27 110 102 43 110 128 sculk
fill 30 110 106 40 110 124 reinforced_deepslate
fill 32 110 109 38 110 121 sea_lantern
fill 25 111 100 45 114 100 deepslate_tile_wall
fill 25 111 130 45 114 130 deepslate_tile_wall
fill 25 111 100 25 114 130 deepslate_tile_wall
fill 45 111 100 45 114 130 deepslate_tile_wall
fill 25 111 101 25 113 104 air
fill 27 111 102 27 117 102 chiseled_deepslate
setblock 27 118 102 soul_lantern
fill 43 111 102 43 117 102 chiseled_deepslate
setblock 43 118 102 soul_lantern
fill 27 111 128 27 117 128 chiseled_deepslate
setblock 27 118 128 soul_lantern
fill 43 111 128 43 117 128 chiseled_deepslate
setblock 43 118 128 soul_lantern
setblock 35 110 115 sculk_catalyst
setblock 35 111 115 sculk_shrieker
setblock 27 111 103 command_block{Command:"function skyblock:summon_boss_5"}
setblock 27 112 103 chiseled_deepslate
setblock 27 113 103 stone_button[face=floor,facing=north]
setblock 28 112 102 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:['{"text":"💠 THÂM UYÊN ĐIỆN 💠","color":"dark_aqua","bold":true}','{"text":"Boss Cấp 5 (2500 HP)","color":"aqua"}','{"text":"Bấm nút trên trụ đá","color":"yellow"}','{"text":"để TRIỆU HỒI BOSS!","color":"red"}']}}
setblock 26 110 101 polished_blackstone_pressure_plate
setblock 26 112 100 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:['{"text":"[ VỀ SẢNH ]","color":"gold","bold":true}','{"text":"Cổng Rút Lui","color":"yellow"}','{"text":"Bước lên đĩa để","color":"aqua"}','{"text":"VỀ SẢNH TRUNG TÂM","color":"green","bold":true}']}}

# 8C. Đại Điện 6: Thiên Cung Sáng Thế (Supreme Boss Tier 6 - Tầng Trời Y=136, X: -18..18, Z: 100..130)
fill -18 136 100 18 136 130 smooth_quartz
fill -15 136 103 15 136 127 quartz_bricks
fill -10 136 108 10 136 122 gold_block
fill -5 136 111 5 136 119 sea_lantern
fill -18 137 100 18 140 100 yellow_stained_glass
fill -18 137 130 18 140 130 yellow_stained_glass
fill -18 137 100 -18 140 130 yellow_stained_glass
fill 18 137 100 18 140 130 yellow_stained_glass
fill -16 137 102 -16 143 102 quartz_pillar
setblock -16 144 102 end_rod
fill 16 137 102 16 143 102 quartz_pillar
setblock 16 144 102 end_rod
fill -16 137 128 -16 143 128 quartz_pillar
setblock -16 144 128 end_rod
fill 16 137 128 16 143 128 quartz_pillar
setblock 16 144 128 end_rod
setblock 0 136 115 beacon
setblock 0 137 103 command_block{Command:"function skyblock:summon_boss_6"}
setblock 0 138 103 gold_block
setblock 0 139 103 stone_button[face=floor,facing=north]
setblock -1 138 102 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:['{"text":"🌌 THIÊN CUNG 🌌","color":"gold","bold":true}','{"text":"Boss Cấp 6 (5000 HP)","color":"yellow"}','{"text":"Bấm nút trên trụ vàng","color":"aqua"}','{"text":"để TRIỆU HỒI BOSS!","color":"red"}']}}
setblock 2 137 101 light_weighted_pressure_plate
setblock 2 138 100 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:['{"text":"[ VỀ SẢNH ]","color":"gold","bold":true}','{"text":"Cổng Rút Lui","color":"yellow"}','{"text":"Bước lên đĩa vàng","color":"aqua"}','{"text":"VỀ SẢNH TRUNG TÂM","color":"green","bold":true}']}}

# 9. Thông báo hoàn tất"""
        if "summon_boss_5" not in bm_text and marker in bm_text:
            bm_text = bm_text.replace(marker, extra_arenas)
            with open(boss_multi_path, "w", encoding="utf-8") as f:
                f.write(bm_text)

# ==============================================================================
# ĐẠI TRÙNG TU KIẾN TRÚC /MAYQUANG & 2 SIÊU CÔNG TRÌNH MỚI TRONG /IS BUILDER
# ==============================================================================
def generate_masterpiece_island_structures():
    # 1. Nâng cấp /mayquang thành ĐỀN THẦN KHAI KHOÁNG HOÀNG GIA 8 LINE (Có mái vòm + Bệ đặt Minion Đào)
    ore_gen_content = """# ==============================================================================
# SKYBLOCK - ĐỀN THẦN KHAI KHOÁNG HOÀNG GIA 8 LINE (ROYAL DWARVEN ORE TEMPLE)
# ==============================================================================
# Kiến trúc vòm đá đen mạ vàng & thạch anh chạm khắc, đỉnh tinh thể Thạch Anh Tím,
# Đáy lót Obsidian chống đào thủng, tích hợp BỆ ĐỨNG MINION ĐÀO CHUYÊN DỤNG!
# ==============================================================================

# 1. Âm thanh kích hoạt
execute at @s run playsound minecraft:block.anvil.use master @a ~ ~ ~ 1.5 1.1
execute at @s run playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1.2 1.4

# 2. Dọn sạch không gian (13 x 9 x 9 blocks phía trước người chơi)
execute at @s rotated ~ 0 run fill ^-6 ^-1 ^1 ^6 ^8 ^10 air replace

# 3. Nền móng Đá Đen Viền Vàng & Lõi Obsidian chống cúp nổ đào thủng đảo
execute at @s rotated ~ 0 run fill ^-6 ^-1 ^2 ^6 ^-1 ^9 polished_blackstone_bricks
execute at @s rotated ~ 0 run fill ^-5 ^-1 ^3 ^5 ^-1 ^8 deepslate_tiles
execute at @s rotated ~ 0 run fill ^-4 ^-1 ^5 ^3 ^-1 ^5 obsidian
execute at @s rotated ~ 0 run fill ^-4 ^-1 ^6 ^3 ^-1 ^6 chiseled_polished_blackstone

# 4. Sàn Đứng Đào Thạch Anh Hoàng Gia & Thảm Nhung Đỏ (Z=2..3)
execute at @s rotated ~ 0 run fill ^-5 ^0 ^2 ^4 ^0 ^3 smooth_quartz
execute at @s rotated ~ 0 run fill ^-4 ^1 ^3 ^3 ^1 ^3 smooth_quartz_slab
execute at @s rotated ~ 0 run fill ^-3 ^1 ^2 ^2 ^1 ^2 red_carpet

# BỆ ĐẶT MINION ĐÀO CHUYÊN DỤNG (Tại X=0, Z=3, nhìn thẳng vào ô quặng Kim Cương ^0 ^0 ^5)
execute at @s rotated ~ 0 run setblock ^0 ^0 ^3 chiseled_quartz_block
execute at @s rotated ~ 0 run setblock ^0 ^1 ^3 heavy_weighted_pressure_plate

# 5. Buồng Cấp Nước Pha Lê (Phía sau Z=7..8)
execute at @s rotated ~ 0 run fill ^-5 ^0 ^7 ^4 ^2 ^8 polished_blackstone_bricks
execute at @s rotated ~ 0 run fill ^-4 ^-1 ^7 ^3 ^-1 ^7 sea_lantern
execute at @s rotated ~ 0 run fill ^-4 ^0 ^7 ^3 ^0 ^7 water
execute at @s rotated ~ 0 run fill ^-4 ^1 ^7 ^3 ^2 ^7 cyan_stained_glass

# 6. Buồng Cấp Dung Nham Hỏa Ngọc (Phía trước Z=4)
execute at @s rotated ~ 0 run fill ^-5 ^0 ^4 ^4 ^2 ^4 polished_blackstone_bricks
execute at @s rotated ~ 0 run fill ^-4 ^0 ^4 ^3 ^0 ^4 lava
execute at @s rotated ~ 0 run fill ^-4 ^1 ^4 ^3 ^2 ^4 orange_stained_glass

# 7. Mạch 8 Ô Quặng Tự Sinh Liên Hoàn (Tại Z=5)
execute at @s rotated ~ 0 run fill ^-4 ^0 ^5 ^3 ^0 ^5 iron_ore
execute at @s rotated ~ 0 run setblock ^-4 ^0 ^5 coal_ore
execute at @s rotated ~ 0 run setblock ^-3 ^0 ^5 copper_ore
execute at @s rotated ~ 0 run setblock ^-2 ^0 ^5 gold_ore
execute at @s rotated ~ 0 run setblock ^-1 ^0 ^5 lapis_ore
execute at @s rotated ~ 0 run setblock ^0 ^0 ^5 diamond_ore
execute at @s rotated ~ 0 run setblock ^1 ^0 ^5 emerald_ore
execute at @s rotated ~ 0 run setblock ^2 ^0 ^5 redstone_ore

# 8. 4 Trụ Cột Điêu Khắc Mạ Vàng & Mái Vòm Đền Thần (Y=1..7)
execute at @s rotated ~ 0 run fill ^-5 ^1 ^2 ^-5 ^4 ^2 chiseled_polished_blackstone
execute at @s rotated ~ 0 run fill ^4 ^1 ^2 ^4 ^4 ^2 chiseled_polished_blackstone
execute at @s rotated ~ 0 run fill ^-5 ^1 ^8 ^-5 ^4 ^8 chiseled_polished_blackstone
execute at @s rotated ~ 0 run fill ^4 ^1 ^8 ^4 ^4 ^8 chiseled_polished_blackstone
execute at @s rotated ~ 0 run setblock ^-5 ^3 ^2 gilded_blackstone
execute at @s rotated ~ 0 run setblock ^4 ^3 ^2 gilded_blackstone
execute at @s rotated ~ 0 run setblock ^-5 ^3 ^8 gilded_blackstone
execute at @s rotated ~ 0 run setblock ^4 ^3 ^8 gilded_blackstone

# Gờ Mái Vòm Đa Tầng (Y=4..6)
execute at @s rotated ~ 0 run fill ^-6 ^4 ^2 ^5 ^4 ^2 deepslate_tile_stairs[facing=south]
execute at @s rotated ~ 0 run fill ^-6 ^4 ^8 ^5 ^4 ^8 deepslate_tile_stairs[facing=north]
execute at @s rotated ~ 0 run fill ^-5 ^5 ^3 ^4 ^5 ^7 deepslate_tiles
execute at @s rotated ~ 0 run fill ^-4 ^6 ^4 ^3 ^6 ^6 smooth_quartz_slab
execute at @s rotated ~ 0 run setblock ^-1 ^6 ^5 amethyst_block
execute at @s rotated ~ 0 run setblock ^0 ^6 ^5 amethyst_block
execute at @s rotated ~ 0 run setblock ^-1 ^7 ^5 amethyst_cluster[facing=up]
execute at @s rotated ~ 0 run setblock ^0 ^7 ^5 amethyst_cluster[facing=up]

# Đèn Chùm Linh Hồn & Đèn Lồng Chiếu Sáng
execute at @s rotated ~ 0 run setblock ^-2 ^4 ^5 soul_lantern[hanging=true]
execute at @s rotated ~ 0 run setblock ^1 ^4 ^5 soul_lantern[hanging=true]
execute at @s rotated ~ 0 run setblock ^-5 ^2 ^1 lantern
execute at @s rotated ~ 0 run setblock ^4 ^2 ^1 lantern

# 9. Khu Tiện Ích Thợ Mỏ: Rương Đôi, Bàn Chế Tạo, Lò Luyện Kim & Đe Sắt
execute at @s rotated ~ 0 run setblock ^-5 ^0 ^2 chest[facing=south,type=left]
execute at @s rotated ~ 0 run setblock ^-4 ^0 ^2 chest[facing=south,type=right]
execute at @s rotated ~ 0 run setblock ^3 ^0 ^2 blast_furnace[facing=south]
execute at @s rotated ~ 0 run setblock ^4 ^0 ^2 crafting_table
execute at @s rotated ~ 0 run setblock ^4 ^1 ^2 anvil[facing=south]

# Biển hướng dẫn đặt Minion Đào
execute at @s rotated ~ 0 run setblock ^-5 ^2 ^2 oak_wall_sign[facing=south]{front_text:{has_glowing_text:1b,messages:['{"text":"[ ĐẶT MINION ]","color":"gold","bold":true}','{"text":"Đứng lên đĩa sắt","color":"yellow"}','{"text":"nhìn vào quặng","color":"aqua"}','{"text":"Gõ /is minions","color":"green","bold":true}']}}

# 10. Pháo hoa & Thông báo
execute at @s rotated ~ 0 run summon firework_rocket ^0 ^3 ^5 {LifeTime:20,FireworksItem:{id:"firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"burst",has_twinkle:1b,colors:[16766720,65535,3847130]}]}}}}
tellraw @s [{"text":"\n⛏️🏛️ [ĐỀN THẦN KHAI KHOÁNG HOÀNG GIA 8 LINE] ","color":"gold","bold":true},{"text":"Đã khánh thành công trình đào quặng thế hệ mới!\n","color":"yellow"},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n","color":"dark_gray"},{"text":"✨ KIẾN TRÚC MỚI: ","color":"aqua","bold":true},{"text":"Mái vòm Đá Đen Mạ Vàng & Thạch Anh, Đỉnh Tinh Thể Tím, Rương Đôi, Lò Luyện Kim & Đe Sắt!\n","color":"white"},{"text":"🤖 TƯƠNG THÍCH MINION 100%: ","color":"green","bold":true},{"text":"Hãy đứng lên Đĩa Cân Sắt ở giữa, nhìn vào dãy quặng và bấm ","color":"yellow"},{"text":"[📍 Đặt Tới Đây]","color":"aqua","bold":true,"clickEvent":{"action":"run_command","value":"/is minions"}},{"text":" trong /is minions để Minion tự động vung cúp đập quặng liên tục!\n","color":"yellow"},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"}]
"""
    with open(os.path.join(BASE_DIR, "build_ore_generator.mcfunction"), "w", encoding="utf-8") as f:
        f.write(ore_gen_content)

    # 2. Tạo 2 Siêu Công Trình Mới trong builder/: build_palace.mcfunction & build_dragonforge.mcfunction
    builder_dir = os.path.join(BASE_DIR, "builder")
    os.makedirs(builder_dir, exist_ok=True)

    palace_mc = """# ==============================================================================
# SKYBLOCK BUILDER - CUNG ĐIỆN LƯU LY CHÂN KHÔNG HOÀNG GIA (CELESTIAL SKY PALACE)
# Kích thước: 19x19 x H16 blocks | Chi phí: $100,000 Xu Vault
# ==============================================================================
execute at @s run playsound minecraft:block.beacon.activate master @a ~ ~ ~ 1.5 1.2
execute at @s run playsound minecraft:ui.toast.challenge_complete player @s ~ ~ ~ 1.2 1.2

# 1. Nền móng & Bậc thềm Cẩm Thạch Vàng (19x19 tại Y=-1..0)
execute at @s rotated ~ 0 run fill ^-9 ^-1 ^2 ^9 ^15 ^20 air
execute at @s rotated ~ 0 run fill ^-9 ^-1 ^2 ^9 ^-1 ^20 polished_blackstone_bricks
execute at @s rotated ~ 0 run fill ^-8 ^0 ^3 ^8 ^0 ^19 smooth_quartz
execute at @s rotated ~ 0 run fill ^-6 ^0 ^5 ^6 ^0 ^17 chiseled_quartz_block
execute at @s rotated ~ 0 run fill ^-2 ^0 ^3 ^2 ^0 ^19 yellow_carpet

# Bậc tam cấp thạch anh 4 phía
execute at @s rotated ~ 0 run fill ^-9 ^0 ^2 ^9 ^0 ^2 smooth_quartz_stairs[facing=south]
execute at @s rotated ~ 0 run fill ^-9 ^0 ^20 ^9 ^0 ^20 smooth_quartz_stairs[facing=north]
execute at @s rotated ~ 0 run fill ^-9 ^0 ^3 ^-9 ^0 ^19 smooth_quartz_stairs[facing=east]
execute at @s rotated ~ 0 run fill ^9 ^0 ^3 ^9 ^0 ^19 smooth_quartz_stairs[facing=west]

# 2. 8 Đại Trụ Thạch Anh Khảm Vàng Hoàng Gia (Y=1..7)
for_coords = [("-7","4"),("7","4"),("-7","18"),("7","18"),("-7","11"),("7","11"),("-3","4"),("3","4")]
execute at @s rotated ~ 0 run fill ^-7 ^1 ^4 ^-7 ^7 ^4 quartz_pillar
execute at @s rotated ~ 0 run fill ^7 ^1 ^4 ^7 ^7 ^4 quartz_pillar
execute at @s rotated ~ 0 run fill ^-7 ^1 ^18 ^-7 ^7 ^18 quartz_pillar
execute at @s rotated ~ 0 run fill ^7 ^1 ^18 ^7 ^7 ^18 quartz_pillar
execute at @s rotated ~ 0 run fill ^-7 ^1 ^11 ^-7 ^7 ^11 quartz_pillar
execute at @s rotated ~ 0 run fill ^7 ^1 ^11 ^7 ^7 ^11 quartz_pillar
execute at @s rotated ~ 0 run setblock ^-7 ^4 ^4 gold_block
execute at @s rotated ~ 0 run setblock ^7 ^4 ^4 gold_block
execute at @s rotated ~ 0 run setblock ^-7 ^4 ^18 gold_block
execute at @s rotated ~ 0 run setblock ^7 ^4 ^18 gold_block

# Tường Kính Ngọc Bích & Khung Vàng (Y=1..6)
execute at @s rotated ~ 0 run fill ^-6 ^1 ^18 ^6 ^6 ^18 cyan_stained_glass
execute at @s rotated ~ 0 run fill ^-7 ^1 ^5 ^-7 ^6 ^17 cyan_stained_glass
execute at @s rotated ~ 0 run fill ^7 ^1 ^5 ^7 ^6 ^17 cyan_stained_glass

# 3. Đài Phun Nước Pha Lê Trung Tâm & Ngai Vàng Thiên Đế
execute at @s rotated ~ 0 run fill ^-2 ^0 ^9 ^2 ^0 ^13 sea_lantern
execute at @s rotated ~ 0 run setblock ^0 ^1 ^11 amethyst_block
execute at @s rotated ~ 0 run setblock ^0 ^2 ^11 end_rod
execute at @s rotated ~ 0 run fill ^-3 ^1 ^15 ^3 ^1 ^17 gold_block
execute at @s rotated ~ 0 run setblock ^0 ^2 ^16 smooth_quartz_stairs[facing=north]
execute at @s rotated ~ 0 run setblock ^-2 ^2 ^16 ender_chest[facing=north]
execute at @s rotated ~ 0 run setblock ^2 ^2 ^16 enchanting_table

# 4. Mái Vòm Lưu Ly 3 Tầng Cong Vút (Dark Prismarine & Gold Trim Y=7..14)
execute at @s rotated ~ 0 run fill ^-9 ^7 ^2 ^9 ^7 ^20 dark_prismarine_slab
execute at @s rotated ~ 0 run fill ^-8 ^8 ^3 ^8 ^8 ^19 dark_prismarine
execute at @s rotated ~ 0 run fill ^-6 ^9 ^5 ^6 ^9 ^17 smooth_quartz
execute at @s rotated ~ 0 run fill ^-7 ^10 ^4 ^7 ^10 ^18 dark_prismarine_slab
execute at @s rotated ~ 0 run fill ^-5 ^11 ^6 ^5 ^11 ^16 dark_prismarine
execute at @s rotated ~ 0 run fill ^-3 ^12 ^8 ^3 ^12 ^14 gold_block
execute at @s rotated ~ 0 run fill ^-1 ^13 ^10 ^1 ^13 ^12 sea_lantern
execute at @s rotated ~ 0 run setblock ^0 ^14 ^11 beacon
execute at @s rotated ~ 0 run setblock ^0 ^15 ^11 end_rod

# Đèn lồng treo 4 góc mái
execute at @s rotated ~ 0 run setblock ^-9 ^6 ^2 lantern[hanging=true]
execute at @s rotated ~ 0 run setblock ^9 ^6 ^2 lantern[hanging=true]
execute at @s rotated ~ 0 run setblock ^-9 ^6 ^20 lantern[hanging=true]
execute at @s rotated ~ 0 run setblock ^9 ^6 ^20 lantern[hanging=true]

execute at @s rotated ~ 0 run summon firework_rocket ^0 ^12 ^11 {LifeTime:25,FireworksItem:{id:"firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"large_ball",has_twinkle:1b,colors:[16766720,65535,16711935]}]}}}}
tellraw @s [{"text":"\n🏯👑 [KIẾN TRÚC SƯ ĐẢO] ","color":"gold","bold":true},{"text":"Đã khánh thành tuyệt tác ","color":"yellow"},{"text":"Cung Điện Lưu Ly Chân Không Hoàng Gia (19x19x16)!\n","color":"aqua","bold":true},{"text":"🛡️ Gõ /is undo trong 3 phút nếu muốn hoàn tác nhận lại 90% tiền!","color":"gray"}]
"""
    with open(os.path.join(builder_dir, "build_palace.mcfunction"), "w", encoding="utf-8") as f:
        f.write(palace_mc)
    with open(os.path.join(builder_dir, "undo_palace.mcfunction"), "w", encoding="utf-8") as f:
        f.write("execute at @s rotated ~ 0 run fill ^-9 ^-1 ^2 ^9 ^15 ^20 air\n")

    dragonforge_mc = """# ==============================================================================
# SKYBLOCK BUILDER - ĐỀN RỒNG HẮC ÁM & LÒ LUYỆN TỰ ĐỘNG (BLACK DRAGON FORGE)
# Kích thước: 15x15 x H13 blocks | Chi phí: $85,000 Xu Vault
# ==============================================================================
execute at @s run playsound minecraft:entity.ender_dragon.growl master @a ~ ~ ~ 1.5 0.9
execute at @s run playsound minecraft:block.anvil.use player @s ~ ~ ~ 1.2 0.8

execute at @s rotated ~ 0 run fill ^-7 ^-1 ^2 ^7 ^12 ^16 air
execute at @s rotated ~ 0 run fill ^-7 ^-1 ^2 ^7 ^-1 ^16 polished_blackstone_bricks
execute at @s rotated ~ 0 run fill ^-6 ^0 ^3 ^6 ^0 ^15 deepslate_tiles
execute at @s rotated ~ 0 run fill ^-2 ^0 ^3 ^2 ^0 ^14 crying_obsidian

# 4 Trụ Lửa Hắc Diệu Thạch & Mái Vòm Huyết Long
execute at @s rotated ~ 0 run fill ^-6 ^1 ^3 ^-6 ^7 ^3 obsidian
execute at @s rotated ~ 0 run fill ^6 ^1 ^3 ^6 ^7 ^3 obsidian
execute at @s rotated ~ 0 run fill ^-6 ^1 ^15 ^-6 ^7 ^15 obsidian
execute at @s rotated ~ 0 run fill ^6 ^1 ^15 ^6 ^7 ^15 obsidian
execute at @s rotated ~ 0 run setblock ^-6 ^8 ^3 soul_campfire
execute at @s rotated ~ 0 run setblock ^6 ^8 ^3 soul_campfire
execute at @s rotated ~ 0 run setblock ^-6 ^8 ^15 soul_campfire
execute at @s rotated ~ 0 run setblock ^6 ^8 ^15 soul_campfire

# Tượng Đầu Rồng Phun Dung Nham vào Hồ Kính Cường Lực (Z=12..14)
execute at @s rotated ~ 0 run fill ^-3 ^1 ^12 ^3 ^4 ^14 polished_blackstone
execute at @s rotated ~ 0 run fill ^-2 ^1 ^12 ^2 ^3 ^13 lava
execute at @s rotated ~ 0 run fill ^-2 ^1 ^11 ^2 ^3 ^11 orange_stained_glass
execute at @s rotated ~ 0 run setblock ^0 ^5 ^11 dragon_head[rotation=0]
execute at @s rotated ~ 0 run setblock ^-2 ^5 ^11 end_rod
execute at @s rotated ~ 0 run setblock ^2 ^5 ^11 end_rod

# Dàn 8 Lò Luyện Kim Siêu Tốc + 4 Đe Sắt + Bàn Rèn + Rương Đôi
execute at @s rotated ~ 0 run fill ^-5 ^1 ^5 ^-5 ^2 ^8 blast_furnace[facing=east]
execute at @s rotated ~ 0 run fill ^5 ^1 ^5 ^5 ^2 ^8 blast_furnace[facing=west]
execute at @s rotated ~ 0 run setblock ^-4 ^1 ^10 anvil[facing=east]
execute at @s rotated ~ 0 run setblock ^4 ^1 ^10 anvil[facing=west]
execute at @s rotated ~ 0 run setblock ^-3 ^1 ^10 smithing_table
execute at @s rotated ~ 0 run setblock ^3 ^1 ^10 grindstone[face=floor,facing=north]
execute at @s rotated ~ 0 run setblock ^0 ^1 ^9 enchanting_table
execute at @s rotated ~ 0 run setblock ^-4 ^1 ^4 ender_chest[facing=south]
execute at @s rotated ~ 0 run setblock ^4 ^1 ^4 chest[facing=south]

# Mái Vòm Đền Rồng (Y=7..11)
execute at @s rotated ~ 0 run fill ^-7 ^7 ^2 ^7 ^7 ^16 polished_blackstone_brick_slab
execute at @s rotated ~ 0 run fill ^-5 ^8 ^4 ^5 ^8 ^14 red_nether_bricks
execute at @s rotated ~ 0 run fill ^-3 ^9 ^6 ^3 ^9 ^12 gilded_blackstone
execute at @s rotated ~ 0 run fill ^-1 ^10 ^8 ^1 ^10 ^10 crying_obsidian
execute at @s rotated ~ 0 run setblock ^0 ^6 ^9 soul_lantern[hanging=true]

execute at @s rotated ~ 0 run summon firework_rocket ^0 ^11 ^9 {LifeTime:25,FireworksItem:{id:"firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"large_ball",colors:[16711680,11141375,16755200]}]}}}}
tellraw @s [{"text":"\n🐉🔥 [KIẾN TRÚC SƯ ĐẢO] ","color":"dark_red","bold":true},{"text":"Đã khánh thành tuyệt tác ","color":"yellow"},{"text":"Đền Rồng Hắc Ám & Tổ Hợp 8 Lò Luyện Kim (15x15x13)!\n","color":"gold","bold":true},{"text":"🛡️ Gõ /is undo trong 3 phút nếu muốn hoàn tác nhận lại 90% tiền!","color":"gray"}]
"""
    with open(os.path.join(builder_dir, "build_dragonforge.mcfunction"), "w", encoding="utf-8") as f:
        f.write(dragonforge_mc)
    with open(os.path.join(builder_dir, "undo_dragonforge.mcfunction"), "w", encoding="utf-8") as f:
        f.write("execute at @s rotated ~ 0 run fill ^-7 ^-1 ^2 ^7 ^12 ^16 air\n")

    # 3. Cập nhật builder/menu.mcfunction thêm 2 siêu kiến trúc mới
    menu_path = os.path.join(builder_dir, "menu.mcfunction")
    if os.path.exists(menu_path):
        with open(menu_path, "r", encoding="utf-8") as f:
            m_txt = f.read()
        if "/is build palace" not in m_txt:
            extra_btn = '{"text":"\n 🌟 [SIÊU KIẾN TRÚC MỚI]: ","color":"gold","bold":true},{"text":"[🏯 Cung Điện Lưu Ly ($100k)] ","color":"aqua","bold":true,"clickEvent":{"action":"run_command","value":"/is build palace"},"hoverEvent":{"action":"show_text","contents":[{"text":"Siêu Cung Điện Lưu Ly 19x19x16 có Đài Phun Nước & Beacon!","color":"aqua"}]}},{"text":" • ","color":"gray"},{"text":"[🐉 Đền Rồng Hắc Ám ($85k)]\n","color":"red","bold":true,"clickEvent":{"action":"run_command","value":"/is build dragonforge"},"hoverEvent":{"action":"show_text","contents":[{"text":"Đền Rồng 15x15x13 tích hợp 8 Lò Luyện Kim, Đe, Bàn Rèn & Phù Phép!","color":"red"}]}},'
            m_txt = m_txt.replace('{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n","color":"dark_gray"}', extra_btn + '{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n","color":"dark_gray"}', 1)
            with open(menu_path, "w", encoding="utf-8") as f:
                f.write(m_txt)

# ==============================================================================
# CẬP NHẬT setup.mcfunction & tick.mcfunction (TÍCH HỢP TIER 16-20, BOSS 5-6 & CỔ NGỮ)
# ==============================================================================
def update_setup_mcfunction():
    path = os.path.join(BASE_DIR, "setup.mcfunction")
    if not os.path.exists(path):
        return
    with open(path, "r", encoding="utf-8") as f:
        content = f.read()
    if "use_bow" not in content:
        content += "\nscoreboard objectives add use_bow minecraft.used:minecraft.bow\n"
        with open(path, "w", encoding="utf-8") as f:
            f.write(content)

def update_tick_mcfunction():
    path = os.path.join(BASE_DIR, "tick.mcfunction")
    if not os.path.exists(path):
        return
    with open(path, "r", encoding="utf-8") as f:
        content = f.read()

    upgrade_block = """
# ==============================================================================
# NÂNG CẤP V2.0: BOSS 5-6, TRANG BỊ VŨ TRỤ TIER 16-20 & HỆ THỐNG CỔ NGỮ (/BUA)
# ==============================================================================
# 1. Kiểm tra Boss 5 & Boss 6 bị tiêu diệt + Bệ rút lui khẩn cấp
execute if score #boss_5_alive boss_status matches 1 unless entity @e[tag=boss_5] run function skyblock:boss/boss_5_defeated
execute if score #boss_6_alive boss_status matches 1 unless entity @e[tag=boss_6] run function skyblock:boss/boss_6_defeated
execute in minecraft:overworld as @a[x=25,y=110,z=100,dx=2,dy=2,dz=2] run teleport @s 0.5 111.0 79.0 0.0 0.0
execute in minecraft:overworld as @a[x=1,y=137,z=100,dx=2,dy=2,dz=2] run teleport @s 0.5 111.0 79.0 0.0 0.0

# 2. Kỹ năng Trang Bị Vũ Trụ Tier 16-20 (Cúp Haste IV, Kiếm Sonic Boom, Cung Mưa Sao Băng, Giáp +10 Tim Vàng)
execute as @a if items entity @s weapon.mainhand *[custom_data~{super_explosive_mining:1b}] run effect give @s minecraft:haste 2 3 true
execute as @a if items entity @s weapon.mainhand *[custom_data~{super_explosive_mining:1b}] run effect give @s minecraft:night_vision 12 0 true

execute as @a[scores={dealt_dmg=1..}] if items entity @s weapon.mainhand *[custom_data~{cosmic_cleave:1b}] at @s anchored eyes positioned ^ ^ ^3 run particle minecraft:sonic_boom ~ ~ ~ 0.2 0.2 0.2 0 1 normal
execute as @a[scores={dealt_dmg=1..}] if items entity @s weapon.mainhand *[custom_data~{cosmic_cleave:1b}] at @s run effect give @s minecraft:absorption 5 2 true

execute as @a if items entity @s armor.chest *[custom_data~{ancient_armor_t20:1b}] run effect give @s minecraft:absorption 4 4 true
execute as @a if items entity @s armor.chest *[custom_data~{ancient_armor_t20:1b}] run effect give @s minecraft:strength 2 2 true
execute as @a if items entity @s armor.chest *[custom_data~{ancient_armor_t20:1b}] run effect give @s minecraft:resistance 2 3 true
execute as @a if items entity @s armor.chest *[custom_data~{ancient_armor_t20:1b}] run effect give @s minecraft:regeneration 2 2 true

# 3. HỆ THỐNG 5 CỔ NGỮ & BÙA HỘ MỆNH (KÍCH HOẠT TỰ ĐỘNG KHI ĐỂ TRONG TÚI ĐỒ / TAY PHỤ)
execute as @a if items entity @s container.* *[custom_data~{talisman_miner:1b}] run effect give @s minecraft:haste 3 2 true
execute as @a if items entity @s weapon.offhand *[custom_data~{talisman_miner:1b}] run effect give @s minecraft:haste 3 2 true

execute as @a if items entity @s container.* *[custom_data~{talisman_warrior:1b}] run effect give @s minecraft:strength 3 1 true
execute as @a if items entity @s container.* *[custom_data~{talisman_warrior:1b}] run effect give @s minecraft:speed 3 1 true

execute as @a if items entity @s container.* *[custom_data~{talisman_fortune:1b}] run effect give @s minecraft:luck 3 2 true

execute as @a if items entity @s container.* *[custom_data~{talisman_immortal:1b}] run effect give @s minecraft:resistance 3 1 true
execute as @a if items entity @s container.* *[custom_data~{talisman_immortal:1b}] run effect give @s minecraft:regeneration 3 1 true
execute as @a if items entity @s container.* *[custom_data~{talisman_immortal:1b}] run effect give @s minecraft:fire_resistance 3 0 true

execute as @a if items entity @s container.* *[custom_data~{talisman_genesis:1b}] run effect give @s minecraft:haste 3 3 true
execute as @a if items entity @s container.* *[custom_data~{talisman_genesis:1b}] run effect give @s minecraft:strength 3 2 true
execute as @a if items entity @s container.* *[custom_data~{talisman_genesis:1b}] run effect give @s minecraft:speed 3 2 true
execute as @a if items entity @s container.* *[custom_data~{talisman_genesis:1b}] run effect give @s minecraft:regeneration 3 2 true
execute as @a if items entity @s container.* *[custom_data~{talisman_genesis:1b}] run effect give @s minecraft:absorption 4 2 true

# CƠ CHẾ BẤT TỬ HƯ KHÔNG (VOID SAVIOR): Rơi xuống Y < -40 có Bùa Bất Tử hoặc Cổ Ngữ Sáng Thế sẽ được dịch chuyển ngược lên trời an toàn!
execute as @a at @s if entity @s[y=-120,dy=80] if items entity @s container.* *[custom_data~{talisman_immortal:1b}] run effect give @s minecraft:slow_falling 15 0 true
execute as @a at @s if entity @s[y=-120,dy=80] if items entity @s container.* *[custom_data~{talisman_immortal:1b}] run playsound minecraft:item.totem.use player @s ~ ~125 ~ 1.0 1.2
execute as @a at @s if entity @s[y=-120,dy=80] if items entity @s container.* *[custom_data~{talisman_immortal:1b}] run tellraw @s [{"text":"[🛡 Bùa Bất Tử Hư Không] ","color":"aqua","bold":true},{"text":"Bảo ấn đã kích hoạt cứu mạng bạn khỏi vực thẳm Hư Vô!","color":"green","bold":true}]
execute as @a at @s if entity @s[y=-120,dy=80] if items entity @s container.* *[custom_data~{talisman_immortal:1b}] run tp @s ~ 125 ~
"""
    if "NÂNG CẤP V2.0: BOSS 5-6" not in content:
        # Chèn trước đoạn scoreboard players set dealt_dmg 0 để kỹ năng cosmic_cleave đọc được dealt_dmg!
        target_str = "scoreboard players set @a[scores={dealt_dmg=1..}] dealt_dmg 0"
        if target_str in content:
            content = content.replace(target_str, upgrade_block + "\n" + target_str)
        else:
            content += "\n" + upgrade_block
        with open(path, "w", encoding="utf-8") as f:
            f.write(content)

def run_all_generators():
    generate_evolution_items_mcfunction()
    generate_evolution_npc_mcfunction()
    generate_boss_5_and_6_files()
    generate_masterpiece_island_structures()
    update_setup_mcfunction()
    update_tick_mcfunction()
    print("ALL V2.0 GAMEPLAY UPGRADE FILES GENERATED SUCCESSFULLY!")

if __name__ == "__main__":
    run_all_generators()
