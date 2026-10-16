# ==============================================================================
# HỆ THỐNG ĐẠI ĐIỆN 4 PHÂN KHU BOSS BIỆT LẬP (4 ISOLATED BOSS SANCTUARIES)
# Phía Nam: Z: 50..130, X: -45..45, Y=110
# Sảnh Trung Tâm: Z: 56..70, X: -15..15
# Đại Điện 1 (Động Nhện - Cấp 1): Z: 75..95, X: -40..-18
# Đại Điện 2 (Vực Lửa - Cấp 2): Z: 75..95, X: 18..40
# Đại Điện 3 (Chúa Tể Bóng Tối - Tuần Cấp 3): Z: 100..130, X: -18..18
# Đại Điện 4 (Thánh Địa Hư Không - World Boss Cấp 4): Z: 100..130, X: -45..-25
# ==============================================================================

# ------------------------------------------------------------------------------
# 1. DỌN DẸP KHÔNG GIAN CÁC PHÂN KHU (Chia nhỏ tránh vượt quá 32,768 blocks)
# ------------------------------------------------------------------------------
# Dọn không gian Sảnh Trung Tâm Boss (Z >= 73, không đè vào Cánh Nam Hub Z <= 72)
fill -16 104 73 16 128 89 air
# Dọn không gian Đại Điện 1 (Động Nhện)
fill -42 104 73 -17 128 97 air
# Dọn không gian Đại Điện 2 (Vực Lửa)
fill 17 104 73 42 128 97 air
# Dọn không gian Đại Điện 3 (Thành Trì Chúa Tể Bóng Tối)
fill -19 104 98 19 128 114 air
fill -19 104 115 19 128 132 air
# Dọn không gian Đại Điện 4 (Thánh Địa Hư Không)
fill -47 104 98 -23 128 132 air

# ------------------------------------------------------------------------------
# 2. XÍCH SẮT LƠ LỬNG KẾT NỐI TỪ CÁNH NAM SANG ĐẠI ĐIỆN BOSS
# ------------------------------------------------------------------------------
fill -1 120 71 1 120 73 chain[axis=z]

# ------------------------------------------------------------------------------
# 3. SẢNH ĐỀN BOSS TRUNG TÂM (BOSS SANCTUARY HALL: Z: 74..88, X: -15..15, Y=110)
# ------------------------------------------------------------------------------
# Đế nổi bên dưới
fill -14 104 74 14 104 88 crying_obsidian
fill -15 105 73 15 107 89 polished_blackstone
fill -14 108 74 14 109 88 polished_blackstone_bricks
# Mặt sàn chính Y=110
fill -14 110 74 14 110 88 polished_blackstone_bricks
fill -12 110 76 12 110 86 chiseled_polished_blackstone
fill -8 110 78 8 110 84 gilded_blackstone
fill -4 110 80 4 110 82 crying_obsidian
setblock 0 110 81 lodestone

# Cột trụ vòm sảnh đá đen mạ vàng
fill -14 111 74 -14 115 74 gilded_blackstone
fill 14 111 74 14 115 74 gilded_blackstone
fill -14 111 88 -14 115 88 gilded_blackstone
fill 14 111 88 14 115 88 gilded_blackstone
setblock -14 116 74 gold_block
setblock 14 116 74 gold_block
setblock -14 116 88 gold_block
setblock 14 116 88 gold_block
setblock -14 117 74 soul_lantern
setblock 14 117 74 soul_lantern
setblock -14 117 88 soul_lantern
setblock 14 117 88 soul_lantern

# Tường bao quanh sảnh có lan can
fill -14 111 74 14 112 74 polished_blackstone_brick_wall
fill -14 111 88 14 112 88 polished_blackstone_brick_wall
fill -14 111 74 -14 112 88 polished_blackstone_brick_wall
fill 14 111 74 14 112 88 polished_blackstone_brick_wall

