# Cổng Dịch Chuyển Quay Về Spawn Hub (minecraft:overworld)
execute at @s run playsound minecraft:block.portal.travel player @s ~ ~ ~ 1.2 1.2
execute at @s run playsound minecraft:block.amethyst_block.chime player @s ~ ~ ~ 2.0 1.5
execute at @s run particle portal ~ ~1 ~ 1 1 1 0.2 80 normal
execute at @s run particle end_rod ~ ~1 ~ 1 1 1 0.1 50 normal
title @s actionbar {"text":"🏛️ ĐANG QUAY TRỞ VỀ ĐẢO TRUNG TÂM SPAWN HUB... 🏛️","color":"gold","bold":true}
execute in minecraft:overworld run teleport @s 0.5 122.0 0.5 0 0
execute unless entity @s in minecraft:overworld run teleport @p[distance=..5] 0.5 122.0 0.5 0 0
