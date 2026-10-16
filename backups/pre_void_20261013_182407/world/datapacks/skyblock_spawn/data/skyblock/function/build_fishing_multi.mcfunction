# ==============================================================================
# HỆ THỐNG MỞ RỘNG 3 BẾN CẢNG CÂU CÁ ĐỘC LẬP TẠI PHÍA BẮC (NORTH FISHING PORTS)
# Toạ độ tổng thể: X: -35..35, Z: -125..-50, Y=110
# Bến 1: Hồ Nước Ngọt Thư Giãn (X: -30..-8, Z: -90..-60)
# Bến 2: Đầm Lầy Nhiệt Đới (X: 8..30, Z: -90..-60)
# Bến 3: Vực Biển Huyền Bí (X: -18..18, Z: -125..-98)
# Sảnh trung tâm & Chòi Lão Ngư Tri Kỷ ở giữa
# ==============================================================================

# 1. DỌN DẸP KHÔNG GIAN CŨ & MỚI (Chia nhỏ dưới 32,768 blocks mỗi lệnh)
fill -38 98 -128 -1 116 -89 air
fill -38 98 -88 -1 116 -48 air
fill -38 117 -128 -1 135 -89 air
fill -38 117 -88 -1 135 -48 air
fill 0 98 -128 38 116 -89 air
fill 0 98 -88 38 116 -48 air
fill 0 117 -128 38 135 -89 air
fill 0 117 -88 38 135 -48 air

# Xóa NPC & Entity cũ trong khu vực câu cá
kill @e[type=villager,x=-38,y=100,z=-128,dx=76,dy=35,dz=80]
kill @e[type=armor_stand,tag=fishing_statue]
kill @e[type=text_display,tag=fishing_display]

# ------------------------------------------------------------------------------
# 2. CẦU NỐI TỪ CỔNG BẮC SPAWN ĐẾN SẢNH CÂU CÁ (Z: -18..-56, Y: 120..110)
# ------------------------------------------------------------------------------
fill -2 120 -18 2 120 -20 stone_brick_stairs[facing=south]
fill -2 119 -21 2 119 -23 stone_brick_stairs[facing=south]
fill -2 118 -24 2 118 -26 stone_brick_stairs[facing=south]
fill -2 117 -27 2 117 -29 stone_brick_stairs[facing=south]
fill -2 116 -30 2 116 -32 stone_brick_stairs[facing=south]
fill -2 115 -33 2 115 -35 stone_brick_stairs[facing=south]
fill -2 114 -36 2 114 -38 stone_brick_stairs[facing=south]
fill -2 113 -39 2 113 -41 stone_brick_stairs[facing=south]
fill -2 112 -42 2 112 -44 stone_brick_stairs[facing=south]
fill -2 111 -45 2 111 -47 stone_brick_stairs[facing=south]
fill -2 110 -48 2 110 -56 stone_bricks

# Khối đỡ đáy cầu
fill -2 118 -21 2 118 -23 stone_bricks
fill -2 117 -24 2 117 -26 stone_bricks
fill -2 116 -27 2 116 -29 stone_bricks
fill -2 115 -30 2 115 -32 stone_bricks
fill -2 114 -33 2 114 -35 stone_bricks
fill -2 113 -36 2 113 -38 stone_bricks
fill -2 112 -39 2 112 -41 stone_bricks
fill -2 111 -42 2 111 -44 stone_bricks
fill -2 110 -45 2 110 -47 stone_bricks

# Lan can cầu & Đèn lồng chiếu sáng
fill -3 121 -18 -3 121 -20 stone_brick_wall
fill 3 121 -18 3 121 -20 stone_brick_wall
fill -3 120 -21 -3 120 -23 stone_brick_wall
fill 3 120 -21 3 120 -23 stone_brick_wall
fill -3 119 -24 -3 119 -26 stone_brick_wall
fill 3 119 -24 3 119 -26 stone_brick_wall
fill -3 118 -27 -3 118 -29 stone_brick_wall
fill 3 118 -27 3 118 -29 stone_brick_wall
fill -3 117 -30 -3 117 -32 stone_brick_wall
fill 3 117 -30 3 117 -32 stone_brick_wall
fill -3 116 -33 -3 116 -35 stone_brick_wall
fill 3 116 -33 3 116 -35 stone_brick_wall
fill -3 115 -36 -3 115 -38 stone_brick_wall
fill 3 115 -36 3 115 -38 stone_brick_wall
fill -3 114 -39 -3 114 -41 stone_brick_wall
fill 3 114 -39 3 114 -41 stone_brick_wall
fill -3 113 -42 -3 113 -44 stone_brick_wall
fill 3 113 -42 3 113 -44 stone_brick_wall
fill -3 112 -45 -3 112 -47 stone_brick_wall
fill 3 112 -45 3 112 -47 stone_brick_wall
fill -3 111 -48 -3 111 -56 oak_fence
fill 3 111 -48 3 111 -56 oak_fence

