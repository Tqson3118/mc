# -*- coding: utf-8 -*-
"""
Patch for Cụm 2: Fixing lore, boss reward atomicity, and multiworld generation.
"""
import os
import re

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
DATAPACK_FUNC = os.path.join(BASE_DIR, 'world', 'datapacks', 'skyblock_spawn', 'data', 'skyblock', 'function')
BOSS_DIR = os.path.join(DATAPACK_FUNC, 'boss')

def patch_daemon():
    path = os.path.join(BASE_DIR, 'skyblock_economy_daemon.py')
    with open(path, 'r', encoding='utf-8') as f:
        content = f.read()

    content = content.replace('TIER 16 - 18!', 'TIER 15 VĨNH CỬU!')
    content = content.replace('"desc": "Nguyên liệu Đột Phá Bậc 16 - 18"', '"desc": "Nguyên liệu Đột Phá Bậc 15 Vĩnh Cửu"')
    content = content.replace('TIER 19 - 20 [MAX]!', 'TIER 15 [MAX VĨNH CỬU]!')
    content = content.replace('"desc": "Nguyên liệu Đột Phá Bậc 19 - 20 [MAX]"', '"desc": "Thánh Vật Sáng Thế Bậc 15 [MAX Vĩnh Cửu]"')

    with open(path, 'w', encoding='utf-8') as f:
        f.write(content)
    print("Daemon patched.")

def patch_deluxemenus():
    path = os.path.join(BASE_DIR, 'plugins', 'DeluxeMenus', 'gui_menus', 'nangcap.yml')
    with open(path, 'r', encoding='utf-8') as f:
        content = f.read()

    content = content.replace("&7Nguyên liệu ĐỘT PHÁ THẦN THOẠI mốc Tier 16 - 18", "&7Nguyên liệu ĐỘT PHÁ THẦN THOẠI mốc Tier 15 Vĩnh Cửu")
    content = content.replace("&7Nguyên liệu SÁNG THẾ TỐI CAO mốc Tier 19 - 20 [MAX]", "&7Nguyên liệu SÁNG THẾ TỐI CAO mốc Tier 15 [MAX Vĩnh Cửu]")

    with open(path, 'w', encoding='utf-8') as f:
        f.write(content)
    print("DeluxeMenus nangcap.yml patched.")

def patch_dungeon_boss():
    path = os.path.join(BOSS_DIR, 'dungeon_boss_defeated.mcfunction')
    with open(path, 'r', encoding='utf-8') as f:
        content = f.read()

    content = content.replace('Tier 16-18', 'Tier 15 Vĩnh Cửu')
    content = content.replace('Tier 19-20', 'Tier 15 [MAX Vĩnh Cửu]')

    with open(path, 'w', encoding='utf-8') as f:
        f.write(content)
    print("dungeon_boss_defeated.mcfunction patched.")

