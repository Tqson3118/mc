# -*- coding: utf-8 -*-
"""
Script tạo toàn bộ hệ thống Tiến Hóa Trang Bị 15 Tiers (Ancient RPG Evolution System)
cho Paper Minecraft 1.21.4.
"""
import json
import os

DATAPACK_DIR = r"C:\Users\Administrator\.gemini\antigravity\scratch\Skyblock-Server\world\datapacks\skyblock_spawn\data\skyblock\function"

# ==============================================================================
# ĐỊNH NGHĨA NGUYÊN LIỆU (MATERIALS)
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
            '{"text":"✦ Trao đổi tại Đại Sư Luyện Kim","color":"aqua","italic":false}',
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
            '{"text":"✦ Trao đổi tại Đại Sư Luyện Kim","color":"aqua","italic":false}',
            '{"text":"[Loại]: Cực Phẩm Vũ Trụ","color":"yellow","bold":true,"italic":false}'
            '{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}'
        ],
        "custom_data": {"ancient_mat": "cosmic_essence"}
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
# CẤU HÌNH 15 TIERS
# ==============================================================================
TIER_INFO = [
    {"tier": 1,  "name": "Sơ Cấp",          "color": "green",        "eff": 5,  "fort": 3, "sharp": 5,  "prot": 4,  "power": 5,  "req_type": "shard",       "req_count": 4},
    {"tier": 2,  "name": "Cương Thiết",      "color": "dark_green",   "eff": 6,  "fort": 3, "sharp": 6,  "prot": 5,  "power": 6,  "req_type": "shard",       "req_count": 6},
    {"tier": 3,  "name": "Lam Ngọc",        "color": "aqua",         "eff": 6,  "fort": 4, "sharp": 6,  "prot": 5,  "power": 6,  "req_type": "shard",       "req_count": 8},
    {"tier": 4,  "name": "Hoàng Kim",       "color": "gold",         "eff": 7,  "fort": 4, "sharp": 7,  "prot": 6,  "power": 7,  "req_type": "shard",       "req_count": 12},
    {"tier": 5,  "name": "Kim Cương",       "color": "blue",         "eff": 7,  "fort": 5, "sharp": 7,  "prot": 6,  "power": 7,  "req_type": "shard",       "req_count": 16},
    {"tier": 6,  "name": "U Tối",           "color": "dark_purple",  "eff": 8,  "fort": 5, "sharp": 8,  "prot": 7,  "power": 8,  "req_type": "crystal",     "req_count": 4},
    {"tier": 7,  "name": "Hỏa Long",        "color": "red",          "eff": 8,  "fort": 6, "sharp": 8,  "prot": 7,  "power": 8,  "req_type": "crystal",     "req_count": 6},
    {"tier": 8,  "name": "Băng Phách",      "color": "light_purple", "eff": 9,  "fort": 6, "sharp": 9,  "prot": 8,  "power": 9,  "req_type": "crystal",     "req_count": 8},
    {"tier": 9,  "name": "Lôi Thần",        "color": "yellow",       "eff": 9,  "fort": 7, "sharp": 9,  "prot": 8,  "power": 9,  "req_type": "crystal",     "req_count": 12},
    {"tier": 10, "name": "Quỷ Vương Hắc Ám", "color": "dark_red",     "eff": 10, "fort": 7, "sharp": 10, "prot": 9,  "power": 10, "req_type": "demon_heart", "req_count": 1, "req_b": "crystal", "req_b_count": 8},
    {"tier": 11, "name": "Quỷ Thần Tận Diệt","color": "dark_red",     "eff": 10, "fort": 7, "sharp": 11, "prot": 9,  "power": 11, "req_type": "demon_heart", "req_count": 1, "req_b": "crystal", "req_b_count": 12},
    {"tier": 12, "name": "Thời Không Huyền Bí","color":"light_purple","eff": 11, "fort": 8, "sharp": 12, "prot": 10, "power": 12, "req_type": "demon_heart", "req_count": 1, "req_b": "crystal", "req_b_count": 16},
    {"tier": 13, "name": "Hư Không Tối Thượng","color":"dark_purple", "eff": 12, "fort": 8, "sharp": 13, "prot": 11, "power": 13, "req_type": "void_core",   "req_count": 1, "req_b": "crystal", "req_b_count": 16},
    {"tier": 14, "name": "Tinh Linh Thần Giới","color":"aqua",        "eff": 13, "fort": 9, "sharp": 14, "prot": 12, "power": 14, "req_type": "void_core",   "req_count": 2, "req_b": "crystal", "req_b_count": 20},
    {"tier": 15, "name": "Sáng Thế Vũ Trụ", "color": "gold",         "eff": 15, "fort": 10,"sharp": 16, "prot": 14, "power": 15, "req_type": "cosmic_essence","req_count": 1, "req_b": "void_core", "req_b_count": 2},
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
    if tier == 15:
        custom_data["ancient_armor_t15"] = True
        lore.append('{"text":"✧ QUYỀN NĂNG VŨ TRỤ: BẤT TỬ CHI THÂN, TỐC ĐỘ III & PHI HÀNH (FLY)!","color":"gold","bold":true,"italic":false}')
    lore.append('{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}')

    enchants = {"minecraft:protection": t["prot"], "minecraft:thorns": thorns}
    if slot == "boots":
        enchants["minecraft:feather_falling"] = min(10, 4 + (tier // 2))
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
    punch = min(5, 1 + (tier // 3))
    flame = min(5, 1 + (tier // 4))
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
    comps.append(f"minecraft:custom_name='{mat_dict['custom_name'] if 'custom_name' in mat_dict else mat_dict['name']}'")
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

print("Config loaded successfully!")
