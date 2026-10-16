# -*- coding: utf-8 -*-
"""
Masterpiece Voxel Architecture Batch Generator for 6 Multi-Worlds (1000x1000 Scale)
Paper 1.21.4 Skyblock MMORPG

Worlds Generated:
1. world: Spawn Hub (Thánh Điện Cổ Thần Trung Tâm, Cây Yggdrasil, 4 Đại Cánh, 16 Đảo Vệ Tinh, Vòng Hào Quang R=490)
2. world_boss: Vực Thẳm Đấu Trường Boss Cổ Đại (Sảnh Chỉ Huy & 6 Đại Đấu Trường Xương, Lửa, Hắc Ám, Hư Không, Sculk, Thiên Cung)
3. world_farm: Vườn Thượng Uyển Sakura & Hầm Ngục Quái Công Cộng (Đình 2 Tầng, 5 Tầng Spawner, Ruộng Bậc Thang, Vườn Sakura)
4. world_cauca: Biển Hồ Trên Mây (Celestial Oasis, Cầu Nguyệt Cung, 8 Đảo Hoa Sen, Bến Cảng Ngư Ông, Thủy Cung San Hô)
5. world_parkour: Siêu Tháp Thử Thách Phong Lôi (Tower of Trials 50 Tầng Y=70..230, Slime, Breeze, 5 Checkpoints)
6. world_casino: Cung Điện Hoàng Gia Las Vegas (Sảnh Coinflip, Bàn Cờ Tỷ Phú 40x40, Mega 6/45, Sảnh Đấu Giá)
"""

import os
import math
import sys

sys.stdout.reconfigure(encoding='utf-8')

BASE_DIR = os.path.join(
    os.path.dirname(__file__),
    'world', 'datapacks', 'skyblock_spawn', 'data', 'skyblock', 'function'
)
BUILDER_DIR = os.path.join(BASE_DIR, 'builder')
os.makedirs(BUILDER_DIR, exist_ok=True)

def gen_cylinder_slices(cx, cz, y_min, y_max, r, block, inner_r=None):
    lines = []
    r_ceil = int(math.ceil(r))
    for y in range(y_min, y_max + 1):
        for dz in range(-r_ceil, r_ceil + 1):
            z = cz + dz
            dsq = dz * dz
            if dsq > r * r:
                continue
            max_dx = int(math.floor(math.sqrt(r * r - dsq)))
            x_min = cx - max_dx
            x_max = cx + max_dx
            if inner_r and inner_r > 0 and dsq < inner_r * inner_r:
                inner_dx = int(math.floor(math.sqrt(inner_r * inner_r - dsq)))
                left_max = cx - inner_dx - 1
                right_min = cx + inner_dx + 1
                if x_min <= left_max:
                    lines.append(f"fill {x_min} {y} {z} {left_max} {y} {z} {block}")
                if right_min <= x_max:
                    lines.append(f"fill {right_min} {y} {z} {x_max} {y} {z} {block}")
                continue
            lines.append(f"fill {x_min} {y} {z} {x_max} {y} {z} {block}")
    return lines

# ==============================================================================
# 1. WORLD (SPAWN HUB 1000x1000)
# ==============================================================================
def generate_world_spawn_1000():
    cmds = []
    cmds.append("# ==============================================================================")
    cmds.append("# THẾ GIỚI 1: SPAWN HUB - THÁNH ĐIỆN CỔ THẦN TRUNG TÂM (1000x1000)")
    cmds.append("# ==============================================================================")
    cmds.append("tellraw @a [{\"text\":\"[Kiến Trúc Sư] \",\"color\":\"gold\",\"bold\":true},{\"text\":\"Đang khởi tạo Siêu Thánh Điện Cổ Thần 1000x1000 tại world (Spawn Hub)...\",\"color\":\"aqua\"}]")

    # Call core hub modules
    cmds.append("function skyblock:builder/hub_core")
    cmds.append("function skyblock:builder/hub_north")
    cmds.append("function skyblock:builder/hub_south")
    cmds.append("function skyblock:builder/hub_east")
    cmds.append("function skyblock:builder/hub_west")

    # 1. CỔ THỤ THẦN THOẠI YGGDRASIL (Tại Tâm 0, 120, 0)
    cmds.append("# 1. Thân Cây Cổ Thụ Yggdrasil (Y=121..165)")
    cmds.append("fill -3 121 -3 3 145 3 cherry_log")
    cmds.append("fill -2 145 -2 2 165 2 cherry_log")
    # Rễ cổ thụ tỏa ra 4 hướng
    cmds.append("fill -7 121 -2 -4 123 2 cherry_wood")
    cmds.append("fill 4 121 -2 7 123 2 cherry_wood")
    cmds.append("fill -2 121 -7 2 123 -4 cherry_wood")
    cmds.append("fill -2 121 4 2 123 7 cherry_wood")
    # Tán lá vĩ đại ngưng tụ linh khí & hoa quả phát sáng (Y=155..175, R=25)
    cmds.extend(gen_cylinder_slices(0, 0, 155, 168, 22, "cherry_leaves"))
    cmds.extend(gen_cylinder_slices(0, 0, 169, 175, 15, "flowering_azalea_leaves"))
    cmds.append("fill -15 156 -15 15 160 15 shroomlight replace cherry_leaves")
    cmds.append("fill -10 162 -10 10 166 10 ochre_froglight replace cherry_leaves")

    # 2. 16 ĐẢO VỆ TINH TRÊN KHÔNG (R=200..450, 16 Hướng Tọa Độ)
    cmds.append("# 2. 16 Đảo Vệ Tinh Phù Không (R=200..450)")
    for i, angle in enumerate(range(0, 360, int(360/16))):
        rad = math.radians(angle)
        dist = 220 if i % 2 == 0 else 380
        ix = int(round(dist * math.cos(rad)))
        iz = int(round(dist * math.sin(rad)))
        iy = 115 + (i % 4) * 5
        
        # Đáy đảo tháp nhọn
        cmds.append(f"fill {ix-1} {iy-8} {iz-1} {ix+1} {iy-6} {iz+1} crying_obsidian")
        cmds.append(f"fill {ix-3} {iy-5} {iz-3} {ix+3} {iy-3} {iz+3} cobbled_deepslate")
        cmds.append(f"fill {ix-6} {iy-2} {iz-6} {ix+6} {iy} {iz+6} smooth_quartz")
        cmds.append(f"fill {ix-4} {iy+1} {iz-4} {ix+4} {iy+1} {iz+4} grass_block")
        cmds.append(f"setblock {ix} {iy+1} {iz} beacon")
        cmds.append(f"setblock {ix} {iy+2} {iz} sea_lantern")

    # 3. VÒNG HÀO QUANG THẦN GIỚI CELESTIAL ORBIT RING (R=480..495 framing 1000x1000)
    cmds.append("# 3. Vòng Biên Giới Tinh Tú Bọc Vùng 1000x1000 (R=480..492, Y=130)")
    for deg in range(0, 360, 2):
        rad = math.radians(deg)
        rx = int(round(485 * math.cos(rad)))
        rz = int(round(485 * math.sin(rad)))
        cmds.append(f"setblock {rx} 130 {rz} sea_lantern")
        if deg % 10 == 0:
            cmds.append(f"setblock {rx} 131 {rz} amethyst_cluster[facing=up]")
            cmds.append(f"setblock {rx} 129 {rz} end_rod")

    cmds.append("tellraw @a [{\"text\":\"[Kiến Trúc Sư] \",\"color\":\"gold\",\"bold\":true},{\"text\":\"Siêu Thánh Điện 1000x1000 Spawn Hub đã hoàn thành mỹ mãn!\",\"color\":\"green\",\"bold\":true}]")
    return "\n".join(cmds)


