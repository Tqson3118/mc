# ==============================================================================
# HỆ THỐNG ĐẠI ĐIỆN 4 PHÂN KHU BOSS NỐI CẦU XÍCH PARABOL KHỔNG LỒ (/WARP BOSS)
# Tọa độ: Z: 50..134, X: -48..48, Y=96..132 (Phía Nam Spawn)
# Phong cách: Dark Fantasy Void Realm - Cầu Xích Võng Tự Nhiên, Đền Gothic Đá Đen
# ==============================================================================

# 1. Dọn dẹp không gian bầu trời
fill -16 96 73 16 132 89 air
fill -46 96 73 -17 132 97 air
fill 17 96 73 46 132 97 air
fill -20 96 98 20 132 134 air
fill -48 96 98 -21 132 134 air

# 2. Lối vào từ Cánh Nam Hub
fill -1 120 71 1 120 73 chain[axis=z]

# 3. Sảnh Đền Boss Trung Tâm (Gothic Nexus)
setblock 0 96 81 crying_obsidian
fill -1 97 80 1 97 82 gilded_blackstone
fill -3 98 78 3 98 84 cobbled_deepslate
fill -6 100 76 6 100 86 cobbled_deepslate
fill -10 103 74 10 103 88 polished_blackstone
fill -14 106 74 14 107 88 polished_blackstone
fill -14 108 74 14 109 88 polished_blackstone_bricks
fill -14 110 74 14 110 88 polished_blackstone_bricks
fill -12 110 76 12 110 86 chiseled_polished_blackstone
fill -8 110 78 8 110 84 gilded_blackstone
fill -4 110 80 4 110 82 crying_obsidian
setblock 0 110 81 lodestone
fill -14 111 74 -14 120 74 gilded_blackstone
fill 14 111 74 14 120 74 gilded_blackstone
fill -14 111 88 -14 120 88 gilded_blackstone
fill 14 111 88 14 120 88 gilded_blackstone
setblock -14 121 74 gold_block
setblock 14 121 74 gold_block
setblock -14 121 88 gold_block
setblock 14 121 88 gold_block
setblock -14 122 74 soul_lantern
setblock 14 122 74 soul_lantern
setblock -14 122 88 soul_lantern
setblock 14 122 88 soul_lantern
fill -14 111 74 14 112 74 polished_blackstone_brick_wall
fill -14 111 88 14 112 88 polished_blackstone_brick_wall
fill -14 111 74 -14 112 88 polished_blackstone_brick_wall
fill 14 111 74 14 112 88 polished_blackstone_brick_wall
fill -2 111 74 2 113 74 air
fill -14 111 79 -14 113 83 air
fill 14 111 79 14 113 83 air
fill -2 111 88 2 113 88 air
setblock -3 111 76 ender_chest
setblock 3 111 76 ender_chest
setblock -3 111 77 crafting_table
setblock 3 111 77 anvil
kill @e[type=villager,tag=boss_hunter_npc]
kill @e[type=interaction,tag=boss_hunter_interact]
kill @e[type=armor_stand,tag=boss_hunter_hologram]
summon villager 0.5 111 79.5 {Tags:["boss_hunter_npc"],CustomName:'{"text":"⚔ THỢ SĂN BOSS ⚔","color":"red","bold":true}',CustomNameVisible:1b,NoAI:1b,Invulnerable:1b,PersistenceRequired:1b,Silent:1b,VillagerData:{profession:weaponsmith,type:taiga,level:5},Rotation:[180f,0f]}
summon interaction 0.5 111 79.5 {Tags:["boss_hunter_interact"],width:1.2f,height:1.9f,response:1b}
summon armor_stand 0.5 113.2 79.5 {Tags:["boss_hunter_hologram"],Invisible:1b,Marker:1b,NoGravity:1b,CustomNameVisible:1b,CustomName:'{"text":"[ CLICK ĐỂ CHỌN BOSS ]","color":"yellow","bold":true}'}
setblock -1 112 75 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:['{"text":"🏛 ĐẠI ĐIỆN BOSS 🏛","color":"gold","bold":true}','{"text":"Sảnh Trung Tâm","color":"yellow"}','{"text":"Gõ /warp boss","color":"green"}','{"text":"Chọn phân khu dưới!","color":"aqua"}']}}
setblock 1 112 75 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:['{"text":"[ HƯỚNG DẪN ]","color":"dark_red","bold":true}','{"text":"⬅ Tây: Boss 1 & Boss 4","color":"green"}','{"text":"➡ Đông: Boss 2","color":"red"}','{"text":"⬇ Nam: Boss 3 Tuần","color":"gold"}']}}

