# ==============================================================================
# HỆ THỐNG MỞ RỘNG 5 KHU MOB FARM ĐỘC LẬP TẠI PHÍA TÂY (WEST MOB FARM COMPLEX)
# Toạ độ tổng thể: X: -120..-50, Z: -35..35, Y=110
# Sảnh chính trung tâm: X=-60, Z=-30..30
# 5 Phòng biệt lập: Zombie, Skeleton, Nhện, Blaze, Slime
# ==============================================================================

# 1. DỌN DẸP KHÔNG GIAN CŨ & MỚI (Chia nhỏ dưới 32,768 blocks mỗi lệnh)
fill -122 100 -36 -86 117 0 air
fill -122 100 1 -86 117 36 air
fill -122 118 -36 -86 135 0 air
fill -122 118 1 -86 135 36 air
fill -85 100 -36 -48 117 0 air
fill -85 100 1 -48 117 36 air
fill -85 118 -36 -48 135 0 air
fill -85 118 1 -48 135 36 air

# Xóa các entity cũ trong khu vực farm
kill @e[type=armor_stand,tag=mob_farm_statue]
kill @e[type=text_display,tag=mob_farm_display]
kill @e[type=zombie,x=-122,y=105,z=-36,dx=74,dy=30,dz=72]
kill @e[type=skeleton,x=-122,y=105,z=-36,dx=74,dy=30,dz=72]
kill @e[type=spider,x=-122,y=105,z=-36,dx=74,dy=30,dz=72]
kill @e[type=cave_spider,x=-122,y=105,z=-36,dx=74,dy=30,dz=72]
kill @e[type=blaze,x=-122,y=105,z=-36,dx=74,dy=30,dz=72]
kill @e[type=slime,x=-122,y=105,z=-36,dx=74,dy=30,dz=72]

# ------------------------------------------------------------------------------
# 2. CẦU NỐI TỪ CỔNG TÂY SPAWN ĐẾN ĐẠI SẢNH FARM (X: -30..-58, Y: 120..110)
# ------------------------------------------------------------------------------
# Sàn bậc thang hạ từ Y=120 xuống Y=110 (Rộng Z=-2..2)
fill -31 120 -2 -31 120 2 stone_brick_stairs[facing=east]
fill -32 119 -2 -33 119 2 stone_bricks
fill -34 119 -2 -34 119 2 stone_brick_stairs[facing=east]
fill -35 118 -2 -36 118 2 stone_bricks
fill -37 118 -2 -37 118 2 stone_brick_stairs[facing=east]
fill -38 117 -2 -39 117 2 stone_bricks
fill -40 117 -2 -40 117 2 stone_brick_stairs[facing=east]
fill -41 116 -2 -42 116 2 stone_bricks
fill -43 116 -2 -43 116 2 stone_brick_stairs[facing=east]
fill -44 115 -2 -45 115 2 stone_bricks
fill -46 115 -2 -46 115 2 stone_brick_stairs[facing=east]
fill -47 114 -2 -48 114 2 stone_bricks
fill -49 114 -2 -49 114 2 stone_brick_stairs[facing=east]
fill -50 113 -2 -51 113 2 stone_bricks
fill -52 113 -2 -52 113 2 stone_brick_stairs[facing=east]
fill -53 112 -2 -54 112 2 stone_bricks
fill -55 112 -2 -55 112 2 stone_brick_stairs[facing=east]
fill -56 111 -2 -57 111 2 stone_bricks
fill -58 111 -2 -58 111 2 stone_brick_stairs[facing=east]
fill -58 110 -2 -58 110 2 stone_bricks

# Khối đỡ đáy cầu
fill -33 118 -2 -33 118 2 stone_bricks
fill -36 117 -2 -36 117 2 stone_bricks
fill -39 116 -2 -39 116 2 stone_bricks
fill -42 115 -2 -42 115 2 stone_bricks
fill -45 114 -2 -45 114 2 stone_bricks
fill -48 113 -2 -48 113 2 stone_bricks
fill -51 112 -2 -51 112 2 stone_bricks
fill -54 111 -2 -54 111 2 stone_bricks
fill -57 110 -2 -57 110 2 stone_bricks

