# -*- coding: utf-8 -*-
"""
Python script to generate the Grand Hybrid Skyblock Spawn Hub Architecture.
Features:
- Central Core Nexus (R=21) with Grand Starlight Beacon & Cherry Blossom World Trees
- North Wing: Ancient Forge & Alchemy Cathedral (15 Tiers Evolution RPG Sanctuary)
- South Wing: Golden Crates Plaza & Hall of Fame Leaderboard Monuments
- East Wing: Cosmic Stargate Void Portal & Realms Gateway
- West Wing: Grand Bazaar (4 Villager Shops) & Fortune Casino (Coinflip & Lottery)
- 4 Suspension Bridges with Iron Chains & Blackstone Rails
- 8 Instant Wind Launch Pads connecting all islands
- Safe, non-laggy rasterized fill command generation
"""

import os
import math
import sys

sys.stdout.reconfigure(encoding='utf-8')

BASE_DIR = r"C:\Users\Administrator\.gemini\antigravity\scratch\Skyblock-Server\world\datapacks\skyblock_spawn\data\skyblock\function"
BUILDER_DIR = os.path.join(BASE_DIR, "builder")
LAUNCH_DIR = os.path.join(BASE_DIR, "launch")

os.makedirs(BUILDER_DIR, exist_ok=True)
os.makedirs(LAUNCH_DIR, exist_ok=True)

def generate_floating_island_slice(cx, cz, y, r, block, inner_r=None):
    """Generates rasterized horizontal fill spans for a circular slice."""
    lines = []
    r_ceil = int(math.ceil(r))
    for dz in range(-r_ceil, r_ceil + 1):
        z = cz + dz
        dist_z_sq = dz * dz
        if dist_z_sq > r * r:
            continue
        max_dx = int(math.floor(math.sqrt(r * r - dist_z_sq)))
        x_min = cx - max_dx
        x_max = cx + max_dx
        
        if inner_r is not None and inner_r > 0:
            if dist_z_sq < inner_r * inner_r:
                inner_max_dx = int(math.floor(math.sqrt(inner_r * inner_r - dist_z_sq)))
                left_max = cx - inner_max_dx - 1
                if x_min <= left_max:
                    lines.append(f"fill {x_min} {y} {z} {left_max} {y} {z} {block}")
                right_min = cx + inner_max_dx + 1
                if right_min <= x_max:
                    lines.append(f"fill {right_min} {y} {z} {x_max} {y} {z} {block}")
                continue
        lines.append(f"fill {x_min} {y} {z} {x_max} {y} {z} {block}")
    return lines

def build_organic_island(cx, cz, base_y=96, top_y=120, max_r=20):
    """Builds an organic tapered floating island underbody from bottom tip to surface."""
    lines = []
    height = top_y - base_y
    for y in range(base_y, top_y):
        prog = (y - base_y) / float(height)
        r = max_r * (prog ** 0.65)
        if r < 1.0:
            r = 1.0
            
        if y < base_y + 4:
            mat = "gilded_blackstone"
        elif y < base_y + 10:
            mat = "cobbled_deepslate"
        elif y < base_y + 18:
            mat = "deepslate"
        elif y < top_y - 2:
            mat = "stone"
        else:
            mat = "dirt"
        lines.extend(generate_floating_island_slice(cx, cz, y, r, mat))
    
    # Surface layer at top_y: Grass block
    lines.extend(generate_floating_island_slice(cx, cz, top_y, max_r, "grass_block"))
    return lines

