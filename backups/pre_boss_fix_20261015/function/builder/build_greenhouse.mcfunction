# ==============================================================================
# SKYBLOCK BUILDER - NHÀ KÍNH SINH THÁI TỰ NHIÊN (ECO GREENHOUSE)
# ==============================================================================
# Kích thước: 13x13 x H8 block phía trước người chơi
# Chi phí: $25,000 Xu Vault | Vòm kính hiện đại thông thoáng, Tổ ong mật, Cà rốt, Khoai tây, Củ dền & Mía
# Kiến trúc: Khung vòm gỗ thông & kính trong suốt, Kênh nước thủy lợi an toàn chống tràn
# ==============================================================================

# 1. Âm thanh kích hoạt & Hiệu ứng
execute at @s run playsound minecraft:block.flowering_azalea.place master @a ~ ~ ~ 1.5 1.0
execute at @s run playsound minecraft:entity.bee.pollinate player @s ~ ~ ~ 1.2 1.2
execute at @s run playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1.2 1.4

# 2. Xóa không gian & Nền móng đá rêu kiên cố (13x13 tại Y=-1..0)
execute at @s rotated ~ 0 run fill ^-6 ^-1 ^2 ^6 ^-1 ^14 mossy_stone_bricks
execute at @s rotated ~ 0 run fill ^-6 ^0 ^2 ^6 ^0 ^14 dirt

# Lối đi giữa lát đá cuội rêu kiên cố (Z=2..14, bao gồm ngưỡng cửa ở Z=2)
execute at @s rotated ~ 0 run fill ^-1 ^0 ^2 ^1 ^0 ^14 mossy_cobblestone

# Dọn sạch lòng nhà kính (Y=1..8)
execute at @s rotated ~ 0 run fill ^-5 ^1 ^3 ^5 ^7 ^13 air

# 3. Khung Trụ Gỗ Thông & Tường Kính Trong Suốt (Y=1..4)
# 4 Cột góc gỗ vân sam bóc vỏ
execute at @s rotated ~ 0 run fill ^-6 ^1 ^2 ^-6 ^5 ^2 stripped_spruce_log
execute at @s rotated ~ 0 run fill ^6 ^1 ^2 ^6 ^5 ^2 stripped_spruce_log
execute at @s rotated ~ 0 run fill ^-6 ^1 ^14 ^-6 ^5 ^14 stripped_spruce_log
execute at @s rotated ~ 0 run fill ^6 ^1 ^14 ^6 ^5 ^14 stripped_spruce_log

# Tường bao kính (Y=1..4) với chân tường đá rêu (Y=1)
execute at @s rotated ~ 0 run fill ^-5 ^1 ^2 ^5 ^1 ^2 mossy_stone_bricks
execute at @s rotated ~ 0 run fill ^-5 ^2 ^2 ^5 ^4 ^2 glass
execute at @s rotated ~ 0 run fill ^-5 ^1 ^14 ^5 ^1 ^14 mossy_stone_bricks
execute at @s rotated ~ 0 run fill ^-5 ^2 ^14 ^5 ^4 ^14 glass
execute at @s rotated ~ 0 run fill ^-6 ^1 ^3 ^-6 ^1 ^13 mossy_stone_bricks
execute at @s rotated ~ 0 run fill ^-6 ^2 ^3 ^-6 ^4 ^13 glass
execute at @s rotated ~ 0 run fill ^6 ^1 ^3 ^6 ^1 ^13 mossy_stone_bricks
execute at @s rotated ~ 0 run fill ^6 ^2 ^3 ^6 ^4 ^13 glass

# Cửa chính gỗ vân sam (X=0, Z=2)
execute at @s rotated ~ 0 run setblock ^0 ^1 ^2 air
execute at @s rotated ~ 0 run setblock ^0 ^2 ^2 air
execute at @s rotated ~ 0 run setblock ^0 ^1 ^2 spruce_door[facing=north,half=lower]
execute at @s rotated ~ 0 run setblock ^0 ^2 ^2 spruce_door[facing=north,half=upper]
execute at @s rotated ~ 0 run setblock ^-1 ^1 ^1 spruce_stairs[facing=south]
execute at @s rotated ~ 0 run setblock ^0 ^1 ^1 spruce_stairs[facing=south]
execute at @s rotated ~ 0 run setblock ^1 ^1 ^1 spruce_stairs[facing=south]