def patch_generate_all():
    path = os.path.join(BASE_DIR, 'generate_all.py')
    with open(path, 'r', encoding='utf-8') as f:
        code = f.read()

    # In s5: add explicit world_boss kill commands and remove broken unconditional summon
    old_s5_kill = '''scoreboard players set #boss_5_alive boss_status 0
kill @e[tag=boss_5]
kill @e[tag=minion_boss_5]'''

    new_s5_kill = '''scoreboard players set #boss_5_alive boss_status 0
execute in minecraft:world_boss run kill @e[tag=boss_5]
execute in minecraft:world_boss run kill @e[tag=minion_boss_5]
execute in minecraft:overworld run kill @e[tag=boss_5]
execute in minecraft:overworld run kill @e[tag=minion_boss_5]'''

    old_s6_kill = '''scoreboard players set #boss_6_alive boss_status 0
kill @e[tag=boss_6]
kill @e[tag=minion_boss_6]'''

    new_s6_kill = '''scoreboard players set #boss_6_alive boss_status 0
execute in minecraft:world_boss run kill @e[tag=boss_6]
execute in minecraft:world_boss run kill @e[tag=minion_boss_6]
execute in minecraft:overworld run kill @e[tag=boss_6]
execute in minecraft:overworld run kill @e[tag=minion_boss_6]'''

    code = code.replace(old_s5_kill, new_s5_kill)
    code = code.replace(old_s6_kill, new_s6_kill)

    # In b5_def: make reward atomic using scoreboard flag #boss_5_rewarded
    old_b5_def = '''    b5_def = """scoreboard players set #boss_5_alive boss_status 0

# 1. Tìm người chơi trong world_boss tại Đấu Trường 5 (0, 75, -300)
execute in minecraft:world_boss as @p[x=-45,y=65,z=-345,dx=90,dy=35,dz=90] at @s run function skyblock:boss/announce_boss_5
execute in minecraft:world_boss unless entity @p[x=-45,y=65,z=-345,dx=90,dy=35,dz=90] as @p[x=0,y=75,z=-300,distance=..60] at @s run function skyblock:boss/announce_boss_5

# 2. Tìm người chơi trong overworld tại Thâm Uyên Cổ Điện (35, 111, 115)
execute in minecraft:overworld as @p[x=23,y=108,z=98,dx=24,dy=20,dz=34] at @s run function skyblock:boss/announce_boss_5
execute in minecraft:overworld unless entity @p[x=23,y=108,z=98,dx=24,dy=20,dz=34] as @p[x=35,y=111,z=115,distance=..45] at @s run function skyblock:boss/announce_boss_5

# 3. Dự phòng bất kỳ người chơi nào gần nhất
execute unless entity @p[x=0,y=75,z=-300,distance=..60] unless entity @p[x=35,y=111,z=115,distance=..45] as @p at @s run function skyblock:boss/announce_boss_5
"""'''

    new_b5_def = '''    b5_def = """scoreboard players set #boss_5_alive boss_status 0
scoreboard players set #boss_5_rewarded boss_status 0

# 1. Tìm người chơi trong world_boss tại Đấu Trường 5 (0, 75, -300)
execute in minecraft:world_boss as @p[x=-45,y=65,z=-345,dx=90,dy=35,dz=90] at @s run function skyblock:boss/announce_boss_5
execute if score #boss_5_rewarded boss_status matches 0 in minecraft:world_boss as @p[x=0,y=75,z=-300,distance=..60] at @s run function skyblock:boss/announce_boss_5

# 2. Tìm người chơi trong overworld tại Thâm Uyên Cổ Điện (35, 111, 115) nếu chưa trao trong world_boss
execute if score #boss_5_rewarded boss_status matches 0 in minecraft:overworld as @p[x=23,y=108,z=98,dx=24,dy=20,dz=34] at @s run function skyblock:boss/announce_boss_5
execute if score #boss_5_rewarded boss_status matches 0 in minecraft:overworld as @p[x=35,y=111,z=115,distance=..45] at @s run function skyblock:boss/announce_boss_5

# 3. Dự phòng bất kỳ người chơi nào gần nhất nếu chưa trao thưởng
execute if score #boss_5_rewarded boss_status matches 0 in minecraft:world_boss as @p[distance=..200] at @s run function skyblock:boss/announce_boss_5
execute if score #boss_5_rewarded boss_status matches 0 as @p at @s run function skyblock:boss/announce_boss_5
"""'''

    code = code.replace(old_b5_def, new_b5_def)

    # In ann5: add scoreboard players set #boss_5_rewarded boss_status 1
    old_ann5_reward = '''scoreboard players add @s eco_add 35000
scoreboard players add @s gems_add 300
execute as @a[distance=1..60] at @s run function skyblock:boss/party_reward_boss_5'''

    new_ann5_reward = '''scoreboard players add @s eco_add 35000
scoreboard players add @s gems_add 300
scoreboard players set #boss_5_rewarded boss_status 1
execute as @a[distance=1..60] at @s run function skyblock:boss/party_reward_boss_5'''

    code = code.replace(old_ann5_reward, new_ann5_reward)

    # In b6_def: make reward atomic using scoreboard flag #boss_6_rewarded
    old_b6_def = '''    b6_def = """scoreboard players set #boss_6_alive boss_status 0

# 1. Tìm người chơi trong world_boss tại Đấu Trường 6 (0, 241, 0)
execute in minecraft:world_boss as @p[x=-50,y=230,z=-50,dx=100,dy=40,dz=100] at @s run function skyblock:boss/announce_boss_6
execute in minecraft:world_boss unless entity @p[x=-50,y=230,z=-50,dx=100,dy=40,dz=100] as @p[x=0,y=241,z=0,distance=..70] at @s run function skyblock:boss/announce_boss_6

# 2. Tìm người chơi trong overworld tại Thiên Cung (0, 137, 115)
execute in minecraft:overworld as @p[x=-20,y=134,z=98,dx=40,dy=25,dz=34] at @s run function skyblock:boss/announce_boss_6
execute in minecraft:overworld unless entity @p[x=-20,y=134,z=98,dx=40,dy=25,dz=34] as @p[x=0,y=137,z=115,distance=..50] at @s run function skyblock:boss/announce_boss_6

# 3. Dự phòng bất kỳ người chơi nào gần nhất
execute unless entity @p[x=0,y=241,z=0,distance=..70] unless entity @p[x=0,y=137,z=115,distance=..50] as @p at @s run function skyblock:boss/announce_boss_6
"""'''

    new_b6_def = '''    b6_def = """scoreboard players set #boss_6_alive boss_status 0
scoreboard players set #boss_6_rewarded boss_status 0

# 1. Tìm người chơi trong world_boss tại Đấu Trường 6 (0, 241, 0)
execute in minecraft:world_boss as @p[x=-50,y=230,z=-50,dx=100,dy=40,dz=100] at @s run function skyblock:boss/announce_boss_6
execute if score #boss_6_rewarded boss_status matches 0 in minecraft:world_boss as @p[x=0,y=241,z=0,distance=..70] at @s run function skyblock:boss/announce_boss_6

# 2. Tìm người chơi trong overworld tại Thiên Cung (0, 137, 115) nếu chưa trao trong world_boss
execute if score #boss_6_rewarded boss_status matches 0 in minecraft:overworld as @p[x=-20,y=134,z=98,dx=40,dy=25,dz=34] at @s run function skyblock:boss/announce_boss_6
execute if score #boss_6_rewarded boss_status matches 0 in minecraft:overworld as @p[x=0,y=137,z=115,distance=..50] at @s run function skyblock:boss/announce_boss_6

# 3. Dự phòng bất kỳ người chơi nào gần nhất nếu chưa trao thưởng
execute if score #boss_6_rewarded boss_status matches 0 in minecraft:world_boss as @p[distance=..200] at @s run function skyblock:boss/announce_boss_6
execute if score #boss_6_rewarded boss_status matches 0 as @p at @s run function skyblock:boss/announce_boss_6
"""'''

    code = code.replace(old_b6_def, new_b6_def)

    # In ann6: add scoreboard players set #boss_6_rewarded boss_status 1
    old_ann6_reward = '''scoreboard players add @s eco_add 75000
scoreboard players add @s gems_add 500
execute as @a[distance=1..60] at @s run function skyblock:boss/party_reward_boss_6'''

    new_ann6_reward = '''scoreboard players add @s eco_add 75000
scoreboard players add @s gems_add 500
scoreboard players set #boss_6_rewarded boss_status 1
execute as @a[distance=1..60] at @s run function skyblock:boss/party_reward_boss_6'''

    code = code.replace(old_ann6_reward, new_ann6_reward)

    with open(path, 'w', encoding='utf-8') as f:
        f.write(code)
    print("generate_all.py patched.")

