# ==============================================================================
# THỦY TẠ THẦN TIÊN HỒ SEN & CẦU VÒM CUNG NGHỈ DƯỠNG (/WARP CAUCA)
# Tọa độ: X: -22..22, Z: -118..-72, Y=96..132 (Phía Bắc Spawn)
# Phong cách: Thủy Mặc Tiên Cảnh - Đầm Sen Pha Lê, Cầu Cong Vút, Đình Lục Giác 2 Tầng
# ==============================================================================

# 1. Dọn dẹp không gian bầu trời
fill -22 96 -118 22 132 -72 air

# 2. Lối vào từ Cánh Bắc Hub
fill -1 120 -73 1 120 -71 chain[axis=z]
fill -2 111 -76 2 111 -73 cherry_planks
fill -2 112 -76 -2 112 -73 cherry_fence
fill 2 112 -76 2 112 -73 cherry_fence

# 3. Đáy đảo nổi rủ xuống Hư Không (Inverted Stalactites)
setblock 0 96 -95 crying_obsidian
fill -1 97 -96 1 97 -94 gilded_blackstone
fill -3 98 -98 3 98 -92 cobbled_deepslate
fill -5 100 -101 5 100 -89 cobbled_deepslate
fill -8 102 -105 8 102 -85 tuff
fill -12 104 -109 12 104 -81 tuff
fill -16 106 -113 16 106 -77 dirt
fill -18 108 -115 18 108 -75 moss_block
fill -20 109 -116 20 109 -74 moss_block
setblock 0 95 -95 amethyst_cluster[facing=down]
setblock -4 99 -92 amethyst_cluster[facing=north]
setblock 4 99 -98 amethyst_cluster[facing=south]
setblock -9 103 -86 amethyst_cluster[facing=north]
setblock 9 103 -104 amethyst_cluster[facing=south]

# 4. Lòng Hồ Sen Pha Lê Đa Tầng (Y=105..110)
fill -19 110 -115 19 110 -75 grass_block
fill -14 105 -111 14 105 -79 sand
fill -14 106 -111 14 109 -79 water
setblock 0 105 -95 sea_lantern
setblock -4 105 -95 sea_lantern
setblock 4 105 -95 sea_lantern
setblock 0 105 -99 sea_lantern
setblock 0 105 -91 sea_lantern
setblock -3 105 -98 sea_lantern
setblock 3 105 -98 sea_lantern
setblock -3 105 -92 sea_lantern
setblock 3 105 -92 sea_lantern
setblock -8 105 -105 sea_lantern
setblock 8 105 -105 sea_lantern
setblock -8 105 -85 sea_lantern
setblock 8 105 -85 sea_lantern
setblock -6 110 -92 lily_pad
setblock 6 110 -92 lily_pad
setblock -8 110 -98 lily_pad
setblock 8 110 -98 lily_pad
setblock -2 110 -88 lily_pad
setblock 2 110 -88 lily_pad
setblock -4 110 -104 lily_pad
setblock 4 110 -104 lily_pad
setblock 0 110 -86 lily_pad
setblock 0 110 -104 lily_pad
setblock -15 111 -82 pink_petals[flower_amount=4]
setblock 15 111 -82 pink_petals[flower_amount=3]
setblock -15 111 -108 pink_petals[flower_amount=4]
setblock 15 111 -108 pink_petals[flower_amount=3]

# 5. Cầu Vòm Cung Gỗ Anh Đào Uốn Mượt (Arched Moon Bridge)
fill -1 110 -76 1 110 -76 cherry_planks
fill -1 111 -78 1 111 -77 cherry_stairs[facing=south]
fill -1 112 -80 1 112 -79 cherry_stairs[facing=south]
fill -1 113 -82 1 113 -81 cherry_planks
fill -1 112 -84 1 112 -83 cherry_stairs[facing=north]
fill -1 111 -86 1 111 -85 cherry_stairs[facing=north]
fill -1 110 -87 1 110 -87 cherry_planks
fill -2 111 -76 -2 111 -76 cherry_fence
fill 2 111 -76 2 111 -76 cherry_fence
fill -2 112 -78 -2 112 -77 cherry_fence
fill 2 112 -78 2 112 -77 cherry_fence
fill -2 113 -80 -2 113 -79 cherry_fence
fill 2 113 -80 2 113 -79 cherry_fence
fill -2 114 -82 -2 114 -81 cherry_fence
fill 2 114 -82 2 114 -81 cherry_fence
fill -2 113 -84 -2 113 -83 cherry_fence
fill 2 113 -84 2 113 -83 cherry_fence
fill -2 112 -86 -2 112 -85 cherry_fence
fill 2 112 -86 2 112 -85 cherry_fence
setblock -2 115 -81 lantern
setblock 2 115 -81 lantern

