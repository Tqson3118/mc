# ==============================================================================
# SKYBLOCK BUILDER - ĐÌNH CỔ PHƯƠNG ĐÔNG MÁI NGÓI (ORIENTAL PAGODA)
# ==============================================================================
# Kích thước: 13x13 x H10 block phía trước người chơi
# Chi phí: $35,000 Xu Vault | Cột gỗ lim đỏ, Mái ngói cong ngọc bích, Bàn trà & Chuông thiền
# ==============================================================================

# 1. Âm thanh kích hoạt & Hiệu ứng
execute at @s run playsound minecraft:block.bell.use master @a ~ ~ ~ 1.5 1.0
execute at @s run playsound minecraft:block.wood.place player @s ~ ~ ~ 1.2 0.9
execute at @s run playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1.2 1.4

# 2. Nền móng đá & Sàn gỗ trầm (13x13 tại Y=-1..0)
execute at @s rotated ~ 0 run fill ^-6 ^-1 ^2 ^6 ^-1 ^14 polished_blackstone_bricks
execute at @s rotated ~ 0 run fill ^-5 ^0 ^3 ^5 ^0 ^13 spruce_planks
execute at @s rotated ~ 0 run fill ^-6 ^0 ^2 ^6 ^0 ^2 polished_blackstone_brick_stairs[facing=south]
execute at @s rotated ~ 0 run fill ^-6 ^0 ^14 ^6 ^0 ^14 polished_blackstone_brick_stairs[facing=north]
execute at @s rotated ~ 0 run fill ^-6 ^0 ^3 ^-6 ^0 ^13 polished_blackstone_brick_stairs[facing=east]
execute at @s rotated ~ 0 run fill ^6 ^0 ^3 ^6 ^0 ^13 polished_blackstone_brick_stairs[facing=west]

# 3. 4 Cột Trụ Gỗ Trầm & Khung Đình (Y=1..5)
execute at @s rotated ~ 0 run fill ^-4 ^1 ^4 ^-4 ^5 ^4 stripped_dark_oak_log
execute at @s rotated ~ 0 run fill ^4 ^1 ^4 ^4 ^5 ^4 stripped_dark_oak_log
execute at @s rotated ~ 0 run fill ^-4 ^1 ^12 ^-4 ^5 ^12 stripped_dark_oak_log
execute at @s rotated ~ 0 run fill ^4 ^1 ^12 ^4 ^5 ^12 stripped_dark_oak_log

# Xà ngang đỡ mái
execute at @s rotated ~ 0 run fill ^-4 ^5 ^5 ^-4 ^5 ^11 stripped_dark_oak_log[axis=z]
execute at @s rotated ~ 0 run fill ^4 ^5 ^5 ^4 ^5 ^11 stripped_dark_oak_log[axis=z]
execute at @s rotated ~ 0 run fill ^-3 ^5 ^4 ^3 ^5 ^4 stripped_dark_oak_log[axis=x]
execute at @s rotated ~ 0 run fill ^-3 ^5 ^12 ^3 ^5 ^12 stripped_dark_oak_log[axis=x]

# Lan can gỗ quanh đình
execute at @s rotated ~ 0 run fill ^-4 ^1 ^5 ^-4 ^1 ^11 spruce_fence
execute at @s rotated ~ 0 run fill ^4 ^1 ^5 ^4 ^1 ^11 spruce_fence
execute at @s rotated ~ 0 run fill ^-3 ^1 ^12 ^3 ^1 ^12 spruce_fence
execute at @s rotated ~ 0 run fill ^-3 ^1 ^4 ^-1 ^1 ^4 spruce_fence
execute at @s rotated ~ 0 run fill ^1 ^1 ^4 ^3 ^1 ^4 spruce_fence

# 4. Nội Thất Gian Thiền, Bàn Trà Cổ & Chuông Phong Thủy
execute at @s rotated ~ 0 run setblock ^0 ^1 ^8 smooth_stone_slab
execute at @s rotated ~ 0 run setblock ^-1 ^1 ^8 dark_oak_stairs[facing=east]
execute at @s rotated ~ 0 run setblock ^1 ^1 ^8 dark_oak_stairs[facing=west]
execute at @s rotated ~ 0 run setblock ^0 ^2 ^8 flower_pot
execute at @s rotated ~ 0 run setblock ^0 ^1 ^11 chiseled_bookshelf[facing=north]
execute at @s rotated ~ 0 run setblock ^-2 ^1 ^11 chest[facing=north]
execute at @s rotated ~ 0 run setblock ^2 ^1 ^11 chest[facing=north]

# Chuông đồng treo giữa đình
execute at @s rotated ~ 0 run setblock ^0 ^4 ^8 bell[attachment=ceiling]