# 4 Lối đi / Cổng dẫn sang các Đại Điện
# Cổng Bắc (Lối vào từ Spawn): X: -2..2, Z=74
fill -2 111 74 2 113 74 air
# Cổng Tây (Dẫn sang Boss 1 & Boss 4): X=-14, Z: 79..83
fill -14 111 79 -14 113 83 air
# Cổng Đông (Dẫn sang Boss 2): X=14, Z: 79..83
fill 14 111 79 14 113 83 air
# Cổng Nam (Dẫn sang Boss 3): X: -2..2, Z=88
fill -2 111 88 2 113 88 air

# Bàn chuẩn bị & Tiện ích tại Sảnh Trung Tâm
setblock -3 111 76 ender_chest
setblock 3 111 76 ender_chest
setblock -3 111 77 crafting_table
setblock 3 111 77 anvil

# NPC Thợ Săn Boss tại Sảnh Trung Tâm (0.5 111 79.5)
kill @e[type=villager,tag=boss_hunter_npc]
kill @e[type=interaction,tag=boss_hunter_interact]
kill @e[type=armor_stand,tag=boss_hunter_hologram]
summon villager 0.5 111 79.5 {Tags:["boss_hunter_npc"],CustomName:'{"text":"⚔ THỢ SĂN BOSS ⚔","color":"red","bold":true}',CustomNameVisible:1b,NoAI:1b,Invulnerable:1b,PersistenceRequired:1b,Silent:1b,VillagerData:{profession:weaponsmith,type:taiga,level:5},Rotation:[180f,0f]}
summon interaction 0.5 111 79.5 {Tags:["boss_hunter_interact"],width:1.2f,height:1.9f,response:1b}
summon armor_stand 0.5 113.2 79.5 {Tags:["boss_hunter_hologram"],Invisible:1b,Marker:1b,NoGravity:1b,CustomNameVisible:1b,CustomName:'{"text":"[ CLICK ĐỂ CHỌN BOSS ]","color":"yellow","bold":true}'}

# Biển chỉ dẫn 4 phân khu tại Sảnh Trung Tâm
setblock -1 112 75 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:['{"text":"🏛 ĐẠI ĐIỆN BOSS 🏛","color":"gold","bold":true}','{"text":"Sảnh Trung Tâm","color":"yellow"}','{"text":"Gõ /warp boss","color":"green"}','{"text":"Chọn phân khu dưới!","color":"aqua"}']}}
setblock 1 112 75 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:['{"text":"[ HƯỚNG DẪN ]","color":"dark_red","bold":true}','{"text":"⬅ Tây: Boss 1 & Boss 4","color":"green"}','{"text":"➡ Đông: Boss 2","color":"red"}','{"text":"⬇ Nam: Boss 3 Tuần","color":"gold"}']}}

# Biển cổng Tây (Sang Boss 1 & Boss 4)
setblock -13 112 78 oak_wall_sign[facing=east]{front_text:{has_glowing_text:1b,messages:['{"text":"⬅ ĐỘNG NHỆN","color":"green","bold":true}','{"text":"Boss Cấp 1 (150 HP)","color":"yellow"}','{"text":"Rơi Mảnh Quặng Cổ Đại","color":"aqua"}','{"text":"Đi thẳng rẽ Tây","color":"white"}']}}
setblock -13 112 84 oak_wall_sign[facing=east]{front_text:{has_glowing_text:1b,messages:['{"text":"⬅ THÁNH ĐỊA HƯ KHÔNG","color":"dark_purple","bold":true}','{"text":"World Boss (1200 HP)","color":"light_purple"}','{"text":"Rơi 100% Lõi Hư Không","color":"gold"}','{"text":"Cầu tím góc Tây Nam","color":"white"}']}}

# Biển cổng Đông (Sang Boss 2)
setblock 13 112 78 oak_wall_sign[facing=west]{front_text:{has_glowing_text:1b,messages:['{"text":"VỰC ĐAO PHỦ ➡","color":"red","bold":true}','{"text":"Boss Cấp 2 (300 HP)","color":"gold"}','{"text":"Rơi Tinh Thể Cổ Đại","color":"light_purple"}','{"text":"Đi thẳng sang Đông","color":"white"}']}}

