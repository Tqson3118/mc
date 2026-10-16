# -*- coding: utf-8 -*-
import math

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

def gen_cone_base(cx, cz, y_min, y_max, r_min, r_max, block):
    lines = []
    dy = y_max - y_min
    if dy <= 0:
        return lines
    for y in range(y_min, y_max + 1):
        progress = (y - y_min) / float(dy)
        r = r_min + (r_max - r_min) * (progress ** 0.8)
        lines.extend(gen_cylinder_slices(cx, cz, y, y, r, block))
    return lines

def gen_north_causeway():
    cmds = []
    z_min, z_max = -260, -25
    total_z = z_max - z_min
    
    y_intervals = []
    current_y = None
    cur_z_start = None
    
    for z in range(z_max, z_min - 1, -1):
        progress = (z_max - z) / float(total_z)
        y = int(round(110 - 35 * progress))
        if y != current_y:
            if current_y is not None:
                y_intervals.append((current_y, cur_z_start, z + 1))
            current_y = y
            cur_z_start = z
    if current_y is not None:
        y_intervals.append((current_y, cur_z_start, z_min))
        
    cmds.append("# 8.1 Đại Lộ Bắc (North Grand Causeway 7 blocks rộng, giật cấp Y=110..75 kết nối Đấu Trường 5)")
    for y, z_high, z_low in y_intervals:
        cmds.append(f"fill -2 {y} {z_low} 2 {y} {z_high} polished_blackstone_bricks")
        cmds.append(f"fill -2 {y-1} {z_low} 2 {y-1} {z_high} blackstone")
        cmds.append(f"fill -3 {y} {z_low} -3 {y} {z_high} polished_blackstone")
        cmds.append(f"fill 3 {y} {z_low} 3 {y} {z_high} polished_blackstone")
        cmds.append(f"fill -3 {y+1} {z_low} -3 {y+1} {z_high} polished_blackstone_brick_wall")
        cmds.append(f"fill 3 {y+1} {z_low} 3 {y+1} {z_high} polished_blackstone_brick_wall")

    for z in range(z_max, z_min - 1, -1):
        if abs(z) % 12 == 0:
            progress = (z_max - z) / float(total_z)
            y = int(round(110 - 35 * progress))
            cmds.append(f"setblock -3 {y+2} {z} polished_blackstone_brick_wall")
            cmds.append(f"setblock -3 {y+3} {z} soul_lantern[hanging=false]")
            cmds.append(f"setblock 3 {y+2} {z} polished_blackstone_brick_wall")
            cmds.append(f"setblock 3 {y+3} {z} soul_lantern[hanging=false]")
            
    return cmds

def gen_diagonal_bridge(sx, sz, name):
    cmds = []
    cmds.append(f"# 8.{name} (5 blocks rộng, Y=110..100)")
    s_start, s_end = 20, 155
    total_s = s_end - s_start
    
    px = -sz
    pz = sx
    
    for s in range(s_start, s_end + 1):
        progress = (s - s_start) / float(total_s)
        y = int(round(110 - 10 * progress))
        cx = sx * s
        cz = sz * s
        
        cmds.append(f"fill {cx-1} {y} {cz-1} {cx+1} {y} {cz+1} polished_blackstone_bricks")
        cmds.append(f"fill {cx-1} {y-1} {cz-1} {cx+1} {y-1} {cz+1} blackstone")
        
        lx = cx + 2 * px
        lz = cz + 2 * pz
        cmds.append(f"setblock {lx} {y} {lz} polished_blackstone")
        cmds.append(f"setblock {lx} {y+1} {lz} polished_blackstone_brick_wall")
        cmds.append(f"setblock {lx+sx} {y+1} {lz} polished_blackstone_brick_wall")
        
        rx = cx - 2 * px
        rz = cz - 2 * pz
        cmds.append(f"setblock {rx} {y} {rz} polished_blackstone")
        cmds.append(f"setblock {rx} {y+1} {rz} polished_blackstone_brick_wall")
        cmds.append(f"setblock {rx+sx} {y+1} {rz} polished_blackstone_brick_wall")
        
        if s % 12 == 0:
            cmds.append(f"setblock {lx} {y+2} {lz} soul_lantern[hanging=false]")
            cmds.append(f"setblock {rx} {y+2} {rz} soul_lantern[hanging=false]")
            
    return cmds