# Đèn lồng treo 4 góc
execute at @s rotated ~ 0 run setblock ^-4 ^4 ^4 lantern[hanging=true]
execute at @s rotated ~ 0 run setblock ^4 ^4 ^4 lantern[hanging=true]
execute at @s rotated ~ 0 run setblock ^-4 ^4 ^12 lantern[hanging=true]
execute at @s rotated ~ 0 run setblock ^4 ^4 ^12 lantern[hanging=true]

# 5. Mái Ngói Ngọc Bích Cong Đậm Chất Á Đông (Y=5..9)
# Tầng mái 1 vươn rộng (Y=5..6)
execute at @s rotated ~ 0 run fill ^-6 ^5 ^2 ^6 ^5 ^14 dark_prismarine_slab
execute at @s rotated ~ 0 run fill ^-5 ^6 ^3 ^5 ^6 ^13 dark_prismarine
execute at @s rotated ~ 0 run fill ^-5 ^6 ^3 ^5 ^6 ^3 dark_prismarine_stairs[facing=south]
execute at @s rotated ~ 0 run fill ^-5 ^6 ^13 ^5 ^6 ^13 dark_prismarine_stairs[facing=north]
execute at @s rotated ~ 0 run fill ^-5 ^6 ^4 ^-5 ^6 ^12 dark_prismarine_stairs[facing=east]
execute at @s rotated ~ 0 run fill ^5 ^6 ^4 ^5 ^6 ^12 dark_prismarine_stairs[facing=west]

# 4 Góc mái cong vút đặc trưng
execute at @s rotated ~ 0 run setblock ^-6 ^6 ^2 dark_prismarine_slab
execute at @s rotated ~ 0 run setblock ^6 ^6 ^2 dark_prismarine_slab
execute at @s rotated ~ 0 run setblock ^-6 ^6 ^14 dark_prismarine_slab
execute at @s rotated ~ 0 run setblock ^6 ^6 ^14 dark_prismarine_slab

# Tầng chóp đình (Y=7..9)
execute at @s rotated ~ 0 run fill ^-3 ^7 ^5 ^3 ^7 ^11 dark_prismarine
execute at @s rotated ~ 0 run fill ^-3 ^7 ^5 ^3 ^7 ^5 dark_prismarine_stairs[facing=south]
execute at @s rotated ~ 0 run fill ^-3 ^7 ^11 ^3 ^7 ^11 dark_prismarine_stairs[facing=north]
execute at @s rotated ~ 0 run fill ^-3 ^7 ^6 ^-3 ^7 ^10 dark_prismarine_stairs[facing=east]
execute at @s rotated ~ 0 run fill ^3 ^7 ^6 ^3 ^7 ^10 dark_prismarine_stairs[facing=west]

execute at @s rotated ~ 0 run fill ^-1 ^8 ^7 ^1 ^8 ^9 dark_prismarine
execute at @s rotated ~ 0 run setblock ^0 ^9 ^8 lightning_rod

# 6. Pháo hoa & Thẻ tag
execute at @s rotated ~ 0 run summon firework_rocket ^0 ^8 ^8 {LifeTime:25,FireworksItem:{id:"firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"burst",colors:[16753920,65280,16711680]}]}}}}

tag @s add built_pagoda
tag @s remove built_villa
tag @s remove built_castle
tag @s remove built_modern
tag @s remove built_garden
tag @s remove built_bridge
tag @s remove built_windmill
tag @s remove built_warehouse
tag @s remove built_greenhouse
tag @s remove built_enchant
tag @s remove built_lighthouse
tag @s remove built_nethergate

tellraw @s [{"text":"\n🏯✨ [KIẾN TRÚC SƯ ĐẢO] ","color":"gold","bold":true},{"text":"Đã thi công hoàn tất ","color":"yellow"},{"text":"Đình Cổ Phương Đông Mái Ngói!\n","color":"gold","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n","color":"dark_gray"},{"text":"📐 Quy mô: ","color":"aqua"},{"text":"13x13 x H10 blocks | Cột gỗ trầm & mái ngói ngọc bích cong vút\n","color":"white"},{"text":"🫖 Tiện ích: ","color":"green"},{"text":"Bàn trà đàm đạo, chuông thiền phong thủy, tủ sách cổ & rương đồ\n","color":"white"},{"text":"🛡️ Hoàn tác: ","color":"gold"},{"text":"Gõ ","color":"gray"},{"text":"/is undo","color":"yellow","bold":true},{"text":" trong 3 phút nếu muốn dỡ bỏ hoàn 90% tiền!\n","color":"gray"},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"}]