# ==============================================================================
# 2. WORLD_BOSS (VỰC THẲM ĐẤU TRƯỜNG BOSS CỔ ĐẠI 1000x1000)
# ==============================================================================
def generate_world_boss_1000():
    cmds = []
    cmds.append("# ==============================================================================")
    cmds.append("# THẾ GIỚI 2: WORLD_BOSS - VỰC THẲM 6 ĐẠI ĐẤU TRƯỜNG BOSS (1000x1000)")
    cmds.append("# ==============================================================================")
    cmds.append("tellraw @a [{\"text\":\"[Kiến Trúc Sư] \",\"color\":\"dark_red\",\"bold\":true},{\"text\":\"Đang khởi tạo Vực Thẳm Đấu Trường Boss Cổ Đại (1000x1000)...\",\"color\":\"red\"}]")

    # 1. SẢNH CHỈ HUY TRUNG TÂM (0, 110, 0) - R=30
    cmds.append("# 1. Sảnh Chỉ Huy & Chuẩn Bị Chiến Đấu (Tâm 0, 110, 0)")
    cmds.append("fill -30 90 -30 30 140 30 air")
    cmds.extend(gen_cylinder_slices(0, 0, 95, 108, 25, "polished_blackstone_bricks"))
    cmds.extend(gen_cylinder_slices(0, 0, 109, 110, 28, "gilded_blackstone"))
    cmds.extend(gen_cylinder_slices(0, 0, 110, 110, 22, "smooth_quartz"))
    cmds.append("fill -5 110 -5 5 110 5 red_carpet")
    cmds.append("setblock 0 111 0 beacon")
    # Biển bảng chỉ dẫn 6 đại đấu trường
    cmds.append('setblock 0 112 3 oak_wall_sign[facing=south]{front_text:{has_glowing_text:1b,messages:[\'{"text":"[ VỰC THẲM BOSS ]","color":"dark_red","bold":true}\',\'{"text":"6 Đại Đấu Trường","color":"gold"}\',\'{"text":"Theo Cầu Xích Đến","color":"yellow"}\',\'{"text":"Từng Thánh Địa!","color":"red","bold":true}\']}}')
    # Bệ Dịch Chuyển Quay Về Spawn Hub (0, 110, -5)
    cmds.append('setblock 0 110 -5 command_block{Command:"function skyblock:portal/to_spawn"}')
    cmds.append("setblock 0 111 -5 heavy_weighted_pressure_plate")
    cmds.append('setblock 0 112 -6 oak_wall_sign[facing=south]{front_text:{has_glowing_text:1b,messages:[\'{"text":"[ QUAY VỀ SPAWN ]","color":"gold","bold":true}\',\'{"text":"Spawn Hub","color":"yellow"}\',\'{"text":"Dẫm lên bệ","color":"gray"}\',\'{"text":"để trở về!","color":"green","bold":true}\']}}')

    # 2. ĐẤU TRƯỜNG 1: HẦM MỘ XƯƠNG (BONE CATACOMBS) tại (-180, 100, -180) - Boss 1
    cmds.append("# 2. Đấu Trường 1: Hầm Mộ Xương (-180, 100, -180)")
    cmds.append("fill -220 85 -220 -140 135 -140 air")
    cmds.extend(gen_cylinder_slices(-180, -180, 90, 99, 35, "bone_block"))
    cmds.extend(gen_cylinder_slices(-180, -180, 100, 100, 36, "soul_sand"))
    cmds.append("fill -185 101 -185 -175 101 -175 wither_rose")
    # Bệ Triệu Hồi Boss 1
    cmds.append('setblock -180 100 -180 command_block{Command:"function skyblock:gate_boss_1"}')
    cmds.append("setblock -180 101 -180 stone_button[face=floor,facing=north]")

    # 3. ĐẤU TRƯỜNG 2: MIỆNG NÚI LỬA (VOLCANO CALDERA) tại (180, 100, -180) - Boss 2
    cmds.append("# 3. Đấu Trường 2: Miệng Núi Lửa (180, 100, -180)")
    cmds.append("fill 140 85 -220 220 135 -140 air")
    cmds.extend(gen_cylinder_slices(180, -180, 90, 99, 35, "basalt"))
    cmds.extend(gen_cylinder_slices(180, -180, 100, 100, 36, "magma_block"))
    cmds.append("fill 176 100 -184 184 100 -176 lava")
    # Bệ Triệu Hồi Boss 2
    cmds.append('setblock 180 100 -180 command_block{Command:"function skyblock:gate_boss_2"}')
    cmds.append("setblock 180 101 -180 stone_button[face=floor,facing=north]")

    # 4. ĐẤU TRƯỜNG 3: PHÁO ĐÀI HẮC ÁM (DARK BASTION) tại (-180, 100, 180) - Boss 3
    cmds.append("# 4. Đấu Trường 3: Pháo Đài Hắc Ám (-180, 100, 180)")
    cmds.append("fill -220 85 140 -140 135 220 air")
    cmds.extend(gen_cylinder_slices(-180, 180, 90, 99, 35, "polished_blackstone_bricks"))
    cmds.extend(gen_cylinder_slices(-180, 180, 100, 100, 36, "crying_obsidian"))
    # Bệ Triệu Hồi Boss 3
    cmds.append('setblock -180 100 180 command_block{Command:"function skyblock:gate_boss_3"}')
    cmds.append("setblock -180 101 180 stone_button[face=floor,facing=north]")

    # 5. ĐẤU TRƯỜNG 4: THUNG LŨNG HƯ KHÔNG (VOID CHASM) tại (180, 100, 180) - Boss 4
    cmds.append("# 5. Đấu Trường 4: Thung Lũng Hư Không (180, 100, 180)")
    cmds.append("fill 140 85 140 220 135 220 air")
    cmds.extend(gen_cylinder_slices(180, 180, 90, 99, 35, "end_stone_bricks"))
    cmds.extend(gen_cylinder_slices(180, 180, 100, 100, 36, "purpur_block"))
    # Bệ Triệu Hồi Boss 4
    cmds.append('setblock 180 100 180 command_block{Command:"function skyblock:gate_boss_4"}')
    cmds.append("setblock 180 101 180 stone_button[face=floor,facing=north]")

    # 6. ĐẤU TRƯỜNG 5: ĐỀN THẦN SCULK THÂM UYÊN tại (0, 75, -300) - Boss 5 (2500 HP)
    cmds.append("# 6. Đấu Trường 5: Đền Thần Sculk Thâm Uyên (0, 75, -300)")
    cmds.append("fill -45 60 -345 45 115 -255 air")
    cmds.extend(gen_cylinder_slices(0, -300, 68, 74, 40, "reinforced_deepslate"))
    cmds.extend(gen_cylinder_slices(0, -300, 75, 75, 42, "sculk"))
    cmds.append("fill -5 75 -305 5 75 -295 sculk_catalyst")
    # Bệ Triệu Hồi Boss 5
    cmds.append('setblock 0 75 -300 command_block{Command:"function skyblock:gate_boss_5"}')
    cmds.append("setblock 0 76 -300 stone_button[face=floor,facing=north]")
    # Bệ Quay Về Sảnh Chỉ Huy từ Boss 5
    cmds.append('setblock 0 75 -285 command_block{Command:"tp @p 0 111 0"}')
    cmds.append("setblock 0 76 -285 light_weighted_pressure_plate")
    cmds.append('setblock 0 77 -286 oak_wall_sign[facing=south]{front_text:{has_glowing_text:1b,messages:[\'{"text":"[ VỀ SẢNH BOSS ]","color":"dark_aqua","bold":true}\',\'{"text":"Sảnh Chỉ Huy","color":"aqua"}\',\'{"text":"Dẫm lên bệ","color":"gray"}\',\'{"text":"để quay lại","color":"yellow"}\']}}')

    # 7. ĐẤU TRƯỜNG 6: THIÊN CUNG SÁNG THẾ (CELESTIAL OLYMPUS) tại (0, 240, 0) - Boss 6 (5000 HP)
    cmds.append("# 7. Đấu Trường 6: Thiên Cung Sáng Thế (0, 240, 0) Đỉnh Cao Y=240")
    cmds.append("fill -50 220 -50 50 280 50 air")
    cmds.extend(gen_cylinder_slices(0, 0, 228, 239, 45, "smooth_quartz"))
    cmds.extend(gen_cylinder_slices(0, 0, 240, 240, 48, "gold_block"))
    cmds.extend(gen_cylinder_slices(0, 0, 241, 241, 35, "sea_lantern"))
    # 8 Cột Trụ Sáng Thế
    for deg in range(0, 360, 45):
        rad = math.radians(deg)
        px = int(round(38 * math.cos(rad)))
        pz = int(round(38 * math.sin(rad)))
        cmds.append(f"fill {px} 241 {pz} {px} 255 {pz} quartz_pillar")
        cmds.append(f"setblock {px} 256 {pz} beacon")
    # Bệ Triệu Hồi Boss 6
    cmds.append('setblock 0 241 0 command_block{Command:"function skyblock:gate_boss_6"}')
    cmds.append("setblock 0 242 0 stone_button[face=floor,facing=north]")
    # Bệ Quay Về Sảnh Chỉ Huy từ Boss 6
    cmds.append('setblock 0 241 -15 command_block{Command:"tp @p 0 111 0"}')
    cmds.append("setblock 0 242 -15 light_weighted_pressure_plate")
    cmds.append('setblock 0 243 -16 oak_wall_sign[facing=south]{front_text:{has_glowing_text:1b,messages:[\'{"text":"[ VỀ SẢNH BOSS ]","color":"gold","bold":true}\',\'{"text":"Sảnh Chỉ Huy","color":"yellow"}\',\'{"text":"Dẫm lên bệ","color":"gray"}\',\'{"text":"để hạ giới!","color":"aqua"}\']}}')

    # CẦU XÍCH NỐI KHỔNG LỒ (Parabolic Energy Chains nối từ Sảnh về các Đấu trường)
    cmds.append("# 8. Cầu Năng Lượng & Xích Khổng Lồ Nối 6 Đấu Trường")
    cmds.append("fill 0 110 25 0 110 140 chain[axis=z]")
    cmds.append("fill 0 110 -25 0 110 -260 chain[axis=z]")
    cmds.append("fill -25 110 0 -140 110 0 chain[axis=x]")
    cmds.append("fill 25 110 0 140 110 0 chain[axis=x]")
    # Cột truyền tống lên Thiên Cung Y=240
    cmds.append('setblock 0 110 -15 command_block{Command:"tp @p 0 242 0"}')
    cmds.append("setblock 0 111 -15 light_weighted_pressure_plate")
    cmds.append('setblock 0 112 -16 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:[\'{"text":"[ LÊN THIÊN CUNG ]","color":"gold","bold":true}\',\'{"text":"Đấu Trường Boss 6","color":"yellow"}\',\'{"text":"Hoàng Đế Tinh Tú","color":"light_purple"}\',\'{"text":"Đỉnh Cao Y=240","color":"aqua"}\']}}')

    cmds.append("tellraw @a [{\"text\":\"[Kiến Trúc Sư] \",\"color\":\"gold\",\"bold\":true},{\"text\":\"Vực Thẳm 6 Đại Đấu Trường Boss Cổ Đại (1000x1000) đã thức tỉnh hoàn tất!\",\"color\":\"green\",\"bold\":true}]")
    return "\n".join(cmds)


