# ==============================================================================
# MINI-DUNGEON RHÔNG — 3 PHÒNG NGẦM + BOSS ROOM
# Xây dưới lòng đất Y=85-100, Z=100-155 (phía sau boss arena)
# Hoàn toàn không chồng lên mặt đất (Boss arenas ở Y=110)
# Dùng replace air để bảo toàn block hiện có
# ==============================================================================

tellraw @a [{"text":"[Skyblock] ","color":"gold","bold":true},{"text":"Đang xây Địa Đạo Rhông...","color":"dark_purple"}]

# ==============================================================================
# DỌN KHÔNG GIAN NGẦM (chỉ dọn air — không phá block rắn bên ngoài layout)
# ==============================================================================
fill -10 85 100 10 100 155 air

# ==============================================================================
# PHÒNG 1: ĐÁ PHONG (X=-10..10, Y=85..95, Z=100..110)
# Vật liệu: stone_bricks hollow
# ==============================================================================
# Tường bao
fill -10 85 100 10 95 100 stone_bricks replace air
fill -10 85 110 10 95 110 stone_bricks replace air
fill -10 85 100 -10 95 110 stone_bricks replace air
fill 10 85 100 10 95 110 stone_bricks replace air
# Trần và sàn
fill -10 85 100 10 85 110 stone_bricks replace air
fill -10 95 100 10 95 110 stone_bricks replace air
# Hollow bên trong (dọn không khí nội thất)
fill -9 86 101 9 94 109 air
# Sàn mossy_stone_bricks trang trí
fill -9 86 101 9 86 109 mossy_stone_bricks replace air
fill -7 86 103 7 86 107 stone_bricks replace air

# Spawner Zombie tại tâm phòng 1 (X=0, Y=88, Z=105)
setblock 0 88 105 spawner{SpawnData:{entity:{id:"minecraft:zombie"}},MinSpawnDelay:200,MaxSpawnDelay:800,SpawnCount:2,MaxNearbyEntities:6,RequiredPlayerRange:16} replace

# Đèn lantern trang trí
setblock -8 94 101 lantern[hanging=true] replace
setblock 8 94 101 lantern[hanging=true] replace
setblock -8 94 109 lantern[hanging=true] replace
setblock 8 94 109 lantern[hanging=true] replace
setblock 0 94 105 lantern[hanging=true] replace

# Biển phòng 1
setblock 0 91 100 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:['{"text":"☠ PHÒNG ĐÁ PHONG ☠","color":"green","bold":true}','{"text":"Cấp Độ: Dễ","color":"yellow"}','{"text":"Coi chừng Zombie!","color":"red"}','{"text":"Đi tiếp về phía Nam","color":"gray"}']}} replace

# ==============================================================================
# HÀNH LANG 1 (X=-2..2, Y=85..91, Z=110..120)
# Vật liệu: stone_bricks, sàn magma_block
# ==============================================================================
fill -2 85 110 2 91 120 stone_bricks replace air
fill -1 86 111 1 90 119 air
# Sàn magma_block (nguy hiểm)
fill -1 86 111 1 86 119 magma_block replace air
# Đèn hai bên
setblock -2 90 113 soul_torch replace
setblock 2 90 113 soul_torch replace
setblock -2 90 117 soul_torch replace
setblock 2 90 117 soul_torch replace

# ==============================================================================
# PHÒNG 2: VỰC NHỆN (X=-8..8, Y=85..95, Z=120..130)
# Vật liệu: deepslate_bricks hollow, lava 2 bên, spawner Spider
# ==============================================================================
fill -8 85 120 8 95 120 deepslate_bricks replace air
fill -8 85 130 8 95 130 deepslate_bricks replace air
fill -8 85 120 -8 95 130 deepslate_bricks replace air
fill 8 85 120 8 95 130 deepslate_bricks replace air
fill -8 85 120 8 85 130 deepslate_bricks replace air
fill -8 95 120 8 95 130 deepslate_bricks replace air
# Hollow nội thất
fill -7 86 121 7 94 129 air
# Sàn deepslate_tiles
fill -7 86 121 7 86 129 deepslate_tiles replace air