# ==============================================================================
# 1. CORE NEXUS BUILD (hub_core.mcfunction)
# ==============================================================================
def gen_hub_core():
    lines = []
    lines.append("# Clear old central hub space (X: -26..26, Z: -26..26, Y: 94..145)")
    lines.append("fill -26 94 -26 26 145 26 air")
    lines.append("")
    
    lines.append("# 1. Đảo Trung Tâm Bay Hư Không (Organic Floating Island Underbody)")
    lines.extend(build_organic_island(0, 0, base_y=96, top_y=120, max_r=21))
    lines.append("")
    
    lines.append("# 2. Mặt Sàn Quảng Trường Thạch Anh & Hoa Văn Hoàng Gia (Y=120)")
    lines.extend(generate_floating_island_slice(0, 0, 120, 15, "smooth_quartz"))
    lines.extend(generate_floating_island_slice(0, 0, 120, 9, "quartz_bricks"))
    lines.extend(generate_floating_island_slice(0, 0, 120, 4, "chiseled_quartz_block"))
    
    lines.append("# Vòng hào quang phát sáng ngầm")
    for angle in range(0, 360, 30):
        rad = math.radians(angle)
        x = int(round(10 * math.cos(rad)))
        z = int(round(10 * math.sin(rad)))
        lines.append(f"setblock {x} 120 {z} sea_lantern")
        lines.append(f"setblock {x} 121 {z} purple_stained_glass")
    
    lines.append("")
    lines.append("# 3. Đài Khí Tượng Ánh Sáng Trung Tâm (The Grand Starlight Nexus)")
    lines.append("fill -2 121 -2 2 126 2 air")
    lines.append("fill -1 119 -1 1 119 1 iron_block")
    lines.append("setblock 0 120 0 beacon")
    lines.append("setblock 0 121 0 cyan_stained_glass")
    lines.append("setblock 0 122 0 light_blue_stained_glass")
    
    lines.append("setblock -1 120 -1 smooth_quartz_stairs[facing=south,half=bottom]")
    lines.append("setblock 1 120 -1 smooth_quartz_stairs[facing=south,half=bottom]")
    lines.append("setblock -1 120 1 smooth_quartz_stairs[facing=north,half=bottom]")
    lines.append("setblock 1 120 1 smooth_quartz_stairs[facing=north,half=bottom]")
    lines.append("setblock 0 120 -1 smooth_quartz_stairs[facing=south,half=bottom]")
    lines.append("setblock 0 120 1 smooth_quartz_stairs[facing=north,half=bottom]")
    lines.append("setblock -1 120 0 smooth_quartz_stairs[facing=east,half=bottom]")
    lines.append("setblock 1 120 0 smooth_quartz_stairs[facing=west,half=bottom]")
    lines.append("fill 0 127 0 0 175 0 light_blue_stained_glass")
    
    for px, pz in [(-3, -3), (3, -3), (-3, 3), (3, 3)]:
        lines.append(f"fill {px} 121 {pz} {px} 126 {pz} quartz_pillar")
        lines.append(f"setblock {px} 127 {pz} sea_lantern")
        lines.append(f"setblock {px} 128 {pz} amethyst_cluster[facing=up]")
        lines.append(f"setblock {px} 126 {pz} gilded_blackstone")
    
    lines.append("fill -3 127 -2 -3 127 2 smooth_quartz_slab[type=top]")
    lines.append("fill 3 127 -2 3 127 2 smooth_quartz_slab[type=top]")
    lines.append("fill -2 127 -3 2 127 -3 smooth_quartz_slab[type=top]")
    lines.append("fill -2 127 3 2 127 3 smooth_quartz_slab[type=top]")
    
    lines.append("")
    lines.append("# 4. Bốn Cổ Thụ Hoa Anh Đào (Cherry Blossom World Trees)")
    for tx, tz in [(-13, -13), (13, -13), (-13, 13), (13, 13)]:
        lines.append(f"fill {tx} 121 {tz} {tx} 124 {tz} cherry_log")
        lines.append(f"setblock {tx} 125 {tz} cherry_wood")
        lines.append(f"setblock {tx+1} 125 {tz} cherry_log[axis=x]")
        lines.append(f"setblock {tx-1} 125 {tz} cherry_log[axis=x]")
        lines.append(f"setblock {tx} 125 {tz+1} cherry_log[axis=z]")
        lines.append(f"setblock {tx} 125 {tz-1} cherry_log[axis=z]")
        lines.append(f"fill {tx-2} 125 {tz-2} {tx+2} 126 {tz+2} cherry_leaves[distance=1,persistent=true] replace air")
        lines.append(f"fill {tx-3} 125 {tz-1} {tx+3} 125 {tz+1} cherry_leaves[distance=1,persistent=true] replace air")
        lines.append(f"fill {tx-1} 125 {tz-3} {tx+1} 125 {tz+3} cherry_leaves[distance=1,persistent=true] replace air")
        lines.append(f"fill {tx-1} 127 {tz-1} {tx+1} 127 {tz+1} cherry_leaves[distance=1,persistent=true] replace air")
        lines.append(f"setblock {tx} 128 {tz} cherry_leaves[distance=1,persistent=true]")
        lines.append(f"setblock {tx+1} 124 {tz} lantern[hanging=true]")
        lines.append(f"setblock {tx-1} 124 {tz} lantern[hanging=true]")
        lines.append(f"setblock {tx+1} 121 {tz+1} pink_petals[flower_amount=4]")
        lines.append(f"setblock {tx-1} 121 {tz-1} pink_petals[flower_amount=3]")
        lines.append(f"setblock {tx+2} 121 {tz} pink_petals[flower_amount=2]")
    
    lines.append("")
    lines.append("# 5. Thác Nước Ánh Sáng Đổ Xuống Hư Không (Light Waterfalls)")
    for wx, wz in [(-17, 0), (17, 0), (0, -17), (0, 17)]:
        lines.append(f"setblock {wx} 120 {wz} sea_lantern")
        lines.append(f"setblock {wx} 119 {wz} water")
        lines.append(f"fill {wx} 100 {wz} {wx} 118 {wz} water")
        lines.append(f"setblock {wx+1} 119 {wz} gilded_blackstone")
        lines.append(f"setblock {wx-1} 119 {wz} gilded_blackstone")
        lines.append(f"setblock {wx} 119 {wz+1} gilded_blackstone")
        lines.append(f"setblock {wx} 119 {wz-1} gilded_blackstone")

    lines.append("")
    lines.append("# 6. Bốn Cầu Treo Nghệ Thuật (Suspension Bridges) Nối Ra 4 Cánh")
    lines.append("fill -2 120 -42 2 120 -21 polished_blackstone_bricks")
    lines.append("fill -1 120 -42 1 120 -21 smooth_quartz")
    lines.append("fill -3 121 -42 -3 121 -21 polished_deepslate_wall")
    lines.append("fill 3 121 -42 3 121 -21 polished_deepslate_wall")
    
    lines.append("fill -2 120 21 2 120 42 polished_blackstone_bricks")
    lines.append("fill -1 120 21 1 120 42 smooth_quartz")
    lines.append("fill -3 121 21 -3 121 42 polished_deepslate_wall")
    lines.append("fill 3 121 21 3 121 42 polished_deepslate_wall")
    
    lines.append("fill 21 120 -2 42 120 2 polished_blackstone_bricks")
    lines.append("fill 21 120 -1 42 120 1 smooth_quartz")
    lines.append("fill 21 121 -3 42 121 -3 polished_deepslate_wall")
    lines.append("fill 21 121 3 42 121 3 polished_deepslate_wall")
    
    lines.append("fill -42 120 -2 -21 120 2 polished_blackstone_bricks")
    lines.append("fill -42 120 -1 -21 120 1 smooth_quartz")
    lines.append("fill -42 121 -3 -21 121 -3 polished_deepslate_wall")
    lines.append("fill -42 121 3 -21 121 3 polished_deepslate_wall")
    
    for offset in [25, 32, 39]:
        lines.append(f"setblock -3 122 -{offset} lantern")
        lines.append(f"setblock 3 122 -{offset} lantern")
        lines.append(f"setblock -3 122 {offset} lantern")
        lines.append(f"setblock 3 122 {offset} lantern")
        lines.append(f"setblock {offset} 122 -3 lantern")
        lines.append(f"setblock {offset} 122 3 lantern")
        lines.append(f"setblock -{offset} 122 -3 lantern")
        lines.append(f"setblock -{offset} 122 3 lantern")
    
    lines.append("")
    lines.append("# 7. Bốn Bệ Phóng Launch Pad Tại Đảo Trung Tâm")
    # Bắc Launch Pad: (0, 120, -18)
    lines.append("setblock 0 120 -18 lodestone")
    lines.append("setblock 0 121 -18 heavy_weighted_pressure_plate")
    lines.append("setblock -1 120 -18 sea_lantern")
    lines.append("setblock 1 120 -18 sea_lantern")
    lines.append("setblock 0 120 -19 sea_lantern")
    lines.append("setblock 0 120 -17 sea_lantern")
    lines.append(r'''summon text_display 0.5 122.5 -18.5 {text:'{"text":"▲ PHÓNG ĐẾN ĐẢO RÈN THẦN KHÍ (BẮC) ▲","color":"gold","bold":true}',billboard:"vertical",transformation:{scale:[0.8f,0.8f,0.8f],translation:[0f,0f,0f],rotation:[0f,0f,0f,1f]},Tags:["hub_display"]}''')
    
    # Nam Launch Pad: (0, 120, 18)
    lines.append("setblock 0 120 18 lodestone")
    lines.append("setblock 0 121 18 heavy_weighted_pressure_plate")
    lines.append("setblock -1 120 18 sea_lantern")
    lines.append("setblock 1 120 18 sea_lantern")
    lines.append("setblock 0 120 17 sea_lantern")
    lines.append("setblock 0 120 19 sea_lantern")
    lines.append(r'''summon text_display 0.5 122.5 18.5 {text:'{"text":"▼ PHÓNG ĐẾN ĐẢO RƯƠNG BÁU & BXH (NAM) ▼","color":"yellow","bold":true}',billboard:"vertical",transformation:{scale:[0.8f,0.8f,0.8f],translation:[0f,0f,0f],rotation:[0f,0f,0f,1f]},Tags:["hub_display"]}''')
    
    # Đông Launch Pad: (18, 120, 0)
    lines.append("setblock 18 120 0 lodestone")
    lines.append("setblock 18 121 0 heavy_weighted_pressure_plate")
    lines.append("setblock 18 120 -1 sea_lantern")
    lines.append("setblock 18 120 1 sea_lantern")
    lines.append("setblock 17 120 0 sea_lantern")
    lines.append("setblock 19 120 0 sea_lantern")
    lines.append(r'''summon text_display 18.5 122.5 0.5 {text:'{"text":"▶ PHÓNG ĐẾN ĐẠI CỔNG STARGATE (ĐÔNG) ▶","color":"dark_purple","bold":true}',billboard:"vertical",transformation:{scale:[0.8f,0.8f,0.8f],translation:[0f,0f,0f],rotation:[0f,0f,0f,1f]},Tags:["hub_display"]}''')
    
    # Tây Launch Pad: (-18, 120, 0)
    lines.append("setblock -18 120 0 lodestone")
    lines.append("setblock -18 121 0 heavy_weighted_pressure_plate")
    lines.append("setblock -18 120 -1 sea_lantern")
    lines.append("setblock -18 120 1 sea_lantern")
    lines.append("setblock -17 120 0 sea_lantern")
    lines.append("setblock -19 120 0 sea_lantern")
    lines.append(r'''summon text_display -18.5 122.5 0.5 {text:'{"text":"◀ PHÓNG ĐẾN ĐẠI CHỢ & CASINO (TÂY) ◀","color":"green","bold":true}',billboard:"vertical",transformation:{scale:[0.8f,0.8f,0.8f],translation:[0f,0f,0f],rotation:[0f,0f,0f,1f]},Tags:["hub_display"]}''')

    lines.append("")
    lines.append("# 8. Biển Chỉ Dẫn & NPC Tân Thủ Tại Trung Tâm")
    lines.append("kill @e[type=villager,tag=guide_npc]")
    lines.append("kill @e[type=interaction,tag=guide_interact]")
    lines.append("kill @e[type=armor_stand,tag=guide_hologram]")
    lines.append("kill @e[type=text_display,tag=hub_display]")
    lines.append(r'''summon villager 0.5 121 3.5 {Tags:["guide_npc"],CustomName:'{"text":"🧭 HƯỚNG DẪN VIÊN TÂN THỦ 🧭","color":"gold","bold":true}',CustomNameVisible:1b,NoAI:1b,Invulnerable:1b,PersistenceRequired:1b,Silent:1b,VillagerData:{profession:librarian,type:plains,level:5},Rotation:[180f,0f]}''')
    lines.append(r'''summon interaction 0.5 121 3.5 {Tags:["guide_interact"],width:1.2f,height:1.9f,response:1b}''')
    lines.append(r'''summon armor_stand 0.5 123.2 3.5 {Tags:["guide_hologram"],Invisible:1b,Marker:1b,NoGravity:1b,CustomNameVisible:1b,CustomName:'{"text":"[ CLICK ĐỂ XEM HƯỚNG DẪN TÂN THỦ ]","color":"yellow","bold":true}'}''')
    
    lines.append(r'''setblock 0 121 -2 oak_wall_sign[facing=south]{front_text:{has_glowing_text:1b,messages:['{"text":"★ SKYBLOCK VN ★","color":"gold","bold":true}','{"text":"Bắc: Rèn RPG 15 Tiers","color":"red"}','{"text":"Nam: Rương Báu & BXH","color":"yellow"}','{"text":"Đông: Cổng Warp / Boss","color":"aqua"}']}}''')
    lines.append(r'''setblock 0 121 2 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:['{"text":"★ ĐẠI SẢNH QUẢNG TRƯỜNG ★","color":"green","bold":true}','{"text":"Tây: Chợ Trời & Casino","color":"green"}','{"text":"Gõ /warp mở Menu","color":"gold"}','{"text":"Dẫm bệ vàng để phóng!","color":"aqua"}']}}''')
    
    path = os.path.join(BUILDER_DIR, "hub_core.mcfunction")
    with open(path, "w", encoding="utf-8") as f:
        f.write("\n".join(lines) + "\n")
    print(f"Generated {path}")

