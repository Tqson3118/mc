#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
SKYBLOCK ECONOMY, MINIONS, TALISMANS & MMORPG DAEMON (V3.0 MULTI-REALM)
=======================================================================
Integrated Systems:
1. Dynamic Economy (/sellhand, /sellall, /sellxp, /bal, /pay, /ah, /bounty)
2. Minion & Blueprint Automation Engine (/is minion ..., /is build ..., /mayquang)
3. Passive Talisman / Relic System (/bua, /congu) + Void Rescue
4. Rebirth / Tu Luyen Chuyen Sinh System (/chuyensinh - 10 Realms)
5. Active RPG Skills (/kynang - 4 Ultimate Skills with 30s Cooldown)
6. Flying Shoulder Companion Pets (/pet, /thucung - 4 Animated Pets)
7. Multi-Realm World Expansion (/hammo Deep Caverns, /dungeon Rhong Dungeon, /boss5, /boss6, /nangcap)
"""

import json
import os
import re
import socket
import struct
import time
from pathlib import Path

import skyblock_minions

if os.name == "nt":
    import msvcrt
    import ctypes

def open_log_shared(path):
    """
    Opens a log file on Windows with FILE_SHARE_READ | FILE_SHARE_WRITE | FILE_SHARE_DELETE
    to allow concurrent appending and atomic Log4j renaming/rotation without sharing violation.
    """
    path_str = str(path)
    if not os.path.exists(path_str):
        return None
    if os.name == "nt":
        try:
            kernel32 = ctypes.windll.kernel32
            GENERIC_READ = 0x80000000
            FILE_SHARE_READ = 0x00000001
            FILE_SHARE_WRITE = 0x00000002
            FILE_SHARE_DELETE = 0x00000004
            OPEN_EXISTING = 3
            FILE_ATTRIBUTE_NORMAL = 0x80

            handle = kernel32.CreateFileW(
                path_str,
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
            return open(fd, "r", encoding="utf-8", errors="replace")
        except Exception:
            return None
    else:
        try:
            return open(path_str, "r", encoding="utf-8", errors="replace")
        except Exception:
            return None

try:
    import generate_all
except ImportError:
    generate_all = None

BASE_DIR = Path(__file__).resolve().parent
LOG_FILE = BASE_DIR / "logs" / "latest.log"
ECON_FILE = BASE_DIR / "economy_data.json"
FUNC_DIR = BASE_DIR / "world" / "datapacks" / "skyblock_spawn" / "data" / "skyblock" / "function"

RCON_HOST = "127.0.0.1"
RCON_PORT = 25575
RCON_PASS = "skyblock123"

SELL_PRICES = {
    "cobblestone": 2, "stone": 3, "coal": 8, "charcoal": 6,
    "iron_ingot": 18, "raw_iron": 14, "copper_ingot": 10, "raw_copper": 8,
    "gold_ingot": 28, "raw_gold": 22, "lapis_lazuli": 12, "redstone": 10,
    "diamond": 85, "emerald": 110, "amethyst_shard": 35, "quartz": 16,
    "netherite_scrap": 450, "ancient_debris": 420, "netherite_ingot": 1950,
    "obsidian": 45, "crying_obsidian": 90, "wheat": 5, "carrot": 4,
    "potato": 4, "sugar_cane": 5, "melon_slice": 3, "pumpkin": 12,
    "rotten_flesh": 4, "bone": 6, "gunpowder": 10, "ender_pearl": 25,
    "blaze_rod": 35, "ghast_tear": 80, "nether_star": 5000,
    "echo_shard": 1200, "warden_heart": 15000, "eternity_singularity": 50000,
}

TALISMANS = {
    "miner": {
        "name": "Bùa Thợ Mỏ Thần Tốc",
        "cost": 5000,
        "bonus_pct": 10,
        "desc": "Haste II vĩnh viễn + Tăng 10% giá bán quặng",
        "effects": [("minecraft:haste", 1)],
    },
    "warrior": {
        "name": "Bùa Chiến Thần Bất Diệt",
        "cost": 12000,
        "bonus_pct": 15,
        "desc": "Strength II + Resistance I vĩnh viễn + Tăng 15% giá bán",
        "effects": [("minecraft:strength", 1), ("minecraft:resistance", 0)],
    },
    "fortune": {
        "name": "Bùa Tài Lộc Hoàng Kim",
        "cost": 25000,
        "bonus_pct": 25,
        "desc": "Luck II + Hero of the Village I + Tăng 25% giá bán",
        "effects": [("minecraft:luck", 1), ("minecraft:hero_of_the_village", 0)],
    },
    "immortal": {
        "name": "Bùa Bất Tử Hư Không",
        "cost": 50000,
        "bonus_pct": 20,
        "desc": "Regeneration II + Fire Res + Cứu mạng khi rơi Void (Y < -40)",
        "effects": [("minecraft:regeneration", 1), ("minecraft:fire_resistance", 0)],
    },
    "genesis": {
        "name": "Bùa Sáng Thế Vũ Trụ",
        "cost": 120000,
        "bonus_pct": 30,
        "desc": "Speed II + Night Vision + Saturation + Tăng 30% giá bán",
        "effects": [("minecraft:speed", 1), ("minecraft:night_vision", 0), ("minecraft:saturation", 0)],
    },
}

REBIRTH_REALMS = [
    {"level": 1, "name": "Phàm Nhân Luyện Thể", "cost": 25000, "xp_lvl": 15, "hp": 24, "dmg": 2, "spd": 0.105, "bonus": 15, "particle": "happy_villager"},
    {"level": 2, "name": "Trúc Cơ Cảnh", "cost": 60000, "xp_lvl": 25, "hp": 28, "dmg": 4, "spd": 0.110, "bonus": 30, "particle": "enchant"},
    {"level": 3, "name": "Kim Đan Cảnh", "cost": 150000, "xp_lvl": 35, "hp": 32, "dmg": 6, "spd": 0.115, "bonus": 45, "particle": "flame"},
    {"level": 4, "name": "Nguyên Anh Cảnh", "cost": 350000, "xp_lvl": 45, "hp": 36, "dmg": 8, "spd": 0.120, "bonus": 60, "particle": "soul_fire_flame"},
    {"level": 5, "name": "Hóa Thần Cảnh", "cost": 750000, "xp_lvl": 55, "hp": 40, "dmg": 10, "spd": 0.125, "bonus": 75, "particle": "totem_of_undying"},
    {"level": 6, "name": "Luyện Hư Cảnh", "cost": 1500000, "xp_lvl": 65, "hp": 44, "dmg": 12, "spd": 0.130, "bonus": 90, "particle": "end_rod"},
    {"level": 7, "name": "Hợp Thể Cảnh", "cost": 3000000, "xp_lvl": 75, "hp": 48, "dmg": 14, "spd": 0.135, "bonus": 105, "particle": "portal"},
    {"level": 8, "name": "Đại Thừa Cảnh", "cost": 6000000, "xp_lvl": 85, "hp": 52, "dmg": 16, "spd": 0.140, "bonus": 120, "particle": "dragon_breath"},
    {"level": 9, "name": "Bán Thần Hư Không", "cost": 12000000, "xp_lvl": 95, "hp": 56, "dmg": 18, "spd": 0.145, "bonus": 135, "particle": "sculk_soul"},
    {"level": 10, "name": "Chúa Tể Vĩnh Hằng", "cost": 25000000, "xp_lvl": 110, "hp": 60, "dmg": 20, "spd": 0.150, "bonus": 150, "particle": "sonic_boom"},
]

PETS = {
    "allay": {
        "name": "🧚 Tinh Linh Pha Lê",
        "entity": "allay",
        "cost": 35000,
        "bonus": 20,
        "color": "aqua",
        "desc": "Haste II + Tự hút vật phẩm quanh chủ nhân + Tăng 20% giá bán",
        "effects": [("minecraft:haste", 1), ("minecraft:luck", 0)],
        "nbt": "",
    },
    "bee": {
        "name": "🐝 Ong Thần Hoàng Kim",
        "entity": "bee",
        "cost": 65000,
        "bonus": 35,
        "color": "gold",
        "desc": "Speed II + Regeneration II + Tăng 35% giá bán nông sản & quặng",
        "effects": [("minecraft:speed", 1), ("minecraft:regeneration", 1)],
        "nbt": "",
    },
    "dragon": {
        "name": "🐉 Tiểu Hắc Long",
        "entity": "vex",
        "cost": 150000,
        "bonus": 55,
        "color": "dark_purple",
        "desc": "Strength III + Resistance II + Tăng 55% giá bán",
        "effects": [("minecraft:strength", 2), ("minecraft:resistance", 1)],
        "nbt": "",
    },
    "phoenix": {
        "name": "🔥 Phượng Hoàng Lửa Vĩnh Hằng",
        "entity": "parrot",
        "cost": 350000,
        "bonus": 85,
        "color": "red",
        "desc": "Strength IV + Fire Res + Absorption III + Tăng 85% giá bán",
        "effects": [("minecraft:strength", 3), ("minecraft:fire_resistance", 0), ("minecraft:absorption", 2)],
        "nbt": ",Variant:0",
    },
}

GEM_SHOP = {
    "1": {
        "name": "Bùa Sáng Thế Vũ Trụ",
        "cost": 500,
        "type": "talisman",
        "id": "genesis",
        "desc": "+30% giá bán, Speed II, Night Vision, Saturation vĩnh viễn"
    },
    "2": {
        "name": "2x Chìa Khóa Thần Thoại",
        "cost": 150,
        "type": "cmd",
        "cmd": 'give {player} ominous_trial_key[custom_data={crate_key:"mythic"},item_name=\'{"text":"Chìa Khóa Thần Thoại","color":"light_purple","bold":true}\'] 2',
        "desc": "Mở hòm báu Thần Thoại tại sảnh Spawn"
    },
    "3": {
        "name": "Minion Builder Bậc 12 [MAX]",
        "cost": 350,
        "type": "builder_t12",
        "desc": "Triệu hồi Minion Builder T12 thi công thần tốc"
    },
    "4": {
        "name": "Túi Vàng Đại Phú (+150,000 Xu)",
        "cost": 100,
        "type": "money",
        "amount": 150000,
        "desc": "Nhận trực tiếp 150,000 Xu vào số dư ngân hàng"
    },
    "5": {
        "name": "Trái Tim Thâm Uyên (Boss 5)",
        "cost": 250,
        "type": "cmd",
        "cmd": 'give {player} minecraft:recovery_compass[minecraft:custom_name=\'{"text":"💠 Trái Tim Thâm Uyên 💠","color":"dark_aqua","bold":true,"italic":false}\',minecraft:lore=[\'{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}\',\'{"text":"Lõi âm thanh cổ đại kết tinh từ Cổ Thần Thâm Uyên Warden.\",\"color\":\"aqua\",\"italic\":true}\',\'{"text":"⚡ Nguyên liệu ĐỘT PHÁ THẦN THOẠI cho TIER 16 - 18!\",\"color\":\"dark_aqua\",\"bold\":true,\"italic\":false}\'],minecraft:enchantment_glint_override=true,minecraft:custom_data={ancient_mat:"warden_heart"}] 1',
        "desc": "Nguyên liệu Đột Phá Bậc 16 - 18"
    },
    "6": {
        "name": "Dị Điểm Vĩnh Hằng (Boss 6)",
        "cost": 600,
        "type": "cmd",
        "cmd": 'give {player} minecraft:heavy_core[minecraft:custom_name=\'{"text":"🌌 Dị Điểm Vĩnh Hằng 🌌","color":"light_purple","bold":true,"italic":false}\',minecraft:lore=[\'{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}\',\'{"text":"Hạt nhân nén chặt của cả một thiên hà đang bùng nổ.\",\"color\":\"light_purple\",\"italic\":true}\',\'{"text":"⚡ Nguyên liệu SÁNG THẾ TỐI CAO cho TIER 19 - 20 [MAX]!\",\"color\":\"gold\",\"bold\":true,\"italic\":false}\'],minecraft:enchantment_glint_override=true,minecraft:custom_data={ancient_mat:"eternity_singularity"}] 1',
        "desc": "Nguyên liệu Đột Phá Bậc 19 - 20 [MAX]"
    },
    "7": {
        "name": "Vảy Thần Biển Sâu (Catalyst)",
        "cost": 150,
        "type": "cmd",
        "cmd": 'give {player} minecraft:nautilus_shell[minecraft:custom_name=\'{"text":"🌊 Vảy Thần Biển Sâu 🌊","color":"aqua","bold":true,"italic":false}\',minecraft:lore=[\'{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}\',\'{"text":"Vảy lấp lánh của thủy quái cổ đại dưới Biển Hồ Trên Mây.\",\"color":"gray","italic":true}\',\'{"text":"⚡ Dùng để chế Bùa Boss 5 & Hợp nhất Phôi VIP God Gear\",\"color":"yellow\",\"bold\":true,\"italic\":false}\',\'{"text":"[Nguồn]: Câu cá tại world_cauca\",\"color":"aqua\",\"bold\":true,\"italic\":false}\'],minecraft:enchantment_glint_override=true,minecraft:custom_data={ancient_mat:"sea_scale"}] 1',
        "desc": "Catalyst Biển Hồ - Chế Bùa Boss 5 & Phôi Tinh Hoa Tối Thượng"
    },
    "8": {
        "name": "Tinh Thể Phong Lôi (Catalyst)",
        "cost": 150,
        "type": "cmd",
        "cmd": 'give {player} minecraft:wind_charge[minecraft:custom_name=\'{"text":"⚡ Tinh Thể Phong Lôi ⚡","color":"yellow","bold":true,"italic":false}\',minecraft:lore=[\'{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}\',\'{"text":"Ngưng tụ từ cuồng lôi trên đỉnh Tháp 50 Tầng!\",\"color":"gray","italic":true}\',\'{"text":"⚡ Dùng để chế Bùa Boss 6 & Hợp nhất Phôi VIP God Gear\",\"color":"yellow\",\"bold\":true,\"italic\":false}\',\'{"text":"[Nguồn]: Tháp Parkour Phong Lôi world_parkour\",\"color":"aqua\",\"bold\":true,\"italic\":false}\'],minecraft:enchantment_glint_override=true,minecraft:custom_data={ancient_mat:"storm_crystal"}] 1',
        "desc": "Catalyst Phong Lôi - Chế Bùa Boss 6 & Phôi Tinh Hoa Tối Thượng"
    },
    "9": {
        "name": "Mảnh Linh Hồn (Catalyst)",
        "cost": 150,
        "type": "cmd",
        "cmd": 'give {player} minecraft:echo_shard[minecraft:custom_name=\'{"text":"👻 Mảnh Linh Hồn 👻","color":"light_purple","bold":true,"italic":false}\',minecraft:lore=[\'{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}\',\'{"text":"Tàn dư linh hồn thu thập từ quái vật tầng sâu hầm ngục.\",\"color":"gray","italic":true}\',\'{"text":"⚡ Dùng để rèn vũ khí hút máu & Hợp nhất Phôi VIP God Gear\",\"color":"yellow\",\"bold\":true,\"italic\":false}\',\'{"text":"[Nguồn]: Hầm Ngục Quái world_farm\",\"color":"green\",\"bold\":true,\"italic\":false}\'],minecraft:enchantment_glint_override=true,minecraft:custom_data={ancient_mat:"soul_fragment"}] 1',
        "desc": "Catalyst Linh Hồn - Hợp nhất Phôi Tinh Hoa Tối Thượng"
    },
    "10": {
        "name": "Vé Vàng Hoàng Gia (Catalyst)",
        "cost": 150,
        "type": "cmd",
        "cmd": 'give {player} minecraft:paper[minecraft:custom_name=\'{"text":"🎫 Vé Vàng Hoàng Gia 🎫","color":"gold","bold":true,"italic":false}\',minecraft:lore=[\'{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}\',\'{"text":"Tấm vé danh dự nạm vàng trao thưởng cho người chiến thắng Casino.\",\"color":"yellow","italic":true}\',\'{"text":"⚡ Dùng để đổi Danh Hiệu VIP & Hợp nhất Phôi VIP God Gear\",\"color":"gold\",\"bold\":true,\"italic\":false}\',\'{"text":"[Nguồn]: Cung Điện Casino world_casino (/xoso, /cf, /cotyphu)\",\"color":"light_purple\",\"bold\":true,\"italic\":false}\'],minecraft:enchantment_glint_override=true,minecraft:custom_data={ancient_mat:"royal_ticket"}] 1',
        "desc": "Catalyst Hoàng Gia - Hợp nhất Phôi Tinh Hoa Tối Thượng"
    }
}

DAILY_QUESTS = {
    "mining": {
        "title": "⛏️ Đào Khoáng Sản",
        "desc": "Đào 150 khối đá hoặc quặng",
        "goal": 150,
        "gems": 25,
        "money": 5000
    },
    "hunting": {
        "title": "⚔️ Săn Bắt Quái Vật",
        "desc": "Tiêu diệt 50 quái vật hoặc 1 Boss",
        "goal": 50,
        "gems": 25,
        "money": 5000
    },
    "fishing": {
        "title": "🎣 Cần Thủ Biển Sâu",
        "desc": "Câu thành công 15 con cá",
        "goal": 15,
        "gems": 25,
        "money": 5000
    },
    "trading": {
        "title": "💰 Đại Thương Nhân",
        "desc": "Bán được 25,000 Xu qua /sellall",
        "goal": 25000,
        "gems": 25,
        "money": 5000
    }
}

ACHIEVEMENTS = {
    "miner_1000": {
        "title": "⛏️ Bậc Thầy Khoáng Sản",
        "desc": "Khai thác 1,000 khối quặng",
        "goal": 1000,
        "stat": "mining",
        "gems": 100,
        "money": 10000
    },
    "boss_slayer": {
        "title": "☠️ Kẻ Hủy Diệt Quỷ Vương",
        "desc": "Hạ gục 10 Quái Boss các loại",
        "goal": 10,
        "stat": "boss_kills",
        "gems": 250,
        "money": 50000
    },
    "millionaire": {
        "title": "💎 Triệu Phú Skyblock",
        "desc": "Tích lũy 1,000,000 Xu trong tài khoản",
        "goal": 1000000,
        "stat": "balance",
        "gems": 200,
        "money": 100000
    },
    "rebirth_5": {
        "title": "⚡ Đại Năng Hóa Thần",
        "desc": "Đột phá Cảnh giới Tu Luyện Bậc 5",
        "goal": 5,
        "stat": "rebirth",
        "gems": 500,
        "money": 250000
    },
    "minion_master": {
        "title": "🤖 Chúa Tể Tự Động Hóa",
        "desc": "Đặt tối đa 8 Minions trên đảo",
        "goal": 8,
        "stat": "minion_count",
        "gems": 150,
        "money": 25000
    },
    "god_of_war": {
        "title": "🌌 Đỉnh Phong Sáng Thế",
        "desc": "Đạt Cảnh giới 10 Chúa Tể Vĩnh Hằng",
        "goal": 10,
        "stat": "rebirth",
        "gems": 1000,
        "money": 1000000
    }
}


class RconClient:
    def __init__(self, host, port, password):
        self.host = host
        self.port = port
        self.password = password
        self.sock = None

    def connect(self):
        if self.sock:
            return True
        try:
            self.sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            self.sock.settimeout(2.5)
            self.sock.connect((self.host, self.port))
            self._send(3, self.password)
            return True
        except Exception:
            self.sock = None
            return False

    def _send(self, pkt_type, payload):
        data = payload.encode("utf-8") + b"\x00\x00"
        pkt = struct.pack("<iii", len(data) + 8, 1, pkt_type) + data
        self.sock.sendall(pkt)
        hdr = self.sock.recv(4)
        if not hdr:
            raise ConnectionError("Empty RCON header")
        (length,) = struct.unpack("<i", hdr)
        body = b""
        while len(body) < length:
            chunk = self.sock.recv(length - len(body))
            if not chunk:
                break
            body += chunk
        return body[8:-2].decode("utf-8", errors="ignore")

    def cmd(self, command):
        if not self.connect():
            return ""
        try:
            return self._send(2, command)
        except Exception:
            self.sock = None
            return ""


def ensure_v3_datapack_files():
    """Ensures all V2.0 + V3.0 datapack .mcfunction files and coordinate fixes are written."""
    if generate_all and hasattr(generate_all, "run_all_generators"):
        try:
            generate_all.run_all_generators()
        except Exception as e:
            print(f"[Warn] generate_all error: {e}")

    FUNC_DIR.mkdir(parents=True, exist_ok=True)
    (FUNC_DIR / "boss").mkdir(parents=True, exist_ok=True)
    (FUNC_DIR / "trade").mkdir(parents=True, exist_ok=True)

    # 1. Deep Caverns (/hammo) at X=155..205, Y=95..135, Z=-30..30
    deep_caverns_mc = """# ==============================================================================
