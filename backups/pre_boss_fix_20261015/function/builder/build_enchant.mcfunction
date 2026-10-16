# ==============================================================================
# SKYBLOCK BUILDER - THÁP PHÙ PHÉP CẤP 30 TỐI THƯỢNG (ENCHANT TOWER)
# ==============================================================================
# Kích thước: 11x11 x H14 block phía trước người chơi
# Chi phí: $40,000 Xu Vault | Bàn Enchant Max Cấp 30 (19 Kệ Sách), Tinh Thể Thạch Anh Tím
# Kiến trúc: Tháp đá đen Polished Blackstone kiên cố, Mái chóp Obsidian kín khít, Cửa sổ kính tím
# ==============================================================================

# 1. Âm thanh kích hoạt & Hiệu ứng ma thuật
execute at @s run playsound minecraft:block.enchantment_table.use master @a ~ ~ ~ 1.5 1.0
execute at @s run playsound minecraft:block.amethyst_block.resonate player @s ~ ~ ~ 1.5 1.2
execute at @s run playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1.2 1.4

# 2. Xóa không gian & Nền móng đá cẩm thạch kiên cố (11x11 tại Y=-1..0)
execute at @s rotated ~ 0 run fill ^-5 ^-1 ^2 ^5 ^-1 ^12 polished_blackstone
execute at @s rotated ~ 0 run fill ^-5 ^0 ^2 ^5 ^0 ^12 polished_blackstone_bricks
execute at @s rotated ~ 0 run fill ^-2 ^0 ^5 ^2 ^0 ^9 crying_obsidian

# Dọn sạch lòng tháp (Y=1..8)
execute at @s rotated ~ 0 run fill ^-3 ^1 ^4 ^3 ^8 ^10 air

# 3. TƯỜNG THÁP ĐÁ ĐEN KIÊN CỐ & TRỤ CỘT GÓC (Y=1..8)
# Tường tháp khối đặc (Loại bỏ triệt để tường mỏng chấn song deepslate_tile_wall)
execute at @s rotated ~ 0 run fill ^-4 ^1 ^3 ^4 ^8 ^3 polished_blackstone_bricks
execute at @s rotated ~ 0 run fill ^-4 ^1 ^11 ^4 ^8 ^11 polished_blackstone_bricks
execute at @s rotated ~ 0 run fill ^-4 ^1 ^4 ^-4 ^8 ^10 polished_blackstone_bricks
execute at @s rotated ~ 0 run fill ^4 ^1 ^4 ^4 ^8 ^10 polished_blackstone_bricks

# 4 Trụ Cột Góc Đá Đen Tinh Luyện & Mạ Vàng Cổ
execute at @s rotated ~ 0 run fill ^-4 ^1 ^3 ^-4 ^8 ^3 chiseled_polished_blackstone
execute at @s rotated ~ 0 run fill ^4 ^1 ^3 ^4 ^8 ^3 chiseled_polished_blackstone
execute at @s rotated ~ 0 run fill ^-4 ^1 ^11 ^-4 ^8 ^11 chiseled_polished_blackstone
execute at @s rotated ~ 0 run fill ^4 ^1 ^11 ^4 ^8 ^11 chiseled_polished_blackstone
execute at @s rotated ~ 0 run setblock ^-4 ^4 ^3 gilded_blackstone
execute at @s rotated ~ 0 run setblock ^4 ^4 ^3 gilded_blackstone
execute at @s rotated ~ 0 run setblock ^-4 ^4 ^11 gilded_blackstone
execute at @s rotated ~ 0 run setblock ^4 ^4 ^11 gilded_blackstone

# Cổng vòm ma thuật bước vào tháp (X=0, Z=2..3)
execute at @s rotated ~ 0 run setblock ^0 ^1 ^3 air
execute at @s rotated ~ 0 run setblock ^0 ^2 ^3 air
execute at @s rotated ~ 0 run setblock ^0 ^3 ^3 polished_blackstone_brick_stairs[facing=south,half=top]
execute at @s rotated ~ 0 run setblock ^-1 ^1 ^2 polished_blackstone_brick_wall
execute at @s rotated ~ 0 run setblock ^1 ^1 ^2 polished_blackstone_brick_wall

# Cửa sổ kính tím ma mị âm vào tường đặc
execute at @s rotated ~ 0 run fill ^-4 ^3 ^6 ^-4 ^5 ^8 purple_stained_glass
execute at @s rotated ~ 0 run fill ^4 ^3 ^6 ^4 ^5 ^8 purple_stained_glass
execute at @s rotated ~ 0 run fill ^-1 ^3 ^11 ^1 ^5 ^11 purple_stained_glass

# 4. TRUNG TÂM PHÙ PHÉP MAX LEVEL 30 (19 KỆ SÁCH CHUẨN XÁC)
execute at @s rotated ~ 0 run setblock ^0 ^1 ^7 enchanting_table

# Vòng 15 kệ sách tầng 1 bao quanh bàn enchant
execute at @s rotated ~ 0 run fill ^-2 ^1 ^5 ^2 ^1 ^5 bookshelf
execute at @s rotated ~ 0 run fill ^-2 ^1 ^9 ^2 ^1 ^9 bookshelf
execute at @s rotated ~ 0 run fill ^-2 ^1 ^6 ^-2 ^1 ^8 bookshelf
execute at @s rotated ~ 0 run fill ^2 ^1 ^6 ^2 ^1 ^8 bookshelf
execute at @s rotated ~ 0 run setblock ^0 ^1 ^5 air

# 4 Kệ sách tầng 2 ở 4 góc tăng cường ma thuật
execute at @s rotated ~ 0 run setblock ^-2 ^2 ^5 bookshelf
execute at @s rotated ~ 0 run setblock ^2 ^2 ^5 bookshelf
execute at @s rotated ~ 0 run setblock ^-2 ^2 ^9 bookshelf
execute at @s rotated ~ 0 run setblock ^2 ^2 ^9 bookshelf