setblock -3 121 -26 lantern
setblock 3 121 -26 lantern
setblock -3 117 -35 lantern
setblock 3 117 -35 lantern
setblock -3 113 -44 lantern
setblock 3 113 -44 lantern
setblock -3 112 -52 lantern
setblock 3 112 -52 lantern

# ------------------------------------------------------------------------------
# 3. THÂN ĐẢO NỔI PHÍA BẮC (FLOATING ISLAND FOUNDATION - Y: 100..109)
# ------------------------------------------------------------------------------
fill -34 100 -124 34 100 -54 cobbled_deepslate
fill -35 102 -125 35 103 -53 tuff
fill -36 104 -126 36 105 -52 dirt
fill -35 106 -125 35 107 -53 stone
fill -34 108 -124 34 109 -54 moss_block

# ------------------------------------------------------------------------------
# 4. SẢNH CÂU CÁ TRUNG TÂM & CHÒI LÃO NGƯ TRI KỶ (X: -7..7, Z: -95..-56, Y=110)
# ------------------------------------------------------------------------------
# Sàn sảnh câu cá trung tâm
fill -7 110 -76 7 110 -56 spruce_planks
fill -2 110 -76 2 110 -56 stripped_oak_wood
fill -6 110 -95 6 110 -77 spruce_planks
fill -1 110 -95 1 110 -77 stripped_oak_wood

# Lan can an toàn sảnh trung tâm
fill -7 111 -58 -7 111 -76 spruce_fence
fill 7 111 -58 7 111 -76 spruce_fence
fill -6 111 -77 -6 111 -95 spruce_fence
fill 6 111 -77 6 111 -95 spruce_fence

# Đèn lồng dọc sảnh trung tâm
setblock -7 112 -60 lantern
setblock 7 112 -60 lantern
setblock -7 112 -70 lantern
setblock 7 112 -70 lantern
setblock -6 112 -80 lantern
setblock 6 112 -80 lantern
setblock -6 112 -90 lantern
setblock 6 112 -90 lantern

# Cổng vòm chào mừng tại đầu sảnh (Z=-57..-58)
setblock -3 111 -57 stripped_oak_log
setblock -3 112 -57 stripped_oak_log
setblock -3 113 -57 stripped_oak_log
setblock 3 111 -57 stripped_oak_log
setblock 3 112 -57 stripped_oak_log
setblock 3 113 -57 stripped_oak_log
fill -2 114 -57 2 114 -57 oak_slab
setblock 0 113 -57 lantern[hanging=true]

# Biển neon rực rỡ tại lối vào sảnh câu cá
setblock -2 112 -57 oak_wall_sign[facing=south]{front_text:{has_glowing_text:1b,messages:['{"text":"🎣 ĐẠI BẾN CÂU CÁ 🎣","color":"aqua","bold":true}','{"text":"3 Bến câu cá độc lập","color":"green"}','{"text":"Gặp Lão Ngư đổi cá","color":"yellow"}','{"text":"Lệnh: /warp cauca","color":"gold"}']}}
setblock 2 112 -57 oak_wall_sign[facing=south]{front_text:{has_glowing_text:1b,messages:['{"text":"✦ CHỈ DẪN BẾN ✦","color":"gold","bold":true}','{"text":"◀ Bến 1: Hồ Nước Ngọt","color":"green"}','{"text":"Bến 2: Đầm Lầy ▶","color":"red"}','{"text":"▲ Bến 3: Vực Biển Sâu","color":"blue"}']}}

# Chòi Lão Ngư Tri Kỷ ở trung tâm (X: -4..4, Z: -75..-67, Y=110..115)
# 4 Trụ chòi bằng gỗ sồi bóc vỏ
fill -4 111 -74 -4 113 -74 stripped_oak_log
fill 4 111 -74 4 113 -74 stripped_oak_log
fill -4 111 -67 -4 113 -67 stripped_oak_log
fill 4 111 -67 4 113 -67 stripped_oak_log

