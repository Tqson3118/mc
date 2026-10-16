# ==============================================================================
# THÁP PARKOUR THỬ THÁCH 30 TẦNG (PARKOUR CHALLENGE TOWER)
# Tọa độ: X=45, Z=-45 (Góc Đông Bắc Spawn) | Chiều cao: Y=115 -> Y=176
# ==============================================================================

# Xóa khu vực xây dựng tháp & entity cũ
kill @e[type=interaction,tag=parkour_chest_interact]
kill @e[type=armor_stand,tag=parkour_hologram]
kill @e[type=text_display,tag=parkour_display]
# Dọn sạch toàn bộ các khối đè cũ và vùng không gian
fill 16 114 -35 35 125 -16 air
fill 28 104 -62 62 106 -28 air

# ------------------------------------------------------------------------------
# 1. BỂ ĐỆM AN TOÀN NỔI NGHỆ THUẬT (FLOATING DEEPSLATE BASIN - Y=105)
# Có đáy đá và tường bao, không rò rỉ nước lơ lửng
# ------------------------------------------------------------------------------
fill 30 104 -60 60 104 -30 cobbled_deepslate
fill 31 105 -59 59 105 -31 water
fill 30 105 -60 60 105 -60 polished_deepslate_wall
fill 30 105 -30 60 105 -30 polished_deepslate_wall
fill 30 105 -60 30 105 -30 polished_deepslate_wall
fill 60 105 -60 60 105 -30 polished_deepslate_wall

# ------------------------------------------------------------------------------
# 2. SẢNH XUẤT PHÁT (STARTING PLATFORM - X=35, Y=115, Z=-35)
# ------------------------------------------------------------------------------
fill 32 114 -38 38 114 -32 polished_andesite
fill 33 115 -37 37 115 -33 smooth_stone
setblock 35 115 -35 gold_block
setblock 35 116 -35 heavy_weighted_pressure_plate
setblock 35 116 -33 oak_wall_sign[facing=south]{front_text:{has_glowing_text:1b,messages:['{"text":"[ BẮT ĐẦU ]","color":"green","bold":true}','{"text":"Nhảy qua 30 Tầng","color":"white"}','{"text":"Ngã sẽ hồi sinh lại","color":"yellow"}','{"text":"Gõ /warp parkour","color":"aqua"}']}}


# ------------------------------------------------------------------------------
# 3. 30 TẦNG THỬ THÁCH PARKOUR (SPIRAL UPWARD FROM Y=116 TO Y=174)
# ------------------------------------------------------------------------------
# Tầng 1 (Y=116): Nhảy cơ bản
setblock 38 116 -36 smooth_stone_slab[type=bottom]
# Tầng 2 (Y=117): Đá cuội
setblock 41 117 -36 cobblestone_wall
# Tầng 3 (Y=118): Sa thạch
setblock 43 118 -39 cut_sandstone
# Tầng 4 (Y=119): Hàng rào gỗ sồi
setblock 41 119 -42 oak_fence
# Tầng 5 (Y=120): Lưới đồng
setblock 39 120 -45 copper_grate
# Tầng 6 (Y=122): Thanh sắt
setblock 42 122 -47 iron_bars
# Tầng 7 (Y=124): Đèn biển
setblock 45 124 -46 sea_lantern
# Tầng 8 (Y=126): Kính dạ quang
setblock 47 126 -43 cyan_stained_glass
# Tầng 9 (Y=128): Cọc Lôi Điện
setblock 48 128 -40 lightning_rod[facing=up]

# ------------------------------------------------------------------------------
# CHECKPOINT 1: TẦNG 10 (Y=130)
# ------------------------------------------------------------------------------
fill 48 129 -37 50 129 -35 gold_block
setblock 49 130 -36 light_weighted_pressure_plate
setblock 49 131 -35 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:['{"text":"[ CHECKPOINT 1 ]","color":"green","bold":true}','{"text":"Tầng 10/30","color":"yellow"}','{"text":"Đã lưu điểm nhảy!","color":"aqua"}','{"text":"Cố gắng lên!","color":"white"}']}}

# Tầng 11 (Y=132): Khối Mật Ong dính trượt
setblock 46 132 -33 honey_block
# Tầng 12 (Y=134): Khối Slime nảy
setblock 43 134 -32 slime_block
# Tầng 13 (Y=136): Cửa sập rừng
setblock 40 136 -34 jungle_trapdoor[facing=north,open=false]
# Tầng 14 (Y=138): Đá đen bóng
setblock 37 138 -37 polished_blackstone_bricks
# Tầng 15 (Y=140): Thạch anh tím
setblock 36 140 -41 amethyst_block
# Tầng 16 (Y=142): Băng nén (trơn trượt)
setblock 38 142 -44 packed_ice
# Tầng 17 (Y=144): Băng lam tốc độ cao
setblock 41 144 -47 blue_ice
# Tầng 18 (Y=146): Hàng rào đỏ thẫm
setblock 44 146 -49 crimson_fence
# Tầng 19 (Y=148): Hắc diện thạch nhỏ giọt (Head-hitter)
setblock 47 148 -47 crying_obsidian
setblock 47 150 -47 polished_deepslate

