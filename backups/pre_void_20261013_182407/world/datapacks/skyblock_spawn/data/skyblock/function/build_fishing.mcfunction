# ==============================================================================
# KHU VỰC CÂU CÁ NGHỈ DƯỠNG (SATELLITE FISHING PIER & LAKE)
# Tâm hồ: X=0, Y=110, Z=-92 (Tách biệt hoàn toàn khỏi Cánh Bắc Z >= -72)
# ==============================================================================

# 1. Dọn dẹp không gian (Z <= -76, không đè vào Cánh Bắc Hub Z >= -72)
fill -18 102 -110 18 130 -76 air

# 2. Xích sắt lơ lửng kết nối từ Cánh Bắc sang Bến Câu Cá
fill -1 120 -73 1 120 -71 chain[axis=z]

# 3. Đảo nổi Hồ Câu Cá (Floating Island Foundation: Z: -106..-78)
fill -14 104 -106 14 104 -78 cobbled_deepslate
fill -15 105 -107 15 107 -77 dirt
fill -14 108 -106 14 109 -78 moss_block
fill -12 110 -104 12 110 -80 grass_block

# 4. Lòng hồ và Nước (Y=107..109, Z: -102..-84)
fill -10 107 -102 10 107 -84 sand
fill -10 108 -102 10 109 -84 water
# Đèn dưới đáy hồ
setblock -6 107 -96 sea_lantern
setblock 6 107 -96 sea_lantern
setblock 0 107 -92 sea_lantern
setblock -4 107 -88 sea_lantern
setblock 4 107 -88 sea_lantern

# Cây hoa súng trên mặt hồ
setblock -3 110 -94 lily_pad
setblock 3 110 -90 lily_pad
setblock -1 110 -87 lily_pad
setblock 4 110 -97 lily_pad
setblock -5 110 -100 lily_pad

# 5. Cầu gỗ & Sàn câu cá ven hồ (Oak Pier: Z: -84..-78)
fill -3 110 -84 3 110 -78 spruce_planks
fill -3 111 -84 -3 111 -78 spruce_fence
fill 3 111 -84 3 111 -78 spruce_fence
setblock -3 112 -81 lantern
setblock 3 112 -81 lantern

# Bàn ghế nghỉ ngơi bên hồ
setblock -2 111 -80 oak_stairs[facing=east]
setblock 2 111 -80 oak_stairs[facing=west]
setblock 0 110 -80 polished_andesite

# Chòi câu cá bên bờ (Z: -96..-88, X: -12..-8)
fill -12 110 -96 -8 110 -88 oak_planks
fill -12 111 -96 -12 113 -96 oak_log
fill -8 111 -96 -8 113 -96 oak_log
fill -12 111 -88 -12 113 -88 oak_log
fill -8 111 -88 -8 113 -88 oak_log
fill -13 114 -97 -7 114 -87 oak_slab
setblock -10 113 -92 lantern[hanging=true]
setblock -11 111 -95 barrel
setblock -9 111 -95 barrel
setblock -10 111 -95 crafting_table

# 6. Biển báo hướng dẫn (Z=-78)
setblock -1 111 -78 oak_wall_sign[facing=south]{front_text:{has_glowing_text:1b,messages:['{"text":"🎣 KHU VỰC CÂU CÁ 🎣","color":"aqua","bold":true}','{"text":"Thư giãn & Đổi cá lấy xu","color":"green"}','{"text":"Mua Cần Câu Thần Kỳ","color":"yellow"}','{"text":"Lão Ngư ở bên chòi!","color":"gold"}']}}
setblock 1 111 -78 oak_wall_sign[facing=south]{front_text:{has_glowing_text:1b,messages:['{"text":"[ MẸO CÂU CÁ ]","color":"blue","bold":true}','{"text":"Càng câu càng nhiều cá","color":"white"}','{"text":"Đổi cá lấy Ngọc Lục Bảo","color":"green"}','{"text":"Tỉ lệ câu kho báu cao!","color":"gold"}']}}

# 7. Xóa NPC cũ (nếu có)
kill @e[type=villager,x=-14,y=108,z=-106,dx=28,dy=10,dz=28]

# 8. Summon NPC Lão Ngư Tri Kỷ tại chòi
summon villager -10 111 -92 {CustomName:'{"text":"Lão Ngư Tri Kỷ","color":"aqua","bold":true}',CustomNameVisible:1b,NoAI:1b,Invulnerable:1b,PersistenceRequired:1b,Silent:1b,VillagerData:{profession:fisherman,type:taiga,level:5},Offers:{Recipes:[{maxUses:999999,buy:{id:"minecraft:cod",count:16},sell:{id:"minecraft:emerald",count:2}},{maxUses:999999,buy:{id:"minecraft:salmon",count:16},sell:{id:"minecraft:emerald",count:2}},{maxUses:999999,buy:{id:"minecraft:tropical_fish",count:8},sell:{id:"minecraft:emerald",count:3}},{maxUses:999999,buy:{id:"minecraft:pufferfish",count:4},sell:{id:"minecraft:emerald",count:3}},{maxUses:999999,buy:{id:"minecraft:emerald",count:3},sell:{id:"minecraft:fishing_rod",count:1}},{maxUses:999999,buy:{id:"minecraft:emerald",count:8},sell:{id:"minecraft:water_bucket",count:1,components:{"minecraft:custom_name":'{"text":"🌊 Xô Nước Phước Lành Đại Dương 🌊","color":"aqua","bold":true}',"minecraft:lore":['{"text":"Nguồn nước tinh khiết của Thần Biển ban tặng!","color":"blue","italic":true}','{"text":"✦ Dùng để tạo nguồn nước vô hạn & tưới tiêu!","color":"green"}']}}},{maxUses:999999,buy:{id:"minecraft:emerald",count:15},sell:{id:"minecraft:fishing_rod",count:1,components:{"minecraft:enchantments":{levels:{"minecraft:luck_of_the_sea":3,"minecraft:lure":3,"minecraft:unbreaking":3}},"minecraft:custom_name":'{"text":"Cần Câu Thần Kỳ","color":"gold","bold":true}'}}},{maxUses:999999,buy:{id:"minecraft:emerald",count:20},sell:{id:"minecraft:nautilus_shell",count:1}},{maxUses:999999,buy:{id:"minecraft:emerald",count:50},sell:{id:"minecraft:heart_of_the_sea",count:1}}]}}
