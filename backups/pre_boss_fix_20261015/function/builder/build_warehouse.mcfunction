# ==============================================================================
# SKYBLOCK BUILDER - KHO LƯU TRỮ ĐỒ LỚN (GRAND STORAGE VAULT)
# ==============================================================================
# Kích thước: 13x15 x H8 block phía trước người chơi
# Chi phí: $30,000 Xu Vault | 36 Rương Đôi (72 rương ghép), Ender Chest, Đe sắt, Lò luyện kim
# Kiến trúc: Khung đá Deepslate gạch & Gỗ vân sam trầm, Mái vòm chữ A kiên cố, Lối đi tầng lửng
# ==============================================================================

# 1. Âm thanh kích hoạt & Hiệu ứng
execute at @s run playsound minecraft:block.chest.open master @a ~ ~ ~ 1.5 1.0
execute at @s run playsound minecraft:block.anvil.use player @s ~ ~ ~ 1.2 0.8
execute at @s run playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1.2 1.4

# 2. Xóa không gian & Nền móng kiên cố (13x15, X=-6..6, Z=2..14, Y=-1..8)
execute at @s rotated ~ 0 run fill ^-6 ^-1 ^2 ^6 ^-1 ^14 polished_deepslate
execute at @s rotated ~ 0 run fill ^-6 ^0 ^2 ^6 ^0 ^14 spruce_planks
execute at @s rotated ~ 0 run fill ^-1 ^0 ^2 ^1 ^0 ^14 polished_andesite

# Dọn sạch lòng kho (Y=1..7)
execute at @s rotated ~ 0 run fill ^-5 ^1 ^3 ^5 ^7 ^13 air

# 3. Trụ Cột Góc & Tường Bao (Y=1..5)
# 4 Cột trụ góc gỗ vân sam bóc vỏ
execute at @s rotated ~ 0 run fill ^-6 ^1 ^2 ^-6 ^5 ^2 stripped_spruce_log
execute at @s rotated ~ 0 run fill ^6 ^1 ^2 ^6 ^5 ^2 stripped_spruce_log
execute at @s rotated ~ 0 run fill ^-6 ^1 ^14 ^-6 ^5 ^14 stripped_spruce_log
execute at @s rotated ~ 0 run fill ^6 ^1 ^14 ^6 ^5 ^14 stripped_spruce_log

# Tường đá Deepslate Bricks
execute at @s rotated ~ 0 run fill ^-5 ^1 ^2 ^5 ^5 ^2 deepslate_bricks
execute at @s rotated ~ 0 run fill ^-5 ^1 ^14 ^5 ^5 ^14 deepslate_bricks
execute at @s rotated ~ 0 run fill ^-6 ^1 ^3 ^-6 ^5 ^13 deepslate_bricks
execute at @s rotated ~ 0 run fill ^6 ^1 ^3 ^6 ^5 ^13 deepslate_bricks

# Cửa chính gỗ vân sam 2 cánh rộng rãi (X=-1..0, Z=2)
execute at @s rotated ~ 0 run setblock ^-1 ^1 ^2 air
execute at @s rotated ~ 0 run setblock ^-1 ^2 ^2 air
execute at @s rotated ~ 0 run setblock ^0 ^1 ^2 air
execute at @s rotated ~ 0 run setblock ^0 ^2 ^2 air
execute at @s rotated ~ 0 run setblock ^-1 ^1 ^2 spruce_door[facing=north,half=lower,hinge=right]
execute at @s rotated ~ 0 run setblock ^-1 ^2 ^2 spruce_door[facing=north,half=upper,hinge=right]
execute at @s rotated ~ 0 run setblock ^0 ^1 ^2 spruce_door[facing=north,half=lower,hinge=left]
execute at @s rotated ~ 0 run setblock ^0 ^2 ^2 spruce_door[facing=north,half=upper,hinge=left]
execute at @s rotated ~ 0 run setblock ^-1 ^3 ^2 stripped_spruce_wood
execute at @s rotated ~ 0 run setblock ^0 ^3 ^2 stripped_spruce_wood

