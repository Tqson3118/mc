# Cổng Dịch Chuyển Torii Thần Đạo -> world_boss
execute at @s run playsound minecraft:block.portal.travel player @s ~ ~ ~ 1.2 0.8
execute at @s run playsound minecraft:block.amethyst_block.chime player @s ~ ~ ~ 2.0 1.2
execute at @s run particle portal ~ ~1 ~ 1 1 1 0.2 80 normal
execute at @s run particle cherry_leaves ~ ~1 ~ 1 1 1 0.1 40 normal
title @s actionbar {"text":"👹 ĐANG BƯỚC VÀO VỰC THẲM ĐẤU TRƯỜNG BOSS CỔ ĐẠI... 👹","color":"dark_red","bold":true}
execute in minecraft:world_boss run teleport @s 0.5 111.0 0.5 0 0