# ==============================================================================
# 2. NORTH WING BUILD (Thánh Điện Rèn Cổ Đại 15 Tiers)
# ==============================================================================
def gen_hub_north():
    lines = []
    lines.append("# Clear old North Wing space (X: -18..18, Z: -72..-38, Y: 96..145)")
    lines.append("fill -18 96 -72 18 145 -38 air")
    lines.append("")
    
    lines.append("# 1. Đảo Bay Cánh Bắc (North Island Underbody: Center 0, -55, Max R=16)")
    lines.extend(build_organic_island(0, -55, base_y=98, top_y=120, max_r=16))
    lines.append("")
    
    lines.append("# 2. Mặt Sàn Thánh Điện Rèn Thần Khí (Y=120)")
    lines.extend(generate_floating_island_slice(0, -55, 120, 15, "polished_blackstone_bricks"))
    lines.extend(generate_floating_island_slice(0, -55, 120, 11, "gilded_blackstone"))
    lines.extend(generate_floating_island_slice(0, -55, 120, 6, "smooth_quartz"))
    
    lines.append("")
    lines.append("# 3. Đại Lò Rèn Ma Thuật Khổng Lồ (The Colossal Mythic Anvil & Forge - Z=-63)")
    lines.append("fill -3 120 -65 3 120 -62 netherite_block")
    lines.append("fill -2 121 -65 2 121 -63 soul_campfire")
    lines.append("setblock 0 121 -64 lava")
    lines.append("fill -4 121 -65 -4 125 -62 polished_blackstone_bricks")
    lines.append("fill 4 121 -65 4 125 -62 polished_blackstone_bricks")
    lines.append("fill -3 126 -65 3 126 -62 chiseled_polished_blackstone")
    lines.append("setblock 0 122 -62 anvil[facing=north]")
    lines.append("setblock -2 122 -62 blast_furnace[facing=south]")
    lines.append("setblock 2 122 -62 blast_furnace[facing=south]")
    lines.append("fill -1 127 -64 1 130 -63 polished_blackstone_wall")
    
    lines.append("")
    lines.append("# 4. Ba Bệ Đài Vòm Danh Dự Cho 3 NPC Thần Rèn (Z=-55..-58)")
    # Bệ Tây: Đại Sư Luyện Kim (X=-7, Z=-55)
    lines.append("fill -8 120 -56 -6 120 -54 sea_lantern")
    lines.append("fill -8 121 -56 -6 121 -54 purple_stained_glass")
    lines.append("fill -9 121 -57 -9 124 -53 quartz_pillar")
    lines.append("setblock -9 125 -55 sea_lantern")
    lines.append("setblock -7 122 -53 brewing_stand")
    lines.append("setblock -7 122 -57 enchanting_table")
    
    # Bệ Trung Tâm: Thần Rèn Cúp & Rìu (X=0, Z=-58)
    lines.append("fill -1 120 -59 1 120 -57 sea_lantern")
    lines.append("fill -1 121 -59 1 121 -57 yellow_stained_glass")
    lines.append("fill -2 121 -60 -2 124 -60 quartz_pillar")
    lines.append("fill 2 121 -60 2 124 -60 quartz_pillar")
    lines.append("setblock -2 125 -60 gold_block")
    lines.append("setblock 2 125 -60 gold_block")
    lines.append("setblock -1 122 -60 anvil[facing=south]")
    lines.append("setblock 1 122 -60 smithing_table")
    
    # Bệ Đông: Thần Rèn Vũ Khí & Giáp (X=7, Z=-55)
    lines.append("fill 6 120 -56 8 120 -54 sea_lantern")
    lines.append("fill 6 121 -56 8 121 -54 red_stained_glass")
    lines.append("fill 9 121 -57 9 124 -53 quartz_pillar")
    lines.append("setblock 9 125 -55 sea_lantern")
    lines.append("setblock 7 122 -53 grindstone[facing=north]")
    lines.append("setblock 7 122 -57 smithing_table")

    lines.append("")
    lines.append("# 5. Bệ Trưng Bày Thần Khí Triển Lãm (Exhibition Armors)")
    lines.append("kill @e[type=armor_stand,tag=forge_display_stand]")
    lines.append(r'''summon armor_stand -4 121 -55 {Tags:["forge_display_stand"],NoGravity:1b,Invulnerable:1b,ShowArms:1b,ArmorItems:[{id:"minecraft:netherite_boots",count:1},{id:"minecraft:netherite_leggings",count:1},{id:"minecraft:netherite_chestplate",count:1},{id:"minecraft:netherite_helmet",count:1}],HandItems:[{id:"minecraft:netherite_sword",count:1},{}],CustomName:'{"text":"✦ CHIẾN THẦN CỔ ĐẠI ✦","color":"red","bold":true}',CustomNameVisible:1b}''')
    lines.append(r'''summon armor_stand 4 121 -55 {Tags:["forge_display_stand"],NoGravity:1b,Invulnerable:1b,ShowArms:1b,ArmorItems:[{id:"minecraft:diamond_boots",count:1},{id:"minecraft:diamond_leggings",count:1},{id:"minecraft:diamond_chestplate",count:1},{id:"minecraft:diamond_helmet",count:1}],HandItems:[{id:"minecraft:bow",count:1},{}],CustomName:'{"text":"✦ CUNG THỦ THẦN THOẠI ✦","color":"aqua","bold":true}',CustomNameVisible:1b}''')

    lines.append("")
    lines.append("# 6. Bệ Phóng Launch Pad Về Trung Tâm (0, 120, -43)")
    lines.append("setblock 0 120 -43 lodestone")
    lines.append("setblock 0 121 -43 heavy_weighted_pressure_plate")
    lines.append("setblock -1 120 -43 sea_lantern")
    lines.append("setblock 1 120 -43 sea_lantern")
    lines.append("setblock 0 120 -44 sea_lantern")
    lines.append("setblock 0 120 -42 sea_lantern")
    lines.append(r'''summon text_display 0.5 122.5 -42.5 {text:'{"text":"▼ PHÓNG VỀ ĐẢO TRUNG TÂM ▼","color":"gold","bold":true}',billboard:"vertical",transformation:{scale:[0.8f,0.8f,0.8f],translation:[0f,0f,0f],rotation:[0f,0f,0f,1f]},Tags:["forge_display"]}''')
    
    path = os.path.join(BUILDER_DIR, "hub_north.mcfunction")
    with open(path, "w", encoding="utf-8") as f:
        f.write("\n".join(lines) + "\n")
    print(f"Generated {path}")