# 4. Hệ Thống 4 Cầu Xích Parabol Khổng Lồ Võng Giữa Hư Không
fill -22 110 80 -14 110 82 polished_blackstone_brick_slab[type=top]
setblock -14 114 79 chain[axis=x]
setblock -14 114 83 chain[axis=x]
setblock -15 113 79 chain[axis=x]
setblock -15 113 83 chain[axis=x]
setblock -16 112 79 chain[axis=x]
setblock -16 112 83 chain[axis=x]
setblock -17 112 79 chain[axis=x]
setblock -17 112 83 chain[axis=x]
setblock -18 112 79 chain[axis=x]
setblock -18 112 83 chain[axis=x]
setblock -19 112 79 chain[axis=x]
setblock -19 112 83 chain[axis=x]
setblock -20 113 79 chain[axis=x]
setblock -20 113 83 chain[axis=x]
setblock -21 114 79 chain[axis=x]
setblock -21 114 83 chain[axis=x]
setblock -22 115 79 chain[axis=x]
setblock -22 115 83 chain[axis=x]
setblock -14 112 79 chain[axis=y]
setblock -14 113 79 chain[axis=y]
setblock -14 112 83 chain[axis=y]
setblock -14 113 83 chain[axis=y]
setblock -22 112 79 chain[axis=y]
setblock -22 113 79 chain[axis=y]
setblock -22 114 79 chain[axis=y]
setblock -22 112 83 chain[axis=y]
setblock -22 113 83 chain[axis=y]
setblock -22 114 83 chain[axis=y]
setblock -18 111 81 soul_lantern
fill 14 110 80 22 110 82 nether_brick_slab[type=top]
setblock 14 114 79 chain[axis=x]
setblock 14 114 83 chain[axis=x]
setblock 15 113 79 chain[axis=x]
setblock 15 113 83 chain[axis=x]
setblock 16 112 79 chain[axis=x]
setblock 16 112 83 chain[axis=x]
setblock 17 112 79 chain[axis=x]
setblock 17 112 83 chain[axis=x]
setblock 18 112 79 chain[axis=x]
setblock 18 112 83 chain[axis=x]
setblock 19 112 79 chain[axis=x]
setblock 19 112 83 chain[axis=x]
setblock 20 113 79 chain[axis=x]
setblock 20 113 83 chain[axis=x]
setblock 21 114 79 chain[axis=x]
setblock 21 114 83 chain[axis=x]
setblock 22 115 79 chain[axis=x]
setblock 22 115 83 chain[axis=x]
setblock 14 112 79 chain[axis=y]
setblock 14 113 79 chain[axis=y]
setblock 14 112 83 chain[axis=y]
setblock 14 113 83 chain[axis=y]
setblock 22 112 79 chain[axis=y]
setblock 22 113 79 chain[axis=y]
setblock 22 114 79 chain[axis=y]
setblock 22 112 83 chain[axis=y]
setblock 22 113 83 chain[axis=y]
setblock 22 114 83 chain[axis=y]
setblock 18 111 81 soul_lantern
fill -2 110 89 2 110 99 polished_blackstone_brick_slab[type=top]
fill 0 110 89 0 110 99 gilded_blackstone
setblock -3 115 89 chain[axis=z]
setblock 3 115 89 chain[axis=z]
setblock -3 114 90 chain[axis=z]
setblock 3 114 90 chain[axis=z]
setblock -3 113 91 chain[axis=z]
setblock 3 113 91 chain[axis=z]
setblock -3 113 92 chain[axis=z]
setblock 3 113 92 chain[axis=z]
setblock -3 112 93 chain[axis=z]
setblock 3 112 93 chain[axis=z]
setblock -3 112 94 chain[axis=z]
setblock 3 112 94 chain[axis=z]
setblock -3 112 95 chain[axis=z]
setblock 3 112 95 chain[axis=z]
setblock -3 113 96 chain[axis=z]
setblock 3 113 96 chain[axis=z]
setblock -3 113 97 chain[axis=z]
setblock 3 113 97 chain[axis=z]
setblock -3 114 98 chain[axis=z]
setblock 3 114 98 chain[axis=z]
setblock -3 115 99 chain[axis=z]
setblock 3 115 99 chain[axis=z]
setblock -3 113 94 chain[axis=y]
setblock 3 113 94 chain[axis=y]
setblock -2 111 94 soul_lantern
setblock 2 111 94 soul_lantern
fill -28 110 84 -22 110 86 purpur_slab[type=top]
fill -28 110 86 -24 110 100 purpur_slab[type=top]
setblock -29 115 86 chain[axis=z]
setblock -23 115 86 chain[axis=z]
setblock -29 114 88 chain[axis=z]
setblock -23 114 88 chain[axis=z]
setblock -29 113 90 chain[axis=z]
setblock -23 113 90 chain[axis=z]
setblock -29 112 92 chain[axis=z]
setblock -23 112 92 chain[axis=z]
setblock -29 112 94 chain[axis=z]
setblock -23 112 94 chain[axis=z]
setblock -29 113 96 chain[axis=z]
setblock -23 113 96 chain[axis=z]
setblock -29 114 98 chain[axis=z]
setblock -23 114 98 chain[axis=z]
setblock -29 115 100 chain[axis=z]
setblock -23 115 100 chain[axis=z]
setblock -26 112 93 end_rod