# ==============================================================================
# 3. WORLD_FARM (VƯỜN THƯỢNG UYỂN SAKURA & HẦM NGỤC QUÁI 1000x1000)
# ==============================================================================
def generate_world_farm_1000():
    cmds = []
    cmds.append("# ==============================================================================")
    cmds.append("# THẾ GIỚI 3: WORLD_FARM - VƯỜN THƯỢNG UYỂN & HẦM NGỤC QUÁI (1000x1000)")
    cmds.append("# ==============================================================================")
    cmds.append("tellraw @a [{\"text\":\"[Kiến Trúc Sư] \",\"color\":\"light_purple\",\"bold\":true},{\"text\":\"Đang kiến tạo Vườn Thượng Uyển Sakura & Hầm Ngục Quái 1000x1000...\",\"color\":\"yellow\"}]")

    # 1. ĐÌNH THƯỢNG UYỂN & QUẢNG TRƯỜNG CHERRY TRUNG TÂM (0, 110, 0)
    cmds.append("# 1. Quảng Trường Thượng Uyển Cung Đình (0, 110, 0)")
    cmds.append("fill -35 85 -35 35 145 35 air")
    cmds.extend(gen_cylinder_slices(0, 0, 92, 108, 30, "tuff"))
    cmds.extend(gen_cylinder_slices(0, 0, 109, 110, 32, "moss_block"))
    cmds.extend(gen_cylinder_slices(0, 0, 110, 110, 20, "cherry_planks"))
    # Cổng Torii Khổng Lồ Nghênh Khách
    cmds.append("fill -6 111 0 -6 120 0 cherry_wood")
    cmds.append("fill 6 111 0 6 120 0 cherry_wood")
    cmds.append("fill -8 118 0 8 118 0 cherry_slab[type=top]")
    cmds.append("fill -10 120 0 10 120 0 cherry_wood")
    # Bệ Dịch Chuyển Quay Về Spawn Hub (0, 110, -5)
    cmds.append('setblock 0 110 -5 command_block{Command:"function skyblock:portal/to_spawn"}')
    cmds.append("setblock 0 111 -5 heavy_weighted_pressure_plate")
    cmds.append('setblock 0 112 -6 oak_wall_sign[facing=south]{front_text:{has_glowing_text:1b,messages:[\'{"text":"[ QUAY VỀ SPAWN ]","color":"gold","bold":true}\',\'{"text":"Spawn Hub","color":"yellow"}\',\'{"text":"Dẫm lên bệ","color":"gray"}\',\'{"text":"để trở về!","color":"green","bold":true}\']}}')

    # 2. HẦM NGỤC QUÁI CÔNG CỘNG 5 TẦNG (PUBLIC MOB DUNGEON) tại (150, 90, 0)
    cmds.append("# 2. Hầm Ngục Quái Công Cộng 5 Tầng (150, 90, 0)")
    cmds.append("fill 115 80 -35 185 140 35 air")
    cmds.append("fill 120 85 -30 180 135 30 stone_bricks hollow")
    for fl in range(5):
        fy = 90 + fl * 8
        cmds.append(f"fill 121 {fy} -29 179 {fy} 29 smooth_stone")
        cmds.append(f"fill 145 {fy+1} -5 155 {fy+1} 5 water")
        # Đặt lồng spawner các loại quái
        mob_type = ["zombie", "skeleton", "spider", "creeper", "blaze"][fl]
        cmds.append(f'setblock 150 {fy+2} 0 spawner{{SpawnData:{{entity:{{id:"minecraft:{mob_type}"}}}}}}')

    # NPC Người Canh Hầm Ngục (Dungeon Guard NPC) tại (150, 126, -32)
    cmds.append('kill @e[type=villager,tag=dungeon_guard_npc]')
    cmds.append('summon villager 150 126 -32 {Tags:["dungeon_guard_npc"],CustomName:\'{"text":"🛡️ Người Canh Hầm Ngục 🛡️","color":"dark_purple","bold":true}\',CustomNameVisible:1b,NoAI:1b,Invulnerable:1b,PersistenceRequired:1b,VillagerData:{profession:weaponsmith,type:taiga,level:5},Offers:{Recipes:[{maxUses:999999,buy:{id:"minecraft:rotten_flesh",count:32},buyB:{id:"minecraft:bone",count:32},sell:{id:"minecraft:echo_shard",count:1,components:{"minecraft:custom_data":{ancient_mat:"soul_fragment"},"minecraft:item_name":\'{"text":"👻 Mảnh Linh Hồn 👻","color":"light_purple","bold":true}\',"minecraft:lore":[\'{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"}\',\'{"text":"Tàn dư linh hồn thu thập từ quái vật tầng sâu hầm ngục.","color":"gray","italic":true}\',\'{"text":"⚡ Dùng để rèn vũ khí hút máu & Bùa Boss 6","color":"yellow"}\',\'{"text":"[Nguồn]: Hầm Ngục Quái world_farm","color":"green","bold":true}\',\'{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"}\']}}},{maxUses:999999,buy:{id:"minecraft:blaze_rod",count:16},buyB:{id:"minecraft:spider_eye",count:16},sell:{id:"minecraft:echo_shard",count:1,components:{"minecraft:custom_data":{ancient_mat:"soul_fragment"},"minecraft:item_name":\'{"text":"👻 Mảnh Linh Hồn 👻","color":"light_purple","bold":true}\',"minecraft:lore":[\'{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"}\',\'{"text":"Tàn dư linh hồn thu thập từ quái vật tầng sâu hầm ngục.","color":"gray","italic":true}\',\'{"text":"⚡ Dùng để rèn vũ khí hút máu & Bùa Boss 6","color":"yellow"}\',\'{"text":"[Nguồn]: Hầm Ngục Quái world_farm","color":"green","bold":true}\',\'{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"}\']}}}]}}')

    # 3. CÁNH ĐỒNG NÔNG NGHIỆP HOÀNG GIA (ROYAL TERRACES) tại (-150, 110, 0)
    cmds.append("# 3. Cánh Đồng Nông Nghiệp Hoàng Gia (-150, 110, 0)")
    cmds.append("fill -190 90 -40 -110 135 40 air")
    cmds.extend(gen_cylinder_slices(-150, 0, 95, 109, 38, "dirt"))
    cmds.extend(gen_cylinder_slices(-150, 0, 110, 110, 40, "farmland[moisture=7]"))
    cmds.append("fill -180 111 -30 -120 111 -10 wheat[age=7]")
    cmds.append("fill -180 111 -5 -120 111 10 carrots[age=7]")
    cmds.append("fill -180 111 15 -120 111 30 potatoes[age=7]")
    cmds.append("fill -150 110 -35 -150 110 35 water")

    # 4. QUẦN THỂ ĐẢO HOA ANH ĐÀO BAY (SAKURA BLOSSOM ARCHIPELAGO) (Z=180 & Z=-180)
    cmds.append("# 4. Quần Thể Đảo Hoa Anh Đào Bay")
    for z_off in [180, -180]:
        cmds.extend(gen_cylinder_slices(0, z_off, 95, 108, 25, "dirt"))
        cmds.extend(gen_cylinder_slices(0, z_off, 109, 110, 28, "moss_block"))
        cmds.append(f"fill -2 111 {z_off-2} 2 118 {z_off+2} cherry_log")
        cmds.extend(gen_cylinder_slices(0, z_off, 118, 125, 14, "cherry_leaves"))
        cmds.append(f"fill -10 111 {z_off-10} 10 111 {z_off+10} pink_petals[flower_amount=4] replace air")

    cmds.append("tellraw @a [{\"text\":\"[Kiến Trúc Sư] \",\"color\":\"gold\",\"bold\":true},{\"text\":\"Vườn Thượng Uyển & Hầm Ngục Quái 1000x1000 đã hoàn tất!\",\"color\":\"green\",\"bold\":true}]")
    return "\n".join(cmds)