# Lava 2 bên (hố lava trang trí nguy hiểm)
fill -7 86 122 -5 86 128 lava replace air
fill 5 86 122 7 86 128 lava replace air
# Đáy lava: cobweb để tạo cảm giác hang nhện
fill -6 87 123 -4 87 127 cobweb replace air
fill 4 87 123 6 87 127 cobweb replace air
fill -5 92 123 5 92 127 cobweb replace air

# Spawner Spider tại tâm (X=0, Y=89, Z=125)
setblock 0 89 125 spawner{SpawnData:{entity:{id:"minecraft:spider"}},MinSpawnDelay:200,MaxSpawnDelay:800,SpawnCount:2,MaxNearbyEntities:6,RequiredPlayerRange:16} replace

# Đèn shroomlight trang trí
setblock -6 94 121 shroomlight replace
setblock 6 94 121 shroomlight replace
setblock -6 94 129 shroomlight replace
setblock 6 94 129 shroomlight replace

# Biển phòng 2
setblock 0 91 120 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:['{"text":"🕷 PHÒNG NHỆN VỰC 🕷","color":"dark_green","bold":true}','{"text":"Cấp Độ: Trung Bình","color":"gold"}','{"text":"Chú ý lava & nhện!","color":"red"}','{"text":"Boss ở cuối hành lang","color":"gray"}']}} replace

# ==============================================================================
# HÀNH LANG 2 (X=-2..2, Y=85..91, Z=130..140)
# Vật liệu: deepslate_bricks, sàn + candle
# ==============================================================================
fill -2 85 130 2 91 140 deepslate_bricks replace air
fill -1 86 131 1 90 139 air
fill -1 86 131 1 86 139 cracked_deepslate_bricks replace air
# Candle trang trí
setblock -2 89 133 candle replace
setblock 2 89 133 candle replace
setblock -2 89 137 candle replace
setblock 2 89 137 candle replace
# Mở nối tiếp hai phòng
fill -1 87 131 1 89 131 air
fill -1 87 139 1 89 139 air

# ==============================================================================
# PHÒNG 3/BOSS ROOM: THẤT RHÔNG (X=-10..10, Y=85..100, Z=140..155)
# Vật liệu: polished_blackstone_bricks hollow
# ==============================================================================
fill -10 85 140 10 100 140 polished_blackstone_bricks replace air
fill -10 85 155 10 100 155 polished_blackstone_bricks replace air
fill -10 85 140 -10 100 155 polished_blackstone_bricks replace air
fill 10 85 140 10 100 155 polished_blackstone_bricks replace air
fill -10 85 140 10 85 155 polished_blackstone_bricks replace air
fill -10 100 140 10 100 155 polished_blackstone_bricks replace air
# Hollow nội thất
fill -9 86 141 9 99 154 air

# Sàn rune: gilded_blackstone + crying_obsidian tâm
fill -9 86 141 9 86 154 gilded_blackstone replace air
# Rune hình chữ X/thập
fill 0 86 141 0 86 154 crying_obsidian replace air
fill -9 86 148 9 86 148 crying_obsidian replace air
# Tâm crying_obsidian
setblock 0 86 148 crying_obsidian replace

# Cột trang trí 4 góc boss room
fill -9 87 141 -9 95 141 polished_blackstone_bricks replace air
fill 9 87 141 9 95 141 polished_blackstone_bricks replace air
fill -9 87 154 -9 95 154 polished_blackstone_bricks replace air
fill 9 87 154 9 95 154 polished_blackstone_bricks replace air

# Soul torch trang trí
setblock -8 92 142 soul_torch replace
setblock 8 92 142 soul_torch replace
setblock -8 92 153 soul_torch replace
setblock 8 92 153 soul_torch replace
setblock 0 92 148 soul_lantern replace

# Chest phần thưởng tại cuối boss room
setblock 0 87 153 chest{Items:[{Slot:0b,id:"minecraft:diamond",count:8},{Slot:1b,id:"minecraft:netherite_ingot",count:1},{Slot:2b,id:"minecraft:amethyst_shard",count:16},{Slot:3b,id:"minecraft:golden_apple",count:4},{Slot:4b,id:"minecraft:experience_bottle",count:32}]} replace

