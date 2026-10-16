# ==============================================================================
# SKYBLOCK BUILDER - VƯỜN HOA ZEN & SUỐI NƯỚC THƯ GIÃN (ZEN FLORA & WATER GARDEN)
# ==============================================================================
# Kích thước: 15x15 x H8 block phía trước mặt người chơi
# Chi phí: $15,000 Xu Vault | Hồ sen, Cầu gỗ, Cây anh đào, Đèn đá thiền
# ==============================================================================

# 1. Âm thanh kích hoạt & Hiệu ứng thiên nhiên
execute at @s run playsound minecraft:block.grass.place master @a ~ ~ ~ 1.5 1.0
execute at @s run playsound minecraft:ambient.underwater.enter master @a ~ ~ ~ 1.0 1.2
execute at @s run playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1.2 1.4

# 2. Nền móng thảm cỏ rêu tươi mát (15x15 tại Y=-1..0)
execute at @s rotated ~ 0 run fill ^-7 ^-1 ^2 ^7 ^-1 ^16 dirt
execute at @s rotated ~ 0 run fill ^-7 ^0 ^2 ^7 ^0 ^16 moss_block

# Viền đá rêu tự nhiên quanh vườn
execute at @s rotated ~ 0 run fill ^-7 ^1 ^2 ^7 ^1 ^2 mossy_cobblestone
execute at @s rotated ~ 0 run fill ^-7 ^1 ^16 ^7 ^1 ^16 mossy_cobblestone
execute at @s rotated ~ 0 run fill ^-7 ^1 ^3 ^-7 ^1 ^15 mossy_cobblestone
execute at @s rotated ~ 0 run fill ^7 ^1 ^3 ^7 ^1 ^15 mossy_cobblestone
execute at @s rotated ~ 0 run setblock ^0 ^1 ^2 air

# 3. Hồ nước suối Zen nhân tạo (ở trung tâm Z=7..11, X=-4..4)
execute at @s rotated ~ 0 run fill ^-4 ^-1 ^7 ^4 ^-1 ^11 prismarine_bricks
execute at @s rotated ~ 0 run fill ^-3 ^0 ^7 ^3 ^0 ^11 water
execute at @s rotated ~ 0 run setblock ^-1 ^1 ^8 lily_pad
execute at @s rotated ~ 0 run setblock ^2 ^1 ^10 lily_pad
execute at @s rotated ~ 0 run setblock ^-2 ^1 ^10 sea_pickle

# 4. Cầu Gỗ Thông Nhỏ Bắc Qua Suối (tại X=0, Z=6..12)
execute at @s rotated ~ 0 run setblock ^0 ^1 ^6 spruce_stairs[facing=south]
execute at @s rotated ~ 0 run setblock ^0 ^2 ^7 spruce_stairs[facing=south]
execute at @s rotated ~ 0 run fill ^0 ^2 ^8 ^0 ^2 ^10 spruce_slab[type=top]
execute at @s rotated ~ 0 run setblock ^0 ^2 ^11 spruce_stairs[facing=north]
execute at @s rotated ~ 0 run setblock ^0 ^1 ^12 spruce_stairs[facing=north]

# Lan can cầu & Đèn lồng 2 bên
execute at @s rotated ~ 0 run setblock ^-1 ^2 ^9 spruce_fence
execute at @s rotated ~ 0 run setblock ^1 ^2 ^9 spruce_fence
execute at @s rotated ~ 0 run setblock ^-1 ^3 ^9 lantern
execute at @s rotated ~ 0 run setblock ^1 ^3 ^9 lantern

# 5. Cây Hoa Anh Đào Rủ Bóng (Góc vườn X=-4, Z=13)
execute at @s rotated ~ 0 run fill ^-4 ^1 ^13 ^-4 ^5 ^13 cherry_log
execute at @s rotated ~ 0 run fill ^-6 ^4 ^11 ^-2 ^6 ^15 cherry_leaves
execute at @s rotated ~ 0 run fill ^-5 ^7 ^12 ^-3 ^7 ^14 cherry_leaves
execute at @s rotated ~ 0 run setblock ^-4 ^4 ^13 lantern[hanging=true]

# 6. Khóm Hoa Thơm & Đèn Đá Nhật Bản
# Khóm hoa bên phải
execute at @s rotated ~ 0 run setblock ^4 ^1 ^5 flowering_azalea
execute at @s rotated ~ 0 run setblock ^5 ^1 ^6 peony[half=lower]
execute at @s rotated ~ 0 run setblock ^5 ^2 ^6 peony[half=upper]
execute at @s rotated ~ 0 run setblock ^3 ^1 ^4 rose_bush[half=lower]
execute at @s rotated ~ 0 run setblock ^3 ^2 ^4 rose_bush[half=upper]
execute at @s rotated ~ 0 run setblock ^4 ^1 ^13 flowering_azalea

# Khóm hoa bên trái
execute at @s rotated ~ 0 run setblock ^-5 ^1 ^4 azalea
execute at @s rotated ~ 0 run setblock ^-6 ^1 ^5 flowering_azalea

# Đèn đá Nhật Bản (2 cột đèn góc)
execute at @s rotated ~ 0 run setblock ^5 ^1 ^14 mossy_stone_brick_wall
execute at @s rotated ~ 0 run setblock ^5 ^2 ^14 lantern
execute at @s rotated ~ 0 run setblock ^-5 ^1 ^3 mossy_stone_brick_wall
execute at @s rotated ~ 0 run setblock ^-5 ^2 ^3 lantern

# 7. Pháo hoa & Thẻ tag
execute at @s rotated ~ 0 run summon firework_rocket ^0 ^6 ^9 {LifeTime:20,FireworksItem:{id:"firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"burst",has_twinkle:1b,colors:[65280,16737975,16777215]}]}}}}

tag @s add built_garden
tag @s remove built_villa
tag @s remove built_castle
tag @s remove built_modern
tag @s remove built_pagoda
tag @s remove built_windmill
tag @s remove built_warehouse
tag @s remove built_greenhouse
tag @s remove built_enchant
tag @s remove built_lighthouse
tag @s remove built_nethergate
tag @s remove built_bridge

tellraw @s [{"text":"\n🌸🌿 [KIẾN TRÚC SƯ ĐẢO] ","color":"green","bold":true},{"text":"Đã thi công hoàn tất ","color":"yellow"},{"text":"Vườn Hoa Zen & Suối Nước Thư Giãn!\n","color":"light_purple","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n","color":"dark_gray"},{"text":"📐 Quy mô: ","color":"aqua"},{"text":"15x15 x H8 blocks | Thảm cỏ rêu ngát xanh\n","color":"white"},{"text":"🌊 Cảnh quan: ","color":"green"},{"text":"Hồ sen ngắm trăng, cầu gỗ thông qua suối & bóng cây anh đào\n","color":"white"},{"text":"🛡️ Hoàn tác: ","color":"gold"},{"text":"Gõ ","color":"gray"},{"text":"/is undo","color":"yellow","bold":true},{"text":" trong 3 phút nếu muốn dỡ bỏ hoàn tiền!\n","color":"gray"},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"}]
