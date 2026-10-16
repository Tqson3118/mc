# ==============================================================================
# LỆNH TRIỆU HỒI BOSS CẤP 2: ĐAO PHỦ ĐỊA NGỤC (NETHER EXECUTIONER - 300 HP)
# Vị trí: Đấu Trường 2 (world_boss X=180, Y=101, Z=-180) / Vực Lửa overworld (X=29, Y=111, Z=85)
# ==============================================================================

# 1. Dọn dẹp boss cũ và hộ vệ (nếu còn)
scoreboard players set #boss_2_alive boss_status 0
kill @e[tag=boss_2]
kill @e[tag=minion_boss_2]

# 2. Hiệu ứng âm thanh & ngọn lửa thiêu đốt
execute in minecraft:world_boss run playsound minecraft:entity.piglin_brute.angry master @a 180 101 -180 4.0 0.8
execute in minecraft:world_boss run particle minecraft:flame 180 102 -180 2 2 2 0.1 120 normal
execute in minecraft:world_boss run particle minecraft:lava 180 102 -180 1.5 1 1.5 0.1 40 normal

execute in minecraft:overworld run playsound minecraft:entity.piglin_brute.angry master @a 29 111 85 4.0 0.8
execute in minecraft:overworld run particle minecraft:flame 29 112 85 2 2 2 0.1 120 normal
execute in minecraft:overworld run particle minecraft:lava 29 112 85 1.5 1 1.5 0.1 40 normal

# 3. Thông báo toàn server
title @a times 10 60 20
title @a title {"text":"🔥 ĐAO PHỦ ĐỊA NGỤC 🔥","color":"red","bold":true}
title @a subtitle {"text":"Boss Cấp 2 (300 HP) đã trỗi dậy tại Đấu Trường Boss (/warp boss2)!","color":"gold"}
tellraw @a [{"text":"[BOSS CẤP 2] ","color":"red","bold":true},{"text":"Đao Phủ Địa Ngục (300 HP) đã thức tỉnh! Kỹ năng: Đao phủ quăng lửa & Cầu lửa hủy diệt! Phần thưởng: Rơi 100% Tinh Thể Cổ Đại (Tier 6-9), Rìu Netherite Lửa & Vàng!","color":"gold"}]

# 4. Triệu hồi Đao Phủ Địa Ngục (300 HP, Rơi 100% Tinh Thể Cổ Đại ở tay phụ)
# 4.1 Ưu tiên triệu hồi tại overworld nếu có người chơi tại Vực Lửa
execute in minecraft:overworld if entity @p[x=29,y=111,z=85,distance=..40] run summon piglin_brute 29 111 85 {Tags:["server_boss","boss_2"],CustomName:'{"text":"🔥 ĐAO PHỦ ĐỊA NGỤC 🔥 [300 HP]","color":"red","bold":true}',CustomNameVisible:1b,Glowing:1b,PersistenceRequired:1b,ImmuneToZombification:1b,attributes:[{id:"minecraft:max_health",base:300.0},{id:"minecraft:attack_damage",base:14.0},{id:"minecraft:movement_speed",base:0.33},{id:"minecraft:knockback_resistance",base:0.7}],Health:300f,HandItems:[{id:"minecraft:netherite_axe",count:1,components:{"minecraft:enchantments":{levels:{"minecraft:sharpness":6,"minecraft:fire_aspect":2}},"minecraft:custom_name":'{"text":"Rìu Địa Ngục Phán Quyết","color":"red","bold":true}'}},{id:"minecraft:amethyst_shard",count:2,components:{"minecraft:custom_name":'{"text":"❂ Tinh Thể Cổ Đại ❂","color":"light_purple","bold":true,"italic":false}',"minecraft:lore":['{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}','{"text":"Tinh thể phát sáng với ma năng nguyên thủy.","color":"gray","italic":true}','{"text":"✦ Dùng để rèn trang bị Cổ Đại Bậc 6 - 9","color":"light_purple","italic":false}','{"text":"[Loại]: Nguyên Liệu Thần Thoại","color":"gold","bold":true,"italic":false}','{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}'],"minecraft:enchantment_glint_override":true,"minecraft:custom_data":{ancient_mat:"crystal"}}}],ArmorItems:[{},{},{},{}],HandDropChances:[0.3f,1.0f],ArmorDropChances:[0.2f,0.0f,0.2f,0.0f]}

