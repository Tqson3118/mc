# ==============================================================================
# SKYBLOCK BUILDER - NHÀ KÍNH SINH THÁI TỰ NHIÊN (ECO GREENHOUSE)
# ==============================================================================
# Kích thước: 13x13 x H8 block phía trước người chơi
# Chi phí: $25,000 Xu Vault | Vòm kính hiện đại, Tổ ong mật, Cà rốt, Khoai tây, Củ dền & Mía
# ==============================================================================

# 1. Âm thanh kích hoạt & Hiệu ứng
execute at @s run playsound minecraft:block.flowering_azalea.place master @a ~ ~ ~ 1.5 1.0
execute at @s run playsound minecraft:entity.bee.pollinate player @s ~ ~ ~ 1.2 1.2
execute at @s run playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1.2 1.4

# 2. Nền Móng Đá Rêu & Đất Canh Tác (13x13 tại Y=-1..0)
execute at @s rotated ~ 0 run fill ^-6 ^-1 ^2 ^6 ^-1 ^14 mossy_stone_bricks
execute at @s rotated ~ 0 run fill ^-5 ^0 ^3 ^5 ^0 ^13 dirt

# Lối đi giữa lát đá cuội rêu
execute at @s rotated ~ 0 run fill ^-1 ^0 ^3 ^1 ^0 ^13 mossy_cobblestone

# 3. Luống Nông Sản Đa Dạng Có Nước Tưới
# Luống trái 1: Cà rốt (X=-5..-4, Z=4..7)
execute at @s rotated ~ 0 run fill ^-5 ^0 ^4 ^-4 ^0 ^7 farmland[moisture=7]
execute at @s rotated ~ 0 run fill ^-5 ^1 ^4 ^-4 ^1 ^7 carrots[age=7]

# Luống trái 2: Khoai tây (X=-5..-4, Z=9..12)
execute at @s rotated ~ 0 run fill ^-5 ^0 ^9 ^-4 ^0 ^12 farmland[moisture=7]
execute at @s rotated ~ 0 run fill ^-5 ^1 ^9 ^-4 ^1 ^12 potatoes[age=7]

# Kênh nước trái
execute at @s rotated ~ 0 run setblock ^-3 ^0 ^5 water
execute at @s rotated ~ 0 run setblock ^-3 ^0 ^11 water
execute at @s rotated ~ 0 run setblock ^-3 ^1 ^5 lily_pad
execute at @s rotated ~ 0 run setblock ^-3 ^1 ^11 lily_pad

# Luống phải 1: Củ dền (X=4..5, Z=4..7)
execute at @s rotated ~ 0 run fill ^4 ^0 ^4 ^5 ^0 ^7 farmland[moisture=7]
execute at @s rotated ~ 0 run fill ^4 ^1 ^4 ^5 ^1 ^7 beetroots[age=3]

# Luống phải 2: Mía nước & Dưa (X=4..5, Z=9..12)
execute at @s rotated ~ 0 run setblock ^3 ^0 ^10 water
execute at @s rotated ~ 0 run fill ^4 ^0 ^9 ^5 ^0 ^12 sand
execute at @s rotated ~ 0 run fill ^4 ^1 ^9 ^5 ^1 ^12 sugar_cane
execute at @s rotated ~ 0 run setblock ^3 ^1 ^6 melon

# 4. Khu Nuôi Ong Mật & Vườn Hoa Thụ Phấn (Cuối nhà kính Z=13)
execute at @s rotated ~ 0 run setblock ^-2 ^2 ^13 beehive[facing=south,honey_level=5]
execute at @s rotated ~ 0 run setblock ^2 ^2 ^13 beehive[facing=south,honey_level=5]
execute at @s rotated ~ 0 run setblock ^-2 ^1 ^12 rose_bush[half=lower]
execute at @s rotated ~ 0 run setblock ^-2 ^2 ^12 rose_bush[half=upper]
execute at @s rotated ~ 0 run setblock ^2 ^1 ^12 peony[half=lower]
execute at @s rotated ~ 0 run setblock ^2 ^2 ^12 peony[half=upper]