# Mái chòi dốc bằng gỗ vân sam (Spruce Roof)
fill -5 114 -75 5 114 -66 spruce_stairs[facing=south]
fill -5 115 -73 5 115 -68 spruce_stairs[facing=south]
fill -5 116 -71 5 116 -70 spruce_slab

# Nội thất chòi: Lò hun khói, Bàn chế tạo, Thùng đựng cá, Đe sửa cần câu
setblock -3 111 -73 smoker[facing=south]
setblock -2 111 -73 barrel[facing=south]
setblock 2 111 -73 barrel[facing=south]
setblock 3 111 -73 crafting_table
setblock 3 111 -68 anvil[facing=west]
setblock 0 114 -70 lantern[hanging=true]

# Thùng rác câu cá (Cauldron Lava tiêu hủy an toàn)
setblock -3 111 -68 cauldron
setblock -3 111 -68 lava_cauldron
setblock -3 112 -68 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:['{"text":"🗑 THÙNG RÁC CÂU 🗑","color":"red","bold":true}','{"text":"Vứt rác & cá vụn","color":"yellow"}','{"text":"Lava tiêu hủy an toàn","color":"gold"}','{"text":"Giữ sạch môi trường!","color":"green"}']}}

# Biển bảng mẹo câu cá bên chòi Lão Ngư
setblock -1 112 -73 oak_wall_sign[facing=south]{front_text:{has_glowing_text:1b,messages:['{"text":"[ LÃO NGƯ TRI KỶ ]","color":"aqua","bold":true}','{"text":"Thu mua mọi loại cá","color":"white"}','{"text":"Bán Cần Câu Thần Kỳ","color":"gold"}','{"text":"Xô Nước Đại Dương!","color":"green"}']}}
setblock 1 112 -73 oak_wall_sign[facing=south]{front_text:{has_glowing_text:1b,messages:['{"text":"[ MẸO CÂU KHO BÁU ]","color":"gold","bold":true}','{"text":"Bến 1: Hồi, Tuyết","color":"green"}','{"text":"Bến 2: Nhiệt Đới, Nóc","color":"red"}','{"text":"Bến 3: Vỏ Ốc & Tim Biển","color":"blue"}']}}

# Triệu hồi NPC Lão Ngư Tri Kỷ tại giữa chòi (X=0, Y=111, Z=-70)
summon villager 0 111 -70 {CustomName:'{"text":"Lão Ngư Tri Kỷ","color":"aqua","bold":true}',CustomNameVisible:1b,NoAI:1b,Invulnerable:1b,PersistenceRequired:1b,Silent:1b,VillagerData:{profession:fisherman,type:taiga,level:5},Offers:{Recipes:[{maxUses:999999,buy:{id:"minecraft:cod",count:16},sell:{id:"minecraft:emerald",count:2}},{maxUses:999999,buy:{id:"minecraft:salmon",count:16},sell:{id:"minecraft:emerald",count:2}},{maxUses:999999,buy:{id:"minecraft:tropical_fish",count:8},sell:{id:"minecraft:emerald",count:3}},{maxUses:999999,buy:{id:"minecraft:pufferfish",count:4},sell:{id:"minecraft:emerald",count:3}},{maxUses:999999,buy:{id:"minecraft:emerald",count:3},sell:{id:"minecraft:fishing_rod",count:1}},{maxUses:999999,buy:{id:"minecraft:emerald",count:8},sell:{id:"minecraft:water_bucket",count:1,components:{"minecraft:custom_name":'{"text":"🌊 Xô Nước Phước Lành Đại Dương 🌊","color":"aqua","bold":true}',"minecraft:lore":['{"text":"Nguồn nước tinh khiết của Thần Biển ban tặng!","color":"blue","italic":true}','{"text":"✦ Dùng để tạo nguồn nước vô hạn & tưới tiêu!","color":"green"}']}}},{maxUses:999999,buy:{id:"minecraft:emerald",count:15},sell:{id:"minecraft:fishing_rod",count:1,components:{"minecraft:enchantments":{levels:{"minecraft:luck_of_the_sea":3,"minecraft:lure":3,"minecraft:unbreaking":3}},"minecraft:custom_name":'{"text":"Cần Câu Thần Kỳ","color":"gold","bold":true}'}}},{maxUses:999999,buy:{id:"minecraft:emerald",count:20},sell:{id:"minecraft:nautilus_shell",count:1}},{maxUses:999999,buy:{id:"minecraft:emerald",count:50},sell:{id:"minecraft:heart_of_the_sea",count:1}}]}}

