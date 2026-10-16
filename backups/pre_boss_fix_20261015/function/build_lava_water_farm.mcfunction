# ==============================================================================
# SKYBLOCK - ĐẠI ĐIỆN THỦY HỎA THIÊN KHÔNG (MEGA LAVA & WATER HYDRO-REFINERY)
# ==============================================================================
# Công trình phức hợp quy mô lớn:
# 1. Trạm 24 Vạc Dung Nham Thạch Nhũ (Dripstone Lava Cauldrons) Farm Lava Vô Hạn
# 2. Kênh & 12 Vạc Nước Vô Tận Hoàng Gia (Infinite Water Reservoir & Cauldrons)
# 3. Trạm Máy Tạo Đá Cuội Đa Năng Lót Nền Obsidian (Cobble Generator Station)
# 4. Rương cấp sẵn 16 Xô Sắt + Bàn Chế Tạo + Lò Luyện Kim Siêu Tốc
# Chống cháy 100% bằng Deepslate, Thạch Anh & Kính Cường Lực
# ==============================================================================

# 1. Âm thanh kích hoạt ma thuật hoành tráng
execute at @s run playsound minecraft:block.lava.ambient master @a ~ ~ ~ 2.0 1.0
execute at @s run playsound minecraft:block.water.ambient master @a ~ ~ ~ 2.0 1.0
execute at @s run playsound minecraft:block.beacon.activate master @a ~ ~ ~ 2.0 1.2
execute at @s run playsound minecraft:ui.toast.challenge_complete player @s ~ ~ ~ 1.5 1.2

# 2. Dọn sạch không gian (15 x 19 x 8 blocks)
execute at @s rotated ~ 0 run fill ^-7 ^-1 ^1 ^7 ^7 ^20 air replace

# 3. Nền móng kiên cố chống cháy (Foundation & Floor)
execute at @s rotated ~ 0 run fill ^-7 ^-1 ^1 ^7 ^-1 ^19 deepslate_tiles
execute at @s rotated ~ 0 run fill ^-7 ^-1 ^1 ^7 ^-1 ^1 deepslate_bricks
execute at @s rotated ~ 0 run fill ^-7 ^-1 ^19 ^7 ^-1 ^19 deepslate_bricks
execute at @s rotated ~ 0 run fill ^-7 ^-1 ^1 ^-7 ^-1 ^19 deepslate_bricks
execute at @s rotated ~ 0 run fill ^7 ^-1 ^1 ^7 ^-1 ^19 deepslate_bricks

# Sàn hành lang trung tâm lót Thạch Anh Mịn bóng loáng
execute at @s rotated ~ 0 run fill ^-1 ^0 ^1 ^1 ^0 ^17 smooth_quartz
# Đèn biển âm sàn chiếu sáng lộng lẫy
execute at @s rotated ~ 0 run setblock ^0 ^-1 ^3 sea_lantern
execute at @s rotated ~ 0 run setblock ^0 ^-1 ^7 sea_lantern
execute at @s rotated ~ 0 run setblock ^0 ^-1 ^11 sea_lantern
execute at @s rotated ~ 0 run setblock ^0 ^-1 ^15 sea_lantern
execute at @s rotated ~ 0 run setblock ^0 ^0 ^3 glass
execute at @s rotated ~ 0 run setblock ^0 ^0 ^7 glass
execute at @s rotated ~ 0 run setblock ^0 ^0 ^11 glass
execute at @s rotated ~ 0 run setblock ^0 ^0 ^15 glass

# Lan can an toàn bằng Thạch Anh dọc hành lang
execute at @s rotated ~ 0 run fill ^-2 ^0 ^4 ^-2 ^0 ^16 smooth_quartz_slab
execute at @s rotated ~ 0 run fill ^2 ^0 ^4 ^2 ^0 ^16 smooth_quartz_slab

# ==============================================================================
# 4. CÁNH HỎA (MAGMA WING) - TRẠM 24 VẠC DUNG NHAM THẠCH NHŨ VÔ TẬN
# ==============================================================================
# Hàng 1 (Gần hành lang): 12 Vạc Dung Nham đã đầy sẵn để múc ngay
execute at @s rotated ~ 0 run fill ^3 ^0 ^4 ^3 ^0 ^15 lava_cauldron

# Hàng 2 (Phía ngoài): 12 Vạc đang hứng giọt lava tạo liên tục
execute at @s rotated ~ 0 run fill ^4 ^0 ^4 ^4 ^0 ^15 cauldron

