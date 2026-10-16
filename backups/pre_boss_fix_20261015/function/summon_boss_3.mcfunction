# ==============================================================================
# LỆNH TRIỆU HỒI BOSS TUẦN CẤP 3: CHÚA TỂ BÓNG TỐI (LORD OF DARKNESS - 600 HP)
# Vị trí: Thành Trì Phía Nam (X=0, Y=111, Z=115)
# ==============================================================================

# 1. Dọn dẹp boss cũ và hộ vệ (nếu còn)
scoreboard players set #boss_3_alive boss_status 0
kill @e[tag=boss_3]
kill @e[tag=minion_boss_3]

# 2. Hiệu ứng bão sấm sét & âm thanh rồng gầm thét
playsound minecraft:entity.ender_dragon.growl master @a 0 111 115 5.0 0.8
summon lightning_bolt 0 111 115
summon lightning_bolt -16 117 102
summon lightning_bolt 16 117 102
summon lightning_bolt -16 117 128
summon lightning_bolt 16 117 128

# 3. Thông báo toàn server
title @a times 10 70 20
title @a title {"text":"☠ CHÚA TỂ BÓNG TỐI ☠","color":"dark_red","bold":true}
title @a subtitle {"text":"Boss Tuần Cấp 3 (600 HP) đã trỗi dậy tại Thành Trì Phía Nam!","color":"gold"}
tellraw @a [{"text":"[BOSS TUẦN CẤP 3] ","color":"dark_red","bold":true},{"text":"Chúa Tể Bóng Tối (600 HP) đã giáng lâm! Kỹ năng: Bão sấm sét & Lời nguyền hắc ám! RƠI 100% TRÁI TIM CỦA QUỶ (Đột phá Tier 10), Kiếm Netherite Boss, Totem & Ngọc!","color":"yellow"}]

# 4. Triệu hồi Boss Chúa Tể Bóng Tối (600 HP, Rơi 100% Trái Tim Của Quỷ)
summon wither_skeleton 0 111 115 {Tags:["server_boss","boss_3"],CustomName:'{"text":"★ CHÚA TỂ BÓNG TỐI ★ [600 HP]","color":"dark_red","bold":true}',CustomNameVisible:1b,Glowing:1b,PersistenceRequired:1b,attributes:[{id:"minecraft:max_health",base:600.0},{id:"minecraft:attack_damage",base:18.0},{id:"minecraft:movement_speed",base:0.35},{id:"minecraft:knockback_resistance",base:0.9}],Health:600f,HandItems:[{id:"minecraft:netherite_sword",count:1,components:{"minecraft:enchantments":{levels:{"minecraft:sharpness":7,"minecraft:fire_aspect":3,"minecraft:unbreaking":3}},"minecraft:custom_name":'{"text":"Lưỡi Hái Chúa Tể Hắc Ám","color":"red","bold":true}'}},{id:"minecraft:fermented_spider_eye",count:1,components:{"minecraft:custom_name":'{"text":"☠ Trái Tim Của Quỷ ☠","color":"dark_red","bold":true,"italic":false}',"minecraft:lore":['{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}','{"text":"Trái tim đen tối vẫn còn đập của Chúa Tể Bóng Tối.","color":"dark_purple","italic":true}','{"text":"⚡ Nguyên liệu ĐỘT PHÁ bắt buộc cho mốc TIER 10!","color":"red","bold":true,"italic":false}','{"text":"✦ Rơi 100% khi hạ gục Chúa Tể Bóng Tối (/warp boss)","color":"gold","italic":false}','{"text":"[Loại]: Nguyên Liệu Đột Phá Hắc Ám","color":"dark_red","bold":true,"italic":false}','{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}'],"minecraft:enchantment_glint_override":true,"minecraft:custom_data":{ancient_mat:"demon_heart"}}}],ArmorItems:[{},{},{},{}],HandDropChances:[0.5f,1.0f],ArmorDropChances:[0.3f,0.3f,0.3f,0.3f]}
scoreboard players set #boss_3_alive boss_status 1
setblock -1 113 69 oak_wall_sign[facing=south]{front_text:{has_glowing_text:1b,messages:['{"text":"[ BOSS 3 ]","color":"gold","bold":true}','{"text":"Thành Trì Chúa Tể","color":"yellow"}','{"text":"Trạng thái:","color":"gray"}','{"text":"☠ ĐANG CHIẾN ĐẤU","color":"red","bold":true}']}}

# 5. Kỹ năng triệu hồi Hộ Vệ Bóng Tối
summon wither_skeleton 4 111 112 {Tags:["minion_boss_3"],CustomName:'{"text":"Cận Vệ Hắc Ám","color":"gray"}',CustomNameVisible:1b}
summon wither_skeleton -4 111 112 {Tags:["minion_boss_3"],CustomName:'{"text":"Cận Vệ Hắc Ám","color":"gray"}',CustomNameVisible:1b}
summon wither_skeleton 4 111 118 {Tags:["minion_boss_3"],CustomName:'{"text":"Cận Vệ Hắc Ám","color":"gray"}',CustomNameVisible:1b}
summon wither_skeleton -4 111 118 {Tags:["minion_boss_3"],CustomName:'{"text":"Cận Vệ Hắc Ám","color":"gray"}',CustomNameVisible:1b}
summon blaze 0 114 115 {Tags:["minion_boss_3"],CustomName:'{"text":"Ma Lửa Hộ Pháp","color":"gold"}',CustomNameVisible:1b}

# 6. Kỹ năng Lời Nguyền Hắc Ám (Wither & Mù lòa)
effect give @a[x=-18,y=108,z=100,dx=36,dy=20,dz=30] minecraft:wither 6 1 true
effect give @a[x=-18,y=108,z=100,dx=36,dy=20,dz=30] minecraft:blindness 3 0 true

# 7. Reset hệ thống skill timer khi triệu hồi lại
scoreboard players set #boss3 boss_3_timer 0
scoreboard players set #boss3_skill_turn boss_skill_rng 0
tag @e[tag=boss_3] remove boss_3_phase2

