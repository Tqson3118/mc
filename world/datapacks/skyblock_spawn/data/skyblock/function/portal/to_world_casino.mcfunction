# Cổng Dịch Chuyển Torii Thần Đạo -> world_casino
execute at @s run playsound minecraft:block.portal.travel player @s ~ ~ ~ 1.2 1.3
execute at @s run playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1.5 1.5
execute at @s run particle portal ~ ~1 ~ 1 1 1 0.2 80 normal
execute at @s run particle totem_of_undying ~ ~1 ~ 1 1 1 0.2 40 normal
title @s actionbar {"text":"🎰 ĐANG TIẾN VÀO CUNG ĐIỆN HOÀNG GIA LAS VEGAS... 🎰","color":"gold","bold":true}
execute in minecraft:world_casino run teleport @s 0.5 111.0 0.5 0 0
