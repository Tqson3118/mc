# ==============================================================================
# TRIỆU HỒI BOSS CẤP 6: HOÀNG ĐẾ TINH TÚ VĨNH HẰNG (COSMIC EMPEROR - 5000 HP)
# Vị trí: Thiên Cung Sáng Thế (X=0, Y=137, Z=115)
# ==============================================================================
scoreboard players set #boss_6_alive boss_status 0
kill @e[tag=boss_6]
kill @e[tag=minion_boss_6]

playsound minecraft:entity.ender_dragon.growl master @a 0 137 115 5.0 0.6
playsound minecraft:block.end_portal.spawn master @a 0 137 115 5.0 1.0
particle minecraft:end_rod 0 138 115 4 3 4 0.3 300 normal
particle minecraft:explosion_emitter 0 138 115 0 0 0 0 1 normal

title @a times 10 90 20
title @a title {"text":"🌌 HOÀNG ĐẾ TINH TÚ 🌌","color":"gold","bold":true}
title @a subtitle {"text":"SUPREME BOSS CẤP 6 (5000 HP) ĐÃ GIÁNG LÂM TẠI /BOSS6!","color":"light_purple"}
tellraw @a [{"text":"[SUPREME BOSS CẤP 6] ","color":"gold","bold":true},{"text":"HOÀNG ĐẾ TINH TÚ VĨNH HẰNG (5000 HP) đã giáng lâm tại Thiên Cung Sáng Thế (/boss6)! Hạ gục nhận 100% DỊ ĐIỂM VĨNH HẰNG (Đột phá Tier 19-20 MAX) & +$75,000 Số Dư!","color":"yellow"}]

summon wither_skeleton 0 137 115 {Tags:["server_boss","boss_6"],CustomName:'{"text":"🌌 HOÀNG ĐẾ TINH TÚ VĨNH HẰNG 🌌 [5000 HP]","color":"gold","bold":true}',CustomNameVisible:1b,Glowing:1b,PersistenceRequired:1b,attributes:[{id:"minecraft:max_health",base:5000.0},{id:"minecraft:attack_damage",base:42.0},{id:"minecraft:movement_speed",base:0.40},{id:"minecraft:knockback_resistance",base:1.0},{id:"minecraft:scale",base:1.65}],Health:5000f,HandItems:[{id:"minecraft:mace",count:1,components:{"minecraft:enchantments":{levels:{"minecraft:sharpness":15,"minecraft:wind_burst":3}},"minecraft:custom_name":'{"text":"Quyền Trượng Sáng Thế","color":"gold","bold":true}'}},{id:"minecraft:heavy_core",count:1,components:{"minecraft:custom_name":'{"text":"🌌 Dị Điểm Vĩnh Hằng 🌌","color":"light_purple","bold":true,"italic":false}',"minecraft:lore":['{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}','{"text":"Hạt nhân nén chặt của cả một thiên hà đang bùng nổ.","color":"light_purple","italic":true}','{"text":"⚡ Nguyên liệu SÁNG THẾ TỐI CAO cho TIER 19 - 20 [MAX]!","color":"gold","bold":true,"italic":false}','{"text":"✦ Rơi 100% khi hạ Boss 6: Hoàng Đế Tinh Tú (/boss6)","color":"yellow","italic":false}','{"text":"[Loại]: Thánh Vật Sáng Thế","color":"light_purple","bold":true,"italic":false}','{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}'],"minecraft:enchantment_glint_override":true,"minecraft:custom_data":{ancient_mat:"eternity_singularity"}}}],ArmorItems:[{id:"minecraft:netherite_boots",count:1},{id:"minecraft:netherite_leggings",count:1},{id:"minecraft:netherite_chestplate",count:1},{id:"minecraft:beacon",count:1}],HandDropChances:[0.2f,1.0f],ArmorDropChances:[0.0f,0.0f,0.0f,0.0f]}
scoreboard players set #boss_6_alive boss_status 1

summon blaze -4 137 113 {Tags:["minion_boss_6"],CustomName:'{"text":"Tinh Linh Mặt Trời","color":"gold"}',CustomNameVisible:1b}
summon blaze 4 137 113 {Tags:["minion_boss_6"],CustomName:'{"text":"Tinh Linh Mặt Trời","color":"gold"}',CustomNameVisible:1b}
summon breeze 0 137 119 {Tags:["minion_boss_6"],CustomName:'{"text":"Cuồng Phong Tinh Tú","color":"aqua"}',CustomNameVisible:1b}
