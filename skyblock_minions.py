# ==============================================================================
# SKYBLOCK MINIONS & AUTO-BUILDER ENGINE V2.0 (PAPER 1.21.4)
# ==============================================================================
# Hỗ trợ 4 Loại Minions Hoạt Động Thực Tế Trên Đảo:
# 1. Minion Đào (Miner) - T1..T12: Vung cúp đập quặng thực tế trước mặt, hút vật phẩm & tái tạo mạch quặng
# 2. Minion Trồng Trọt (Farmer) - T1..T12: Thu hoạch cây chín & tự động gieo hạt trồng lại
# 3. Minion Săn Bắt Quái (Slayer) - T1..T12: Tự xoay mặt về phía quái, vung kiếm chém lan & hút đồ rơi
# 4. Minion Thợ Xây & Mở Rộng Đảo (Builder) - T1..T5: Lát sàn hoa văn & hỗ trợ thi công siêu kiến trúc
# Kèm Hệ Thống Tính Toán Sản Lượng Ngoại Tuyến (Offline Catch-Up), Bán Nhanh Kho, Nạp Nhiên Liệu & Đặt Lại Vị Trí
# ==============================================================================

import sqlite3
import os
import time
import json
import random

DB_PATH = os.path.join(os.path.dirname(__file__), 'minions.db')

def init_db():
    conn = sqlite3.connect(DB_PATH)
    cur = conn.cursor()
    cur.execute('''
    CREATE TABLE IF NOT EXISTS minions (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        owner TEXT NOT NULL,
        minion_type TEXT NOT NULL,
        tier INTEGER DEFAULT 1,
        world TEXT DEFAULT 'IridiumSkyblock',
        x REAL NOT NULL,
        y REAL NOT NULL,
        z REAL NOT NULL,
        created_at REAL NOT NULL,
        last_harvest_at REAL NOT NULL,
        stored_count INTEGER DEFAULT 0,
        fuel_type TEXT DEFAULT 'none',
        fuel_until REAL DEFAULT 0
    )
    ''')
    cur.execute('''
    CREATE TABLE IF NOT EXISTS builder_snapshots (
        player TEXT PRIMARY KEY,
        structure TEXT NOT NULL,
        cost INTEGER NOT NULL,
        built_at REAL NOT NULL
    )
    ''')
    cur.execute('''
    CREATE TABLE IF NOT EXISTS minion_storage (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        minion_id INTEGER NOT NULL,
        item_id TEXT NOT NULL,
        count INTEGER NOT NULL,
        last_updated REAL NOT NULL
    )
    ''')
    # Schema Migration for V2: Check and add new columns safely
    cur.execute("PRAGMA table_info(minions)")
    cols = [r[1] for r in cur.fetchall()]
    if 'range_level' not in cols:
        cur.execute("ALTER TABLE minions ADD COLUMN range_level INTEGER DEFAULT 1")
    if 'speed_level' not in cols:
        cur.execute("ALTER TABLE minions ADD COLUMN speed_level INTEGER DEFAULT 1")
    if 'storage_level' not in cols:
        cur.execute("ALTER TABLE minions ADD COLUMN storage_level INTEGER DEFAULT 1")
    if 'tool_level' not in cols:
        cur.execute("ALTER TABLE minions ADD COLUMN tool_level INTEGER DEFAULT 1")
    if 'skin_id' not in cols:
        cur.execute("ALTER TABLE minions ADD COLUMN skin_id TEXT DEFAULT 'default'")
    conn.commit()
    conn.close()

init_db()

# Cấu hình sản phẩm, giá bán quy đổi & khối quặng sinh thực tế theo từng Tier của 4 loại Minion
MINION_CONFIG = {
    'miner': {
        'title': 'MINION ĐÀO KHOÁNG SẢN',
        'color': 'aqua',
        'tool': 'netherite_pickaxe',
        'skin': 'MHF_Villager',
        'armor_color': 65535,
        'base_cost': 5000,
        'item_map': {
            1: ('cobblestone', 'Đá Cuội', 12.0, 5.0, 'cobblestone'),
            2: ('coal', 'Than Đá', 11.0, 15.0, 'coal_ore'),
            3: ('raw_copper', 'Đồng Thô', 10.0, 12.0, 'copper_ore'),
            4: ('raw_iron', 'Sắt Thô', 9.5, 18.0, 'iron_ore'),
            5: ('raw_gold', 'Vàng Thô', 9.0, 20.0, 'gold_ore'),
            6: ('redstone', 'Bột Đá Đỏ', 8.5, 10.0, 'redstone_ore'),
            7: ('lapis_lazuli', 'Ngọc Lưu Ly', 8.0, 12.0, 'lapis_ore'),
            8: ('diamond', 'Kim Cương', 7.5, 100.0, 'diamond_ore'),
            9: ('emerald', 'Ngọc Lục Bảo', 7.0, 40.0, 'emerald_ore'),
            10: ('iron_block', 'Khối Sắt', 6.0, 180.0, 'iron_block'),
            11: ('gold_block', 'Khối Vàng', 5.5, 200.0, 'gold_block'),
            12: ('diamond_block', 'Khối Kim Cương', 4.5, 900.0, 'diamond_block')
        }
    },
    'farmer': {
        'title': 'MINION TRỒNG TRỌT',
        'color': 'green',
        'tool': 'golden_hoe',
        'skin': 'MHF_Villager',
        'armor_color': 65280,
        'base_cost': 5000,
        'item_map': {
            1: ('wheat', 'Lúa Mì', 12.0, 8.0, 'wheat'),
            2: ('carrot', 'Cà Rốt', 11.0, 10.0, 'carrots'),
            3: ('potato', 'Khoai Tây', 10.5, 12.0, 'potatoes'),
            4: ('beetroot', 'Củ Cải Đỏ', 10.0, 14.0, 'beetroots'),
            5: ('sugar_cane', 'Mía Đường', 9.5, 16.0, 'sugar_cane'),
            6: ('bamboo', 'Cây Tre', 9.0, 18.0, 'bamboo'),
            7: ('melon_slice', 'Dưa Hấu', 8.0, 22.0, 'melon'),
            8: ('pumpkin', 'Bí Ngô', 7.5, 28.0, 'pumpkin'),
            9: ('red_mushroom', 'Nấm Đỏ', 7.0, 35.0, 'red_mushroom'),
            10: ('sweet_berries', 'Quả Mọng Ngọt', 6.0, 45.0, 'sweet_berries'),
            11: ('golden_apple', 'Táo Vàng', 5.5, 150.0, 'gold_block'),
            12: ('enchanted_golden_apple', 'Táo Vàng Phù Phép', 5.0, 500.0, 'gold_block')
        }
    },
    'slayer': {
        'title': 'MINION SĂN BẮT QUÁI',
        'color': 'red',
        'tool': 'netherite_sword',
        'skin': 'MHF_Golem',
        'armor_color': 16711680,
        'base_cost': 7500,
        'item_map': {
            1: ('rotten_flesh', 'Thịt Thối', 12.0, 10.0, 'rotten_flesh'),
            2: ('bone', 'Xương', 11.0, 14.0, 'bone'),
            3: ('string', 'Tơ Nhện', 10.5, 16.0, 'string'),
            4: ('spider_eye', 'Mắt Nhện', 10.0, 20.0, 'spider_eye'),
            5: ('gunpowder', 'Thuốc Súng', 9.0, 25.0, 'gunpowder'),
            6: ('arrow', 'Mũi Tên', 8.5, 30.0, 'arrow'),
            7: ('blaze_rod', 'Que Quỷ Lửa', 7.5, 50.0, 'blaze_rod'),
            8: ('ender_pearl', 'Ngọc Ender', 7.0, 75.0, 'ender_pearl'),
            9: ('ghast_tear', 'Nước Mắt Ghast', 6.5, 110.0, 'ghast_tear'),
            10: ('shulker_shell', 'Mảnh Vỏ Shulker', 6.0, 180.0, 'shulker_shell'),
            11: ('wither_skeleton_skull', 'Đầu Lâu Wither', 5.0, 400.0, 'wither_skeleton_skull'),
            12: ('nether_star', 'Sao Hư Không', 4.5, 1000.0, 'nether_star')
        }
    },
    'builder': {
        'title': 'MINION THỢ XÂY & KIẾN TRÚC',
        'color': 'gold',
        'tool': 'golden_pickaxe',
        'skin': 'MHF_Alex',
        'armor_color': 16755200,
        'base_cost': 10000,
        'item_map': {
            1: ('polished_andesite', 'Khối Sàn Đá Mài', 10.0, 15.0, 'polished_andesite'),
            2: ('cherry_planks', 'Khối Sàn Gỗ Cherry', 8.5, 25.0, 'cherry_planks'),
            3: ('smooth_quartz', 'Khối Thạch Anh Mài', 7.0, 40.0, 'smooth_quartz'),
            4: ('deepslate_tiles', 'Khối Gạch Phiến Sâu', 5.5, 65.0, 'deepslate_tiles'),
            5: ('sea_lantern', 'Đèn Biển Hoàng Gia', 4.5, 120.0, 'sea_lantern'),
            6: ('prismarine_bricks', 'Gạch Hải Tinh', 4.0, 150.0, 'prismarine_bricks'),
            7: ('purpur_block', 'Khối Purpur Hoàng Gia', 3.8, 180.0, 'purpur_block'),
            8: ('crying_obsidian', 'Hắc Diện Thạch Lệ', 3.5, 220.0, 'crying_obsidian'),
            9: ('copper_bulb', 'Bóng Đèn Đồng Cổ Kính', 3.2, 260.0, 'copper_bulb'),
            10: ('gilded_blackstone', 'Hắc Thạch Mạ Vàng', 3.0, 320.0, 'gilded_blackstone'),
            11: ('ancient_debris', 'Mảnh Vỡ Cổ Đại Tinh Tế', 2.8, 450.0, 'ancient_debris'),
            12: ('beacon', 'Hải Đăng Sáng Thế', 2.5, 1000.0, 'beacon')
        }
    }
}

