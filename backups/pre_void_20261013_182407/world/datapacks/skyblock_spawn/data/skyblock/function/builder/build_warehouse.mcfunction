# ==============================================================================
# SKYBLOCK BUILDER - KHO LƯU TRỮ ĐỒ LỚN (GRAND STORAGE VAULT)
# ==============================================================================
# Kích thước: 13x15 x H7 block phía trước người chơi
# Chi phí: $30,000 Xu Vault | Đúng chuẩn 36 Rương Đôi, Ender Chest, Đe sắt, Lò luyện kim
# ==============================================================================

# 1. Âm thanh kích hoạt & Hiệu ứng
execute at @s run playsound minecraft:block.chest.open master @a ~ ~ ~ 1.5 1.0
execute at @s run playsound minecraft:block.anvil.use player @s ~ ~ ~ 1.2 0.8
execute at @s run playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1.2 1.4

# 2. Nền Móng Đá & Sàn Kho Gỗ Trầm (13x15 tại Y=-1..0)
execute at @s rotated ~ 0 run fill ^-5 ^-1 ^2 ^5 ^-1 ^14 polished_deepslate
execute at @s rotated ~ 0 run fill ^-4 ^0 ^3 ^4 ^0 ^13 spruce_planks
execute at @s rotated ~ 0 run fill ^-1 ^0 ^3 ^1 ^0 ^13 polished_andesite

# 3. Tường Đá & Khung Gỗ Vân Sam (Y=1..5)
execute at @s rotated ~ 0 run fill ^-5 ^1 ^2 ^5 ^4 ^2 deepslate_bricks
execute at @s rotated ~ 0 run fill ^-5 ^1 ^14 ^5 ^4 ^14 deepslate_bricks
execute at @s rotated ~ 0 run fill ^-5 ^1 ^3 ^-5 ^4 ^13 deepslate_bricks
execute at @s rotated ~ 0 run fill ^5 ^1 ^3 ^5 ^4 ^13 deepslate_bricks

# Cửa chính vào kho
execute at @s rotated ~ 0 run setblock ^0 ^1 ^2 iron_door[facing=north,half=lower]
execute at @s rotated ~ 0 run setblock ^0 ^2 ^2 iron_door[facing=north,half=upper]
execute at @s rotated ~ 0 run setblock ^1 ^1 ^1 stone_button[facing=north]
execute at @s rotated ~ 0 run setblock ^-1 ^1 ^3 stone_button[facing=south]

# Cửa sổ kính lấy sáng
execute at @s rotated ~ 0 run fill ^-5 ^2 ^6 ^-5 ^3 ^10 tinted_glass
execute at @s rotated ~ 0 run fill ^5 ^2 ^6 ^5 ^3 ^10 tinted_glass

# 4. HỆ THỐNG 36 RƯƠNG ĐÔI (3 TẦNG KỆ GỖ THÔNG THOÁNG)
# --- Vách trái (X=-4, hướng mặt sang east: type=left Z chẵn, type=right Z lẻ):
# Tầng 1 (Y=1): 5 rương đôi
execute at @s rotated ~ 0 run setblock ^-4 ^1 ^4 chest[facing=east,type=right]
execute at @s rotated ~ 0 run setblock ^-4 ^1 ^5 chest[facing=east,type=left]
execute at @s rotated ~ 0 run setblock ^-4 ^1 ^6 chest[facing=east,type=right]
execute at @s rotated ~ 0 run setblock ^-4 ^1 ^7 chest[facing=east,type=left]
execute at @s rotated ~ 0 run setblock ^-4 ^1 ^8 chest[facing=east,type=right]
execute at @s rotated ~ 0 run setblock ^-4 ^1 ^9 chest[facing=east,type=left]
execute at @s rotated ~ 0 run setblock ^-4 ^1 ^10 chest[facing=east,type=right]
execute at @s rotated ~ 0 run setblock ^-4 ^1 ^11 chest[facing=east,type=left]
execute at @s rotated ~ 0 run setblock ^-4 ^1 ^12 chest[facing=east,type=right]
execute at @s rotated ~ 0 run setblock ^-4 ^1 ^13 chest[facing=east,type=left]

# Tầng 2 (Y=2): 5 rương đôi
execute at @s rotated ~ 0 run setblock ^-4 ^2 ^4 chest[facing=east,type=right]
execute at @s rotated ~ 0 run setblock ^-4 ^2 ^5 chest[facing=east,type=left]
execute at @s rotated ~ 0 run setblock ^-4 ^2 ^6 chest[facing=east,type=right]
execute at @s rotated ~ 0 run setblock ^-4 ^2 ^7 chest[facing=east,type=left]
execute at @s rotated ~ 0 run setblock ^-4 ^2 ^8 chest[facing=east,type=right]
execute at @s rotated ~ 0 run setblock ^-4 ^2 ^9 chest[facing=east,type=left]
execute at @s rotated ~ 0 run setblock ^-4 ^2 ^10 chest[facing=east,type=right]
execute at @s rotated ~ 0 run setblock ^-4 ^2 ^11 chest[facing=east,type=left]
execute at @s rotated ~ 0 run setblock ^-4 ^2 ^12 chest[facing=east,type=right]
execute at @s rotated ~ 0 run setblock ^-4 ^2 ^13 chest[facing=east,type=left]

