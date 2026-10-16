# ==============================================================================
# LỆNH TRIỆU HỒI WORLD BOSS CẤP 4: THỰC THỂ HƯ KHÔNG (VOID MONARCH - 1200 HP)
# Vị trí: Đấu Trường 4 (world_boss X=180, Y=101, Z=180) / Thánh Địa Hư Không overworld (X=-35, Y=111, Z=115)
# ==============================================================================

# 1. Dọn dẹp boss cũ và hộ vệ (nếu còn)
scoreboard players set #boss_4_alive boss_status 0
kill @e[tag=boss_4]
kill @e[tag=minion_boss_4]

# 2. Hiệu ứng âm thanh hư không & hạt ma thuật tím
execute in minecraft:world_boss run playsound minecraft:entity.warden.roar master @a 180 101 180 5.0 0.7
execute in minecraft:world_boss run playsound minecraft:block.beacon.activate master @a 180 101 180 5.0 1.2
execute in minecraft:world_boss run particle minecraft:portal 180 102 180 3 2 3 0.5 250 normal
execute in minecraft:world_boss run particle minecraft:sonic_boom 180 102 180 0 0 0 0 1 normal

execute in minecraft:overworld run playsound minecraft:entity.warden.roar master @a -35 111 115 5.0 0.7
execute in minecraft:overworld run playsound minecraft:block.beacon.activate master @a -35 111 115 5.0 1.2
execute in minecraft:overworld run particle minecraft:portal -35 112 115 3 2 3 0.5 250 normal
execute in minecraft:overworld run particle minecraft:sonic_boom -35 112 115 0 0 0 0 1 normal

# 3. Thông báo toàn server
title @a times 10 80 20
title @a title {"text":"🌀 CHÚA TỂ HƯ KHÔNG 🌀","color":"dark_purple","bold":true}
title @a subtitle {"text":"WORLD BOSS CẤP 4 (1200 HP) ĐÃ XUẤT HIỆN TẠI /WARP BOSS4!","color":"light_purple"}
tellraw @a [{"text":"[WORLD BOSS CẤP 4] ","color":"dark_purple","bold":true},{"text":"THỰC THỂ HƯ KHÔNG VÔ TẬN (1200 HP) ĐÃ XUẤT THẾ! Kỹ năng: Hố đen hút trọng lực & Bão hư vô! RƠI 100% LÕI HƯ KHÔNG (Đột phá Tier 13), Sao Nether x2 & 64 Ngọc Lục Bảo!","color":"light_purple"}]

# 4. Triệu hồi World Boss Thực Thể Hư Không (1200 HP, Rơi 100% Lõi Hư Không)
# 4.1 Ưu tiên triệu hồi tại overworld nếu có người chơi tại Thánh Địa Hư Không
execute in minecraft:overworld if entity @p[x=-35,y=111,z=115,distance=..40] run summon wither_skeleton -35 111 115 {Tags:["server_boss","boss_4"],CustomName:'{"text":"🌀 CHÚA TỂ HƯ KHÔNG VÔ TẬN 🌀 [1200 HP]","color":"dark_purple","bold":true}',CustomNameVisible:1b,Glowing:1b,PersistenceRequired:1b,attributes:[{id:"minecraft:max_health",base:1200.0},{id:"minecraft:attack_damage",base:24.0},{id:"minecraft:movement_speed",base:0.36},{id:"minecraft:knockback_resistance",base:1.0}],Health:1200f,HandItems:[{id:"minecraft:netherite_sword",count:1,components:{"minecraft:enchantments":{levels:{"minecraft:sharpness":10,"minecraft:knockback":3}},"minecraft:custom_name":'{"text":"Lưỡi Kiếm Hư Không Tận Diệt","color":"dark_purple","bold":true}'}},{id:"minecraft:echo_shard",count:1,components:{"minecraft:custom_name":'{"text":"🌀 Lõi Hư Không 🌀","color":"dark_purple","bold":true,"italic":false}',"minecraft:lore":['{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}','{"text":"Chứa đựng trọng lực vô tận từ không gian hư vô.","color":"gray","italic":true}','{"text":"⚡ Nguyên liệu ĐỘT PHÁ bắt buộc cho mốc TIER 13!","color":"light_purple","bold":true,"italic":false}','{"text":"✦ Trao đổi tại Đại Sư Luyện Kim","color":"aqua","italic":false}','{"text":"[Loại]: Nguyên Liệu Tối Thượng","color":"dark_purple","bold":true,"italic":false}','{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}'],"minecraft:enchantment_glint_override":true,"minecraft:custom_data":{ancient_mat:"void_core"}}}],ArmorItems:[{},{},{},{}],HandDropChances:[0.5f,1.0f],ArmorDropChances:[0.3f,0.3f,0.3f,0.5f]}