# Lan can an toàn & Đèn lồng cầu nối
fill -31 121 -3 -31 121 -3 stone_brick_wall
fill -31 121 3 -31 121 3 stone_brick_wall
fill -35 120 -3 -35 120 -3 stone_brick_wall
fill -35 120 3 -35 120 3 stone_brick_wall
fill -39 119 -3 -39 119 -3 stone_brick_wall
fill -39 119 3 -39 119 3 stone_brick_wall
fill -43 118 -3 -43 118 -3 stone_brick_wall
fill -43 118 3 -43 118 3 stone_brick_wall
fill -47 117 -3 -47 117 -3 stone_brick_wall
fill -47 117 3 -47 117 3 stone_brick_wall
fill -51 116 -3 -51 116 -3 stone_brick_wall
fill -51 116 3 -51 116 3 stone_brick_wall
fill -55 115 -3 -55 115 -3 stone_brick_wall
fill -55 115 3 -55 115 3 stone_brick_wall
fill -58 113 -3 -58 113 -3 stone_brick_wall
fill -58 113 3 -58 113 3 stone_brick_wall

fill -34 120 -3 -32 120 -3 cobblestone_wall
fill -34 120 3 -32 120 3 cobblestone_wall
fill -38 119 -3 -36 119 -3 cobblestone_wall
fill -38 119 3 -36 119 3 cobblestone_wall
fill -42 118 -3 -40 118 -3 cobblestone_wall
fill -42 118 3 -40 118 3 cobblestone_wall
fill -46 117 -3 -44 117 -3 cobblestone_wall
fill -46 117 3 -44 117 3 cobblestone_wall
fill -50 116 -3 -48 116 -3 cobblestone_wall
fill -50 116 3 -48 116 3 cobblestone_wall
fill -54 115 -3 -52 115 -3 cobblestone_wall
fill -54 115 3 -52 115 3 cobblestone_wall
fill -57 113 -3 -56 113 -3 cobblestone_wall
fill -57 113 3 -56 113 3 cobblestone_wall

setblock -35 121 -3 lantern
setblock -35 121 3 lantern
setblock -43 119 -3 lantern
setblock -43 119 3 lantern
setblock -51 117 -3 lantern
setblock -51 117 3 lantern

# ------------------------------------------------------------------------------
# 3. THÂN ĐẢO NỔI PHÍA TÂY (FLOATING ISLAND UNDERBODY - Y: 102..109)
# ------------------------------------------------------------------------------
fill -118 102 -32 -56 102 32 cobbled_deepslate
fill -119 104 -33 -55 104 33 tuff
fill -120 106 -34 -54 107 34 cobblestone
fill -121 108 -35 -53 109 35 mossy_cobblestone

# ------------------------------------------------------------------------------
# 4. HÀNH LANG SẢNH CHÍNH TRUNG TÂM (X: -62..-58, Z: -30..30, Y=110)
# ------------------------------------------------------------------------------
# Sàn sảnh chính rộng 5 block (X: -62..-58)
fill -62 110 -30 -62 110 30 polished_blackstone_bricks
fill -58 110 -30 -58 110 30 polished_blackstone_bricks
fill -61 110 -30 -59 110 30 polished_andesite
fill -60 110 -30 -60 110 30 chiseled_stone_bricks

# Thảm trải đỏ hoàng gia dọc lối đi sảnh chính
fill -60 111 -28 -60 111 28 red_carpet

# Trần sảnh chính (Y=115)
fill -62 115 -30 -58 115 30 deepslate_bricks
fill -62 116 -30 -58 116 30 stone_brick_slab

# Đèn biển âm trần sảnh chính
setblock -60 115 -28 sea_lantern
setblock -60 115 -21 sea_lantern
setblock -60 115 -14 sea_lantern
setblock -60 115 -7 sea_lantern
setblock -60 115 0 sea_lantern
setblock -60 115 7 sea_lantern
setblock -60 115 14 sea_lantern
setblock -60 115 21 sea_lantern
setblock -60 115 28 sea_lantern

# Tường phía Đông của sảnh chính (X=-57)
fill -57 111 -30 -57 114 30 stone_brick_wall
fill -57 111 -30 -57 114 -30 chiseled_stone_bricks
fill -57 111 30 -57 114 30 chiseled_stone_bricks
# Cửa vào từ cầu Đông (Z=-2..2)
fill -57 111 -2 -57 114 2 air
fill -57 114 -2 -57 114 2 smooth_stone_slab