# LUC DIA HAM MO V3.0 (DEEP CAVERNS) - X=155..205, Y=95..135, Z=-30..30
# ==============================================================================
tellraw @a [{"text":"[Skyblock V3.0] ","color":"gold","bold":true},{"text":"Đang kiến tạo Lục Địa Hầm Mỏ Tự Tái Tạo (Deep Caverns)...","color":"aqua"}]

# Base Obsidian & Deepslate Cavern Shell
fill 155 105 -25 205 130 25 cobbled_deepslate hollow
fill 156 106 -24 204 109 24 deepslate_bricks
fill 156 129 -24 204 129 24 crying_obsidian

# Entrance Safe Plaza (X=157..165, Y=110, Z=-6..6)
fill 157 109 -6 165 109 6 polished_basalt
fill 158 109 -5 164 109 5 gold_block
setblock 160 110 0 light_weighted_pressure_plate
setblock 158 111 -4 soul_lantern
setblock 158 111 4 soul_lantern

# 4 Giant Auto-Regenerating Ore Veins
function skyblock:regen_deep_caverns

# Ambient Crystal Pillars & Lanterns
fill 170 110 -18 170 128 -18 amethyst_block
fill 170 110 18 170 128 18 amethyst_block
fill 190 110 -18 190 128 -18 amethyst_block
fill 190 110 18 190 128 18 amethyst_block
setblock 170 115 -17 lantern
setblock 170 115 17 lantern
setblock 190 115 -17 lantern
setblock 190 115 17 lantern