# ==============================================================================
# 3. SOUTH WING BUILD (Quảng Trường Rương Báu & BXH)
# ==============================================================================
def gen_hub_south():
    lines = []
    lines.append("# Clear old South Wing space (X: -18..18, Z: 38..72, Y: 96..145)")
    lines.append("fill -18 96 38 18 145 72 air")
    lines.append("")
    
    lines.append("# 1. Đảo Bay Cánh Nam (South Island Underbody: Center 0, 55, Max R=16)")
    lines.extend(build_organic_island(0, 55, base_y=98, top_y=120, max_r=16))
    lines.append("")
    
    lines.append("# 2. Mặt Sàn Quảng Trường Hoàng Gia (Y=120)")
    lines.extend(generate_floating_island_slice(0, 55, 120, 15, "smooth_quartz"))
    lines.extend(generate_floating_island_slice(0, 55, 120, 10, "gold_block"))
    lines.extend(generate_floating_island_slice(0, 55, 120, 9, "deepslate_tiles"))
    lines.extend(generate_floating_island_slice(0, 55, 120, 4, "smooth_quartz"))
    lines.append("fill -1 121 44 1 121 64 red_carpet")
    
    lines.append("")
    lines.append("# 3. Ba Bệ Đài Rương Báu Neon Crates (Z=58..60)")
    # Hòm Đồng: (-5, 121, 58)
    lines.append("fill -6 120 57 -4 120 59 copper_block")
    lines.append("setblock -5 121 58 barrel[facing=up]")
    lines.append("setblock -6 121 58 cut_copper_stairs[facing=east]")
    lines.append("setblock -4 121 58 cut_copper_stairs[facing=west]")
    lines.append("setblock -5 122 58 sea_lantern")
    lines.append("setblock -5 123 58 copper_grate")
    
    # Hòm Hoàng Kim (Rare): (0, 121, 60)
    lines.append("fill -1 120 59 1 120 61 gold_block")
    lines.append("setblock 0 121 60 gilded_blackstone")
    lines.append("setblock -1 121 60 smooth_quartz_stairs[facing=east]")
    lines.append("setblock 1 121 60 smooth_quartz_stairs[facing=west]")
    lines.append("setblock 0 122 60 shroomlight")
    lines.append("setblock 0 123 60 end_rod")
    
    # Hòm Thần Thoại (Mythic): (5, 121, 58)
    lines.append("fill 4 120 57 6 120 59 crying_obsidian")
    lines.append("setblock 5 121 58 netherite_block")
    lines.append("setblock 4 121 58 polished_blackstone_brick_stairs[facing=east]")
    lines.append("setblock 6 121 58 polished_blackstone_brick_stairs[facing=west]")
    lines.append("setblock 5 122 58 amethyst_block")
    lines.append("setblock 5 123 58 amethyst_cluster[facing=up]")
    
    lines.append("")
    lines.append("# 4. Bốn Cột Tháp Ánh Sáng Thạch Anh & Amethyst Góc")
    for cx, cz in [(-9, 49), (9, 49), (-9, 61), (9, 61)]:
        lines.append(f"fill {cx} 121 {cz} {cx} 126 {cz} quartz_pillar")
        lines.append(f"setblock {cx} 127 {cz} sea_lantern")
        lines.append(f"setblock {cx} 128 {cz} end_rod")
        
    lines.append("")
    lines.append("# 5. Đại Lộ Vinh Danh Bảng Xếp Hạng (Leaderboard Monuments - Z=48..52)")
    # Đài Top Đảo: X=-4, Z=49
    lines.append("setblock -4 121 49 chiseled_quartz_block")
    lines.append(r'''summon armor_stand -4 122 49 {Tags:["hall_fame_stand"],Invisible:1b,Marker:1b,NoGravity:1b,CustomNameVisible:1b,CustomName:'{"text":"🏆 TOP 1 ĐẢO XUẤT SẮC 🏆","color":"gold","bold":true}'}''')
    lines.append(r'''setblock -4 121 50 oak_wall_sign[facing=south]{front_text:{has_glowing_text:1b,messages:['{"text":"[ TOP ĐẢO ]","color":"gold","bold":true}','{"text":"Gõ /is top","color":"yellow"}','{"text":"Xem cấp độ đảo!","color":"green"}','{"text":"Đua top nhận quà","color":"aqua"}']}}''')
    
    # Đài Top Kỹ Năng: X=0, Z=47
    lines.append("setblock 0 121 47 chiseled_quartz_block")
    lines.append(r'''summon armor_stand 0 122 47 {Tags:["hall_fame_stand"],Invisible:1b,Marker:1b,NoGravity:1b,CustomNameVisible:1b,CustomName:'{"text":"⚡ TOP CAO THỦ KỸ NĂNG ⚡","color":"light_purple","bold":true}'}''')
    lines.append(r'''setblock 0 121 48 oak_wall_sign[facing=south]{front_text:{has_glowing_text:1b,messages:['{"text":"[ KỸ NĂNG RPG ]","color":"light_purple","bold":true}','{"text":"Gõ /skills top","color":"yellow"}','{"text":"Bảng vàng chiến binh","color":"green"}','{"text":"Cày cấp nhận BUFF","color":"aqua"}']}}''')
    
    # Đài Top Đại Gia: X=4, Z=49
    lines.append("setblock 4 121 49 chiseled_quartz_block")
    lines.append(r'''summon armor_stand 4 122 49 {Tags:["hall_fame_stand"],Invisible:1b,Marker:1b,NoGravity:1b,CustomNameVisible:1b,CustomName:'{"text":"💎 TOP ĐẠI PHÚ HÀO 💎","color":"aqua","bold":true}'}''')
    lines.append(r'''setblock 4 121 50 oak_wall_sign[facing=south]{front_text:{has_glowing_text:1b,messages:['{"text":"[ ĐẠI GIA ]","color":"aqua","bold":true}','{"text":"Gõ /baltop","color":"yellow"}','{"text":"Tài phiệt Server!","color":"green"}','{"text":"Gõ /is shop bán đồ","color":"gold"}']}}''')

    lines.append("")
    lines.append("# 6. Bệ Phóng Launch Pad Về Trung Tâm (0, 120, 43)")
    lines.append("setblock 0 120 43 lodestone")
    lines.append("setblock 0 121 43 heavy_weighted_pressure_plate")
    lines.append("setblock -1 120 43 sea_lantern")
    lines.append("setblock 1 120 43 sea_lantern")
    lines.append("setblock 0 120 42 sea_lantern")
    lines.append("setblock 0 120 44 sea_lantern")
    lines.append(r'''summon text_display 0.5 122.5 42.5 {text:'{"text":"▲ PHÓNG VỀ ĐẢO TRUNG TÂM ▲","color":"gold","bold":true}',billboard:"vertical",transformation:{scale:[0.8f,0.8f,0.8f],translation:[0f,0f,0f],rotation:[0f,0f,0f,1f]},Tags:["crates_display"]}''')
    
    path = os.path.join(BUILDER_DIR, "hub_south.mcfunction")
    with open(path, "w", encoding="utf-8") as f:
        f.write("\n".join(lines) + "\n")
    print(f"Generated {path}")