# Biển cổng Nam (Sang Boss 3)
setblock -1 112 87 oak_wall_sign[facing=south]{front_text:{has_glowing_text:1b,messages:['{"text":"⬇ THÀNH TRÌ CHÚA TỂ","color":"dark_red","bold":true}','{"text":"Boss Tuần (600 HP)","color":"gold"}','{"text":"Rơi TRÁI TIM CỦA QUỶ","color":"red","bold":true}','{"text":"Đại lộ đá đen phía Nam","color":"white"}']}}

# Biển báo trạng thái Boss động tại Sảnh Trung Tâm (Khởi tạo: SẴN SÀNG)
setblock -14 113 78 polished_blackstone_brick_wall
setblock -13 113 78 oak_wall_sign[facing=east]{front_text:{has_glowing_text:1b,messages:['{"text":"[ BOSS 1 ]","color":"gold","bold":true}','{"text":"Động Nữ Hoàng Nhện","color":"yellow"}','{"text":"Trạng thái:","color":"gray"}','{"text":"● SẴN SÀNG","color":"green","bold":true}']}}

setblock 14 113 78 polished_blackstone_brick_wall
setblock 13 113 78 oak_wall_sign[facing=west]{front_text:{has_glowing_text:1b,messages:['{"text":"[ BOSS 2 ]","color":"gold","bold":true}','{"text":"Vực Đao Phủ Địa Ngục","color":"yellow"}','{"text":"Trạng thái:","color":"gray"}','{"text":"● SẴN SÀNG","color":"green","bold":true}']}}

setblock -1 113 88 polished_blackstone_brick_wall
setblock -1 113 87 oak_wall_sign[facing=south]{front_text:{has_glowing_text:1b,messages:['{"text":"[ BOSS 3 ]","color":"gold","bold":true}','{"text":"Thành Trì Chúa Tể","color":"yellow"}','{"text":"Trạng thái:","color":"gray"}','{"text":"● SẴN SÀNG","color":"green","bold":true}']}}

setblock -14 113 84 polished_blackstone_brick_wall
setblock -13 113 84 oak_wall_sign[facing=east]{front_text:{has_glowing_text:1b,messages:['{"text":"[ BOSS 4 ]","color":"gold","bold":true}','{"text":"Thánh Địa Hư Không","color":"yellow"}','{"text":"Trạng thái:","color":"gray"}','{"text":"● SẴN SÀNG","color":"green","bold":true}']}}

# ------------------------------------------------------------------------------
# 4. HÀNH LANG CẦU NỐI ĐẾN 4 ĐẠI ĐIỆN
# ------------------------------------------------------------------------------
# Cầu Tây nối sang Đại Điện 1 (Động Nhện X: -40..-18, Z: 75..95)
fill -18 110 79 -14 110 83 mossy_stone_bricks
fill -22 110 80 -18 110 84 mossy_stone_bricks
fill -22 111 80 -22 111 84 cobblestone_wall
fill -18 111 80 -18 111 84 cobblestone_wall
setblock -22 112 82 soul_lantern
setblock -18 112 82 soul_lantern

# Cầu Đông nối sang Đại Điện 2 (Vực Lửa X: 18..40, Z: 75..95)
fill 14 110 79 18 110 83 nether_bricks
fill 18 110 80 22 110 84 nether_bricks
fill 22 111 80 22 111 84 nether_brick_fence
fill 18 111 80 18 111 84 nether_brick_fence
setblock 22 112 82 soul_lantern
setblock 18 112 82 soul_lantern

# Đại lộ Nam nối sang Đại Điện 3 (Thành Trì Chúa Tể X: -18..18, Z: 100..130)
fill -3 110 88 3 110 100 polished_blackstone_bricks
fill -1 110 88 1 110 100 red_nether_bricks
fill -3 111 88 -3 111 99 deepslate_tile_wall
fill 3 111 88 3 111 99 deepslate_tile_wall
setblock -3 112 92 soul_lantern
setblock 3 112 92 soul_lantern
setblock -3 112 96 soul_lantern
setblock 3 112 96 soul_lantern

