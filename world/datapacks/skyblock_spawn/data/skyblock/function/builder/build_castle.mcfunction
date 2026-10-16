# ==============================================================================
# SKYBLOCK BUILDER - LÂU ĐÀI ĐÁ CỔ KÍNH TRUNG CỔ (MEDIEVAL STONE CASTLE)
# ==============================================================================
# Kích thước: 17x17 x H14 block phía trước mặt người chơi
# Chi phí: $75,000 Xu Vault | Trần vòm kiên cố, 4 Tháp canh có thang leo, Ngai vàng cẩm thạch
# ==============================================================================

# 1. Âm thanh kích hoạt & Hiệu ứng
execute at @s run playsound minecraft:block.stone.place master @a ~ ~ ~ 1.5 0.8
execute at @s run playsound minecraft:entity.iron_golem.repair master @a ~ ~ ~ 1.2 1.0
execute at @s run playsound minecraft:entity.ender_dragon.growl player @s ~ ~ ~ 0.8 1.4

# 2. Nền móng & Sàn Đại Điện (17x17 tại Y=-1..0)
execute at @s rotated ~ 0 run fill ^-8 ^-1 ^2 ^8 ^-1 ^18 deepslate_tiles
execute at @s rotated ~ 0 run fill ^-8 ^0 ^2 ^8 ^0 ^18 stone_bricks

# 3. Tường thành kiên cố & Lỗ châu mai (Y=1..7)
execute at @s rotated ~ 0 run fill ^-8 ^1 ^2 ^8 ^7 ^2 stone_bricks
execute at @s rotated ~ 0 run fill ^-8 ^1 ^18 ^8 ^7 ^18 stone_bricks
execute at @s rotated ~ 0 run fill ^-8 ^1 ^3 ^-8 ^7 ^17 stone_bricks
execute at @s rotated ~ 0 run fill ^8 ^1 ^3 ^8 ^7 ^17 stone_bricks
execute at @s rotated ~ 0 run fill ^-7 ^1 ^3 ^7 ^7 ^17 air

# Rãnh tường thành bắn cung (Battlements trên nóc Y=8)
execute at @s rotated ~ 0 run fill ^-8 ^8 ^2 ^8 ^8 ^2 stone_brick_wall
execute at @s rotated ~ 0 run fill ^-8 ^8 ^18 ^8 ^8 ^18 stone_brick_wall
execute at @s rotated ~ 0 run fill ^-8 ^8 ^3 ^-8 ^8 ^17 stone_brick_wall
execute at @s rotated ~ 0 run fill ^8 ^8 ^3 ^8 ^8 ^17 stone_brick_wall

# 4. Bốn Tháp Canh 4 Góc (3x3 vươn cao đến Y=12) có thang leo bên trong
# Tháp 1: Góc trước trái (^-8..^-6, ^2..^4)
execute at @s rotated ~ 0 run fill ^-8 ^1 ^2 ^-6 ^11 ^4 stone_bricks
execute at @s rotated ~ 0 run fill ^-7 ^1 ^3 ^-7 ^10 ^3 air
execute at @s rotated ~ 0 run fill ^-7 ^1 ^3 ^-7 ^11 ^3 ladder[facing=north]
execute at @s rotated ~ 0 run setblock ^-7 ^11 ^3 iron_trapdoor[half=top]
execute at @s rotated ~ 0 run fill ^-8 ^12 ^2 ^-6 ^12 ^4 stone_brick_wall
execute at @s rotated ~ 0 run setblock ^-7 ^12 ^2 lantern
execute at @s rotated ~ 0 run setblock ^-7 ^1 ^4 air

# Tháp 2: Góc trước phải (^6..^8, ^2..^4)
execute at @s rotated ~ 0 run fill ^6 ^1 ^2 ^8 ^11 ^4 stone_bricks
execute at @s rotated ~ 0 run fill ^7 ^1 ^3 ^7 ^10 ^3 air
execute at @s rotated ~ 0 run fill ^7 ^1 ^3 ^7 ^11 ^3 ladder[facing=north]
execute at @s rotated ~ 0 run setblock ^7 ^11 ^3 iron_trapdoor[half=top]
execute at @s rotated ~ 0 run fill ^6 ^12 ^2 ^8 ^12 ^4 stone_brick_wall
execute at @s rotated ~ 0 run setblock ^7 ^12 ^2 lantern
execute at @s rotated ~ 0 run setblock ^7 ^1 ^4 air

