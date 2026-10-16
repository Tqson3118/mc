# ==============================================================================
# SIÊU VƯỜN THƯỢNG UYỂN HOA ANH ĐÀO & KHU FARM QUÁI CÔNG CỘNG (/WARP FARM)
# Tọa độ: X: -108..-74, Z: -18..18, Y=96..132 (Phía Tây Spawn)
# Phong cách: Thần Thoại Á Đông - Cổ Thụ Sakura, Đình Mái Cong 2 Tầng, Cổng Torii
# ==============================================================================

# 1. Dọn dẹp không gian bầu trời
fill -108 96 -18 -74 132 18 air

# 2. Cầu xích treo & Lối vào Cánh Tây
fill -75 120 -1 -72 120 1 chain[axis=x]
fill -77 111 -2 -74 111 2 cherry_planks
fill -77 112 -2 -74 112 -2 cherry_fence
fill -77 112 2 -74 112 2 cherry_fence

# 3. Đáy đảo nổi nhọn rủ xuống Hư Không (Organic Inverted Stalactites)
setblock -92 96 0 crying_obsidian
fill -93 97 -1 -91 97 1 gilded_blackstone
fill -94 98 -2 -90 98 2 cobbled_deepslate
fill -96 99 -3 -88 99 3 cobbled_deepslate
fill -98 100 -5 -86 100 5 cobbled_deepslate
fill -100 102 -7 -84 102 7 tuff
fill -102 104 -9 -82 104 9 tuff
fill -104 106 -12 -80 106 12 dirt
fill -105 108 -14 -78 108 14 moss_block
fill -106 109 -15 -77 109 15 moss_block
setblock -94 97 2 amethyst_cluster[facing=south]
setblock -90 97 -2 amethyst_cluster[facing=north]
setblock -96 99 4 amethyst_cluster[facing=south]
setblock -88 99 -4 amethyst_cluster[facing=north]
setblock -92 95 0 amethyst_cluster[facing=down]

# 4. Mặt sàn cảnh quan Vườn Thượng Uyển (Y=110)
fill -106 110 -15 -76 110 15 grass_block
fill -88 110 -12 -77 110 12 cherry_planks
fill -86 110 -9 -79 110 9 smooth_quartz
fill -84 110 -2 -77 110 2 smooth_stone
setblock -81 111 -1 pink_petals[flower_amount=4]
setblock -80 111 1 pink_petals[flower_amount=3]
setblock -83 111 2 pink_petals[flower_amount=4]
setblock -82 111 -3 pink_petals[flower_amount=2]
setblock -85 111 -5 pink_petals[flower_amount=4]
setblock -85 111 5 pink_petals[flower_amount=4]

# 5. Cổng Torii Cung Đình Á Đông (X=-78)
fill -78 111 -3 -78 116 -3 cherry_wood
fill -78 111 3 -78 116 3 cherry_wood
setblock -78 111 -3 polished_blackstone
setblock -78 111 3 polished_blackstone
fill -78 115 -4 -78 115 4 cherry_slab[type=top]
fill -78 117 -5 -78 117 5 cherry_wood
setblock -78 118 -5 cherry_stairs[facing=south]
setblock -78 118 5 cherry_stairs[facing=north]
setblock -78 116 -3 lantern[hanging=true]
setblock -78 116 3 lantern[hanging=true]

# 6. Đình Mái Cong 2 Tầng Cổ Trang
fill -87 111 -8 -87 115 -8 cherry_log
fill -79 111 -8 -79 115 -8 cherry_log
fill -87 111 8 -87 115 8 cherry_log
fill -79 111 8 -79 115 8 cherry_log
fill -87 111 -8 -79 111 -8 cherry_fence
fill -87 111 8 -79 111 8 cherry_fence
fill -79 111 -8 -79 111 -4 cherry_fence
fill -79 111 4 -79 111 8 cherry_fence
fill -88 115 -9 -78 115 9 cherry_slab[type=top]
fill -87 116 -8 -79 116 8 cherry_planks
setblock -89 116 -10 cherry_stairs[facing=south]
setblock -77 116 -10 cherry_stairs[facing=south]
setblock -89 116 10 cherry_stairs[facing=north]
setblock -77 116 10 cherry_stairs[facing=north]
fill -85 117 -6 -81 117 6 cherry_planks
fill -85 117 -6 -85 119 -6 cherry_fence
fill -81 117 -6 -81 119 -6 cherry_fence
fill -85 117 6 -85 119 6 cherry_fence
fill -81 117 6 -81 119 6 cherry_fence
fill -86 119 -7 -80 119 7 cherry_slab[type=bottom]
fill -84 120 -5 -82 120 5 cherry_wood
setblock -83 121 0 amethyst_cluster[facing=up]
setblock -88 114 -8 lantern[hanging=true]
setblock -78 114 -8 lantern[hanging=true]
setblock -88 114 8 lantern[hanging=true]
setblock -78 114 8 lantern[hanging=true]
setblock -85 118 -6 lantern[hanging=true]
setblock -81 118 6 lantern[hanging=true]
setblock -81 111 -7 chest
setblock -82 111 -7 chest
setblock -81 111 7 barrel
setblock -82 111 7 barrel
setblock -85 111 -7 crafting_table
setblock -85 111 7 anvil