# ==============================================================================
# 4. WORLD_CAUCA (BIỂN HỒ TRÊN MÂY - CELESTIAL OASIS 1000x1000)
# ==============================================================================
def generate_world_cauca_1000():
    cmds = []
    cmds.append("# ==============================================================================")
    cmds.append("# THẾ GIỚI 4: WORLD_CAUCA - BIỂN HỒ TRÊN MÂY (CELESTIAL OASIS 1000x1000)")
    cmds.append("# ==============================================================================")
    cmds.append("tellraw @a [{\"text\":\"[Kiến Trúc Sư] \",\"color\":\"aqua\",\"bold\":true},{\"text\":\"Đang kiến tạo Biển Hồ Trên Mây (Celestial Oasis 1000x1000)...\",\"color\":\"yellow\"}]")

    # 1. BIỂN HỒ PHA LÊ TRUNG TÂM (0, 100, 0) - R=45
    cmds.append("# 1. Đáy Đảo San Hô & Hồ Nước Pha Lê (0, 90..101, 0)")
    cmds.append("fill -50 70 -50 50 130 50 air")
    cmds.extend(gen_cylinder_slices(0, 0, 80, 94, 42, "prismarine"))
    cmds.extend(gen_cylinder_slices(0, 0, 95, 96, 44, "sea_lantern"))
    cmds.extend(gen_cylinder_slices(0, 0, 97, 100, 40, "water"))
    cmds.extend(gen_cylinder_slices(0, 0, 101, 101, 46, "smooth_quartz", inner_r=41))

    # CẦU NGUYỆT CUNG (CRESCENT MOON BRIDGE) bắc qua đầm nước
    cmds.append("# Cầu Nguyệt Cung bắc qua đầm nước")
    cmds.append("fill -3 102 -35 3 102 35 smooth_quartz_slab")
    cmds.append("fill -3 103 -35 -3 103 35 cherry_fence")
    cmds.append("fill 3 103 -35 3 103 35 cherry_fence")
    # Bệ Dịch Chuyển Quay Về Spawn Hub (0, 102, -5)
    cmds.append('setblock 0 102 -5 command_block{Command:"function skyblock:portal/to_spawn"}')
    cmds.append("setblock 0 103 -5 heavy_weighted_pressure_plate")
    cmds.append('setblock 0 104 -6 oak_wall_sign[facing=south]{front_text:{has_glowing_text:1b,messages:[\'{"text":"[ QUAY VỀ SPAWN ]","color":"gold","bold":true}\',\'{"text":"Spawn Hub","color":"yellow"}\',\'{"text":"Dẫm lên bệ","color":"gray"}\',\'{"text":"để trở về!","color":"green","bold":true}\']}}')

    # 2. 8 ĐẢO HOA SEN KHỔNG LỒ (GIANT FLOATING LOTUS ISLANDS)
    cmds.append("# 2. 8 Quần Đảo Hoa Sen Khổng Lồ Nổi Trên Mây")
    for deg in range(0, 360, 45):
        rad = math.radians(deg)
        lx = int(round(140 * math.cos(rad)))
        lz = int(round(140 * math.sin(rad)))
        cmds.extend(gen_cylinder_slices(lx, lz, 90, 97, 22, "dark_prismarine"))
        cmds.extend(gen_cylinder_slices(lx, lz, 98, 99, 25, "pink_concrete"))
        cmds.extend(gen_cylinder_slices(lx, lz, 100, 100, 20, "magenta_concrete"))
        cmds.append(f"setblock {lx} 101 {lz} sea_lantern")

    # 3. BẾN CẢNG NGƯ ÔNG & NHÀ THỦY TẠ (0, 101, -120)
    cmds.append("# 3. Bến Cảng Thần Thoại & Chòi Câu Cá Lão Ngư (0, 101, -120)")
    cmds.append("fill -25 90 -145 25 125 -95 air")
    cmds.extend(gen_cylinder_slices(0, -120, 92, 100, 25, "smooth_quartz"))
    cmds.append("fill -15 101 -130 15 101 -110 oak_planks")
    # Nhà Thủy Tạ Mái Cong
    cmds.append("fill -6 102 -126 6 107 -114 dark_prismarine_stairs")
    cmds.append("fill -4 102 -124 4 102 -116 red_carpet")
    # NPC Ngư Ông
    cmds.append('kill @e[type=villager,tag=fishing_npc]')
    cmds.append('summon villager 0 102 -120 {Tags:["fishing_npc"],CustomName:\'{"text":"🎣 Lão Ngư Thần Thoại 🎣","color":"aqua","bold":true}\',CustomNameVisible:1b,NoAI:1b,Invulnerable:1b,PersistenceRequired:1b,VillagerData:{profession:fisherman,type:plains,level:5},Offers:{Recipes:[{maxUses:999999,buy:{id:"minecraft:cod",count:16},buyB:{id:"minecraft:salmon",count:16},sell:{id:"minecraft:nautilus_shell",count:1,components:{"minecraft:custom_data":{ancient_mat:"sea_scale"},"minecraft:item_name":\'{"text":"🌊 Vảy Thần Biển Sâu 🌊","color":"aqua","bold":true}\',"minecraft:lore":[\'{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"}\',\'{"text":"Vảy lấp lánh của thủy quái cổ đại dưới Biển Hồ Trên Mây.","color":"gray","italic":true}\',\'{"text":"⚡ Dùng để chế Bùa Boss 5 & Cường hóa Giáp Thần","color":"yellow"}\',\'{"text":"[Nguồn]: Câu cá tại world_cauca","color":"aqua","bold":true}\',\'{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"}\']}}},{maxUses:999999,buy:{id:"minecraft:pufferfish",count:1},buyB:{id:"minecraft:tropical_fish",count:1},sell:{id:"minecraft:nautilus_shell",count:1,components:{"minecraft:custom_data":{ancient_mat:"sea_scale"},"minecraft:item_name":\'{"text":"🌊 Vảy Thần Biển Sâu 🌊","color":"aqua","bold":true}\',"minecraft:lore":[\'{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"}\',\'{"text":"Vảy lấp lánh của thủy quái cổ đại dưới Biển Hồ Trên Mây.","color":"gray","italic":true}\',\'{"text":"⚡ Dùng để chế Bùa Boss 5 & Cường hóa Giáp Thần","color":"yellow"}\',\'{"text":"[Nguồn]: Câu cá tại world_cauca","color":"aqua","bold":true}\',\'{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"}\']}}}]}}')

    # 4. THỦY CUNG SAN HÔ CHÌM ĐÁY HỒ (0, 72, 0)
    cmds.append("# 4. Thủy Cung San Hô Dưới Đáy Nước (0, 72, 0)")
    cmds.append("fill -15 65 -15 15 78 15 cyan_stained_glass hollow")
    cmds.append("fill -14 66 -14 14 77 14 water")
    cmds.append("setblock 0 68 0 conduit")
    cmds.append("fill -10 66 -10 10 66 10 brain_coral_block")

    cmds.append("tellraw @a [{\"text\":\"[Kiến Trúc Sư] \",\"color\":\"gold\",\"bold\":true},{\"text\":\"Biển Hồ Trên Mây (Celestial Oasis 1000x1000) đã sẵn sàng phục vụ các cần thủ!\",\"color\":\"green\",\"bold\":true}]")
    return "\n".join(cmds)