# Thạch nhũ nhọn treo chúc đầu xuống vạc (Y=2)
execute at @s rotated ~ 0 run fill ^3 ^2 ^4 ^4 ^2 ^15 pointed_dripstone[thickness=tip,vertical_direction=down]

# Khối đá dẫn nhiệt đặc (Y=3)
execute at @s rotated ~ 0 run fill ^3 ^3 ^4 ^4 ^3 ^15 deepslate_tiles

# Nguồn Dung Nham thật phía trên (Y=4)
execute at @s rotated ~ 0 run fill ^3 ^4 ^4 ^4 ^4 ^15 lava

# Khung kính cam & tường đá khóa kín dung nham an toàn 100%
execute at @s rotated ~ 0 run fill ^2 ^1 ^3 ^5 ^4 ^3 orange_stained_glass
execute at @s rotated ~ 0 run fill ^2 ^1 ^16 ^5 ^4 ^16 orange_stained_glass
execute at @s rotated ~ 0 run fill ^2 ^2 ^4 ^2 ^4 ^15 orange_stained_glass
execute at @s rotated ~ 0 run fill ^5 ^0 ^3 ^5 ^4 ^16 deepslate_bricks

# Mái vòm Cánh Hỏa lót thạch anh & đèn nấm phát sáng
execute at @s rotated ~ 0 run fill ^2 ^5 ^3 ^5 ^5 ^16 smooth_quartz_slab
execute at @s rotated ~ 0 run setblock ^3 ^5 ^3 shroomlight
execute at @s rotated ~ 0 run setblock ^4 ^5 ^9 shroomlight
execute at @s rotated ~ 0 run setblock ^3 ^5 ^16 shroomlight

# ==============================================================================
# 5. CÁNH THỦY (HYDRO WING) - KÊNH & 12 VẠC NƯỚC VÔ TẬN HOÀNG GIA
# ==============================================================================
# Kênh Nước Vô Hạn (múc ở bất kỳ ô nào cũng lập tức đầy lại)
execute at @s rotated ~ 0 run fill ^-3 ^0 ^4 ^-3 ^0 ^15 water

# Hàng 12 Vạc Nước tinh khiết
execute at @s rotated ~ 0 run fill ^-4 ^0 ^4 ^-4 ^0 ^15 water_cauldron[level=3]

# Đáy kênh nước lót đá biển phát sáng xanh biếc
execute at @s rotated ~ 0 run fill ^-3 ^-1 ^4 ^-3 ^-1 ^15 sea_lantern
execute at @s rotated ~ 0 run fill ^-4 ^-1 ^4 ^-4 ^-1 ^15 prismarine_bricks
execute at @s rotated ~ 0 run fill ^-5 ^0 ^3 ^-5 ^4 ^16 prismarine_bricks

# Vách kính ngọc xanh Cyan mát mắt
execute at @s rotated ~ 0 run fill ^-5 ^1 ^3 ^-2 ^4 ^3 cyan_stained_glass
execute at @s rotated ~ 0 run fill ^-5 ^1 ^16 ^-2 ^4 ^16 cyan_stained_glass
execute at @s rotated ~ 0 run fill ^-2 ^2 ^4 ^-2 ^4 ^15 cyan_stained_glass

# Mái vòm Cánh Thủy lót thạch anh & đèn biển
execute at @s rotated ~ 0 run fill ^-5 ^5 ^3 ^-2 ^5 ^16 smooth_quartz_slab
execute at @s rotated ~ 0 run setblock ^-3 ^5 ^3 sea_lantern
execute at @s rotated ~ 0 run setblock ^-4 ^5 ^9 sea_lantern
execute at @s rotated ~ 0 run setblock ^-3 ^5 ^16 sea_lantern

# ==============================================================================
# 6. TRẠM MÁY TẠO ĐÁ CUỘI ĐA NĂNG LÓT OBSIDIAN (COBBLE GENERATOR)
# ==============================================================================
# Sàn đỡ bên dưới bằng Hắc Diệu Thạch (Obsidian) để cúp xịn không đào thủng sàn
execute at @s rotated ~ 0 run fill ^-1 ^-1 ^18 ^1 ^-1 ^18 obsidian

# Khối đá cuội sinh ra liên tục ở giữa
execute at @s rotated ~ 0 run setblock ^-1 ^0 ^18 cobblestone
execute at @s rotated ~ 0 run setblock ^0 ^0 ^18 cobblestone
execute at @s rotated ~ 0 run setblock ^1 ^0 ^18 cobblestone