def patch_boss_1_to_4():
    # Make boss 1-4 defeated also atomic with #boss_X_rewarded flag
    for b in range(1, 5):
        def_file = os.path.join(BOSS_DIR, f'boss_{b}_defeated.mcfunction')
        ann_file = os.path.join(BOSS_DIR, f'announce_boss_{b}.mcfunction')
        if not os.path.isfile(def_file) or not os.path.isfile(ann_file):
            continue

        with open(def_file, 'r', encoding='utf-8') as f:
            d_content = f.read()

        if f'#boss_{b}_rewarded' not in d_content:
            d_lines = d_content.splitlines()
            new_lines = []
            for line in d_lines:
                if f'scoreboard players set #boss_{b}_alive boss_status 0' in line:
                    new_lines.append(line)
                    new_lines.append(f'scoreboard players set #boss_{b}_rewarded boss_status 0')
                elif 'execute in minecraft:overworld' in line:
                    new_lines.append(line.replace('execute in minecraft:overworld', f'execute if score #boss_{b}_rewarded boss_status matches 0 in minecraft:overworld'))
                elif 'execute unless entity' in line and f'announce_boss_{b}' in line:
                    new_lines.append(f'execute if score #boss_{b}_rewarded boss_status matches 0 in minecraft:world_boss as @p[distance=..200] at @s run function skyblock:boss/announce_boss_{b}')
                    new_lines.append(f'execute if score #boss_{b}_rewarded boss_status matches 0 as @p at @s run function skyblock:boss/announce_boss_{b}')
                else:
                    new_lines.append(line)
            with open(def_file, 'w', encoding='utf-8') as f:
                f.write('\n'.join(new_lines) + '\n')
            print(f"boss_{b}_defeated.mcfunction patched.")

        with open(ann_file, 'r', encoding='utf-8') as f:
            a_content = f.read()
        if f'#boss_{b}_rewarded' not in a_content:
            target = f'scoreboard players add @s gems_add'
            replacement = f'scoreboard players add @s gems_add'
            # Insert flag after gems_add line
            lines = a_content.splitlines()
            new_a_lines = []
            for line in lines:
                new_a_lines.append(line)
                if 'scoreboard players add @s gems_add' in line:
                    new_a_lines.append(f'scoreboard players set #boss_{b}_rewarded boss_status 1')
            with open(ann_file, 'w', encoding='utf-8') as f:
                f.write('\n'.join(new_a_lines) + '\n')
            print(f"announce_boss_{b}.mcfunction patched.")