# Guardian Monsters Spawners in Deep Cavern Back Hall (X=198, Z=-10 / 10)
setblock 198 110 -10 spawner{SpawnData:{entity:{id:"minecraft:wither_skeleton"}},MinSpawnDelay:160,MaxSpawnDelay:400,SpawnCount:2,MaxNearbyEntities:6,RequiredPlayerRange:18}
setblock 198 110 10 spawner{SpawnData:{entity:{id:"minecraft:blaze"}},MinSpawnDelay:160,MaxSpawnDelay:400,SpawnCount:2,MaxNearbyEntities:6,RequiredPlayerRange:18}
"""
    (FUNC_DIR / "build_deep_caverns.mcfunction").write_text(deep_caverns_mc, encoding="utf-8")

    regen_dc_mc = """# Auto-refill 4 Ore Veins in Deep Caverns (only replaces air)
# Vein 1: Coal, Iron, Copper (X=168..176, Y=110..114, Z=-14..-6)
fill 168 110 -14 176 111 -6 iron_ore replace air
fill 169 112 -13 175 113 -7 coal_ore replace air
fill 170 114 -12 174 114 -8 raw_iron_block replace air

# Vein 2: Gold, Lapis, Redstone (X=168..176, Y=110..114, Z=6..14)
fill 168 110 6 176 111 14 gold_ore replace air
fill 169 112 7 175 113 13 lapis_ore replace air
fill 170 114 8 174 114 12 redstone_block replace air

# Vein 3: Diamond & Emerald (X=184..192, Y=110..114, Z=-14..-6)
fill 184 110 -14 192 111 -6 deepslate_diamond_ore replace air
fill 185 112 -13 191 113 -7 deepslate_emerald_ore replace air
fill 186 114 -12 190 114 -8 diamond_block replace air

# Vein 4: Ancient Debris, Obsidian & Amethyst (X=184..192, Y=110..114, Z=6..14)
fill 184 110 6 192 111 14 crying_obsidian replace air
fill 185 112 7 191 113 13 amethyst_block replace air
fill 186 114 8 190 114 12 ancient_debris replace air
"""
    (FUNC_DIR / "regen_deep_caverns.mcfunction").write_text(regen_dc_mc, encoding="utf-8")

    # 2. Dungeon Boss Summon & Defeat
    dungeon_boss_mc = """# Summon Boss Dia Dao Rhong (X=0, Y=88, Z=137)
kill @e[tag=dungeon_boss]
summon wither_skeleton 0 88 137 {Tags:["dungeon_boss","skyblock_boss"],CustomName:'{"text":"☠ Hắc Ám Địa Ngục Vương [3,500 HP] ☠","color":"dark_red","bold":true}',CustomNameVisible:1b,Health:3500f,PersistenceRequired:1b,Glowing:1b,HandItems:[{id:"minecraft:netherite_sword",count:1,components:{"minecraft:enchantments":{levels:{"minecraft:sharpness":8,"minecraft:fire_aspect":3}}}},{}],ArmorItems:[{id:"minecraft:netherite_boots",count:1},{id:"minecraft:netherite_leggings",count:1},{id:"minecraft:netherite_chestplate",count:1},{id:"minecraft:dragon_head",count:1}],attributes:[{id:"minecraft:max_health",base:3500.0d},{id:"minecraft:attack_damage",base:28.0d},{id:"minecraft:movement_speed",base:0.32d},{id:"minecraft:knockback_resistance",base:0.9d}]}
scoreboard players set #dungeon_boss_alive sb_boss_alive 1
tellraw @a [{"text":"[Hầm Ngục Rhông] ","color":"dark_red","bold":true},{"text":"☠ Hắc Ám Địa Ngục Vương (3,500 HP) đã thức tỉnh tại Phòng Boss Hầm Ngục (/dungeon)!","color":"red"}]
"""
    (FUNC_DIR / "summon_dungeon_boss.mcfunction").write_text(dungeon_boss_mc, encoding="utf-8")

    dungeon_defeated_mc = """scoreboard players set #dungeon_boss_alive sb_boss_alive 0
tellraw @a [{"text":"[Hầm Ngục Rhông] ","color":"gold","bold":true},{"text":"Chiến thắng! Hắc Ám Địa Ngục Vương đã bị tiêu diệt! Người chơi xung quanh nhận Trái Tim Warden, Dị Điểm Vĩnh Hằng & +500 XP!","color":"green"}]
execute at @a[x=0,y=88,z=137,distance=..30] run give @p echo_shard[custom_name='"§3§lTrái Tim Warden"',lore=['"§7Nguyên liệu Đột Phá Vũ Khí Tier 16-18"']] 2
execute at @a[x=0,y=88,z=137,distance=..30] run give @p nether_star[custom_name='"§d§lDị Điểm Vĩnh Hằng"',lore=['"§7Nguyên liệu Đột Phá Vũ Khí Tier 19-20"']] 1
execute at @a[x=0,y=88,z=137,distance=..30] run xp add @p 500 points
"""
    (FUNC_DIR / "boss" / "dungeon_boss_defeated.mcfunction").write_text(dungeon_defeated_mc, encoding="utf-8")

    # 3. Stepped Bridges connecting Wing Islands (Y=120) to Satellite Islands (Y=110)
    bridges_mc = """# Stepped Bridges connecting 4 Wing Islands (Y=120) to Satellite Islands (Y=110)
