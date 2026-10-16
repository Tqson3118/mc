# ==============================================================================
# SKYBLOCK BUILDER - LÂU ĐÀI ĐÁ CỔ KÍNH TRUNG CỔ (MEDIEVAL STONE CASTLE)
# ==============================================================================
# Kích thước: 17x17 x H14 block phía trước mặt người chơi
# Chi phí: $75,000 Xu Vault | 4 Tháp canh, Ngai vàng, Đuốc lửa linh hồn
# ==============================================================================

# 1. Âm thanh kích hoạt & Hiệu ứng
execute at @s run playsound minecraft:block.stone.place master @a ~ ~ ~ 1.5 0.8
execute at @s run playsound minecraft:entity.iron_golem.repair master @a ~ ~ ~ 1.2 1.0
execute at @s run playsound minecraft:entity.ender_dragon.growl player @s ~ ~ ~ 0.8 1.4

# 2. Nền móng & Sàn Đại Điện (17x17 tại Y=-1..0)
execute at @s rotated ~ 0 run fill ^-8 ^-1 ^2 ^8 ^-1 ^18 deepslate_tiles
execute at @s rotated ~ 0 run fill ^-7 ^0 ^3 ^7 ^0 ^17 stone_bricks

# Thảm nhung đỏ trải dọc lối đi chính
execute at @s rotated ~ 0 run fill ^-1 ^1 ^3 ^1 ^1 ^15 red_carpet

# 3. Tường thành bao quanh (Y=1..6)
execute at @s rotated ~ 0 run fill ^-8 ^1 ^2 ^8 ^6 ^2 stone_bricks
execute at @s rotated ~ 0 run fill ^-8 ^1 ^18 ^8 ^6 ^18 stone_bricks
execute at @s rotated ~ 0 run fill ^-8 ^1 ^3 ^-8 ^6 ^17 stone_bricks
execute at @s rotated ~ 0 run fill ^8 ^1 ^3 ^8 ^6 ^17 stone_bricks

# Rãnh bắn cung trên nóc tường thành (Y=7)
execute at @s rotated ~ 0 run fill ^-7 ^7 ^2 ^7 ^7 ^2 stone_brick_wall
execute at @s rotated ~ 0 run fill ^-7 ^7 ^18 ^7 ^7 ^18 stone_brick_wall
execute at @s rotated ~ 0 run fill ^-8 ^7 ^3 ^-8 ^7 ^17 stone_brick_wall
execute at @s rotated ~ 0 run fill ^8 ^7 ^3 ^8 ^7 ^17 stone_brick_wall

# 4. Bốn Tháp Canh 4 Góc (3x3 vươn cao đến Y=12)
# Tháp 1: Phía trước bên trái (^-8..^-6, ^2..^4)
execute at @s rotated ~ 0 run fill ^-8 ^1 ^2 ^-6 ^10 ^4 stone_bricks
execute at @s rotated ~ 0 run fill ^-7 ^1 ^3 ^-7 ^9 ^3 air
execute at @s rotated ~ 0 run fill ^-8 ^11 ^2 ^-6 ^11 ^4 stone_brick_wall
execute at @s rotated ~ 0 run setblock ^-7 ^12 ^3 lantern

# Tháp 2: Phía trước bên phải (^6..^8, ^2..^4)
execute at @s rotated ~ 0 run fill ^6 ^1 ^2 ^8 ^10 ^4 stone_bricks
execute at @s rotated ~ 0 run fill ^7 ^1 ^3 ^7 ^9 ^3 air
execute at @s rotated ~ 0 run fill ^6 ^11 ^2 ^8 ^11 ^4 stone_brick_wall
execute at @s rotated ~ 0 run setblock ^7 ^12 ^3 lantern

# Tháp 3: Phía sau bên trái (^-8..^-6, ^16..^18)
execute at @s rotated ~ 0 run fill ^-8 ^1 ^16 ^-6 ^10 ^18 stone_bricks
execute at @s rotated ~ 0 run fill ^-7 ^1 ^17 ^-7 ^9 ^17 air
execute at @s rotated ~ 0 run fill ^-8 ^11 ^16 ^-6 ^11 ^18 stone_brick_wall
execute at @s rotated ~ 0 run setblock ^-7 ^12 ^17 lantern

# Tháp 4: Phía sau bên phải (^6..^8, ^16..^18)
execute at @s rotated ~ 0 run fill ^6 ^1 ^16 ^8 ^10 ^18 stone_bricks
execute at @s rotated ~ 0 run fill ^7 ^1 ^17 ^7 ^9 ^17 air
execute at @s rotated ~ 0 run fill ^6 ^11 ^16 ^8 ^11 ^18 stone_brick_wall
execute at @s rotated ~ 0 run setblock ^7 ^12 ^17 lantern

