# -*- coding: utf-8 -*-
import os, sys, yaml

os.chdir(r"C:\Users\Administrator\.gemini\antigravity\scratch\Skyblock-Server")

# Simulate generate_all with proposed replacements
with open("generate_all.py", "r", encoding="utf-8") as f:
    gen_code = f.read()

setup_target = 'scoreboard objectives add setup trigger {"text":"Cài Đặt Lại Hệ Thống","color":"green"}'
setup_replacement = 'scoreboard objectives add setup trigger {"text":"Cài Đặt Lại Hệ Thống","color":"green"}\nscoreboard objectives add huongdan trigger {"text":"Hướng Dẫn Tân Thủ","color":"gold"}'
gen_code = gen_code.replace(setup_target, setup_replacement, 1)

tick_target = 'scoreboard players enable @a setup'
tick_replacement = "scoreboard players enable @a setup\nscoreboard players enable @a huongdan"
gen_code = gen_code.replace(tick_target, tick_replacement, 1)

tick_target_exec = """# Khi nguoi choi go /trigger setup (kich hoat cai dat lai he thong)
execute as @a[scores={setup=1..}] at @s run function skyblock:setup
scoreboard players set @a[scores={setup=1..}] setup 0"""

tick_replacement_exec = """# Khi nguoi choi go /trigger setup (kich hoat cai dat lai he thong)
execute as @a[scores={setup=1..}] at @s run function skyblock:setup
scoreboard players set @a[scores={setup=1..}] setup 0

# Khi nguoi choi go /huongdan hoac /guide (kich hoat trigger huongdan >= 1)
execute as @a[scores={huongdan=1..}] at @s run function skyblock:guide/menu
scoreboard players set @a[scores={huongdan=1..}] huongdan 0

# ==============================================================================
# HỆ THỐNG TƯƠNG TÁC NPC & DỊCH CHUYỂN AN TOÀN (M2 & M5)
# ==============================================================================

# Tương tác NPC Thợ Săn Boss (Milestone M2)
execute as @e[type=interaction,tag=boss_hunter_interact] if data entity @s interaction on target run function skyblock:boss/hunter_menu
execute as @e[type=interaction,tag=boss_hunter_interact] run data remove entity @s interaction

# Tương tác NPC Hướng Dẫn Viên Tân Thủ (Milestone M5)
execute as @e[type=interaction,tag=guide_interact] if data entity @s interaction on target run function skyblock:guide/menu
execute as @e[type=interaction,tag=guide_interact] run data remove entity @s interaction

# Bệ Dịch Chuyển Rút Lui Khẩn Cấp 4 Đấu Trường Boss (Milestone M2 Fail-Safe)
execute in minecraft:overworld as @a[x=-19,y=110,z=74,dx=1,dy=2,dz=1] run teleport @s 0.5 111.0 58.0 0.0 0.0
execute in minecraft:overworld as @a[x=18,y=110,z=74,dx=1,dy=2,dz=1] run teleport @s 0.5 111.0 58.0 0.0 0.0
execute in minecraft:overworld as @a[x=2,y=110,z=101,dx=1,dy=2,dz=1] run teleport @s 0.5 111.0 58.0 0.0 0.0
execute in minecraft:overworld as @a[x=-26,y=110,z=101,dx=1,dy=2,dz=1] run teleport @s 0.5 111.0 58.0 0.0 0.0"""

gen_code = gen_code.replace(tick_target_exec, tick_replacement_exec, 1)

# Execute the code in isolated namespace
ns = {}
exec(gen_code, ns)

# Extract simulated setup and tick functions content
import tempfile
temp_dir = tempfile.mkdtemp()
ns["BASE_DIR"] = temp_dir
ns["update_setup_mcfunction"]()
ns["update_tick_mcfunction"]()

sim_setup = open(os.path.join(temp_dir, "setup.mcfunction"), "r", encoding="utf-8").read()
sim_tick = open(os.path.join(temp_dir, "tick.mcfunction"), "r", encoding="utf-8").read()

# Verify M2 checks against sim_tick
assert 'execute as @e[type=interaction,tag=boss_hunter_interact]' in sim_tick
assert 'run function skyblock:boss/hunter_menu' in sim_tick
assert 'run teleport @s 0.5 111.0 58.0 0.0 0.0' in sim_tick
assert 'x=-19,y=110,z=74' in sim_tick
assert 'x=18,y=110,z=74' in sim_tick
assert 'x=2,y=110,z=101' in sim_tick
assert 'x=-26,y=110,z=101' in sim_tick
print("[PASS] All M2 tick checks satisfied by simulated generate_all.py!")

# Verify M5 checks against sim_setup and sim_tick
assert 'scoreboard objectives add huongdan trigger' in sim_setup
assert 'scoreboard players enable @a huongdan' in sim_tick
assert 'execute as @a[scores={huongdan=1..}] at @s run function skyblock:guide/menu' in sim_tick
assert 'execute as @e[type=interaction,tag=guide_interact]' in sim_tick
print("[PASS] All M5 setup & tick checks satisfied by simulated generate_all.py!")

# Verify syntax on sim_setup and sim_tick
for name, content in [("setup.mcfunction", sim_setup), ("tick.mcfunction", sim_tick)]:
    for i, line in enumerate(content.splitlines(), 1):
        line = line.strip()
        if not line or line.startswith("#"): continue
        curly = line.count("{") - line.count("}")
        square = line.count("[") - line.count("]")
        quotes = line.count("'")
        assert curly == 0, f"{name}:{i} Curly mismatch ({curly})"
        assert square == 0, f"{name}:{i} Square mismatch ({square})"
        assert quotes % 2 == 0, f"{name}:{i} Quote mismatch ({quotes})"
print("[PASS] Syntax & bracket verification passed on generated setup and tick mcfunction!")