def patch_generate_multiworld():
    path = os.path.join(BASE_DIR, 'generate_multiworld_1000x1000.py')
    with open(path, 'r', encoding='utf-8') as f:
        code = f.read()

    # 1. Boss 2: Thêm thác dung nham gián cách quanh sườn nón basalt
    old_b2_marker = '    # 6 Cột Dung Nham An Toàn (Lava Columns encased in tinted glass)'
    new_b2_block = '''    # Thác dung nham gián cách 3D quanh sườn vách basalt (Y=98..82)
    for deg in [30, 120, 210, 300]:
        rad = math.radians(deg)
        fx = int(round(180 + 33 * math.cos(rad)))
        fz = int(round(-180 + 33 * math.sin(rad)))
        cmds.append(f"setblock {fx} 99 {fz} crying_obsidian")
        cmds.append(f"fill {fx} 85 {fz} {fx} 98 {fz} lava")
        cmds.append(f"fill {fx-1} 84 {fz-1} {fx+1} 84 {fz+1} crying_obsidian")
        cmds.append(f"setblock {fx} 84 {fz} magma_block")

    # 6 Cột Dung Nham An Toàn (Lava Columns encased in tinted glass)'''

    if 'Thác dung nham gián cách' not in code:
        code = code.replace(old_b2_marker, new_b2_block)

    # 2. Boss 3: Thêm ngọn đuốc linh hồn soul_torch
    old_b3_marker = '    # 8 Trụ Cột Gothic với Ngọn Đuốc / Lửa Linh Hồn'
    new_b3_block = '''    # 8 Bệ Tế Ngọn Đuốc Linh Hồn (soul_torch) vòng trong
    for deg in range(22, 360, 45):
        rad = math.radians(deg)
        bx = int(round(-180 + 20 * math.cos(rad)))
        bz = int(round(180 + 20 * math.sin(rad)))
        cmds.append(f"setblock {bx} 101 {bz} crying_obsidian")
        cmds.append(f"setblock {bx} 102 {bz} soul_torch")

    # 8 Trụ Cột Gothic với Ngọn Đuốc / Lửa Linh Hồn'''

    if 'soul_torch' not in code:
        code = code.replace(old_b3_marker, new_b3_block)

    with open(path, 'w', encoding='utf-8') as f:
        f.write(code)
    print("generate_multiworld_1000x1000.py patched.")

if __name__ == '__main__':
    patch_daemon()
    patch_deluxemenus()
    patch_dungeon_boss()
    patch_generate_all()
    patch_boss_1_to_4()
    patch_generate_multiworld()
    print("ALL PATCHES APPLIED.")