# 5. Cổng Thành Vòm & Cửa Sắt (Y=1..4, Z=2)
execute at @s rotated ~ 0 run fill ^-2 ^1 ^2 ^2 ^4 ^2 air
execute at @s rotated ~ 0 run fill ^-2 ^1 ^2 ^-2 ^4 ^2 deepslate_brick_wall
execute at @s rotated ~ 0 run fill ^2 ^1 ^2 ^2 ^4 ^2 deepslate_brick_wall
execute at @s rotated ~ 0 run fill ^-1 ^4 ^2 ^1 ^4 ^2 deepslate_brick_stairs[facing=south,half=top]
execute at @s rotated ~ 0 run fill ^-1 ^2 ^2 ^1 ^3 ^2 iron_bars

# 6. Đại Điện Trung Tâm & Ngai Vàng Hoàng Gia
execute at @s rotated ~ 0 run fill ^-7 ^1 ^3 ^7 ^6 ^17 air
execute at @s rotated ~ 0 run fill ^-1 ^1 ^3 ^1 ^1 ^15 red_carpet

# Đuốc Lửa Linh Hồn 2 bên thảm đỏ
execute at @s rotated ~ 0 run setblock ^-3 ^1 ^5 soul_torch
execute at @s rotated ~ 0 run setblock ^3 ^1 ^5 soul_torch
execute at @s rotated ~ 0 run setblock ^-3 ^1 ^9 soul_torch
execute at @s rotated ~ 0 run setblock ^3 ^1 ^9 soul_torch
execute at @s rotated ~ 0 run setblock ^-3 ^1 ^13 soul_torch
execute at @s rotated ~ 0 run setblock ^3 ^1 ^13 soul_torch

# Bệ Ngai Vàng Cổ Đại (tại Z=16..17)
execute at @s rotated ~ 0 run fill ^-2 ^1 ^15 ^2 ^1 ^17 polished_deepslate
execute at @s rotated ~ 0 run fill ^-1 ^2 ^16 ^1 ^2 ^17 smooth_quartz
execute at @s rotated ~ 0 run setblock ^0 ^3 ^16 smooth_quartz_stairs[facing=north]
execute at @s rotated ~ 0 run setblock ^-1 ^3 ^16 smooth_quartz_stairs[facing=east]
execute at @s rotated ~ 0 run setblock ^1 ^3 ^16 smooth_quartz_stairs[facing=west]
execute at @s rotated ~ 0 run setblock ^0 ^4 ^17 smooth_quartz_slab
execute at @s rotated ~ 0 run setblock ^-2 ^2 ^15 soul_campfire
execute at @s rotated ~ 0 run setblock ^2 ^2 ^15 soul_campfire

# Đèn chùm thắp sáng trung tâm đại sảnh
execute at @s rotated ~ 0 run setblock ^0 ^6 ^10 chain
execute at @s rotated ~ 0 run setblock ^0 ^5 ^10 lantern

# 7. Pháo hoa & Ghi nhận thẻ tag
execute at @s rotated ~ 0 run summon firework_rocket ^0 ^12 ^10 {LifeTime:30,FireworksItem:{id:"firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"large_ball",has_twinkle:1b,colors:[16766720,11184810,16711680]}]}}}}

tag @s add built_castle
tag @s remove built_villa
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

tellraw @s [{"text":"\n🏰⚔️ [KIẾN TRÚC SƯ ĐẢO] ","color":"gold","bold":true},{"text":"Đã thi công hoàn tất ","color":"yellow"},{"text":"Lâu Đài Đá Cổ Kính Trung Cổ!\n","color":"aqua","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n","color":"dark_gray"},{"text":"📐 Quy mô: ","color":"aqua"},{"text":"17x17 x H14 blocks | 4 Tháp Canh kiên cố\n","color":"white"},{"text":"👑 Kiến trúc: ","color":"yellow"},{"text":"Đại sảnh ngai vàng thạch anh, thảm nhung đỏ & đuốc lửa linh hồn\n","color":"white"},{"text":"🛡️ Hoàn tác: ","color":"gold"},{"text":"Gõ ","color":"gray"},{"text":"/is undo","color":"yellow","bold":true},{"text":" trong 3 phút nếu muốn dỡ bỏ hoàn tiền!\n","color":"gray"},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"}]
