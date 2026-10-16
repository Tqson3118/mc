# ==============================================================================
# HỆ THỐNG ĐA ĐẤU TRƯỜNG PVP BIỆT LẬP (PVP MULTI-ARENAS SYSTEM)
# Phía Đông: X: 50..125, Z: -35..35, Y=110
# Sảnh PvP Lounge: X: 56..68, Z: -12..12
# Đấu Trường 1 (Võ Đài La Mã Solo 1v1 Colosseum): X: 72..98, Z: -30..-5
# Đấu Trường 2 (Pháo Đài Hỗn Chiến Team Siege): X: 72..115, Z: 5..35
# ==============================================================================

# ------------------------------------------------------------------------------
# 1. DỌN DẸP KHÔNG GIAN CÁC PHÂN KHU PVP (Tránh vượt quá giới hạn 32,768 block)
# ------------------------------------------------------------------------------
# Dọn Sảnh PvP Lounge (X >= 73, không đè vào Cánh Đông Hub X <= 72)
fill 72 104 -14 86 128 14 air
# Dọn Đấu Trường 1 (Võ Đài La Mã Colosseum: X: 71..100, Z: -32..-3)
fill 71 104 -32 100 128 -3 air
# Dọn Đấu Trường 2 Nửa Tây (Pháo Đài Team Siege: X: 71..93, Z: 4..36)
fill 71 104 4 93 128 36 air
# Dọn Đấu Trường 2 Nửa Đông (Pháo Đài Team Siege: X: 94..117, Z: 4..36)
fill 94 104 4 117 128 36 air

# ------------------------------------------------------------------------------
# 2. XÍCH SẮT LƠ LỬNG KẾT NỐI TỪ CÁNH ĐÔNG SANG SẢNH PVP LOUNGE
# ------------------------------------------------------------------------------
fill 71 120 -1 73 120 1 chain[axis=x]

# ------------------------------------------------------------------------------
# 3. SẢNH ĐẤU TRƯỜNG PVP (PVP LOUNGE: X: 74..86, Z: -12..12, Y=110)
# ------------------------------------------------------------------------------
# Đế nổi ngầm bên dưới
fill 74 105 -11 86 107 11 deepslate
fill 74 108 -12 86 109 12 polished_blackstone_bricks
# Mặt sàn sảnh chính Y=110
fill 74 110 -12 86 110 12 polished_blackstone_bricks
fill 76 110 -10 84 110 10 chiseled_polished_blackstone
fill 78 110 -6 82 110 6 gilded_blackstone
# Thảm đỏ lối đi sang trọng
fill 75 111 -1 83 111 1 red_carpet

# Cột trụ vòm sảnh đá đen mạ vàng Y=111..115
fill 74 111 -12 74 115 -12 gilded_blackstone
fill 86 111 -12 86 115 -12 gilded_blackstone
fill 74 111 12 74 115 12 gilded_blackstone
fill 86 111 12 86 115 12 gilded_blackstone
setblock 74 116 -12 gold_block
setblock 86 116 -12 gold_block
setblock 74 116 12 gold_block
setblock 86 116 12 gold_block
setblock 74 117 -12 soul_lantern
setblock 86 117 -12 soul_lantern
setblock 74 117 12 soul_lantern
setblock 86 117 12 soul_lantern

# Tường bao quanh sảnh
fill 74 111 -12 86 113 -12 deepslate_tile_wall
fill 74 111 12 86 113 12 deepslate_tile_wall
fill 74 111 -12 74 113 12 deepslate_tile_wall
fill 86 111 -12 86 113 12 deepslate_tile_wall
# Cửa kính quan sát phía Đông
fill 86 111 -5 86 113 5 tinted_glass

