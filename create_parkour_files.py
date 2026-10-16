import os

base = r"C:\Users\Administrator\.gemini\antigravity\scratch\Skyblock-Server\world\datapacks\skyblock_spawn\data\skyblock\function\parkour"
os.makedirs(base, exist_ok=True)

cps = {
    "cp1.mcfunction": """scoreboard players set @s parkour_cp 1
playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1.0 1.5
playsound minecraft:block.amethyst_block.hit player @s ~ ~ ~ 1.5 1.8
title @s actionbar {"text":"🚩 ĐÃ LƯU CHECKPOINT 1 (TẦNG 10) 🚩","color":"green","bold":true}
""",
    "cp2.mcfunction": """scoreboard players set @s parkour_cp 2
playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1.0 1.5
playsound minecraft:block.amethyst_block.hit player @s ~ ~ ~ 1.5 1.8
title @s actionbar {"text":"🚩 ĐÃ LƯU CHECKPOINT 2 (TẦNG 20) 🚩","color":"green","bold":true}
""",
    "cp3.mcfunction": """scoreboard players set @s parkour_cp 3
playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1.0 1.5
playsound minecraft:block.amethyst_block.hit player @s ~ ~ ~ 1.5 1.8
title @s actionbar {"text":"🚩 ĐÃ LƯU CHECKPOINT 3 (TẦNG 30) 🚩","color":"green","bold":true}
""",
    "cp4.mcfunction": """scoreboard players set @s parkour_cp 4
playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1.0 1.5
playsound minecraft:block.amethyst_block.hit player @s ~ ~ ~ 1.5 1.8
title @s actionbar {"text":"🚩 ĐÃ LƯU CHECKPOINT 4 (TẦNG 40) 🚩","color":"green","bold":true}
""",
    "cp5.mcfunction": """scoreboard players set @s parkour_cp 5
playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1.0 1.5
playsound minecraft:block.amethyst_block.hit player @s ~ ~ ~ 1.5 1.8
title @s actionbar {"text":"🚩 ĐÃ LƯU CHECKPOINT 5 (TẦNG 50 - TIỀN SẢNH ĐỈNH THÁP) 🚩","color":"gold","bold":true}
""",
    "rescue_start.mcfunction": """teleport @s 0.5 71.0 0.5 0 0
playsound minecraft:entity.enderman.teleport player @s ~ ~ ~ 1.5 1.0
effect give @s minecraft:slow_falling 3 0 true
title @s actionbar {"text":"🛡️ CỨU HỘ RƠI VỰC! Đã đưa bạn về Đài Xuất Phát.","color":"yellow","bold":true}
""",
    "rescue_cp1.mcfunction": """teleport @s 3.5 101.0 -15.5 0 0
playsound minecraft:entity.enderman.teleport player @s ~ ~ ~ 1.5 1.0
effect give @s minecraft:slow_falling 3 0 true
title @s actionbar {"text":"🛡️ CỨU HỘ RƠI VỰC! Đã đưa bạn về Checkpoint 1 (Tầng 10).","color":"green","bold":true}
""",
    "rescue_cp2.mcfunction": """teleport @s -14.5 131.0 -4.5 0 0
playsound minecraft:entity.enderman.teleport player @s ~ ~ ~ 1.5 1.0
effect give @s minecraft:slow_falling 3 0 true
title @s actionbar {"text":"🛡️ CỨU HỘ RƠI VỰC! Đã đưa bạn về Checkpoint 2 (Tầng 20).","color":"green","bold":true}
""",
    "rescue_cp3.mcfunction": """teleport @s -7.5 161.0 14.5 0 0
playsound minecraft:entity.enderman.teleport player @s ~ ~ ~ 1.5 1.0
effect give @s minecraft:slow_falling 3 0 true
title @s actionbar {"text":"🛡️ CỨU HỘ RƠI VỰC! Đã đưa bạn về Checkpoint 3 (Tầng 30).","color":"green","bold":true}
""",
    "rescue_cp4.mcfunction": """teleport @s 12.5 191.0 10.5 0 0
playsound minecraft:entity.enderman.teleport player @s ~ ~ ~ 1.5 1.0
effect give @s minecraft:slow_falling 3 0 true
title @s actionbar {"text":"🛡️ CỨU HỘ RƠI VỰC! Đã đưa bạn về Checkpoint 4 (Tầng 40).","color":"green","bold":true}
""",
    "rescue_cp5.mcfunction": """teleport @s 12.5 221.0 -9.5 0 0
playsound minecraft:entity.enderman.teleport player @s ~ ~ ~ 1.5 1.0
effect give @s minecraft:slow_falling 3 0 true
title @s actionbar {"text":"🛡️ CỨU HỘ RƠI VỰC! Đã đưa bạn về Checkpoint 5 (Tầng 50).","color":"green","bold":true}
"""
}

for fname, content in cps.items():
    p = os.path.join(base, fname)
    with open(p, "w", encoding="utf-8") as f:
        f.write(content)
    print(f"Created {fname}")

print("All parkour functions written successfully!")