# Tường đầu hồi Bắc & Nam của sảnh chính
fill -62 111 -30 -58 114 -30 stone_bricks
fill -62 111 30 -58 114 30 stone_bricks

# Tiện ích sảnh chính: Rương chứa đồ & Thùng gỗ
setblock -58 111 -26 chest[facing=west]
setblock -58 111 -25 chest[facing=west]
setblock -58 111 -24 barrel[facing=west]
setblock -58 111 -14 chest[facing=west]
setblock -58 111 -13 chest[facing=west]
setblock -58 111 13 chest[facing=west]
setblock -58 111 14 chest[facing=west]
setblock -58 111 24 barrel[facing=west]
setblock -58 111 25 chest[facing=west]
setblock -58 111 26 chest[facing=west]

# Bàn rèn, Đe, Bàn chế tạo & Rương Ender ở trung tâm (Z=-2..2)
setblock -58 111 -2 anvil[facing=west]
setblock -58 111 -1 grindstone[facing=west]
setblock -58 111 1 crafting_table
setblock -58 111 2 ender_chest[facing=west]

# Thùng rác sảnh chính (Cauldron Lava tiêu hủy đồ thừa an toàn)
setblock -58 111 -10 cauldron
setblock -58 111 -10 lava_cauldron
setblock -58 112 -10 oak_wall_sign[facing=west]{front_text:{has_glowing_text:1b,messages:['{"text":"🗑 THÙNG RÁC 🗑","color":"red","bold":true}','{"text":"Ném đồ thừa vào","color":"yellow"}','{"text":"Lava tiêu hủy vĩnh viễn","color":"gold"}','{"text":"Không thể lấy lại!","color":"dark_red"}']}}

setblock -58 111 10 cauldron
setblock -58 111 10 lava_cauldron
setblock -58 112 10 oak_wall_sign[facing=west]{front_text:{has_glowing_text:1b,messages:['{"text":"🗑 THÙNG RÁC 🗑","color":"red","bold":true}','{"text":"Ném đồ thừa vào","color":"yellow"}','{"text":"Lava tiêu hủy vĩnh viễn","color":"gold"}','{"text":"Không thể lấy lại!","color":"dark_red"}']}}

# Bảng chỉ dẫn neon rực rỡ tại sảnh chính
setblock -58 112 -3 oak_wall_sign[facing=west]{front_text:{has_glowing_text:1b,messages:['{"text":"★ ĐẠI SẢNH FARM ★","color":"gold","bold":true}','{"text":"5 Khu Quái Biệt Lập","color":"yellow"}','{"text":"Mỗi Quái 1 Phòng Riêng","color":"green"}','{"text":"Lệnh: /warp farm","color":"aqua"}']}}
setblock -58 112 3 oak_wall_sign[facing=west]{front_text:{has_glowing_text:1b,messages:['{"text":"✦ QUY TẮC FARM ✦","color":"aqua","bold":true}','{"text":"Đứng tại khe chém chân","color":"yellow"}','{"text":"Dùng Kiếm Nhặt Đồ III","color":"green"}','{"text":"Không AFK chiếm chỗ","color":"red"}']}}

setblock -60 114 -4 oak_wall_sign[facing=south]{front_text:{has_glowing_text:1b,messages:['{"text":"▲ PHÍA BẮC SẢNH ▲","color":"gold","bold":true}','{"text":"Phòng 1: Hầm Zombie","color":"green"}','{"text":"Phòng 2: Hầm Xương","color":"white"}','{"text":"Nhánh Tây: Tháp Blaze","color":"red"}']}}
setblock -60 114 4 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:['{"text":"▼ PHÍA NAM SẢNH ▼","color":"gold","bold":true}','{"text":"Phòng 3: Động Nhện Độc","color":"dark_red"}','{"text":"Nhánh Tây: Hồ Slime","color":"green"}','{"text":"Về /spawn đổi ngọc","color":"aqua"}']}}