# ------------------------------------------------------------------------------
# CẦU GỖ NỐI TỎA RA 3 HƯỚNG TỪ SẢNH TRUNG TÂM
# ------------------------------------------------------------------------------
# Cầu Tây nối sang Bến 1 (X: -8..-5, Z: -73..-69, Y=110)
fill -8 110 -73 -5 110 -69 oak_planks
fill -8 111 -73 -5 111 -73 oak_fence
fill -8 111 -69 -5 111 -69 oak_fence
setblock -7 112 -73 lantern
setblock -7 112 -69 lantern

# Cầu Đông nối sang Bến 2 (X: 5..8, Z: -73..-69, Y=110)
fill 5 110 -73 8 110 -69 mangrove_planks
fill 5 111 -73 8 111 -73 mangrove_fence
fill 5 111 -69 8 111 -69 mangrove_fence
setblock 7 112 -73 lantern
setblock 7 112 -69 lantern

# Cầu Bắc vươn dài nối sang Bến 3 (X: -2..2, Z: -96..-98, Y=110)
fill -2 110 -98 2 110 -96 dark_oak_planks
fill -3 111 -98 -3 111 -96 dark_oak_fence
fill 3 111 -98 3 111 -96 dark_oak_fence
setblock -3 112 -97 lantern
setblock 3 112 -97 lantern

# ==============================================================================
# 5. BẾN 1: HỒ NƯỚC NGỌT THƯ GIÃN (X: -30..-8, Z: -90..-60, Y=110)
# ==============================================================================
# Bờ hồ & Thảm cỏ xanh mát (Y=110)
fill -30 110 -90 -8 110 -60 grass_block
fill -28 110 -88 -10 110 -62 air

# Lòng hồ nước ngọt sâu Y=106..109
fill -28 106 -88 -10 106 -62 sand
fill -25 106 -85 -13 106 -65 clay
fill -28 107 -88 -10 109 -62 water

# Đèn biển âm dưới đáy hồ tạo luồng sáng êm dịu
setblock -24 106 -82 sea_lantern
setblock -14 106 -82 sea_lantern
setblock -19 106 -75 sea_lantern
setblock -24 106 -68 sea_lantern
setblock -14 106 -68 sea_lantern

# Hoa sen & Hoa súng (Lily pads) trên mặt hồ
setblock -22 110 -80 lily_pad
setblock -16 110 -83 lily_pad
setblock -12 110 -76 lily_pad
setblock -20 110 -72 lily_pad
setblock -15 110 -67 lily_pad
setblock -25 110 -74 lily_pad
setblock -26 110 -66 lily_pad

# Bến tàu gỗ sồi & Sàn câu cá (Oak Pier - X: -16..-8, Z: -75..-65, Y=110)
fill -16 110 -73 -8 110 -68 oak_planks
fill -16 111 -73 -8 111 -73 oak_fence
fill -16 111 -68 -8 111 -68 oak_fence
# Điểm ngắm cảnh & Ghế câu cá ven hồ
setblock -15 111 -72 oak_stairs[facing=south]
setblock -14 111 -72 oak_stairs[facing=south]
setblock -15 111 -69 oak_stairs[facing=north]
setblock -14 111 -69 oak_stairs[facing=north]
setblock -16 111 -70 oak_slab[type=top]
setblock -16 112 -70 flower_pot
setblock -16 112 -73 lantern
setblock -16 112 -68 lantern

# Thùng chứa cá hồi & cá tuyết trên bến
setblock -10 111 -72 barrel[facing=up]
setblock -9 111 -72 barrel[facing=up]

# Tượng Ngư Dân Nước Ngọt & Biển phát sáng
summon armor_stand -8.5 111 -66.5 {Tags:["fishing_statue"],CustomName:'{"text":"🎣 BẾN 1: HỒ NƯỚC NGỌT 🎣","color":"green","bold":true}',CustomNameVisible:1b,NoGravity:1b,ShowArms:1b,ArmorItems:[{id:"minecraft:leather_boots",count:1},{id:"minecraft:leather_leggings",count:1},{id:"minecraft:leather_chestplate",count:1},{id:"minecraft:leather_helmet",count:1,components:{"minecraft:dyed_color":16776960}}],HandItems:[{id:"minecraft:fishing_rod",count:1},{id:"minecraft:salmon",count:1}]}
setblock -8 112 -67 oak_wall_sign[facing=east]{front_text:{has_glowing_text:1b,messages:['{"text":"[ BẾN 1: NƯỚC NGỌT ]","color":"green","bold":true}','{"text":"Hồ súng tĩnh lặng","color":"white"}','{"text":"Câu Cá Hồi & Tuyết","color":"yellow"}','{"text":"Đổi xu Lão Ngư!","color":"gold"}']}}