# ==============================================================================
# 4. EAST WING BUILD (Đại Cổng Dịch Chuyển Stargate)
# ==============================================================================
def gen_hub_east():
    lines = []
    lines.append("# Clear old East Wing space (X: 38..72, Z: -18..18, Y: 96..145)")
    lines.append("fill 38 96 -18 72 145 18 air")
    lines.append("")
    
    lines.append("# 1. Đảo Bay Cánh Đông - Zen Sakura Portals Sanctuary (Center 55, 0, Max R=16)")
    lines.extend(build_organic_island(55, 0, base_y=98, top_y=120, max_r=16))
    lines.append("")
    
    lines.append("# 2. Mặt Sàn Thư Thái Zen Sakura & Hồ Cá Koi Phát Sáng (Y=120)")
    lines.extend(generate_floating_island_slice(55, 0, 120, 15, "cherry_planks"))
    lines.extend(generate_floating_island_slice(55, 0, 120, 12, "moss_block"))
    lines.extend(generate_floating_island_slice(55, 0, 120, 8, "smooth_quartz"))
    
    lines.append("# Hồ cá Koi phát sáng tại tâm (X=55, Z=0, R=5)")
    lines.extend(generate_floating_island_slice(55, 0, 119, 5, "sea_lantern"))
    lines.extend(generate_floating_island_slice(55, 0, 120, 4, "water"))
    lines.append("setblock 55 121 0 lily_pad")
    lines.append("setblock 54 121 1 lily_pad")
    lines.append("setblock 56 121 -1 lily_pad")
    lines.append("fill 47 121 -12 63 121 12 pink_petals[flower_amount=3] replace air")
    
    lines.append("")
    lines.append("# Cầu Gỗ Cong Zen bắc qua hồ (X=52..58, Z=0)")
    lines.append("fill 52 121 0 58 121 0 cherry_slab[type=bottom]")
    lines.append("fill 54 121 0 56 121 0 cherry_slab[type=top]")
    lines.append("fill 52 122 -1 58 122 -1 cherry_fence")
    lines.append("fill 52 122 1 58 122 1 cherry_fence")
    
    lines.append("")
    lines.append("# 3. Năm Cổng Torii Thần Đạo (5 Physical Torii Portals)")
    
    # --- CỔNG 1: TORII VỰC THẲM BOSS CỔ ĐẠI (X=55, Z=-11) ---
    lines.append("# Torii 1: Cổng Vực Thẳm Boss (world_boss) tại X=55, Z=-11")
    lines.append("fill 53 121 -11 53 125 -11 cherry_wood")
    lines.append("fill 57 121 -11 57 125 -11 cherry_wood")
    lines.append("fill 52 124 -11 58 124 -11 deepslate_tile_slab[type=bottom]")
    lines.append("fill 51 125 -11 59 125 -11 cherry_wood")
    lines.append("fill 50 126 -11 60 126 -11 deepslate_tile_stairs[facing=south,half=top]")
    lines.append("setblock 53 123 -11 soul_lantern[hanging=true]")
    lines.append("setblock 57 123 -11 soul_lantern[hanging=true]")
    lines.append("setblock 55 120 -11 crying_obsidian")
    lines.append("setblock 55 121 -11 polished_blackstone_pressure_plate")
    lines.append(r'''setblock 55 123 -11 oak_wall_sign[facing=south]{front_text:{has_glowing_text:1b,messages:['{"text":"[ CỔNG TORII 1 ]","color":"dark_red","bold":true}','{"text":"Vực Thẳm Boss","color":"gold"}','{"text":"Bước vào cổng","color":"yellow"}','{"text":"Sang world_boss","color":"red","bold":true}']}}''')
    lines.append(r'''summon text_display 55.5 124.5 -10.5 {text:'{"text":"👹 VỰC THẲM ĐẤU TRƯỜNG BOSS 👹","color":"red","bold":true}',billboard:"vertical",transformation:{scale:[0.8f,0.8f,0.8f],translation:[0f,0f,0f],rotation:[0f,0f,0f,1f]},Tags:["portal_display"]}''')
    
    # --- CỔNG 2: TORII VƯỜN THƯỢNG UYỂN & HẦM NGỤC (X=45, Z=-7) ---
    lines.append("# Torii 2: Cổng Nông Trại & Hầm Quái (world_farm) tại X=45, Z=-7")
    lines.append("fill 45 121 -9 45 125 -9 cherry_wood")
    lines.append("fill 45 121 -5 45 125 -5 cherry_wood")
    lines.append("fill 45 124 -10 45 124 -4 cherry_slab[type=bottom]")
    lines.append("fill 45 125 -11 45 125 -3 cherry_wood")
    lines.append("fill 45 126 -12 45 126 -2 deepslate_tile_stairs[facing=east,half=top]")
    lines.append("setblock 45 123 -9 lantern[hanging=true]")
    lines.append("setblock 45 123 -5 lantern[hanging=true]")
    lines.append("setblock 45 120 -7 moss_block")
    lines.append("setblock 45 121 -7 stone_pressure_plate")
    lines.append(r'''setblock 45 123 -7 oak_wall_sign[facing=east]{front_text:{has_glowing_text:1b,messages:['{"text":"[ CỔNG TORII 2 ]","color":"green","bold":true}','{"text":"Ruộng Lúa & Quái","color":"dark_green"}','{"text":"Bước vào cổng","color":"yellow"}','{"text":"Sang world_farm","color":"green","bold":true}']}}''')
    lines.append(r'''summon text_display 45.5 124.5 -6.5 {text:'{"text":"🌾 VƯỜN SAKURA & HẦM NGỤC 🌾","color":"green","bold":true}',billboard:"vertical",transformation:{scale:[0.8f,0.8f,0.8f],translation:[0f,0f,0f],rotation:[0f,0f,0f,1f]},Tags:["portal_display"]}''')

    # --- CỔNG 3: TORII BIỂN HỒ TRÊN MÂY (X=45, Z=7) ---
    lines.append("# Torii 3: Cổng Biển Hồ Trên Mây (world_cauca) tại X=45, Z=7")
    lines.append("fill 45 121 5 45 125 5 cherry_wood")
    lines.append("fill 45 121 9 45 125 9 cherry_wood")
    lines.append("fill 45 124 4 45 124 10 prismarine_slab[type=bottom]")
    lines.append("fill 45 125 3 45 125 11 cherry_wood")
    lines.append("fill 45 126 2 45 126 12 deepslate_tile_stairs[facing=east,half=top]")
    lines.append("setblock 45 123 5 lantern[hanging=true]")
    lines.append("setblock 45 123 9 lantern[hanging=true]")
    lines.append("setblock 45 120 7 dark_prismarine")
    lines.append("setblock 45 121 7 stone_pressure_plate")
    lines.append(r'''setblock 45 123 7 oak_wall_sign[facing=east]{front_text:{has_glowing_text:1b,messages:['{"text":"[ CỔNG TORII 3 ]","color":"aqua","bold":true}','{"text":"Thiên Đường Câu Cá","color":"dark_aqua"}','{"text":"Bước vào cổng","color":"yellow"}','{"text":"Sang world_cauca","color":"aqua","bold":true}']}}''')
    lines.append(r'''summon text_display 45.5 124.5 7.5 {text:'{"text":"🎣 BIỂN HỒ TRÊN MÂY CELESTIAL 🎣","color":"aqua","bold":true}',billboard:"vertical",transformation:{scale:[0.8f,0.8f,0.8f],translation:[0f,0f,0f],rotation:[0f,0f,0f,1f]},Tags:["portal_display"]}''')

    # --- CỔNG 4: TORII SIÊU THÁP PHONG LÔI (X=55, Z=11) ---
    lines.append("# Torii 4: Cổng Tháp Phong Lôi (world_parkour) tại X=55, Z=11")
    lines.append("fill 53 121 11 53 125 11 cherry_wood")
    lines.append("fill 57 121 11 57 125 11 cherry_wood")
    lines.append("fill 52 124 11 58 124 11 smooth_quartz_slab[type=bottom]")
    lines.append("fill 51 125 11 59 125 11 cherry_wood")
    lines.append("fill 50 126 11 60 126 11 deepslate_tile_stairs[facing=north,half=top]")
    lines.append("setblock 53 123 11 lantern[hanging=true]")
    lines.append("setblock 57 123 11 lantern[hanging=true]")
    lines.append("setblock 55 120 11 smooth_quartz")
    lines.append("setblock 55 121 11 light_weighted_pressure_plate")
    lines.append(r'''setblock 55 123 11 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:['{"text":"[ CỔNG TORII 4 ]","color":"yellow","bold":true}','{"text":"50 Tầng Thử Thách","color":"gold"}','{"text":"Bước vào cổng","color":"aqua"}','{"text":"Sang world_parkour","color":"yellow","bold":true}']}}''')
    lines.append(r'''summon text_display 55.5 124.5 11.5 {text:'{"text":"🏃 SIÊU THÁP THỬ THÁCH PHONG LÔI 🏃","color":"yellow","bold":true}',billboard:"vertical",transformation:{scale:[0.8f,0.8f,0.8f],translation:[0f,0f,0f],rotation:[0f,0f,0f,1f]},Tags:["portal_display"]}''')

    # --- CỔNG 5: TORII CUNG ĐIỆN HOÀNG GIA LAS VEGAS (X=66, Z=0) ---
    lines.append("# Torii 5: Cổng Hoàng Gia Las Vegas (world_casino) tại X=66, Z=0")
    lines.append("fill 66 121 -2 66 125 -2 cherry_wood")
    lines.append("fill 66 121 2 66 125 2 cherry_wood")
    lines.append("fill 66 124 -3 66 124 3 gold_block")
    lines.append("fill 66 125 -4 66 125 4 cherry_wood")
    lines.append("fill 66 126 -5 66 126 5 deepslate_tile_stairs[facing=west,half=top]")
    lines.append("setblock 66 127 0 beacon")
    lines.append("setblock 66 123 -2 soul_lantern[hanging=true]")
    lines.append("setblock 66 123 2 soul_lantern[hanging=true]")
    lines.append("setblock 66 120 0 gilded_blackstone")
    lines.append("setblock 66 121 0 heavy_weighted_pressure_plate")
    lines.append(r'''setblock 66 123 0 oak_wall_sign[facing=west]{front_text:{has_glowing_text:1b,messages:['{"text":"[ CỔNG TORII 5 ]","color":"gold","bold":true}','{"text":"Coinflip, Vé Số","color":"yellow"}','{"text":"Bước vào cổng","color":"aqua"}','{"text":"Sang world_casino","color":"gold","bold":true}']}}''')
    lines.append(r'''summon text_display 65.5 124.5 0.5 {text:'{"text":"🎰 CUNG ĐIỆN HOÀNG GIA LAS VEGAS 🎰","color":"gold","bold":true}',billboard:"vertical",transformation:{scale:[0.8f,0.8f,0.8f],translation:[0f,0f,0f],rotation:[0f,0f,0f,1f]},Tags:["portal_display"]}''')

    # 4. Bonsai Cổ Thụ Hoa Anh Đào & Đèn Đá Vườn Thiền
    lines.append("")
    lines.append("# 4. Bonsai Cổ Thụ Sakura & Đèn Đá Vườn Thiền")
    for bx, bz in [(63, -9), (63, 9)]:
        lines.append(f"fill {bx} 121 {bz} {bx} 124 {bz} cherry_log")
        lines.append(f"fill {bx-2} 124 {bz-2} {bx+2} 126 {bz+2} cherry_leaves")
        lines.append(f"fill {bx-1} 126 {bz-1} {bx+1} 127 {bz+1} flowering_azalea_leaves")
        lines.append(f"setblock {bx} 123 {bz+1} lantern[hanging=true]")

    lines.append("")
    lines.append("# 5. Bệ Phóng Launch Pad Về Trung Tâm (43, 120, 0)")
    lines.append("setblock 43 120 0 lodestone")
    lines.append("setblock 43 121 0 heavy_weighted_pressure_plate")
    lines.append("setblock 43 120 -1 sea_lantern")
    lines.append("setblock 43 120 1 sea_lantern")
    lines.append("setblock 42 120 0 sea_lantern")
    lines.append("setblock 44 120 0 sea_lantern")
    lines.append(r'''summon text_display 42.5 122.5 0.5 {text:'{"text":"◀ PHÓNG VỀ ĐẢO TRUNG TÂM ◀","color":"gold","bold":true}',billboard:"vertical",transformation:{scale:[0.8f,0.8f,0.8f],translation:[0f,0f,0f],rotation:[0f,0f,0f,1f]},Tags:["portal_display"]}''')

    path = os.path.join(BUILDER_DIR, "hub_east.mcfunction")
    with open(path, "w", encoding="utf-8") as f:
        f.write("\n".join(lines) + "\n")
    print(f"Generated {path}")