# 5. Khung Vòm & Kính Nhà Kính Hiện Đại (Y=1..7)
# 4 Cột góc
execute at @s rotated ~ 0 run fill ^-6 ^1 ^2 ^-6 ^5 ^2 stripped_spruce_log
execute at @s rotated ~ 0 run fill ^6 ^1 ^2 ^6 ^5 ^2 stripped_spruce_log
execute at @s rotated ~ 0 run fill ^-6 ^1 ^14 ^-6 ^5 ^14 stripped_spruce_log
execute at @s rotated ~ 0 run fill ^6 ^1 ^14 ^6 ^5 ^14 stripped_spruce_log

# Tường kính xung quanh
execute at @s rotated ~ 0 run fill ^-5 ^1 ^2 ^5 ^4 ^2 glass
execute at @s rotated ~ 0 run fill ^-5 ^1 ^14 ^5 ^4 ^14 glass
execute at @s rotated ~ 0 run fill ^-6 ^1 ^3 ^-6 ^4 ^13 glass
execute at @s rotated ~ 0 run fill ^6 ^1 ^3 ^6 ^4 ^13 glass

# Cửa kính vào nhà kính
execute at @s rotated ~ 0 run setblock ^0 ^1 ^2 spruce_door[facing=north,half=lower]
execute at @s rotated ~ 0 run setblock ^0 ^2 ^2 spruce_door[facing=north,half=upper]

# Mái vòm kính lấy sáng năng lượng mặt trời (Y=5..7)
execute at @s rotated ~ 0 run fill ^-6 ^5 ^2 ^6 ^5 ^14 tinted_glass
execute at @s rotated ~ 0 run fill ^-5 ^6 ^3 ^5 ^6 ^13 glass
execute at @s rotated ~ 0 run fill ^-3 ^7 ^5 ^3 ^7 ^11 tinted_glass

# Đèn sinh học quang hợp
execute at @s rotated ~ 0 run setblock ^0 ^6 ^6 shroomlight
execute at @s rotated ~ 0 run setblock ^0 ^6 ^10 shroomlight

# 6. Pháo hoa & Thẻ tag
execute at @s rotated ~ 0 run summon firework_rocket ^0 ^8 ^8 {LifeTime:25,FireworksItem:{id:"firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"burst",colors:[65280,16776960,3847130]}]}}}}

tag @s add built_greenhouse
tag @s remove built_villa
tag @s remove built_castle
tag @s remove built_modern
tag @s remove built_garden
tag @s remove built_bridge
tag @s remove built_pagoda
tag @s remove built_windmill
tag @s remove built_warehouse
tag @s remove built_enchant
tag @s remove built_lighthouse
tag @s remove built_nethergate

tellraw @s [{"text":"\n🌿✨ [KIẾN TRÚC SƯ ĐẢO] ","color":"green","bold":true},{"text":"Đã thi công hoàn tất ","color":"yellow"},{"text":"Nhà Kính Sinh Thái Tự Nhiên!\n","color":"gold","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n","color":"dark_gray"},{"text":"📐 Quy mô: ","color":"aqua"},{"text":"13x13 x H8 blocks | Mái vòm kính quang hợp & cột gỗ vân sam\n","color":"white"},{"text":"🍯 Nông sản: ","color":"green"},{"text":"Cà rốt, khoai tây, củ dền, dưa hấu, mía nước & 2 tổ ong mật chín\n","color":"white"},{"text":"🛡️ Hoàn tác: ","color":"gold"},{"text":"Gõ ","color":"gray"},{"text":"/is undo","color":"yellow","bold":true},{"text":" trong 3 phút nếu muốn dỡ bỏ hoàn 90% tiền!\n","color":"gray"},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"}]