# ------------------------------------------------------------------------------
# 5. ĐƯỜNG DẪN TÂY KẾT NỐI ĐẾN PHÒNG 4 (BLAZE) VÀ PHÒNG 5 (SLIME)
# ------------------------------------------------------------------------------
# Nhánh Bắc dẫn vào Tháp Blaze (Z: -9..-6, X: -63..-95, Y=110)
fill -95 110 -9 -63 110 -6 polished_blackstone_bricks
fill -95 111 -9 -63 111 -6 red_carpet
fill -95 115 -9 -63 115 -6 nether_bricks
fill -95 111 -10 -63 114 -10 red_nether_bricks
fill -95 111 -5 -63 114 -5 red_nether_bricks
# Đèn dẫn lối nhánh Blaze
setblock -70 114 -7 soul_lantern[hanging=true]
setblock -80 114 -7 soul_lantern[hanging=true]
setblock -90 114 -7 soul_lantern[hanging=true]
# Cổng rẽ từ sảnh chính vào nhánh Blaze
fill -62 111 -8 -62 114 -7 air

# Nhánh Nam dẫn vào Hồ Slime (Z: 11..14, X: -63..-95, Y=110)
fill -95 110 11 -63 110 14 polished_andesite
fill -95 111 11 -63 111 14 lime_carpet
fill -95 115 11 -63 115 14 moss_block
fill -95 111 10 -63 114 10 mossy_stone_bricks
fill -95 111 15 -63 114 15 mossy_stone_bricks
# Đèn dẫn lối nhánh Slime
setblock -70 114 12 sea_lantern
setblock -80 114 12 sea_lantern
setblock -90 114 12 sea_lantern
# Cổng rẽ từ sảnh chính vào nhánh Slime
fill -62 111 12 -62 114 13 air

# Hành lang liên phòng nối Phòng 4 & Phòng 5 tại X: -97..-95, Z: -5..10
fill -97 110 -5 -95 110 10 polished_blackstone_bricks
fill -97 111 -5 -95 111 10 yellow_carpet
fill -97 115 -5 -95 115 10 deepslate_bricks
fill -94 111 -5 -94 114 10 deepslate_bricks
setblock -96 114 0 sea_lantern
setblock -96 114 5 sea_lantern

# ==============================================================================
# 6. PHÒNG 1: HẦM MỘ ZOMBIE (X: -85..-65, Z: -25..-10, Y=110)
# ==============================================================================
# Sàn & Tường Hầm Mộ Zombie
fill -85 110 -25 -65 110 -10 mossy_stone_bricks
fill -83 110 -23 -69 110 -12 moss_block
fill -85 111 -25 -65 115 -25 mossy_cobblestone
fill -85 111 -10 -65 115 -10 mossy_cobblestone
fill -85 111 -25 -85 115 -10 mossy_cobblestone
# Trần tối giữ tỷ lệ spawn 100%
fill -85 115 -25 -68 115 -10 deepslate_bricks

# Hành lang an toàn chém chân Zombie (X: -67..-65, Z: -24..-11)
fill -67 110 -24 -65 110 -11 polished_andesite
fill -67 115 -24 -65 115 -11 polished_andesite
# Thanh chắn chém chân: nửa phiến đá dưới + hàng rào sắt chống cắn
fill -68 111 -24 -68 111 -11 spruce_slab[type=bottom]
fill -68 112 -24 -68 114 -11 iron_bars
fill -68 115 -24 -68 115 -11 deepslate_bricks
# Đèn hành lang chém chân
setblock -66 114 -22 lantern[hanging=true]
setblock -66 114 -13 lantern[hanging=true]

# Cửa thông từ sảnh chính vào hành lang Zombie
fill -64 110 -19 -62 110 -16 polished_andesite
fill -64 111 -19 -62 114 -16 air
fill -64 115 -19 -62 115 -16 deepslate_bricks

# 2 Spawner Zombie (Y=112)
setblock -79 112 -18 spawner
data modify block -79 112 -18 SpawnData set value {entity:{id:"minecraft:zombie"}}
data modify block -79 112 -18 MinSpawnDelay set value 100s
data modify block -79 112 -18 MaxSpawnDelay set value 200s
data modify block -79 112 -18 SpawnCount set value 4s
data modify block -79 112 -18 RequiredPlayerRange set value 32s