# Pressure plate tại Z=142 kích hoạt boss mini (khi người chơi bước vào)
setblock 0 87 142 stone_pressure_plate replace

# Biển boss room
setblock 0 92 140 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:['{"text":"☠ THẤT RHÔNG ☠","color":"dark_red","bold":true}','{"text":"Bước vào để thức tỉnh","color":"dark_purple"}','{"text":"RHÔNG — Quỷ Cổ Đại!","color":"light_purple","bold":true}','{"text":"Phần thưởng cực hiếm!","color":"gold"}']}} replace

# ==============================================================================
# LỐI VÀO DUNGEON: CẦU THANG TỪ MẶT ĐẤT XUỐNG (X=0, Z=98, từ Y=108 xuống Y=87)
# ==============================================================================
# Dọn lối đi xuống
fill -1 87 96 1 108 99 air
# Bậc thang đi xuống từ Y=108 (Z=98) đến Y=87 (Z=99)
setblock 0 108 98 stone_brick_stairs[facing=south,half=bottom] replace
setblock 0 107 98 stone_brick_stairs[facing=south,half=bottom] replace
setblock 0 106 98 stone_brick_stairs[facing=south,half=bottom] replace
setblock 0 105 98 stone_brick_stairs[facing=south,half=bottom] replace
setblock 0 104 98 stone_brick_stairs[facing=south,half=bottom] replace
setblock 0 103 98 stone_brick_stairs[facing=south,half=bottom] replace
setblock 0 102 98 stone_brick_stairs[facing=south,half=bottom] replace
setblock 0 101 98 stone_brick_stairs[facing=south,half=bottom] replace
setblock 0 100 98 stone_brick_stairs[facing=south,half=bottom] replace
setblock 0 99 98 stone_brick_stairs[facing=south,half=bottom] replace
setblock 0 98 98 stone_brick_stairs[facing=south,half=bottom] replace
setblock 0 97 98 stone_brick_stairs[facing=south,half=bottom] replace
setblock 0 96 98 stone_brick_stairs[facing=south,half=bottom] replace
setblock 0 95 98 stone_brick_stairs[facing=south,half=bottom] replace
setblock 0 94 98 stone_brick_stairs[facing=south,half=bottom] replace
setblock 0 93 98 stone_brick_stairs[facing=south,half=bottom] replace
setblock 0 92 98 stone_brick_stairs[facing=south,half=bottom] replace
setblock 0 91 98 stone_brick_stairs[facing=south,half=bottom] replace
setblock 0 90 98 stone_brick_stairs[facing=south,half=bottom] replace
setblock 0 89 98 stone_brick_stairs[facing=south,half=bottom] replace
setblock 0 88 98 stone_brick_stairs[facing=south,half=bottom] replace
setblock 0 87 98 stone_brick_stairs[facing=south,half=bottom] replace

# Lối vào trên mặt đất (cổng vào dungeon Z=98, Y=108)
setblock -1 108 98 mossy_stone_brick_wall replace
setblock 1 108 98 mossy_stone_brick_wall replace
setblock -1 109 98 mossy_stone_brick_wall replace
setblock 1 109 98 mossy_stone_brick_wall replace
setblock 0 110 98 mossy_stone_bricks replace

# Biển cổng vào dungeon
setblock 0 109 97 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:['{"text":"⚠ ĐỊA ĐẠO RHÔNG ⚠","color":"dark_red","bold":true}','{"text":"Hầm 3 phòng ngầm","color":"gray"}','{"text":"Cảnh báo: Nguy hiểm cao!","color":"red"}','{"text":"Cần ít nhất Gear Tier 5","color":"yellow"}']}} replace

# Đèn lối vào
setblock -2 108 97 torch replace
setblock 2 108 97 torch replace

tellraw @a [{"text":"[Skyblock] ","color":"gold","bold":true},{"text":"☠ Địa Đạo Rhông 3 Phòng đã hoàn thành! Lối vào tại Z=98 mặt đất. ☠","color":"dark_purple","bold":true}]