# ==============================================================================
# 6. BẾN 2: ĐẦM LẦY NHIỆT ĐỚI (X: 8..30, Z: -90..-60, Y=110)
# ==============================================================================
# Bờ đầm lầy bùn & Rễ đước (Y=110)
fill 8 110 -90 30 110 -60 muddy_mangrove_roots
fill 10 110 -88 28 110 -62 air

# Lòng đầm lầy sâu Y=106..109
fill 10 106 -88 28 106 -62 mud
fill 13 106 -85 25 106 -65 sand
fill 10 107 -88 28 109 -62 water

# Rạn san hô rực rỡ & Đèn biển đáy đầm lầy
setblock 14 106 -82 tube_coral_block
setblock 15 106 -82 sea_lantern
setblock 24 106 -82 fire_coral_block
setblock 19 106 -75 brain_coral_block
setblock 20 106 -75 sea_lantern
setblock 14 106 -68 horn_coral_block
setblock 24 106 -68 bubble_coral_block
setblock 23 106 -68 sea_lantern

# Rễ cây đước & Cây đước vươn nhánh trên mặt hồ (Mangrove canopy)
fill 25 110 -85 27 110 -83 mangrove_roots
fill 26 111 -84 26 114 -84 mangrove_wood
fill 25 113 -85 27 115 -83 mangrove_leaves
fill 25 110 -67 27 110 -65 mangrove_roots
fill 26 111 -66 26 114 -66 mangrove_wood
fill 25 113 -67 27 115 -65 mangrove_leaves

# Bến tàu gỗ đước đỏ rực (Mangrove Pier - X: 8..16, Z: -75..-65, Y=110)
fill 8 110 -73 16 110 -68 mangrove_planks
fill 8 111 -73 16 111 -73 mangrove_fence
fill 8 111 -68 16 111 -68 mangrove_fence
setblock 16 112 -73 lantern
setblock 16 112 -68 lantern

# Điểm ngồi câu cá nhiệt đới
setblock 15 111 -72 mangrove_stairs[facing=south]
setblock 14 111 -72 mangrove_stairs[facing=south]
setblock 15 111 -69 mangrove_stairs[facing=north]
setblock 14 111 -69 mangrove_stairs[facing=north]
setblock 16 111 -70 mangrove_slab[type=top]
setblock 16 112 -70 flower_pot

# Thùng chứa cá nhiệt đới & cá nóc
setblock 9 111 -72 barrel[facing=up]
setblock 10 111 -72 barrel[facing=up]

# Tượng Ngư Dân Nhiệt Đới & Biển phát sáng
summon armor_stand 8.5 111 -66.5 {Tags:["fishing_statue"],CustomName:'{"text":"🐠 BẾN 2: ĐẦM LẦY NHIỆT ĐỚI 🐠","color":"red","bold":true}',CustomNameVisible:1b,NoGravity:1b,ShowArms:1b,ArmorItems:[{id:"minecraft:leather_boots",count:1,components:{"minecraft:dyed_color":11546150}},{id:"minecraft:leather_leggings",count:1,components:{"minecraft:dyed_color":11546150}},{id:"minecraft:leather_chestplate",count:1,components:{"minecraft:dyed_color":11546150}},{id:"minecraft:turtle_helmet",count:1}],HandItems:[{id:"minecraft:fishing_rod",count:1},{id:"minecraft:tropical_fish",count:1}]}
setblock 8 112 -67 oak_wall_sign[facing=west]{front_text:{has_glowing_text:1b,messages:['{"text":"[ BẾN 2: NHIỆT ĐỚI ]","color":"red","bold":true}','{"text":"San Hô & Rừng Đước","color":"gold"}','{"text":"Câu Cá Nhiệt Đới, Nóc","color":"yellow"}','{"text":"Giá đổi cực cao!","color":"green"}']}}

# ==============================================================================
# 7. BẾN 3: VỰC BIỂN HUYỀN BÍ (X: -18..18, Z: -125..-98, Y=110)
# ==============================================================================
# Bờ vực biển thạch anh & đá tối (Y=110)
fill -18 110 -125 18 110 -98 polished_blackstone_bricks
fill -16 110 -123 16 110 -100 air