# Tầng 3 (Y=3): 5 rương đôi
execute at @s rotated ~ 0 run setblock ^-4 ^3 ^4 chest[facing=east,type=right]
execute at @s rotated ~ 0 run setblock ^-4 ^3 ^5 chest[facing=east,type=left]
execute at @s rotated ~ 0 run setblock ^-4 ^3 ^6 chest[facing=east,type=right]
execute at @s rotated ~ 0 run setblock ^-4 ^3 ^7 chest[facing=east,type=left]
execute at @s rotated ~ 0 run setblock ^-4 ^3 ^8 chest[facing=east,type=right]
execute at @s rotated ~ 0 run setblock ^-4 ^3 ^9 chest[facing=east,type=left]
execute at @s rotated ~ 0 run setblock ^-4 ^3 ^10 chest[facing=east,type=right]
execute at @s rotated ~ 0 run setblock ^-4 ^3 ^11 chest[facing=east,type=left]
execute at @s rotated ~ 0 run setblock ^-4 ^3 ^12 chest[facing=east,type=right]
execute at @s rotated ~ 0 run setblock ^-4 ^3 ^13 chest[facing=east,type=left]

# --- Vách phải (X=4, hướng mặt sang west: type=left Z lẻ, type=right Z chẵn):
# Tầng 1 (Y=1): 5 rương đôi
execute at @s rotated ~ 0 run setblock ^4 ^1 ^4 chest[facing=west,type=left]
execute at @s rotated ~ 0 run setblock ^4 ^1 ^5 chest[facing=west,type=right]
execute at @s rotated ~ 0 run setblock ^4 ^1 ^6 chest[facing=west,type=left]
execute at @s rotated ~ 0 run setblock ^4 ^1 ^7 chest[facing=west,type=right]
execute at @s rotated ~ 0 run setblock ^4 ^1 ^8 chest[facing=west,type=left]
execute at @s rotated ~ 0 run setblock ^4 ^1 ^9 chest[facing=west,type=right]
execute at @s rotated ~ 0 run setblock ^4 ^1 ^10 chest[facing=west,type=left]
execute at @s rotated ~ 0 run setblock ^4 ^1 ^11 chest[facing=west,type=right]
execute at @s rotated ~ 0 run setblock ^4 ^1 ^12 chest[facing=west,type=left]
execute at @s rotated ~ 0 run setblock ^4 ^1 ^13 chest[facing=west,type=right]

# Tầng 2 (Y=2): 5 rương đôi
execute at @s rotated ~ 0 run setblock ^4 ^2 ^4 chest[facing=west,type=left]
execute at @s rotated ~ 0 run setblock ^4 ^2 ^5 chest[facing=west,type=right]
execute at @s rotated ~ 0 run setblock ^4 ^2 ^6 chest[facing=west,type=left]
execute at @s rotated ~ 0 run setblock ^4 ^2 ^7 chest[facing=west,type=right]
execute at @s rotated ~ 0 run setblock ^4 ^2 ^8 chest[facing=west,type=left]
execute at @s rotated ~ 0 run setblock ^4 ^2 ^9 chest[facing=west,type=right]
execute at @s rotated ~ 0 run setblock ^4 ^2 ^10 chest[facing=west,type=left]
execute at @s rotated ~ 0 run setblock ^4 ^2 ^11 chest[facing=west,type=right]
execute at @s rotated ~ 0 run setblock ^4 ^2 ^12 chest[facing=west,type=left]
execute at @s rotated ~ 0 run setblock ^4 ^2 ^13 chest[facing=west,type=right]

# Tầng 3 (Y=3): 5 rương đôi
execute at @s rotated ~ 0 run setblock ^4 ^3 ^4 chest[facing=west,type=left]
execute at @s rotated ~ 0 run setblock ^4 ^3 ^5 chest[facing=west,type=right]
execute at @s rotated ~ 0 run setblock ^4 ^3 ^6 chest[facing=west,type=left]
execute at @s rotated ~ 0 run setblock ^4 ^3 ^7 chest[facing=west,type=right]
execute at @s rotated ~ 0 run setblock ^4 ^3 ^8 chest[facing=west,type=left]
execute at @s rotated ~ 0 run setblock ^4 ^3 ^9 chest[facing=west,type=right]
execute at @s rotated ~ 0 run setblock ^4 ^3 ^10 chest[facing=west,type=left]
execute at @s rotated ~ 0 run setblock ^4 ^3 ^11 chest[facing=west,type=right]
execute at @s rotated ~ 0 run setblock ^4 ^3 ^12 chest[facing=west,type=left]
execute at @s rotated ~ 0 run setblock ^4 ^3 ^13 chest[facing=west,type=right]