setblock -73 112 -18 spawner
data modify block -73 112 -18 SpawnData set value {entity:{id:"minecraft:zombie"}}
data modify block -73 112 -18 MinSpawnDelay set value 100s
data modify block -73 112 -18 MaxSpawnDelay set value 200s
data modify block -73 112 -18 SpawnCount set value 4s
data modify block -73 112 -18 RequiredPlayerRange set value 32s

# Tượng Zombie & Biển chữ neon phát sáng trước phòng Zombie
summon armor_stand -61.5 111 -20.5 {Tags:["mob_farm_statue"],CustomName:'{"text":"🧟 HẦM MỘ ZOMBIE 🧟","color":"green","bold":true}',CustomNameVisible:1b,NoGravity:1b,ShowArms:1b,ArmorItems:[{id:"minecraft:leather_boots",count:1,components:{"minecraft:dyed_color":3368494}},{id:"minecraft:leather_leggings",count:1,components:{"minecraft:dyed_color":3368494}},{id:"minecraft:leather_chestplate",count:1,components:{"minecraft:dyed_color":1973019}},{id:"minecraft:zombie_head",count:1}],HandItems:[{id:"minecraft:iron_sword",count:1},{}]}
setblock -62 112 -20 oak_wall_sign[facing=east]{front_text:{has_glowing_text:1b,messages:['{"text":"[ HẦM MỘ ZOMBIE ]","color":"green","bold":true}','{"text":"2 Spawner Zombie","color":"yellow"}','{"text":"Hành lang chém chân","color":"aqua"}','{"text":"Rơi: Sắt, Thịt thối","color":"gold"}']}}

# ==============================================================================
# 7. PHÒNG 2: HẦM XƯƠNG CỔ ĐẠI (X: -85..-65, Z: -5..10, Y=110)
# ==============================================================================
# Sàn & Tường Hầm Xương Cổ Đại
fill -85 110 -5 -65 110 10 cracked_stone_bricks
fill -83 110 -3 -69 110 8 cracked_deepslate_bricks
fill -85 111 -5 -65 115 -5 cracked_deepslate_bricks
fill -85 111 10 -65 115 10 cracked_deepslate_bricks
fill -85 111 -5 -85 115 10 cracked_deepslate_bricks
# Trần tối giữ tỷ lệ spawn 100%
fill -85 115 -5 -68 115 10 deepslate_bricks

# Hành lang an toàn chém chân có THANH CHẮN KÍNH TRÁNH TÊN (X: -67..-65, Z: -4..9)
fill -67 110 -4 -65 110 9 smooth_stone
fill -67 115 -4 -65 115 9 polished_deepslate
# Thanh chắn kính tránh tên: đáy slab chém chân + kính màu sẫm chống mũi tên bay ra
fill -68 111 -4 -68 111 9 deepslate_brick_slab[type=bottom]
fill -68 112 -4 -68 114 9 tinted_glass
fill -68 115 -4 -68 115 9 cracked_deepslate_bricks
# Đèn hành lang Skeleton
setblock -66 114 -2 lantern[hanging=true]
setblock -66 114 7 lantern[hanging=true]

# Cửa thông từ sảnh chính vào hành lang Skeleton
fill -64 110 1 -62 110 4 smooth_stone
fill -64 111 1 -62 114 4 air
fill -64 115 1 -62 115 4 deepslate_bricks

# 2 Spawner Skeleton (Y=112)
setblock -79 112 2 spawner
data modify block -79 112 2 SpawnData set value {entity:{id:"minecraft:skeleton"}}
data modify block -79 112 2 MinSpawnDelay set value 100s
data modify block -79 112 2 MaxSpawnDelay set value 200s
data modify block -79 112 2 SpawnCount set value 4s
data modify block -79 112 2 RequiredPlayerRange set value 32s

setblock -73 112 2 spawner
data modify block -73 112 2 SpawnData set value {entity:{id:"minecraft:skeleton"}}
data modify block -73 112 2 MinSpawnDelay set value 100s
data modify block -73 112 2 MaxSpawnDelay set value 200s
data modify block -73 112 2 SpawnCount set value 4s
data modify block -73 112 2 RequiredPlayerRange set value 32s