# 5. Đại Điện 1: Động Nữ Hoàng Nhện (Tier 1)
setblock -29 98 85 crying_obsidian
fill -32 100 82 -26 100 88 cobbled_deepslate
fill -36 104 78 -22 104 92 deepslate
fill -39 108 76 -19 108 94 mossy_cobblestone
fill -40 110 75 -18 110 95 mossy_stone_bricks
fill -38 110 77 -20 110 93 mossy_cobblestone
fill -34 110 81 -24 110 89 dripstone_block
fill -39 111 76 -37 113 78 cobweb
fill -21 111 76 -19 113 78 cobweb
fill -39 111 92 -37 113 94 cobweb
fill -21 111 92 -19 113 94 cobweb
fill -33 111 83 -33 112 87 cobweb
fill -25 111 83 -25 112 87 cobweb
fill -40 111 75 -18 114 75 mossy_stone_brick_wall
fill -40 111 95 -18 114 95 mossy_stone_brick_wall
fill -40 111 75 -40 114 95 mossy_stone_brick_wall
fill -18 111 75 -18 114 95 mossy_stone_brick_wall
fill -18 111 79 -18 113 83 air
setblock -29 110 85 sculk_catalyst
setblock -29 111 85 cobweb
setblock -20 111 77 command_block{Command:"function skyblock:summon_boss_1"}
setblock -20 112 77 mossy_stone_bricks
setblock -20 113 77 stone_button[face=floor,facing=north]
setblock -21 112 76 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:['{"text":"🕷 ĐỘNG NỮ HOÀNG 🕷","color":"green","bold":true}','{"text":"Boss Cấp 1 (150 HP)","color":"gold"}','{"text":"Bấm nút trên trụ đá","color":"yellow"}','{"text":"để TRIỆU HỒI BOSS!","color":"red"}']}}
setblock -19 112 76 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:['{"text":"[ PHẦN THƯỞNG ]","color":"gold","bold":true}','{"text":"Mảnh Quặng Cổ Đại","color":"aqua","bold":true}','{"text":"16 Ngọc Lục Bảo","color":"green"}','{"text":"Tơ Nhện & 500 Exp","color":"yellow"}']}}
setblock -19 109 74 command_block{Command:"teleport @p 0.5 111.0 79.0 0.0 0.0"}
setblock -19 110 74 polished_blackstone_pressure_plate
setblock -19 111 73 mossy_stone_brick_wall
setblock -19 112 73 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:['{"text":"[ VỀ SẢNH ]","color":"gold","bold":true}','{"text":"Cổng Rút Lui","color":"yellow"}','{"text":"Bước lên đĩa để","color":"aqua"}','{"text":"VỀ SẢNH TRUNG TÂM","color":"green","bold":true}']}}