# South Bridge -> Boss Arena (Z=65..78)
fill -2 119 65 2 119 66 polished_deepslate_slab
fill -2 117 67 2 117 69 polished_deepslate_slab
fill -2 115 70 2 115 72 polished_deepslate_slab
fill -2 113 73 2 113 75 polished_deepslate_slab
fill -2 111 76 2 111 78 polished_deepslate_slab

# North Bridge -> Fishing Lake (Z=-65..-75)
fill -2 119 -66 2 119 -65 polished_deepslate_slab
fill -2 117 -69 2 117 -67 polished_deepslate_slab
fill -2 115 -72 2 115 -70 polished_deepslate_slab
fill -2 113 -74 2 113 -73 polished_deepslate_slab
fill -2 111 -76 2 111 -75 polished_deepslate_slab

# West Bridge -> Mob Farm (X=-65..-78)
fill -66 119 -2 -65 119 2 polished_deepslate_slab
fill -69 117 -2 -67 117 2 polished_deepslate_slab
fill -72 115 -2 -70 115 2 polished_deepslate_slab
fill -75 113 -2 -73 113 2 polished_deepslate_slab
fill -78 111 -2 -76 111 2 polished_deepslate_slab

# East Bridge -> PvP Colosseum (X=65..76)
fill 65 119 -2 66 119 2 polished_deepslate_slab
fill 67 117 -2 69 117 2 polished_deepslate_slab
fill 70 115 -2 72 115 2 polished_deepslate_slab
fill 73 113 -2 75 113 2 polished_deepslate_slab
fill 76 111 -2 77 111 2 polished_deepslate_slab