# Tượng Skeleton & Biển chữ neon phát sáng trước phòng Skeleton
summon armor_stand -61.5 111 -2.5 {Tags:["mob_farm_statue"],CustomName:'{"text":"💀 HẦM XƯƠNG CỔ ĐẠI 💀","color":"white","bold":true}',CustomNameVisible:1b,NoGravity:1b,ShowArms:1b,ArmorItems:[{id:"minecraft:chainmail_boots",count:1},{id:"minecraft:chainmail_leggings",count:1},{id:"minecraft:chainmail_chestplate",count:1},{id:"minecraft:skeleton_skull",count:1}],HandItems:[{id:"minecraft:bow",count:1},{}]}
setblock -62 112 -2 oak_wall_sign[facing=east]{front_text:{has_glowing_text:1b,messages:['{"text":"[ HẦM XƯƠNG CỔ ]","color":"white","bold":true}','{"text":"2 Spawner Skeleton","color":"yellow"}','{"text":"Kính tinted chắn tên","color":"aqua"}','{"text":"Rơi: Xương, Cung, Tên","color":"gold"}']}}

# ==============================================================================
# 8. PHÒNG 3: ĐỘNG NHỆN ĐỘC (X: -85..-65, Z: 15..30, Y=110)
# ==============================================================================
# Sàn & Tường Động Nhện Độc
fill -85 110 15 -65 110 30 deepslate_bricks
fill -83 110 17 -69 110 28 crying_obsidian
fill -85 111 15 -65 115 15 deepslate_tile_wall
fill -85 111 30 -65 115 30 deepslate_tile_wall
fill -85 111 15 -85 115 30 deepslate_tile_wall
# Trần tối giữ tỷ lệ spawn 100%
fill -85 115 15 -68 115 30 deepslate_bricks

# Giăng tơ nhện chằng chịt
setblock -82 111 18 cobweb
setblock -82 114 18 cobweb
setblock -80 111 26 cobweb
setblock -76 114 27 cobweb
setblock -74 111 18 cobweb
setblock -71 114 20 cobweb
setblock -70 111 25 cobweb
setblock -83 113 22 cobweb

# Hành lang an toàn chém chân Nhện (X: -67..-65, Z: 16..29)
fill -67 110 16 -65 110 29 polished_andesite
fill -67 115 16 -65 115 29 polished_andesite
# Thanh chắn kín khe tránh nhện hang chui qua: slab + iron bars + tinted glass
fill -68 111 16 -68 111 29 spruce_slab[type=bottom]
fill -68 112 16 -68 112 29 iron_bars
fill -68 113 16 -68 114 29 tinted_glass
fill -68 115 16 -68 115 29 deepslate_bricks
# Đèn hành lang Nhện
setblock -66 114 18 lantern[hanging=true]
setblock -66 114 27 lantern[hanging=true]

# Cửa thông từ sảnh chính vào hành lang Nhện
fill -64 110 21 -62 110 24 polished_andesite
fill -64 111 21 -62 114 24 air
fill -64 115 21 -62 115 24 deepslate_bricks

# 2 Spawner: Nhện thường & Nhện hang (Cave Spider) (Y=112)
setblock -79 112 22 spawner
data modify block -79 112 22 SpawnData set value {entity:{id:"minecraft:spider"}}
data modify block -79 112 22 MinSpawnDelay set value 100s
data modify block -79 112 22 MaxSpawnDelay set value 200s
data modify block -79 112 22 SpawnCount set value 4s
data modify block -79 112 22 RequiredPlayerRange set value 32s

setblock -73 112 22 spawner
data modify block -73 112 22 SpawnData set value {entity:{id:"minecraft:cave_spider"}}
data modify block -73 112 22 MinSpawnDelay set value 100s
data modify block -73 112 22 MaxSpawnDelay set value 200s
data modify block -73 112 22 SpawnCount set value 4s
data modify block -73 112 22 RequiredPlayerRange set value 32s