# Cửa sổ kính lấy sáng 2 bên hông (Z=6..10)
execute at @s rotated ~ 0 run fill ^-6 ^2 ^6 ^-6 ^4 ^10 tinted_glass
execute at @s rotated ~ 0 run fill ^6 ^2 ^6 ^6 ^4 ^10 tinted_glass

# 4. HỆ THỐNG 36 RƯƠNG ĐÔI (3 TẦNG KỆ GỖ THÔNG THOÁNG)
# --- Vách trái (X=-5, hướng mặt sang east):
# Tầng 1 (Y=1): 5 rương đôi
execute at @s rotated ~ 0 run setblock ^-5 ^1 ^4 chest[facing=east,type=right]
execute at @s rotated ~ 0 run setblock ^-5 ^1 ^5 chest[facing=east,type=left]
execute at @s rotated ~ 0 run setblock ^-5 ^1 ^6 chest[facing=east,type=right]
execute at @s rotated ~ 0 run setblock ^-5 ^1 ^7 chest[facing=east,type=left]
execute at @s rotated ~ 0 run setblock ^-5 ^1 ^8 chest[facing=east,type=right]
execute at @s rotated ~ 0 run setblock ^-5 ^1 ^9 chest[facing=east,type=left]
execute at @s rotated ~ 0 run setblock ^-5 ^1 ^10 chest[facing=east,type=right]
execute at @s rotated ~ 0 run setblock ^-5 ^1 ^11 chest[facing=east,type=left]
execute at @s rotated ~ 0 run setblock ^-5 ^1 ^12 chest[facing=east,type=right]
execute at @s rotated ~ 0 run setblock ^-5 ^1 ^13 chest[facing=east,type=left]

# Tầng 2 (Y=2): 5 rương đôi
execute at @s rotated ~ 0 run setblock ^-5 ^2 ^4 chest[facing=east,type=right]
execute at @s rotated ~ 0 run setblock ^-5 ^2 ^5 chest[facing=east,type=left]
execute at @s rotated ~ 0 run setblock ^-5 ^2 ^6 chest[facing=east,type=right]
execute at @s rotated ~ 0 run setblock ^-5 ^2 ^7 chest[facing=east,type=left]
execute at @s rotated ~ 0 run setblock ^-5 ^2 ^8 chest[facing=east,type=right]
execute at @s rotated ~ 0 run setblock ^-5 ^2 ^9 chest[facing=east,type=left]
execute at @s rotated ~ 0 run setblock ^-5 ^2 ^10 chest[facing=east,type=right]
execute at @s rotated ~ 0 run setblock ^-5 ^2 ^11 chest[facing=east,type=left]
execute at @s rotated ~ 0 run setblock ^-5 ^2 ^12 chest[facing=east,type=right]
execute at @s rotated ~ 0 run setblock ^-5 ^2 ^13 chest[facing=east,type=left]

# Kệ đỡ & Lối đi tầng lửng vách trái (Y=3)
execute at @s rotated ~ 0 run fill ^-4 ^3 ^4 ^-4 ^3 ^13 spruce_slab[type=top]
execute at @s rotated ~ 0 run setblock ^-4 ^1 ^3 spruce_stairs[facing=south]
execute at @s rotated ~ 0 run setblock ^-4 ^2 ^3 spruce_planks
execute at @s rotated ~ 0 run setblock ^-4 ^3 ^3 spruce_slab[type=top]

