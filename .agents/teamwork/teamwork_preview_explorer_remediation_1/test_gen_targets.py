# -*- coding: utf-8 -*-
import os, sys

os.chdir(r"C:\Users\Administrator\.gemini\antigravity\scratch\Skyblock-Server")

# Read current generate_all.py
with open("generate_all.py", "r", encoding="utf-8") as f:
    gen_code = f.read()

# Check update_setup_mcfunction
setup_target = 'scoreboard objectives add setup trigger {"text":"Cài Đặt Lại Hệ Thống","color":"green"}'
setup_replacement = 'scoreboard objectives add setup trigger {"text":"Cài Đặt Lại Hệ Thống","color":"green"}\nscoreboard objectives add huongdan trigger {"text":"Hướng Dẫn Tân Thủ","color":"gold"}'

assert setup_target in gen_code, "setup_target not found in generate_all.py"

# Check update_tick_mcfunction
tick_target = 'scoreboard players enable @a setup'
tick_replacement = """scoreboard players enable @a setup
scoreboard players enable @a huongdan"""

assert tick_target in gen_code, "tick_target not found in generate_all.py"

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

assert tick_target_exec in gen_code, "tick_target_exec not found in generate_all.py"

print("All targets for generate_all.py found and verified successfully!")