def generate_world_boss_1000():
    cmds = []
    cmds.append("# ==============================================================================")
    cmds.append("# THẾ GIỚI 2: WORLD_BOSS - VỰC THẲM 6 ĐẠI ĐẤU TRƯỜNG BOSS 3D (1000x1000)")
    cmds.append("# ==============================================================================")
    cmds.append('tellraw @a [{"text":"[Kiến Trúc Sư] ","color":"dark_red","bold":true},{"text":"Đang khởi tạo Vực Thẳm Đấu Trường Boss Cổ Đại 3D (1000x1000)...","color":"red"}]')

    # 1. SẢNH CHỈ HUY TRUNG TÂM (0, 110, 0)
    cmds.append("# 1. Sảnh Chỉ Huy & Chuẩn Bị Chiến Đấu (Tâm 0, 110, 0)")
    cmds.append("fill -35 80 -35 35 150 35 air")
    cmds.extend(gen_cone_base(0, 0, 85, 108, 4, 30, "polished_blackstone_bricks"))
    cmds.extend(gen_cylinder_slices(0, 0, 109, 109, 31, "gilded_blackstone"))
    cmds.extend(gen_cylinder_slices(0, 0, 110, 110, 30, "polished_blackstone_bricks"))
    cmds.extend(gen_cylinder_slices(0, 0, 110, 110, 24, "gilded_blackstone"))
    cmds.extend(gen_cylinder_slices(0, 0, 110, 110, 18, "smooth_quartz"))
    cmds.extend(gen_cylinder_slices(0, 0, 110, 110, 8, "crying_obsidian"))
    cmds.append("fill -4 110 -4 4 110 4 red_carpet")
    cmds.append("setblock 0 111 0 beacon")

    # Lan can bảo vệ vòng ngoài sảnh
    for deg in range(0, 360, 4):
        rad = math.radians(deg)
        rx = int(round(30 * math.cos(rad)))
        rz = int(round(30 * math.sin(rad)))
        # Bỏ trống các lối vào cầu đại lộ
        if abs(rx) <= 4 and rz < -20: # Lối Bắc
            continue
        if abs(rz) <= 3 and abs(rx) > 24: # Lối Đông & Tây
            continue
        if abs(rx) <= 3 and rz > 24: # Lối Nam
            continue
        if abs(abs(rx) - abs(rz)) <= 4 and (abs(rx) > 16): # 4 lối chéo
            continue
        cmds.append(f"setblock {rx} 111 {rz} polished_blackstone_brick_wall")

    # 8 Đại Trụ Gothic tại Sảnh
    for deg in range(0, 360, 45):
        rad = math.radians(deg)
        px = int(round(26 * math.cos(rad)))
        pz = int(round(26 * math.sin(rad)))
        cmds.append(f"fill {px} 111 {pz} {px} 118 {pz} polished_blackstone_bricks")
        cmds.append(f"setblock {px} 119 {pz} soul_lantern[hanging=false]")

    # Biển bảng chỉ dẫn
    cmds.append('setblock 0 112 3 oak_wall_sign[facing=south]{front_text:{has_glowing_text:1b,messages:[\'{"text":"[ VỰC THẲM BOSS ]","color":"dark_red","bold":true}\',\'{"text":"6 Đại Đấu Trường","color":"gold"}\',\'{"text":"Theo Đại Lộ Đá Đen","color":"yellow"}\',\'{"text":"Đến Từng Thánh Địa!","color":"red","bold":true}\']}}')
    # Bệ Quay Về Spawn Hub (0, 110, -5)
    cmds.append('setblock 0 110 -5 command_block{Command:"function skyblock:portal/to_spawn"}')
    cmds.append("setblock 0 111 -5 heavy_weighted_pressure_plate")
    cmds.append('setblock 0 112 -6 oak_wall_sign[facing=south]{front_text:{has_glowing_text:1b,messages:[\'{"text":"[ QUAY VỀ SPAWN ]","color":"gold","bold":true}\',\'{"text":"Spawn Hub","color":"yellow"}\',\'{"text":"Dẫm lên bệ","color":"gray"}\',\'{"text":"để trở về!","color":"green","bold":true}\']}}')
    # Bệ Dịch Chuyển Lên Thiên Cung Y=240 (0, 110, -15)
    cmds.append('setblock 0 110 -15 command_block{Command:"tp @p 0 242 0"}')
    cmds.append("setblock 0 111 -15 light_weighted_pressure_plate")
    cmds.append('setblock 0 112 -16 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:[\'{"text":"[ LÊN THIÊN CUNG ]","color":"gold","bold":true}\',\'{"text":"Đấu Trường Boss 6","color":"yellow"}\',\'{"text":"Hoàng Đế Tinh Tú","color":"light_purple"}\',\'{"text":"Đỉnh Cao Y=240","color":"aqua"}\']}}')

    # 2. ĐẤU TRƯỜNG 1: HANG MẠNG NHỆN CỔ XƯA (ARACHNID GROTTO) tại (-180, 100, -180) - Boss 1
    cmds.append("# 2. Đấu Trường 1: Hang Mạng Nhện Cổ Xưa 3D (-180, 100, -180)")
    cmds.append("fill -225 75 -225 -135 145 -135 air")
    cmds.extend(gen_cone_base(-180, -180, 80, 98, 4, 35, "mossy_cobblestone"))
    cmds.extend(gen_cylinder_slices(-180, -180, 99, 99, 36, "mossy_stone_bricks"))
    cmds.extend(gen_cylinder_slices(-180, -180, 100, 100, 36, "mossy_stone_bricks"))
    cmds.extend(gen_cylinder_slices(-180, -180, 100, 100, 30, "moss_block"))
    cmds.extend(gen_cylinder_slices(-180, -180, 100, 100, 22, "mossy_stone_bricks"))
    # Lan can bảo vệ quanh mép đảo R=35
    for deg in range(0, 360, 5):
        rad = math.radians(deg)
        rx = int(round(-180 + 35 * math.cos(rad)))
        rz = int(round(-180 + 35 * math.sin(rad)))
        # Mở lối vào cầu (hướng Đông Nam: dx > 0, dz > 0)
        if (rx - (-180)) > 24 and (rz - (-180)) > 24:
            continue
        cmds.append(f"setblock {rx} 101 {rz} mossy_stone_brick_wall")

    # 8 Cột vòm hang rêu & thạch nhũ (R=30, Y=101..114)
    for deg in range(0, 360, 45):
        rad = math.radians(deg)
        px = int(round(-180 + 30 * math.cos(rad)))
        pz = int(round(-180 + 30 * math.sin(rad)))
        cmds.append(f"fill {px} 101 {pz} {px} 111 {pz} mossy_stone_bricks")
        cmds.append(f"fill {px} 112 {pz} {px} 114 {pz} dark_oak_fence")
        cmds.append(f"setblock {px} 110 {pz} pointed_dripstone[vertical_direction=down]")
        cmds.append(f"setblock {px} 107 {pz} soul_lantern[hanging=false]")
        # Mạng nhện trên vòm cao xa tâm sàn đấu
        cmds.append(f"setblock {px} 113 {pz} cobweb")

    # Bệ Triệu Hồi Boss 1 (Tâm hoàn toàn thoáng đãng, phẳng tại Y=100)
    cmds.append('setblock -180 100 -180 command_block{Command:"function skyblock:gate_boss_1"}')
    cmds.append("setblock -180 101 -180 stone_button[face=floor,facing=north]")
    cmds.append('setblock -180 101 -178 oak_wall_sign[facing=south]{front_text:{has_glowing_text:1b,messages:[\'{"text":"[ ĐẤU TRƯỜNG 1 ]","color":"dark_green","bold":true}\',\'{"text":"Nhện Chúa Cổ Xưa","color":"green"}\',\'{"text":"Yêu cầu: Chiến đấu 5","color":"yellow"}\',\'{"text":"Nhấn nút triệu hồi!","color":"gold"}\']}}')
    # Bệ Quay Về Sảnh Chỉ Huy (-180, 100, -165)
    cmds.append('setblock -180 100 -165 command_block{Command:"tp @p 0 111 0"}')
    cmds.append("setblock -180 101 -165 light_weighted_pressure_plate")
    cmds.append('setblock -180 102 -166 oak_wall_sign[facing=south]{front_text:{has_glowing_text:1b,messages:[\'{"text":"[ VỀ SẢNH BOSS ]","color":"gold","bold":true}\',\'{"text":"Sảnh Chỉ Huy","color":"yellow"}\',\'{"text":"Dẫm lên bệ","color":"gray"}\',\'{"text":"để quay lại!","color":"green","bold":true}\']}}')

    # 3. ĐẤU TRƯỜNG 2: VỰC LỬA HỎA NGỤC (VOLCANO CALDERA) tại (180, 100, -180) - Boss 2
    cmds.append("# 3. Đấu Trường 2: Vực Lửa Hỏa Ngục 3D (180, 100, -180)")
    cmds.append("fill 135 75 -225 225 145 -135 air")
    cmds.extend(gen_cone_base(180, -180, 80, 98, 4, 35, "basalt"))
    cmds.extend(gen_cylinder_slices(180, -180, 99, 99, 36, "blackstone"))
    cmds.extend(gen_cylinder_slices(180, -180, 100, 100, 36, "polished_blackstone"))
    cmds.extend(gen_cylinder_slices(180, -180, 100, 100, 30, "magma_block"))
    cmds.extend(gen_cylinder_slices(180, -180, 100, 100, 22, "polished_blackstone"))
    # Lan can bảo vệ quanh mép đảo R=35
    for deg in range(0, 360, 5):
        rad = math.radians(deg)
        rx = int(round(180 + 35 * math.cos(rad)))
        rz = int(round(-180 + 35 * math.sin(rad)))
        if (rx - 180) < -24 and (rz - (-180)) > 24: # Lối vào cầu Tây Nam
            continue
        cmds.append(f"setblock {rx} 101 {rz} polished_blackstone_wall")

    # 6 Cột Dung Nham An Toàn (Lava Columns encased in tinted glass)
    for deg in range(0, 360, 60):
        rad = math.radians(deg)
        px = int(round(180 + 28 * math.cos(rad)))
        pz = int(round(-180 + 28 * math.sin(rad)))
        cmds.append(f"fill {px-1} 101 {pz-1} {px+1} 101 {pz+1} blackstone")
        cmds.append(f"fill {px-1} 102 {pz-1} {px+1} 108 {pz+1} tinted_glass")
        cmds.append(f"fill {px} 102 {pz} {px} 108 {pz} lava")
        cmds.append(f"fill {px-1} 109 {pz-1} {px+1} 109 {pz+1} crying_obsidian")
        cmds.append(f"setblock {px} 110 {pz} magma_block")

    # Bệ Triệu Hồi Boss 2 (Tâm hoàn toàn thoáng đãng, phẳng tại Y=100)
    cmds.append('setblock 180 100 -180 command_block{Command:"function skyblock:gate_boss_2"}')
    cmds.append("setblock 180 101 -180 stone_button[face=floor,facing=north]")
    cmds.append('setblock 180 101 -178 oak_wall_sign[facing=south]{front_text:{has_glowing_text:1b,messages:[\'{"text":"[ ĐẤU TRƯỜNG 2 ]","color":"red","bold":true}\',\'{"text":"Đao Phủ Địa Ngục","color":"dark_red"}\',\'{"text":"Yêu cầu: Chiến đấu 10","color":"yellow"}\',\'{"text":"Nhấn nút triệu hồi!","color":"gold"}\']}}')
    # Bệ Quay Về Sảnh Chỉ Huy (180, 100, -165)
    cmds.append('setblock 180 100 -165 command_block{Command:"tp @p 0 111 0"}')
    cmds.append("setblock 180 101 -165 light_weighted_pressure_plate")
    cmds.append('setblock 180 102 -166 oak_wall_sign[facing=south]{front_text:{has_glowing_text:1b,messages:[\'{"text":"[ VỀ SẢNH BOSS ]","color":"gold","bold":true}\',\'{"text":"Sảnh Chỉ Huy","color":"yellow"}\',\'{"text":"Dẫm lên bệ","color":"gray"}\',\'{"text":"để quay lại!","color":"green","bold":true}\']}}')

    # 4. ĐẤU TRƯỜNG 3: ĐIỆN THỜ HẮC ÁM (DARK SANCTUM) tại (-180, 100, 180) - Boss 3
    cmds.append("# 4. Đấu Trường 3: Điện Thờ Hắc Ám 3D (-180, 100, 180)")
    cmds.append("fill -225 75 135 -135 145 225 air")
    cmds.extend(gen_cone_base(-180, 180, 80, 98, 4, 35, "polished_blackstone_bricks"))
    cmds.extend(gen_cylinder_slices(-180, 180, 99, 99, 36, "gilded_blackstone"))
    cmds.extend(gen_cylinder_slices(-180, 180, 100, 100, 36, "polished_blackstone_bricks"))
    cmds.extend(gen_cylinder_slices(-180, 180, 100, 100, 30, "crying_obsidian"))
    cmds.extend(gen_cylinder_slices(-180, 180, 100, 100, 22, "gilded_blackstone"))
    # Lan can bảo vệ quanh mép đảo R=35
    for deg in range(0, 360, 5):
        rad = math.radians(deg)
        rx = int(round(-180 + 35 * math.cos(rad)))
        rz = int(round(180 + 35 * math.sin(rad)))
        if (rx - (-180)) > 24 and (rz - 180) < -24: # Lối vào cầu Đông Bắc
            continue
        cmds.append(f"setblock {rx} 101 {rz} polished_blackstone_brick_wall")

    # 8 Trụ Cột Gothic với Ngọn Đuốc / Lửa Linh Hồn
    for deg in range(0, 360, 45):
        rad = math.radians(deg)
        px = int(round(-180 + 29 * math.cos(rad)))
        pz = int(round(180 + 29 * math.sin(rad)))
        cmds.append(f"fill {px} 101 {pz} {px} 113 {pz} gilded_blackstone")
        cmds.append(f"setblock {px} 114 {pz} netherrack")
        cmds.append(f"setblock {px} 115 {pz} soul_fire")
        cmds.append(f"setblock {px} 108 {pz} soul_lantern[hanging=false]")

    # Bệ Triệu Hồi Boss 3 (Tâm hoàn toàn thoáng đãng, phẳng tại Y=100)
    cmds.append('setblock -180 100 180 command_block{Command:"function skyblock:gate_boss_3"}')
    cmds.append("setblock -180 101 180 stone_button[face=floor,facing=north]")
    cmds.append('setblock -180 101 178 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:[\'{"text":"[ ĐẤU TRƯỜNG 3 ]","color":"dark_purple","bold":true}\',\'{"text":"Chúa Tể Bóng Tối","color":"light_purple"}\',\'{"text":"Yêu cầu: Chiến đấu 20","color":"yellow"}\',\'{"text":"Nhấn nút triệu hồi!","color":"gold"}\']}}')
    # Bệ Quay Về Sảnh Chỉ Huy (-180, 100, 165)
    cmds.append('setblock -180 100 165 command_block{Command:"tp @p 0 111 0"}')
    cmds.append("setblock -180 101 165 light_weighted_pressure_plate")
    cmds.append('setblock -180 102 164 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:[\'{"text":"[ VỀ SẢNH BOSS ]","color":"gold","bold":true}\',\'{"text":"Sảnh Chỉ Huy","color":"yellow"}\',\'{"text":"Dẫm lên bệ","color":"gray"}\',\'{"text":"để quay lại!","color":"green","bold":true}\']}}')

    # 5. ĐẤU TRƯỜNG 4: PHẾ TÍCH HƯ KHÔNG (VOID CHASM) tại (180, 100, 180) - Boss 4
    cmds.append("# 5. Đấu Trường 4: Phế Tích Hư Không 3D (180, 100, 180)")
    cmds.append("fill 135 75 135 225 145 225 air")
    cmds.extend(gen_cone_base(180, 180, 80, 98, 4, 35, "end_stone_bricks"))
    cmds.extend(gen_cylinder_slices(180, 180, 99, 99, 36, "end_stone_bricks"))
    cmds.extend(gen_cylinder_slices(180, 180, 100, 100, 36, "end_stone_bricks"))
    cmds.extend(gen_cylinder_slices(180, 180, 100, 100, 30, "purpur_block"))
    cmds.extend(gen_cylinder_slices(180, 180, 100, 100, 22, "amethyst_block"))
    # Lan can bảo vệ quanh mép đảo R=35
    for deg in range(0, 360, 5):
        rad = math.radians(deg)
        rx = int(round(180 + 35 * math.cos(rad)))
        rz = int(round(180 + 35 * math.sin(rad)))
        if (rx - 180) < -24 and (rz - 180) < -24: # Lối vào cầu Tây Bắc
            continue
        cmds.append(f"setblock {rx} 101 {rz} end_stone_brick_wall")

    # 6 Cột Trụ Purpur Giật Cấp & Thạch Anh Tím
    for deg in range(0, 360, 60):
        rad = math.radians(deg)
        px = int(round(180 + 29 * math.cos(rad)))
        pz = int(round(180 + 29 * math.sin(rad)))
        cmds.append(f"fill {px} 101 {pz} {px} 111 {pz} purpur_pillar")
        cmds.append(f"setblock {px} 112 {pz} amethyst_block")
        cmds.append(f"setblock {px} 113 {pz} amethyst_cluster[facing=up]")
        cmds.append(f"setblock {px} 107 {pz} end_rod")

    # Bệ Triệu Hồi Boss 4 (Tâm hoàn toàn thoáng đãng, phẳng tại Y=100)
    cmds.append('setblock 180 100 180 command_block{Command:"function skyblock:gate_boss_4"}')
    cmds.append("setblock 180 101 180 stone_button[face=floor,facing=north]")
    cmds.append('setblock 180 101 178 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:[\'{"text":"[ ĐẤU TRƯỜNG 4 ]","color":"light_purple","bold":true}\',\'{"text":"Long Vương Hư Không","color":"aqua"}\',\'{"text":"Yêu cầu: Chiến đấu 30","color":"yellow"}\',\'{"text":"Nhấn nút triệu hồi!","color":"gold"}\']}}')
    # Bệ Quay Về Sảnh Chỉ Huy (180, 100, 165)
    cmds.append('setblock 180 100 165 command_block{Command:"tp @p 0 111 0"}')
    cmds.append("setblock 180 101 165 light_weighted_pressure_plate")
    cmds.append('setblock 180 102 164 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:[\'{"text":"[ VỀ SẢNH BOSS ]","color":"gold","bold":true}\',\'{"text":"Sảnh Chỉ Huy","color":"yellow"}\',\'{"text":"Dẫm lên bệ","color":"gray"}\',\'{"text":"để quay lại!","color":"green","bold":true}\']}}')

    # 6. ĐẤU TRƯỜNG 5: THÂM UYÊN CỔ ĐIỆN (SCULK SANCTUM) tại (0, 75, -300) - Boss 5 (2500 HP)
    cmds.append("# 6. Đấu Trường 5: Thâm Uyên Cổ Điện Y=75 (0, 75, -300)")
    cmds.append("fill -50 50 -350 50 120 -250 air")
    cmds.extend(gen_cone_base(0, -300, 52, 73, 5, 42, "reinforced_deepslate"))
    cmds.extend(gen_cylinder_slices(0, -300, 74, 74, 44, "reinforced_deepslate"))
    cmds.extend(gen_cylinder_slices(0, -300, 75, 75, 44, "sculk"))
    cmds.extend(gen_cylinder_slices(0, -300, 75, 75, 36, "sculk"))
    cmds.extend(gen_cylinder_slices(0, -300, 75, 75, 6, "sculk_catalyst"))
    # Lan can bảo vệ quanh mép đảo R=43
    for deg in range(0, 360, 4):
        rad = math.radians(deg)
        rx = int(round(43 * math.cos(rad)))
        rz = int(round(-300 + 43 * math.sin(rad)))
        if abs(rx) <= 4 and (rz - (-300)) > 35: # Lối vào Đại Lộ Bắc từ hướng Nam
            continue
        cmds.append(f"setblock {rx} 76 {rz} deepslate_tile_wall")

    # 8 Cột Trụ Đá Sâu U Ám
    for deg in range(0, 360, 45):
        rad = math.radians(deg)
        px = int(round(35 * math.cos(rad)))
        pz = int(round(-300 + 35 * math.sin(rad)))
        cmds.append(f"fill {px} 76 {pz} {px} 88 {pz} deepslate_bricks")
        cmds.append(f"setblock {px} 89 {pz} sculk_sensor")
        cmds.append(f"setblock {px} 83 {pz} soul_lantern[hanging=false]")

    # Bệ Triệu Hồi Boss 5 (Tâm hoàn toàn thoáng đãng, phẳng tại Y=75)
    cmds.append('setblock 0 75 -300 command_block{Command:"function skyblock:gate_boss_5"}')
    cmds.append("setblock 0 76 -300 stone_button[face=floor,facing=north]")
    cmds.append('setblock 0 76 -298 oak_wall_sign[facing=south]{front_text:{has_glowing_text:1b,messages:[\'{"text":"[ ĐẤU TRƯỜNG 5 ]","color":"dark_aqua","bold":true}\',\'{"text":"Warden Cổ Đại","color":"blue"}\',\'{"text":"Yêu cầu: Chiến đấu 40","color":"yellow"}\',\'{"text":"Nhấn nút triệu hồi!","color":"gold"}\']}}')
    # Bệ Quay Về Sảnh Chỉ Huy từ Boss 5
    cmds.append('setblock 0 75 -285 command_block{Command:"tp @p 0 111 0"}')
    cmds.append("setblock 0 76 -285 light_weighted_pressure_plate")
    cmds.append('setblock 0 77 -286 oak_wall_sign[facing=south]{front_text:{has_glowing_text:1b,messages:[\'{"text":"[ VỀ SẢNH BOSS ]","color":"dark_aqua","bold":true}\',\'{"text":"Sảnh Chỉ Huy","color":"aqua"}\',\'{"text":"Dẫm lên bệ","color":"gray"}\',\'{"text":"để quay lại","color":"yellow"}\']}}')

    # 7. ĐẤU TRƯỜNG 6: THIÊN CUNG SÁNG THẾ (CELESTIAL OLYMPUS) tại (0, 240, 0) - Boss 6 (5000 HP)
    cmds.append("# 7. Đấu Trường 6: Thiên Cung Sáng Thế (0, 240, 0) Đỉnh Cao Y=240..241")
    cmds.append("fill -55 210 -55 55 285 55 air")
    cmds.extend(gen_cone_base(0, 0, 215, 238, 6, 45, "smooth_quartz"))
    cmds.extend(gen_cylinder_slices(0, 0, 239, 240, 48, "smooth_quartz"))
    cmds.extend(gen_cylinder_slices(0, 0, 241, 241, 46, "smooth_quartz"))
    cmds.extend(gen_cylinder_slices(0, 0, 241, 241, 38, "gold_block"))
    cmds.extend(gen_cylinder_slices(0, 0, 241, 241, 28, "sea_lantern"))
    cmds.extend(gen_cylinder_slices(0, 0, 241, 241, 16, "smooth_quartz"))
    # Lan can bảo vệ quanh mép đảo R=45
    for deg in range(0, 360, 4):
        rad = math.radians(deg)
        rx = int(round(45 * math.cos(rad)))
        rz = int(round(45 * math.sin(rad)))
        cmds.append(f"setblock {rx} 242 {rz} smooth_quartz_stairs[facing=south,half=bottom]")

    # 8 Cột Trụ Sáng Thế
    for deg in range(0, 360, 45):
        rad = math.radians(deg)
        px = int(round(38 * math.cos(rad)))
        pz = int(round(38 * math.sin(rad)))
        cmds.append(f"fill {px} 242 {pz} {px} 257 {pz} quartz_pillar")
        cmds.append(f"setblock {px} 258 {pz} iron_block")
        cmds.append(f"setblock {px} 259 {pz} beacon")
        cmds.append(f"setblock {px} 260 {pz} end_rod")

    # Bệ Triệu Hồi Boss 6
    cmds.append('setblock 0 241 0 command_block{Command:"function skyblock:gate_boss_6"}')
    cmds.append("setblock 0 242 0 stone_button[face=floor,facing=north]")
    cmds.append('setblock 0 242 -2 oak_wall_sign[facing=south]{front_text:{has_glowing_text:1b,messages:[\'{"text":"[ ĐẤU TRƯỜNG 6 ]","color":"gold","bold":true}\',\'{"text":"Hoàng Đế Tinh Tú","color":"yellow"}\',\'{"text":"Yêu cầu: Chiến đấu 50","color":"aqua"}\',\'{"text":"Nhấn nút triệu hồi!","color":"gold","bold":true}\']}}')
    # Bệ Quay Về Sảnh Chỉ Huy từ Boss 6
    cmds.append('setblock 0 241 -15 command_block{Command:"tp @p 0 111 0"}')
    cmds.append("setblock 0 242 -15 light_weighted_pressure_plate")
    cmds.append('setblock 0 243 -16 oak_wall_sign[facing=south]{front_text:{has_glowing_text:1b,messages:[\'{"text":"[ VỀ SẢNH BOSS ]","color":"gold","bold":true}\',\'{"text":"Sảnh Chỉ Huy","color":"yellow"}\',\'{"text":"Dẫm lên bệ","color":"gray"}\',\'{"text":"để hạ giới!","color":"aqua"}\']}}')

    # 8. HỆ THỐNG ĐẠI LỘ CẦU NỐI KIÊN CỐ (GRAND CAUSEWAYS & BRIDGES 5-7 BLOCKS CÓ LAN CAN & ĐÈN)
    cmds.append("# 8. HỆ THỐNG ĐẠI LỘ CẦU NỐI KIÊN CỐ (GRAND CAUSEWAYS & BRIDGES)")
    # 8.1 Đại Lộ Bắc nối xuống Đấu Trường 5 (Y=110..75)
    cmds.extend(gen_north_causeway())
    # 8.2 Bốn Đại Lộ Chéo nối ra Đấu Trường 1, 2, 3, 4 (Y=110..100)
    cmds.extend(gen_diagonal_bridge(-1, -1, "Tây Bắc -> Đấu Trường 1 (Hang Nhện)"))
    cmds.extend(gen_diagonal_bridge(1, -1, "Đông Bắc -> Đấu Trường 2 (Vực Lửa)"))
    cmds.extend(gen_diagonal_bridge(-1, 1, "Tây Nam -> Đấu Trường 3 (Điện Thờ Hắc Ám)"))
    cmds.extend(gen_diagonal_bridge(1, 1, "Đông Nam -> Đấu Trường 4 (Phế Tích Hư Không)"))

    # 8.3 Đại Lộ Vọng Cảnh Nam, Đông, Tây
    # Nam
    cmds.append("# 8.3 Đại Lộ Vọng Cảnh Nam")
    cmds.append("fill -2 110 25 2 110 65 polished_blackstone_bricks")
    cmds.append("fill -3 111 25 -3 111 65 polished_blackstone_brick_wall")
    cmds.append("fill 3 111 25 3 111 65 polished_blackstone_brick_wall")
    cmds.append("setblock -3 112 45 soul_lantern[hanging=false]")
    cmds.append("setblock 3 112 45 soul_lantern[hanging=false]")
    cmds.append("fill -4 110 65 4 110 70 gilded_blackstone")
    cmds.append("setblock 0 111 67 beacon")
    # Đông
    cmds.append("# 8.4 Đại Lộ Vọng Cảnh Đông")
    cmds.append("fill 25 110 -2 65 110 2 polished_blackstone_bricks")
    cmds.append("fill 25 111 -3 65 111 -3 polished_blackstone_brick_wall")
    cmds.append("fill 25 111 3 65 111 3 polished_blackstone_brick_wall")
    cmds.append("setblock 45 112 -3 soul_lantern[hanging=false]")
    cmds.append("setblock 45 112 3 soul_lantern[hanging=false]")
    cmds.append("fill 65 110 -4 70 110 4 gilded_blackstone")
    cmds.append("setblock 67 111 0 beacon")
    # Tây
    cmds.append("# 8.5 Đại Lộ Vọng Cảnh Tây")
    cmds.append("fill -65 110 -2 -25 110 2 polished_blackstone_bricks")
    cmds.append("fill -65 111 -3 -25 111 -3 polished_blackstone_brick_wall")
    cmds.append("fill -65 111 3 -25 111 3 polished_blackstone_brick_wall")
    cmds.append("setblock -45 112 -3 soul_lantern[hanging=false]")
    cmds.append("setblock -45 112 3 soul_lantern[hanging=false]")
    cmds.append("fill -70 110 -4 -65 110 4 gilded_blackstone")
    cmds.append("setblock -67 111 0 beacon")

    cmds.append('tellraw @a [{"text":"[Kiến Trúc Sư] ","color":"gold","bold":true},{"text":"Vực Thẳm 6 Đại Đấu Trường Boss Cổ Đại (1000x1000) đã thức tỉnh hoàn tất!","color":"green","bold":true}]')
    return "\n".join(cmds)

lines = generate_world_boss_1000().split("\n")
print(f"Total commands in world_boss_1000: {len(lines)}")
