# ==============================================================================
# TRIỆU HỒI BOSS CẤP 5: CỔ THẦN THÂM UYÊN (ANCIENT WARDEN MONARCH - 2500 HP)
# Vị trí: Thâm Uyên Cổ Điện Đông Nam (X=35, Y=111, Z=115)
# ==============================================================================
scoreboard players set #boss_5_alive boss_status 0
kill @e[tag=boss_5]
kill @e[tag=minion_boss_5]

playsound minecraft:entity.warden.emerge master @a 35 111 115 5.0 0.8
playsound minecraft:entity.warden.roar master @a 35 111 115 5.0 0.7
particle minecraft:sculk_soul 35 112 115 3 2 3 0.2 200 normal
particle minecraft:sonic_boom 35 112 115 0 0 0 0 1 normal

title @a times 10 80 20
title @a title {"text":"💠 CỔ THẦN THÂM UYÊN 💠","color":"dark_aqua","bold":true}
title @a subtitle {"text":"MYTHIC BOSS CẤP 5 (2500 HP) ĐÃ THỨC TỈNH TẠI /BOSS5!","color":"aqua"}
tellraw @a [{"text":"[BOSS CẤP 5] ","color":"dark_aqua","bold":true},{"text":"CỔ THẦN THÂM UYÊN (2500 HP) đã trỗi dậy tại Đấu Trường 5! Hạ gục để nhận 100% TRÁI TIM THÂM UYÊN (Đột phá Tier 16-18) & +$35,000 Số Dư!","color":"aqua"}]

summon wither_skeleton 35 111 115 {Tags:["server_boss","boss_5"],CustomName:'{"text":"💠 CỔ THẦN THÂM UYÊN 💠 [2500 HP]","color":"dark_aqua","bold":true}',CustomNameVisible:1b,Glowing:1b,PersistenceRequired:1b,attributes:[{id:"minecraft:max_health",base:2500.0},{id:"minecraft:attack_damage",base:32.0},{id:"minecraft:movement_speed",base:0.38},{id:"minecraft:knockback_resistance",base:1.0},{id:"minecraft:scale",base:1.45}],Health:2500f,HandItems:[{id:"minecraft:netherite_axe",count:1,components:{"minecraft:enchantments":{levels:{"minecraft:sharpness":12}},"minecraft:custom_name":'{"text":"Búa Chiến Thâm Uyên","color":"dark_aqua","bold":true}'}},{id:"minecraft:recovery_compass",count:1,components:{"minecraft:custom_name":'{"text":"💠 Trái Tim Thâm Uyên 💠","color":"dark_aqua","bold":true,"italic":false}',"minecraft:lore":['{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}','{"text":"Lõi âm thanh cổ đại kết tinh từ Cổ Thần Thâm Uyên Warden.","color":"aqua","italic":true}','{"text":"⚡ Nguyên liệu ĐỘT PHÁ THẦN THOẠI cho TIER 16 - 18!","color":"dark_aqua","bold":true,"italic":false}','{"text":"✦ Rơi 100% khi hạ Boss 5: Cổ Thần Thâm Uyên (/boss5)","color":"yellow","italic":false}','{"text":"[Loại]: Báu Vật Thâm Uyên","color":"aqua","bold":true,"italic":false}','{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}'],"minecraft:enchantment_glint_override":true,"minecraft:custom_data":{ancient_mat:"warden_heart"}}}],ArmorItems:[{id:"minecraft:netherite_boots",count:1},{id:"minecraft:netherite_leggings",count:1},{id:"minecraft:netherite_chestplate",count:1},{id:"minecraft:sculk_shrieker",count:1}],HandDropChances:[0.3f,1.0f],ArmorDropChances:[0.0f,0.0f,0.0f,0.0f]}
scoreboard players set #boss_5_alive boss_status 1

effect give @a[x=25,y=108,z=100,dx=22,dy=20,dz=30] minecraft:darkness 6 0 true
summon phantom 35 118 115 {Tags:["minion_boss_5"],CustomName:'{"text":"Hồn Ma Thâm Uyên","color":"aqua"}',CustomNameVisible:1b}
summon stray 32 111 113 {Tags:["minion_boss_5"],CustomName:'{"text":"Xạ Thủ Thâm Uyên","color":"dark_aqua"}',CustomNameVisible:1b}
summon stray 38 111 117 {Tags:["minion_boss_5"],CustomName:'{"text":"Xạ Thủ Thâm Uyên","color":"dark_aqua"}',CustomNameVisible:1b}
