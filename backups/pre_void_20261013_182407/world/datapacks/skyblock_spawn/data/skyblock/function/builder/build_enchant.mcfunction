# ==============================================================================
# SKYBLOCK BUILDER - THÁP PHÙ PHÉP CẤP 30 TỐI THƯỢNG (ENCHANT TOWER)
# ==============================================================================
# Kích thước: 11x11 x H14 block phía trước người chơi
# Chi phí: $40,000 Xu Vault | Bàn Enchant Max Cấp 30 (15+ Kệ Sách), Tinh Thể Thạch Anh Tím
# ==============================================================================

# 1. Âm thanh kích hoạt & Hiệu ứng ma thuật
execute at @s run playsound minecraft:block.enchantment_table.use master @a ~ ~ ~ 1.5 1.0
execute at @s run playsound minecraft:block.amethyst_block.resonate player @s ~ ~ ~ 1.5 1.2
execute at @s run playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1.2 1.4

# 2. Nền Móng Đá Cẩm Thạch & Thạch Anh Tím (11x11 tại Y=-1..0)
execute at @s rotated ~ 0 run fill ^-5 ^-1 ^2 ^5 ^-1 ^12 polished_blackstone
execute at @s rotated ~ 0 run fill ^-4 ^0 ^3 ^4 ^0 ^11 amethyst_block
execute at @s rotated ~ 0 run fill ^-2 ^0 ^5 ^2 ^0 ^9 crying_obsidian

# 3. Thân Tháp Trụ Tròn Huyền Bí (Y=1..8)
execute at @s rotated ~ 0 run fill ^-4 ^1 ^3 ^4 ^8 ^3 deepslate_tile_wall
execute at @s rotated ~ 0 run fill ^-4 ^1 ^11 ^4 ^8 ^11 deepslate_tile_wall
execute at @s rotated ~ 0 run fill ^-4 ^1 ^4 ^-4 ^8 ^10 deepslate_tile_wall
execute at @s rotated ~ 0 run fill ^4 ^1 ^4 ^4 ^8 ^10 deepslate_tile_wall

# 4 Trụ Cột Góc Đá Đen Tinh Luyện
execute at @s rotated ~ 0 run fill ^-4 ^1 ^3 ^-4 ^9 ^3 chiseled_polished_blackstone
execute at @s rotated ~ 0 run fill ^4 ^1 ^3 ^4 ^9 ^3 chiseled_polished_blackstone
execute at @s rotated ~ 0 run fill ^-4 ^1 ^11 ^-4 ^9 ^11 chiseled_polished_blackstone
execute at @s rotated ~ 0 run fill ^4 ^1 ^11 ^4 ^9 ^11 chiseled_polished_blackstone

# Cửa vào vòm ma thuật
execute at @s rotated ~ 0 run setblock ^0 ^1 ^3 air
execute at @s rotated ~ 0 run setblock ^0 ^2 ^3 air

# Cửa sổ kính tím ma mị
execute at @s rotated ~ 0 run fill ^-4 ^3 ^6 ^-4 ^6 ^8 purple_stained_glass
execute at @s rotated ~ 0 run fill ^4 ^3 ^6 ^4 ^6 ^8 purple_stained_glass
execute at @s rotated ~ 0 run fill ^-1 ^3 ^11 ^1 ^6 ^11 purple_stained_glass

# 4. TRUNG TÂM PHÙ PHÉP MAX LEVEL 30 (ĐỦ 15+ BOOKSHELVES CHUẨN XÁC)
execute at @s rotated ~ 0 run setblock ^0 ^1 ^7 enchanting_table

# Vòng 16 kệ sách bao quanh bàn enchant (khoảng cách 1 khối chuẩn xác)
execute at @s rotated ~ 0 run fill ^-2 ^1 ^5 ^2 ^1 ^5 bookshelf
execute at @s rotated ~ 0 run fill ^-2 ^1 ^9 ^2 ^1 ^9 bookshelf
execute at @s rotated ~ 0 run fill ^-2 ^1 ^6 ^-2 ^1 ^8 bookshelf
execute at @s rotated ~ 0 run fill ^2 ^1 ^6 ^2 ^1 ^8 bookshelf
execute at @s rotated ~ 0 run setblock ^0 ^1 ^5 air

# Tầng 2 kệ sách tăng cường
execute at @s rotated ~ 0 run setblock ^-2 ^2 ^5 bookshelf
execute at @s rotated ~ 0 run setblock ^2 ^2 ^5 bookshelf
execute at @s rotated ~ 0 run setblock ^-2 ^2 ^9 bookshelf
execute at @s rotated ~ 0 run setblock ^2 ^2 ^9 bookshelf

# 5. Tiện Ích Phụ Trợ (Đe sắt, Bàn gỡ bùa, Cụm tinh thể tím)
execute at @s rotated ~ 0 run setblock ^-3 ^1 ^4 anvil[facing=east]
execute at @s rotated ~ 0 run setblock ^3 ^1 ^4 grindstone[face=floor,facing=west]
execute at @s rotated ~ 0 run setblock ^-3 ^1 ^10 amethyst_cluster[facing=up]
execute at @s rotated ~ 0 run setblock ^3 ^1 ^10 amethyst_cluster[facing=up]

# 6. Mái Tháp Nhọn Obsidian & Tinh Thể Huyền Ảo (Y=9..14)
execute at @s rotated ~ 0 run fill ^-3 ^9 ^4 ^3 ^9 ^10 obsidian
execute at @s rotated ~ 0 run fill ^-2 ^10 ^5 ^2 ^10 ^9 obsidian
execute at @s rotated ~ 0 run fill ^-1 ^11 ^6 ^1 ^11 ^8 crying_obsidian
execute at @s rotated ~ 0 run setblock ^0 ^12 ^7 amethyst_block
execute at @s rotated ~ 0 run setblock ^0 ^13 ^7 amethyst_cluster[facing=up]

# Đèn lồng linh hồn thắp sáng
execute at @s rotated ~ 0 run setblock ^0 ^8 ^7 soul_lantern[hanging=true]

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

tellraw @s [{"text":"\n🔮✨ [KIẾN TRÚC SƯ ĐẢO] ","color":"light_purple","bold":true},{"text":"Đã thi công hoàn tất ","color":"yellow"},{"text":"Tháp Phù Phép Cấp 30 Tối Thượng!\n","color":"gold","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n","color":"dark_gray"},{"text":"📐 Quy mô: ","color":"aqua"},{"text":"11x11 x H14 blocks | Đỉnh tháp Obsidian & Thạch anh tím lấp lánh\n","color":"white"},{"text":"✨ Ma thuật: ","color":"light_purple"},{"text":"Bàn Enchant Max Cấp 30 (16 kệ sách bao quanh), Đe sắt & Bàn gỡ phù phép\n","color":"white"},{"text":"🛡️ Hoàn tác: ","color":"gold"},{"text":"Gõ ","color":"gray"},{"text":"/is undo","color":"yellow","bold":true},{"text":" trong 3 phút nếu muốn dỡ bỏ hoàn 90% tiền!\n","color":"gray"},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"}]
