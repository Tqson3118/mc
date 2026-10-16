# ==============================================================================
# LỆNH TRIỆU HỒI BOSS CẤP 1: NỮ HOÀNG NHỆN ĐỘC (SPIDER QUEEN - 150 HP)
# Vị trí: Đấu Trường 1 (world_boss X=-180, Y=101, Z=-180) / Động Nhện overworld (X=-29, Y=111, Z=85)
# ==============================================================================

# 1. Dọn dẹp boss cũ và hộ vệ (nếu còn)
scoreboard players set #boss_1_alive boss_status 0
kill @e[tag=boss_1]
kill @e[tag=minion_boss_1]

# 2. Hiệu ứng âm thanh & hạt ma quái
execute in minecraft:world_boss run playsound minecraft:entity.spider.death master @a -180 101 -180 4.0 0.6
execute in minecraft:world_boss run particle minecraft:item_slime -180 102 -180 2 1 2 0.1 80 normal
execute in minecraft:world_boss run particle minecraft:witch -180 102 -180 1.5 1 1.5 0.05 50 normal

execute in minecraft:overworld run playsound minecraft:entity.spider.death master @a -29 111 85 4.0 0.6
execute in minecraft:overworld run particle minecraft:item_slime -29 112 85 2 1 2 0.1 80 normal
execute in minecraft:overworld run particle minecraft:witch -29 112 85 1.5 1 1.5 0.05 50 normal

# 3. Thông báo toàn server
title @a times 10 60 20
title @a title {"text":"🕷 NỮ HOÀNG NHỆN ĐỘC 🕷","color":"green","bold":true}
title @a subtitle {"text":"Boss Cấp 1 (150 HP) đã trỗi dậy tại Đấu Trường Boss (/warp boss1)!","color":"gold"}
tellraw @a [{"text":"[BOSS CẤP 1] ","color":"green","bold":true},{"text":"Nữ Hoàng Nhện Độc (150 HP) đã xuất hiện tại Đấu Trường (/warp boss1)! Kỹ năng: Nhện đẻ con & Phun tơ độc! Phần thưởng: Rơi 100% Mảnh Quặng Cổ Đại (Tier 1-5), 16 Ngọc Lục Bảo & Exp!","color":"yellow"}]

# 4. Triệu hồi Nữ Hoàng Nhện Độc (150 HP, Rơi 100% Mảnh Quặng Cổ Đại ở tay chính)
# 4.1 Ưu tiên triệu hồi tại overworld nếu có người chơi tại Động Nhện
execute in minecraft:overworld if entity @p[x=-29,y=111,z=85,distance=..40] run summon cave_spider -29 111 85 {Tags:["server_boss","boss_1"],CustomName:'{"text":"★ NỮ HOÀNG NHỆN ĐỘC ★ [150 HP]","color":"green","bold":true}',CustomNameVisible:1b,Glowing:1b,PersistenceRequired:1b,attributes:[{id:"minecraft:max_health",base:150.0},{id:"minecraft:attack_damage",base:8.0},{id:"minecraft:movement_speed",base:0.35},{id:"minecraft:knockback_resistance",base:0.6}],Health:150f,HandItems:[{id:"minecraft:prismarine_shard",count:2,components:{"minecraft:custom_name":'{"text":"✦ Mảnh Quặng Cổ Đại ✦","color":"aqua","bold":true,"italic":false}',"minecraft:lore":['{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}','{"text":"Nguyên liệu ngưng tụ từ kỷ nguyên sơ khai.","color":"gray","italic":true}','{"text":"✦ Dùng để luyện kim và rèn trang bị Bậc 1 - 5","color":"dark_aqua","italic":false}','{"text":"[Loại]: Nguyên Liệu Cổ Đại","color":"yellow","bold":true,"italic":false}','{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}'],"minecraft:enchantment_glint_override":true,"minecraft:custom_data":{ancient_mat:"shard"}}},{id:"minecraft:emerald",count:16}],HandDropChances:[1.0f,1.0f]}

# 4.2 Triệu hồi chính tại world_boss Đấu Trường 1 (-180, 101, -180)
execute in minecraft:world_boss unless entity @e[tag=boss_1] run summon cave_spider -180 101 -180 {Tags:["server_boss","boss_1"],CustomName:'{"text":"★ NỮ HOÀNG NHỆN ĐỘC ★ [150 HP]","color":"green","bold":true}',CustomNameVisible:1b,Glowing:1b,PersistenceRequired:1b,attributes:[{id:"minecraft:max_health",base:150.0},{id:"minecraft:attack_damage",base:8.0},{id:"minecraft:movement_speed",base:0.35},{id:"minecraft:knockback_resistance",base:0.6}],Health:150f,HandItems:[{id:"minecraft:prismarine_shard",count:2,components:{"minecraft:custom_name":'{"text":"✦ Mảnh Quặng Cổ Đại ✦","color":"aqua","bold":true,"italic":false}',"minecraft:lore":['{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}','{"text":"Nguyên liệu ngưng tụ từ kỷ nguyên sơ khai.","color":"gray","italic":true}','{"text":"✦ Dùng để luyện kim và rèn trang bị Bậc 1 - 5","color":"dark_aqua","italic":false}','{"text":"[Loại]: Nguyên Liệu Cổ Đại","color":"yellow","bold":true,"italic":false}','{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}'],"minecraft:enchantment_glint_override":true,"minecraft:custom_data":{ancient_mat:"shard"}}},{id:"minecraft:emerald",count:16}],HandDropChances:[1.0f,1.0f]}