# Tầng 3 (Y=4): 5 rương đôi
execute at @s rotated ~ 0 run setblock ^-5 ^4 ^4 chest[facing=east,type=right]
execute at @s rotated ~ 0 run setblock ^-5 ^4 ^5 chest[facing=east,type=left]
execute at @s rotated ~ 0 run setblock ^-5 ^4 ^6 chest[facing=east,type=right]
execute at @s rotated ~ 0 run setblock ^-5 ^4 ^7 chest[facing=east,type=left]
execute at @s rotated ~ 0 run setblock ^-5 ^4 ^8 chest[facing=east,type=right]
execute at @s rotated ~ 0 run setblock ^-5 ^4 ^9 chest[facing=east,type=left]
execute at @s rotated ~ 0 run setblock ^-5 ^4 ^10 chest[facing=east,type=right]
execute at @s rotated ~ 0 run setblock ^-5 ^4 ^11 chest[facing=east,type=left]
execute at @s rotated ~ 0 run setblock ^-5 ^4 ^12 chest[facing=east,type=right]
execute at @s rotated ~ 0 run setblock ^-5 ^4 ^13 chest[facing=east,type=left]

# --- Vách phải (X=5, hướng mặt sang west):
# Tầng 1 (Y=1): 5 rương đôi
execute at @s rotated ~ 0 run setblock ^5 ^1 ^4 chest[facing=west,type=left]
execute at @s rotated ~ 0 run setblock ^5 ^1 ^5 chest[facing=west,type=right]
execute at @s rotated ~ 0 run setblock ^5 ^1 ^6 chest[facing=west,type=left]
execute at @s rotated ~ 0 run setblock ^5 ^1 ^7 chest[facing=west,type=right]
execute at @s rotated ~ 0 run setblock ^5 ^1 ^8 chest[facing=west,type=left]
execute at @s rotated ~ 0 run setblock ^5 ^1 ^9 chest[facing=west,type=right]
execute at @s rotated ~ 0 run setblock ^5 ^1 ^10 chest[facing=west,type=left]
execute at @s rotated ~ 0 run setblock ^5 ^1 ^11 chest[facing=west,type=right]
execute at @s rotated ~ 0 run setblock ^5 ^1 ^12 chest[facing=west,type=left]
execute at @s rotated ~ 0 run setblock ^5 ^1 ^13 chest[facing=west,type=right]

# Tầng 2 (Y=2): 5 rương đôi
execute at @s rotated ~ 0 run setblock ^5 ^2 ^4 chest[facing=west,type=left]
execute at @s rotated ~ 0 run setblock ^5 ^2 ^5 chest[facing=west,type=right]
execute at @s rotated ~ 0 run setblock ^5 ^2 ^6 chest[facing=west,type=left]
execute at @s rotated ~ 0 run setblock ^5 ^2 ^7 chest[facing=west,type=right]
execute at @s rotated ~ 0 run setblock ^5 ^2 ^8 chest[facing=west,type=left]
execute at @s rotated ~ 0 run setblock ^5 ^2 ^9 chest[facing=west,type=right]
execute at @s rotated ~ 0 run setblock ^5 ^2 ^10 chest[facing=west,type=left]
execute at @s rotated ~ 0 run setblock ^5 ^2 ^11 chest[facing=west,type=right]
execute at @s rotated ~ 0 run setblock ^5 ^2 ^12 chest[facing=west,type=left]
execute at @s rotated ~ 0 run setblock ^5 ^2 ^13 chest[facing=west,type=right]

# Kệ đỡ & Lối đi tầng lửng vách phải (Y=3)
execute at @s rotated ~ 0 run fill ^4 ^3 ^4 ^4 ^3 ^13 spruce_slab[type=top]
execute at @s rotated ~ 0 run setblock ^4 ^1 ^3 spruce_stairs[facing=south]
execute at @s rotated ~ 0 run setblock ^4 ^2 ^3 spruce_planks
execute at @s rotated ~ 0 run setblock ^4 ^3 ^3 spruce_slab[type=top]