# Tháp 3: Góc sau trái (^-8..^-6, ^16..^18)
execute at @s rotated ~ 0 run fill ^-8 ^1 ^16 ^-6 ^11 ^18 stone_bricks
execute at @s rotated ~ 0 run fill ^-7 ^1 ^17 ^-7 ^10 ^17 air
execute at @s rotated ~ 0 run fill ^-7 ^1 ^17 ^-7 ^11 ^17 ladder[facing=south]
execute at @s rotated ~ 0 run setblock ^-7 ^11 ^17 iron_trapdoor[half=top]
execute at @s rotated ~ 0 run fill ^-8 ^12 ^16 ^-6 ^12 ^18 stone_brick_wall
execute at @s rotated ~ 0 run setblock ^-7 ^12 ^18 lantern
execute at @s rotated ~ 0 run setblock ^-7 ^1 ^16 air

# Tháp 4: Góc sau phải (^6..^8, ^16..^18)
execute at @s rotated ~ 0 run fill ^6 ^1 ^16 ^8 ^11 ^18 stone_bricks
execute at @s rotated ~ 0 run fill ^7 ^1 ^17 ^7 ^10 ^17 air
execute at @s rotated ~ 0 run fill ^7 ^1 ^17 ^7 ^11 ^17 ladder[facing=south]
execute at @s rotated ~ 0 run setblock ^7 ^11 ^17 iron_trapdoor[half=top]
execute at @s rotated ~ 0 run fill ^6 ^12 ^16 ^8 ^12 ^18 stone_brick_wall
execute at @s rotated ~ 0 run setblock ^7 ^12 ^18 lantern
execute at @s rotated ~ 0 run setblock ^7 ^1 ^16 air

# 5. Cổng Thành Vòm Cuốn & Chấn Song Kiên Cố (Z=2)
execute at @s rotated ~ 0 run fill ^-2 ^1 ^2 ^2 ^4 ^2 air
execute at @s rotated ~ 0 run fill ^-2 ^1 ^2 ^-2 ^4 ^2 deepslate_brick_wall
execute at @s rotated ~ 0 run fill ^2 ^1 ^2 ^2 ^4 ^2 deepslate_brick_wall
execute at @s rotated ~ 0 run fill ^-1 ^4 ^2 ^1 ^4 ^2 deepslate_brick_stairs[facing=south,half=top]
execute at @s rotated ~ 0 run fill ^-1 ^2 ^2 ^1 ^3 ^2 iron_bars
execute at @s rotated ~ 0 run setblock ^0 ^1 ^2 iron_door[facing=north,half=lower]
execute at @s rotated ~ 0 run setblock ^0 ^2 ^2 iron_door[facing=north,half=upper]
execute at @s rotated ~ 0 run setblock ^1 ^1 ^1 stone_button[facing=north]
execute at @s rotated ~ 0 run setblock ^-1 ^1 ^3 stone_button[facing=south]

# 6. Trần Mái Vòm Đại Điện & Đèn Chùm Trung Tâm (Y=7..8)
execute at @s rotated ~ 0 run fill ^-5 ^7 ^5 ^5 ^7 ^15 deepslate_tiles
execute at @s rotated ~ 0 run fill ^-5 ^8 ^6 ^5 ^8 ^14 deepslate_tile_slab
# Xà dầm chịu lực
execute at @s rotated ~ 0 run fill ^-5 ^7 ^10 ^5 ^7 ^10 deepslate_bricks
execute at @s rotated ~ 0 run fill ^0 ^7 ^5 ^0 ^7 ^15 deepslate_bricks
# Đèn chùm treo từ dầm chính
execute at @s rotated ~ 0 run setblock ^0 ^6 ^10 chain[axis=y]
execute at @s rotated ~ 0 run setblock ^0 ^5 ^10 chain[axis=y]
execute at @s rotated ~ 0 run setblock ^0 ^4 ^10 lantern[hanging=true]

