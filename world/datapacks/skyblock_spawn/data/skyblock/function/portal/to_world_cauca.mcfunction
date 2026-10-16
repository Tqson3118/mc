# Cổng Dịch Chuyển Torii Thần Đạo -> world_cauca
execute at @s run playsound minecraft:block.portal.travel player @s ~ ~ ~ 1.2 1.2
execute at @s run playsound minecraft:block.amethyst_block.chime player @s ~ ~ ~ 2.0 1.8
execute at @s run particle portal ~ ~1 ~ 1 1 1 0.2 80 normal
execute at @s run particle splash ~ ~1 ~ 1 1 1 0.2 60 normal
title @s actionbar {"text":"🎣 ĐANG DỊCH CHUYỂN ĐẾN BIỂN HỒ TRÊN MÂY (CELESTIAL OASIS)... 🎣","color":"aqua","bold":true}
execute in minecraft:world_cauca run teleport @s 0.5 103.0 0.5 0 0
