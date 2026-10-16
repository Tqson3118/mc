# ==================================================
# LỆNH TRIỆU HỒI BOSS TUẦN (WEEKLY BOSS SUMMON)
# ==================================================

# 1. Dọn dẹp boss cũ (nếu còn)
kill @e[type=wither_skeleton,tag=server_boss]

# 2. Hiệu ứng sấm sét & âm thanh
execute at @p run playsound minecraft:entity.ender_dragon.growl master @a 0 111 70 5.0 0.8
summon lightning_bolt 0 111 70

# 3. Thông báo toàn server
title @a times 10 70 20
title @a title {"text":"☠ CHÚA TỂ BÓNG TỐI ☠","color":"dark_red","bold":true}
title @a subtitle {"text":"Đã thức tỉnh tại /warp boss! Hãy tập hợp 5 người chiến đấu!","color":"gold"}
tellraw @a [{"text":"[BOSS FIGHT] ","color":"dark_red","bold":true},{"text":"Chúa Tể Bóng Tối (300 HP) đã xuất hiện tại Đấu Trường Boss! Phần thưởng: 100% rơi TRÁI TIM CỦA QUỶ (Đột phá Tier 10), Kiếm Netherite, Totem & Ngọc!","color":"yellow"}]

# 4. Triệu hồi Boss Wither Skeleton Huyền Thoại với Trái Tim Của Quỷ ở tay phụ (HandDropChances 1.0f = 100% rơi)
summon wither_skeleton 0 111 70 {Tags:["server_boss"],CustomName:'{"text":"★ CHÚA TỂ BÓNG TỐI ★","color":"dark_red","bold":true}',CustomNameVisible:1b,Glowing:1b,PersistenceRequired:1b,attributes:[{id:"minecraft:max_health",base:300.0},{id:"minecraft:attack_damage",base:12.0},{id:"minecraft:movement_speed",base:0.32},{id:"minecraft:knockback_resistance",base:0.8}],Health:300f,HandItems:[{id:"minecraft:netherite_sword",count:1,components:{"minecraft:enchantments":{levels:{"minecraft:sharpness":5,"minecraft:fire_aspect":2,"minecraft:unbreaking":3}},"minecraft:custom_name":'{"text":"Lưỡi Hái Chúa Tể","color":"red","bold":true}'}},{id:"minecraft:fermented_spider_eye",count:1,components:{"minecraft:custom_name":'{"text":"☠ Trái Tim Của Quỷ ☠","color":"dark_red","bold":true,"italic":false}',"minecraft:lore":['{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}','{"text":"Trái tim đen tối vẫn còn đập của Chúa Tể Bóng Tối.","color":"dark_purple","italic":true}','{"text":"⚡ Nguyên liệu ĐỘT PHÁ bắt buộc cho mốc TIER 10!","color":"red","bold":true,"italic":false}','{"text":"✦ Rơi 100% khi hạ gục Chúa Tể Bóng Tối (/warp boss)","color":"gold","italic":false}','{"text":"[Loại]: Nguyên Liệu Đột Phá Hắc Ám","color":"dark_red","bold":true,"italic":false}','{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}'],"minecraft:enchantment_glint_override":true,"minecraft:custom_data":{ancient_mat:"demon_heart"}}}],ArmorItems:[{id:"minecraft:netherite_boots",count:1,components:{"minecraft:enchantments":{levels:{"minecraft:protection":4}}}},{id:"minecraft:netherite_leggings",count:1,components:{"minecraft:enchantments":{levels:{"minecraft:protection":4}}}},{id:"minecraft:netherite_chestplate",count:1,components:{"minecraft:enchantments":{levels:{"minecraft:protection":4}}}},{id:"minecraft:netherite_helmet",count:1,components:{"minecraft:enchantments":{levels:{"minecraft:protection":4}}}}],HandDropChances:[1.0f,1.0f],ArmorDropChances:[0.3f,0.3f,0.3f,0.3f]}

# 5. Triệu hồi Quái Hộ Vệ (Minions)
summon blaze 3 111 73 {CustomName:'{"text":"Hộ Vệ Lửa","color":"gold"}',CustomNameVisible:1b}
summon blaze -3 111 67 {CustomName:'{"text":"Hộ Vệ Lửa","color":"gold"}',CustomNameVisible:1b}
summon wither_skeleton 4 111 67 {CustomName:'{"text":"Lính Cận Vệ","color":"gray"}',CustomNameVisible:1b}
summon wither_skeleton -4 111 73 {CustomName:'{"text":"Lính Cận Vệ","color":"gray"}',CustomNameVisible:1b}
