# ==============================================================================
# SKYBLOCK BUILDER - BIỆT THỰ ĐẢO HIỆN ĐẠI GỖ CHERRY (MODERN CHERRY VILLA)
# ==============================================================================
# Kích thước: 13x13 x H10 block phía trước mặt người chơi
# Chi phí: $25,000 Xu Vault | Hoàn thiện 100% kết cấu, Sàn kín, Mái vòm, Ban công & Lò sưởi
# ==============================================================================

# 1. Âm thanh kích hoạt & Hiệu ứng
execute at @s run playsound minecraft:block.stone.place master @a ~ ~ ~ 1.5 1.0
execute at @s run playsound minecraft:block.anvil.use master @a ~ ~ ~ 1.2 1.2
execute at @s run playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1.2 1.3

# 2. Tạo nền móng & Sàn tầng 1 kiên cố (13x13, Y=-1..0)
execute at @s rotated ~ 0 run fill ^-6 ^-1 ^2 ^6 ^-1 ^14 polished_deepslate
execute at @s rotated ~ 0 run fill ^-6 ^0 ^2 ^6 ^0 ^14 cherry_planks

# 3. Khung cột trụ & Tường tầng 1 (Y=1..4)
# 4 Cột góc gỗ đào bóc vỏ
execute at @s rotated ~ 0 run fill ^-6 ^1 ^2 ^-6 ^4 ^2 stripped_cherry_wood
execute at @s rotated ~ 0 run fill ^6 ^1 ^2 ^6 ^4 ^2 stripped_cherry_wood
execute at @s rotated ~ 0 run fill ^-6 ^1 ^14 ^-6 ^4 ^14 stripped_cherry_wood
execute at @s rotated ~ 0 run fill ^6 ^1 ^14 ^6 ^4 ^14 stripped_cherry_wood

# Tường đá Deepslate kiên cố xung quanh
execute at @s rotated ~ 0 run fill ^-5 ^1 ^2 ^5 ^4 ^2 polished_deepslate
execute at @s rotated ~ 0 run fill ^-5 ^1 ^14 ^5 ^4 ^14 polished_deepslate
execute at @s rotated ~ 0 run fill ^-6 ^1 ^3 ^-6 ^4 ^13 polished_deepslate
execute at @s rotated ~ 0 run fill ^6 ^1 ^3 ^6 ^4 ^13 polished_deepslate

# Cửa sổ kính lớn lấy sáng tầng 1
execute at @s rotated ~ 0 run fill ^-4 ^2 ^2 ^-2 ^3 ^2 tinted_glass
execute at @s rotated ~ 0 run fill ^2 ^2 ^2 ^4 ^3 ^2 tinted_glass
execute at @s rotated ~ 0 run fill ^-6 ^2 ^5 ^-6 ^3 ^11 tinted_glass
execute at @s rotated ~ 0 run fill ^6 ^2 ^5 ^6 ^3 ^11 tinted_glass
execute at @s rotated ~ 0 run fill ^-4 ^2 ^14 ^4 ^3 ^14 tinted_glass

# Cửa chính tầng 1 có khung gỗ hoàn thiện
execute at @s rotated ~ 0 run setblock ^0 ^1 ^2 cherry_door[facing=north,half=lower]
execute at @s rotated ~ 0 run setblock ^0 ^2 ^2 cherry_door[facing=north,half=upper]
execute at @s rotated ~ 0 run setblock ^-1 ^1 ^2 stripped_cherry_wood
execute at @s rotated ~ 0 run setblock ^1 ^1 ^2 stripped_cherry_wood
execute at @s rotated ~ 0 run setblock ^-1 ^2 ^2 stripped_cherry_wood
execute at @s rotated ~ 0 run setblock ^1 ^2 ^2 stripped_cherry_wood
execute at @s rotated ~ 0 run setblock ^0 ^3 ^2 stripped_cherry_wood[axis=x]
execute at @s rotated ~ 0 run setblock ^0 ^3 ^1 lantern[hanging=true]

# 4. Sàn Tầng 2 Hoàn Thiện Liền Mạch (Y=4)
execute at @s rotated ~ 0 run fill ^-6 ^4 ^2 ^6 ^4 ^14 cherry_planks

# Khoét khoảng trống cầu thang nối tầng 1 lên tầng 2 (tại góc phải X=4, Z=9..12)
execute at @s rotated ~ 0 run fill ^4 ^4 ^9 ^4 ^4 ^12 air
execute at @s rotated ~ 0 run setblock ^4 ^1 ^9 cherry_stairs[facing=south]
execute at @s rotated ~ 0 run setblock ^4 ^2 ^10 cherry_stairs[facing=south]
execute at @s rotated ~ 0 run setblock ^4 ^3 ^11 cherry_stairs[facing=south]
execute at @s rotated ~ 0 run setblock ^4 ^4 ^12 cherry_stairs[facing=south]
# Tay vịn cầu thang an toàn
execute at @s rotated ~ 0 run fill ^3 ^5 ^9 ^3 ^5 ^12 cherry_fence

# 5. Ban công tầng 2 phía trước (Z=2..5, Y=5..6)
execute at @s rotated ~ 0 run fill ^-5 ^5 ^2 ^5 ^5 ^2 cherry_fence
execute at @s rotated ~ 0 run fill ^-5 ^5 ^3 ^-5 ^5 ^5 cherry_fence
execute at @s rotated ~ 0 run fill ^5 ^5 ^3 ^5 ^5 ^5 cherry_fence
execute at @s rotated ~ 0 run setblock ^-5 ^6 ^2 lantern
execute at @s rotated ~ 0 run setblock ^5 ^6 ^2 lantern