# Lòng vực biển sâu thẳm xuống tận Y=102!
fill -16 102 -123 16 102 -100 dark_prismarine
fill -14 102 -121 14 102 -102 prismarine_bricks
fill -16 103 -123 16 109 -100 water

# Lưới đèn biển phát sáng lung linh đáy vực sâu
setblock -12 102 -118 sea_lantern
setblock -6 102 -118 sea_lantern
setblock 0 102 -118 sea_lantern
setblock 6 102 -118 sea_lantern
setblock 12 102 -118 sea_lantern

setblock -12 102 -112 sea_lantern
setblock -6 102 -112 sea_lantern
setblock 0 102 -112 sea_lantern
setblock 6 102 -112 sea_lantern
setblock 12 102 -112 sea_lantern

setblock -12 102 -106 sea_lantern
setblock -6 102 -106 sea_lantern
setblock 0 102 -106 sea_lantern
setblock 6 102 -106 sea_lantern
setblock 12 102 -106 sea_lantern

# Trụ Thạch Anh Nguy Nga vươn cao từ đáy vực lên Y=114
# Cặp trụ góc Bắc
fill -16 102 -123 -16 114 -123 quartz_pillar
setblock -16 115 -123 sea_lantern
fill 16 102 -123 16 114 -123 quartz_pillar
setblock 16 115 -123 sea_lantern

# Cặp trụ góc Nam
fill -16 102 -100 -16 114 -100 quartz_pillar
setblock -16 115 -100 sea_lantern
fill 16 102 -100 16 114 -100 quartz_pillar
setblock 16 115 -100 sea_lantern

# Cặp trụ giữa Đông & Tây
fill -16 102 -112 -16 114 -112 quartz_pillar
setblock -16 115 -112 sea_lantern
fill 16 102 -112 16 114 -112 quartz_pillar
setblock 16 115 -112 sea_lantern

# Cặp trụ viền Bắc
fill -8 102 -123 -8 114 -123 quartz_pillar
setblock -8 115 -123 sea_lantern
fill 8 102 -123 8 114 -123 quartz_pillar
setblock 8 115 -123 sea_lantern

# Bến tàu Vực Biển nhô ra giữa vực sâu (Abyssal Pier: X: -4..4, Z: -120..-99, Y=110)
fill -4 110 -120 4 110 -99 dark_oak_planks
fill -1 110 -120 1 110 -100 cyan_stained_glass
fill -4 111 -120 -4 111 -100 dark_oak_fence
fill 4 111 -120 4 111 -100 dark_oak_fence
fill -4 111 -120 4 111 -120 dark_oak_fence

# Đèn biển & Trụ bến Vực Biển
setblock -4 112 -120 lantern
setblock 4 112 -120 lantern
setblock -4 112 -110 lantern
setblock 4 112 -110 lantern
setblock -4 112 -100 lantern
setblock 4 112 -100 lantern

# Bàn ghế ngắm vực sâu & câu kho báu
setblock -3 111 -118 dark_oak_stairs[facing=east]
setblock 3 111 -118 dark_oak_stairs[facing=west]
setblock -3 111 -115 dark_oak_stairs[facing=east]
setblock 3 111 -115 dark_oak_stairs[facing=west]
setblock 0 110 -120 chiseled_quartz_block
setblock 0 111 -120 end_rod

# Tượng Thần Biển Vực Sâu & Biển phát sáng
summon armor_stand 0.5 111 -101.5 {Tags:["fishing_statue"],CustomName:'{"text":"🌊 BẾN 3: VỰC BIỂN HUYỀN BÍ 🌊","color":"blue","bold":true}',CustomNameVisible:1b,NoGravity:1b,ShowArms:1b,ArmorItems:[{id:"minecraft:diamond_boots",count:1},{id:"minecraft:diamond_leggings",count:1},{id:"minecraft:diamond_chestplate",count:1},{id:"minecraft:turtle_helmet",count:1}],HandItems:[{id:"minecraft:trident",count:1},{id:"minecraft:nautilus_shell",count:1}]}
setblock 0 112 -99 oak_wall_sign[facing=south]{front_text:{has_glowing_text:1b,messages:['{"text":"[ BẾN 3: VỰC BIỂN ]","color":"blue","bold":true}','{"text":"Đáy vực ngàn năm sáng","color":"aqua"}','{"text":"Câu Vỏ Ốc & Tim Biển","color":"yellow"}','{"text":"Kho báu Conduit cực hiếm!","color":"gold"}']}}