# Dòng nước cấp bên trái
execute at @s rotated ~ 0 run setblock ^-2 ^0 ^18 water
# Dòng dung nham cấp bên phải
execute at @s rotated ~ 0 run setblock ^2 ^0 ^18 lava

# Tường chắn bảo vệ buồng tạo đá
execute at @s rotated ~ 0 run fill ^-3 ^0 ^17 ^3 ^2 ^19 deepslate_bricks
execute at @s rotated ~ 0 run fill ^-1 ^0 ^17 ^1 ^1 ^17 air
execute at @s rotated ~ 0 run fill ^-1 ^0 ^18 ^1 ^0 ^18 cobblestone
execute at @s rotated ~ 0 run setblock ^-2 ^0 ^18 water
execute at @s rotated ~ 0 run setblock ^2 ^0 ^18 lava
execute at @s rotated ~ 0 run fill ^-1 ^1 ^18 ^1 ^1 ^18 air
execute at @s rotated ~ 0 run fill ^-1 ^2 ^17 ^1 ^2 ^18 tinted_glass replace air

# ==============================================================================
# 7. CỔNG VÀO HOÀNG GIA & KHU TIỆN ÍCH
# ==============================================================================
# Trụ cổng vào
execute at @s rotated ~ 0 run setblock ^-2 ^1 ^2 deepslate_brick_wall
execute at @s rotated ~ 0 run setblock ^-2 ^2 ^2 deepslate_brick_wall
execute at @s rotated ~ 0 run setblock ^-2 ^3 ^2 lantern
execute at @s rotated ~ 0 run setblock ^2 ^1 ^2 deepslate_brick_wall
execute at @s rotated ~ 0 run setblock ^2 ^2 ^2 deepslate_brick_wall
execute at @s rotated ~ 0 run setblock ^2 ^3 ^2 lantern

# Bàn Chế Tạo & Lò Luyện Kim Siêu Tốc
execute at @s rotated ~ 0 run setblock ^-1 ^0 ^2 crafting_table
execute at @s rotated ~ 0 run setblock ^1 ^0 ^2 blast_furnace[facing=south]

# 2 Rương Báu Hoàng Gia cấp sẵn Xô Sắt
execute at @s rotated ~ 0 run setblock ^-1 ^0 ^1 chest[facing=south]
execute at @s rotated ~ 0 run setblock ^1 ^0 ^1 chest[facing=south]

# Nạp 16 Xô Sắt vào mỗi rương
execute at @s rotated ~ 0 run item replace block ^-1 ^0 ^1 container.0 with bucket 16
execute at @s rotated ~ 0 run item replace block ^1 ^0 ^1 container.0 with bucket 16

# 8. Bắn pháo hoa chào mừng hoàn thành công trình
execute at @s rotated ~ 0 run summon firework_rocket ^0 ^3 ^5 {LifeTime:20,FireworksItem:{id:"firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"burst",has_twinkle:1b,has_trail:1b,colors:[16733525,65535,16777215],fade_colors:[16755200,3847130]}]}}}}

# 9. Thông báo tellraw hướng dẫn cực kỳ chi tiết
tellraw @s [{"text":"\n🔥🌊 [ĐẠI ĐIỆN THỦY HỎA THIÊN KHÔNG] ","color":"gold","bold":true},{"text":"Đã khánh thành Trạm Farm Dung Nham & Nước Hoàng Gia!\n","color":"yellow"},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n","color":"dark_gray"},{"text":"🔥 CÁNH HỎA (Bên Phải): ","color":"gold","bold":true},{"text":"24 Vạc Dung Nham Thạch Nhũ vô tận (12 vạc đầy sẵn + 12 vạc hứng liên tục)!\n","color":"yellow"},{"text":"💧 CÁNH THỦY (Bên Trái): ","color":"aqua","bold":true},{"text":"Kênh Nước Vô Hạn & 12 Vạc Nước tinh khiết múc không bao giờ cạn!\n","color":"white"},{"text":"⛏ TRẠM TẠO ĐÁ (Cuối Hàng): ","color":"light_purple","bold":true},{"text":"Máy tạo Đá Cuội 3 line lót sàn Hắc Diệu Thạch chống đào thủng sàn!\n","color":"light_purple"},{"text":"🪣 QUÀ TẶNG: ","color":"green","bold":true},{"text":"Đã tặng sẵn 32 Xô Sắt trong 2 Rương ở lối vào để bạn sử dụng ngay!\n","color":"green"},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"}]
