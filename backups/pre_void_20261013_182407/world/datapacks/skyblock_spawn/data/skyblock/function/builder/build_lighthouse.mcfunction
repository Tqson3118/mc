# ==============================================================================
# SKYBLOCK BUILDER - HẢI ĐĂNG PHA LÊ HƯ KHÔNG (VOID LIGHTHOUSE)
# ==============================================================================
# Kích thước: 9x9 x H16 block phía trước người chơi
# Chi phí: $35,000 Xu Vault | Tháp phát quang xuyên màn đêm, Ban công ngắm mây 360 độ
# ==============================================================================

# 1. Âm thanh kích hoạt & Hiệu ứng
execute at @s run playsound minecraft:block.beacon.activate master @a ~ ~ ~ 1.5 1.0
execute at @s run playsound minecraft:ambient.underwater.loop player @s ~ ~ ~ 1.0 1.2
execute at @s run playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1.2 1.4

# 2. Chân Đế Hải Đăng Kiên Cố (9x9 tại Y=-1..1)
execute at @s rotated ~ 0 run fill ^-4 ^-1 ^2 ^4 ^-1 ^10 prismarine_bricks
execute at @s rotated ~ 0 run fill ^-3 ^0 ^3 ^3 ^0 ^9 dark_prismarine
execute at @s rotated ~ 0 run fill ^-4 ^0 ^2 ^4 ^0 ^2 prismarine_brick_stairs[facing=south]
execute at @s rotated ~ 0 run fill ^-4 ^0 ^10 ^4 ^0 ^10 prismarine_brick_stairs[facing=north]
execute at @s rotated ~ 0 run fill ^-4 ^0 ^3 ^-4 ^0 ^9 prismarine_brick_stairs[facing=east]
execute at @s rotated ~ 0 run fill ^4 ^0 ^3 ^4 ^0 ^9 prismarine_brick_stairs[facing=west]

# 3. Thân Tháp Hải Đăng Sọc Đỏ - Trắng Vươn Cao (Y=1..11)
# Tầng trắng 1 (Y=1..3)
execute at @s rotated ~ 0 run fill ^-2 ^1 ^4 ^2 ^3 ^8 smooth_quartz
execute at @s rotated ~ 0 run fill ^-1 ^1 ^5 ^1 ^3 ^7 air

# Cửa vào hải đăng
execute at @s rotated ~ 0 run setblock ^0 ^1 ^4 air
execute at @s rotated ~ 0 run setblock ^0 ^2 ^4 air

# Tầng đỏ 1 (Y=4..6)
execute at @s rotated ~ 0 run fill ^-2 ^4 ^4 ^2 ^6 ^8 red_concrete
execute at @s rotated ~ 0 run fill ^-1 ^4 ^5 ^1 ^6 ^7 air

# Cửa sổ ngắm mây
execute at @s rotated ~ 0 run setblock ^0 ^5 ^4 glass_pane
execute at @s rotated ~ 0 run setblock ^0 ^5 ^8 glass_pane

# Tầng trắng 2 (Y=7..9)
execute at @s rotated ~ 0 run fill ^-2 ^7 ^4 ^2 ^9 ^8 smooth_quartz
execute at @s rotated ~ 0 run fill ^-1 ^7 ^5 ^1 ^9 ^7 air

# Tầng đỏ 2 (Y=10..11)
execute at @s rotated ~ 0 run fill ^-2 ^10 ^4 ^2 ^11 ^8 red_concrete
execute at @s rotated ~ 0 run fill ^-1 ^10 ^5 ^1 ^11 ^7 air

# Thang leo thẳng đứng bên trong
execute at @s rotated ~ 0 run fill ^0 ^1 ^7 ^0 ^12 ^7 ladder[facing=north]

# 4. Sàn Vọng Lâu & Ban Công Ngắm Cảnh 360 Độ (Y=12)
execute at @s rotated ~ 0 run fill ^-3 ^12 ^3 ^3 ^12 ^9 smooth_stone_slab
execute at @s rotated ~ 0 run fill ^-3 ^13 ^3 ^3 ^13 ^3 iron_bars
execute at @s rotated ~ 0 run fill ^-3 ^13 ^9 ^3 ^13 ^9 iron_bars
execute at @s rotated ~ 0 run fill ^-3 ^13 ^4 ^-3 ^13 ^8 iron_bars
execute at @s rotated ~ 0 run fill ^3 ^13 ^4 ^3 ^13 ^8 iron_bars

# 5. Buồng Đèn Hải Đăng Biển Sea Lantern Siêu Sáng (Y=13..15)
execute at @s rotated ~ 0 run fill ^-1 ^13 ^5 ^1 ^14 ^7 sea_lantern
execute at @s rotated ~ 0 run fill ^-2 ^13 ^4 ^2 ^14 ^4 tinted_glass
execute at @s rotated ~ 0 run fill ^-2 ^13 ^8 ^2 ^14 ^8 tinted_glass
execute at @s rotated ~ 0 run fill ^-2 ^13 ^5 ^-2 ^14 ^7 tinted_glass
execute at @s rotated ~ 0 run fill ^2 ^13 ^5 ^2 ^14 ^7 tinted_glass

# Mái chóp đồng vòm cao (Y=15..16)
execute at @s rotated ~ 0 run fill ^-2 ^15 ^4 ^2 ^15 ^8 cut_copper_stairs[facing=south]
execute at @s rotated ~ 0 run fill ^-1 ^16 ^5 ^1 ^16 ^7 cut_copper_slab
execute at @s rotated ~ 0 run setblock ^0 ^17 ^6 lightning_rod

# 6. Pháo hoa & Thẻ tag
execute at @s rotated ~ 0 run summon firework_rocket ^0 ^15 ^6 {LifeTime:25,FireworksItem:{id:"firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"burst",colors:[16777215,65535,16711680]}]}}}}

tag @s add built_lighthouse
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
tag @s remove built_nethergate

tellraw @s [{"text":"\n🏮✨ [KIẾN TRÚC SƯ ĐẢO] ","color":"aqua","bold":true},{"text":"Đã thi công hoàn tất ","color":"yellow"},{"text":"Hải Đăng Pha Lê Hư Không!\n","color":"gold","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n","color":"dark_gray"},{"text":"📐 Quy mô: ","color":"aqua"},{"text":"9x9 x H17 blocks | Tháp sọc đỏ trắng cao vút xé toạc màn đêm\n","color":"white"},{"text":"🔭 Tầm nhìn: ","color":"aqua"},{"text":"Cụm đèn Sea Lantern phát quang, ban công ngắm mây toàn cảnh 360 độ\n","color":"white"},{"text":"🛡️ Hoàn tác: ","color":"gold"},{"text":"Gõ ","color":"gray"},{"text":"/is undo","color":"yellow","bold":true},{"text":" trong 3 phút nếu muốn dỡ bỏ hoàn 90% tiền!\n","color":"gray"},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"}]