# ==============================================================================
# 5. WEST WING BUILD (Đại Chợ Thương Nhân & Sòng Bạc Casino)
# ==============================================================================
def gen_hub_west():
    lines = []
    lines.append("# Clear old West Wing space (X: -72..-38, Z: -18..18, Y: 96..145)")
    lines.append("fill -72 96 -18 -38 145 18 air")
    lines.append("")
    
    lines.append("# 1. Đảo Bay Cánh Tây (West Island Underbody: Center -55, 0, Max R=16)")
    lines.extend(build_organic_island(-55, 0, base_y=98, top_y=120, max_r=16))
    lines.append("")
    
    lines.append("# 2. Mặt Sàn Thương Cảng & Casino (Y=120)")
    lines.extend(generate_floating_island_slice(-55, 0, 120, 15, "polished_andesite"))
    lines.extend(generate_floating_island_slice(-55, 0, 120, 11, "stone_bricks"))
    lines.extend(generate_floating_island_slice(-55, 0, 120, 6, "smooth_quartz"))
    
    lines.append("")
    lines.append("# 3. Bốn Gian Hàng Quầy Chợ (The Grand Bazaar - Z=-14..-2)")
    # Quầy 1: Nông Sản & Hạt Giống (X=-58, Z=-10)
    lines.append("fill -60 120 -11 -56 120 -9 spruce_planks")
    lines.append("setblock -58 121 -10 barrel[facing=up]")
    lines.append("fill -60 124 -11 -56 124 -9 lime_wool")
    lines.append("setblock -58 123 -10 lantern[hanging=true]")
    lines.append(r'''setblock -58 122 -9 oak_wall_sign[facing=south]{front_text:{has_glowing_text:1b,messages:['{"text":"[ QUẦY NÔNG SẢN ]","color":"green","bold":true}','{"text":"Lúa, Cà rốt, Khoai","color":"dark_green"}','{"text":"Mua bán nông sản","color":"yellow"}','{"text":"Đổi lấy Ngọc!","color":"green"}']}}''')
    
    # Quầy 2: Khoáng Sản & Luyện Kim (X=-52, Z=-10)
    lines.append("fill -54 120 -11 -50 120 -9 polished_deepslate")
    lines.append("setblock -52 121 -10 anvil[facing=north]")
    lines.append("fill -54 124 -11 -50 124 -9 orange_wool")
    lines.append("setblock -52 123 -10 lantern[hanging=true]")
    lines.append(r'''setblock -52 122 -9 oak_wall_sign[facing=south]{front_text:{has_glowing_text:1b,messages:['{"text":"[ QUẦY KHOÁNG SẢN ]","color":"gold","bold":true}','{"text":"Sắt, Vàng, Kim Cương","color":"yellow"}','{"text":"Thu mua quặng thô","color":"aqua"}','{"text":"Đổi lấy Ngọc!","color":"green"}']}}''')

    # Quầy 3: Cây Trồng & Lâm Sản (X=-58, Z=-4)
    lines.append("fill -60 120 -5 -56 120 -3 oak_planks")
    lines.append("setblock -58 121 -4 cherry_log")
    lines.append("fill -60 124 -5 -56 124 -3 pink_wool")
    lines.append("setblock -58 123 -4 lantern[hanging=true]")
    lines.append(r'''setblock -58 122 -3 oak_wall_sign[facing=south]{front_text:{has_glowing_text:1b,messages:['{"text":"[ CÂY TRỒNG & GỖ ]","color":"light_purple","bold":true}','{"text":"Mầm cây, Gỗ, Yên ngựa","color":"green"}','{"text":"Dây dắt, Trứng gà","color":"yellow"}','{"text":"Đổi lấy Ngọc!","color":"green"}']}}''')

    # Quầy 4: Pháp Sư & Phù Phép (X=-52, Z=-4)
    lines.append("fill -54 120 -5 -50 120 -3 deepslate_tiles")
    lines.append("setblock -52 121 -4 enchanting_table")
    lines.append("fill -54 124 -5 -50 124 -3 purple_wool")
    lines.append("setblock -52 123 -4 lantern[hanging=true]")
    lines.append(r'''setblock -52 122 -3 oak_wall_sign[facing=south]{front_text:{has_glowing_text:1b,messages:['{"text":"[ PHÁP SƯ PHÙ PHÉP ]","color":"dark_purple","bold":true}','{"text":"Bàn Phù Phép, Bình Thuốc","color":"light_purple"}','{"text":"Lọ EXP, Sách Phép","color":"yellow"}','{"text":"Đổi lấy Ngọc!","color":"green"}']}}''')

    lines.append("")
    lines.append("# 4. Cung Điện Sòng Bạc Thần Tài Hoàng Kim (Fortune Casino - Z=4..14)")
    lines.append("fill -61 120 3 -49 120 14 gilded_blackstone")
    lines.append("fill -60 121 4 -50 121 13 red_carpet")
    
    for kx, kz in [(-60, 4), (-50, 4), (-60, 13), (-50, 13)]:
        lines.append(f"fill {kx} 121 {kz} {kx} 125 {kz} gold_block")
        lines.append(f"setblock {kx} 126 {kz} shroomlight")
    lines.append("fill -59 126 5 -51 126 12 yellow_stained_glass")
    lines.append("fill -57 127 7 -53 127 10 beacon")
    
    # Bàn Coinflip (X=-55, Z=6)
    lines.append("setblock -55 121 6 gold_block")
    lines.append("setblock -55 122 6 heavy_weighted_pressure_plate")
    lines.append(r'''summon armor_stand -55 123 6 {Tags:["casino_hologram"],Invisible:1b,Marker:1b,NoGravity:1b,CustomNameVisible:1b,CustomName:'{"text":"🪙 TUNG ĐỒNG XU COINFLIP (/cf) 🪙","color":"gold","bold":true}'}''')
    lines.append(r'''summon interaction -55 121 6 {Tags:["casino_interact","cf_interact"],width:1.2f,height:1.2f,response:1b}''')

    # Bàn Xổ Số Jackpot (X=-55, Z=10)
    lines.append("setblock -55 121 10 emerald_block")
    lines.append("setblock -55 122 10 heavy_weighted_pressure_plate")
    lines.append(r'''summon armor_stand -55 123 10 {Tags:["casino_hologram"],Invisible:1b,Marker:1b,NoGravity:1b,CustomNameVisible:1b,CustomName:'{"text":"🎰 VÉ SỐ JACKPOT THẦN TÀI (/xoso) 🎰","color":"green","bold":true}'}''')
    lines.append(r'''summon interaction -55 121 10 {Tags:["casino_interact","lottery_interact"],width:1.2f,height:1.2f,response:1b}''')

    lines.append("")
    lines.append("# 5. Bệ Phóng Launch Pad Về Trung Tâm (-43, 120, 0)")
    lines.append("setblock -43 120 0 lodestone")
    lines.append("setblock -43 121 0 heavy_weighted_pressure_plate")
    lines.append("setblock -43 120 -1 sea_lantern")
    lines.append("setblock -43 120 1 sea_lantern")
    lines.append("setblock -42 120 0 sea_lantern")
    lines.append("setblock -44 120 0 sea_lantern")
    lines.append(r'''summon text_display -42.5 122.5 0.5 {text:'{"text":"▶ PHÓNG VỀ ĐẢO TRUNG TÂM ▶","color":"gold","bold":true}',billboard:"vertical",transformation:{scale:[0.8f,0.8f,0.8f],translation:[0f,0f,0f],rotation:[0f,0f,0f,1f]},Tags:["casino_display"]}''')

    path = os.path.join(BUILDER_DIR, "hub_west.mcfunction")
    with open(path, "w", encoding="utf-8") as f:
        f.write("\n".join(lines) + "\n")
    print(f"Generated {path}")