# Cầu tím nối sang Đại Điện 4 (Thánh Địa Hư Không X: -45..-25, Z: 100..130)
# Nối từ nhánh Tây (X=-22, Z=85) sang Đại Điện 4 (X=-25, Z=100)
fill -27 110 83 -22 110 87 purpur_block
fill -27 110 87 -25 110 100 purpur_block
fill -28 111 87 -28 111 100 purpur_pillar
fill -24 111 87 -24 111 100 purpur_pillar
setblock -28 112 94 end_rod
setblock -24 112 94 end_rod

# ------------------------------------------------------------------------------
# 5. ĐẠI ĐIỆN 1: ĐỘNG NỮ HOÀNG NHỆN (SPIDER QUEEN'S LAIR - BOSS CẤP 1, 150 HP)
# Tọa độ: Z: 75..95, X: -40..-18, Y=110 (Tâm X=-29, Z=85)
# ------------------------------------------------------------------------------
# Đế nổi ngầm
fill -39 105 76 -19 107 94 deepslate
fill -39 108 76 -19 109 94 mossy_cobblestone
# Mặt sàn hang đá ẩm ướt
fill -40 110 75 -18 110 95 mossy_stone_bricks
fill -38 110 77 -20 110 93 mossy_cobblestone
fill -34 110 81 -24 110 89 dripstone_block
fill -31 110 83 -27 110 87 mud_bricks
# Tơ nhện chằng chịt các góc
fill -39 111 76 -37 113 78 cobweb
fill -21 111 76 -19 113 78 cobweb
fill -39 111 92 -37 113 94 cobweb
fill -21 111 92 -19 113 94 cobweb
fill -33 111 83 -33 112 87 cobweb
fill -25 111 83 -25 112 87 cobweb
# Tường rào hang đá
fill -40 111 75 -18 114 75 mossy_stone_brick_wall
fill -40 111 95 -18 114 95 mossy_stone_brick_wall
fill -40 111 75 -40 114 95 mossy_stone_brick_wall
fill -18 111 75 -18 114 95 mossy_stone_brick_wall
# Mở cổng vào phía Đông cầu: X=-18, Z: 74..76
fill -18 111 74 -18 113 76 air
# Cột đá măng nhũ & Đèn phát sáng tự nhiên
setblock -38 114 77 shroomlight
setblock -20 114 77 shroomlight
setblock -38 114 93 shroomlight
setblock -20 114 93 shroomlight
setblock -38 113 77 pointed_dripstone[thickness=tip,vertical_direction=down]
setblock -20 113 77 pointed_dripstone[thickness=tip,vertical_direction=down]
# Bệ triệu hồi Boss 1 ở tâm (X=-29, Z=85)
setblock -29 110 85 sculk_catalyst
setblock -29 111 85 cobweb
# Trụ kích hoạt triệu hồi Boss 1 (Tại lối vào X=-20, Y=111, Z=77)
setblock -20 111 77 command_block{Command:"function skyblock:summon_boss_1"}
setblock -20 112 77 mossy_stone_bricks
setblock -20 113 77 stone_button[face=floor,facing=north]
setblock -21 112 76 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:['{"text":"🕷 ĐỘNG NỮ HOÀNG 🕷","color":"green","bold":true}','{"text":"Boss Cấp 1 (150 HP)","color":"gold"}','{"text":"Bấm nút trên trụ đá","color":"yellow"}','{"text":"để TRIỆU HỒI BOSS!","color":"red"}']}}
setblock -19 112 76 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:['{"text":"[ PHẦN THƯỞNG ]","color":"gold","bold":true}','{"text":"Mảnh Quặng Cổ Đại","color":"aqua","bold":true}','{"text":"16 Ngọc Lục Bảo","color":"green"}','{"text":"Tơ Nhện & 500 Exp","color":"yellow"}']}}