# ------------------------------------------------------------------------------
# CHECKPOINT 2: TẦNG 20 (Y=150)
# ------------------------------------------------------------------------------
fill 49 149 -44 51 149 -42 diamond_block
setblock 50 150 -43 light_weighted_pressure_plate
setblock 50 151 -42 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:['{"text":"[ CHECKPOINT 2 ]","color":"aqua","bold":true}','{"text":"Tầng 20/30","color":"yellow"}','{"text":"Đã lưu điểm nhảy!","color":"green"}','{"text":"Sắp đến đỉnh rồi!","color":"gold"}']}}

# Tầng 21 (Y=152): Đầu Piston
setblock 48 152 -39 piston_head[facing=up,type=normal]
# Tầng 22 (Y=154): Kệ sách điêu khắc
setblock 45 154 -37 chiseled_bookshelf[facing=north]
# Tầng 23 (Y=156): Dây leo xoắn
setblock 42 156 -36 crying_obsidian
# Tầng 24 (Y=158): Đèn nấm Shroomlight
setblock 39 158 -38 shroomlight
# Tầng 25 (Y=160): Cột tím Purpur 3 ô xa
setblock 37 160 -42 purpur_pillar
# Tầng 26 (Y=162): Cát linh hồn chậm chạp
setblock 38 162 -46 soul_sand
# Tầng 27 (Y=164): Khối Sculk phát sáng
setblock 41 164 -49 sculk_catalyst
# Tầng 28 (Y=166): Đầu rồng Ender (Mũi rồng hẹp)
setblock 45 166 -50 dragon_head[rotation=0]
# Tầng 29 (Y=169): Bệ pha lê thần linh
setblock 48 169 -47 crying_obsidian
setblock 48 170 -47 end_rod

# ------------------------------------------------------------------------------
# TẦNG 30: ĐỈNH THÁP HUYỀN THOẠI (ALTAR OF GLORY - Y=172..176)
# ------------------------------------------------------------------------------
# Bệ đài vàng nguyên khối lơ lửng giữa mây trời
fill 42 171 -48 48 171 -42 polished_blackstone
fill 43 172 -47 47 172 -43 gold_block
fill 42 173 -48 48 173 -48 quartz_stairs[facing=south]
fill 42 173 -42 48 173 -42 quartz_stairs[facing=north]
fill 42 173 -47 42 173 -43 quartz_stairs[facing=east]
fill 48 173 -47 48 173 -43 quartz_stairs[facing=west]

# 4 Trụ Hải Đăng góc
setblock 42 173 -48 sea_lantern
setblock 48 173 -48 sea_lantern
setblock 42 173 -42 sea_lantern
setblock 48 173 -42 sea_lantern
setblock 42 174 -48 end_rod
setblock 48 174 -48 end_rod
setblock 42 174 -42 end_rod
setblock 48 174 -42 end_rod

# Đèn hiệu Beacon phát ánh sáng vàng lên tận trời xanh
setblock 45 171 -45 iron_block
setblock 45 172 -45 beacon
setblock 45 173 -45 yellow_stained_glass

# RƯƠNG THƯỞNG CHIẾN THẮNG TRÊN ĐỈNH THÁP (X=45, Y=174, Z=-43)
setblock 45 173 -43 gilded_blackstone
setblock 45 174 -43 chest[facing=south]
summon interaction 45 174 -43 {Tags:["parkour_chest_interact"],width:1.2f,height:1.2f,response:1b}
summon armor_stand 45 175.5 -43 {Tags:["parkour_hologram"],Invisible:1b,Marker:1b,NoGravity:1b,CustomNameVisible:1b,CustomName:'{"text":"★ RƯƠNG THƯỞNG ĐỈNH THÁP PARKOUR ★","color":"gold","bold":true}'}

# Tấm áp suất chiến thắng & Cổng về Spawn
setblock 45 173 -46 heavy_weighted_pressure_plate
setblock 45 173 -47 oak_wall_sign[facing=south]{front_text:{has_glowing_text:1b,messages:['{"text":"★ VUA PARKOUR ★","color":"gold","bold":true}','{"text":"Đã Chinh Phục","color":"yellow"}','{"text":"Đỉnh 30 Tầng!","color":"green","bold":true}','{"text":"Gõ /spawn để về","color":"aqua"}']}}
