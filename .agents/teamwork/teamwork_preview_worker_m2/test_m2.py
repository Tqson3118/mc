# -*- coding: utf-8 -*-
import os, sys, yaml

os.chdir(r"C:\Users\Administrator\.gemini\antigravity\scratch\Skyblock-Server")

# 1. Warps verification
expected_warps = {
    'plugins/Essentials/warps/boss1.yml': {'world': 'world', 'x': -18.5, 'y': 111.0, 'z': 75.5, 'yaw': 90.0, 'pitch': 0.0, 'name': 'boss1'},
    'plugins/Essentials/warps/boss2.yml': {'world': 'world', 'x': 18.5, 'y': 111.0, 'z': 75.5, 'yaw': -90.0, 'pitch': 0.0, 'name': 'boss2'},
    'plugins/Essentials/warps/boss3.yml': {'world': 'world', 'x': 0.5, 'y': 111.0, 'z': 101.5, 'yaw': 0.0, 'pitch': 0.0, 'name': 'boss3'},
    'plugins/Essentials/warps/boss4.yml': {'world': 'world', 'x': -25.5, 'y': 111.0, 'z': 102.5, 'yaw': 90.0, 'pitch': 0.0, 'name': 'boss4'}
}

for path, exp in expected_warps.items():
    with open(path, 'r', encoding='utf-8') as f:
        data = yaml.safe_load(f)
    assert data == exp, f'{path} content mismatch: {data} vs {exp}'
print('Check 1 (Warps): PASS')

# 2. commands.yml verification
with open('commands.yml', 'r', encoding='utf-8') as f:
    cmd_data = yaml.safe_load(f)
aliases = cmd_data.get('aliases', {})
for k in ['boss1', 'boss2', 'boss3', 'boss4', 'dongnhen', 'vuclua', 'thanhtri', 'hukhong']:
    assert k in aliases, f'Missing alias {k}'
assert aliases['boss1'] == ['warp boss1 $1-'], f"boss1 was {aliases['boss1']}"
assert aliases['dongnhen'] == ['warp boss1 $1-'], f"dongnhen was {aliases['dongnhen']}"
assert aliases['boss2'] == ['warp boss2 $1-'], f"boss2 was {aliases['boss2']}"
assert aliases['vuclua'] == ['warp boss2 $1-'], f"vuclua was {aliases['vuclua']}"
assert aliases['boss3'] == ['warp boss3 $1-'], f"boss3 was {aliases['boss3']}"
assert aliases['thanhtri'] == ['warp boss3 $1-'], f"thanhtri was {aliases['thanhtri']}"
assert aliases['boss4'] == ['warp boss4 $1-'], f"boss4 was {aliases['boss4']}"
assert aliases['hukhong'] == ['warp boss4 $1-'], f"hukhong was {aliases['hukhong']}"
print('Check 2 (Aliases): PASS')

# 3. hunter_menu.mcfunction
with open('world/datapacks/skyblock_spawn/data/skyblock/function/boss/hunter_menu.mcfunction', 'r', encoding='utf-8') as f:
    menu = f.read()
assert '/warp boss1' in menu, "Missing /warp boss1 in hunter_menu"
assert '/warp boss2' in menu, "Missing /warp boss2 in hunter_menu"
assert '/warp boss3' in menu, "Missing /warp boss3 in hunter_menu"
assert '/warp boss4' in menu, "Missing /warp boss4 in hunter_menu"
print('Check 3 (Hunter Menu): PASS')

# 4. build_boss_multi.mcfunction
with open('world/datapacks/skyblock_spawn/data/skyblock/function/build_boss_multi.mcfunction', 'r', encoding='utf-8') as f:
    build = f.read()
assert 'boss_hunter_npc' in build, "Missing boss_hunter_npc"
assert 'boss_hunter_interact' in build, "Missing boss_hunter_interact"
assert 'boss_hunter_hologram' in build, "Missing boss_hunter_hologram"
assert '0.5 111 61.5' in build, "Missing 0.5 111 61.5"
assert 'teleport @p 0.5 111.0 58.0 0.0 0.0' in build, "Missing return teleport"
assert 'setblock -13 113 60 oak_wall_sign' in build, "Missing sign boss 1"
assert 'setblock 13 113 60 oak_wall_sign' in build, "Missing sign boss 2"
assert 'setblock -1 113 69 oak_wall_sign' in build, "Missing sign boss 3"
assert 'setblock -13 113 66 oak_wall_sign' in build, "Missing sign boss 4"
print('Check 4 (build_boss_multi): PASS')

# 5. tick.mcfunction
with open('world/datapacks/skyblock_spawn/data/skyblock/function/tick.mcfunction', 'r', encoding='utf-8') as f:
    tick = f.read()
assert 'execute as @e[type=interaction,tag=boss_hunter_interact]' in tick
assert 'run function skyblock:boss/hunter_menu' in tick
assert 'run teleport @s 0.5 111.0 58.0 0.0 0.0' in tick
assert 'x=-19,y=110,z=74' in tick
assert 'x=18,y=110,z=74' in tick
assert 'x=2,y=110,z=101' in tick
assert 'x=-26,y=110,z=101' in tick
print('Check 5 (tick.mcfunction): PASS')

# 6. summon and defeated status signs
for i, coord in [(1, '-13 113 60'), (2, '13 113 60'), (3, '-1 113 69'), (4, '-13 113 66')]:
    s_path = f'world/datapacks/skyblock_spawn/data/skyblock/function/summon_boss_{i}.mcfunction'
    d_path = f'world/datapacks/skyblock_spawn/data/skyblock/function/boss/boss_{i}_defeated.mcfunction'
    with open(s_path, 'r', encoding='utf-8') as f: s_text = f.read()
    with open(d_path, 'r', encoding='utf-8') as f: d_text = f.read()
    assert coord in s_text and '☠ ĐANG CHIẾN ĐẤU' in s_text, f'summon_boss_{i} missing status update'
    assert coord in d_text and '● SẴN SÀNG' in d_text, f'boss_{i}_defeated missing status update'
print('Check 6 (Summon & Defeated signs): PASS')

# 7. Syntax and Bracket checks for all 11 M2 files
m2_files = [
    'build_boss_multi.mcfunction',
    'boss/hunter_menu.mcfunction',
    'summon_boss_1.mcfunction',
    'summon_boss_2.mcfunction',
    'summon_boss_3.mcfunction',
    'summon_boss_4.mcfunction',
    'boss/boss_1_defeated.mcfunction',
    'boss/boss_2_defeated.mcfunction',
    'boss/boss_3_defeated.mcfunction',
    'boss/boss_4_defeated.mcfunction',
    'tick.mcfunction'
]
base = r'world\datapacks\skyblock_spawn\data\skyblock\function'
for rel in m2_files:
    filepath = os.path.join(base, rel)
    with open(filepath, 'r', encoding='utf-8') as f:
        lines = f.readlines()
    for i, line in enumerate(lines, 1):
        line = line.strip()
        if not line or line.startswith('#'): continue
        curly = line.count('{') - line.count('}')
        square = line.count('[') - line.count(']')
        quotes = line.count(chr(39))
        assert curly == 0, f'{rel}:{i} Curly mismatch ({curly})'
        assert square == 0, f'{rel}:{i} Square mismatch ({square})'
        assert quotes % 2 == 0, f'{rel}:{i} Quote mismatch ({quotes})'
print('Check 7 (M2 mcfunction syntax): PASS')

print('=== ALL M2 VERIFICATION CHECKS PASSED 100% PERFECTLY! ===')
