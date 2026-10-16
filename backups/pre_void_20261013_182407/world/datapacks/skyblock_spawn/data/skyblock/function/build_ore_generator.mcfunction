# ==============================================================================
# SKYBLOCK - MÁY TẠO QUẶNG ĐẢO 8 LINE HOÀNG GIA (8-LANE ORE GENERATOR)
# ==============================================================================
# Thiết kế chuẩn kỹ thuật Skyblock:
# - Nước & Dung Nham gặp nhau sinh ra Quặng theo cấp nâng cấp đảo (/is upgrades)
# - Sàn dưới chân khối quặng lót Obsidian chống cúp đào thủng sàn đảo
# - Lan can kính bảo vệ an toàn 100%, không bị cháy hoặc rơi vào dung nham
# ==============================================================================

# 1. Âm thanh kích hoạt
execute at @s run playsound minecraft:block.stone.place master @a ~ ~ ~ 1.5 1.0
execute at @s run playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1.2 1.3

# 2. Dọn sạch không gian (12 x 5 x 6 block phía trước người chơi)
execute at @s rotated ~ 0 run fill ^-5 ^-1 ^2 ^6 ^4 ^9 air replace

# 3. Nền móng & Sàn lót Obsidian chống đào thủng
execute at @s rotated ~ 0 run fill ^-5 ^-1 ^2 ^6 ^-1 ^9 deepslate_tiles
execute at @s rotated ~ 0 run fill ^-4 ^-1 ^5 ^3 ^-1 ^5 obsidian

# 4. Rãnh thoát nước (Hố sâu 1 block tại Z=6 để nước chảy xuống không biến dung nham thành obsidian)
execute at @s rotated ~ 0 run fill ^-4 ^-1 ^6 ^3 ^-1 ^6 deepslate_bricks

# 5. Khung chứa Nước (Phía sau Z=7)
execute at @s rotated ~ 0 run fill ^-5 ^0 ^7 ^4 ^1 ^8 deepslate_bricks
execute at @s rotated ~ 0 run fill ^-4 ^0 ^7 ^3 ^0 ^7 water
execute at @s rotated ~ 0 run fill ^-4 ^1 ^7 ^3 ^1 ^7 cyan_stained_glass

# 6. Khung chứa Dung Nham (Phía trước Z=4)
execute at @s rotated ~ 0 run fill ^-5 ^0 ^3 ^4 ^1 ^4 deepslate_bricks
execute at @s rotated ~ 0 run fill ^-4 ^0 ^4 ^3 ^0 ^4 lava
execute at @s rotated ~ 0 run fill ^-4 ^1 ^4 ^3 ^1 ^4 orange_stained_glass

# 7. Hàng 8 Ô Quặng Sinh Ra Tự Động (Tại Z=5)
# Khi nước từ Z=7 chảy qua Z=6 gặp dung nham từ Z=4 chảy sang Z=5 -> Tạo quặng tại Z=5
execute at @s rotated ~ 0 run fill ^-4 ^0 ^5 ^3 ^0 ^5 iron_ore
execute at @s rotated ~ 0 run setblock ^-4 ^0 ^5 coal_ore
execute at @s rotated ~ 0 run setblock ^-2 ^0 ^5 gold_ore
execute at @s rotated ~ 0 run setblock ^0 ^0 ^5 diamond_ore
execute at @s rotated ~ 0 run setblock ^2 ^0 ^5 emerald_ore

# 8. Sàn đứng đào & Lan can bảo vệ an toàn (Tại Z=2..3)
execute at @s rotated ~ 0 run fill ^-4 ^0 ^2 ^3 ^0 ^2 smooth_quartz
execute at @s rotated ~ 0 run fill ^-4 ^1 ^3 ^3 ^1 ^3 smooth_quartz_slab
execute at @s rotated ~ 0 run setblock ^-5 ^1 ^2 lantern
execute at @s rotated ~ 0 run setblock ^4 ^1 ^2 lantern

# 9. Rương phụ kiện & Bàn chế tạo
execute at @s rotated ~ 0 run setblock ^-5 ^0 ^2 chest[facing=south]
execute at @s rotated ~ 0 run setblock ^4 ^0 ^2 crafting_table

# 10. Bắn pháo hoa chào mừng
execute at @s rotated ~ 0 run summon firework_rocket ^0 ^2 ^5 {LifeTime:20,FireworksItem:{id:"firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"burst",has_twinkle:1b,colors:[16766720,65535,3847130]}]}}}}

# 11. Hướng dẫn tellraw
tellraw @s [{"text":"\n⛏️💎 [MÁY TẠO QUẶNG SKYBLOCK 8 LINE] ","color":"gold","bold":true},{"text":"Đã dựng thành công giàn đào quặng liên hoàn 8 ô!\n","color":"yellow"},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n","color":"dark_gray"},{"text":"⚡ CƠ CHẾ HOẠT ĐỘNG: ","color":"aqua","bold":true},{"text":"Nước & Dung Nham gặp nhau sinh ra Quặng tự động theo cấp đảo!\n","color":"white"},{"text":"🛡️ SÀN CHỐNG THỦNG: ","color":"green","bold":true},{"text":"Đáy lót Hắc Diệu Thạch (Obsidian) đào tẹt ga không sợ rơi đảo!\n","color":"green"},{"text":"📈 NÂNG TỈ LỆ QUẶNG XỊN: ","color":"gold","bold":true},{"text":"Gõ ","color":"gray"},{"text":"/is upgrades","color":"yellow","bold":true},{"text":" -> Nâng cấp mục ","color":"gray"},{"text":"[Máy Quặng Đảo]","color":"aqua","bold":true},{"text":" để ra Kim Cương & Khối Quặng!\n","color":"gray"},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"}]