# Tầng 3 (Y=4): 5 rương đôi
execute at @s rotated ~ 0 run setblock ^5 ^4 ^4 chest[facing=west,type=left]
execute at @s rotated ~ 0 run setblock ^5 ^4 ^5 chest[facing=west,type=right]
execute at @s rotated ~ 0 run setblock ^5 ^4 ^6 chest[facing=west,type=left]
execute at @s rotated ~ 0 run setblock ^5 ^4 ^7 chest[facing=west,type=right]
execute at @s rotated ~ 0 run setblock ^5 ^4 ^8 chest[facing=west,type=left]
execute at @s rotated ~ 0 run setblock ^5 ^4 ^9 chest[facing=west,type=right]
execute at @s rotated ~ 0 run setblock ^5 ^4 ^10 chest[facing=west,type=left]
execute at @s rotated ~ 0 run setblock ^5 ^4 ^11 chest[facing=west,type=right]
execute at @s rotated ~ 0 run setblock ^5 ^4 ^12 chest[facing=west,type=left]
execute at @s rotated ~ 0 run setblock ^5 ^4 ^13 chest[facing=west,type=right]

# --- Vách cuối kho (Z=13, hướng mặt sang north): 6 rương đôi
execute at @s rotated ~ 0 run setblock ^-2 ^1 ^13 chest[facing=north,type=right]
execute at @s rotated ~ 0 run setblock ^-1 ^1 ^13 chest[facing=north,type=left]
execute at @s rotated ~ 0 run setblock ^1 ^1 ^13 chest[facing=north,type=right]
execute at @s rotated ~ 0 run setblock ^2 ^1 ^13 chest[facing=north,type=left]

execute at @s rotated ~ 0 run setblock ^-2 ^2 ^13 chest[facing=north,type=right]
execute at @s rotated ~ 0 run setblock ^-1 ^2 ^13 chest[facing=north,type=left]
execute at @s rotated ~ 0 run setblock ^1 ^2 ^13 chest[facing=north,type=right]
execute at @s rotated ~ 0 run setblock ^2 ^2 ^13 chest[facing=north,type=left]

execute at @s rotated ~ 0 run setblock ^-2 ^4 ^13 chest[facing=north,type=right]
execute at @s rotated ~ 0 run setblock ^-1 ^4 ^13 chest[facing=north,type=left]
execute at @s rotated ~ 0 run setblock ^1 ^4 ^13 chest[facing=north,type=right]
execute at @s rotated ~ 0 run setblock ^2 ^4 ^13 chest[facing=north,type=left]

# Cầu thang tầng lửng vách cuối kết nối 2 bên (Y=3)
execute at @s rotated ~ 0 run fill ^-3 ^3 ^13 ^3 ^3 ^13 spruce_slab[type=top]

# 5. TIỆN ÍCH TRUNG TÂM KHO (Ender Chest, Anvil, Lò nung, Bàn chế tạo, Bàn rèn)
execute at @s rotated ~ 0 run setblock ^0 ^1 ^13 ender_chest[facing=north]
execute at @s rotated ~ 0 run setblock ^-2 ^1 ^4 anvil[facing=north]
execute at @s rotated ~ 0 run setblock ^2 ^1 ^4 crafting_table
execute at @s rotated ~ 0 run setblock ^-2 ^1 ^5 blast_furnace[facing=east]
execute at @s rotated ~ 0 run setblock ^2 ^1 ^5 smoker[facing=west]
execute at @s rotated ~ 0 run setblock ^-2 ^1 ^6 smithing_table
execute at @s rotated ~ 0 run setblock ^2 ^1 ^6 stonecutter[facing=west]
execute at @s rotated ~ 0 run setblock ^-2 ^1 ^7 grindstone[face=floor,facing=north]
execute at @s rotated ~ 0 run setblock ^2 ^1 ^7 barrel[facing=up]

# 6. MÁI VÒM CHỮ A KIÊN CỐ & ĐÈN CHIẾU SÁNG (Y=6..8)
# Tường hồi hình tam giác ở 2 đầu (Z=2 và Z=14)
execute at @s rotated ~ 0 run fill ^-5 ^6 ^2 ^5 ^6 ^2 deepslate_bricks
execute at @s rotated ~ 0 run fill ^-3 ^7 ^2 ^3 ^7 ^2 deepslate_bricks
execute at @s rotated ~ 0 run fill ^-1 ^8 ^2 ^1 ^8 ^2 deepslate_bricks