# Mở các cổng vào / ra
# Cổng Tây (Vào từ Cầu Spawn): X=74, Z: -2..2
fill 74 111 -2 74 113 2 air
# Cổng Bắc (Dẫn sang Đấu Trường 1 Colosseum): Z=-12, X: 78..82
fill 78 111 -12 82 113 -12 air
# Cổng Nam (Dẫn sang Đấu Trường 2 Pháo Đài): Z=12, X: 78..82
fill 78 111 12 82 113 12 air

# Tiện ích cho Đấu Sĩ tại Sảnh PvP Lounge
setblock 76 111 -9 ender_chest
setblock 76 111 -8 chest
setblock 76 111 9 ender_chest
setblock 76 111 8 chest
setblock 76 111 -10 crafting_table
setblock 76 111 10 anvil

# BỤC VINH DANH GIẢI ĐẤU PVP CUỐI TUẦN (TOURNAMENT PODIUM)
# Top 1 Quán Quân (Vàng + Đầu Rồng)
setblock 84 111 0 gold_block
setblock 84 112 0 gold_block
setblock 84 113 0 dragon_head
setblock 83 112 0 oak_wall_sign[facing=west]{front_text:{has_glowing_text:1b,messages:['{"text":"🏆 TOP 1 QUÁN QUÂN 🏆","color":"gold","bold":true}','{"text":"Giải Đấu Cuối Tuần","color":"yellow"}','{"text":"Thưởng: $10,000 + Cúp","color":"green"}','{"text":"Chiến Thần Đấu Sĩ!","color":"aqua"}']}}
# Top 2 Á Quân (Sắt)
setblock 84 111 2 iron_block
setblock 84 112 2 skeleton_skull
setblock 83 112 2 oak_wall_sign[facing=west]{front_text:{has_glowing_text:1b,messages:['{"text":"🥈 TOP 2 Á QUÂN","color":"gray","bold":true}','{"text":"Thưởng: $5,000","color":"green"}','{"text":"Chiến Binh Xuất Sắc","color":"white"}','{"text":"Cố lên nhé!","color":"yellow"}']}}
# Top 3 Hạng Ba (Đồng)
setblock 84 111 -2 copper_block
setblock 84 112 -2 wither_skeleton_skull
setblock 83 112 -2 oak_wall_sign[facing=west]{front_text:{has_glowing_text:1b,messages:['{"text":"🥉 TOP 3 HẠNG BA","color":"red","bold":true}','{"text":"Thưởng: $2,500","color":"green"}','{"text":"Đấu Sĩ Tiềm Năng","color":"white"}','{"text":"Rất cừ khôi!","color":"yellow"}']}}

# Biển chỉ dẫn 2 Đấu Trường tại Sảnh
setblock 75 112 -3 oak_wall_sign[facing=east]{front_text:{has_glowing_text:1b,messages:['{"text":"⚔ SẢNH PVP LOUNGE ⚔","color":"red","bold":true}','{"text":"Khu vực chuẩn bị","color":"gold"}','{"text":"Gõ /warp pvp","color":"yellow"}','{"text":"KeepInventory BẬT","color":"green"}']}}
setblock 75 112 3 oak_wall_sign[facing=east]{front_text:{has_glowing_text:1b,messages:['{"text":"[ CHỌN ĐẤU TRƯỜNG ]","color":"gold","bold":true}','{"text":"⬅ Bắc: Võ Đài 1v1","color":"aqua"}','{"text":"➡ Nam: Pháo Đài Team","color":"red"}','{"text":"Rương cất đồ bên cạnh","color":"yellow"}']}}

setblock 79 112 -11 oak_wall_sign[facing=south]{front_text:{has_glowing_text:1b,messages:['{"text":"⬅ VÕ ĐÀI LA MÃ","color":"aqua","bold":true}','{"text":"Solo 1v1 Colosseum","color":"gold"}','{"text":"Đọ kiếm danh dự","color":"yellow"}','{"text":"Cổng sắt ngăn can thiệp!","color":"green"}']}}
setblock 79 112 11 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:['{"text":"PHÁO ĐÀI HỖN CHIẾN ➡","color":"red","bold":true}','{"text":"Team Siege Đa Tầng","color":"gold"}','{"text":"Tường hào & Tháp cung","color":"yellow"}','{"text":"Chiến thuật hỗn chiến!","color":"aqua"}']}}