# 6. Đại Điện 2: Vực Lửa Đao Phủ Địa Ngục (Tier 2)
setblock 29 98 85 crying_obsidian
fill 26 100 82 32 100 88 blackstone
fill 22 104 78 36 104 92 blackstone
fill 19 108 76 39 108 94 nether_bricks
fill 18 110 75 40 110 95 nether_bricks
fill 20 110 77 38 110 93 red_nether_bricks
fill 24 110 81 34 110 89 magma_block
fill 27 110 84 31 110 86 crying_obsidian
fill 20 111 77 20 114 77 gilded_blackstone
setblock 20 115 77 campfire
fill 38 111 77 38 114 77 gilded_blackstone
setblock 38 115 77 campfire
fill 20 111 93 20 114 93 gilded_blackstone
setblock 20 115 93 campfire
fill 38 111 93 38 114 93 gilded_blackstone
setblock 38 115 93 campfire
fill 18 111 75 40 114 75 nether_brick_wall
fill 18 111 95 40 114 95 nether_brick_wall
fill 18 111 75 18 114 95 nether_brick_wall
fill 40 111 75 40 114 95 nether_brick_wall
fill 18 111 79 18 113 83 air
setblock 29 110 85 soul_sand
setblock 29 111 85 soul_fire
setblock 20 111 77 command_block{Command:"function skyblock:summon_boss_2"}
setblock 20 112 77 nether_bricks
setblock 20 113 77 stone_button[face=floor,facing=north]
setblock 19 112 76 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:['{"text":"🔥 VỰC ĐAO PHỦ 🔥","color":"red","bold":true}','{"text":"Boss Cấp 2 (300 HP)","color":"gold"}','{"text":"Bấm nút trên trụ đá","color":"yellow"}','{"text":"để TRIỆU HỒI BOSS!","color":"red"}']}}
setblock 21 112 76 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:['{"text":"[ PHẦN THƯỞNG ]","color":"gold","bold":true}','{"text":"Tinh Thể Cổ Đại","color":"light_purple","bold":true}','{"text":"Rìu Netherite Lửa","color":"red"}','{"text":"8 Khối Vàng & Exp","color":"yellow"}']}}
setblock 18 109 74 command_block{Command:"teleport @p 0.5 111.0 79.0 0.0 0.0"}
setblock 18 110 74 polished_blackstone_pressure_plate
setblock 18 111 73 nether_brick_wall
setblock 18 112 73 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:['{"text":"[ VỀ SẢNH ]","color":"gold","bold":true}','{"text":"Cổng Rút Lui","color":"yellow"}','{"text":"Bước lên đĩa để","color":"aqua"}','{"text":"VỀ SẢNH TRUNG TÂM","color":"green","bold":true}']}}

# 7. Đại Điện 3: Thành Trì Chúa Tể Bóng Tối (Boss Tuần Tier 3)
setblock 0 96 115 crying_obsidian
fill -3 98 112 3 98 118 gilded_blackstone
fill -7 101 108 7 101 122 polished_blackstone
fill -12 105 104 12 105 126 polished_blackstone
fill -17 108 101 17 108 129 polished_blackstone_bricks
fill -18 110 100 18 110 130 polished_blackstone_bricks
fill -15 110 103 15 110 127 red_nether_bricks
fill -10 110 108 10 110 122 magma_block
fill -5 110 111 5 110 119 crying_obsidian
fill -16 111 102 -16 116 102 gilded_blackstone
setblock -16 117 102 soul_campfire
fill 16 111 102 16 116 102 gilded_blackstone
setblock 16 117 102 soul_campfire
fill -16 111 128 -16 116 128 gilded_blackstone
setblock -16 117 128 soul_campfire
fill 16 111 128 16 116 128 gilded_blackstone
setblock 16 117 128 soul_campfire
fill -18 111 100 18 114 100 deepslate_tile_wall
fill -18 111 130 18 114 130 deepslate_tile_wall
fill -18 111 100 -18 114 130 deepslate_tile_wall
fill 18 111 100 18 114 130 deepslate_tile_wall
fill -2 111 100 2 114 100 air
fill -3 111 100 -3 115 100 gilded_blackstone
fill 3 111 100 3 115 100 gilded_blackstone
fill -2 110 113 2 110 117 crying_obsidian
setblock 0 110 115 soul_sand
setblock 0 111 115 soul_fire
setblock 0 111 103 command_block{Command:"function skyblock:summon_boss_3"}
setblock 0 112 103 gilded_blackstone
setblock 0 113 103 stone_button[face=floor,facing=north]
setblock -1 112 102 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:['{"text":"🏰 CHÚA TỂ BÓNG TỐI 🏰","color":"dark_red","bold":true}','{"text":"Boss Tuần (600 HP)","color":"gold"}','{"text":"Bấm nút trên trụ đá","color":"yellow"}','{"text":"để TRIỆU HỒI BOSS!","color":"red"}']}}
setblock 1 112 102 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:['{"text":"[ RƠI 100% CỰC HIẾM ]","color":"gold","bold":true}','{"text":"☠ Trái Tim Của Quỷ ☠","color":"dark_red","bold":true}','{"text":"Đột phá bắt buộc Tier 10!","color":"red"}','{"text":"Kiếm Netherite + Totem","color":"green"}']}}
setblock 2 109 101 command_block{Command:"teleport @p 0.5 111.0 79.0 0.0 0.0"}
setblock 2 110 101 polished_blackstone_pressure_plate
setblock 2 111 100 deepslate_tile_wall
setblock 2 112 100 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:['{"text":"[ VỀ SẢNH ]","color":"gold","bold":true}','{"text":"Cổng Rút Lui","color":"yellow"}','{"text":"Bước lên đĩa để","color":"aqua"}','{"text":"VỀ SẢNH TRUNG TÂM","color":"green","bold":true}']}}

