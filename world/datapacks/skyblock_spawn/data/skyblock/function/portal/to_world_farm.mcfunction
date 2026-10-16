# Cổng Dịch Chuyển Torii Thần Đạo -> world_farm
execute at @s run playsound minecraft:block.portal.travel player @s ~ ~ ~ 1.2 1.0
execute at @s run playsound minecraft:block.amethyst_block.chime player @s ~ ~ ~ 2.0 1.5
execute at @s run particle portal ~ ~1 ~ 1 1 1 0.2 80 normal
execute at @s run particle cherry_leaves ~ ~1 ~ 1 1 1 0.1 40 normal
title @s actionbar {"text":"🌾 ĐANG TIẾN VÀO VƯỜN THƯỢNG UYỂN SAKURA & HẦM NGỤC QUÁI... 🌾","color":"green","bold":true}
execute in minecraft:world_farm run teleport @s 0.5 111.0 0.5 0 0