# ==============================================================================
# 5. WORLD_PARKOUR (SIÊU THÁP THỬ THÁCH PHONG LÔI 1000x1000)
# ==============================================================================
def generate_world_parkour_1000():
    cmds = []
    cmds.append("# ==============================================================================")
    cmds.append("# THẾ GIỚI 5: WORLD_PARKOUR - SIÊU THÁP THỬ THÁCH PHONG LÔI (1000x1000)")
    cmds.append("# ==============================================================================")
    cmds.append("tellraw @a [{\"text\":\"[Kiến Trúc Sư] \",\"color\":\"yellow\",\"bold\":true},{\"text\":\"Đang kiến tạo Siêu Tháp Thử Thách Phong Lôi 50 Tầng (1000x1000)...\",\"color\":\"gold\"}]")

    # 1. ĐÀI XUẤT PHÁT TRUNG TÂM (0, 70, 0)
    cmds.append("# 1. Đài Xuất Phát Trung Tâm (0, 70, 0)")
    cmds.append("fill -30 55 -30 30 90 30 air")
    cmds.extend(gen_cylinder_slices(0, 0, 60, 69, 22, "polished_deepslate"))
    cmds.extend(gen_cylinder_slices(0, 0, 70, 70, 25, "smooth_quartz"))
    cmds.append("fill -3 70 -3 3 70 3 gold_block")
    cmds.append('setblock 0 71 3 oak_wall_sign[facing=south]{front_text:{has_glowing_text:1b,messages:[\'{"text":"[ THÁP PHONG LÔI ]","color":"yellow","bold":true}\',\'{"text":"50 Tầng Thử Thách","color":"gold"}\',\'{"text":"Nhảy Lên Đỉnh Tháp","color":"aqua"}\',\'{"text":"Nhận 500 Gems!","color":"green","bold":true}\']}}')
    # Bệ Dịch Chuyển Quay Về Spawn Hub (0, 70, -5)
    cmds.append('setblock 0 70 -5 command_block{Command:"function skyblock:portal/to_spawn"}')
    cmds.append("setblock 0 71 -5 heavy_weighted_pressure_plate")
    cmds.append('setblock 0 72 -6 oak_wall_sign[facing=south]{front_text:{has_glowing_text:1b,messages:[\'{"text":"[ QUAY VỀ SPAWN ]","color":"gold","bold":true}\',\'{"text":"Spawn Hub","color":"yellow"}\',\'{"text":"Dẫm lên bệ","color":"gray"}\',\'{"text":"để trở về!","color":"green","bold":true}\']}}')

    # 2. 50 TẦNG XOẮN ỐC THEO 5 CHẶNG (SPIRAL PARKOUR ASCENT: Y=71..230)
    cmds.append("# 2. 50 Tầng Xoắn Ốc Xuyên Không (Y=71..230)")
    for step in range(1, 51):
        deg = step * 28
        rad = math.radians(deg)
        r_step = 16 + (step % 5) * 2
        px = int(round(r_step * math.cos(rad)))
        pz = int(round(r_step * math.sin(rad)))
        py = 70 + step * 3  # mỗi bước lên 3 block
        
        # Chọn loại khối theo chặng:
        if step <= 10:
            blk = "smooth_quartz_slab"  # Chặng 1: Mây Sơ Khai
        elif step <= 20:
            blk = "slime_block"         # Chặng 2: Bệ Nảy Slime
        elif step <= 30:
            blk = "magma_block"         # Chặng 3: Vách Đá Dung Nham
        elif step <= 40:
            blk = "purpur_pillar"       # Chặng 4: Cột Hư Không Breeze
        else:
            blk = "amethyst_block"      # Chặng 5: Tinh Thể Sáng Thế
            
        cmds.append(f"setblock {px} {py} {pz} {blk}")
        
        # CHECKPOINT ở mỗi mốc 10 tầng
        if step % 10 == 0:
            cp_idx = step // 10
            cmds.append(f"fill {px-2} {py} {pz-2} {px+2} {py} {pz+2} sea_lantern")
            cmds.append(f'setblock {px} {py+1} {pz} light_weighted_pressure_plate')
            cmds.append(f'setblock {px} {py+2} {pz} oak_wall_sign[facing=north]{{front_text:{{has_glowing_text:1b,messages:[\'{{"text":"[ TRẠM {cp_idx}/5 ]","color":"green","bold":true}}\',\'{{"text":"Checkpoint {step}","color":"yellow"}}\',\'{{"text":"Đã lưu tọa độ!","color":"aqua"}}\',\'{{"text":"Tiếp tục tiến lên!","color":"gold"}}\']}}}}')

    # 3. ĐỈNH THÁP QUANG MINH & NGAI VÀNG CHIẾN THẮNG (Y=230)
    cmds.append("# 3. Đỉnh Tháp Quang Minh Thần Giới (0, 230, 0)")
    cmds.append("fill -15 220 -15 15 250 15 air")
    cmds.extend(gen_cylinder_slices(0, 0, 222, 229, 14, "gold_block"))
    cmds.extend(gen_cylinder_slices(0, 0, 230, 230, 16, "diamond_block"))
    cmds.append("setblock 0 231 0 beacon")
    # Nút bấm nhận thưởng Parkour
    cmds.append('setblock 0 231 3 command_block{Command:"function skyblock:parkour_win"}')
    cmds.append("setblock 0 232 3 stone_button[face=floor,facing=north]")
    cmds.append('setblock 0 233 2 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:[\'{"text":"[ QUÁN QUÂN ]","color":"gold","bold":true}\',\'{"text":"Chinh Phục 50 Tầng","color":"yellow"}\',\'{"text":"Bấm nút để nhận","color":"aqua"}\',\'{"text":"500 GEMS & DANH HIỆU!","color":"green","bold":true}\']}}')

    cmds.append("tellraw @a [{\"text\":\"[Kiến Trúc Sư] \",\"color\":\"gold\",\"bold\":true},{\"text\":\"Siêu Tháp Thử Thách Phong Lôi 50 Tầng (1000x1000) đã khánh thành hùng vĩ!\",\"color\":\"green\",\"bold\":true}]")
    return "\n".join(cmds)