# 4.2 Triệu hồi chính tại world_boss Đấu Trường 4 (180, 101, 180)
execute in minecraft:world_boss unless entity @e[tag=boss_4] run summon wither_skeleton 180 101 180 {Tags:["server_boss","boss_4"],CustomName:'{"text":"🌀 CHÚA TỂ HƯ KHÔNG VÔ TẬN 🌀 [1200 HP]","color":"dark_purple","bold":true}',CustomNameVisible:1b,Glowing:1b,PersistenceRequired:1b,attributes:[{id:"minecraft:max_health",base:1200.0},{id:"minecraft:attack_damage",base:24.0},{id:"minecraft:movement_speed",base:0.36},{id:"minecraft:knockback_resistance",base:1.0}],Health:1200f,HandItems:[{id:"minecraft:netherite_sword",count:1,components:{"minecraft:enchantments":{levels:{"minecraft:sharpness":10,"minecraft:knockback":3}},"minecraft:custom_name":'{"text":"Lưỡi Kiếm Hư Không Tận Diệt","color":"dark_purple","bold":true}'}},{id:"minecraft:echo_shard",count:1,components:{"minecraft:custom_name":'{"text":"🌀 Lõi Hư Không 🌀","color":"dark_purple","bold":true,"italic":false}',"minecraft:lore":['{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}','{"text":"Chứa đựng trọng lực vô tận từ không gian hư vô.","color":"gray","italic":true}','{"text":"⚡ Nguyên liệu ĐỘT PHÁ bắt buộc cho mốc TIER 13!","color":"light_purple","bold":true,"italic":false}','{"text":"✦ Trao đổi tại Đại Sư Luyện Kim","color":"aqua","italic":false}','{"text":"[Loại]: Nguyên Liệu Tối Thượng","color":"dark_purple","bold":true,"italic":false}','{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}'],"minecraft:enchantment_glint_override":true,"minecraft:custom_data":{ancient_mat:"void_core"}}}],ArmorItems:[{},{},{},{}],HandDropChances:[0.5f,1.0f],ArmorDropChances:[0.3f,0.3f,0.3f,0.5f]}

# 4.3 Dự phòng nếu world_boss chưa load
execute unless entity @e[tag=boss_4] run summon wither_skeleton 180 101 180 {Tags:["server_boss","boss_4"],CustomName:'{"text":"🌀 CHÚA TỂ HƯ KHÔNG VÔ TẬN 🌀 [1200 HP]","color":"dark_purple","bold":true}',CustomNameVisible:1b,Glowing:1b,PersistenceRequired:1b,attributes:[{id:"minecraft:max_health",base:1200.0},{id:"minecraft:attack_damage",base:24.0},{id:"minecraft:movement_speed",base:0.36},{id:"minecraft:knockback_resistance",base:1.0}],Health:1200f,HandItems:[{id:"minecraft:netherite_sword",count:1,components:{"minecraft:enchantments":{levels:{"minecraft:sharpness":10,"minecraft:knockback":3}},"minecraft:custom_name":'{"text":"Lưỡi Kiếm Hư Không Tận Diệt","color":"dark_purple","bold":true}'}},{id:"minecraft:echo_shard",count:1,components:{"minecraft:custom_name":'{"text":"🌀 Lõi Hư Không 🌀","color":"dark_purple","bold":true,"italic":false}',"minecraft:lore":['{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}','{"text":"Chứa đựng trọng lực vô tận từ không gian hư vô.","color":"gray","italic":true}','{"text":"⚡ Nguyên liệu ĐỘT PHÁ bắt buộc cho mốc TIER 13!","color":"light_purple","bold":true,"italic":false}','{"text":"✦ Trao đổi tại Đại Sư Luyện Kim","color":"aqua","italic":false}','{"text":"[Loại]: Nguyên Liệu Tối Thượng","color":"dark_purple","bold":true,"italic":false}','{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}'],"minecraft:enchantment_glint_override":true,"minecraft:custom_data":{ancient_mat:"void_core"}}}],ArmorItems:[{},{},{},{}],HandDropChances:[0.5f,1.0f],ArmorDropChances:[0.3f,0.3f,0.3f,0.5f]}

scoreboard players set #boss_4_alive boss_status 1
execute in minecraft:overworld run setblock -13 113 66 oak_wall_sign[facing=east]{front_text:{has_glowing_text:1b,messages:['{"text":"[ BOSS 4 ]","color":"gold","bold":true}','{"text":"Thánh Địa Hư Không","color":"yellow"}','{"text":"Trạng thái:","color":"gray"}','{"text":"☠ ĐANG CHIẾN ĐẤU","color":"red","bold":true}']}}

# 5. Kỹ năng Hố Đen Hư Không quanh Boss
execute at @e[tag=boss_4,limit=1] as @a[distance=3..30] run tp @s ~ ~ ~
execute at @e[tag=boss_4,limit=1] run effect give @a[distance=..35] minecraft:darkness 10 0 true
execute at @e[tag=boss_4,limit=1] run effect give @a[distance=..35] minecraft:levitation 3 1 true
execute at @e[tag=boss_4,limit=1] run effect give @a[distance=..35] minecraft:weakness 8 1 true

# 6. Triệu hồi Quái Vật Hư Không hộ vệ quanh Boss
execute at @e[tag=boss_4,limit=1] run summon endermite ~-2 ~ ~-2 {Tags:["minion_boss_4"],CustomName:'{"text":"Bọ Hư Không","color":"dark_purple"}',CustomNameVisible:1b}
execute at @e[tag=boss_4,limit=1] run summon endermite ~2 ~ ~-2 {Tags:["minion_boss_4"],CustomName:'{"text":"Bọ Hư Không","color":"dark_purple"}',CustomNameVisible:1b}
execute at @e[tag=boss_4,limit=1] run summon endermite ~-2 ~ ~2 {Tags:["minion_boss_4"],CustomName:'{"text":"Bọ Hư Không","color":"dark_purple"}',CustomNameVisible:1b}
execute at @e[tag=boss_4,limit=1] run summon endermite ~2 ~ ~2 {Tags:["minion_boss_4"],CustomName:'{"text":"Bọ Hư Không","color":"dark_purple"}',CustomNameVisible:1b}
execute at @e[tag=boss_4,limit=1] run summon shulker ~0 ~5 ~0 {Tags:["minion_boss_4"],Color:10b,CustomName:'{"text":"Mắt Hư Không","color":"light_purple"}',CustomNameVisible:1b}

# 7. Reset hệ thống skill timer khi triệu hồi lại
scoreboard players set #boss4 boss_4_timer 0
scoreboard players set #boss4_skill_turn boss_skill_rng 0
tag @e[tag=boss_4] remove boss_4_phase2