# 4.3 Dự phòng nếu world_boss chưa load
execute unless entity @e[tag=boss_1] run summon cave_spider -180 101 -180 {Tags:["server_boss","boss_1"],CustomName:'{"text":"★ NỮ HOÀNG NHỆN ĐỘC ★ [150 HP]","color":"green","bold":true}',CustomNameVisible:1b,Glowing:1b,PersistenceRequired:1b,attributes:[{id:"minecraft:max_health",base:150.0},{id:"minecraft:attack_damage",base:8.0},{id:"minecraft:movement_speed",base:0.35},{id:"minecraft:knockback_resistance",base:0.6}],Health:150f,HandItems:[{id:"minecraft:prismarine_shard",count:2,components:{"minecraft:custom_name":'{"text":"✦ Mảnh Quặng Cổ Đại ✦","color":"aqua","bold":true,"italic":false}',"minecraft:lore":['{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}','{"text":"Nguyên liệu ngưng tụ từ kỷ nguyên sơ khai.","color":"gray","italic":true}','{"text":"✦ Dùng để luyện kim và rèn trang bị Bậc 1 - 5","color":"dark_aqua","italic":false}','{"text":"[Loại]: Nguyên Liệu Cổ Đại","color":"yellow","bold":true,"italic":false}','{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}'],"minecraft:enchantment_glint_override":true,"minecraft:custom_data":{ancient_mat:"shard"}}},{id:"minecraft:emerald",count:16}],HandDropChances:[1.0f,1.0f]}

scoreboard players set #boss_1_alive boss_status 1
execute in minecraft:overworld run setblock -13 113 60 oak_wall_sign[facing=east]{front_text:{has_glowing_text:1b,messages:['{"text":"[ BOSS 1 ]","color":"gold","bold":true}','{"text":"Động Nữ Hoàng Nhện","color":"yellow"}','{"text":"Trạng thái:","color":"gray"}','{"text":"☠ ĐANG CHIẾN ĐẤU","color":"red","bold":true}']}}

# 5. Kỹ năng nhện đẻ con (Triệu hồi 6 Nhện Con Hộ Vệ quanh Boss)
execute at @e[tag=boss_1,limit=1] run summon cave_spider ~-2 ~ ~-2 {Tags:["minion_boss_1"],CustomName:'{"text":"Nhện Con Hộ Vệ","color":"dark_green"}',CustomNameVisible:1b}
execute at @e[tag=boss_1,limit=1] run summon cave_spider ~2 ~ ~-2 {Tags:["minion_boss_1"],CustomName:'{"text":"Nhện Con Hộ Vệ","color":"dark_green"}',CustomNameVisible:1b}
execute at @e[tag=boss_1,limit=1] run summon cave_spider ~-2 ~ ~2 {Tags:["minion_boss_1"],CustomName:'{"text":"Nhện Con Hộ Vệ","color":"dark_green"}',CustomNameVisible:1b}
execute at @e[tag=boss_1,limit=1] run summon cave_spider ~2 ~ ~2 {Tags:["minion_boss_1"],CustomName:'{"text":"Nhện Con Hộ Vệ","color":"dark_green"}',CustomNameVisible:1b}
execute at @e[tag=boss_1,limit=1] run summon cave_spider ~0 ~ ~-3 {Tags:["minion_boss_1"],CustomName:'{"text":"Nhện Con Độc Tố","color":"dark_green"}',CustomNameVisible:1b}
execute at @e[tag=boss_1,limit=1] run summon cave_spider ~0 ~ ~3 {Tags:["minion_boss_1"],CustomName:'{"text":"Nhện Con Độc Tố","color":"dark_green"}',CustomNameVisible:1b}

# 6. Kỹ năng giăng tơ độc trói chân người chơi xung quanh boss
execute at @e[tag=boss_1,limit=1] run effect give @a[distance=..30] minecraft:slowness 6 1 true
execute at @e[tag=boss_1,limit=1] run effect give @a[distance=..30] minecraft:poison 4 0 true

# 7. Reset hệ thống skill timer khi triệu hồi lại
scoreboard players set #boss1 boss_1_timer 0
scoreboard players set #boss1_skill_turn boss_skill_rng 0
tag @e[tag=boss_1] remove boss_1_phase2

