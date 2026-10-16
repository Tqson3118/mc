# ==============================================================================
# SKYBLOCK - ĐỀN THẦN KHAI KHOÁNG HOÀNG GIA 8 LINE (ROYAL DWARVEN ORE TEMPLE)
# ==============================================================================
# Kiến trúc vòm đá đen mạ vàng & thạch anh chạm khắc, đỉnh tinh thể Thạch Anh Tím,
# Đáy lót Obsidian chống đào thủng, tích hợp BỆ ĐỨNG MINION ĐÀO CHUYÊN DỤNG!
# ==============================================================================

# 1. Âm thanh kích hoạt
execute at @s run playsound minecraft:block.anvil.use master @a ~ ~ ~ 1.5 1.1
execute at @s run playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1.2 1.4

# 2. Dọn sạch không gian (13 x 9 x 9 blocks phía trước người chơi)
execute at @s rotated ~ 0 run fill ^-6 ^-1 ^1 ^6 ^8 ^10 air replace

# 3. Nền móng Đá Đen Viền Vàng & Lõi Obsidian chống cúp nổ đào thủng đảo
execute at @s rotated ~ 0 run fill ^-6 ^-1 ^2 ^6 ^-1 ^9 polished_blackstone_bricks
execute at @s rotated ~ 0 run fill ^-5 ^-1 ^3 ^5 ^-1 ^8 deepslate_tiles
execute at @s rotated ~ 0 run fill ^-4 ^-1 ^5 ^3 ^-1 ^5 obsidian
execute at @s rotated ~ 0 run fill ^-4 ^-1 ^6 ^3 ^-1 ^6 chiseled_polished_blackstone

# 4. Sàn Đứng Đào Thạch Anh Hoàng Gia & Thảm Nhung Đỏ (Z=2..3)
execute at @s rotated ~ 0 run fill ^-5 ^0 ^2 ^4 ^0 ^3 smooth_quartz
execute at @s rotated ~ 0 run fill ^-4 ^1 ^3 ^3 ^1 ^3 smooth_quartz_slab
execute at @s rotated ~ 0 run fill ^-3 ^1 ^2 ^2 ^1 ^2 red_carpet

# BỆ ĐẶT MINION ĐÀO CHUYÊN DỤNG (Tại X=0, Z=3, nhìn thẳng vào ô quặng Kim Cương ^0 ^0 ^5)
execute at @s rotated ~ 0 run setblock ^0 ^0 ^3 chiseled_quartz_block
execute at @s rotated ~ 0 run setblock ^0 ^1 ^3 heavy_weighted_pressure_plate

# 5. Buồng Cấp Nước Pha Lê (Phía sau Z=7..8)
execute at @s rotated ~ 0 run fill ^-5 ^0 ^7 ^4 ^2 ^8 polished_blackstone_bricks
execute at @s rotated ~ 0 run fill ^-4 ^-1 ^7 ^3 ^-1 ^7 sea_lantern
execute at @s rotated ~ 0 run fill ^-4 ^0 ^7 ^3 ^0 ^7 water
execute at @s rotated ~ 0 run fill ^-4 ^1 ^7 ^3 ^2 ^7 cyan_stained_glass

# 6. Buồng Cấp Dung Nham Hỏa Ngọc (Phía trước Z=4)
execute at @s rotated ~ 0 run fill ^-5 ^0 ^4 ^4 ^2 ^4 polished_blackstone_bricks
execute at @s rotated ~ 0 run fill ^-4 ^0 ^4 ^3 ^0 ^4 lava
execute at @s rotated ~ 0 run fill ^-4 ^1 ^4 ^3 ^2 ^4 orange_stained_glass

# 7. Mạch 8 Ô Quặng Tự Sinh Liên Hoàn (Tại Z=5)
execute at @s rotated ~ 0 run fill ^-4 ^0 ^5 ^3 ^0 ^5 iron_ore
execute at @s rotated ~ 0 run setblock ^-4 ^0 ^5 coal_ore
execute at @s rotated ~ 0 run setblock ^-3 ^0 ^5 copper_ore
execute at @s rotated ~ 0 run setblock ^-2 ^0 ^5 gold_ore
execute at @s rotated ~ 0 run setblock ^-1 ^0 ^5 lapis_ore
execute at @s rotated ~ 0 run setblock ^0 ^0 ^5 diamond_ore
execute at @s rotated ~ 0 run setblock ^1 ^0 ^5 emerald_ore
execute at @s rotated ~ 0 run setblock ^2 ^0 ^5 redstone_ore