# 8. Đại Điện 4: Thánh Địa Hư Không (World Boss Tier 4)
setblock -35 98 115 crying_obsidian
fill -38 100 112 -32 100 118 end_stone_bricks
fill -41 104 107 -29 104 123 end_stone_bricks
fill -44 108 101 -26 108 129 purpur_block
fill -45 110 100 -25 110 130 purpur_block
fill -43 110 102 -27 110 128 end_stone_bricks
fill -40 110 106 -30 110 124 crying_obsidian
fill -38 110 109 -32 110 121 amethyst_block
fill -43 111 102 -43 117 102 purpur_pillar
setblock -43 118 102 end_rod
fill -27 111 102 -27 117 102 purpur_pillar
setblock -27 118 102 end_rod
fill -43 111 128 -43 117 128 purpur_pillar
setblock -43 118 128 end_rod
fill -27 111 128 -27 117 128 purpur_pillar
setblock -27 118 128 end_rod
fill -45 111 100 -25 114 100 tinted_glass
fill -45 111 130 -25 114 130 tinted_glass
fill -45 111 100 -45 114 130 tinted_glass
fill -25 111 100 -25 114 130 tinted_glass
fill -25 111 101 -25 113 104 air
fill -37 110 113 -33 110 117 crying_obsidian
setblock -35 110 115 amethyst_block
setblock -35 111 115 end_rod
setblock -27 111 103 command_block{Command:"function skyblock:summon_boss_4"}
setblock -27 112 103 purpur_pillar
setblock -27 113 103 stone_button[face=floor,facing=north]
setblock -28 112 102 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:['{"text":"🌀 THÁNH ĐỊA HƯ KHÔNG 🌀","color":"dark_purple","bold":true}','{"text":"World Boss (1200 HP)","color":"light_purple"}','{"text":"Bấm nút trên trụ đá","color":"yellow"}','{"text":"để TRIỆU HỒI BOSS!","color":"red"}']}}
setblock -26 112 102 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:['{"text":"[ RƠI 100% TỐI THƯỢNG ]","color":"gold","bold":true}','{"text":"🌀 Lõi Hư Không 🌀","color":"dark_purple","bold":true}','{"text":"Đột phá bắt buộc Tier 13!","color":"light_purple"}','{"text":"Sao Nether & 64 Ngọc","color":"aqua"}']}}
setblock -26 109 101 command_block{Command:"teleport @p 0.5 111.0 79.0 0.0 0.0"}
setblock -26 110 101 polished_blackstone_pressure_plate
setblock -26 111 100 purpur_pillar
setblock -26 112 100 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:['{"text":"[ VỀ SẢNH ]","color":"gold","bold":true}','{"text":"Cổng Rút Lui","color":"yellow"}','{"text":"Bước lên đĩa để","color":"aqua"}','{"text":"VỀ SẢNH TRUNG TÂM","color":"green","bold":true}']}}

