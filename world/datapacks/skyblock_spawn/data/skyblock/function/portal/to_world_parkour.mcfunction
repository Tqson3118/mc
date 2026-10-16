# Cổng Dịch Chuyển Torii Thần Đạo -> world_parkour
execute at @s run playsound minecraft:block.portal.travel player @s ~ ~ ~ 1.2 1.5
execute at @s run playsound minecraft:entity.wind_charge.wind_burst player @s ~ ~ ~ 2.0 1.2
execute at @s run particle portal ~ ~1 ~ 1 1 1 0.2 80 normal
execute at @s run particle cloud ~ ~1 ~ 1 1 1 0.1 50 normal
title @s actionbar {"text":"🏃 ĐANG TIẾN VÀO SIÊU THÁP THỬ THÁCH PHONG LÔI 50 TẦNG... 🏃","color":"yellow","bold":true}
execute in minecraft:world_parkour run teleport @s 0.5 71.0 0.5 0 0