# 7. Nội Thất Đại Điện: Ngai Vàng Hoàng Gia, Thảm Nhung Đỏ, Cột Trụ & Đuốc Hồn
execute at @s rotated ~ 0 run fill ^-1 ^1 ^3 ^1 ^1 ^15 red_carpet

# 2 Hàng Cột Đá Hoa Cương Đỡ Trần
execute at @s rotated ~ 0 run fill ^-4 ^1 ^6 ^-4 ^6 ^6 chiseled_stone_bricks
execute at @s rotated ~ 0 run fill ^4 ^1 ^6 ^4 ^6 ^6 chiseled_stone_bricks
execute at @s rotated ~ 0 run fill ^-4 ^1 ^14 ^-4 ^6 ^14 chiseled_stone_bricks
execute at @s rotated ~ 0 run fill ^4 ^1 ^14 ^4 ^6 ^14 chiseled_stone_bricks

# Đuốc Lửa Linh Hồn 2 bên thảm đỏ
execute at @s rotated ~ 0 run setblock ^-2 ^1 ^5 soul_torch
execute at @s rotated ~ 0 run setblock ^2 ^1 ^5 soul_torch
execute at @s rotated ~ 0 run setblock ^-2 ^1 ^9 soul_torch
execute at @s rotated ~ 0 run setblock ^2 ^1 ^9 soul_torch
execute at @s rotated ~ 0 run setblock ^-2 ^1 ^13 soul_torch
execute at @s rotated ~ 0 run setblock ^2 ^1 ^13 soul_torch

# Bệ Ngai Vàng Thạch Anh Uy Nghiêm (tại Z=16..17)
execute at @s rotated ~ 0 run fill ^-2 ^1 ^15 ^2 ^1 ^17 polished_deepslate
execute at @s rotated ~ 0 run fill ^-1 ^2 ^16 ^1 ^2 ^17 smooth_quartz
execute at @s rotated ~ 0 run setblock ^0 ^3 ^16 smooth_quartz_stairs[facing=north]
execute at @s rotated ~ 0 run setblock ^-1 ^3 ^16 smooth_quartz_stairs[facing=east]
execute at @s rotated ~ 0 run setblock ^1 ^3 ^16 smooth_quartz_stairs[facing=west]
execute at @s rotated ~ 0 run setblock ^0 ^4 ^17 smooth_quartz_slab
execute at @s rotated ~ 0 run setblock ^-2 ^2 ^15 soul_campfire
execute at @s rotated ~ 0 run setblock ^2 ^2 ^15 soul_campfire

# 8. Pháo hoa & Ghi nhận thẻ tag
execute at @s rotated ~ 0 run summon firework_rocket ^0 ^13 ^10 {LifeTime:30,FireworksItem:{id:"firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"large_ball",has_twinkle:1b,colors:[16766720,11184810,16711680]}]}}}}

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

tellraw @s [{"text":"\n🏰⚔️ [KIẾN TRÚC SƯ ĐẢO] ","color":"gold","bold":true},{"text":"Đã thi công hoàn tất ","color":"yellow"},{"text":"Lâu Đài Đá Cổ Kính Trung Cổ Hoàn Thiện!\n","color":"aqua","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n","color":"dark_gray"},{"text":"📐 Quy mô: ","color":"aqua"},{"text":"17x17 x H14 blocks | 4 Tháp Canh có thang leo lên nóc\n","color":"white"},{"text":"👑 Kiến trúc: ","color":"yellow"},{"text":"Trần vòm đá kiên cố, Ngai vàng cẩm thạch, đèn chùm & đuốc hồn\n","color":"white"},{"text":"🛡️ Hoàn tác: ","color":"gold"},{"text":"Gõ ","color":"gray"},{"text":"/is undo","color":"yellow","bold":true},{"text":" trong 3 phút nếu muốn dỡ bỏ hoàn tiền!\n","color":"gray"},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"}]