# 8B. Cầu Xích & Đại Điện 5: Thâm Uyên Cổ Thần (Mythic Boss Tier 5 - Đông Nam X: 25..45, Z: 100..130)
fill 22 110 84 28 110 86 deepslate_tile_slab[type=top]
fill 24 110 86 28 110 100 deepslate_tile_slab[type=top]
fill 25 110 100 45 110 130 deepslate_tiles
fill 27 110 102 43 110 128 sculk
fill 30 110 106 40 110 124 reinforced_deepslate
fill 32 110 109 38 110 121 sea_lantern
fill 25 111 100 45 114 100 deepslate_tile_wall
fill 25 111 130 45 114 130 deepslate_tile_wall
fill 25 111 100 25 114 130 deepslate_tile_wall
fill 45 111 100 45 114 130 deepslate_tile_wall
fill 25 111 101 25 113 104 air
fill 27 111 102 27 117 102 chiseled_deepslate
setblock 27 118 102 soul_lantern
fill 43 111 102 43 117 102 chiseled_deepslate
setblock 43 118 102 soul_lantern
fill 27 111 128 27 117 128 chiseled_deepslate
setblock 27 118 128 soul_lantern
fill 43 111 128 43 117 128 chiseled_deepslate
setblock 43 118 128 soul_lantern
setblock 35 110 115 sculk_catalyst
setblock 35 111 115 sculk_shrieker
setblock 27 111 103 command_block{Command:"function skyblock:summon_boss_5"}
setblock 27 112 103 chiseled_deepslate
setblock 27 113 103 stone_button[face=floor,facing=north]
setblock 28 112 102 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:['{"text":"💠 THÂM UYÊN ĐIỆN 💠","color":"dark_aqua","bold":true}','{"text":"Boss Cấp 5 (2500 HP)","color":"aqua"}','{"text":"Bấm nút trên trụ đá","color":"yellow"}','{"text":"để TRIỆU HỒI BOSS!","color":"red"}']}}
setblock 26 110 101 polished_blackstone_pressure_plate
setblock 26 112 100 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:['{"text":"[ VỀ SẢNH ]","color":"gold","bold":true}','{"text":"Cổng Rút Lui","color":"yellow"}','{"text":"Bước lên đĩa để","color":"aqua"}','{"text":"VỀ SẢNH TRUNG TÂM","color":"green","bold":true}']}}

# 8C. Đại Điện 6: Thiên Cung Sáng Thế (Supreme Boss Tier 6 - Tầng Trời Y=136, X: -18..18, Z: 100..130)
fill -18 136 100 18 136 130 smooth_quartz
fill -15 136 103 15 136 127 quartz_bricks
fill -10 136 108 10 136 122 gold_block
fill -5 136 111 5 136 119 sea_lantern
fill -18 137 100 18 140 100 yellow_stained_glass
fill -18 137 130 18 140 130 yellow_stained_glass
fill -18 137 100 -18 140 130 yellow_stained_glass
fill 18 137 100 18 140 130 yellow_stained_glass
fill -16 137 102 -16 143 102 quartz_pillar
setblock -16 144 102 end_rod
fill 16 137 102 16 143 102 quartz_pillar
setblock 16 144 102 end_rod
fill -16 137 128 -16 143 128 quartz_pillar
setblock -16 144 128 end_rod
fill 16 137 128 16 143 128 quartz_pillar
setblock 16 144 128 end_rod
setblock 0 136 115 beacon
setblock 0 137 103 command_block{Command:"function skyblock:summon_boss_6"}
setblock 0 138 103 gold_block
setblock 0 139 103 stone_button[face=floor,facing=north]
setblock -1 138 102 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:['{"text":"🌌 THIÊN CUNG 🌌","color":"gold","bold":true}','{"text":"Boss Cấp 6 (5000 HP)","color":"yellow"}','{"text":"Bấm nút trên trụ vàng","color":"aqua"}','{"text":"để TRIỆU HỒI BOSS!","color":"red"}']}}
setblock 2 137 101 light_weighted_pressure_plate
setblock 2 138 100 oak_wall_sign[facing=north]{front_text:{has_glowing_text:1b,messages:['{"text":"[ VỀ SẢNH ]","color":"gold","bold":true}','{"text":"Cổng Rút Lui","color":"yellow"}','{"text":"Bước lên đĩa vàng","color":"aqua"}','{"text":"VỀ SẢNH TRUNG TÂM","color":"green","bold":true}']}}

# 9. Thông báo hoàn tất
tellraw @a [{"text":"[Skyblock] ","color":"gold","bold":true},{"text":"Đã khởi tạo thành công ĐẠI ĐIỆN 4 PHÂN KHU BOSS BIỆT LẬP NỐI CẦU XÍCH PARABOL!","color":"green"}]