# Tượng Nhện & Biển chữ neon phát sáng trước phòng Nhện
summon armor_stand -61.5 111 18.5 {Tags:["mob_farm_statue"],CustomName:'{"text":"🕷 ĐỘNG NHỆN ĐỘC 🕷","color":"dark_red","bold":true}',CustomNameVisible:1b,NoGravity:1b,ShowArms:1b,ArmorItems:[{id:"minecraft:leather_boots",count:1,components:{"minecraft:dyed_color":1908001}},{id:"minecraft:leather_leggings",count:1,components:{"minecraft:dyed_color":1908001}},{id:"minecraft:leather_chestplate",count:1,components:{"minecraft:dyed_color":1908001}},{id:"minecraft:wither_skeleton_skull",count:1}],HandItems:[{id:"minecraft:spider_eye",count:1},{id:"minecraft:string",count:1}]}
setblock -62 112 18 oak_wall_sign[facing=east]{front_text:{has_glowing_text:1b,messages:['{"text":"[ ĐỘNG NHỆN ĐỘC ]","color":"dark_red","bold":true}','{"text":"Nhện Thường & Nhện Hang","color":"red"}','{"text":"Giăng tơ & Chặn độc","color":"aqua"}','{"text":"Rơi: Tơ nhện, Mắt nhện","color":"gold"}']}}

# ==============================================================================
# 9. PHÒNG 4: THÁP LỬA BLAZE (X: -115..-95, Z: -20..-5, Y=110)
# ==============================================================================
# Sàn & Tường Tháp Lửa Blaze
fill -115 110 -20 -95 110 -5 red_nether_bricks
fill -113 110 -18 -99 110 -7 magma_block
fill -115 111 -20 -95 115 -20 red_nether_bricks
fill -115 111 -5 -95 115 -5 red_nether_bricks
fill -115 111 -20 -115 115 -5 red_nether_bricks
# Trần tháp lửa Y=115
fill -115 115 -20 -98 115 -5 nether_bricks

# Cột nham thạch & suối lửa trang trí trong buồng spawn
setblock -113 113 -13 lava
setblock -113 112 -13 lava
setblock -113 111 -13 lava
setblock -106 113 -18 lava
setblock -106 112 -18 lava
setblock -106 111 -18 lava

# Hành lang an toàn chém quái Blaze (X: -97..-95, Z: -19..-6)
fill -97 110 -19 -95 110 -6 polished_blackstone_bricks
fill -97 115 -19 -95 115 -6 polished_blackstone_bricks
# Rào chắn chống cầu lửa Blaze: nether slab chân + tinted glass chắn tia lửa
fill -98 111 -19 -98 111 -6 nether_brick_slab[type=bottom]
fill -98 112 -19 -98 114 -6 tinted_glass
fill -98 115 -19 -98 115 -6 red_nether_bricks
# Đèn linh hồn hành lang Blaze
setblock -96 114 -16 soul_lantern[hanging=true]
setblock -96 114 -9 soul_lantern[hanging=true]

# Cửa vào từ nhánh hành lang Tây
fill -95 111 -8 -95 114 -7 air

# 2 Spawner Blaze (Y=112)
setblock -109 112 -13 spawner
data modify block -109 112 -13 SpawnData set value {entity:{id:"minecraft:blaze"}}
data modify block -109 112 -13 MinSpawnDelay set value 100s
data modify block -109 112 -13 MaxSpawnDelay set value 220s
data modify block -109 112 -13 SpawnCount set value 3s
data modify block -109 112 -13 RequiredPlayerRange set value 32s

setblock -103 112 -13 spawner
data modify block -103 112 -13 SpawnData set value {entity:{id:"minecraft:blaze"}}
data modify block -103 112 -13 MinSpawnDelay set value 100s
data modify block -103 112 -13 MaxSpawnDelay set value 220s
data modify block -103 112 -13 SpawnCount set value 3s
data modify block -103 112 -13 RequiredPlayerRange set value 32s

# Tượng Blaze & Biển chữ neon phát sáng trước phòng Blaze
summon armor_stand -94.5 111 -6.5 {Tags:["mob_farm_statue"],CustomName:'{"text":"🔥 THÁP LỬA BLAZE 🔥","color":"gold","bold":true}',CustomNameVisible:1b,NoGravity:1b,ShowArms:1b,ArmorItems:[{id:"minecraft:golden_boots",count:1},{id:"minecraft:golden_leggings",count:1},{id:"minecraft:golden_chestplate",count:1},{id:"minecraft:golden_helmet",count:1}],HandItems:[{id:"minecraft:blaze_rod",count:1},{}]}
setblock -95 112 -6 oak_wall_sign[facing=east]{front_text:{has_glowing_text:1b,messages:['{"text":"[ THÁP LỬA BLAZE ]","color":"gold","bold":true}','{"text":"2 Spawner Quỷ Lửa","color":"yellow"}','{"text":"Chắn cầu lửa an toàn","color":"red"}','{"text":"Rơi: Que lửa Blaze","color":"gold"}']}}