# 7. Cây Sakura Cổ Thụ 1 (Bắc)
fill -80 111 -12 -80 113 -12 cherry_log
setblock -80 114 -13 cherry_log
setblock -81 115 -13 cherry_log
setblock -79 115 -14 cherry_log
setblock -80 116 -12 cherry_log
fill -82 115 -15 -78 116 -11 cherry_leaves
fill -83 116 -16 -77 117 -10 cherry_leaves
fill -82 118 -15 -78 118 -11 cherry_leaves
setblock -80 116 -13 shroomlight
setblock -80 114 -14 lantern[hanging=true]
# Cây Sakura Cổ Thụ 2 (Nam)
fill -80 111 12 -80 113 12 cherry_log
setblock -80 114 13 cherry_log
setblock -81 115 13 cherry_log
setblock -79 115 14 cherry_log
setblock -80 116 12 cherry_log
fill -82 115 11 -78 116 15 cherry_leaves
fill -83 116 10 -77 117 16 cherry_leaves
fill -82 118 11 -78 118 15 cherry_leaves
setblock -80 116 13 shroomlight
setblock -80 114 14 lantern[hanging=true]

# 8. Vách Chém Quái An Toàn 0.5 Block & Thạch Điện Spawner
fill -88 111 -11 -88 111 11 cherry_slab[type=bottom]
fill -88 112 -11 -88 114 11 iron_bars
fill -88 115 -11 -88 115 11 polished_deepslate
fill -107 109 -14 -89 109 14 polished_deepslate
fill -107 110 -15 -89 115 -15 deepslate_bricks
fill -107 110 15 -89 115 15 deepslate_bricks
fill -107 110 -15 -107 115 15 deepslate_bricks
fill -107 115 -14 -89 115 14 deepslate_tiles

# 9. 4 Lồng Spawner Nâng Cấp
setblock -100 111 -7 spawner
data modify block -100 111 -7 SpawnData set value {entity:{id:"minecraft:zombie"}}
data modify block -100 111 -7 MinSpawnDelay set value 70s
data modify block -100 111 -7 MaxSpawnDelay set value 140s
data modify block -100 111 -7 SpawnCount set value 4s
data modify block -100 111 -7 RequiredPlayerRange set value 32s
setblock -100 111 7 spawner
data modify block -100 111 7 SpawnData set value {entity:{id:"minecraft:skeleton"}}
data modify block -100 111 7 MinSpawnDelay set value 70s
data modify block -100 111 7 MaxSpawnDelay set value 140s
data modify block -100 111 7 SpawnCount set value 4s
data modify block -100 111 7 RequiredPlayerRange set value 32s
setblock -93 111 -7 spawner
data modify block -93 111 -7 SpawnData set value {entity:{id:"minecraft:spider"}}
data modify block -93 111 -7 MinSpawnDelay set value 80s
data modify block -93 111 -7 MaxSpawnDelay set value 160s
data modify block -93 111 -7 SpawnCount set value 3s
data modify block -93 111 -7 RequiredPlayerRange set value 32s
setblock -93 111 7 spawner
data modify block -93 111 7 SpawnData set value {entity:{id:"minecraft:blaze"}}
data modify block -93 111 7 MinSpawnDelay set value 80s
data modify block -93 111 7 MaxSpawnDelay set value 160s
data modify block -93 111 7 SpawnCount set value 3s
data modify block -93 111 7 RequiredPlayerRange set value 32s

# 10. Biển Chỉ Dẫn Nghệ Thuật
setblock -79 112 -2 oak_wall_sign[facing=west]{front_text:{has_glowing_text:1b,messages:['{"text":"🌸 VƯỜN THƯỢNG UYỂN 🌸","color":"light_purple","bold":true}','{"text":"Khu Farm Quái An Toàn","color":"green"}','{"text":"Đứng tại khe chém quái","color":"yellow"}','{"text":"Nhặt EXP & Nguyên Liệu!","color":"gold"}']}}
setblock -79 112 2 oak_wall_sign[facing=west]{front_text:{has_glowing_text:1b,messages:['{"text":"[ MẸO KIẾM TIỀN ]","color":"gold","bold":true}','{"text":"Dùng Kiếm Looting cao","color":"aqua"}','{"text":"Đổi xương thịt lấy Xu","color":"yellow"}','{"text":"Tại /warp shop Tây Hub","color":"green"}']}}