# Activate East Wing Cosmic Stargate Portal
fill 63 122 -2 63 128 2 end_gateway
"""
    (FUNC_DIR / "build_bridges.mcfunction").write_text(bridges_mc, encoding="utf-8")


class SkyblockDaemon:
    def __init__(self):
        self.rcon = RconClient(RCON_HOST, RCON_PORT, RCON_PASS)
        self.data = self.load_data()
        self.minion_mgr = skyblock_minions.MinionManager(self.rcon, self.data, self.save_data)
        self.skill_cooldowns = {}

    def load_data(self):
        default = {
            "balances": {},
            "gems": {},
            "quests": {},
            "achievements": {},
            "auctions": [],
            "bounties": {},
            "minions": {},
            "talismans": {},
            "rebirths": {},
            "pets": {},
        }
        if ECON_FILE.exists():
            try:
                loaded = json.loads(ECON_FILE.read_text(encoding="utf-8"))
                for k, v in default.items():
                    loaded.setdefault(k, v)
                return loaded
            except Exception:
                pass
        return default

    def save_data(self):
        ECON_FILE.write_text(json.dumps(self.data, indent=2, ensure_ascii=False), encoding="utf-8")

    def msg(self, player, text, color="yellow"):
        payload = json.dumps([{"text": "[Skyblock] ", "color": "gold", "bold": True}, {"text": text, "color": color}])
        self.rcon.cmd(f"tellraw {player} {payload}")

    def broadcast(self, text, color="green"):
        payload = json.dumps([{"text": "[Skyblock V3.0] ", "color": "gold", "bold": True}, {"text": text, "color": color}])
        self.rcon.cmd(f"tellraw @a {payload}")

    def get_bal(self, player):
        return int(self.data["balances"].get(player, 1000))

    def add_bal(self, player, amount):
        self.data["balances"][player] = self.get_bal(player) + int(amount)
        self.save_data()
        self.rcon.cmd(f"scoreboard players set {player} sb_money {self.get_bal(player)}")

    def get_gems(self, player):
        return int(self.data["gems"].get(player, 0))

    def add_gems(self, player, amount):
        cur = self.get_gems(player)
        self.data["gems"][player] = max(0, cur + int(amount))
        self.save_data()
        self.rcon.cmd(f"scoreboard players set {player} sb_gems {self.get_gems(player)}")

    def take_gems(self, player, amount):
        cur = self.get_gems(player)
        if cur < amount:
            return False
        self.add_gems(player, -amount)
        return True

    def handle_gems(self, player, args):
        sub = args[0].lower() if args else "bal"
        if sub in ("bal", "xem", "info"):
            self.msg(player, f"✦ Linh Thạch Cổ Đại (Ancient Gems): {self.get_gems(player):,} Gems", "light_purple")
            self.msg(player, "Dùng /gem shop để mở Cửa Hàng Linh Thạch, hoặc /gem pay <nguoichoi> <soluong> để chuyển.", "aqua")
            return
        if sub == "shop":
            self.msg(player, "=== ✦ CỬA HÀNG LINH THẠCH CỔ ĐẠI (/gem buy <id>) ✦ ===", "light_purple")
            for item_id, it in GEM_SHOP.items():
                self.msg(player, f"[{item_id}] {it['name']} — {it['cost']:,} Gems ({it['desc']})", "yellow")
            return
        if sub == "buy" and len(args) >= 2:
            item_id = args[1]
            if item_id not in GEM_SHOP:
                self.msg(player, "Vật phẩm không hợp lệ! Gõ /gem shop để xem danh sách.", "red")
                return
            it = GEM_SHOP[item_id]
            cost = it["cost"]
            if self.get_gems(player) < cost:
                self.msg(player, f"Không đủ Linh Thạch! Cần {cost:,} Gems (Hiện có: {self.get_gems(player):,}).", "red")
                return
            self.take_gems(player, cost)
            if it["type"] == "talisman":
                owned = self.data["talismans"].setdefault(player, [])
                if it["id"] not in owned:
                    owned.append(it["id"])
                    self.save_data()
                    self.apply_passives(player)
            elif it["type"] == "money":
                self.add_bal(player, it["amount"])
            elif it["type"] == "builder_t12":
                self.minion_mgr.spawn_minion(player, "builder", 12)
            elif it["type"] == "cmd":
                cmd = it["cmd"].format(player=player)
                self.rcon.cmd(cmd)
            self.msg(player, f"✦ Giao dịch thành công! Bạn đã mua [{it['name']}] với giá {cost:,} Gems!", "green")
            self.rcon.cmd(f"execute at {player} run playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1.0 1.5")
            return
        if sub == "pay" and len(args) >= 3:
            target = args[1]
            try:
                amt = int(args[2])
                if amt <= 0:
                    raise ValueError
            except ValueError:
                self.msg(player, "Số lượng Gems không hợp lệ!", "red")
                return
            if not self.take_gems(player, amt):
                self.msg(player, f"Bạn không có đủ {amt:,} Gems để chuyển!", "red")
                return
            self.add_gems(target, amt)
            self.msg(player, f"Đã chuyển {amt:,} Gems cho {target}!", "green")
            self.msg(target, f"Bạn nhận được {amt:,} Gems từ {player}!", "light_purple")
            return

    def get_player_quests(self, player):
        today = time.strftime("%Y-%m-%d")
        q_data = self.data["quests"].setdefault(player, {})
        if q_data.get("date") != today:
            q_data["date"] = today
            q_data["progress"] = {k: 0 for k in DAILY_QUESTS}
            q_data["claimed"] = {k: False for k in DAILY_QUESTS}
            q_data["all_bonus_claimed"] = False
            self.save_data()
        return q_data

    def add_quest_progress(self, player, q_key, amount=1):
        if q_key not in DAILY_QUESTS:
            return
        q_data = self.get_player_quests(player)
        q_data["progress"][q_key] = q_data["progress"].get(q_key, 0) + amount
        self.save_data()

    def handle_daily_quests(self, player, args):
        q_data = self.get_player_quests(player)
        sub = args[0].lower() if args else "info"

        if sub in ("info", "list", "view"):
            self.msg(player, f"=== 📜 NHIỆM VỤ HÀNG NGÀY ({q_data['date']}) ===", "aqua")
            for qk, q in DAILY_QUESTS.items():
                cur = q_data["progress"].get(qk, 0)
                goal = q["goal"]
                claimed = q_data["claimed"].get(qk, False)
                if claimed:
                    st = "[✔ ĐÃ NHẬN THƯỞNG]"
                    st_col = "green"
                elif cur >= goal:
                    st = f"[★ HOÀN THÀNH - GÕ /nv claim {qk}]"
                    st_col = "gold"
                else:
                    st = f"[{min(cur, goal)}/{goal}]"
                    st_col = "yellow"
                self.msg(player, f"• {q['title']}: {q['desc']} | Thưởng: +{q['gems']} Gems, +${q['money']:,} — {st}", st_col)

            if q_data.get("all_bonus_claimed"):
                self.msg(player, "✦ Thưởng Hoàn Thành Toàn Bộ 4 Nhiệm Vụ: [ĐÃ NHẬN]", "light_purple")
            else:
                self.msg(player, "✦ Thưởng Hoàn Tất Cả 4 Nhiệm Vụ: +50 Gems & 1 Chìa Khóa Thần Thoại! (/nv claim all)", "light_purple")
            return

        if sub == "claim":
            target_q = args[1].lower() if len(args) >= 2 else "all"
            if target_q == "all":
                claimed_any = False
                for qk, q in DAILY_QUESTS.items():
                    if not q_data["claimed"].get(qk, False) and q_data["progress"].get(qk, 0) >= q["goal"]:
                        q_data["claimed"][qk] = True
                        self.add_gems(player, q["gems"])
                        self.add_bal(player, q["money"])
                        claimed_any = True
                        self.msg(player, f"Đã nhận thưởng {q['title']}: +{q['gems']} Gems, +${q['money']:,} Xu!", "green")
                if all(q_data["claimed"].get(qk, False) for qk in DAILY_QUESTS) and not q_data.get("all_bonus_claimed"):
                    q_data["all_bonus_claimed"] = True
                    self.add_gems(player, 50)
                    self.rcon.cmd(f'give {player} ominous_trial_key[custom_data={{crate_key:"mythic"}},item_name=\'{{"text":"Chìa Khóa Thần Thoại","color":"light_purple","bold":true}}\'] 1')
                    self.msg(player, "🎉 XUẤT SẮC! Hoàn thành cả 4 Nhiệm Vụ: Thưởng thêm +50 Gems & 1 Chìa Khóa Thần Thoại!", "gold")
                    self.rcon.cmd(f"execute at {player} run summon firework_rocket ~ ~1 ~ {{LifeTime:15}}")
                    claimed_any = True
                self.save_data()
                if not claimed_any:
                    self.msg(player, "Không có nhiệm vụ nào đủ điều kiện nhận thưởng lúc này!", "yellow")
                return

            if target_q in DAILY_QUESTS:
                q = DAILY_QUESTS[target_q]
                if q_data["claimed"].get(target_q, False):
                    self.msg(player, "Nhiệm vụ này hôm nay bạn đã nhận rồi!", "yellow")
                    return
                if q_data["progress"].get(target_q, 0) < q["goal"]:
                    self.msg(player, f"Chưa hoàn thành {q['title']}! Tiến độ: {q_data['progress'].get(target_q, 0)}/{q['goal']}.", "red")
                    return
                q_data["claimed"][target_q] = True
                self.add_gems(player, q["gems"])
                self.add_bal(player, q["money"])
                self.msg(player, f"Đã nhận thưởng {q['title']}: +{q['gems']} Gems, +${q['money']:,} Xu!", "green")
                if all(q_data["claimed"].get(qk, False) for qk in DAILY_QUESTS) and not q_data.get("all_bonus_claimed"):
                    q_data["all_bonus_claimed"] = True
                    self.add_gems(player, 50)
                    self.rcon.cmd(f'give {player} ominous_trial_key[custom_data={{crate_key:"mythic"}},item_name=\'{{"text":"Chìa Khóa Thần Thoại","color":"light_purple","bold":true}}\'] 1')
                    self.msg(player, "🎉 XUẤT SẮC! Hoàn thành cả 4 Nhiệm Vụ: Thưởng thêm +50 Gems & 1 Chìa Khóa Thần Thoại!", "gold")
                    self.rcon.cmd(f"execute at {player} run summon firework_rocket ~ ~1 ~ {{LifeTime:15}}")
                self.save_data()
                return

    def get_player_achievements(self, player):
        return self.data["achievements"].setdefault(player, {})

    def handle_achievements(self, player, args):
        ach_data = self.get_player_achievements(player)
        sub = args[0].lower() if args else "list"

        if sub in ("list", "view", "info"):
            self.msg(player, "=== 🏆 THÀNH TỰU VĨNH VIỄN (/thanhtuu claim <id>) ===", "gold")
            for ak, a in ACHIEVEMENTS.items():
                claimed = ach_data.get(ak, False)
                st = "[✔ ĐÃ ĐẠT]" if claimed else f"[CHƯA ĐẠT - +{a['gems']} Gems, +${a['money']:,}]"
                col = "green" if claimed else "yellow"
                self.msg(player, f"• {ak}: {a['title']} — {a['desc']} {st}", col)
            return

        if sub == "claim" and len(args) >= 2:
            ak = args[1].lower()
            if ak not in ACHIEVEMENTS:
                self.msg(player, "Mã Thành Tựu không tồn tại! Gõ /thanhtuu list để xem.", "red")
                return
            if ach_data.get(ak, False):
                self.msg(player, "Bạn đã nhận thưởng thành tựu này rồi!", "yellow")
                return
            a = ACHIEVEMENTS[ak]
            eligible = False
            if a["stat"] == "balance" and self.get_bal(player) >= a["goal"]:
                eligible = True
            elif a["stat"] == "rebirth" and int(self.data["rebirths"].get(player, 0)) >= a["goal"]:
                eligible = True
            elif a["stat"] == "minion_count":
                m_count = len(self.data["minions"].get(player, []))
                if m_count >= a["goal"]:
                    eligible = True
            elif ach_data.get(f"{ak}_unlocked", False):
                eligible = True

            if not eligible:
                self.msg(player, f"Bạn chưa hoàn thành yêu cầu: {a['desc']}!", "red")
                return

            ach_data[ak] = True
            self.add_gems(player, a["gems"])
            self.add_bal(player, a["money"])
            self.save_data()
            self.msg(player, f"🏆 CHÚC MỪNG! Đã nhận thưởng Thành Tựu [{a['title']}]: +{a['gems']} Gems & +${a['money']:,} Xu!", "gold")
            self.broadcast(f"Người chơi {player} vừa mở khóa Thành Tựu Bất Hủ [{a['title']}]!", "gold")
            self.rcon.cmd(f"execute at {player} run playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1 1")
            return

    def get_total_bonus_pct(self, player):
        talisman_list = self.data["talismans"].get(player, [])
        t_bonus = sum(TALISMANS[t]["bonus_pct"] for t in talisman_list if t in TALISMANS)
        rebirth_lvl = int(self.data["rebirths"].get(player, 0))
        r_bonus = REBIRTH_REALMS[rebirth_lvl - 1]["bonus"] if 1 <= rebirth_lvl <= len(REBIRTH_REALMS) else 0
        pet_info = self.data["pets"].get(player, {})
        active_pet = pet_info.get("active")
        p_bonus = PETS[active_pet]["bonus"] if active_pet in PETS else 0
        return t_bonus + r_bonus + p_bonus

    def get_xp_level(self, player):
        resp = self.rcon.cmd(f"xp query {player} levels")
        m = re.search(r"has (\d+) experience levels", resp)
        return int(m.group(1)) if m else 0

    # ==========================================================================
    # 1. REBIRTH / TU LUYEN CHUYEN SINH (/chuyensinh)
    # ==========================================================================
    def handle_rebirth(self, player, args):
        cur_lvl = int(self.data["rebirths"].get(player, 0))
        sub = args[0].lower() if args else "info"

        if sub in ("dotpha", "up", "breakthrough"):
            if cur_lvl >= len(REBIRTH_REALMS):
                self.msg(player, "Bạn đã đạt đỉnh phong Chúa Tể Vĩnh Hằng (Cảnh giới 10/10)!", "light_purple")
                return
            nxt = REBIRTH_REALMS[cur_lvl]
            bal = self.get_bal(player)
            xp_lvl = self.get_xp_level(player)
            if bal < nxt["cost"]:
                self.msg(player, f"Cần {nxt['cost']:,} Xu để đột phá {nxt['name']} (Hiện có: {bal:,} Xu).", "red")
                return
            if xp_lvl < nxt["xp_lvl"]:
                self.msg(player, f"Cần Cấp độ Kinh Nghiệm (XP Level) >= {nxt['xp_lvl']} (Hiện có: Lv.{xp_lvl}).", "red")
                return

            self.add_bal(player, -nxt["cost"])
            self.rcon.cmd(f"xp add {player} -{nxt['xp_lvl']} levels")
            self.data["rebirths"][player] = nxt["level"]
            self.save_data()
            self.apply_rebirth_attributes(player, nxt)
            self.rcon.cmd(f"execute at {player} run summon firework_rocket ~ ~1 ~ {{LifeTime:15}}")
            self.rcon.cmd(f"execute at {player} run playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1 1")
            self.broadcast(f"⚡ Đạo hữu {player} đã Độ Kiếp thành công lên cảnh giới [{nxt['name']} - Tầng {nxt['level']}]! (+{nxt['hp']//2} Tim, +{nxt['dmg']} Sát thương, +{nxt['bonus']}% Giá bán)", "light_purple")
            return

        cur_name = REBIRTH_REALMS[cur_lvl - 1]["name"] if cur_lvl > 0 else "Phàm Nhân (Chưa Tu Luyện)"
        self.msg(player, f"=== TU LUYỆN CHUYỂN SINH ({cur_lvl}/10: {cur_name}) ===", "aqua")
        if cur_lvl < len(REBIRTH_REALMS):
            nxt = REBIRTH_REALMS[cur_lvl]
            self.msg(player, f"Cảnh giới kế tiếp: [{nxt['level']}] {nxt['name']} | Yêu cầu: {nxt['cost']:,} Xu + {nxt['xp_lvl']} XP Levels", "yellow")
            self.msg(player, f"Đột phá nhận Vĩnh Viễn: {nxt['hp']} Máu ({nxt['hp']//2} Tim), +{nxt['dmg']} Sát thương tay, +{nxt['bonus']}% Giá bán. Gõ /chuyensinh dotpha để Độ Kiếp!", "green")
        else:
            self.msg(player, "Bạn đã viên mãn Đại Đạo 10/10 cảnh giới!", "light_purple")

    def apply_rebirth_attributes(self, player, realm):
        self.rcon.cmd(f"attribute {player} minecraft:max_health base set {realm['hp']}")
        self.rcon.cmd(f"attribute {player} minecraft:attack_damage base set {1 + realm['dmg']}")
        self.rcon.cmd(f"attribute {player} minecraft:movement_speed base set {realm['spd']}")
        self.rcon.cmd(f"effect give {player} minecraft:instant_health 1 5 true")

    # ==========================================================================
    # 2. ACTIVE RPG SKILLS (/kynang)
    # ==========================================================================
    def handle_skills(self, player, args):
        if not args or args[0].lower() in ("info", "help", "list"):
            self.msg(player, "=== TUYỆT KỸ CHỦ ĐỘNG RPG (/kynang <1-4>) ===", "aqua")
            self.msg(player, "1. /kynang 1 — ⚡ Lôi Đình Vạn Quân (Giật sét AOE 12m + 50 Sát thương)", "yellow")
            self.msg(player, "2. /kynang 2 — ⛏️ Cuồng Nộ Thợ Mỏ (Haste IV + Speed III 30s + Làm mới mỏ quặng)", "green")
            self.msg(player, "3. /kynang 3 — 🛡️ Kim Cang Bất Hoại (Absorption V + Res III + Regen III 20s)", "gold")
            self.msg(player, "4. /kynang 4 — 🌌 Hố Đen Thôn Phệ (Gom quái 14m + Wither III + Hút XP)", "light_purple")
            return

        sk = args[0]
        if sk not in ("1", "2", "3", "4"):
            self.msg(player, "Chọn kỹ năng từ 1 đến 4: /kynang 1, /kynang 2, /kynang 3, hoặc /kynang 4", "red")
            return

        now = time.time()
        cd_key = f"{player}:{sk}"
        if now - self.skill_cooldowns.get(cd_key, 0) < 30:
            rem = int(30 - (now - self.skill_cooldowns[cd_key]))
            self.msg(player, f"Kỹ năng đang hồi chiêu! Còn {rem} giây.", "red")
            return
        self.skill_cooldowns[cd_key] = now

        if sk == "1":
            self.rcon.cmd(f"execute at {player} at @e[distance=1..12,type=!player,type=!villager,type=!armor_stand,type=!item,tag=!skyblock_pet] run summon lightning_bolt ~ ~ ~")
            self.rcon.cmd(f"execute at {player} as @e[distance=1..12,type=!player,type=!villager,type=!armor_stand,type=!item,tag=!skyblock_pet] run damage @s 50 minecraft:magic by {player}")
            self.rcon.cmd(f"execute at {player} run particle flash ~ ~1 ~ 1 1 1 0 3 force")
            self.msg(player, "⚡ Bạn đã thi triển [Lôi Đình Vạn Quân] giáng sấm sét hủy diệt mục tiêu quanh 12m!", "aqua")
        elif sk == "2":
            self.rcon.cmd(f"effect give {player} minecraft:haste 30 3 true")
            self.rcon.cmd(f"effect give {player} minecraft:speed 30 2 true")
            self.rcon.cmd("function skyblock:regen_deep_caverns")
            self.rcon.cmd(f"execute at {player} run particle totem_of_undying ~ ~1 ~ 0.8 0.8 0.8 0.2 40 force")
            self.msg(player, "⛏️ [Cuồng Nộ Thợ Mỏ] kích hoạt! Haste IV + Speed III trong 30s & Tái tạo toàn bộ Mỏ Quặng!", "green")
        elif sk == "3":
            self.rcon.cmd(f"effect give {player} minecraft:absorption 20 4 true")
            self.rcon.cmd(f"effect give {player} minecraft:resistance 20 2 true")
            self.rcon.cmd(f"effect give {player} minecraft:regeneration 20 2 true")
            self.rcon.cmd(f"effect give {player} minecraft:fire_resistance 20 0 true")
            self.rcon.cmd(f"execute at {player} run playsound minecraft:item.totem.use master @a ~ ~ ~ 1 1")
            self.msg(player, "🛡️ [Kim Cang Bất Hoại] kích hoạt! Bất hoại hộ thể + Hồi phục tối đa trong 20s!", "gold")
        elif sk == "4":
            self.rcon.cmd(f"execute at {player} run tp @e[distance=2..14,type=!player,type=!villager,type=!armor_stand,type=!item,tag=!skyblock_pet] ^ ^ ^3")
            self.rcon.cmd(f"execute at {player} run effect give @e[distance=1..8,type=!player,type=!villager,type=!armor_stand] minecraft:wither 10 2 true")
            self.rcon.cmd(f"execute at {player} run effect give @e[distance=1..8,type=!player,type=!villager,type=!armor_stand] minecraft:slowness 10 3 true")
            self.rcon.cmd(f"execute at {player} run particle portal ~ ~1.5 ~ 2 2 2 0.5 120 force")
            self.rcon.cmd(f"xp add {player} 50 points")
            self.msg(player, "🌌 [Hố Đen Thôn Phệ] cuốn hút toàn bộ quái vật trong 14m về phía trước +50 XP!", "light_purple")

    # ==========================================================================
    # 3. FLYING COMPANION PETS (/pet, /thucung)
    # ==========================================================================
    def handle_pets(self, player, args):
        p_data = self.data["pets"].setdefault(player, {"owned": [], "active": None})
        sub = args[0].lower() if args else "list"

        if sub == "list":
            self.msg(player, "=== LINH THÚ ĐỒNG HÀNH (/pet buy <id> | /pet equip <id>) ===", "aqua")
            for pid, p in PETS.items():
                status = "[ĐANG TRIỆU HỒI]" if p_data["active"] == pid else ("[ĐÃ SỞ HỮU]" if pid in p_data["owned"] else f"{p['cost']:,} Xu")
                self.msg(player, f"• {pid}: {p['name']} ({status}) — {p['desc']}", p["color"])
            return

        if sub == "buy" and len(args) >= 2:
            pid = args[1].lower()
            if pid not in PETS:
                self.msg(player, f"Không tìm thấy Linh Thú '{pid}'. Gõ /pet list để xem danh sách.", "red")
                return
            if pid in p_data["owned"]:
                self.msg(player, "Bạn đã sở hữu Linh Thú này rồi! Gõ /pet equip " + pid, "yellow")
                return
            cost = PETS[pid]["cost"]
            if self.get_bal(player) < cost:
                self.msg(player, f"Cần {cost:,} Xu để chiêu mộ {PETS[pid]['name']}!", "red")
                return
            self.add_bal(player, -cost)
            p_data["owned"].append(pid)
            self.save_data()
            self.equip_pet(player, pid)
            return

        if sub in ("equip", "summon") and len(args) >= 2:
            pid = args[1].lower()
            if pid not in p_data["owned"]:
                self.msg(player, f"Bạn chưa sở hữu '{pid}'. Gõ /pet buy {pid} trước!", "red")
                return
            self.equip_pet(player, pid)
            return

        if sub in ("unequip", "dismiss", "off"):
            self.rcon.cmd(f"kill @e[tag=pet_{player}]")
            p_data["active"] = None
            self.save_data()
            self.msg(player, "Đã thu hồi Linh Thú vào không gian linh hồn.", "yellow")

    def equip_pet(self, player, pid):
        p = PETS[pid]
        p_data = self.data["pets"].setdefault(player, {"owned": [], "active": None})
        p_data["active"] = pid
        self.save_data()
        self.rcon.cmd(f"kill @e[tag=pet_{player}]")
        name_json = json.dumps({"text": f"{p['name']} [{player}]", "color": p["color"], "bold": True})
        self.rcon.cmd(
            f"execute at {player} run summon {p['entity']} ^0.75 ^1.25 ^-0.35 "
            f"{{Tags:[\"skyblock_pet\",\"pet_{player}\"],CustomName:'{name_json}',CustomNameVisible:1b,"
            f"NoAI:1b,Invulnerable:1b,Silent:1b,NoGravity:1b,PersistenceRequired:1b{p['nbt']}}}"
        )
        self.msg(player, f"Đã triệu hồi {p['name']} bay bên vai bạn! (+{p['bonus']}% giá bán & Buff chủ động)", "green")

    def tick_pets_and_auras(self):
        """1.0s loop moving active shoulder pets and emitting Rebirth & Pet particles."""
        for player, p_data in self.data.get("pets", {}).items():
            active = p_data.get("active")
            if active and active in PETS:
                self.rcon.cmd(f"execute at {player} run tp @e[tag=pet_{player},limit=1] ^0.75 ^1.25 ^-0.35 ~ ~")
                if active == "allay":
                    self.rcon.cmd(f"execute at {player} run tp @e[type=item,distance=..7] ~ ~0.5 ~")
        for player, r_lvl in self.data.get("rebirths", {}).items():
            if 1 <= int(r_lvl) <= len(REBIRTH_REALMS):
                pt = REBIRTH_REALMS[int(r_lvl) - 1]["particle"]
                self.rcon.cmd(f"execute at {player} run particle {pt} ~ ~1.0 ~ 0.35 0.5 0.35 0.02 4 force")

    # ==========================================================================
    # 4. PASSIVE TALISMANS (/bua, /congu) & VOID RESCUE
    # ==========================================================================
    def handle_talisman(self, player, args):
        owned = self.data["talismans"].setdefault(player, [])
        sub = args[0].lower() if args else "list"
        if sub in ("list", "active", "info"):
            self.msg(player, f"=== CỔ NGỮ / BÙA HỘ MỆNH (Tổng thưởng hiện tại: +{self.get_total_bonus_pct(player)}%) ===", "aqua")
            for tid, t in TALISMANS.items():
                st = "[ĐÃ KÍCH HOẠT]" if tid in owned else f"{t['cost']:,} Xu"
                self.msg(player, f"• {tid}: {t['name']} ({st}) — {t['desc']}", "green" if tid in owned else "yellow")
            return
        if sub == "buy" and len(args) >= 2:
            tid = args[1].lower()
            if tid not in TALISMANS:
                self.msg(player, "Mã Cổ Ngữ không hợp lệ! Gõ /bua list để xem.", "red")
                return
            if tid in owned:
                self.msg(player, "Bạn đã sở hữu Cổ Ngữ này rồi!", "yellow")
                return
            cost = TALISMANS[tid]["cost"]
            if self.get_bal(player) < cost:
                self.msg(player, f"Cần {cost:,} Xu để thỉnh {TALISMANS[tid]['name']}!", "red")
                return
            self.add_bal(player, -cost)
            owned.append(tid)
            self.save_data()
            self.apply_passives(player)
            self.msg(player, f"🔮 Đã khắc ấn {TALISMANS[tid]['name']} vĩnh viễn vào Linh Hồn!", "light_purple")

    def apply_passives(self, player=None):
        targets = [player] if player else list(set(list(self.data["talismans"].keys()) + list(self.data["pets"].keys()) + list(self.data["rebirths"].keys())))
        for p in targets:
            for tid in self.data["talismans"].get(p, []):
                if tid in TALISMANS:
                    for eff, amp in TALISMANS[tid]["effects"]:
                        self.rcon.cmd(f"effect give {p} {eff} 25 {amp} true")
                if tid == "immortal":
                    self.rcon.cmd(f"execute as {p} at @s if entity @s[y=-120,dy=80] run tp @s ~ 125 ~")
                    self.rcon.cmd(f"execute as {p} at @s if entity @s[y=124,dy=3] run effect give @s minecraft:slow_falling 10 0 true")
            active_pet = self.data["pets"].get(p, {}).get("active")
            if active_pet in PETS:
                for eff, amp in PETS[active_pet]["effects"]:
                    self.rcon.cmd(f"effect give {p} {eff} 25 {amp} true")
            r_lvl = int(self.data["rebirths"].get(p, 0))
            if 1 <= r_lvl <= len(REBIRTH_REALMS):
                self.apply_rebirth_attributes(p, REBIRTH_REALMS[r_lvl - 1])

    # ==========================================================================
    # 5. ECONOMY & MULTI-REALM TELEPORTS (/sellall, /hammo, /dungeon, /nangcap)
    # ==========================================================================
    def handle_sellall(self, player):
        inv_raw = self.rcon.cmd(f"data get entity {player} Inventory")
        if not inv_raw or "Inventory" not in inv_raw:
            self.msg(player, "Không tìm thấy khoáng sản hay nông sản nào để bán!", "red")
            return
        total_base = 0
        sold_items = []
        for item_id, price in SELL_PRICES.items():
            matches = re.findall(rf'id:\s*"minecraft:{item_id}".*?count:\s*(\d+)b?', inv_raw)
            count = sum(int(x) for x in matches)
            if count > 0:
                self.rcon.cmd(f"clear {player} minecraft:{item_id} {count}")
                total_base += count * price
                sold_items.append(f"{count}x {item_id}")
        if total_base == 0:
            self.msg(player, "Túi đồ không có vật phẩm nào có thể bán!", "yellow")
            return
        bonus_pct = self.get_total_bonus_pct(player)
        final_gold = int(total_base * (1.0 + bonus_pct / 100.0))
        self.add_bal(player, final_gold)
        self.add_quest_progress(player, "trading", final_gold)
        self.msg(player, f"Đã bán ({', '.join(sold_items[:5])}) nhận {final_gold:,} Xu (Thưởng Cổ Ngữ/Tu Luyện/Pet: +{bonus_pct}%)!", "green")

    def give_royal_ticket(self, player, count=1):
        ticket_cmd = (
            f'give {player} minecraft:gold_nugget['
            f'minecraft:custom_data={{ancient_mat:"royal_ticket"}},'
            f'minecraft:item_name=\'{{"text":"🎫 Vé Vàng Hoàng Gia 🎫","color":"gold","bold":true}}\','
            f'minecraft:lore=[\'{{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"}}\','
            f'\'{{"text":"Tấm vé danh dự nạm vàng trao thưởng cho người chiến thắng Casino.","color":"yellow","italic":true}}\','
            f'\'{{"text":"⚡ Dùng để đổi Danh Hiệu VIP & Phôi Trang Phục Đặc Quyền","color":"gold"}}\','
            f'\'{{"text":"[Nguồn]: Cung Điện Casino world_casino (/xoso, /cf, /cotyphu)","color":"light_purple","bold":true}}\','
            f'\'{{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"}}\']'
            f'] {count}'
        )
        self.rcon.cmd(ticket_cmd)

    def handle_xoso(self, player, args):
        if not args:
            self.rcon.cmd(f"function skyblock:commands/xoso")
            return

        raw_arg = args[0].lower().replace("k", "000").replace("m", "000000").replace(",", "").replace(".", "")
        try:
            bet = int(raw_arg)
            if bet < 500:
                self.msg(player, "Mức cược vé số tối thiểu là $500 Xu!", "red")
                return
        except ValueError:
            self.msg(player, "Mức cược không hợp lệ! Ví dụ: /xoso 1000 hoặc /xoso 5k", "red")
            return

        if self.get_bal(player) < bet:
            self.msg(player, f"Bạn không có đủ {bet:,} Xu để mua vé số!", "red")
            return

        self.add_bal(player, -bet)
        import random
        roll = random.random()
        if roll < 0.05:  # 5% Jackpot: X20 + 2 Royal Tickets
            prize = bet * 20
            self.add_bal(player, prize)
            self.give_royal_ticket(player, 2)
            self.msg(player, f"🎰 NỔ HŨ JACKPOT MEGA! Bạn trúng ${prize:,} Xu + 2 Vé Vàng Hoàng Gia!", "gold")
            self.broadcast(f"🎉 NGƯỜI CHƠI {player} VỪA NỔ HŨ XỔ SỐ MEGA TRÚNG ${prize:,} XU & 2 VÉ VÀNG HOÀNG GIA!", "gold")
            self.rcon.cmd(f"execute at {player} run playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1 1")
            self.rcon.cmd(f"execute at {player} run summon firework_rocket ~ ~1 ~ {{LifeTime:20}}")
        elif roll < 0.20:  # 15% Minor win: X3 + 1 Royal Ticket
            prize = bet * 3
            self.add_bal(player, prize)
            self.give_royal_ticket(player, 1)
            self.msg(player, f"🎟 TRÚNG SỐ! Bạn nhận ${prize:,} Xu + 1 Vé Vàng Hoàng Gia!", "green")
            self.rcon.cmd(f"execute at {player} run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 1.2")
        else:
            self.msg(player, f"Chúc bạn may mắn lần sau! Mất ${bet:,} Xu. Thử lại với /xoso {bet}!", "gray")
            self.rcon.cmd(f"execute at {player} run playsound minecraft:block.stone_button.click_off player @s ~ ~ ~ 1 0.8")

    def handle_cf(self, player, args):
        if not args:
            self.rcon.cmd(f"function skyblock:commands/cf")
            return

        raw_arg = args[0].lower().replace("k", "000").replace("m", "000000").replace(",", "").replace(".", "")
        try:
            bet = int(raw_arg)
            if bet < 500:
                self.msg(player, "Mức cược Coinflip tối thiểu là $500 Xu!", "red")
                return
        except ValueError:
            self.msg(player, "Mức cược không hợp lệ! Ví dụ: /cf 5000 hoặc /cf 50k", "red")
            return

        if self.get_bal(player) < bet:
            self.msg(player, f"Bạn không có đủ {bet:,} Xu để đặt cược!", "red")
            return

        self.add_bal(player, -bet)
        import random
        win = random.choice([True, False])
        if win:
            prize = bet * 2
            self.add_bal(player, prize)
            got_ticket = random.random() < 0.15
            if got_ticket:
                self.give_royal_ticket(player, 1)
                self.msg(player, f"🪙 THẮNG COINFLIP! Đồng xu lật trúng! Nhận ${prize:,} Xu + 1 Vé Vàng Hoàng Gia!", "gold")
            else:
                self.msg(player, f"🪙 THẮNG COINFLIP! Đồng xu lật trúng! Nhận ${prize:,} Xu!", "green")
            self.rcon.cmd(f"execute at {player} run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1 1.5")
        else:
            self.msg(player, f"🪙 THUA COINFLIP! Đồng xu lật trượt, mất ${bet:,} Xu. Thử lại với /cf {bet}!", "red")
            self.rcon.cmd(f"execute at {player} run playsound minecraft:block.stone_button.click_off player @s ~ ~ ~ 1 0.8")

    def sync_auraskills_scoreboard(self):
        """
        Reads usercache.json and plugins/AuraSkills/userdata/<uuid>.yml
        Syncs fighting, farming, fishing, agility, and total power levels to scoreboard objectives.
        """
        usercache_file = BASE_DIR / "usercache.json"
        auraskills_dir = BASE_DIR / "plugins" / "AuraSkills" / "userdata"
        if not usercache_file.exists() or not auraskills_dir.exists():
            return

        try:
            users = json.loads(usercache_file.read_text(encoding="utf-8"))
        except Exception:
            return

        for user_entry in users:
            name = user_entry.get("name")
            uuid_str = user_entry.get("uuid")
            if not name or not uuid_str:
                continue

            # Ensure scoreboard objectives are initialized to at least 0 for the player
            try:
                self.rcon.cmd(f"scoreboard players add {name} askill_fighting 0")
                self.rcon.cmd(f"scoreboard players add {name} askill_farming 0")
                self.rcon.cmd(f"scoreboard players add {name} askill_fishing 0")
                self.rcon.cmd(f"scoreboard players add {name} askill_agility 0")
                self.rcon.cmd(f"scoreboard players add {name} askill_power 0")
            except Exception:
                pass

            user_yml = auraskills_dir / f"{uuid_str}.yml"
            if not user_yml.exists():
                continue

            try:
                content = user_yml.read_text(encoding="utf-8")
                skills = {}
                parsed_yaml = False
                try:
                    import yaml
                    yd = yaml.safe_load(content)
                    if isinstance(yd, dict):
                        sk_data = yd.get("skills", {})
                        if isinstance(sk_data, dict):
                            for sk_k, sk_v in sk_data.items():
                                if isinstance(sk_v, dict) and "level" in sk_v:
                                    full_k = sk_k if "/" in sk_k else f"auraskills/{sk_k}"
                                    skills[full_k] = int(sk_v.get("level", 0))
                            parsed_yaml = True
                except Exception:
                    parsed_yaml = False

                if not parsed_yaml:
                    current_skill = None
                    for line in content.splitlines():
                        stripped = line.strip()
                        if stripped.startswith("auraskills/"):
                            current_skill = stripped.rstrip(":")
                        elif current_skill and stripped.startswith("level:"):
                            lvl = int(stripped.split(":", 1)[1].strip())
                            skills[current_skill] = lvl
                            current_skill = None

                fighting = skills.get("auraskills/fighting", 0)
                farming = skills.get("auraskills/farming", 0)
                fishing = skills.get("auraskills/fishing", 0)
                agility = skills.get("auraskills/agility", 0)
                power = sum(skills.values())

                self.rcon.cmd(f"scoreboard players set {name} askill_fighting {fighting}")
                self.rcon.cmd(f"scoreboard players set {name} askill_farming {farming}")
                self.rcon.cmd(f"scoreboard players set {name} askill_fishing {fishing}")
                self.rcon.cmd(f"scoreboard players set {name} askill_agility {agility}")
                self.rcon.cmd(f"scoreboard players set {name} askill_power {power}")
            except Exception:
                pass

    def handle_command(self, player, raw_cmd):
        parts = raw_cmd.strip().lstrip("/").split()
        if not parts:
            return
        cmd = parts[0].lower()
        args = parts[1:]

        if cmd in ("chuyensinh", "rebirth", "tuluyen"):
            self.handle_rebirth(player, args)
        elif cmd in ("kynang", "skill", "cast"):
            self.handle_skills(player, args)
        elif cmd in ("pet", "thucung"):
            self.handle_pets(player, args)
        elif cmd in ("bua", "congu", "talisman"):
            self.handle_talisman(player, args)
        elif cmd in ("gem", "gems", "linhthach"):
            self.handle_gems(player, args)
        elif cmd in ("nv", "nhiemvu", "quest", "daily"):
            self.handle_daily_quests(player, args)
        elif cmd in ("thanhtuu", "achievements"):
            self.handle_achievements(player, args)
        elif cmd in ("hammo", "deepcaverns", "mine"):
            self.rcon.cmd(f"tp {player} 160.5 111 0.5 -90 0")
            self.msg(player, "⛏️ Đã dịch chuyển đến [Lục Địa Hầm Mỏ Tự Tái Tạo - Deep Caverns]!", "aqua")
        elif cmd in ("dungeon", "hamnguc", "rhong"):
            if args and args[0].lower() == "boss":
                self.rcon.cmd("function skyblock:summon_dungeon_boss")
            else:
                self.rcon.cmd(f"tp {player} 0.5 87 102.5 0 0")
                self.msg(player, "🏰 Đã tiến vào [Địa Đạo Hầm Ngục Rhông]! Gõ /dungeon boss khi tới phòng cuối để triệu hồi Hắc Ám Địa Ngục Vương!", "light_purple")
        elif cmd == "boss5":
            self.rcon.cmd("function skyblock:summon_boss_5")
        elif cmd == "boss6":
            self.rcon.cmd("function skyblock:summon_boss_6")
        elif cmd == "nangcap":
            self.rcon.cmd(f"dm open nangcap {player}")
            if args and args[0].lower() == "sync":
                ensure_v3_datapack_files()
                self.rcon.cmd("reload")
                self.rcon.cmd("function skyblock:build_spawn")
                self.rcon.cmd("function skyblock:build_bridges")
                self.rcon.cmd("function skyblock:build_deep_caverns")
                self.rcon.cmd("function skyblock:build_rhong_dungeon")
                self.rcon.cmd("function skyblock:build_boss_multi")
                self.broadcast("Đã đồng bộ toàn bộ kiến trúc V3.0 (Spawn Hub, Cầu Nối, Cổng Stargate, Lục Địa Hầm Mỏ, Hầm Ngục Rhông & Boss 1-6)!", "green")
        elif cmd in ("menu", "guimenu"):
            self.rcon.cmd(f"dm open menu {player}")
        elif cmd in ("warp", "warps"):
            self.rcon.cmd(f"dm open warp {player}")
        elif cmd in ("xoso", "lottery", "ve_so"):
            self.handle_xoso(player, args)
        elif cmd in ("cf", "coinflip", "tungxu"):
            self.handle_cf(player, args)
        elif cmd == "sellall":
            self.handle_sellall(player)
        elif cmd == "bal":
            self.msg(player, f"Số dư hiện tại: {self.get_bal(player):,} Xu (Tổng thưởng bán hàng: +{self.get_total_bonus_pct(player)}%)", "gold")
        elif cmd == "mayquang":
            self.minion_mgr.build_royal_ore_temple(player)
        elif cmd == "is" and args:
            self.minion_mgr.handle_is_subcommand(player, args, self.get_bal, self.add_bal, self.get_total_bonus_pct)

    def process_log_line(self, line):
        m_cmd = re.search(r"(\w+) issued server command: /(.+)$", line)
        if m_cmd:
            self.handle_command(m_cmd.group(1), m_cmd.group(2))

    def run(self):
        print("[Skyblock V3.0] Synchronizing V2.0 + V3.0 Datapack files...")
        ensure_v3_datapack_files()
        print("[Skyblock V3.0] Economy, Minions & MMORPG Daemon started!")
        last_minion_tick = 0.0
        last_pet_tick = 0.0
        last_passive_tick = 0.0
        last_auraskills_sync = 0.0

        log_file = None
        current_ino = None

        while True:
            # Check rotation, truncation, or reopen
            if log_file:
                try:
                    st = os.stat(str(LOG_FILE))
                    curr_pos = log_file.tell()
                    is_truncated = st.st_size < curr_pos
                    is_rotated = (current_ino is not None and st.st_ino != current_ino)

                    if is_rotated:
                        try:
                            while True:
                                leftover = log_file.readline()
                                if not leftover:
                                    break
                                self.process_log_line(leftover)
                        except Exception:
                            pass

                    if is_truncated or is_rotated:
                        try:
                            log_file.close()
                        except Exception:
                            pass
                        log_file = open_log_shared(LOG_FILE)
                        if log_file:
                            current_ino = st.st_ino
                            log_file.seek(0, os.SEEK_SET)
                        else:
                            current_ino = None
                except (FileNotFoundError, PermissionError):
                    try:
                        log_file.close()
                    except Exception:
                        pass
                    log_file = None
                    current_ino = None
                except Exception:
                    pass

            if not log_file and LOG_FILE.exists():
                try:
                    st = os.stat(str(LOG_FILE))
                    log_file = open_log_shared(LOG_FILE)
                    if log_file:
                        current_ino = st.st_ino
                        log_file.seek(0, os.SEEK_END)
                except (FileNotFoundError, PermissionError):
                    log_file = None
                    current_ino = None
                except Exception:
                    log_file = None
                    current_ino = None

            # Read new lines if available
            had_line = False
            if log_file:
                while True:
                    line = log_file.readline()
                    if not line:
                        break
                    had_line = True
                    self.process_log_line(line)

            now = time.time()
            if now - last_pet_tick >= 1.0:
                self.tick_pets_and_auras()
                last_pet_tick = now
            if now - last_minion_tick >= 2.5:
                self.minion_mgr.tick_all_minions()
                last_minion_tick = now
            if now - last_passive_tick >= 8.0:
                self.apply_passives()
                last_passive_tick = now
            if now - last_auraskills_sync >= 5.0:
                self.sync_auraskills_scoreboard()
                last_auraskills_sync = now

            if not had_line:
                time.sleep(0.1)


if __name__ == "__main__":
    SkyblockDaemon().run()