# --- Vách cuối kho (Z=13, hướng mặt sang north): 6 rương đôi (3 tầng x 2 đôi)
execute at @s rotated ~ 0 run setblock ^-2 ^1 ^13 chest[facing=north,type=right]
execute at @s rotated ~ 0 run setblock ^-1 ^1 ^13 chest[facing=north,type=left]
execute at @s rotated ~ 0 run setblock ^1 ^1 ^13 chest[facing=north,type=right]
execute at @s rotated ~ 0 run setblock ^2 ^1 ^13 chest[facing=north,type=left]

execute at @s rotated ~ 0 run setblock ^-2 ^2 ^13 chest[facing=north,type=right]
execute at @s rotated ~ 0 run setblock ^-1 ^2 ^13 chest[facing=north,type=left]
execute at @s rotated ~ 0 run setblock ^1 ^2 ^13 chest[facing=north,type=right]
execute at @s rotated ~ 0 run setblock ^2 ^2 ^13 chest[facing=north,type=left]

execute at @s rotated ~ 0 run setblock ^-2 ^3 ^13 chest[facing=north,type=right]
execute at @s rotated ~ 0 run setblock ^-1 ^3 ^13 chest[facing=north,type=left]
execute at @s rotated ~ 0 run setblock ^1 ^3 ^13 chest[facing=north,type=right]
execute at @s rotated ~ 0 run setblock ^2 ^3 ^13 chest[facing=north,type=left]

# 5. TIỆN ÍCH TRUNG TÂM KHO (Ender Chest, Anvil, Lò nung, Bàn chế tạo)
execute at @s rotated ~ 0 run setblock ^0 ^1 ^13 ender_chest[facing=north]
execute at @s rotated ~ 0 run setblock ^-2 ^1 ^4 anvil[facing=north]
execute at @s rotated ~ 0 run setblock ^2 ^1 ^4 crafting_table
execute at @s rotated ~ 0 run setblock ^-2 ^1 ^5 blast_furnace[facing=east]
execute at @s rotated ~ 0 run setblock ^2 ^1 ^5 smoker[facing=west]
execute at @s rotated ~ 0 run setblock ^-2 ^2 ^4 grindstone[face=floor,facing=north]
execute at @s rotated ~ 0 run setblock ^2 ^2 ^4 stonecutter[facing=west]

# 6. Mái Kho & Đèn Chiếu Sáng (Y=5)
execute at @s rotated ~ 0 run fill ^-5 ^5 ^2 ^5 ^5 ^14 deepslate_tile_slab
execute at @s rotated ~ 0 run fill ^-4 ^5 ^3 ^4 ^5 ^13 spruce_slab
execute at @s rotated ~ 0 run setblock ^0 ^4 ^5 lantern[hanging=true]
execute at @s rotated ~ 0 run setblock ^0 ^4 ^9 lantern[hanging=true]
execute at @s rotated ~ 0 run setblock ^0 ^4 ^12 lantern[hanging=true]

# 7. Pháo hoa & Thẻ tag
execute at @s rotated ~ 0 run summon firework_rocket ^0 ^7 ^8 {LifeTime:25,FireworksItem:{id:"firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"burst",colors:[16753920,16777215,65535]}]}}}}

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

tellraw @s [{"text":"\n📦✨ [KIẾN TRÚC SƯ ĐẢO] ","color":"gold","bold":true},{"text":"Đã thi công hoàn tất ","color":"yellow"},{"text":"Kho Lưu Trữ 36 Rương Lớn!\n","color":"gold","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n","color":"dark_gray"},{"text":"📐 Quy mô: ","color":"aqua"},{"text":"13x15 x H7 blocks | Đá Deepslate & khung gỗ vân sam kiên cố\n","color":"white"},{"text":"🧰 Tiện ích: ","color":"green"},{"text":"36 Rương Đôi (72 rương ghép), Ender Chest, Đe sắt, Lò luyện kim, Bàn mài & Bàn cắt đá\n","color":"white"},{"text":"🛡️ Hoàn tác: ","color":"gold"},{"text":"Gõ ","color":"gray"},{"text":"/is undo","color":"yellow","bold":true},{"text":" trong 3 phút nếu muốn dỡ bỏ hoàn 90% tiền!\n","color":"gray"},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"}]
