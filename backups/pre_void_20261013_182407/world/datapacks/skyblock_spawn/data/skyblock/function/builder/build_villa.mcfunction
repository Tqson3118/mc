# ==============================================================================
# SKYBLOCK BUILDER - BIỆT THỰ ĐẢO HIỆN ĐẠI GỖ CHERRY (MODERN CHERRY VILLA)
# ==============================================================================
# Kích thước: 13x13 x H10 block phía trước mặt người chơi
# Chi phí: $25,000 Xu Vault | Hoàn tác an toàn qua /is undo
# ==============================================================================

# 1. Âm thanh kích hoạt & Hiệu ứng
execute at @s run playsound minecraft:block.stone.place master @a ~ ~ ~ 1.5 1.0
execute at @s run playsound minecraft:block.anvil.use master @a ~ ~ ~ 1.2 1.2
execute at @s run playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1.2 1.3

# 2. Tạo nền móng & Sàn tầng 1 (13x13, Y=-1..0)
execute at @s rotated ~ 0 run fill ^-6 ^-1 ^2 ^6 ^-1 ^14 polished_deepslate
execute at @s rotated ~ 0 run fill ^-5 ^0 ^3 ^5 ^0 ^13 cherry_planks

# 3. Khung cột trụ & Tường tầng 1 (Y=1..4)
execute at @s rotated ~ 0 run fill ^-6 ^0 ^2 ^-6 ^4 ^2 stripped_cherry_wood
execute at @s rotated ~ 0 run fill ^6 ^0 ^2 ^6 ^4 ^2 stripped_cherry_wood
execute at @s rotated ~ 0 run fill ^-6 ^0 ^14 ^-6 ^4 ^14 stripped_cherry_wood
execute at @s rotated ~ 0 run fill ^6 ^0 ^14 ^6 ^4 ^14 stripped_cherry_wood

# Tường xung quanh với cửa sổ kính lớn
execute at @s rotated ~ 0 run fill ^-5 ^1 ^2 ^5 ^4 ^2 polished_deepslate
execute at @s rotated ~ 0 run fill ^-5 ^1 ^14 ^5 ^4 ^14 polished_deepslate
execute at @s rotated ~ 0 run fill ^-6 ^1 ^3 ^-6 ^4 ^13 polished_deepslate
execute at @s rotated ~ 0 run fill ^6 ^1 ^3 ^6 ^4 ^13 polished_deepslate

# Cửa sổ kính tầng 1
execute at @s rotated ~ 0 run fill ^-4 ^2 ^2 ^-2 ^3 ^2 tinted_glass
execute at @s rotated ~ 0 run fill ^2 ^2 ^2 ^4 ^3 ^2 tinted_glass
execute at @s rotated ~ 0 run fill ^-6 ^2 ^5 ^-6 ^3 ^11 tinted_glass
execute at @s rotated ~ 0 run fill ^6 ^2 ^5 ^6 ^3 ^11 tinted_glass
execute at @s rotated ~ 0 run fill ^-4 ^2 ^14 ^4 ^3 ^14 tinted_glass

# Cửa chính vòm tầng 1
execute at @s rotated ~ 0 run setblock ^-1 ^1 ^2 air
execute at @s rotated ~ 0 run setblock ^0 ^1 ^2 air
execute at @s rotated ~ 0 run setblock ^1 ^1 ^2 air
execute at @s rotated ~ 0 run setblock ^-1 ^2 ^2 air
execute at @s rotated ~ 0 run setblock ^0 ^2 ^2 air
execute at @s rotated ~ 0 run setblock ^1 ^2 ^2 air
execute at @s rotated ~ 0 run setblock ^0 ^1 ^2 cherry_door[facing=north,half=lower]
execute at @s rotated ~ 0 run setblock ^0 ^2 ^2 cherry_door[facing=north,half=upper]
execute at @s rotated ~ 0 run setblock ^-1 ^2 ^1 lantern[hanging=false]
execute at @s rotated ~ 0 run setblock ^1 ^2 ^1 lantern[hanging=false]

# 4. Sàn tầng 2 & Ban công trước (Y=4..5)
execute at @s rotated ~ 0 run fill ^-6 ^4 ^2 ^6 ^4 ^14 cherry_planks
execute at @s rotated ~ 0 run fill ^-5 ^5 ^3 ^5 ^5 ^13 cherry_planks

# Ban công tầng 2 phía trước (Y=5, Z=3..6)
execute at @s rotated ~ 0 run fill ^-5 ^6 ^3 ^5 ^6 ^3 cherry_fence
execute at @s rotated ~ 0 run fill ^-5 ^6 ^4 ^-5 ^6 ^5 cherry_fence
execute at @s rotated ~ 0 run fill ^5 ^6 ^4 ^5 ^6 ^5 cherry_fence
execute at @s rotated ~ 0 run setblock ^-5 ^7 ^3 lantern
execute at @s rotated ~ 0 run setblock ^5 ^7 ^3 lantern