# Bệ dịch chuyển rút lui khẩn cấp (Return Teleport Pad về Sảnh Trung Tâm)
setblock -19 109 74 command_block{Command:"teleport @p 0.5 111.0 58.0 0.0 0.0"}
setblock -19 110 74 polished_blackstone_pressure_plate
setblock -19 111 73 mossy_stone_brick_wall
setblock -19 112 73 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:['{"text":"[ VỀ SẢNH ]","color":"gold","bold":true}','{"text":"Cổng Rút Lui","color":"yellow"}','{"text":"Bước lên đĩa để","color":"aqua"}','{"text":"VỀ SẢNH TRUNG TÂM","color":"green","bold":true}']}}

# ------------------------------------------------------------------------------
# 6. ĐẠI ĐIỆN 2: VỰC LỬA ĐAO PHỦ ĐỊA NGỤC (EXECUTIONER'S PIT - BOSS CẤP 2, 300 HP)
# Tọa độ: Z: 75..95, X: 18..40, Y=110 (Tâm X=29, Z=85)
# ------------------------------------------------------------------------------
# Đế nổi ngầm
fill 19 105 76 39 107 94 blackstone
fill 19 108 76 39 109 94 nether_bricks
# Mặt sàn dung nham rực lửa
fill 18 110 75 40 110 95 nether_bricks
fill 20 110 77 38 110 93 red_nether_bricks
fill 24 110 81 34 110 89 magma_block
fill 27 110 84 31 110 86 crying_obsidian
# 4 Trụ lửa góc bốc khói ngùn ngụt
fill 20 111 77 20 114 77 gilded_blackstone
setblock 20 115 77 campfire
fill 38 111 77 38 114 77 gilded_blackstone
setblock 38 115 77 campfire
fill 20 111 93 20 114 93 gilded_blackstone
setblock 20 115 93 campfire
fill 38 111 93 38 114 93 gilded_blackstone
setblock 38 115 93 campfire
# Tường rào gạch địa ngục
fill 18 111 75 40 114 75 nether_brick_wall
fill 18 111 95 40 114 95 nether_brick_wall
fill 18 111 75 18 114 95 nether_brick_wall
fill 40 111 75 40 114 95 nether_brick_wall
# Mở cổng vào phía Tây cầu: X=18, Z: 74..76
fill 18 111 74 18 113 76 air
# Bệ triệu hồi Boss 2 ở tâm (X=29, Z=85)
setblock 29 110 85 respawn_anchor[charges=4]
setblock 29 111 85 soul_fire
# Trụ kích hoạt triệu hồi Boss 2 (Tại lối vào X=20, Y=111, Z=77)
setblock 20 111 77 command_block{Command:"function skyblock:summon_boss_2"}
setblock 20 112 77 nether_bricks
setblock 20 113 77 stone_button[face=floor,facing=north]
setblock 19 112 76 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:['{"text":"🔥 VỰC ĐAO PHỦ 🔥","color":"red","bold":true}','{"text":"Boss Cấp 2 (300 HP)","color":"gold"}','{"text":"Bấm nút trên trụ đá","color":"yellow"}','{"text":"để TRIỆU HỒI BOSS!","color":"red"}']}}
setblock 21 112 76 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:['{"text":"[ PHẦN THƯỞNG ]","color":"gold","bold":true}','{"text":"Tinh Thể Cổ Đại","color":"light_purple","bold":true}','{"text":"Rìu Netherite Lửa","color":"red"}','{"text":"8 Khối Vàng & Exp","color":"yellow"}']}}

# Bệ dịch chuyển rút lui khẩn cấp (Return Teleport Pad về Sảnh Trung Tâm)
setblock 18 109 74 command_block{Command:"teleport @p 0.5 111.0 58.0 0.0 0.0"}
setblock 18 110 74 polished_blackstone_pressure_plate
setblock 18 111 73 nether_brick_wall
setblock 18 112 73 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:['{"text":"[ VỀ SẢNH ]","color":"gold","bold":true}','{"text":"Cổng Rút Lui","color":"yellow"}','{"text":"Bước lên đĩa để","color":"aqua"}','{"text":"VỀ SẢNH TRUNG TÂM","color":"green","bold":true}']}}