# 4. LUỐNG NÔNG SẢN THỦY LỢI AN TOÀN (KHÔNG TRÀN NƯỚC, KHÔNG RỤNG MÍA)
# --- Luống trái 1: Kênh nước ngầm an toàn & Cà rốt
execute at @s rotated ~ 0 run setblock ^-3 ^0 ^5 water
execute at @s rotated ~ 0 run setblock ^-3 ^1 ^5 lily_pad
execute at @s rotated ~ 0 run fill ^-5 ^0 ^4 ^-4 ^0 ^7 farmland[moisture=7]
execute at @s rotated ~ 0 run fill ^-5 ^1 ^4 ^-4 ^1 ^7 carrots[age=7]

# --- Luống trái 2: Kênh nước ngầm & Khoai tây
execute at @s rotated ~ 0 run setblock ^-3 ^0 ^11 water
execute at @s rotated ~ 0 run setblock ^-3 ^1 ^11 lily_pad
execute at @s rotated ~ 0 run fill ^-5 ^0 ^9 ^-4 ^0 ^12 farmland[moisture=7]
execute at @s rotated ~ 0 run fill ^-5 ^1 ^9 ^-4 ^1 ^12 potatoes[age=7]

# --- Luống phải 1: Củ dền & Dưa hấu
execute at @s rotated ~ 0 run setblock ^3 ^0 ^5 water
execute at @s rotated ~ 0 run setblock ^3 ^1 ^5 lily_pad
execute at @s rotated ~ 0 run fill ^4 ^0 ^4 ^5 ^0 ^7 farmland[moisture=7]
execute at @s rotated ~ 0 run fill ^4 ^1 ^4 ^5 ^1 ^7 beetroots[age=3]
execute at @s rotated ~ 0 run setblock ^4 ^1 ^8 melon
execute at @s rotated ~ 0 run setblock ^5 ^1 ^8 pumpkin

# --- Luống phải 2: Mía nước chuẩn xác (Kênh nước kẹp sát cát, đảm bảo không rụng mía)
execute at @s rotated ~ 0 run fill ^4 ^0 ^9 ^4 ^0 ^12 water
execute at @s rotated ~ 0 run fill ^4 ^1 ^9 ^4 ^1 ^12 lily_pad
execute at @s rotated ~ 0 run fill ^5 ^0 ^9 ^5 ^0 ^12 sand
execute at @s rotated ~ 0 run fill ^5 ^1 ^9 ^5 ^1 ^12 sugar_cane
execute at @s rotated ~ 0 run fill ^5 ^2 ^9 ^5 ^2 ^12 sugar_cane

# 5. KHU NUÔI ONG MẬT & VƯỜN HOA THỤ PHẤN (Vách cuối Z=13)
execute at @s rotated ~ 0 run setblock ^-2 ^2 ^13 beehive[facing=south,honey_level=5]
execute at @s rotated ~ 0 run setblock ^2 ^2 ^13 beehive[facing=south,honey_level=5]
execute at @s rotated ~ 0 run setblock ^-2 ^1 ^13 oak_planks
execute at @s rotated ~ 0 run setblock ^2 ^1 ^13 oak_planks
execute at @s rotated ~ 0 run setblock ^-2 ^1 ^12 rose_bush[half=lower]
execute at @s rotated ~ 0 run setblock ^-2 ^2 ^12 rose_bush[half=upper]
execute at @s rotated ~ 0 run setblock ^2 ^1 ^12 peony[half=lower]
execute at @s rotated ~ 0 run setblock ^2 ^2 ^12 peony[half=upper]
execute at @s rotated ~ 0 run setblock ^-3 ^1 ^13 flowering_azalea
execute at @s rotated ~ 0 run setblock ^3 ^1 ^13 flowering_azalea

