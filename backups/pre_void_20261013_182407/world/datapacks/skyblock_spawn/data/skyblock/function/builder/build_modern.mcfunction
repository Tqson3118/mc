# ==============================================================================
# SKYBLOCK BUILDER - CĂN HỘ PENTHOUSE KÍNH & HỒ BƠI VÔ CỰC (MODERN SKYBOX)
# ==============================================================================
# Kích thước: 15x15 x H9 block phía trước người chơi
# Chi phí: $50,000 Xu Vault | Hồ bơi vô cực, Sàn thạch anh, Phòng ngủ hiện đại
# ==============================================================================

# 1. Âm thanh kích hoạt & Hiệu ứng
execute at @s run playsound minecraft:block.glass.place master @a ~ ~ ~ 1.5 1.0
execute at @s run playsound minecraft:ambient.underwater.enter player @s ~ ~ ~ 1.2 1.2
execute at @s run playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1.2 1.4

# 2. Nền móng & Sàn thạch anh mài (15x15 tại Y=-1..0)
execute at @s rotated ~ 0 run fill ^-7 ^-1 ^2 ^7 ^-1 ^16 smooth_quartz
execute at @s rotated ~ 0 run fill ^-7 ^0 ^2 ^7 ^0 ^16 smooth_quartz

# 3. Hồ Bơi Vô Cực Ban Công (X=-6..-1, Z=11..15, Y=0..1)
execute at @s rotated ~ 0 run fill ^-6 ^-1 ^11 ^-1 ^-1 ^15 sea_lantern
execute at @s rotated ~ 0 run fill ^-6 ^0 ^11 ^-1 ^0 ^15 water
execute at @s rotated ~ 0 run fill ^-7 ^0 ^10 ^0 ^0 ^10 smooth_quartz_slab
execute at @s rotated ~ 0 run fill ^-7 ^1 ^11 ^-7 ^1 ^15 glass
execute at @s rotated ~ 0 run fill ^-6 ^1 ^16 ^-1 ^1 ^16 glass

# Ghế nằm thư giãn cạnh hồ bơi
execute at @s rotated ~ 0 run setblock ^1 ^1 ^12 birch_stairs[facing=west]
execute at @s rotated ~ 0 run setblock ^2 ^1 ^12 birch_slab
execute at @s rotated ~ 0 run setblock ^1 ^1 ^14 birch_stairs[facing=west]
execute at @s rotated ~ 0 run setblock ^2 ^1 ^14 birch_slab

# 4. Tường Kính Toàn Cảnh & Cột Thạch Anh (Y=1..4)
execute at @s rotated ~ 0 run fill ^-7 ^1 ^2 ^7 ^4 ^2 tinted_glass
execute at @s rotated ~ 0 run fill ^-7 ^1 ^3 ^-7 ^4 ^10 tinted_glass
execute at @s rotated ~ 0 run fill ^7 ^1 ^3 ^7 ^4 ^16 tinted_glass
execute at @s rotated ~ 0 run fill ^-7 ^1 ^10 ^7 ^4 ^10 smooth_quartz
execute at @s rotated ~ 0 run setblock ^0 ^1 ^10 air
execute at @s rotated ~ 0 run setblock ^0 ^2 ^10 air

# 4 Cột trụ góc
execute at @s rotated ~ 0 run fill ^-7 ^1 ^2 ^-7 ^5 ^2 quartz_pillar
execute at @s rotated ~ 0 run fill ^7 ^1 ^2 ^7 ^5 ^2 quartz_pillar
execute at @s rotated ~ 0 run fill ^-7 ^1 ^16 ^-7 ^5 ^16 quartz_pillar
execute at @s rotated ~ 0 run fill ^7 ^1 ^16 ^7 ^5 ^16 quartz_pillar