# ------------------------------------------------------------------------------
# 7. ĐẠI ĐIỆN 3: THÀNH TRÌ CHÚA TỂ BÓNG TỐI (DARKNESS CITADEL - BOSS TUẦN CẤP 3, 600 HP)
# Tọa độ: Z: 100..130, X: -18..18, Y=110 (Tâm X=0, Z=115, quy mô 37x31 block)
# ------------------------------------------------------------------------------
# Đế thành trì ngầm
fill -17 105 101 17 107 129 polished_blackstone
fill -17 108 101 17 109 129 polished_blackstone_bricks
# Mặt sân thành trì nguy nga
fill -18 110 100 18 110 130 polished_blackstone_bricks
fill -15 110 103 15 110 127 red_nether_bricks
fill -10 110 108 10 110 122 magma_block
fill -5 110 111 5 110 119 crying_obsidian
# 4 Trụ Lửa Thần Thoại tại 4 góc thành trì
fill -16 111 102 -16 116 102 gilded_blackstone
setblock -16 117 102 soul_campfire
fill 16 111 102 16 116 102 gilded_blackstone
setblock 16 117 102 soul_campfire
fill -16 111 128 -16 116 128 gilded_blackstone
setblock -16 117 128 soul_campfire
fill 16 111 128 16 116 128 gilded_blackstone
setblock 16 117 128 soul_campfire

# Tường thành và lỗ châu mai
fill -18 111 100 18 114 100 deepslate_tile_wall
fill -18 111 130 18 114 130 deepslate_tile_wall
fill -18 111 100 -18 114 130 deepslate_tile_wall
fill 18 111 100 18 114 130 deepslate_tile_wall
# Cổng vòm vào thành trì phía Bắc (X: -2..2, Z=100)
fill -2 111 100 2 114 100 air
fill -3 111 100 -3 115 100 gilded_blackstone
fill 3 111 100 3 115 100 gilded_blackstone
fill -2 115 100 2 115 100 polished_blackstone_brick_stairs[facing=south]

# Bệ Tế Lễ Triệu Hồi (Altar) ở tâm (X=0, Z=115)
fill -2 110 113 2 110 117 crying_obsidian
setblock 0 110 115 respawn_anchor[charges=4]
setblock 0 111 115 soul_fire

# Trụ kích hoạt triệu hồi Boss 3 (Tại lối vào X=0, Y=111, Z=103)
setblock 0 111 103 command_block{Command:"function skyblock:summon_boss_3"}
setblock 0 112 103 gilded_blackstone
setblock 0 113 103 stone_button[face=floor,facing=north]
setblock -1 112 102 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:['{"text":"🏰 CHÚA TỂ BÓNG TỐI 🏰","color":"dark_red","bold":true}','{"text":"Boss Tuần (600 HP)","color":"gold"}','{"text":"Bấm nút trên trụ đá","color":"yellow"}','{"text":"để TRIỆU HỒI BOSS!","color":"red"}']}}
setblock 1 112 102 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:['{"text":"[ RƠI 100% CỰC HIẾM ]","color":"gold","bold":true}','{"text":"☠ Trái Tim Của Quỷ ☠","color":"dark_red","bold":true}','{"text":"Đột phá bắt buộc Tier 10!","color":"red"}','{"text":"Kiếm Netherite + Totem","color":"green"}']}}

# Bệ dịch chuyển rút lui khẩn cấp (Return Teleport Pad về Sảnh Trung Tâm)
setblock 2 109 101 command_block{Command:"teleport @p 0.5 111.0 58.0 0.0 0.0"}
setblock 2 110 101 polished_blackstone_pressure_plate
setblock 2 111 100 deepslate_tile_wall
setblock 2 112 100 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:['{"text":"[ VỀ SẢNH ]","color":"gold","bold":true}','{"text":"Cổng Rút Lui","color":"yellow"}','{"text":"Bước lên đĩa để","color":"aqua"}','{"text":"VỀ SẢNH TRUNG TÂM","color":"green","bold":true}']}}