# ==============================================================================
# 6. WORLD_CASINO (CUNG ĐIỆN HOÀNG GIA LAS VEGAS 1000x1000)
# ==============================================================================
def generate_world_casino_1000():
    cmds = []
    cmds.append("# ==============================================================================")
    cmds.append("# THẾ GIỚI 6: WORLD_CASINO - CUNG ĐIỆN HOÀNG GIA LAS VEGAS (1000x1000)")
    cmds.append("# ==============================================================================")
    cmds.append("tellraw @a [{\"text\":\"[Kiến Trúc Sư] \",\"color\":\"gold\",\"bold\":true},{\"text\":\"Đang khởi tạo Cung Điện Hoàng Gia Las Vegas 1000x1000...\",\"color\":\"yellow\"}]")

    # 1. ĐẠI CUNG ĐIỆN VÀNG TRUNG TÂM (0, 110, 0)
    cmds.append("# 1. Sảnh Hoàng Gia Las Vegas (0, 110, 0)")
    cmds.append("fill -50 85 -50 50 145 50 air")
    cmds.extend(gen_cylinder_slices(0, 0, 95, 108, 45, "polished_blackstone_bricks"))
    cmds.extend(gen_cylinder_slices(0, 0, 109, 110, 48, "gilded_blackstone"))
    cmds.extend(gen_cylinder_slices(0, 0, 110, 110, 38, "smooth_quartz"))
    cmds.append("fill -30 110 -3 30 110 3 red_carpet")
    cmds.append("fill -3 110 -30 3 110 30 red_carpet")
    # Bệ Dịch Chuyển Quay Về Spawn Hub (0, 110, -5)
    cmds.append('setblock 0 110 -5 command_block{Command:"function skyblock:portal/to_spawn"}')
    cmds.append("setblock 0 111 -5 heavy_weighted_pressure_plate")
    cmds.append('setblock 0 112 -6 oak_wall_sign[facing=south]{front_text:{has_glowing_text:1b,messages:[\'{"text":"[ QUAY VỀ SPAWN ]","color":"gold","bold":true}\',\'{"text":"Spawn Hub","color":"yellow"}\',\'{"text":"Dẫm lên bệ","color":"gray"}\',\'{"text":"để trở về!","color":"green","bold":true}\']}}')

    # Mái Vòm Đèn Chùm Hoàng Gia (Y=125..135)
    cmds.append("fill -15 130 -15 15 130 15 sea_lantern")
    cmds.append("fill -10 131 -10 10 131 10 gold_block")
    cmds.append("setblock 0 128 0 beacon")

    # 2. SẢNH COINFLIP THẦN TÀI (/cf) tại (25, 110, 0)
    cmds.append("# 2. Sảnh Đấu Trí Coinflip Thần Tài (25, 110, 0)")
    cmds.append("fill 18 111 -8 32 114 8 smooth_quartz_stairs hollow")
    cmds.append("setblock 25 111 -3 red_wool")
    cmds.append("setblock 25 111 3 blue_wool")
    cmds.append('setblock 25 112 0 oak_wall_sign[facing=west]{front_text:{has_glowing_text:1b,messages:[\'{"text":"[ SẢNH COINFLIP ]","color":"gold","bold":true}\',\'{"text":"Tung Đồng Xu Thần Tài","color":"yellow"}\',\'{"text":"Gõ: /cf <tiền> ngua","color":"aqua"}\',\'{"text":"hoặc /cf <tiền> sap","color":"green"}\']}}')

    # 3. QUẦY VÉ SỐ MEGA 6/45 (/xoso) tại (-25, 110, 0)
    cmds.append("# 3. Quầy Vé Số Jackpot Mega 6/45 (-25, 110, 0)")
    cmds.append("fill -32 111 -8 -18 114 8 gold_block hollow")
    cmds.append('setblock -25 112 0 oak_wall_sign[facing=east]{front_text:{has_glowing_text:1b,messages:[\'{"text":"[ VÉ SỐ JACKPOT ]","color":"light_purple","bold":true}\',\'{"text":"Mega 6/45 Cổ Thần","color":"gold"}\',\'{"text":"Gõ: /xoso <số> <tiền>","color":"aqua"}\',\'{"text":"Trúng thưởng X70 LẦN!","color":"red","bold":true}\']}}')

    # 4. BÀN CỜ TỶ PHÚ KHỔNG LỒ 40x40 (MONOPOLY GIANT BOARD) tại (0, 110, 70)
    cmds.append("# 4. Bàn Cờ Tỷ Phú Khổng Lồ (0, 110, 70)")
    cmds.append("fill -20 110 50 20 110 90 white_concrete")
    cmds.append("fill -18 110 52 18 110 88 light_gray_concrete")
    cmds.append("fill -15 110 55 15 110 85 green_concrete")
    # Biển Bàn Cờ
    cmds.append('setblock 0 111 50 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:[\'{"text":"[ BÀN CỜ TỶ PHÚ ]","color":"green","bold":true}\',\'{"text":"Skyblock Monopoly","color":"gold"}\',\'{"text":"Gõ: /cotyphu","color":"yellow"}\',\'{"text":"để lắc xúc xắc!","color":"aqua"}\']}}')

    # 5. SẢNH ĐẤU GIÁ TRỰC TIẾP (AUCTION HOUSE PROMENADE) tại (0, 110, -70)
    cmds.append("# 5. Sảnh Đấu Giá Trực Tiếp (/ah) (0, 110, -70)")
    cmds.append("fill -20 110 -90 20 110 -50 smooth_quartz")
    cmds.append("fill -10 111 -75 10 111 -65 polished_blackstone")
    cmds.append("setblock 0 112 -70 glass")
    cmds.append("setblock 0 113 -70 beacon")
    cmds.append('setblock 0 111 -55 oak_wall_sign[facing=south]{front_text:{has_glowing_text:1b,messages:[\'{"text":"[ SÀN ĐẤU GIÁ ]","color":"gold","bold":true}\',\'{"text":"Auction House","color":"yellow"}\',\'{"text":"Gõ: /ah","color":"aqua"}\',\'{"text":"Giao dịch bảo vật!","color":"green","bold":true}\']}}')

    cmds.append("tellraw @a [{\"text\":\"[Kiến Trúc Sư] \",\"color\":\"gold\",\"bold\":true},{\"text\":\"Cung Điện Hoàng Gia Las Vegas 1000x1000 đã khánh thành tráng lệ!\",\"color\":\"green\",\"bold\":true}]")
    return "\n".join(cmds)