# 6. Tường & Phòng ngủ Master tầng 2 (Y=5..8, Z=6..14)
execute at @s rotated ~ 0 run fill ^-6 ^5 ^6 ^6 ^8 ^6 stripped_cherry_wood
execute at @s rotated ~ 0 run fill ^-6 ^5 ^14 ^6 ^8 ^14 stripped_cherry_wood
execute at @s rotated ~ 0 run fill ^-6 ^5 ^7 ^-6 ^8 ^13 cherry_planks
execute at @s rotated ~ 0 run fill ^6 ^5 ^7 ^6 ^8 ^13 cherry_planks
execute at @s rotated ~ 0 run fill ^-5 ^5 ^7 ^5 ^8 ^13 air

# Tường đầu hồi (Gable walls) 2 bên khép kín mái (Y=8..10)
execute at @s rotated ~ 0 run fill ^-6 ^8 ^7 ^-6 ^10 ^13 cherry_planks
execute at @s rotated ~ 0 run fill ^6 ^8 ^7 ^6 ^10 ^13 cherry_planks

# Cửa sổ kính phòng ngủ tầng 2
execute at @s rotated ~ 0 run fill ^-4 ^6 ^6 ^-2 ^7 ^6 tinted_glass
execute at @s rotated ~ 0 run fill ^2 ^6 ^6 ^4 ^7 ^6 tinted_glass
execute at @s rotated ~ 0 run fill ^-6 ^6 ^9 ^-6 ^7 ^11 tinted_glass
execute at @s rotated ~ 0 run fill ^6 ^6 ^9 ^6 ^7 ^11 tinted_glass
execute at @s rotated ~ 0 run fill ^-3 ^6 ^14 ^3 ^7 ^14 tinted_glass

# Cửa ra ban công tầng 2
execute at @s rotated ~ 0 run setblock ^0 ^5 ^6 cherry_door[facing=south,half=lower]
execute at @s rotated ~ 0 run setblock ^0 ^6 ^6 cherry_door[facing=south,half=upper]

# 7. Nội thất sang trọng: Giường đôi, Kệ sách, Rương đồ, Lò sưởi ấm cúng
execute at @s rotated ~ 0 run setblock ^-3 ^5 ^12 pink_bed[facing=north,part=head]
execute at @s rotated ~ 0 run setblock ^-3 ^5 ^11 pink_bed[facing=north,part=foot]
execute at @s rotated ~ 0 run setblock ^-2 ^5 ^12 pink_bed[facing=north,part=head]
execute at @s rotated ~ 0 run setblock ^-2 ^5 ^11 pink_bed[facing=north,part=foot]
execute at @s rotated ~ 0 run setblock ^2 ^5 ^13 bookshelf
execute at @s rotated ~ 0 run setblock ^1 ^5 ^13 chest[facing=south]
execute at @s rotated ~ 0 run setblock ^-5 ^5 ^9 crafting_table

# Lò sưởi ấm cúng tầng 1 (Z=13)
execute at @s rotated ~ 0 run setblock ^-2 ^1 ^13 campfire[lit=true]
execute at @s rotated ~ 0 run setblock ^-3 ^1 ^13 polished_deepslate
execute at @s rotated ~ 0 run setblock ^-1 ^1 ^13 polished_deepslate
execute at @s rotated ~ 0 run setblock ^-2 ^2 ^13 iron_bars

# Đèn lồng chiếu sáng trần phòng ngủ
execute at @s rotated ~ 0 run setblock ^0 ^8 ^10 lantern[hanging=true]

# 8. Mái Nhà Dốc Chữ A Hoàn Thiện (Y=8..10)
execute at @s rotated ~ 0 run fill ^-6 ^8 ^6 ^6 ^8 ^6 cherry_stairs[facing=south]
execute at @s rotated ~ 0 run fill ^-6 ^9 ^7 ^6 ^9 ^7 cherry_stairs[facing=south]
execute at @s rotated ~ 0 run fill ^-6 ^8 ^14 ^6 ^8 ^14 cherry_stairs[facing=north]
execute at @s rotated ~ 0 run fill ^-6 ^9 ^13 ^6 ^9 ^13 cherry_stairs[facing=north]
execute at @s rotated ~ 0 run fill ^-6 ^10 ^8 ^6 ^10 ^12 cherry_slab
execute at @s rotated ~ 0 run fill ^-6 ^9 ^8 ^6 ^9 ^12 cherry_planks

# 9. Pháo hoa & Thẻ tag
execute at @s rotated ~ 0 run summon firework_rocket ^0 ^11 ^9 {LifeTime:25,FireworksItem:{id:"firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"large_ball",has_twinkle:1b,colors:[16755400,16737975,16776960]}]}}}}

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

tellraw @s [{"text":"\n🏡✨ [KIẾN TRÚC SƯ ĐẢO] ","color":"light_purple","bold":true},{"text":"Đã thi công hoàn tất ","color":"yellow"},{"text":"Biệt Thự Hiện Đại Gỗ Cherry Hoàn Hảo!\n","color":"gold","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n","color":"dark_gray"},{"text":"📐 Kích thước: ","color":"aqua"},{"text":"13x13 x H10 blocks | 2 Tầng kín kẽ, cầu thang liền mạch\n","color":"white"},{"text":"🛏️ Tiện ích: ","color":"green"},{"text":"Ban công view hư không, phòng ngủ đôi, lò sưởi & nội thất gỗ đào\n","color":"white"},{"text":"🛡️ Hoàn tác: ","color":"gold"},{"text":"Gõ ","color":"gray"},{"text":"/is undo","color":"yellow","bold":true},{"text":" trong 3 phút nếu muốn dỡ bỏ hoàn 90% tiền!\n","color":"gray"},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"}]