# ------------------------------------------------------------------------------
# 4. ĐẤU TRƯỜNG 1: VÕ ĐÀI LA MÃ SOLO 1v1 COLOSSEUM (X: 72..98, Z: -30..-5, Y=110)
# Kích thước: 27x26 block. Tâm võ đài tại X=85, Z=-17
# ------------------------------------------------------------------------------
# Cầu hành lang đá hoa cương từ Sảnh sang cổng Colosseum
fill 78 110 -15 82 110 -12 smooth_stone
fill 78 111 -15 78 111 -12 stone_brick_wall
fill 82 111 -15 82 111 -12 stone_brick_wall
setblock 78 112 -13 lantern
setblock 82 112 -13 lantern

# Đế nổi ngầm
fill 73 105 -29 97 107 -6 smooth_stone
fill 73 108 -29 97 109 -6 polished_diorite
# Mặt sàn đá hoa cương cổ điển Y=110
fill 72 110 -30 98 110 -5 polished_diorite
fill 75 110 -27 95 110 -8 smooth_stone
fill 78 110 -24 92 110 -11 calcite
fill 81 110 -21 89 110 -14 quartz_block
# Hoa văn chữ thập danh dự trung tâm võ đài
fill 84 110 -18 86 110 -16 gilded_blackstone
setblock 85 110 -17 gold_block

# Khán đài bậc thang vòng quanh 3 phía Bắc, Đông, Nam (Y=111..113)
# Phía Bắc (Z: -30..-28)
fill 73 111 -28 97 111 -28 quartz_stairs[facing=south]
fill 73 112 -29 97 112 -29 quartz_stairs[facing=south]
fill 73 113 -30 97 113 -30 stone_brick_stairs[facing=south]
# Phía Nam (Z: -7..-5)
fill 73 111 -7 97 111 -7 quartz_stairs[facing=north]
fill 73 112 -6 97 112 -6 quartz_stairs[facing=north]
fill 73 113 -5 97 113 -5 stone_brick_stairs[facing=north]
# Phía Đông (X: 96..98)
fill 96 111 -28 96 111 -7 quartz_stairs[facing=west]
fill 97 112 -29 97 112 -6 quartz_stairs[facing=west]
fill 98 113 -30 98 113 -5 stone_brick_stairs[facing=west]

# Tường bao khán đài cao nhất
fill 72 114 -30 98 114 -30 stone_brick_wall
fill 72 114 -5 98 114 -5 stone_brick_wall
fill 98 114 -30 98 114 -5 stone_brick_wall
fill 72 111 -30 72 114 -20 stone_brick_wall
fill 72 111 -14 72 114 -5 stone_brick_wall

# Cổng sắt ngăn người ngoài can thiệp trận đấu (X=73, Z: -19..-15)
fill 73 111 -19 73 114 -15 polished_andesite
fill 73 111 -18 73 113 -16 iron_bars
setblock 73 111 -17 iron_door[facing=east,half=lower]
setblock 73 112 -17 iron_door[facing=east,half=upper]
setblock 72 112 -17 stone_button[facing=west]
setblock 74 112 -17 stone_button[facing=east]

# 4 Trụ đuốc Colosseum rực lửa tại 4 góc
fill 76 111 -26 76 114 -26 polished_diorite
setblock 76 115 -26 campfire
fill 94 111 -26 94 114 -26 polished_diorite
setblock 94 115 -26 campfire
fill 76 111 -8 76 114 -8 polished_diorite
setblock 76 115 -8 campfire
fill 94 111 -8 94 114 -8 polished_diorite
setblock 94 115 -8 campfire