def run():
    print("BAT DAU TAO BATCH KIEN TRUC 6 THE GIOI 1000x1000...")
    
    w_spawn = generate_world_spawn_1000()
    with open(os.path.join(BUILDER_DIR, 'world_spawn_1000.mcfunction'), 'w', encoding='utf-8') as f:
        f.write(w_spawn)
    print("1. Da tao builder/world_spawn_1000.mcfunction")

    w_boss = generate_world_boss_1000()
    with open(os.path.join(BUILDER_DIR, 'world_boss_1000.mcfunction'), 'w', encoding='utf-8') as f:
        f.write(w_boss)
    print("2. Da tao builder/world_boss_1000.mcfunction")

    w_farm = generate_world_farm_1000()
    with open(os.path.join(BUILDER_DIR, 'world_farm_1000.mcfunction'), 'w', encoding='utf-8') as f:
        f.write(w_farm)
    print("3. Da tao builder/world_farm_1000.mcfunction")

    w_cauca = generate_world_cauca_1000()
    with open(os.path.join(BUILDER_DIR, 'world_cauca_1000.mcfunction'), 'w', encoding='utf-8') as f:
        f.write(w_cauca)
    print("4. Da tao builder/world_cauca_1000.mcfunction")

    w_parkour = generate_world_parkour_1000()
    with open(os.path.join(BUILDER_DIR, 'world_parkour_1000.mcfunction'), 'w', encoding='utf-8') as f:
        f.write(w_parkour)
    print("5. Da tao builder/world_parkour_1000.mcfunction")

    w_casino = generate_world_casino_1000()
    with open(os.path.join(BUILDER_DIR, 'world_casino_1000.mcfunction'), 'w', encoding='utf-8') as f:
        f.write(w_casino)
    print("6. Da tao builder/world_casino_1000.mcfunction")

    # Tao file tong hop build_all_worlds.mcfunction
    master_build = """# ==============================================================================
# MASTER BUILDER: KÍCH HOẠT TÁI TẠO 6 THẾ GIỚI 1000x1000
# ==============================================================================
tellraw @a [{"text":"[Server] ","color":"gold","bold":true},{"text":"Bắt đầu thi công toàn diện 6 Đại Thế Giới 1000x1000...","color":"yellow"}]
execute in minecraft:overworld run function skyblock:builder/world_spawn_1000
execute in minecraft:world_boss run function skyblock:builder/world_boss_1000
execute in minecraft:world_farm run function skyblock:builder/world_farm_1000
execute in minecraft:world_cauca run function skyblock:builder/world_cauca_1000
execute in minecraft:world_parkour run function skyblock:builder/world_parkour_1000
execute in minecraft:world_casino run function skyblock:builder/world_casino_1000
tellraw @a [{"text":"[Server] ","color":"gold","bold":true},{"text":"HOÀN TẤT 100% CẢ 6 ĐẠI THẾ GIỚI 1000x1000 KHÔNG LỖI!","color":"green","bold":true}]
"""
    with open(os.path.join(BASE_DIR, 'build_all_worlds.mcfunction'), 'w', encoding='utf-8') as f:
        f.write(master_build)
    print("7. Da tao build_all_worlds.mcfunction")
    print("TAT CA BATCH VOXEL 1000x1000 DA DUOC TAO HOAN HAO!")

if __name__ == '__main__':
    run()