# ==============================================================================
# 10. PHÒNG 5: HỒ CHẤT NHỜN SLIME (X: -115..-95, Z: 5..20, Y=110)
# ==============================================================================
# Sàn Khối Slime xanh biếc đàn hồi & Đèn biển ngầm
fill -115 110 5 -95 110 20 lime_concrete
fill -113 110 7 -99 110 18 slime_block
fill -115 111 5 -95 115 5 moss_block
fill -115 111 20 -95 115 20 moss_block
fill -115 111 5 -115 115 20 moss_block
# Trần hồ slime Y=115
fill -115 115 5 -98 115 20 deepslate_bricks

# Khối đèn ngầm dưới kính xanh lá tạo hiệu ứng phát quang huyền ảo
setblock -109 110 10 sea_lantern
setblock -109 111 10 lime_stained_glass
setblock -103 110 10 sea_lantern
setblock -103 111 10 lime_stained_glass
setblock -109 110 16 sea_lantern
setblock -109 111 16 lime_stained_glass
setblock -103 110 16 sea_lantern
setblock -103 111 16 lime_stained_glass

# Hành lang an toàn chém Slime (X: -97..-95, Z: 6..19)
fill -97 110 6 -95 110 19 polished_andesite
fill -97 111 6 -95 111 19 lime_carpet
fill -97 115 6 -95 115 19 polished_andesite
# Thanh chắn chém Slime: phiến rêu + hàng rào sắt & kính
fill -98 111 6 -98 111 19 mossy_stone_brick_slab[type=bottom]
fill -98 112 6 -98 114 19 lime_stained_glass
fill -98 115 6 -98 115 19 moss_block
# Đèn hành lang Slime
setblock -96 114 9 sea_lantern
setblock -96 114 16 sea_lantern

# Cửa vào từ nhánh hành lang Tây
fill -95 111 11 -95 114 12 air

# 2 Spawner Slime (Y=112)
setblock -109 112 13 spawner
data modify block -109 112 13 SpawnData set value {entity:{id:"minecraft:slime"}}
data modify block -109 112 13 MinSpawnDelay set value 80s
data modify block -109 112 13 MaxSpawnDelay set value 160s
data modify block -109 112 13 SpawnCount set value 4s
data modify block -109 112 13 RequiredPlayerRange set value 32s

setblock -103 112 13 spawner
data modify block -103 112 13 SpawnData set value {entity:{id:"minecraft:slime"}}
data modify block -103 112 13 MinSpawnDelay set value 80s
data modify block -103 112 13 MaxSpawnDelay set value 160s
data modify block -103 112 13 SpawnCount set value 4s
data modify block -103 112 13 RequiredPlayerRange set value 32s

# Tượng Slime & Biển chữ neon phát sáng trước phòng Slime
summon armor_stand -94.5 111 10.5 {Tags:["mob_farm_statue"],CustomName:'{"text":"🧪 HỒ CHẤT NHỜN SLIME 🧪","color":"green","bold":true}',CustomNameVisible:1b,NoGravity:1b,ShowArms:1b,ArmorItems:[{id:"minecraft:leather_boots",count:1,components:{"minecraft:dyed_color":8375321}},{id:"minecraft:leather_leggings",count:1,components:{"minecraft:dyed_color":8375321}},{id:"minecraft:leather_chestplate",count:1,components:{"minecraft:dyed_color":8375321}},{id:"minecraft:turtle_helmet",count:1}],HandItems:[{id:"minecraft:slime_ball",count:1},{}]}
setblock -95 112 10 oak_wall_sign[facing=east]{front_text:{has_glowing_text:1b,messages:['{"text":"[ HỒ CHẤT NHỜN ]","color":"green","bold":true}','{"text":"2 Spawner Slime","color":"yellow"}','{"text":"Sàn nảy đàn hồi xanh","color":"aqua"}','{"text":"Rơi: Bóng chất nhờn","color":"gold"}']}}
