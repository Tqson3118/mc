scoreboard players set #boss6_enraged boss_status 1
title @a times 10 80 20
title @a title {"text":"🌌 HOÀNG ĐẾ TINH TÚ THỨC TỈNH TOÀN DIỆN! 🌌","color":"gold","bold":true}
title @a subtitle {"text":"PHASE 2: NỘ THIÊN CUNG — GIÁP SÁNG THẾ & CUỒNG PHONG BÃO LỐC!","color":"light_purple"}
tellraw @a [{"text":"[CẢNH BÁO BOSS 6] ","color":"gold","bold":true},{"text":"HOÀNG ĐẾ TINH TÚ VĨNH HẰNG đã bước vào trạng thái NỘ SÁNG THẾ! Giáp phản đòn 15%, triệu hồi Cuồng Phong Breeze & Tinh Linh Lửa!","color":"yellow"}]

execute as @e[tag=boss_6] run effect give @s minecraft:strength 99999 2 true
execute as @e[tag=boss_6] run effect give @s minecraft:speed 99999 1 true
execute as @e[tag=boss_6] run effect give @s minecraft:resistance 99999 2 true

execute as @e[tag=boss_6,limit=1] at @s run playsound minecraft:entity.ender_dragon.growl master @a ~ ~ ~ 3.0 0.6
execute as @e[tag=boss_6,limit=1] at @s run particle minecraft:end_rod ~ ~1 ~ 2 2 2 0.2 150 normal
execute as @e[tag=boss_6,limit=1] at @s run summon breeze ~-3 ~ ~ {Tags:["minion_boss_6"],CustomName:'{"text":"Cuồng Phong Tinh Tú Cuồng Nộ","color":"aqua"}',CustomNameVisible:1b}
execute as @e[tag=boss_6,limit=1] at @s run summon blaze ~3 ~ ~ {Tags:["minion_boss_6"],CustomName:'{"text":"Tinh Linh Mặt Trời Cuồng Nộ","color":"gold"}',CustomNameVisible:1b}
