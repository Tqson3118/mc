# ==============================================================================
# LUC DIA HAM MO V3.0 (DEEP CAVERNS) - X=155..205, Y=95..135, Z=-30..30
# ==============================================================================
tellraw @a [{"text":"[Skyblock V3.0] ","color":"gold","bold":true},{"text":"Đang kiến tạo Lục Địa Hầm Mỏ Tự Tái Tạo (Deep Caverns)...","color":"aqua"}]

# Base Obsidian & Deepslate Cavern Shell
fill 155 105 -25 205 130 25 cobbled_deepslate hollow
fill 156 106 -24 204 109 24 deepslate_bricks
fill 156 129 -24 204 129 24 crying_obsidian

# Entrance Safe Plaza (X=157..165, Y=110, Z=-6..6)
fill 157 109 -6 165 109 6 polished_basalt
fill 158 109 -5 164 109 5 gold_block
setblock 160 110 0 light_weighted_pressure_plate
setblock 158 111 -4 soul_lantern
setblock 158 111 4 soul_lantern

# 4 Giant Auto-Regenerating Ore Veins
function skyblock:regen_deep_caverns

# Ambient Crystal Pillars & Lanterns
fill 170 110 -18 170 128 -18 amethyst_block
fill 170 110 18 170 128 18 amethyst_block
fill 190 110 -18 190 128 -18 amethyst_block
fill 190 110 18 190 128 18 amethyst_block
setblock 170 115 -17 lantern
setblock 170 115 17 lantern
setblock 190 115 -17 lantern
setblock 190 115 17 lantern

# Guardian Monsters Spawners in Deep Cavern Back Hall (X=198, Z=-10 / 10)
setblock 198 110 -10 spawner{SpawnData:{entity:{id:"minecraft:wither_skeleton"}},MinSpawnDelay:160,MaxSpawnDelay:400,SpawnCount:2,MaxNearbyEntities:6,RequiredPlayerRange:18}
setblock 198 110 10 spawner{SpawnData:{entity:{id:"minecraft:blaze"}},MinSpawnDelay:160,MaxSpawnDelay:400,SpawnCount:2,MaxNearbyEntities:6,RequiredPlayerRange:18}
