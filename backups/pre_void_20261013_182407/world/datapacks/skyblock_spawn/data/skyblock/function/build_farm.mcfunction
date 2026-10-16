# ==============================================================================
# KHU FARM QUÁI VẬT TẬP TRUNG (SATELLITE MOB FARM COMPLEX)
# Tọa độ: X: -102..-78, Z: -12..12, Y=110 (Tách biệt hoàn toàn khỏi Cánh Tây X >= -72)
# ==============================================================================

# 1. Clear mob farm airspace (X <= -76, không đè vào Cánh Tây Hub X >= -72)
fill -104 102 -14 -76 130 14 air

# 2. Xích sắt lơ lửng kết nối từ Cánh Tây sang Khu Farm Quái
fill -75 120 -1 -72 120 1 chain[axis=x]

# 3. Floating island underbody rock for Mob Farm
fill -100 102 -10 -80 102 10 cobbled_deepslate
fill -100 104 -10 -80 104 10 tuff
fill -101 106 -11 -79 107 11 cobblestone
fill -102 108 -12 -78 109 12 mossy_cobblestone

# 4. Dungeon Floor at Y=110
fill -102 110 -12 -78 110 12 mossy_stone_bricks
fill -100 110 -10 -80 110 10 cobblestone

# 5. Dungeon Ceiling / Roof at Y=115 (Keep spawner area dark for spawns!)
fill -102 115 -12 -85 115 12 deepslate_bricks

# 6. Dungeon Outer Walls (Y=111..114)
fill -102 111 -12 -78 114 -12 stone_brick_wall
fill -102 111 12 -78 114 12 stone_brick_wall
fill -102 111 -12 -102 114 12 mossy_cobblestone

# 7. Player Observation / Safe Slicing Gallery (X: -84..-78)
fill -84 110 -10 -78 110 10 polished_andesite

# 8. Safety Grate separating players from mobs (Iron Bars + Lower Slabs for feet hit)
fill -85 111 -10 -85 111 10 spruce_slab[type=bottom]
fill -85 112 -10 -85 114 10 iron_bars

# 9. Clear entrance gate to Safe Gallery from East
fill -78 111 -2 -78 113 2 air

# 10. Storage Chests & Barrels in Safe Gallery
setblock -80 111 -5 chest
setblock -80 111 5 chest
setblock -82 111 -5 barrel
setblock -82 111 5 barrel
setblock -81 111 0 crafting_table

# 11. Spawners inside the dark chamber (X: -100..-86)
setblock -94 112 -4 spawner
data modify block -94 112 -4 SpawnData set value {entity:{id:"minecraft:zombie"}}
data modify block -94 112 -4 MinSpawnDelay set value 100s
data modify block -94 112 -4 MaxSpawnDelay set value 200s
data modify block -94 112 -4 SpawnCount set value 4s
data modify block -94 112 -4 RequiredPlayerRange set value 32s

setblock -94 112 4 spawner
data modify block -94 112 4 SpawnData set value {entity:{id:"minecraft:skeleton"}}
data modify block -94 112 4 MinSpawnDelay set value 100s
data modify block -94 112 4 MaxSpawnDelay set value 200s
data modify block -94 112 4 SpawnCount set value 4s
data modify block -94 112 4 RequiredPlayerRange set value 32s

setblock -88 112 -4 spawner
data modify block -88 112 -4 SpawnData set value {entity:{id:"minecraft:spider"}}
data modify block -88 112 -4 MinSpawnDelay set value 120s
data modify block -88 112 -4 MaxSpawnDelay set value 220s
data modify block -88 112 -4 SpawnCount set value 3s
data modify block -88 112 -4 RequiredPlayerRange set value 32s

setblock -88 112 4 spawner
data modify block -88 112 4 SpawnData set value {entity:{id:"minecraft:blaze"}}
data modify block -88 112 4 MinSpawnDelay set value 120s
data modify block -88 112 4 MaxSpawnDelay set value 240s
data modify block -88 112 4 SpawnCount set value 3s
data modify block -88 112 4 RequiredPlayerRange set value 32s

# 12. Lights in Player Gallery only (Spawners stay dark for max spawn rate)
setblock -80 113 -8 lantern
setblock -80 113 8 lantern

# 13. Welcome Signs in Safe Gallery
setblock -79 112 -3 oak_wall_sign[facing=west]{front_text:{has_glowing_text:1b,messages:['{"text":"☠ KHU FARM QUÁI ☠","color":"green","bold":true}','{"text":"Đứng tại khe hở","color":"yellow"}','{"text":"Đánh quái nhặt EXP!","color":"gold"}','{"text":"Zombie, Cung, Nhện","color":"red"}']}}
setblock -79 112 3 oak_wall_sign[facing=west]{front_text:{has_glowing_text:1b,messages:['{"text":"[ MẸO FARM ĐỒ ]","color":"aqua","bold":true}','{"text":"Dùng Kiếm Looting III","color":"yellow"}','{"text":"Mang đồ về /spawn","color":"green"}','{"text":"Đổi lấy Ngọc Lục Bảo!","color":"gold"}']}}
