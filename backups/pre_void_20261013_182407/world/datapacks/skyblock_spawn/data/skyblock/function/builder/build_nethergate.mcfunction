# ==============================================================================
# SKYBLOCK BUILDER - CỔNG DI TÍCH ĐỊA NGỤC HẮC ĐIỆN (ANCIENT NETHER SHRINE)
# ==============================================================================
# Kích thước: 13x13 x H12 block phía trước người chơi
# Chi phí: $45,000 Xu Vault | Cổng Nether Crying Obsidian, Lửa Linh Hồn & Vàng Hắc Thạch
# ==============================================================================

# 1. Âm thanh kích hoạt & Hiệu ứng ma quái
execute at @s run playsound minecraft:block.portal.trigger master @a ~ ~ ~ 1.5 1.0
execute at @s run playsound minecraft:entity.wither.spawn player @s ~ ~ ~ 1.0 1.2
execute at @s run playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1.2 1.4

# 2. Bệ Thờ Di Tích Đá Đen Cổ & Magma (13x13 tại Y=-1..1)
execute at @s rotated ~ 0 run fill ^-5 ^-1 ^2 ^5 ^-1 ^12 polished_blackstone_bricks
execute at @s rotated ~ 0 run fill ^-4 ^0 ^3 ^4 ^0 ^11 gilded_blackstone
execute at @s rotated ~ 0 run fill ^-2 ^0 ^5 ^2 ^0 ^9 magma_block

# Bậc thang tế lễ 4 phía
execute at @s rotated ~ 0 run fill ^-5 ^0 ^2 ^5 ^0 ^2 polished_blackstone_brick_stairs[facing=south]
execute at @s rotated ~ 0 run fill ^-5 ^0 ^12 ^5 ^0 ^12 polished_blackstone_brick_stairs[facing=north]

# 3. Trụ Cột Tàn Tích Hắc Điện (Y=1..9)
execute at @s rotated ~ 0 run fill ^-4 ^1 ^4 ^-4 ^7 ^4 cracked_polished_blackstone_bricks
execute at @s rotated ~ 0 run fill ^4 ^1 ^4 ^4 ^9 ^4 cracked_polished_blackstone_bricks
execute at @s rotated ~ 0 run fill ^-4 ^1 ^10 ^-4 ^8 ^10 cracked_polished_blackstone_bricks
execute at @s rotated ~ 0 run fill ^4 ^1 ^10 ^4 ^6 ^10 cracked_polished_blackstone_bricks

# Xích sắt địa ngục rủ xuống từ đỉnh trụ
execute at @s rotated ~ 0 run setblock ^-4 ^6 ^5 chain[axis=y]
execute at @s rotated ~ 0 run setblock ^-4 ^5 ^5 soul_lantern[hanging=true]
execute at @s rotated ~ 0 run setblock ^4 ^8 ^5 chain[axis=y]
execute at @s rotated ~ 0 run setblock ^4 ^7 ^5 soul_lantern[hanging=true]

# 4. KHUNG CỔNG NETHER KHỔNG LỒ HOÀNH TRÁNG (Y=1..7, Z=7)
# Khung Obsidian & Crying Obsidian đan xen
execute at @s rotated ~ 0 run fill ^-3 ^1 ^7 ^3 ^1 ^7 obsidian
execute at @s rotated ~ 0 run setblock ^-3 ^1 ^7 crying_obsidian
execute at @s rotated ~ 0 run setblock ^3 ^1 ^7 crying_obsidian

execute at @s rotated ~ 0 run fill ^-3 ^2 ^7 ^-3 ^6 ^7 obsidian
execute at @s rotated ~ 0 run setblock ^-3 ^4 ^7 crying_obsidian
execute at @s rotated ~ 0 run fill ^3 ^2 ^7 ^3 ^6 ^7 obsidian
execute at @s rotated ~ 0 run setblock ^3 ^5 ^7 crying_obsidian

execute at @s rotated ~ 0 run fill ^-3 ^7 ^7 ^3 ^7 ^7 obsidian
execute at @s rotated ~ 0 run setblock ^0 ^7 ^7 crying_obsidian

# Màn Cổng Không Gian Tím (4x5 blocks)
execute at @s rotated ~ 0 run fill ^-2 ^2 ^7 ^2 ^6 ^7 nether_portal[axis=x]

# 5. Lò Lửa Linh Hồn & Đầu Lâu Wither Tế Lễ
execute at @s rotated ~ 0 run setblock ^-2 ^1 ^4 soul_campfire
execute at @s rotated ~ 0 run setblock ^2 ^1 ^4 soul_campfire
execute at @s rotated ~ 0 run setblock ^-2 ^1 ^10 soul_campfire
execute at @s rotated ~ 0 run setblock ^2 ^1 ^10 soul_campfire

execute at @s rotated ~ 0 run setblock ^-4 ^8 ^4 wither_skeleton_skull[rotation=8]
execute at @s rotated ~ 0 run setblock ^4 ^10 ^4 wither_skeleton_skull[rotation=8]

# Cột dung nham bảo vệ an toàn trong lồng kính hắc diện
execute at @s rotated ~ 0 run setblock ^-4 ^1 ^7 tinted_glass
execute at @s rotated ~ 0 run setblock ^-4 ^2 ^7 lava
execute at @s rotated ~ 0 run setblock ^-4 ^3 ^7 tinted_glass
execute at @s rotated ~ 0 run setblock ^4 ^1 ^7 tinted_glass
execute at @s rotated ~ 0 run setblock ^4 ^2 ^7 lava
execute at @s rotated ~ 0 run setblock ^4 ^3 ^7 tinted_glass

# 6. Pháo hoa & Thẻ tag
execute at @s rotated ~ 0 run summon firework_rocket ^0 ^9 ^7 {LifeTime:25,FireworksItem:{id:"firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"burst",colors:[16711680,11141375,0]}]}}}}

tag @s add built_nethergate
tag @s remove built_villa
tag @s remove built_castle
tag @s remove built_modern
tag @s remove built_garden
tag @s remove built_bridge
tag @s remove built_pagoda
tag @s remove built_windmill
tag @s remove built_warehouse
tag @s remove built_greenhouse
tag @s remove built_enchant
tag @s remove built_lighthouse

tellraw @s [{"text":"\n🔥✨ [KIẾN TRÚC SƯ ĐẢO] ","color":"dark_red","bold":true},{"text":"Đã thi công hoàn tất ","color":"yellow"},{"text":"Cổng Di Tích Địa Ngục Hắc Điện!\n","color":"gold","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n","color":"dark_gray"},{"text":"📐 Quy mô: ","color":"aqua"},{"text":"13x13 x H12 blocks | Hắc diện thạch khóc & Vàng cổ đen\n","color":"white"},{"text":"👹 Huyền bí: ","color":"red"},{"text":"Cổng Nether kích hoạt sẵn, lửa linh hồn vĩnh cửu & dung nham hắc ám\n","color":"white"},{"text":"🛡️ Hoàn tác: ","color":"gold"},{"text":"Gõ ","color":"gray"},{"text":"/is undo","color":"yellow","bold":true},{"text":" trong 3 phút nếu muốn dỡ bỏ hoàn 90% tiền!\n","color":"gray"},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"}]