# 4.2 Triệu hồi chính tại world_boss Đấu Trường 2 (180, 101, -180)
execute in minecraft:world_boss unless entity @e[tag=boss_2] run summon piglin_brute 180 101 -180 {Tags:["server_boss","boss_2"],CustomName:'{"text":"🔥 ĐAO PHỦ ĐỊA NGỤC 🔥 [300 HP]","color":"red","bold":true}',CustomNameVisible:1b,Glowing:1b,PersistenceRequired:1b,ImmuneToZombification:1b,attributes:[{id:"minecraft:max_health",base:300.0},{id:"minecraft:attack_damage",base:14.0},{id:"minecraft:movement_speed",base:0.33},{id:"minecraft:knockback_resistance",base:0.7}],Health:300f,HandItems:[{id:"minecraft:netherite_axe",count:1,components:{"minecraft:enchantments":{levels:{"minecraft:sharpness":6,"minecraft:fire_aspect":2}},"minecraft:custom_name":'{"text":"Rìu Địa Ngục Phán Quyết","color":"red","bold":true}'}},{id:"minecraft:amethyst_shard",count:2,components:{"minecraft:custom_name":'{"text":"❂ Tinh Thể Cổ Đại ❂","color":"light_purple","bold":true,"italic":false}',"minecraft:lore":['{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}','{"text":"Tinh thể phát sáng với ma năng nguyên thủy.","color":"gray","italic":true}','{"text":"✦ Dùng để rèn trang bị Cổ Đại Bậc 6 - 9","color":"light_purple","italic":false}','{"text":"[Loại]: Nguyên Liệu Thần Thoại","color":"gold","bold":true,"italic":false}','{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}'],"minecraft:enchantment_glint_override":true,"minecraft:custom_data":{ancient_mat:"crystal"}}}],ArmorItems:[{},{},{},{}],HandDropChances:[0.3f,1.0f],ArmorDropChances:[0.2f,0.0f,0.2f,0.0f]}

# 4.3 Dự phòng nếu world_boss chưa load
execute unless entity @e[tag=boss_2] run summon piglin_brute 180 101 -180 {Tags:["server_boss","boss_2"],CustomName:'{"text":"🔥 ĐAO PHỦ ĐỊA NGỤC 🔥 [300 HP]","color":"red","bold":true}',CustomNameVisible:1b,Glowing:1b,PersistenceRequired:1b,ImmuneToZombification:1b,attributes:[{id:"minecraft:max_health",base:300.0},{id:"minecraft:attack_damage",base:14.0},{id:"minecraft:movement_speed",base:0.33},{id:"minecraft:knockback_resistance",base:0.7}],Health:300f,HandItems:[{id:"minecraft:netherite_axe",count:1,components:{"minecraft:enchantments":{levels:{"minecraft:sharpness":6,"minecraft:fire_aspect":2}},"minecraft:custom_name":'{"text":"Rìu Địa Ngục Phán Quyết","color":"red","bold":true}'}},{id:"minecraft:amethyst_shard",count:2,components:{"minecraft:custom_name":'{"text":"❂ Tinh Thể Cổ Đại ❂","color":"light_purple","bold":true,"italic":false}',"minecraft:lore":['{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}','{"text":"Tinh thể phát sáng với ma năng nguyên thủy.","color":"gray","italic":true}','{"text":"✦ Dùng để rèn trang bị Cổ Đại Bậc 6 - 9","color":"light_purple","italic":false}','{"text":"[Loại]: Nguyên Liệu Thần Thoại","color":"gold","bold":true,"italic":false}','{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}'],"minecraft:enchantment_glint_override":true,"minecraft:custom_data":{ancient_mat:"crystal"}}}],ArmorItems:[{},{},{},{}],HandDropChances:[0.3f,1.0f],ArmorDropChances:[0.2f,0.0f,0.2f,0.0f]}

scoreboard players set #boss_2_alive boss_status 1
execute in minecraft:overworld run setblock 13 113 60 oak_wall_sign[facing=west]{front_text:{has_glowing_text:1b,messages:['{"text":"[ BOSS 2 ]","color":"gold","bold":true}','{"text":"Vực Đao Phủ Địa Ngục","color":"yellow"}','{"text":"Trạng thái:","color":"gray"}','{"text":"☠ ĐANG CHIẾN ĐẤU","color":"red","bold":true}']}}

# 5. Kỹ năng quăng lửa: Triệu hồi 4 Hộ Vệ Lửa Blaze bao quanh Boss
execute at @e[tag=boss_2,limit=1] run summon blaze ~-3 ~1 ~-3 {Tags:["minion_boss_2"],CustomName:'{"text":"Hộ Vệ Dung Nham","color":"gold"}',CustomNameVisible:1b}
execute at @e[tag=boss_2,limit=1] run summon blaze ~3 ~1 ~-3 {Tags:["minion_boss_2"],CustomName:'{"text":"Hộ Vệ Dung Nham","color":"gold"}',CustomNameVisible:1b}
execute at @e[tag=boss_2,limit=1] run summon blaze ~-3 ~1 ~3 {Tags:["minion_boss_2"],CustomName:'{"text":"Hộ Vệ Dung Nham","color":"gold"}',CustomNameVisible:1b}
execute at @e[tag=boss_2,limit=1] run summon blaze ~3 ~1 ~3 {Tags:["minion_boss_2"],CustomName:'{"text":"Hộ Vệ Dung Nham","color":"gold"}',CustomNameVisible:1b}

# 6. Hiệu ứng bão lửa địa ngục
execute at @e[tag=boss_2,limit=1] run effect give @a[distance=..30] minecraft:slowness 4 1 true
execute at @e[tag=boss_2,limit=1] as @a[distance=..30] at @s run summon small_fireball ~ ~3 ~ {Motion:[0.0,-0.5,0.0]}

# 7. Reset hệ thống skill timer khi triệu hồi lại
scoreboard players set #boss2 boss_2_timer 0
scoreboard players set #boss2_skill_turn boss_skill_rng 0
tag @e[tag=boss_2] remove boss_2_phase2