# 6. MÁI VÒM KÍNH THÔNG THOÁNG CAO VÚT (Hollow Vaulted Glass Dome Y=5..8)
# Gờ mái viền gỗ & kính Y=5
execute at @s rotated ~ 0 run fill ^-6 ^5 ^2 ^6 ^5 ^2 stripped_spruce_wood
execute at @s rotated ~ 0 run fill ^-6 ^5 ^14 ^6 ^5 ^14 stripped_spruce_wood
execute at @s rotated ~ 0 run fill ^-6 ^5 ^3 ^-6 ^5 ^13 glass
execute at @s rotated ~ 0 run fill ^6 ^5 ^3 ^6 ^5 ^13 glass

# Vòm kính bậc 1 (Y=6, X=±5)
execute at @s rotated ~ 0 run fill ^-5 ^6 ^2 ^5 ^6 ^2 stripped_spruce_wood
execute at @s rotated ~ 0 run fill ^-5 ^6 ^14 ^5 ^6 ^14 stripped_spruce_wood
execute at @s rotated ~ 0 run fill ^-5 ^6 ^3 ^-5 ^6 ^13 glass
execute at @s rotated ~ 0 run fill ^5 ^6 ^3 ^5 ^6 ^13 glass

# Vòm kính bậc 2 (Y=7, X=±3..4)
execute at @s rotated ~ 0 run fill ^-4 ^7 ^3 ^-3 ^7 ^13 glass
execute at @s rotated ~ 0 run fill ^3 ^7 ^3 ^4 ^7 ^13 glass
execute at @s rotated ~ 0 run fill ^-4 ^7 ^2 ^4 ^7 ^2 stripped_spruce_wood
execute at @s rotated ~ 0 run fill ^-4 ^7 ^14 ^4 ^7 ^14 stripped_spruce_wood

# Đỉnh vòm lấy sáng tự nhiên & Đèn Shroomlight quang hợp (Y=8, X=-2..2)
execute at @s rotated ~ 0 run fill ^-2 ^8 ^3 ^2 ^8 ^13 glass
execute at @s rotated ~ 0 run fill ^-2 ^8 ^2 ^2 ^8 ^2 stripped_spruce_wood
execute at @s rotated ~ 0 run fill ^-2 ^8 ^14 ^2 ^8 ^14 stripped_spruce_wood

# Đèn nấm Shroomlight sinh học treo từ đỉnh vòm
execute at @s rotated ~ 0 run setblock ^0 ^7 ^6 shroomlight
execute at @s rotated ~ 0 run setblock ^0 ^7 ^10 shroomlight
execute at @s rotated ~ 0 run setblock ^0 ^6 ^6 lantern[hanging=true]
execute at @s rotated ~ 0 run setblock ^0 ^6 ^10 lantern[hanging=true]

# 7. Pháo hoa & Thẻ tag
execute at @s rotated ~ 0 run summon firework_rocket ^0 ^9 ^8 {LifeTime:25,FireworksItem:{id:"firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"burst",colors:[65280,16776960,3847130]}]}}}}

tag @s add built_greenhouse
tag @s remove built_villa
tag @s remove built_castle
tag @s remove built_modern
tag @s remove built_garden
tag @s remove built_bridge
tag @s remove built_pagoda
tag @s remove built_windmill
tag @s remove built_warehouse
tag @s remove built_enchant
tag @s remove built_lighthouse
tag @s remove built_nethergate

tellraw @s [{"text":"\n🌿✨ [KIẾN TRÚC SƯ ĐẢO] ","color":"green","bold":true},{"text":"Đã thi công hoàn tất ","color":"yellow"},{"text":"Nhà Kính Sinh Thái Tự Nhiên!\n","color":"gold","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n","color":"dark_gray"},{"text":"📐 Quy mô: ","color":"aqua"},{"text":"13x13 x H8 blocks | Mái vòm kính rỗng thông thoáng, ánh sáng chan hòa\n","color":"white"},{"text":"🍯 Nông sản: ","color":"green"},{"text":"Cà rốt, khoai tây, củ dền, dưa hấu, bí ngô, mía nước 2 tầng & 2 tổ ong mật chín\n","color":"white"},{"text":"🛡️ Hoàn tác: ","color":"gold"},{"text":"Gõ ","color":"gray"},{"text":"/is undo","color":"yellow","bold":true},{"text":" trong 3 phút nếu muốn dỡ bỏ hoàn 90% tiền!\n","color":"gray"},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"}]