# Biển hiệu Colosseum
setblock 72 112 -18 oak_wall_sign[facing=west]{front_text:{has_glowing_text:1b,messages:['{"text":"⚔ VÕ ĐÀI LA MÃ ⚔","color":"gold","bold":true}','{"text":"Solo 1v1 Colosseum","color":"yellow"}','{"text":"Bấm nút mở cổng sắt","color":"white"}','{"text":"Bước vào võ đài!","color":"aqua"}']}}
setblock 72 112 -16 oak_wall_sign[facing=west]{front_text:{has_glowing_text:1b,messages:['{"text":"[ QUY TẮC SOLO ]","color":"red","bold":true}','{"text":"1. Không can thiệp","color":"yellow"}','{"text":"2. Đọ kiếm công bằng","color":"green"}','{"text":"3. Khán giả ở trên đài","color":"aqua"}']}}

# ------------------------------------------------------------------------------
# 5. ĐẤU TRƯỜNG 2: PHÁO ĐÀI HỖN CHIẾN TEAM SIEGE (X: 72..115, Z: 5..35, Y=110)
# Kích thước: 44x31 block đa tầng. Tâm pháo đài tại X=93, Z=20
# ------------------------------------------------------------------------------
# Cầu hành lang từ Sảnh sang Pháo Đài
fill 78 110 12 82 110 18 stone_bricks
fill 78 111 12 78 111 18 stone_brick_wall
fill 82 111 12 82 111 18 stone_brick_wall
setblock 78 112 15 lantern
setblock 82 112 15 lantern

# Đế pháo đài ngầm
fill 73 105 6 114 107 34 cobblestone
fill 73 108 6 114 109 34 stone_bricks
# Mặt sàn tầng 1 pháo đài (Y=110)
fill 72 110 5 115 110 35 stone_bricks
fill 74 110 7 113 110 33 mossy_stone_bricks
fill 78 110 11 109 110 29 cracked_stone_bricks

# Hào nước / Rãnh chiến thuật âm (Y=109)
fill 88 109 8 98 109 10 water
fill 88 109 30 98 109 32 water

# CĂN CỨ ĐỘI ĐỎ (RED BASE - Phía Tây: X=75..78, Z=18..22)
fill 75 111 18 78 111 22 red_carpet
setblock 75 111 17 red_banner
setblock 75 111 23 red_banner
setblock 74 111 20 chest
setblock 75 112 20 oak_wall_sign[facing=east]{front_text:{has_glowing_text:1b,messages:['{"text":"🚩 CĂN CỨ ĐỎ 🚩","color":"red","bold":true}','{"text":"Đội Phe Đỏ","color":"gold"}','{"text":"Bảo vệ cứ điểm!","color":"yellow"}','{"text":"Tấn công Phe Xanh!","color":"aqua"}']}}

# CĂN CỨ ĐỘI XANH (BLUE BASE - Phía Đông: X=109..112, Z=18..22)
fill 109 111 18 112 111 22 blue_carpet
setblock 112 111 17 blue_banner
setblock 112 111 23 blue_banner
setblock 113 111 20 chest
setblock 112 112 20 oak_wall_sign[facing=west]{front_text:{has_glowing_text:1b,messages:['{"text":"🔷 CĂN CỨ XANH 🔷","color":"blue","bold":true}','{"text":"Đội Phe Xanh","color":"aqua"}','{"text":"Bảo vệ cứ điểm!","color":"yellow"}','{"text":"Tấn công Phe Đỏ!","color":"red"}']}}

# CHƯỚNG NGẠI VẬT CHIẾN THUẬT Ở GIỮA SÀN PHÁO ĐÀI
# Tường công sự đá & Bao cát
fill 86 111 15 86 112 18 mud_bricks
fill 86 111 22 86 112 25 mud_bricks
fill 100 111 15 100 112 18 mud_bricks
fill 100 111 22 100 112 25 mud_bricks
# Thùng trang bị & Hàng rào chắn
setblock 87 111 16 barrel
setblock 87 111 17 barrel
setblock 99 111 23 barrel
setblock 99 111 24 barrel
fill 92 111 19 94 111 21 oak_fence
setblock 93 111 20 campfire