execute at @s rotated ~ 0 run fill ^-5 ^6 ^14 ^5 ^6 ^14 deepslate_bricks
execute at @s rotated ~ 0 run fill ^-3 ^7 ^14 ^3 ^7 ^14 deepslate_bricks
execute at @s rotated ~ 0 run fill ^-1 ^8 ^14 ^1 ^8 ^14 deepslate_bricks

# Mái ngói dốc 2 bên từ X=-6 đến X=6
execute at @s rotated ~ 0 run fill ^-6 ^6 ^2 ^-6 ^6 ^14 deepslate_tile_stairs[facing=east]
execute at @s rotated ~ 0 run fill ^6 ^6 ^2 ^6 ^6 ^14 deepslate_tile_stairs[facing=west]

execute at @s rotated ~ 0 run fill ^-4 ^7 ^2 ^-4 ^7 ^14 spruce_stairs[facing=east]
execute at @s rotated ~ 0 run fill ^4 ^7 ^2 ^4 ^7 ^14 spruce_stairs[facing=west]

execute at @s rotated ~ 0 run fill ^-2 ^8 ^2 ^-2 ^8 ^14 spruce_stairs[facing=east]
execute at @s rotated ~ 0 run fill ^2 ^8 ^2 ^2 ^8 ^14 spruce_stairs[facing=west]

# Đỉnh mái kính giếng trời lấy sáng
execute at @s rotated ~ 0 run fill ^-1 ^8 ^2 ^1 ^8 ^14 glass
execute at @s rotated ~ 0 run fill ^-1 ^9 ^2 ^1 ^9 ^14 spruce_slab

# Đèn lồng sắt treo từ xà mái
execute at @s rotated ~ 0 run setblock ^0 ^8 ^5 chain[axis=y]
execute at @s rotated ~ 0 run setblock ^0 ^7 ^5 lantern[hanging=true]
execute at @s rotated ~ 0 run setblock ^0 ^8 ^8 chain[axis=y]
execute at @s rotated ~ 0 run setblock ^0 ^7 ^8 lantern[hanging=true]
execute at @s rotated ~ 0 run setblock ^0 ^8 ^11 chain[axis=y]
execute at @s rotated ~ 0 run setblock ^0 ^7 ^11 lantern[hanging=true]

# 7. Pháo hoa & Thẻ tag
execute at @s rotated ~ 0 run summon firework_rocket ^0 ^9 ^8 {LifeTime:25,FireworksItem:{id:"firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"burst",colors:[16753920,16777215,65535]}]}}}}

tag @s add built_warehouse
tag @s remove built_villa
tag @s remove built_castle
tag @s remove built_modern
tag @s remove built_garden
tag @s remove built_bridge
tag @s remove built_pagoda
tag @s remove built_windmill
tag @s remove built_greenhouse
tag @s remove built_enchant
tag @s remove built_lighthouse
tag @s remove built_nethergate

tellraw @s [{"text":"\n📦✨ [KIẾN TRÚC SƯ ĐẢO] ","color":"gold","bold":true},{"text":"Đã thi công hoàn tất ","color":"yellow"},{"text":"Kho Lưu Trữ 36 Rương Lớn!\n","color":"gold","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n","color":"dark_gray"},{"text":"📐 Quy mô: ","color":"aqua"},{"text":"13x15 x H9 blocks | Khung đá Deepslate, gỗ vân sam & mái chữ A giếng trời\n","color":"white"},{"text":"🧰 Tiện ích: ","color":"green"},{"text":"36 Rương Đôi (72 rương ghép), Lối đi tầng lửng, Ender Chest, Đe sắt, Lò luyện kim & Bàn rèn\n","color":"white"},{"text":"🛡️ Hoàn tác: ","color":"gold"},{"text":"Gõ ","color":"gray"},{"text":"/is undo","color":"yellow","bold":true},{"text":" trong 3 phút nếu muốn dỡ bỏ hoàn 90% tiền!\n","color":"gray"},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"}]