MAX_MINIONS_PER_PLAYER = 5
_swing_toggle = False

MINION_SKINS = {
    'default': 'MHF_Villager',
    'cyborg': 'MHF_Enderman',
    'samurai': 'MHF_PigZombie',
    'royal': 'MHF_Alex'
}

TOOL_NAMES = {
    1: ('Gỗ', 1.0),
    2: ('Đá', 1.25),
    3: ('Sắt', 1.5),
    4: ('Kim Cương', 1.75),
    5: ('Netherite', 2.0)
}

def get_storage_cap(tier, storage_level=1):
    if tier <= 3:
        base = 256
    elif tier <= 6:
        base = 512
    elif tier <= 9:
        base = 1024
    else:
        base = 2048
    return base + (max(1, storage_level) - 1) * 256

def get_player_minions(owner):
    conn = sqlite3.connect(DB_PATH)
    cur = conn.cursor()
    cur.execute('SELECT id, owner, minion_type, tier, world, x, y, z, created_at, last_harvest_at, stored_count, fuel_type, fuel_until, range_level, speed_level, storage_level, tool_level, skin_id FROM minions WHERE lower(owner)=lower(?)', (owner,))
    rows = cur.fetchall()
    conn.close()
    
    minions = []
    for r in rows:
        minions.append({
            'id': r[0],
            'owner': r[1],
            'type': r[2],
            'tier': r[3],
            'world': r[4],
            'x': r[5],
            'y': r[6],
            'z': r[7],
            'created_at': r[8],
            'last_harvest_at': r[9],
            'stored_count': r[10],
            'fuel_type': r[11],
            'fuel_until': r[12],
            'range_level': r[13] if len(r) > 13 and r[13] is not None else 1,
            'speed_level': r[14] if len(r) > 14 and r[14] is not None else 1,
            'storage_level': r[15] if len(r) > 15 and r[15] is not None else 1,
            'tool_level': r[16] if len(r) > 16 and r[16] is not None else 1,
            'skin_id': r[17] if len(r) > 17 and r[17] is not None else 'default'
        })
    return minions

def get_minion_by_id(minion_id):
    try:
        minion_id = int(minion_id)
    except (ValueError, TypeError):
        return None
    conn = sqlite3.connect(DB_PATH)
    cur = conn.cursor()
    cur.execute('SELECT id, owner, minion_type, tier, world, x, y, z, created_at, last_harvest_at, stored_count, fuel_type, fuel_until, range_level, speed_level, storage_level, tool_level, skin_id FROM minions WHERE id=?', (minion_id,))
    r = cur.fetchone()
    conn.close()
    if not r:
        return None
    return {
        'id': r[0],
        'owner': r[1],
        'type': r[2],
        'tier': r[3],
        'world': r[4],
        'x': r[5],
        'y': r[6],
        'z': r[7],
        'created_at': r[8],
        'last_harvest_at': r[9],
        'stored_count': r[10],
        'fuel_type': r[11],
        'fuel_until': r[12],
        'range_level': r[13] if len(r) > 13 and r[13] is not None else 1,
        'speed_level': r[14] if len(r) > 14 and r[14] is not None else 1,
        'storage_level': r[15] if len(r) > 15 and r[15] is not None else 1,
        'tool_level': r[16] if len(r) > 16 and r[16] is not None else 1,
        'skin_id': r[17] if len(r) > 17 and r[17] is not None else 'default'
    }

def update_minion_stored(minion_id, stored_count, last_harvest_at):
    conn = sqlite3.connect(DB_PATH)
    cur = conn.cursor()
    cur.execute('UPDATE minions SET stored_count=?, last_harvest_at=? WHERE id=?', (stored_count, last_harvest_at, minion_id))
    conn.commit()
    conn.close()