# TẦNG 2: BỜ TƯỜNG THÀNH VÀ LỐI ĐI TUẦN (Y=114)
# Tường thành bao quanh
fill 72 111 5 115 114 5 stone_bricks
fill 72 111 35 115 114 35 stone_bricks
fill 72 111 5 72 114 17 stone_bricks
fill 72 111 23 72 114 35 stone_bricks
fill 115 111 5 115 114 35 stone_bricks
# Lỗ châu mai trên tường thành
fill 72 115 5 115 115 5 stone_brick_wall
fill 72 115 35 115 115 35 stone_brick_wall
fill 115 115 5 115 115 35 stone_brick_wall

# Cầu thang đá dẫn lên tầng 2 (Tường thành)
fill 84 111 6 87 114 6 stone_brick_stairs[facing=east]
fill 102 111 34 105 114 34 stone_brick_stairs[facing=west]

# 4 THÁP BẮN CUNG CAO ĐIỂM (ARCHERY TOWERS - Y=118..120)
# Tháp 1 (Tây Bắc: X=74..76, Z=5..7)
fill 74 111 5 76 118 7 chiseled_stone_bricks
fill 74 118 5 76 118 7 smooth_stone
fill 74 119 5 76 119 7 stone_brick_wall
setblock 75 119 6 air
setblock 75 120 7 lantern
fill 75 111 8 75 117 8 ladder[facing=south]

# Tháp 2 (Tây Nam: X=74..76, Z=33..35)
fill 74 111 33 76 118 35 chiseled_stone_bricks
fill 74 118 33 76 118 35 smooth_stone
fill 74 119 33 76 119 35 stone_brick_wall
setblock 75 119 34 air
setblock 75 120 33 lantern
fill 75 111 32 75 117 32 ladder[facing=north]

# Tháp 3 (Đông Bắc: X=111..113, Z=5..7)
fill 111 111 5 113 118 7 chiseled_stone_bricks
fill 111 118 5 113 118 7 smooth_stone
fill 111 119 5 113 119 7 stone_brick_wall
setblock 112 119 6 air
setblock 112 120 7 lantern
fill 112 111 8 112 117 8 ladder[facing=south]

# Tháp 4 (Đông Nam: X=111..113, Z=33..35)
fill 111 111 33 113 118 35 chiseled_stone_bricks
fill 111 118 33 113 118 35 smooth_stone
fill 111 119 33 113 119 35 stone_brick_wall
setblock 112 119 34 air
setblock 112 120 33 lantern
fill 112 111 32 112 117 32 ladder[facing=north]

# Biển cổng vào Pháo Đài
setblock 72 112 17 oak_wall_sign[facing=west]{front_text:{has_glowing_text:1b,messages:['{"text":"🛡 PHÁO ĐÀI HỖN CHIẾN 🛡","color":"red","bold":true}','{"text":"Team Siege Đa Tầng","color":"gold"}','{"text":"Chiếm cứ điểm & tháp!","color":"yellow"}','{"text":"Hỗn chiến đội nhóm!","color":"aqua"}']}}
setblock 72 112 23 oak_wall_sign[facing=west]{front_text:{has_glowing_text:1b,messages:['{"text":"[ VŨ KHÍ GỢI Ý ]","color":"gold","bold":true}','{"text":"Cung Tiễn lên tháp canh","color":"aqua"}','{"text":"Kiếm & Khiên càn quét","color":"green"}','{"text":"KeepInventory BẬT!","color":"yellow"}']}}

# Thông báo hoàn tất
tellraw @a [{"text":"[Skyblock] ","color":"gold","bold":true},{"text":"Đã khởi tạo thành công ĐA ĐẤU TRƯỜNG PVP BIỆT LẬP (X: 50..125, Z: -35..35)!","color":"green"}]