# ==============================================================================
# 6. LAUNCH PAD FUNCTIONS (skyblock:launch/...)
# ==============================================================================
def gen_launch_functions():
    pads = {
        "to_north": {
            "dest": "0.5 122.0 -48.0 0.0 0.0",
            "name": "THÁNH ĐIỆN RÈN CỔ ĐẠI 15 TIERS",
            "color": "red"
        },
        "to_south": {
            "dest": "0.5 122.0 48.0 180.0 0.0",
            "name": "QUẢNG TRƯỜNG RƯƠNG BÁU & BXH",
            "color": "yellow"
        },
        "to_east": {
            "dest": "48.0 122.0 0.5 90.0 0.0",
            "name": "ĐẠI CỔNG VÒM COSMIC STARGATE",
            "color": "light_purple"
        },
        "to_west": {
            "dest": "-48.0 122.0 0.5 -90.0 0.0",
            "name": "ĐẠI CHỢ THƯƠNG NHÂN & CASINO",
            "color": "green"
        },
        "to_center": {
            "dest": "0.5 122.0 0.5 0.0 0.0",
            "name": "ĐẢO TRUNG TÂM SPAWN HUB",
            "color": "gold"
        }
    }
    
    for name, data in pads.items():
        lines = [
            f"# Launch Pad function: {name}",
            "execute at @s run playsound minecraft:entity.wind_charge.wind_burst player @s ~ ~ ~ 2.0 1.2",
            "execute at @s run playsound minecraft:entity.firework_rocket.launch player @s ~ ~ ~ 1.5 1.0",
            "execute at @s run particle gust_emitter_large ~ ~ ~ 0 0 0 0 1 normal",
            "execute at @s run particle cloud ~ ~ ~ 0.5 0.5 0.5 0.1 30 normal",
            f'''execute at @s run title @s actionbar {{"text":"⚡ ĐANG PHÓNG ĐẾN {data["name"]}... ⚡","color":"{data["color"]}","bold":true}}''',
            "effect give @s slow_falling 3 0 true",
            f"tp @s {data['dest']}",
            "execute at @s run playsound minecraft:block.amethyst_block.hit player @s ~ ~ ~ 1.5 1.5",
            "execute at @s run particle portal ~ ~1 ~ 0.5 0.5 0.5 0.1 50 normal"
        ]
        path = os.path.join(LAUNCH_DIR, f"{name}.mcfunction")
        with open(path, "w", encoding="utf-8") as f:
            f.write("\n".join(lines) + "\n")
        print(f"Generated {path}")

