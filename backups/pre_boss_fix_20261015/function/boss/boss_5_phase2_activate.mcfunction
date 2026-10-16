scoreboard players set #boss5_enraged boss_status 1
title @a times 10 70 20
title @a title {"text":"⚡ CỔ THẦN THÂM UYÊN NỔI GIẬN! ⚡","color":"dark_red","bold":true}
title @a subtitle {"text":"PHASE 2: NỘ HUYẾT THÂM UYÊN — SỨC MẠNH & TỐC ĐỘ GẤP BỘI!","color":"red"}
tellraw @a [{"text":"[CẢNH BÁO BOSS 5] ","color":"dark_red","bold":true},{"text":"CỔ THẦN THÂM UYÊN đã kích hoạt NỘ HUYẾT! Sát thương & Tốc độ tăng vọt, triệu hồi Hồn Ma Hộ Vệ!","color":"red"}]

execute as @e[tag=boss_5] run effect give @s minecraft:strength 99999 1 true
execute as @e[tag=boss_5] run effect give @s minecraft:speed 99999 1 true
execute as @e[tag=boss_5] run effect give @s minecraft:resistance 99999 1 true

execute as @e[tag=boss_5,limit=1] at @s run playsound minecraft:entity.warden.roar master @a ~ ~ ~ 3.0 0.8
execute as @e[tag=boss_5,limit=1] at @s run particle minecraft:sculk_soul ~ ~1 ~ 1 1 1 0.1 100 normal
execute as @e[tag=boss_5,limit=1] at @s run summon phantom ~ ~6 ~ {Tags:["minion_boss_5"],CustomName:'{"text":"Hồn Ma Thâm Uyên Cuồng Nộ","color":"dark_red"}',CustomNameVisible:1b}
execute as @e[tag=boss_5,limit=1] at @s run summon phantom ~3 ~6 ~ {Tags:["minion_boss_5"],CustomName:'{"text":"Hồn Ma Thâm Uyên Cuồng Nộ","color":"dark_red"}',CustomNameVisible:1b}