# 6. Đình Thủy Tạ Lục Giác 2 Tầng Mái Cong (X: -7..7, Z: -103..-89)
fill -6 110 -101 6 110 -91 cherry_planks
fill -4 110 -99 4 110 -93 smooth_quartz
fill -6 111 -101 -6 115 -101 cherry_wood
fill 6 111 -101 6 115 -101 cherry_wood
fill -6 111 -91 -6 115 -91 cherry_wood
fill 6 111 -91 6 115 -91 cherry_wood
fill -7 111 -96 -7 115 -96 cherry_wood
fill 7 111 -96 7 115 -96 cherry_wood
fill -6 111 -101 6 111 -101 cherry_fence
fill -6 111 -101 -6 111 -91 cherry_fence
fill 6 111 -101 6 111 -91 cherry_fence
fill -6 111 -91 -2 111 -91 cherry_fence
fill 2 111 -91 6 111 -91 cherry_fence
fill -7 115 -102 7 115 -90 cherry_slab[type=top]
fill -6 116 -101 6 116 -91 cherry_planks
setblock -8 116 -103 cherry_stairs[facing=south]
setblock 8 116 -103 cherry_stairs[facing=south]
setblock -8 116 -89 cherry_stairs[facing=north]
setblock 8 116 -89 cherry_stairs[facing=north]
fill -4 117 -99 4 117 -93 cherry_planks
fill -4 117 -99 -4 118 -93 purple_stained_glass_pane
fill 4 117 -99 4 118 -93 purple_stained_glass_pane
fill -5 119 -100 5 119 -92 cherry_slab[type=bottom]
fill -3 120 -98 3 120 -94 cherry_wood
setblock 0 121 -96 amethyst_block
setblock 0 122 -96 amethyst_cluster[facing=up]
setblock -7 114 -101 lantern[hanging=true]
setblock 7 114 -101 lantern[hanging=true]
setblock -7 114 -91 lantern[hanging=true]
setblock 7 114 -91 lantern[hanging=true]
setblock -3 111 -96 cherry_stairs[facing=east]
setblock 3 111 -96 cherry_stairs[facing=west]
setblock 0 111 -96 smooth_quartz_slab[type=bottom]
setblock 0 112 -96 sea_pickle[pickles=3]
setblock -4 111 -99 barrel
setblock 4 111 -99 barrel
setblock -4 111 -98 crafting_table

# 7. Cây Anh Đào Cổ Thụ Soi Bóng Hồ Sen
fill -14 111 -95 -14 113 -95 cherry_log
setblock -13 114 -95 cherry_log
setblock -12 115 -95 cherry_log
setblock -11 116 -95 cherry_log
fill -13 115 -97 -9 116 -93 cherry_leaves
fill -12 117 -96 -10 117 -94 cherry_leaves
setblock -11 115 -95 shroomlight
setblock -11 114 -95 lantern[hanging=true]

# 8. NPC Lão Ngư Tri Kỷ
kill @e[type=villager,x=-7,y=109,z=-102,dx=14,dy=8,dz=14]
summon villager 0.5 111 -98.5 {CustomName:'{"text":"❂ Lão Ngư Tri Kỷ ❂","color":"aqua","bold":true}',CustomNameVisible:1b,NoAI:1b,Invulnerable:1b,PersistenceRequired:1b,Silent:1b,VillagerData:{profession:fisherman,type:taiga,level:5},Rotation:[0f,0f],Offers:{Recipes:[{maxUses:999999,buy:{id:"minecraft:cod",count:16},sell:{id:"minecraft:emerald",count:2}},{maxUses:999999,buy:{id:"minecraft:salmon",count:16},sell:{id:"minecraft:emerald",count:2}},{maxUses:999999,buy:{id:"minecraft:tropical_fish",count:8},sell:{id:"minecraft:emerald",count:3}},{maxUses:999999,buy:{id:"minecraft:pufferfish",count:4},sell:{id:"minecraft:emerald",count:3}},{maxUses:999999,buy:{id:"minecraft:emerald",count:3},sell:{id:"minecraft:fishing_rod",count:1}},{maxUses:999999,buy:{id:"minecraft:emerald",count:8},sell:{id:"minecraft:water_bucket",count:1,components:{"minecraft:custom_name":'{"text":"🌊 Xô Nước Phước Lành Đại Dương 🌊","color":"aqua","bold":true}',"minecraft:lore":['{"text":"Nguồn nước tinh khiết của Thần Biển ban tặng!","color":"blue","italic":true}','{"text":"✦ Dùng để tạo nguồn nước vô hạn & tưới tiêu!","color":"green"}']}}},{maxUses:999999,buy:{id:"minecraft:emerald",count:15},sell:{id:"minecraft:fishing_rod",count:1,components:{"minecraft:enchantments":{levels:{"minecraft:luck_of_the_sea":3,"minecraft:lure":3,"minecraft:unbreaking":3}},"minecraft:custom_name":'{"text":"★ Cần Câu Thần Kỳ May Mắn ★","color":"gold","bold":true}'}}},{maxUses:999999,buy:{id:"minecraft:emerald",count:20},sell:{id:"minecraft:nautilus_shell",count:1}},{maxUses:999999,buy:{id:"minecraft:emerald",count:50},sell:{id:"minecraft:heart_of_the_sea",count:1}}]}}

# 9. Biển Hướng Dẫn Thư Giãn
setblock -1 112 -75 oak_wall_sign[facing=south]{front_text:{has_glowing_text:1b,messages:['{"text":"🎣 THỦY TẠ HỒ SEN 🎣","color":"aqua","bold":true}','{"text":"Hồ Câu Cá Thư Giãn","color":"green"}','{"text":"Đổi cá lấy Ngọc Lục Bảo","color":"yellow"}','{"text":"Gặp Lão Ngư trong đình!","color":"gold"}']}}
setblock 1 112 -75 oak_wall_sign[facing=south]{front_text:{has_glowing_text:1b,messages:['{"text":"[ KHO BÁU CHÌM ]","color":"gold","bold":true}','{"text":"Càng câu lâu càng may mắn","color":"yellow"}','{"text":"Sách phép & Vật phẩm quý","color":"aqua"}','{"text":"Tỉ lệ câu quà cực cao!","color":"green"}']}}