def catchup_minions(owner, speed_bonus=1.0):
    """Tính toán sản lượng tích lũy theo thời gian thực & ngoại tuyến (Offline Catch-Up)"""
    minions = get_player_minions(owner)
    now = time.time()
    total_new = 0
    
    for m in minions:
        m_type = m['type']
        tier = m['tier']
        cfg = MINION_CONFIG.get(m_type)
        if not cfg:
            continue
        
        tier_data = cfg['item_map'].get(tier) or cfg['item_map'][max(cfg['item_map'].keys())]
        interval = tier_data[2]
        
        speed_lvl = m.get('speed_level', 1)
        tool_lvl = m.get('tool_level', 1)
        storage_lvl = m.get('storage_level', 1)

        # Nếu có nhiên liệu còn hạn -> giảm thời gian 25%
        if m['fuel_until'] > now:
            interval *= 0.75
        if speed_lvl > 1:
            interval /= (1.0 + (speed_lvl - 1) * 0.15)
        if speed_bonus > 1.0:
            interval /= speed_bonus
            
        elapsed = now - m['last_harvest_at']
        if elapsed >= interval:
            produced = int(elapsed // interval)
            cap = get_storage_cap(tier, storage_lvl)
            available_space = max(0, cap - m['stored_count'])
            mult = TOOL_NAMES.get(tool_lvl, ("Gỗ", 1.0))[1]
            actual_produced = int(produced * mult)
            to_add = min(actual_produced, available_space)
            
            new_stored = m['stored_count'] + to_add
            new_last = m['last_harvest_at'] + (produced * interval)
            if new_last > now:
                new_last = now
            update_minion_stored(m['id'], new_stored, new_last)
            total_new += to_add

    return total_new

def spawn_minion_in_world(rcon, player, minion_id, m_type, tier, skin_id='default', tool_level=1):
    cfg = MINION_CONFIG.get(m_type, MINION_CONFIG['miner'])
    tool_prefix = "wooden"
    if tool_level == 2:
        tool_prefix = "stone"
    elif tool_level == 3:
        tool_prefix = "iron"
    elif tool_level == 4:
        tool_prefix = "diamond"
    elif tool_level >= 5:
        tool_prefix = "netherite"

    if m_type == 'miner':
        tool = f"{tool_prefix}_pickaxe"
    elif m_type == 'farmer':
        tool = f"{tool_prefix}_hoe"
    elif m_type == 'slayer':
        tool = f"{tool_prefix}_sword"
    elif m_type == 'builder':
        tool = f"{tool_prefix}_pickaxe"
    else:
        tool = cfg['tool']

    skin_name = MINION_SKINS.get(skin_id, cfg['skin'])
    title = f"🤖 {cfg['title']} [Cấp {tier}]"
    color = cfg['color']
    armor_col = cfg.get('armor_color', 65535)
    
    # Xóa thực thể cũ của minion_id nếu còn tồn tại để tránh nhân bản
    rcon.cmd(f'minecraft:kill @e[tag=minion_{minion_id}]')
    rcon.cmd(f'minecraft:kill @e[tag=minion_interact_{minion_id}]')
    
    # 1. Triệu hồi Armor Stand mặc giáp đồng phục tại vị trí & hướng nhìn chính xác của người chơi
    cmd_stand = (
        f'minecraft:execute as {player} at @s rotated ~ 0 run summon armor_stand ~ ~ ~ '
        f'{{Small:1b,NoGravity:1b,ShowArms:1b,Invulnerable:1b,PersistenceRequired:1b,CustomNameVisible:1b,'
        f'CustomName:\'{{"text":"{title}","color":"{color}","bold":true}}\','
        f'Pose:{{RightArm:[-45f,0f,0f],LeftArm:[-15f,0f,-10f],Head:[5f,0f,0f]}},'
        f'HandItems:[{{id:"minecraft:{tool}",count:1,components:{{"minecraft:enchantment_glint_override":true}}}},{{id:"minecraft:lantern",count:1}}],'
        f'ArmorItems:['
        f'{{id:"minecraft:leather_boots",count:1,components:{{"minecraft:dyed_color":{armor_col}}}}},'
        f'{{id:"minecraft:leather_leggings",count:1,components:{{"minecraft:dyed_color":{armor_col}}}}},'
        f'{{id:"minecraft:leather_chestplate",count:1,components:{{"minecraft:dyed_color":{armor_col}}}}},'
        f'{{id:"minecraft:player_head",count:1,components:{{"minecraft:profile":{{name:"{skin_name}"}}}}}}'
        f'],'
        f'Tags:["island_minion","minion_type_{m_type}","minion_{minion_id}","owner_{player}"]}}'
    )
    rcon.cmd(cmd_stand)
    # Đồng bộ góc quay ngang (yaw) của Minion theo đúng hướng người chơi đang nhìn vào mỏ quặng
    rcon.cmd(f'minecraft:execute as {player} at @s rotated ~ 0 run tp @e[tag=minion_{minion_id},limit=1] ~ ~ ~ ~ 0')
    
    # 2. Triệu hồi interaction entity cho phép click trực tiếp mở GUI Minion
    cmd_interact = (
        f'minecraft:execute as {player} at @s run summon interaction ~ ~ ~ '
        f'{{width:0.8f,height:1.8f,response:1b,'
        f'Tags:["island_minion_interact","minion_interact","minion_{minion_id}","minion_interact_{minion_id}","owner_{player}"]}}'
    )
    rcon.cmd(cmd_interact)

    # 3. Âm thanh và hiệu ứng triệu hồi
    rcon.cmd(f'minecraft:execute at {player} run playsound minecraft:block.anvil.place player {player} ~ ~ ~ 1.0 1.2')
    rcon.cmd(f'minecraft:execute at {player} run particle minecraft:happy_villager ~ ~1 ~ 0.4 0.5 0.4 0.1 15')

def remove_minion_from_world(rcon, minion_id):
    rcon.cmd(f'minecraft:kill @e[tag=minion_{minion_id}]')
    rcon.cmd(f'minecraft:kill @e[tag=minion_interact_{minion_id}]')

def relocate_minion(rcon, player, minion_id):
    """Dịch chuyển Minion về vị trí & hướng nhìn hiện tại của người chơi (Đặt vào bệ đào quặng)"""
    m = get_minion_by_id(minion_id)
    if not m or m['owner'].lower() != player.lower():
        rcon.cmd(f'tellraw {player} [{{"text":"[Minions] ","color":"red","bold":true}},{{"text":"Không tìm thấy Minion #{minion_id} thuộc quyền sở hữu của bạn!","color":"yellow"}}]')
        return
    spawn_minion_in_world(rcon, player, m['id'], m['type'], m['tier'])
    cfg = MINION_CONFIG.get(m['type'], MINION_CONFIG['miner'])
    cfg_title = cfg['title']
    m_id = m['id']
    m_tier = m['tier']
    rcon.cmd(f'tellraw {player} [{{"text":"[Minions] ","color":"gold","bold":true}},{{"text":"📍 Đã đặt lại vị trí và hướng nhìn của ","color":"green"}},{{"text":"{cfg_title} #{m_id} [Cấp {m_tier}]","color":"aqua","bold":true}},{{"text":" ngay tại chỗ bạn đứng! Minion sẽ tự động làm việc hướng về phía trước mặt bạn.","color":"yellow"}}]')

def fuel_minion(rcon, player, minion_id, bal):
    """Nạp nhiên liệu tăng 25% tốc độ làm việc cho Minion trong 24 giờ ($2,000 Xu)"""
    m = get_minion_by_id(minion_id)
    if not m or m['owner'].lower() != player.lower():
        rcon.cmd(f'tellraw {player} [{{"text":"[Minions] ","color":"red","bold":true}},{{"text":"Không tìm thấy Minion #{minion_id} thuộc quyền sở hữu của bạn!","color":"yellow"}}]')
        return
    fuel_cost = 2000
    if bal < fuel_cost:
        rcon.cmd(f'tellraw {player} [{{"text":"[Minions] ","color":"red","bold":true}},{{"text":"Bạn cần ${fuel_cost:,} Xu để nạp Lõi Năng Lượng Siêu Tốc (24h) cho Minion #{minion_id}!","color":"yellow"}}]')
        return
    rcon.cmd(f'eco take {player} {fuel_cost}')
    until = max(time.time(), m['fuel_until']) + 86400.0
    conn = sqlite3.connect(DB_PATH)
    cur = conn.cursor()
    cur.execute('UPDATE minions SET fuel_type=?, fuel_until=? WHERE id=?', ('plasma_core', until, m['id']))
    conn.commit()
    conn.close()
    m_id = m['id']
    rcon.cmd(f'tellraw {player} [{{"text":"[Minions] ","color":"gold","bold":true}},{{"text":"⛽ Đã nạp Lõi Năng Lượng Siêu Tốc (+25% tốc độ trong 24h) cho Minion #{m_id}! (-$2,000 Xu)","color":"green","bold":true}}]')

def buy_minion(rcon, player, minion_type, bal):
    minion_type = minion_type.lower().strip()
    if minion_type not in MINION_CONFIG:
        rcon.cmd(f'tellraw {player} [{{"text":"[Minions] ","color":"red","bold":true}},{{"text":"Loại Minion không hợp lệ! Hãy chọn: miner, farmer, slayer, hoặc builder.","color":"yellow"}}]')
        return False
        
    existing = get_player_minions(player)
    if len(existing) >= MAX_MINIONS_PER_PLAYER:
        rcon.cmd(f'tellraw {player} [{{"text":"[Minions] ","color":"red","bold":true}},{{"text":"Bạn đã đạt giới hạn tối đa {MAX_MINIONS_PER_PLAYER} Minions trên đảo!","color":"yellow"}}]')
        rcon.cmd(f'playsound minecraft:entity.villager.no player {player} ~ ~ ~ 1.0 1.0')
        return False
        
    cfg = MINION_CONFIG[minion_type]
    cost = cfg['base_cost']
    m_title = cfg['title']
    m_color = cfg['color']
    
    if bal < cost:
        rcon.cmd(f'tellraw {player} [{{"text":"[Minions] ","color":"red","bold":true}},{{"text":"Bạn không đủ ${cost:,} để mua {m_title}! (Hiện có: ${bal:,.2f})","color":"yellow"}}]')
        rcon.cmd(f'playsound minecraft:entity.villager.no player {player} ~ ~ ~ 1.0 1.0')
        return False
        
    # Trừ tiền Vault
    rcon.cmd(f'eco take {player} {cost}')
    
    now = time.time()
    conn = sqlite3.connect(DB_PATH)
    cur = conn.cursor()
    cur.execute('''
    INSERT INTO minions (owner, minion_type, tier, world, x, y, z, created_at, last_harvest_at, stored_count)
    VALUES (?, ?, 1, 'IridiumSkyblock', 0, 0, 0, ?, ?, 0)
    ''', (player, minion_type, now, now))
    minion_id = cur.lastrowid
    conn.commit()
    conn.close()
    
    # Triệu hồi ra thế giới tại vị trí & góc nhìn của người chơi
    spawn_minion_in_world(rcon, player, minion_id, minion_type, 1)
    
    rcon.cmd(f'tellraw {player} [{{"text":"[Minions] ","color":"gold","bold":true}},{{"text":"Mua thành công ","color":"yellow"}},{{"text":"{m_title} #{minion_id} [Cấp 1]!","color":"{m_color}","bold":true}},{{"text":" Minion đang hướng về phía trước mặt bạn để làm việc. Mẹo: Đứng trước ô quặng của /mayquang và bấm [📍 Đặt Lại Vị Trí] trong /is minions để căn góc chuẩn xác!","color":"green"}}]')
    return True

def collect_player_minions(rcon, player, minion_id=None, speed_bonus=1.0):
    catchup_minions(player, speed_bonus=speed_bonus)
    minions = get_player_minions(player)
    
    if not minions:
        rcon.cmd(f'tellraw {player} [{{"text":"[Minions] ","color":"red","bold":true}},{{"text":"Bạn chưa sở hữu Minion nào trên đảo! Hãy gõ /is minions để mua.","color":"yellow"}}]')
        return
        
    target_minions = minions
    if minion_id:
        try:
            mid = int(minion_id)
            target_minions = [m for m in minions if m['id'] == mid]
        except ValueError:
            pass
        
    total_collected = 0
    items_summary = {}
    
    for m in target_minions:
        stored = m['stored_count']
        if stored > 0:
            cfg = MINION_CONFIG.get(m['type'])
            tier_data = cfg['item_map'].get(m['tier']) or cfg['item_map'][max(cfg['item_map'].keys())]
            item_id = tier_data[0]
            item_name = tier_data[1]
            
            rcon.cmd(f'minecraft:give {player} {item_id} {stored}')
            items_summary[item_name] = items_summary.get(item_name, 0) + stored
            total_collected += stored
            update_minion_stored(m['id'], 0, time.time())
            
    if total_collected == 0:
        rcon.cmd(f'tellraw {player} [{{"text":"[Minions] ","color":"gold","bold":true}},{{"text":"Kho đồ của các Minions hiện đang trống! Hãy quay lại sau ít phút.","color":"yellow"}}]')
        rcon.cmd(f'playsound minecraft:block.chest.locked player {player} ~ ~ ~ 1.0 1.0')
    else:
        summary_str = ", ".join([f"{v} {k}" for k, v in items_summary.items()])
        rcon.cmd(f'playsound minecraft:entity.player.levelup player {player} ~ ~ ~ 1.0 1.2')
        rcon.cmd(f'tellraw {player} [{{"text":"[Minions] ","color":"gold","bold":true}},{{"text":"✨ Đã thu hoạch tổng cộng ","color":"yellow"}},{{"text":"{total_collected} vật phẩm","color":"green","bold":true}},{{"text":" ({summary_str}) vào túi đồ!","color":"aqua"}}]')

def sell_all_minion_storage(rcon, player, bonus_multiplier=1.0, speed_bonus=1.0):
    """Bán trực tiếp toàn bộ sản phẩm trong kho của mọi Minion ra tiền Số Dư ($)"""
    catchup_minions(player, speed_bonus=speed_bonus)
    minions = get_player_minions(player)
    if not minions:
        rcon.cmd(f'tellraw {player} [{{"text":"[Minions] ","color":"red","bold":true}},{{"text":"Bạn chưa sở hữu Minion nào trên đảo!","color":"yellow"}}]')
        return

    total_items = 0
    base_money = 0.0
    details = []

    for m in minions:
        stored = m['stored_count']
        if stored > 0:
            cfg = MINION_CONFIG.get(m['type'], MINION_CONFIG['miner'])
            tier_data = cfg['item_map'].get(m['tier']) or cfg['item_map'][max(cfg['item_map'].keys())]
            item_name = tier_data[1]
            unit_price = tier_data[3] if len(tier_data) > 3 else 15.0
            sub = stored * unit_price
            base_money += sub
            total_items += stored
            details.append(f"{stored}x {item_name}")
            update_minion_stored(m['id'], 0, time.time())

    if total_items == 0:
        rcon.cmd(f'tellraw {player} [{{"text":"[Minions] ","color":"gold","bold":true}},{{"text":"Kho chứa của các Minions hiện đang trống, chưa có vật phẩm để bán!","color":"yellow"}}]')
        return

    final_money = int(base_money * bonus_multiplier)
    rcon.cmd(f'eco give {player} {final_money}')
    rcon.cmd(f'playsound minecraft:entity.player.levelup player {player} ~ ~ ~ 1.2 1.4')
    bonus_txt = f" (Đã nhân hệ số Bùa Hộ Mệnh x{bonus_multiplier:.2f})" if bonus_multiplier > 1.0 else ""
    summary_str = ", ".join(details)
    rcon.cmd(f'tellraw {player} [{{"text":"[Minions] ","color":"gold","bold":true}},{{"text":"💰 Đã bán nhanh ","color":"yellow"}},{{"text":"{total_items} vật phẩm ({summary_str})","color":"aqua","bold":true}},{{"text":" từ kho Minions, nhận ngay ","color":"yellow"}},{{"text":"+${final_money:,} Số Dư{bonus_txt}!","color":"green","bold":true}}]')

def upgrade_minion(rcon, player, minion_id, bal=0, take_gems_fn=None):
    m = get_minion_by_id(minion_id)
    if not m or m['owner'].lower() != player.lower():
        rcon.cmd(f'tellraw {player} [{{"text":"⟨Skyblock⟩ ","color":"gold","bold":true}},{{"text":"Không tìm thấy Minion #{minion_id} thuộc quyền sở hữu của bạn!","color":"yellow"}}]')
        return
        
    cfg = MINION_CONFIG.get(m['type'])
    max_tier = max(cfg['item_map'].keys())
    if m['tier'] >= max_tier:
        rcon.cmd(f'tellraw {player} [{{"text":"⟨Skyblock⟩ ","color":"gold","bold":true}},{{"text":"Minion #{minion_id} đã đạt Cấp Tối Đa (Tier {max_tier})!","color":"yellow"}}]')
        return
        
    next_tier = m['tier'] + 1
    
    if take_gems_fn:
        gem_cost = 15 * next_tier
        if not take_gems_fn(player, gem_cost):
            rcon.cmd(f'tellraw {player} [{{"text":"⟨Skyblock⟩ ","color":"gold","bold":true}},{{"text":"Bạn cần {gem_cost} Điểm Tinh Anh để nâng cấp Minion #{minion_id} lên Cấp {next_tier}!","color":"red"}}]')
            rcon.cmd(f'playsound minecraft:entity.villager.no player {player} ~ ~ ~ 1.0 1.0')
            return
    else:
        cost = cfg['base_cost'] * next_tier
        if bal < cost:
            rcon.cmd(f'tellraw {player} [{{"text":"⟨Skyblock⟩ ","color":"gold","bold":true}},{{"text":"Bạn cần ${cost:,} để nâng cấp Minion #{minion_id} lên Cấp {next_tier}! (Hiện có: ${bal:,.2f})","color":"yellow"}}]')
            rcon.cmd(f'playsound minecraft:entity.villager.no player {player} ~ ~ ~ 1.0 1.0')
            return
        rcon.cmd(f'eco take {player} {cost}')
    
    conn = sqlite3.connect(DB_PATH)
    cur = conn.cursor()
    cur.execute('UPDATE minions SET tier=? WHERE id=?', (next_tier, m['id']))
    conn.commit()
    conn.close()
    
    new_title = f"🤖 {cfg['title']} [Cấp {next_tier}]"
    rcon.cmd(f'minecraft:execute as @e[tag=minion_{m["id"]},limit=1] run data merge entity @s {{CustomName:\'{{"text":"{new_title}","color":"{cfg["color"]}","bold":true}}\'}}')
    rcon.cmd(f'minecraft:execute at @e[tag=minion_{m["id"]},limit=1] run particle minecraft:totem_of_undying ~ ~1 ~ 0.3 0.5 0.3 0.1 25')
    rcon.cmd(f'playsound minecraft:ui.toast.challenge_complete player {player} ~ ~ ~ 1.0 1.2')
    
    next_data = cfg['item_map'].get(next_tier)
    m_id = m['id']
    rcon.cmd(f'tellraw {player} [{{"text":"⟨Skyblock⟩ ","color":"gold","bold":true}},{{"text":"🎉 Nâng cấp thành công Minion #{m_id} lên ","color":"yellow"}},{{"text":"Cấp {next_tier} (Sản xuất: {next_data[1]} - {next_data[2]}s/lần)!","color":"green","bold":true}}]')

def upgrade_minion_range(rcon, player, minion_id, bal=0, take_gems_fn=None):
    m = get_minion_by_id(minion_id)
    if not m or m['owner'].lower() != player.lower():
        rcon.cmd(f'tellraw {player} [{{"text":"⟨Skyblock⟩ ","color":"gold","bold":true}},{{"text":"Không tìm thấy Minion #{minion_id}!","color":"red"}}]')
        return
    cur_range = m.get('range_level', 1)
    if cur_range >= 5:
        rcon.cmd(f'tellraw {player} [{{"text":"⟨Skyblock⟩ ","color":"gold","bold":true}},{{"text":"Minion #{minion_id} đã đạt Tầm Đào Tối Đa (Cấp 5)!","color":"yellow"}}]')
        return
    next_r = cur_range + 1
    gem_cost = 20 * next_r
    if take_gems_fn and not take_gems_fn(player, gem_cost):
        rcon.cmd(f'tellraw {player} [{{"text":"⟨Skyblock⟩ ","color":"gold","bold":true}},{{"text":"Cần {gem_cost} Điểm Tinh Anh để nâng cấp Tầm Đào lên Cấp {next_r}!","color":"red"}}]')
        return
    conn = sqlite3.connect(DB_PATH)
    cur = conn.cursor()
    cur.execute('UPDATE minions SET range_level=? WHERE id=?', (next_r, m['id']))
    conn.commit()
    conn.close()
    rcon.cmd(f'tellraw {player} [{{"text":"⟨Skyblock⟩ ","color":"gold","bold":true}},{{"text":"Đã nâng cấp Tầm Đào Minion #{minion_id} lên Cấp {next_r} (Bán kính {2+next_r} blocks)!","color":"green","bold":true}}]')
    rcon.cmd(f'playsound minecraft:entity.player.levelup player {player} ~ ~ ~ 1.0 1.2')

def upgrade_minion_speed(rcon, player, minion_id, bal=0, take_gems_fn=None):
    m = get_minion_by_id(minion_id)
    if not m or m['owner'].lower() != player.lower():
        rcon.cmd(f'tellraw {player} [{{"text":"⟨Skyblock⟩ ","color":"gold","bold":true}},{{"text":"Không tìm thấy Minion #{minion_id}!","color":"red"}}]')
        return
    cur_spd = m.get('speed_level', 1)
    if cur_spd >= 5:
        rcon.cmd(f'tellraw {player} [{{"text":"⟨Skyblock⟩ ","color":"gold","bold":true}},{{"text":"Minion #{minion_id} đã đạt Tốc Độ Tối Đa (Cấp 5)!","color":"yellow"}}]')
        return
    next_s = cur_spd + 1
    gem_cost = 25 * next_s
    if take_gems_fn and not take_gems_fn(player, gem_cost):
        rcon.cmd(f'tellraw {player} [{{"text":"⟨Skyblock⟩ ","color":"gold","bold":true}},{{"text":"Cần {gem_cost} Điểm Tinh Anh để nâng cấp Tốc Độ lên Cấp {next_s}!","color":"red"}}]')
        return
    conn = sqlite3.connect(DB_PATH)
    cur = conn.cursor()
    cur.execute('UPDATE minions SET speed_level=? WHERE id=?', (next_s, m['id']))
    conn.commit()
    conn.close()
    rcon.cmd(f'tellraw {player} [{{"text":"⟨Skyblock⟩ ","color":"gold","bold":true}},{{"text":"Đã nâng cấp Tốc Độ Minion #{minion_id} lên Cấp {next_s} (+{next_s*15}% tốc độ làm việc)!","color":"green","bold":true}}]')
    rcon.cmd(f'playsound minecraft:entity.player.levelup player {player} ~ ~ ~ 1.0 1.2')

def upgrade_minion_storage(rcon, player, minion_id, bal=0, take_gems_fn=None):
    m = get_minion_by_id(minion_id)
    if not m or m['owner'].lower() != player.lower():
        rcon.cmd(f'tellraw {player} [{{"text":"⟨Skyblock⟩ ","color":"gold","bold":true}},{{"text":"Không tìm thấy Minion #{minion_id}!","color":"red"}}]')
        return
    cur_stg = m.get('storage_level', 1)
    if cur_stg >= 5:
        rcon.cmd(f'tellraw {player} [{{"text":"⟨Skyblock⟩ ","color":"gold","bold":true}},{{"text":"Minion #{minion_id} đã đạt Sức Chứa Tối Đa (Cấp 5)!","color":"yellow"}}]')
        return
    next_st = cur_stg + 1
    gem_cost = 15 * next_st
    if take_gems_fn and not take_gems_fn(player, gem_cost):
        rcon.cmd(f'tellraw {player} [{{"text":"⟨Skyblock⟩ ","color":"gold","bold":true}},{{"text":"Cần {gem_cost} Điểm Tinh Anh để nâng cấp Sức Chứa lên Cấp {next_st}!","color":"red"}}]')
        return
    conn = sqlite3.connect(DB_PATH)
    cur = conn.cursor()
    cur.execute('UPDATE minions SET storage_level=? WHERE id=?', (next_st, m['id']))
    conn.commit()
    conn.close()
    cap = get_storage_cap(m['tier'], next_st)
    rcon.cmd(f'tellraw {player} [{{"text":"⟨Skyblock⟩ ","color":"gold","bold":true}},{{"text":"Đã nâng cấp Kho Chứa Minion #{minion_id} lên Cấp {next_st} (Sức chứa {cap} items)!","color":"green","bold":true}}]')
    rcon.cmd(f'playsound minecraft:entity.player.levelup player {player} ~ ~ ~ 1.0 1.2')

def upgrade_minion_tool(rcon, player, minion_id, bal=0, take_gems_fn=None):
    m = get_minion_by_id(minion_id)
    if not m or m['owner'].lower() != player.lower():
        rcon.cmd(f'tellraw {player} [{{"text":"⟨Skyblock⟩ ","color":"gold","bold":true}},{{"text":"Không tìm thấy Minion #{minion_id}!","color":"red"}}]')
        return
    cur_tool = m.get('tool_level', 1)
    if cur_tool >= 5:
        rcon.cmd(f'tellraw {player} [{{"text":"⟨Skyblock⟩ ","color":"gold","bold":true}},{{"text":"Minion #{minion_id} đã trang bị Công Cụ Tối Thượng (Netherite)!","color":"yellow"}}]')
        return
    next_t = cur_tool + 1
    gem_cost = 30 * next_t
    if take_gems_fn and not take_gems_fn(player, gem_cost):
        rcon.cmd(f'tellraw {player} [{{"text":"⟨Skyblock⟩ ","color":"gold","bold":true}},{{"text":"Cần {gem_cost} Điểm Tinh Anh để nâng cấp Tool lên Bậc {next_t}!","color":"red"}}]')
        return
    conn = sqlite3.connect(DB_PATH)
    cur = conn.cursor()
    cur.execute('UPDATE minions SET tool_level=? WHERE id=?', (next_t, m['id']))
    conn.commit()
    conn.close()
    tname, mult = TOOL_NAMES.get(next_t, ("Netherite", 2.0))
    spawn_minion_in_world(rcon, player, m['id'], m['type'], m['tier'], skin_id=m.get('skin_id', 'default'), tool_level=next_t)
    rcon.cmd(f'tellraw {player} [{{"text":"⟨Skyblock⟩ ","color":"gold","bold":true}},{{"text":"Đã nâng cấp Tool Minion #{minion_id} lên Tool {tname} (Sản lượng x{mult})!","color":"green","bold":true}}]')
    rcon.cmd(f'playsound minecraft:entity.player.levelup player {player} ~ ~ ~ 1.0 1.2')

def change_minion_skin(rcon, player, minion_id, skin_name='default', bal=0, take_gems_fn=None):
    m = get_minion_by_id(minion_id)
    if not m or m['owner'].lower() != player.lower():
        rcon.cmd(f'tellraw {player} [{{"text":"⟨Skyblock⟩ ","color":"gold","bold":true}},{{"text":"Không tìm thấy Minion #{minion_id}!","color":"red"}}]')
        return
    skin_key = skin_name.lower().strip()
    if skin_key not in MINION_SKINS:
        skin_key = 'default'
    gem_cost = 50
    if take_gems_fn and not take_gems_fn(player, gem_cost):
        rcon.cmd(f'tellraw {player} [{{"text":"⟨Skyblock⟩ ","color":"gold","bold":true}},{{"text":"Cần {gem_cost} Điểm Tinh Anh để mở khóa Skin [{skin_key}]!","color":"red"}}]')
        return
    conn = sqlite3.connect(DB_PATH)
    cur = conn.cursor()
    cur.execute('UPDATE minions SET skin_id=? WHERE id=?', (skin_key, m['id']))
    conn.commit()
    conn.close()
    spawn_minion_in_world(rcon, player, m['id'], m['type'], m['tier'], skin_id=skin_key, tool_level=m.get('tool_level', 1))
    rcon.cmd(f'tellraw {player} [{{"text":"⟨Skyblock⟩ ","color":"gold","bold":true}},{{"text":"Đã đổi Skin Minion #{minion_id} thành [{skin_key.upper()}]!","color":"green","bold":true}}]')
    rcon.cmd(f'playsound minecraft:entity.player.levelup player {player} ~ ~ ~ 1.0 1.2')

def pickup_minion(rcon, player, minion_id):
    m = get_minion_by_id(minion_id)
    if not m or m['owner'].lower() != player.lower():
        rcon.cmd(f'tellraw {player} [{{"text":"[Minions] ","color":"red","bold":true}},{{"text":"Không tìm thấy Minion #{minion_id}!","color":"yellow"}}]')
        return
        
    if m['stored_count'] > 0:
        collect_player_minions(rcon, player, m['id'])
        
    remove_minion_from_world(rcon, m['id'])
    
    conn = sqlite3.connect(DB_PATH)
    cur = conn.cursor()
    cur.execute('DELETE FROM minions WHERE id=?', (m['id'],))
    conn.commit()
    conn.close()
    
    cfg = MINION_CONFIG.get(m['type'])
    refund = int(cfg['base_cost'] * 0.5)
    rcon.cmd(f'eco give {player} {refund}')
    m_id = m['id']
    rcon.cmd(f'tellraw {player} [{{"text":"[Minions] ","color":"gold","bold":true}},{{"text":"Đã thu hồi Minion #{m_id}! Hoàn lại +${refund:,} Số Dư vào tài khoản của bạn.","color":"green"}}]')
    rcon.cmd(f'playsound minecraft:entity.item.pickup player {player} ~ ~ ~ 1.0 1.0')

def expand_island_floor(rcon, player):
    """Minion Thợ Xây lát sàn hoàng gia có viền đèn biển mở rộng đảo phía trước mặt"""
    rcon.cmd(f'minecraft:execute as {player} at @s rotated ~ 0 run fill ^-4 ^-1 ^2 ^4 ^-1 ^10 polished_deepslate replace air')
    rcon.cmd(f'minecraft:execute as {player} at @s rotated ~ 0 run fill ^-3 ^-1 ^3 ^3 ^-1 ^9 smooth_quartz replace polished_deepslate')
    rcon.cmd(f'minecraft:execute as {player} at @s rotated ~ 0 run setblock ^0 ^-1 ^6 sea_lantern')
    rcon.cmd(f'playsound minecraft:block.stone.place master @a ~ ~ ~ 1.2 1.0')
    rcon.cmd(f'tellraw {player} [{{"text":"[Thợ Xây Đảo] ","color":"gold","bold":true}},{{"text":"🔨 Đã lát thềm Thạch Anh Hoàng Gia 9x9 kèm Đèn Biển mở rộng đảo phía trước mặt bạn!","color":"green"}}]')

def show_minions_menu(rcon, player, bal, speed_bonus=1.0):
    catchup_minions(player, speed_bonus=speed_bonus)
    minions = get_player_minions(player)
    now = time.time()
    
    rcon.cmd(f'playsound minecraft:item.book.page_turn player {player} ~ ~ ~ 1.0 1.2')
    
    msg = [
        {"text": "\n╔═══════════════════════════════════════════════════════╗\n", "color": "gold", "bold": True},
        {"text": "║     🤖 TRUNG TÂM ĐIỀU KHIỂN MINIONS ĐẢO (/is minions)     ║\n", "color": "yellow", "bold": True},
        {"text": "╚═══════════════════════════════════════════════════════╝\n", "color": "gold", "bold": True},
        {"text": "Đang hoạt động: ", "color": "gray"},
        {"text": f"{len(minions)}/{MAX_MINIONS_PER_PLAYER} Minions", "color": "green", "bold": True},
        {"text": " | Số dư: ", "color": "gray"},
        {"text": f"${bal:,.2f}\n", "color": "yellow", "bold": True},
        {"text": "💡 Mẹo: Đứng nhìn thẳng vào mạch quặng của /mayquang rồi bấm [📍 Đặt Tới Đây] để Minion đập quặng trực tiếp!\n\n", "color": "aqua"}
    ]
    
    if not minions:
        msg.extend([
            {"text": "Chưa có Minion nào trên đảo! Hãy bấm mua bên dưới:\n", "color": "gray"},
        ])
    else:
        msg.append({"text": "📋 DANH SÁCH MINIONS ĐANG LÀM VIỆC:\n", "color": "gold", "bold": True})
        for m in minions:
            cfg = MINION_CONFIG.get(m['type'], MINION_CONFIG['miner'])
            tier_data = cfg['item_map'].get(m['tier']) or cfg['item_map'][max(cfg['item_map'].keys())]
            item_name = tier_data[1]
            interval = tier_data[2]
            if m['fuel_until'] > now:
                interval = round(interval * 0.75, 1)
            stored = m['stored_count']
            cap = get_storage_cap(m['tier'])
            fuel_status = f" 🔥({int((m['fuel_until']-now)//3600)}h)" if m['fuel_until'] > now else ""
            
            msg.extend([
                {"text": f" • #{m['id']} [{cfg['title']} Cấp {m['tier']}]{fuel_status}: ", "color": cfg['color'], "bold": True},
                {"text": f"{item_name} ({interval}s) | Kho: ", "color": "white"},
                {"text": f"{stored}/{cap}\n", "color": "green" if stored < cap else "red", "bold": True},
                {"text": "   [⬆ Nâng Cấp]", "color": "yellow", "bold": True, "clickEvent": {"action": "run_command", "value": f"/is minion upgrade {m['id']}"}, "hoverEvent": {"action": "show_text", "contents": [{"text": f"Nâng cấp Minion #{m['id']} lên Cấp {m['tier']+1}\nChi phí: ${cfg['base_cost']*(m['tier']+1):,} Xu", "color": "yellow"}]}},
                {"text": " ", "color": "gray"},
                {"text": "[📥 Thu Hoạch]", "color": "green", "bold": True, "clickEvent": {"action": "run_command", "value": f"/is minion collect {m['id']}"}, "hoverEvent": {"action": "show_text", "contents": [{"text": f"Rút {stored} {item_name} vào túi đồ", "color": "green"}]}},
                {"text": " ", "color": "gray"},
                {"text": "[📍 Đặt Tới Đây]", "color": "aqua", "bold": True, "clickEvent": {"action": "run_command", "value": f"/is minion tphere {m['id']}"}, "hoverEvent": {"action": "show_text", "contents": [{"text": f"Dịch chuyển Minion #{m['id']} tới vị trí & hướng nhìn hiện tại của bạn!", "color": "aqua"}]}},
                {"text": " ", "color": "gray"},
                {"text": "[⛽ Nạp Pin]", "color": "gold", "bold": True, "clickEvent": {"action": "run_command", "value": f"/is minion fuel {m['id']}"}, "hoverEvent": {"action": "show_text", "contents": [{"text": "Nạp Lõi Năng Lượng (+25% tốc độ trong 24h)\nChi phí: $2,000 Xu", "color": "gold"}]}},
                {"text": " ", "color": "gray"},
                {"text": "[📦 Gỡ]", "color": "red", "bold": True, "clickEvent": {"action": "run_command", "value": f"/is minion pickup {m['id']}"}, "hoverEvent": {"action": "show_text", "contents": [{"text": f"Gỡ Minion #{m['id']} và hoàn lại 50% tiền gốc", "color": "red"}]}},
                {"text": "\n", "color": "gray"}
            ])
            
        msg.extend([
            {"text": "\n ⚡ ", "color": "gold"},
            {"text": "[📥 THU HOẠCH TẤT CẢ]", "color": "green", "bold": True, "clickEvent": {"action": "run_command", "value": "/is minion collectall"}, "hoverEvent": {"action": "show_text", "contents": [{"text": "Rút toàn bộ vật phẩm từ mọi Minions vào túi đồ!", "color": "green"}]}},
            {"text": "  ", "color": "gray"},
            {"text": "[💰 BÁN HẾT KHO MINIONS RA TIỀN $]", "color": "gold", "bold": True, "clickEvent": {"action": "run_command", "value": "/is minion sellall"}, "hoverEvent": {"action": "show_text", "contents": [{"text": "Bán trực tiếp toàn bộ sản phẩm trong kho Minions lấy Tiền Số Dư ($)!\n(Hưởng đầy đủ % thưởng từ Bùa Hộ Mệnh /bua)", "color": "yellow"}]}},
            {"text": "\n", "color": "gray"}
        ])

    msg.extend([
        {"text": "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n", "color": "dark_gray"},
        {"text": "🛒 MUA THÊM MINION MỚI (Đặt tại vị trí & hướng bạn đang nhìn):\n", "color": "gold", "bold": True},
        {"text": " [⛏ Minion Đào ($5k)] ", "color": "aqua", "bold": True, "clickEvent": {"action": "run_command", "value": "/is minion buy miner"}, "hoverEvent": {"action": "show_text", "contents": [{"text": "Tự động vung cúp đập vỡ quặng trước mặt, hút đồ rơi & tích lũy khoáng sản!", "color": "aqua"}]}},
        {"text": " [🌾 Minion Nông Dân ($5k)] ", "color": "green", "bold": True, "clickEvent": {"action": "run_command", "value": "/is minion buy farmer"}, "hoverEvent": {"action": "show_text", "contents": [{"text": "Tự động thu hoạch lúa/cà rốt/khoai tây chín và gieo hạt trồng lại!", "color": "green"}]}},
        {"text": "\n", "color": "gray"},
        {"text": " [⚔ Minion Săn Quái ($7.5k)] ", "color": "red", "bold": True, "clickEvent": {"action": "run_command", "value": "/is minion buy slayer"}, "hoverEvent": {"action": "show_text", "contents": [{"text": "Tự động xoay mặt chém quái xung quanh & thu thập chiến lợi phẩm!", "color": "red"}]}},
        {"text": " [🔨 Minion Thợ Xây ($10k)] ", "color": "gold", "bold": True, "clickEvent": {"action": "run_command", "value": "/is minion buy builder"}, "hoverEvent": {"action": "show_text", "contents": [{"text": "Sản xuất vật liệu quý & mở rộng sàn đảo hoàng gia (/is minion expand)!", "color": "gold"}]}},
        {"text": "\n", "color": "gray"},
        {"text": "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━", "color": "dark_gray"}
    ])
    
    rcon.cmd(f'tellraw {player} {json.dumps(msg, ensure_ascii=False)}')

# ==============================================================================
# BẢN VẼ KIẾN TRÚC & HOÀN TÁC (BAO GỒM 2 SIÊU KIẾN TRÚC MỚI)
# ==============================================================================
BUILDER_COSTS = {
    # Trang 1: Nhà Ở, Biệt Thự & Cung Điện (Living & Royal Estates)
    'villa': (25000, 'Biệt Thự Hiện Đại Gỗ Cherry', 'skyblock:builder/build_villa'),
    'castle': (75000, 'Lâu Đài Đá Cổ Kính Trung Cổ', 'skyblock:builder/build_castle'),
    'modern': (50000, 'Căn Hộ Penthouse Kính & Hồ Bơi', 'skyblock:builder/build_modern'),
    'pagoda': (35000, 'Đình Cổ Phương Đông Mái Ngói', 'skyblock:builder/build_pagoda'),
    'palace': (100000, 'Cung Điện Lưu Ly Chân Không Hoàng Gia', 'skyblock:builder/build_palace'),
    
    # Trang 2: Nông Trại, Công Nghiệp & Kho Lưu Trữ (Farms, Forge & Storage)
    'windmill': (20000, 'Cối Xay Gió & Vựa Lúa Mì', 'skyblock:builder/build_windmill'),
    'warehouse': (30000, 'Kho Lưu Trữ 36 Rương Lớn', 'skyblock:builder/build_warehouse'),
    'greenhouse': (25000, 'Nhà Kính Sinh Thái Tự Nhiên', 'skyblock:builder/build_greenhouse'),
    'garden': (15000, 'Vườn Hoa Zen Suối Nước', 'skyblock:builder/build_garden'),
    'dragonforge': (85000, 'Đền Rồng Hắc Ám & Lò Luyện Tự Động', 'skyblock:builder/build_dragonforge'),
    
    # Trang 3: Thần Bí & Hư Không (Mystic & Void)
    'enchant': (40000, 'Tháp Phù Phép Cấp 30 Tối Thượng', 'skyblock:builder/build_enchant'),
    'lighthouse': (35000, 'Hải Đăng Pha Lê Hư Không', 'skyblock:builder/build_lighthouse'),
    'nethergate': (45000, 'Cổng Di Tích Địa Ngục Hắc Điện', 'skyblock:builder/build_nethergate'),
    'bridge': (10000, 'Cầu Treo Nghệ Thuật Vượt Hư Không', 'skyblock:builder/build_bridge')
}

def handle_builder_build(rcon, player, structure_key, bal):
    structure_key = structure_key.lower().strip()
    if structure_key not in BUILDER_COSTS:
        rcon.cmd(f'tellraw {player} [{{"text":"[Kiến Trúc Sư] ","color":"red","bold":true}},{{"text":"Công trình không tồn tại! Hãy gõ /is builder để mở danh mục kiến trúc đảo.","color":"yellow"}}]')
        return
        
    cost, name, func = BUILDER_COSTS[structure_key]
    if bal < cost:
        rcon.cmd(f'tellraw {player} [{{"text":"[Kiến Trúc Sư] ","color":"red","bold":true}},{{"text":"Bạn không đủ ${cost:,} để thi công {name}! (Hiện có: ${bal:,.2f})","color":"yellow"}}]')
        rcon.cmd(f'playsound minecraft:entity.villager.no player {player} ~ ~ ~ 1.0 1.0')
        return
        
    rcon.cmd(f'eco take {player} {cost}')
    rcon.cmd(f'minecraft:execute as {player} at @s run function {func}')
    
    conn = sqlite3.connect(DB_PATH)
    cur = conn.cursor()
    cur.execute('INSERT OR REPLACE INTO builder_snapshots (player, structure, cost, built_at) VALUES (?, ?, ?, ?)', (player.lower(), structure_key, cost, time.time()))
    conn.commit()
    conn.close()

def handle_builder_undo(rcon, player):
    conn = sqlite3.connect(DB_PATH)
    cur = conn.cursor()
    cur.execute('SELECT structure, cost, built_at FROM builder_snapshots WHERE player=?', (player.lower(),))
    r = cur.fetchone()
    conn.close()
    
    if not r:
        rcon.cmd(f'minecraft:execute as {player} at @s run function skyblock:builder/undo_last')
        return
        
    structure, cost, built_at = r
    now = time.time()
    
    if now - built_at > 180:
        rcon.cmd(f'tellraw {player} [{{"text":"[Kiến Trúc Sư] ","color":"red","bold":true}},{{"text":"Đã quá 3 phút kể từ khi thi công! Không thể hoàn tác công trình này nữa.","color":"yellow"}}]')
        rcon.cmd(f'playsound minecraft:entity.villager.no player {player} ~ ~ ~ 1.0 1.0')
        return
        
    rcon.cmd(f'minecraft:execute as {player} at @s run function skyblock:builder/undo_{structure}')
    
    refund = int(cost * 0.9)
    rcon.cmd(f'eco give {player} {refund}')
    
    conn = sqlite3.connect(DB_PATH)
    cur = conn.cursor()
    cur.execute('DELETE FROM builder_snapshots WHERE player=?', (player.lower(),))
    conn.commit()
    conn.close()
    
    rcon.cmd(f'tellraw {player} [{{"text":"[Kiến Trúc Sư] ","color":"gold","bold":true}},{{"text":"Đã hoàn lại ","color":"yellow"}},{{"text":"+${refund:,} Số Dư (90%)","color":"green","bold":true}},{{"text":" vào tài khoản của bạn!","color":"yellow"}}]')

MINEABLE_BLOCKS = [
    'cobblestone', 'stone', 'coal_ore', 'copper_ore', 'iron_ore', 'gold_ore',
    'redstone_ore', 'lapis_ore', 'diamond_ore', 'emerald_ore',
    'deepslate_coal_ore', 'deepslate_copper_ore', 'deepslate_iron_ore',
    'deepslate_gold_ore', 'deepslate_redstone_ore', 'deepslate_lapis_ore',
    'deepslate_diamond_ore', 'deepslate_emerald_ore', 'ancient_debris'
]

def tick_active_minions(rcon):
    """Vòng lặp thực thi công việc thực tế của Minions trên đảo (chạy mỗi 2.5 giây)"""
    global _swing_toggle
    _swing_toggle = not _swing_toggle
    arm_angle = -105.0 if _swing_toggle else -25.0

    conn = sqlite3.connect(DB_PATH)
    cur = conn.cursor()
    cur.execute('SELECT id, owner, minion_type, tier, stored_count, last_harvest_at, fuel_until FROM minions')
    rows = cur.fetchall()
    conn.close()
    
    if not rows:
        return

    # Hoạt ảnh vung tay toàn bộ Minions đang hiện diện
    rcon.cmd(f'minecraft:execute as @e[type=armor_stand,tag=island_minion] run data merge entity @s {{Pose:{{RightArm:[{arm_angle}f,0f,0f]}}}}')

    now = time.time()
    for r in rows:
        m_id, owner, m_type, tier, stored_count, last_harvest, fuel_until = r
        cfg = MINION_CONFIG.get(m_type, MINION_CONFIG['miner'])
        tier_data = cfg['item_map'].get(tier) or cfg['item_map'][max(cfg['item_map'].keys())]
        ore_block = tier_data[4] if len(tier_data) > 4 else 'cobblestone'

        if m_type == 'miner':
            # 1. Đập vỡ các khối đá/quặng thực tế ở ngay trước mặt Minion (^ ^ ^1, ^ ^1 ^1, ^ ^ ^2)
            for blk in ['cobblestone', 'stone', 'coal_ore', 'copper_ore', 'iron_ore', 'gold_ore', 'redstone_ore', 'lapis_ore', 'diamond_ore', 'emerald_ore']:
                rcon.cmd(f'minecraft:execute as @e[tag=minion_{m_id},limit=1] at @s rotated ~ 0 if block ^ ^ ^1 minecraft:{blk} run setblock ^ ^ ^1 air destroy')
                rcon.cmd(f'minecraft:execute as @e[tag=minion_{m_id},limit=1] at @s rotated ~ 0 if block ^ ^1 ^1 minecraft:{blk} run setblock ^ ^1 ^1 air destroy')
                rcon.cmd(f'minecraft:execute as @e[tag=minion_{m_id},limit=1] at @s rotated ~ 0 if block ^ ^ ^2 minecraft:{blk} run setblock ^ ^ ^2 air destroy')
            # 2. Nếu ô trước mặt (^ ^ ^1) đang trống và bên dưới (^ ^-1 ^1) là nền đá/obsidian của máy quặng -> Tự động kết tinh khối quặng theo Tier của Minion để chu kỳ sau đập tiếp!
            if not _swing_toggle:
                rcon.cmd(f'minecraft:execute as @e[tag=minion_{m_id},limit=1] at @s rotated ~ 0 if block ^ ^ ^1 air unless block ^ ^-1 ^1 air run setblock ^ ^ ^1 minecraft:{ore_block}')
            # 3. Hiệu ứng tia lửa cúp chạm đá & âm thanh đào mỏ sống động
            rcon.cmd(f'minecraft:execute at @e[tag=minion_{m_id},limit=1] rotated ~ 0 run particle minecraft:crit ^ ^0.8 ^1 0.25 0.25 0.25 0.1 6')
            rcon.cmd(f'minecraft:execute at @e[tag=minion_{m_id},limit=1] run playsound minecraft:block.stone.break block @a[distance=..12] ~ ~ ~ 0.5 1.2')
            # 4. Tự động hút vật phẩm rơi quanh Minion (bán kính 3.5 block) về người chơi gần đó hoặc gom gọn vào kho Minion
            rcon.cmd(f'minecraft:execute at @e[tag=minion_{m_id},limit=1] as @e[type=item,distance=..3.5] run tp @s @p[distance=..8]')
            rcon.cmd(f'minecraft:execute at @e[tag=minion_{m_id},limit=1] unless entity @p[distance=..8] run kill @e[type=item,distance=..3.5]')

        elif m_type == 'farmer':
            # Tự động gặt lúa mì, cà rốt, khoai tây, củ dền đã chín quanh bán kính 2 block và gieo hạt trồng lại ngay lập tức
            for dx in range(-2, 3):
                for dz in range(-2, 3):
                    if dx == 0 and dz == 0:
                        continue
                    rcon.cmd(f'minecraft:execute at @e[tag=minion_{m_id},limit=1] if block ~{dx} ~ ~{dz} minecraft:wheat[age=7] run setblock ~{dx} ~ ~{dz} minecraft:wheat[age=0] destroy')
                    rcon.cmd(f'minecraft:execute at @e[tag=minion_{m_id},limit=1] if block ~{dx} ~ ~{dz} minecraft:carrots[age=7] run setblock ~{dx} ~ ~{dz} minecraft:carrots[age=0] destroy')
                    rcon.cmd(f'minecraft:execute at @e[tag=minion_{m_id},limit=1] if block ~{dx} ~ ~{dz} minecraft:potatoes[age=7] run setblock ~{dx} ~ ~{dz} minecraft:potatoes[age=0] destroy')
                    rcon.cmd(f'minecraft:execute at @e[tag=minion_{m_id},limit=1] if block ~{dx} ~ ~{dz} minecraft:beetroots[age=3] run setblock ~{dx} ~ ~{dz} minecraft:beetroots[age=0] destroy')
            rcon.cmd(f'minecraft:execute at @e[tag=minion_{m_id},limit=1] run particle minecraft:happy_villager ~ ~0.6 ~ 0.5 0.3 0.5 0.05 4')
            rcon.cmd(f'minecraft:execute at @e[tag=minion_{m_id},limit=1] as @e[type=item,distance=..4] run tp @s @p[distance=..8]')
            rcon.cmd(f'minecraft:execute at @e[tag=minion_{m_id},limit=1] unless entity @p[distance=..8] run kill @e[type=item,distance=..4]')

        elif m_type == 'slayer':
            # Tự động xoay mặt về phía quái vật gần nhất, vung kiếm chém lan & hút đồ rơi
            rcon.cmd(f'minecraft:execute as @e[tag=minion_{m_id},limit=1] at @s if entity @e[type=!player,type=!armor_stand,type=!item,type=!villager,type=!interaction,distance=..5] run tp @s ~ ~ ~ facing entity @e[type=!player,type=!armor_stand,type=!item,type=!villager,type=!interaction,distance=..5,limit=1,sort=nearest]')
            dmg = 8 + (tier * 3)
            rcon.cmd(f'minecraft:execute at @e[tag=minion_{m_id},limit=1] run damage @e[type=!player,type=!armor_stand,type=!item,type=!villager,type=!interaction,distance=..4.5] {dmg}')
            rcon.cmd(f'minecraft:execute at @e[tag=minion_{m_id},limit=1] rotated ~ 0 run particle minecraft:sweep_attack ^ ^0.8 ^1 0.2 0.2 0.2 0.05 1')
            rcon.cmd(f'minecraft:execute at @e[tag=minion_{m_id},limit=1] as @e[type=item,distance=..4.5] run tp @s @p[distance=..8]')

        elif m_type == 'builder':
            rcon.cmd(f'minecraft:execute at @e[tag=minion_{m_id},limit=1] run particle minecraft:WAX_ON ~ ~0.7 ~ 0.3 0.3 0.3 0.05 3')


class MinionManager:
    def __init__(self, rcon, data=None, save_fn=None):
        self.rcon = rcon
        self.data = data or {}
        self.save_fn = save_fn or (lambda: None)

    def tick_all_minions(self):
        tick_active_minions(self.rcon)

    def build_royal_ore_temple(self, player):
        expand_island_floor(self.rcon, player)

    def spawn_minion(self, player, m_type, tier=1):
        now = time.time()
        conn = sqlite3.connect(DB_PATH)
        cur = conn.cursor()
        cur.execute(
            'INSERT INTO minions (owner, minion_type, tier, world, x, y, z, created_at, last_harvest_at, stored_count) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
            (player, m_type, tier, 'world', 0, 100, 0, now, now, 0)
        )
        mid = cur.lastrowid
        conn.commit()
        conn.close()
        spawn_minion_in_world(self.rcon, player, mid, m_type, tier)
        return mid

    def handle_is_subcommand(self, player, args, get_bal_fn, add_bal_fn, bonus_fn, get_gems_fn=None, take_gems_fn=None):
        bal = get_bal_fn(player)
        sub = args[0].lower() if args else "minions"
        if sub in ("minion", "minions", "menu", "control"):
            self.rcon.cmd(f"dm open minion_control {player}")
            bonus_speed = 1.0 + (bonus_fn(player) / 100.0)
            show_minions_menu(self.rcon, player, bal, speed_bonus=bonus_speed)
        elif sub == "build":
            expand_island_floor(self.rcon, player)
        elif sub == "buy" and len(args) >= 2:
            buy_minion(self.rcon, player, args[1], bal)
        elif sub in ("collect", "collectall"):
            mid = args[1] if len(args) >= 2 else None
            collect_player_minions(self.rcon, player, mid)
        elif sub in ("sell", "sellall"):
            sell_all_minion_storage(self.rcon, player, bonus_multiplier=1.0 + (bonus_fn(player)/100.0))
        elif sub == "upgrade":
            mid = args[1] if len(args) >= 2 else None
            if not mid:
                p_mins = get_player_minions(player)
                if p_mins:
                    mid = p_mins[0]['id']
            if mid:
                upgrade_minion(self.rcon, player, mid, bal, take_gems_fn=take_gems_fn)
        elif sub in ("upgrade_range", "range"):
            mid = args[1] if len(args) >= 2 else None
            if not mid:
                p_mins = get_player_minions(player)
                if p_mins:
                    mid = p_mins[0]['id']
            if mid:
                upgrade_minion_range(self.rcon, player, mid, bal, take_gems_fn=take_gems_fn)
        elif sub in ("upgrade_speed", "speed"):
            mid = args[1] if len(args) >= 2 else None
            if not mid:
                p_mins = get_player_minions(player)
                if p_mins:
                    mid = p_mins[0]['id']
            if mid:
                upgrade_minion_speed(self.rcon, player, mid, bal, take_gems_fn=take_gems_fn)
        elif sub in ("upgrade_storage", "storage"):
            mid = args[1] if len(args) >= 2 else None
            if not mid:
                p_mins = get_player_minions(player)
                if p_mins:
                    mid = p_mins[0]['id']
            if mid:
                upgrade_minion_storage(self.rcon, player, mid, bal, take_gems_fn=take_gems_fn)
        elif sub in ("change_tool", "tool"):
            mid = args[1] if len(args) >= 2 else None
            if not mid:
                p_mins = get_player_minions(player)
                if p_mins:
                    mid = p_mins[0]['id']
            if mid:
                upgrade_minion_tool(self.rcon, player, mid, bal, take_gems_fn=take_gems_fn)
        elif sub in ("change_skin", "skin"):
            mid = args[1] if len(args) >= 2 else None
            skin_k = args[2] if len(args) >= 3 else "default"
            if not mid:
                p_mins = get_player_minions(player)
                if p_mins:
                    mid = p_mins[0]['id']
            if mid:
                change_minion_skin(self.rcon, player, mid, skin_k, bal, take_gems_fn=take_gems_fn)
        elif sub == "pickup" and len(args) >= 2:
            pickup_minion(self.rcon, player, args[1])
        elif sub == "fuel" and len(args) >= 2:
            fuel_minion(self.rcon, player, args[1], bal)
        elif sub == "relocate" and len(args) >= 2:
            relocate_minion(self.rcon, player, args[1])

