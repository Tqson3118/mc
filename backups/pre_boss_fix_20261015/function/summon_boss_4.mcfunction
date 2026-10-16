# ==============================================================================
# LỆNH TRIỆU HỒI WORLD BOSS CẤP 4: THỰC THỂ HƯ KHÔNG (VOID MONARCH - 1200 HP)
# Vị trí: Thánh Địa Hư Không Phía Nam (X=-35, Y=111, Z=115)
# ==============================================================================

# 1. Dọn dẹp boss cũ và hộ vệ (nếu còn)
scoreboard players set #boss_4_alive boss_status 0
kill @e[tag=boss_4]
kill @e[tag=minion_boss_4]

# 2. Hiệu ứng âm thanh hư không & hạt ma thuật tím
playsound minecraft:entity.warden.roar master @a -35 111 115 5.0 0.7
playsound minecraft:block.beacon.activate master @a -35 111 115 5.0 1.2
particle minecraft:portal -35 112 115 3 2 3 0.5 250 normal
particle minecraft:sonic_boom -35 112 115 0 0 0 0 1 normal

# 3. Thông báo toàn server
title @a times 10 80 20
title @a title {"text":"🌀 CHÚA TỂ HƯ KHÔNG 🌀","color":"dark_purple","bold":true}
title @a subtitle {"text":"WORLD BOSS CẤP 4 (1200 HP) ĐÃ XUẤT HIỆN! TẤT CẢ TẬP HỢP!","color":"light_purple"}
tellraw @a [{"text":"[WORLD BOSS CẤP 4] ","color":"dark_purple","bold":true},{"text":"THỰC THỂ HƯ KHÔNG VÔ TẬN (1200 HP) ĐÃ XUẤT THẾ! Kỹ năng: Hố đen hút trọng lực & Bão hư vô! RƠI 100% LÕI HƯ KHÔNG (Đột phá Tier 13), Sao Nether x2 & 64 Ngọc Lục Bảo!","color":"light_purple"}]

# 4. Triệu hồi World Boss Thực Thể Hư Không (1200 HP, Rơi 100% Lõi Hư Không)
summon wither_skeleton -35 111 115 {Tags:["server_boss","boss_4"],CustomName:'{"text":"🌀 CHÚA TỂ HƯ KHÔNG VÔ TẬN 🌀 [1200 HP]","color":"dark_purple","bold":true}',CustomNameVisible:1b,Glowing:1b,PersistenceRequired:1b,attributes:[{id:"minecraft:max_health",base:1200.0},{id:"minecraft:attack_damage",base:24.0},{id:"minecraft:movement_speed",base:0.36},{id:"minecraft:knockback_resistance",base:1.0}],Health:1200f,HandItems:[{id:"minecraft:netherite_sword",count:1,components:{"minecraft:enchantments":{levels:{"minecraft:sharpness":10,"minecraft:knockback":3}},"minecraft:custom_name":'{"text":"Lưỡi Kiếm Hư Không Tận Diệt","color":"dark_purple","bold":true}'}},{id:"minecraft:echo_shard",count:1,components:{"minecraft:custom_name":'{"text":"🌀 Lõi Hư Không 🌀","color":"dark_purple","bold":true,"italic":false}',"minecraft:lore":['{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}','{"text":"Chứa đựng trọng lực vô tận từ không gian hư vô.","color":"gray","italic":true}','{"text":"⚡ Nguyên liệu ĐỘT PHÁ bắt buộc cho mốc TIER 13!","color":"light_purple","bold":true,"italic":false}','{"text":"✦ Trao đổi tại Đại Sư Luyện Kim","color":"aqua","italic":false}','{"text":"[Loại]: Nguyên Liệu Tối Thượng","color":"dark_purple","bold":true,"italic":false}','{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray","italic":false}'],"minecraft:enchantment_glint_override":true,"minecraft:custom_data":{ancient_mat:"void_core"}}}],ArmorItems:[{},{},{},{}],HandDropChances:[0.5f,1.0f],ArmorDropChances:[0.3f,0.3f,0.3f,0.5f]}
scoreboard players set #boss_4_alive boss_status 1
setblock -13 113 66 oak_wall_sign[facing=east]{front_text:{has_glowing_text:1b,messages:['{"text":"[ BOSS 4 ]","color":"gold","bold":true}','{"text":"Thánh Địa Hư Không","color":"yellow"}','{"text":"Trạng thái:","color":"gray"}','{"text":"☠ ĐANG CHIẾN ĐẤU","color":"red","bold":true}']}}

# 5. Kỹ năng Hố Đen Hư Không (Kéo mọi người chơi xung quanh về phía boss)
execute at @e[tag=boss_4] run tp @a[x=-45,y=108,z=100,dx=22,dy=20,dz=30] ~ ~ ~
effect give @a[x=-45,y=108,z=100,dx=22,dy=20,dz=30] minecraft:darkness 10 0 true
effect give @a[x=-45,y=108,z=100,dx=22,dy=20,dz=30] minecraft:levitation 3 1 true
effect give @a[x=-45,y=108,z=100,dx=22,dy=20,dz=30] minecraft:weakness 8 1 true

# 6. Triệu hồi Quái Vật Hư Không hộ vệ
summon endermite -37 111 113 {Tags:["minion_boss_4"],CustomName:'{"text":"Bọ Hư Không","color":"dark_purple"}',CustomNameVisible:1b}
summon endermite -33 111 113 {Tags:["minion_boss_4"],CustomName:'{"text":"Bọ Hư Không","color":"dark_purple"}',CustomNameVisible:1b}
summon endermite -37 111 117 {Tags:["minion_boss_4"],CustomName:'{"text":"Bọ Hư Không","color":"dark_purple"}',CustomNameVisible:1b}
summon endermite -33 111 117 {Tags:["minion_boss_4"],CustomName:'{"text":"Bọ Hư Không","color":"dark_purple"}',CustomNameVisible:1b}
summon shulker -35 116 115 {Tags:["minion_boss_4"],Color:10b,CustomName:'{"text":"Mắt Hư Không","color":"light_purple"}',CustomNameVisible:1b}

# 7. Reset hệ thống skill timer khi triệu hồi lại
scoreboard players set #boss4 boss_4_timer 0
scoreboard players set #boss4_skill_turn boss_skill_rng 0
tag @e[tag=boss_4] remove boss_4_phase2