# ==============================================================================
# 7. WARP MENU FUNCTION (skyblock:warp_menu)
# ==============================================================================
def gen_warp_menu():
    lines = [
        "# Skyblock Grand Warp Menu",
        "execute at @s run playsound minecraft:item.book.page_turn player @s ~ ~ ~ 1.0 1.2",
        r'''tellraw @s [{"text":"\n╔═══════════════════════════════════════════════════════╗\n","color":"gold","bold":true},{"text":"║       🌀 CỔNG DỊCH CHUYỂN KHÔNG GIAN (/WARP) 🌀       ║\n","color":"yellow","bold":true},{"text":"╚═══════════════════════════════════════════════════════╝\n","color":"gold","bold":true},{"text":"Bấm vào địa danh bất kỳ để dịch chuyển tức thời:\n\n","color":"gray"},{"text":" 1. ","color":"white"},{"text":"[🏛️ ĐẢO TRUNG TÂM SPAWN]","color":"gold","bold":true,"clickEvent":{"action":"run_command","value":"/warp spawn"},"hoverEvent":{"action":"show_text","contents":[{"text":"Click để về Spawn Hub chính\n• Đài Ánh Sáng Starlight Nexus\n• NPC Hướng Dẫn Viên Tân Thủ\n• Đi bộ ra 4 Cánh hoặc dẫm đệm phóng","color":"yellow"}]}},{"text":"  ","color":"gray"},{"text":" 2. ","color":"white"},{"text":"[⚡ THÁNH ĐIỆN RÈN 15 TIERS]","color":"red","bold":true,"clickEvent":{"action":"run_command","value":"/warp trade"},"hoverEvent":{"action":"show_text","contents":[{"text":"Click đến Cánh Bắc Lò Rèn\n• 3 Thần Rèn Cúp, Rìu, Kiếm, Giáp\n• Đại Sư Luyện Kim Cổ Đại\n• Tiến hóa vũ khí từ Tier 1 -> 15","color":"red"}]}},{"text":"\n\n","color":"gray"},{"text":" 3. ","color":"white"},{"text":"[🎁 RƯƠNG BÁU & BẢNG VÀNG]","color":"yellow","bold":true,"clickEvent":{"action":"run_command","value":"/warp crates"},"hoverEvent":{"action":"show_text","contents":[{"text":"Click đến Cánh Nam Crates\n• 3 Hòm Đồng, Hoàng Kim, Thần Thoại\n• Đại Lộ Vinh Danh Top Đảo, Kỹ Năng, Phú Hào\n• Nhận quà may mắn cực đã","color":"yellow"}]}},{"text":"  ","color":"gray"},{"text":" 4. ","color":"white"},{"text":"[🌀 ĐẠI CỔNG STARGATE]","color":"light_purple","bold":true,"clickEvent":{"action":"run_command","value":"/warp portal"},"hoverEvent":{"action":"show_text","contents":[{"text":"Click đến Cánh Đông Stargate\n• Cổng Vòm Cosmic Stargate vĩ đại\n• 5 Bệ Teleport dẫn vào các cõi\n• Đi Boss, Farm, PvP, Câu Cá","color":"light_purple"}]}},{"text":"\n\n","color":"gray"},{"text":" 5. ","color":"white"},{"text":"[🛒 ĐẠI CHỢ THƯƠNG NHÂN]","color":"green","bold":true,"clickEvent":{"action":"run_command","value":"/warp shop"},"hoverEvent":{"action":"show_text","contents":[{"text":"Click đến Cánh Tây Chợ Trời\n• 4 Quầy Nông Sản, Khoáng Sản, Cây Trồng, Pháp Sư\n• Mua bán trao đổi nguyên liệu lấy Ngọc Lục Bảo\n• Giao thương sầm uất","color":"green"}]}},{"text":"  ","color":"gray"},{"text":" 6. ","color":"white"},{"text":"[🎰 SÒNG BẠC THẦN TÀI]","color":"gold","bold":true,"clickEvent":{"action":"run_command","value":"/warp casino"},"hoverEvent":{"action":"show_text","contents":[{"text":"Click đến Sòng Bạc Hoàng Gia\n• Bàn cờ Tung Đồng Xu Coinflip (/cf)\n• Vé Số Jackpot Thần Tài (/xoso)\n• Thử vận may trúng tiền triệu","color":"gold"}]}},{"text":"\n\n","color":"gray"},{"text":" 7. ","color":"white"},{"text":"[👹 ĐẤU TRƯỜNG 4 BOSS]","color":"dark_red","bold":true,"clickEvent":{"action":"run_command","value":"/warp boss"},"hoverEvent":{"action":"show_text","contents":[{"text":"Click đến Đấu Trường Boss\n• Nhện Độc, Quái Vật Lửa, Quỷ Vương, Chúa Tể Hư Không\n• Rơi Trái Tim Quỷ đột phá Tier 10\n• Yêu cầu tổ đội cùng săn boss","color":"dark_red"}]}},{"text":"  ","color":"gray"},{"text":" 8. ","color":"white"},{"text":"[⚔ ĐẤU TRƯỜNG PVP]","color":"dark_aqua","bold":true,"clickEvent":{"action":"run_command","value":"/warp pvp"},"hoverEvent":{"action":"show_text","contents":[{"text":"Click đến Đấu Trường Sinh Tử\n• Nơi so tài kiếm thuật đỉnh cao\n• Hạ gục đối thủ nhận tiền thưởng /pvp\n• Bảo vệ danh dự chiến binh","color":"aqua"}]}},{"text":"\n\n","color":"gray"},{"text":" 9. ","color":"white"},{"text":"[🌾 FARM QUÁI & NÔNG TRẠI]","color":"dark_green","bold":true,"clickEvent":{"action":"run_command","value":"/warp farm"},"hoverEvent":{"action":"show_text","contents":[{"text":"Click đến Khu Farm Quái Công Cộng\n• 10 Lồng Spawner Skeleton, Zombie, Nhện\n• Cày cấp EXP & nguyên liệu chế tạo\n• Tích lũy tài nguyên ban đầu","color":"green"}]}},{"text":"  ","color":"gray"},{"text":"10. ","color":"white"},{"text":"[🎣 HỒ CÂU CÁ LÃO NGƯ]","color":"aqua","bold":true,"clickEvent":{"action":"run_command","value":"/warp cauca"},"hoverEvent":{"action":"show_text","contents":[{"text":"Click đến Đầm Lầy Câu Cá Thư Giãn\n• Thả câu nhận cá quý và kho báu chìm\n• Đổi cá lấy xu với Lão Ngư Phủ\n• Mở khóa danh hiệu [Lão Ngư]","color":"aqua"}]}},{"text":"\n\n","color":"gray"},{"text":"11. ","color":"white"},{"text":"[🏃 THÁP PARKOUR THỬ THÁCH]","color":"yellow","bold":true,"clickEvent":{"action":"run_command","value":"/warp parkour"},"hoverEvent":{"action":"show_text","contents":[{"text":"Click đến Tháp Parkour Mây Trời\n• Vượt chướng ngại vật lên đỉnh tháp\n• Nhận quà thưởng mỗi ngày\n• Rèn luyện kỹ năng nhảy nhót","color":"yellow"}]}},{"text":"  ","color":"gray"},{"text":"12. ","color":"white"},{"text":"[🏝 TRỞ VỀ ĐẢO CỦA BẠN]","color":"green","bold":true,"clickEvent":{"action":"run_command","value":"/is"},"hoverEvent":{"action":"show_text","contents":[{"text":"Click để trở về Đảo Sinh Tồn chính\n• Xây dựng vương quốc trên không của riêng bạn!","color":"green"}]}},{"text":"\n","color":"gray"},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"}]'''
    ]
    path = os.path.join(BASE_DIR, "warp_menu.mcfunction")
    with open(path, "w", encoding="utf-8") as f:
        f.write("\n".join(lines) + "\n")
    print(f"Generated {path}")

# ==============================================================================
# 8. MASTER BUILD FUNCTION (build_spawn.mcfunction)
# ==============================================================================
def gen_master_build_spawn():
    lines = [
        "# Master Skyblock Spawn Architecture Build",
        r'''tellraw @a [{"text":"[Skyblock] ","color":"gold","bold":true},{"text":"Đang tái tạo Siêu Quần Đảo Spawn Hub (Hybrid Fantasy Citadel)...","color":"yellow"}]''',
        "",
        "# 1. Xây Đảo Trung Tâm",
        "function skyblock:builder/hub_core",
        "",
        "# 2. Xây Cánh Bắc: Thánh Điện Rèn 15 Tiers",
        "function skyblock:builder/hub_north",
        "",
        "# 3. Xây Cánh Nam: Rương Báu & BXH",
        "function skyblock:builder/hub_south",
        "",
        "# 4. Xây Cánh Đông: Đại Cổng Stargate",
        "function skyblock:builder/hub_east",
        "",
        "# 5. Xây Cánh Tây: Đại Chợ & Casino",
        "function skyblock:builder/hub_west",
        "",
        "# 6. Triệu hồi NPC & Thương Nhân đúng tọa độ mới",
        "function skyblock:build_trade",
        "function skyblock:build_evolution_npc",
        "function skyblock:build_crates",
        "function skyblock:build_casino",
        "",
        "setworldspawn 0 122 0",
        r'''tellraw @a [{"text":"[Skyblock] ","color":"gold","bold":true},{"text":"Siêu Quần Đảo Spawn Hub Mới đã hoàn thành lộng lẫy và sẵn sàng!","color":"green","bold":true}]'''
    ]
    path = os.path.join(BASE_DIR, "build_spawn.mcfunction")
    with open(path, "w", encoding="utf-8") as f:
        f.write("\n".join(lines) + "\n")
    print(f"Generated {path}")

if __name__ == "__main__":
    gen_hub_core()
    gen_hub_north()
    gen_hub_south()
    gen_hub_east()
    gen_hub_west()
    gen_launch_functions()
    gen_warp_menu()
    gen_master_build_spawn()
    print("ALL ARCHITECTURAL COMPONENTS GENERATED SUCCESSFULLY!")