# 5. Nội Thất Penthouse Sang Trọng (Phòng Khách & Phòng Ngủ)
# Cửa chính
execute at @s rotated ~ 0 run setblock ^0 ^1 ^2 iron_door[facing=north,half=lower]
execute at @s rotated ~ 0 run setblock ^0 ^2 ^2 iron_door[facing=north,half=upper]
execute at @s rotated ~ 0 run setblock ^1 ^1 ^1 stone_button[facing=north]

# Phòng khách: Sofa trắng, bàn trà kính, đèn trần
execute at @s rotated ~ 0 run fill ^-5 ^1 ^4 ^-2 ^1 ^4 smooth_quartz_stairs[facing=south]
execute at @s rotated ~ 0 run setblock ^-5 ^1 ^5 smooth_quartz_stairs[facing=east]
execute at @s rotated ~ 0 run setblock ^-3 ^1 ^6 tinted_glass
execute at @s rotated ~ 0 run setblock ^-3 ^2 ^6 sea_pickle

# Phòng ngủ: Giường đen đôi, tủ sách, rương
execute at @s rotated ~ 0 run setblock ^4 ^1 ^4 black_bed[facing=north,part=head]
execute at @s rotated ~ 0 run setblock ^4 ^1 ^3 black_bed[facing=north,part=foot]
execute at @s rotated ~ 0 run setblock ^5 ^1 ^4 black_bed[facing=north,part=head]
execute at @s rotated ~ 0 run setblock ^5 ^1 ^3 black_bed[facing=north,part=foot]
execute at @s rotated ~ 0 run setblock ^6 ^1 ^4 bookshelf
execute at @s rotated ~ 0 run setblock ^3 ^1 ^4 chest[facing=south]

# 6. Mái Bằng Hiện Đại & Đèn Trần (Y=5)
execute at @s rotated ~ 0 run fill ^-7 ^5 ^2 ^7 ^5 ^16 smooth_quartz
execute at @s rotated ~ 0 run fill ^-6 ^5 ^3 ^6 ^5 ^15 smooth_quartz_slab
execute at @s rotated ~ 0 run setblock ^-3 ^4 ^5 sea_lantern
execute at @s rotated ~ 0 run setblock ^4 ^4 ^5 sea_lantern
execute at @s rotated ~ 0 run setblock ^0 ^4 ^13 sea_lantern

# 7. Pháo hoa & Thẻ tag
execute at @s rotated ~ 0 run summon firework_rocket ^0 ^7 ^9 {LifeTime:25,FireworksItem:{id:"firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"burst",colors:[16777215,65535,3847130]}]}}}}

tag @s add built_modern
tag @s remove built_villa
tag @s remove built_castle
tag @s remove built_garden
tag @s remove built_bridge
tag @s remove built_pagoda
tag @s remove built_windmill
tag @s remove built_warehouse
tag @s remove built_greenhouse
tag @s remove built_enchant
tag @s remove built_lighthouse
tag @s remove built_nethergate

tellraw @s [{"text":"\n🏙️✨ [KIẾN TRÚC SƯ ĐẢO] ","color":"aqua","bold":true},{"text":"Đã thi công hoàn tất ","color":"yellow"},{"text":"Căn Hộ Penthouse Kính & Hồ Bơi Vô Cực!\n","color":"gold","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n","color":"dark_gray"},{"text":"📐 Quy mô: ","color":"aqua"},{"text":"15x15 x H9 blocks | Phong cách hiện đại siêu sang\n","color":"white"},{"text":"🏊 Tiện ích: ","color":"green"},{"text":"Hồ bơi vô cực ngắm mây, sàn thạch anh, sofa & phòng ngủ hiện đại\n","color":"white"},{"text":"🛡️ Hoàn tác: ","color":"gold"},{"text":"Gõ ","color":"gray"},{"text":"/is undo","color":"yellow","bold":true},{"text":" trong 3 phút nếu muốn dỡ bỏ hoàn 90% tiền!\n","color":"gray"},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"}]