# 8. 4 Trụ Cột Điêu Khắc Mạ Vàng & Mái Vòm Đền Thần (Y=1..7)
execute at @s rotated ~ 0 run fill ^-5 ^1 ^2 ^-5 ^4 ^2 chiseled_polished_blackstone
execute at @s rotated ~ 0 run fill ^4 ^1 ^2 ^4 ^4 ^2 chiseled_polished_blackstone
execute at @s rotated ~ 0 run fill ^-5 ^1 ^8 ^-5 ^4 ^8 chiseled_polished_blackstone
execute at @s rotated ~ 0 run fill ^4 ^1 ^8 ^4 ^4 ^8 chiseled_polished_blackstone
execute at @s rotated ~ 0 run setblock ^-5 ^3 ^2 gilded_blackstone
execute at @s rotated ~ 0 run setblock ^4 ^3 ^2 gilded_blackstone
execute at @s rotated ~ 0 run setblock ^-5 ^3 ^8 gilded_blackstone
execute at @s rotated ~ 0 run setblock ^4 ^3 ^8 gilded_blackstone

# Gờ Mái Vòm Đa Tầng (Y=4..6)
execute at @s rotated ~ 0 run fill ^-6 ^4 ^2 ^5 ^4 ^2 deepslate_tile_stairs[facing=south]
execute at @s rotated ~ 0 run fill ^-6 ^4 ^8 ^5 ^4 ^8 deepslate_tile_stairs[facing=north]
execute at @s rotated ~ 0 run fill ^-5 ^5 ^3 ^4 ^5 ^7 deepslate_tiles
execute at @s rotated ~ 0 run fill ^-4 ^6 ^4 ^3 ^6 ^6 smooth_quartz_slab
execute at @s rotated ~ 0 run setblock ^-1 ^6 ^5 amethyst_block
execute at @s rotated ~ 0 run setblock ^0 ^6 ^5 amethyst_block
execute at @s rotated ~ 0 run setblock ^-1 ^7 ^5 amethyst_cluster[facing=up]
execute at @s rotated ~ 0 run setblock ^0 ^7 ^5 amethyst_cluster[facing=up]

# Đèn Chùm Linh Hồn & Đèn Lồng Chiếu Sáng
execute at @s rotated ~ 0 run setblock ^-2 ^4 ^5 soul_lantern[hanging=true]
execute at @s rotated ~ 0 run setblock ^1 ^4 ^5 soul_lantern[hanging=true]
execute at @s rotated ~ 0 run setblock ^-5 ^2 ^1 lantern
execute at @s rotated ~ 0 run setblock ^4 ^2 ^1 lantern

# 9. Khu Tiện Ích Thợ Mỏ: Rương Đôi, Bàn Chế Tạo, Lò Luyện Kim & Đe Sắt
execute at @s rotated ~ 0 run setblock ^-5 ^0 ^2 chest[facing=south,type=left]
execute at @s rotated ~ 0 run setblock ^-4 ^0 ^2 chest[facing=south,type=right]
execute at @s rotated ~ 0 run setblock ^3 ^0 ^2 blast_furnace[facing=south]
execute at @s rotated ~ 0 run setblock ^4 ^0 ^2 crafting_table
execute at @s rotated ~ 0 run setblock ^4 ^1 ^2 anvil[facing=south]

# Biển hướng dẫn đặt Minion Đào
execute at @s rotated ~ 0 run setblock ^-5 ^2 ^2 oak_wall_sign[facing=south]{front_text:{has_glowing_text:1b,messages:['{"text":"[ ĐẶT MINION ]","color":"gold","bold":true}','{"text":"Đứng lên đĩa sắt","color":"yellow"}','{"text":"nhìn vào quặng","color":"aqua"}','{"text":"Gõ /is minions","color":"green","bold":true}']}}

# 10. Pháo hoa & Thông báo
execute at @s rotated ~ 0 run summon firework_rocket ^0 ^3 ^5 {LifeTime:20,FireworksItem:{id:"firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"burst",has_twinkle:1b,colors:[16766720,65535,3847130]}]}}}}
tellraw @s [{"text":"
⛏️🏛️ [ĐỀN THẦN KHAI KHOÁNG HOÀNG GIA 8 LINE] ","color":"gold","bold":true},{"text":"Đã khánh thành công trình đào quặng thế hệ mới!
","color":"yellow"},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
","color":"dark_gray"},{"text":"✨ KIẾN TRÚC MỚI: ","color":"aqua","bold":true},{"text":"Mái vòm Đá Đen Mạ Vàng & Thạch Anh, Đỉnh Tinh Thể Tím, Rương Đôi, Lò Luyện Kim & Đe Sắt!
","color":"white"},{"text":"🤖 TƯƠNG THÍCH MINION 100%: ","color":"green","bold":true},{"text":"Hãy đứng lên Đĩa Cân Sắt ở giữa, nhìn vào dãy quặng và bấm ","color":"yellow"},{"text":"[📍 Đặt Tới Đây]","color":"aqua","bold":true,"clickEvent":{"action":"run_command","value":"/is minions"}},{"text":" trong /is minions để Minion tự động vung cúp đập quặng liên tục!
","color":"yellow"},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"}]