# 5. Tường & Phòng ngủ tầng 2 (Y=5..8)
execute at @s rotated ~ 0 run fill ^-5 ^5 ^6 ^5 ^8 ^13 cherry_planks
execute at @s rotated ~ 0 run fill ^-4 ^5 ^7 ^4 ^7 ^12 air
execute at @s rotated ~ 0 run fill ^-3 ^6 ^6 ^3 ^7 ^6 tinted_glass
execute at @s rotated ~ 0 run fill ^-5 ^6 ^8 ^-5 ^7 ^11 tinted_glass
execute at @s rotated ~ 0 run fill ^5 ^6 ^8 ^5 ^7 ^11 tinted_glass

# Cửa ra ban công tầng 2
execute at @s rotated ~ 0 run setblock ^0 ^5 ^6 cherry_door[facing=south,half=lower]
execute at @s rotated ~ 0 run setblock ^0 ^6 ^6 cherry_door[facing=south,half=upper]

# Nội thất tầng 2: Giường đôi, bàn sách, đèn lồng
execute at @s rotated ~ 0 run setblock ^-3 ^5 ^12 pink_bed[facing=north,part=head]
execute at @s rotated ~ 0 run setblock ^-3 ^5 ^11 pink_bed[facing=north,part=foot]
execute at @s rotated ~ 0 run setblock ^-2 ^5 ^12 pink_bed[facing=north,part=head]
execute at @s rotated ~ 0 run setblock ^-2 ^5 ^11 pink_bed[facing=north,part=foot]
execute at @s rotated ~ 0 run setblock ^3 ^5 ^12 bookshelf
execute at @s rotated ~ 0 run setblock ^2 ^5 ^12 chest[facing=south]
execute at @s rotated ~ 0 run setblock ^3 ^6 ^12 lantern

# Cầu thang gỗ nối tầng 1 lên tầng 2 (tại góc X=4, Z=9..13)
execute at @s rotated ~ 0 run setblock ^4 ^1 ^9 cherry_stairs[facing=south]
execute at @s rotated ~ 0 run setblock ^4 ^2 ^10 cherry_stairs[facing=south]
execute at @s rotated ~ 0 run setblock ^4 ^3 ^11 cherry_stairs[facing=south]
execute at @s rotated ~ 0 run setblock ^4 ^4 ^12 cherry_stairs[facing=south]

# 6. Mái nhà chữ A dốc nghệ thuật (Y=8..10)
execute at @s rotated ~ 0 run fill ^-6 ^8 ^5 ^6 ^8 ^14 cherry_stairs[facing=north]
execute at @s rotated ~ 0 run fill ^-5 ^9 ^6 ^5 ^9 ^13 cherry_stairs[facing=north]
execute at @s rotated ~ 0 run fill ^-6 ^8 ^14 ^6 ^8 ^14 cherry_stairs[facing=south]
execute at @s rotated ~ 0 run fill ^-5 ^10 ^7 ^5 ^10 ^12 cherry_slab
execute at @s rotated ~ 0 run setblock ^0 ^10 ^9 lantern[hanging=true]

# 7. Pháo hoa & Vinh danh
execute at @s rotated ~ 0 run summon firework_rocket ^0 ^8 ^8 {LifeTime:25,FireworksItem:{id:"firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"large_ball",has_twinkle:1b,colors:[16755400,16737975,16776960]}]}}}}

tag @s add built_villa
tag @s remove built_castle
tag @s remove built_modern
tag @s remove built_pagoda
tag @s remove built_windmill
tag @s remove built_warehouse
tag @s remove built_greenhouse
tag @s remove built_garden
tag @s remove built_enchant
tag @s remove built_lighthouse
tag @s remove built_nethergate
tag @s remove built_bridge

tellraw @s [{"text":"\n🏡✨ [KIẾN TRÚC SƯ ĐẢO] ","color":"light_purple","bold":true},{"text":"Đã thi công hoàn tất ","color":"yellow"},{"text":"Biệt Thự Hiện Đại Gỗ Cherry!\n","color":"gold","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n","color":"dark_gray"},{"text":"📐 Kích thước: ","color":"aqua"},{"text":"13x13 x H10 blocks | 2 Tầng sang trọng\n","color":"white"},{"text":"🛏️ Tiện ích: ","color":"green"},{"text":"Ban công view hư không, phòng ngủ đôi, lò sưởi & nội thất gỗ đào\n","color":"white"},{"text":"🛡️ Hoàn tác: ","color":"gold"},{"text":"Nếu đặt nhầm, gõ ","color":"gray"},{"text":"/is undo","color":"yellow","bold":true},{"text":" trong 3 phút để khôi phục và hoàn lại 90% tiền!\n","color":"gray"},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"}]