# ------------------------------------------------------------------------------
# 8. ĐẠI ĐIỆN 4: THÁNH ĐỊA HƯ KHÔNG (VOID SANCTUARY - WORLD BOSS CẤP 4, 1200 HP)
# Tọa độ: Z: 100..130, X: -45..-25, Y=110 (Tâm X=-35, Z=115)
# ------------------------------------------------------------------------------
# Đế nổi tím ma thuật
fill -44 105 101 -26 107 129 end_stone_bricks
fill -44 108 101 -26 109 129 purpur_block
# Mặt sàn giác ngọc hư không
fill -45 110 100 -25 110 130 purpur_block
fill -43 110 102 -27 110 128 end_stone_bricks
fill -40 110 106 -30 110 124 crying_obsidian
fill -38 110 109 -32 110 121 amethyst_block
# 4 Trụ Năng Lượng Hư Không tại 4 góc
fill -43 111 102 -43 117 102 purpur_pillar
setblock -43 118 102 end_rod
fill -27 111 102 -27 117 102 purpur_pillar
setblock -27 118 102 end_rod
fill -43 111 128 -43 117 128 purpur_pillar
setblock -43 118 128 end_rod
fill -27 111 128 -27 117 128 purpur_pillar
setblock -27 118 128 end_rod

# Tường bao kính tím ma thuật & cột trụ
fill -45 111 100 -25 114 100 tinted_glass
fill -45 111 130 -25 114 130 tinted_glass
fill -45 111 100 -45 114 130 tinted_glass
fill -25 111 100 -25 114 130 tinted_glass
# Cột gia cố góc tường
fill -45 111 100 -45 115 100 purpur_pillar
fill -25 111 100 -25 115 100 purpur_pillar
fill -45 111 130 -45 115 130 purpur_pillar
fill -25 111 130 -25 115 130 purpur_pillar
# Mở cổng vào phía Đông cầu: X=-25, Z: 101..104
fill -25 111 101 -25 113 104 air

# Bệ triệu hồi World Boss ở tâm (X=-35, Z=115)
fill -37 110 113 -33 110 117 crying_obsidian
setblock -35 110 115 amethyst_block
setblock -35 111 115 end_rod

# Trụ kích hoạt triệu hồi Boss 4 (Tại lối vào X=-27, Y=111, Z=103)
setblock -27 111 103 command_block{Command:"function skyblock:summon_boss_4"}
setblock -27 112 103 purpur_pillar
setblock -27 113 103 stone_button[face=floor,facing=north]
setblock -28 112 102 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:['{"text":"🌀 THÁNH ĐỊA HƯ KHÔNG 🌀","color":"dark_purple","bold":true}','{"text":"World Boss (1200 HP)","color":"light_purple"}','{"text":"Bấm nút trên trụ đá","color":"yellow"}','{"text":"để TRIỆU HỒI BOSS!","color":"red"}']}}
setblock -26 112 102 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:['{"text":"[ RƠI 100% TỐI THƯỢNG ]","color":"gold","bold":true}','{"text":"🌀 Lõi Hư Không 🌀","color":"dark_purple","bold":true}','{"text":"Đột phá bắt buộc Tier 13!","color":"light_purple"}','{"text":"Sao Nether & 64 Ngọc","color":"aqua"}']}}

# Bệ dịch chuyển rút lui khẩn cấp (Return Teleport Pad về Sảnh Trung Tâm)
setblock -26 109 101 command_block{Command:"teleport @p 0.5 111.0 58.0 0.0 0.0"}
setblock -26 110 101 polished_blackstone_pressure_plate
setblock -26 111 100 purpur_pillar
setblock -26 112 100 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:['{"text":"[ VỀ SẢNH ]","color":"gold","bold":true}','{"text":"Cổng Rút Lui","color":"yellow"}','{"text":"Bước lên đĩa để","color":"aqua"}','{"text":"VỀ SẢNH TRUNG TÂM","color":"green","bold":true}']}}

# Thông báo hoàn tất xây dựng 4 đại điện
tellraw @a [{"text":"[Skyblock] ","color":"gold","bold":true},{"text":"Đã khởi tạo thành công ĐẠI ĐIỆN 4 PHÂN KHU BOSS BIỆT LẬP (Z: 50..130, X: -45..45)!","color":"green"}]