# 5. TIỆN ÍCH PHÙ PHÉP HOÀN CHỈNH (Đe sắt, Bàn gỡ bùa, Bục giảng, Tinh thể tím)
execute at @s rotated ~ 0 run setblock ^-3 ^1 ^4 anvil[facing=east]
execute at @s rotated ~ 0 run setblock ^3 ^1 ^4 grindstone[face=floor,facing=west]
execute at @s rotated ~ 0 run setblock ^0 ^1 ^4 lectern[facing=north]
execute at @s rotated ~ 0 run setblock ^-3 ^1 ^10 amethyst_block
execute at @s rotated ~ 0 run setblock ^-3 ^2 ^10 amethyst_cluster[facing=up]
execute at @s rotated ~ 0 run setblock ^3 ^1 ^10 amethyst_block
execute at @s rotated ~ 0 run setblock ^3 ^2 ^10 amethyst_cluster[facing=up]

# 6. MÁI THÁP NHỌN OBSIDIAN KÍN KHÍT & TINH THỂ HUYỀN ẢO (Y=8..14)
# Gờ mái viền ngoài bo kín toàn bộ đỉnh tường (Y=8..9)
execute at @s rotated ~ 0 run fill ^-5 ^8 ^2 ^5 ^8 ^2 deepslate_tile_stairs[facing=south]
execute at @s rotated ~ 0 run fill ^-5 ^8 ^12 ^5 ^8 ^12 deepslate_tile_stairs[facing=north]
execute at @s rotated ~ 0 run fill ^-5 ^8 ^3 ^-5 ^8 ^11 deepslate_tile_stairs[facing=east]
execute at @s rotated ~ 0 run fill ^5 ^8 ^3 ^5 ^8 ^11 deepslate_tile_stairs[facing=west]

# Trần vòm tháp bịt kín 100% không để lỗ hở (Y=9)
execute at @s rotated ~ 0 run fill ^-4 ^9 ^3 ^4 ^9 ^11 obsidian

# Chóp tháp tầng 1 (Y=10)
execute at @s rotated ~ 0 run fill ^-3 ^10 ^4 ^3 ^10 ^10 obsidian
execute at @s rotated ~ 0 run fill ^-3 ^10 ^4 ^3 ^10 ^4 polished_blackstone_brick_stairs[facing=south]
execute at @s rotated ~ 0 run fill ^-3 ^10 ^10 ^3 ^10 ^10 polished_blackstone_brick_stairs[facing=north]
execute at @s rotated ~ 0 run fill ^-3 ^10 ^5 ^-3 ^10 ^9 polished_blackstone_brick_stairs[facing=east]
execute at @s rotated ~ 0 run fill ^3 ^10 ^5 ^3 ^10 ^9 polished_blackstone_brick_stairs[facing=west]

# Chóp tháp tầng 2 Crying Obsidian (Y=11)
execute at @s rotated ~ 0 run fill ^-2 ^11 ^5 ^2 ^11 ^9 crying_obsidian

# Đỉnh tháp tinh thể Thạch Anh Tím & Kim Lôi (Y=12..14)
execute at @s rotated ~ 0 run fill ^-1 ^12 ^6 ^1 ^12 ^8 amethyst_block
execute at @s rotated ~ 0 run setblock ^0 ^13 ^7 amethyst_block
execute at @s rotated ~ 0 run setblock ^0 ^14 ^7 amethyst_cluster[facing=up]
execute at @s rotated ~ 0 run setblock ^0 ^15 ^7 lightning_rod

# Đèn chùm linh hồn treo giữa lòng tháp
execute at @s rotated ~ 0 run setblock ^0 ^9 ^7 chain[axis=y]
execute at @s rotated ~ 0 run setblock ^0 ^8 ^7 chain[axis=y]
execute at @s rotated ~ 0 run setblock ^0 ^7 ^7 soul_lantern[hanging=true]

# 7. Pháo hoa & Thẻ tag
execute at @s rotated ~ 0 run summon firework_rocket ^0 ^11 ^7 {LifeTime:25,FireworksItem:{id:"firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"burst",colors:[11141375,16711935,16777215]}]}}}}

tag @s add built_enchant
tag @s remove built_villa
tag @s remove built_castle
tag @s remove built_modern
tag @s remove built_garden
tag @s remove built_bridge
tag @s remove built_pagoda
tag @s remove built_windmill
tag @s remove built_warehouse
tag @s remove built_greenhouse
tag @s remove built_lighthouse
tag @s remove built_nethergate

tellraw @s [{"text":"\n🔮✨ [KIẾN TRÚC SƯ ĐẢO] ","color":"light_purple","bold":true},{"text":"Đã thi công hoàn tất ","color":"yellow"},{"text":"Tháp Phù Phép Cấp 30 Tối Thượng!\n","color":"gold","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n","color":"dark_gray"},{"text":"📐 Quy mô: ","color":"aqua"},{"text":"11x11 x H15 blocks | Tường đá đen kiên cố, mái vòm Obsidian kín khít\n","color":"white"},{"text":"✨ Ma thuật: ","color":"light_purple"},{"text":"Bàn Enchant Max Cấp 30 (19 kệ sách), Bục đọc sách, Đe sắt, Bàn mài & Tinh thể tím\n","color":"white"},{"text":"🛡️ Hoàn tác: ","color":"gold"},{"text":"Gõ ","color":"gray"},{"text":"/is undo","color":"yellow","bold":true},{"text":" trong 3 phút nếu muốn dỡ bỏ hoàn 90% tiền!\n","color":"gray"},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"}]
