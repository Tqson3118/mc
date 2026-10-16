# ==============================================================================
# SKYBLOCK BUILDER - CẦU TREO NGHỆ THUẬT VƯỢT HƯ KHÔNG (SUSPENSION BRIDGE)
# ==============================================================================
# Chiều dài: 25 blocks | Rộng: 5 blocks | Cao: 7 blocks vươn thẳng phía trước
# Chi phí: $10,000 Xu Vault | Cáp xích thép liên tục axis=z, Tháp cầu Deepslate kiên cố, Đèn treo an toàn
# Kiến trúc: Cầu treo dây võng chịu lực thực thụ, Không còn đèn rơi rớt hay xích đứt đoạn
# ==============================================================================

# 1. Âm thanh kích hoạt & Hiệu ứng
execute at @s run playsound minecraft:block.chain.place master @a ~ ~ ~ 1.5 1.0
execute at @s run playsound minecraft:block.wood.place master @a ~ ~ ~ 1.2 1.0
execute at @s run playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1.2 1.3

# 2. Xóa không gian cầu & Sàn cầu vươn dài (25 blocks: X=-2..2, Z=1..25, Y=-1..7)
execute at @s rotated ~ 0 run fill ^-2 ^1 ^1 ^2 ^7 ^25 air

# Sàn cầu gỗ vân sam rộng rãi (X=-1..1, Z=1..25 tại Y=0)
execute at @s rotated ~ 0 run fill ^-1 ^0 ^1 ^1 ^0 ^25 spruce_planks
execute at @s rotated ~ 0 run fill ^-2 ^0 ^1 ^-2 ^0 ^25 dark_oak_slab[type=bottom]
execute at @s rotated ~ 0 run fill ^2 ^0 ^1 ^2 ^0 ^25 dark_oak_slab[type=bottom]

# Dầm chịu lực dưới gầm cầu (Y=-1 tại các nhịp chịu lực)
execute at @s rotated ~ 0 run fill ^-2 ^-1 ^2 ^2 ^-1 ^2 stripped_spruce_wood
execute at @s rotated ~ 0 run fill ^-2 ^-1 ^8 ^2 ^-1 ^8 stripped_spruce_wood
execute at @s rotated ~ 0 run fill ^-2 ^-1 ^13 ^2 ^-1 ^13 stripped_spruce_wood
execute at @s rotated ~ 0 run fill ^-2 ^-1 ^18 ^2 ^-1 ^18 stripped_spruce_wood
execute at @s rotated ~ 0 run fill ^-2 ^-1 ^24 ^2 ^-1 ^24 stripped_spruce_wood

# 3. HAI THÁP CẦU TREO ĐẦU - CUỐI (Pylons tại Z=2 và Z=24)
# --- Tháp đầu cầu (Z=2)
execute at @s rotated ~ 0 run fill ^-2 ^0 ^2 ^-2 ^5 ^2 deepslate_tiles
execute at @s rotated ~ 0 run fill ^2 ^0 ^2 ^2 ^5 ^2 deepslate_tiles
execute at @s rotated ~ 0 run setblock ^-2 ^6 ^2 chiseled_deepslate
execute at @s rotated ~ 0 run setblock ^2 ^6 ^2 chiseled_deepslate
execute at @s rotated ~ 0 run fill ^-1 ^6 ^2 ^1 ^6 ^2 deepslate_tile_stairs[facing=south,half=top]
execute at @s rotated ~ 0 run setblock ^-2 ^7 ^2 lantern[hanging=false]
execute at @s rotated ~ 0 run setblock ^2 ^7 ^2 lantern[hanging=false]

# --- Tháp cuối cầu (Z=24)
execute at @s rotated ~ 0 run fill ^-2 ^0 ^24 ^-2 ^5 ^24 deepslate_tiles
execute at @s rotated ~ 0 run fill ^2 ^0 ^24 ^2 ^5 ^24 deepslate_tiles
execute at @s rotated ~ 0 run setblock ^-2 ^6 ^24 chiseled_deepslate
execute at @s rotated ~ 0 run setblock ^2 ^6 ^24 chiseled_deepslate
execute at @s rotated ~ 0 run fill ^-1 ^6 ^24 ^1 ^6 ^24 deepslate_tile_stairs[facing=north,half=top]
execute at @s rotated ~ 0 run setblock ^-2 ^7 ^24 lantern[hanging=false]
execute at @s rotated ~ 0 run setblock ^2 ^7 ^24 lantern[hanging=false]

# 4. LAN CAN AN TOÀN SUỐT CHIỀU DÀI CẦU (Y=1)
execute at @s rotated ~ 0 run fill ^-2 ^1 ^1 ^-2 ^1 ^25 spruce_fence
execute at @s rotated ~ 0 run fill ^2 ^1 ^1 ^2 ^1 ^25 spruce_fence

# 5. DÂY XÍCH TREO CHỊU LỰC LIÊN TỤC (Catenary Cable Axis=Z)
# --- Cáp treo bên trái (X=-2)
execute at @s rotated ~ 0 run fill ^-2 ^5 ^3 ^-2 ^5 ^4 chain[axis=z]
execute at @s rotated ~ 0 run fill ^-2 ^4 ^5 ^-2 ^4 ^7 chain[axis=z]
execute at @s rotated ~ 0 run fill ^-2 ^3 ^8 ^-2 ^3 ^11 chain[axis=z]
execute at @s rotated ~ 0 run fill ^-2 ^2 ^12 ^-2 ^2 ^14 chain[axis=z]
execute at @s rotated ~ 0 run fill ^-2 ^3 ^15 ^-2 ^3 ^18 chain[axis=z]
execute at @s rotated ~ 0 run fill ^-2 ^4 ^19 ^-2 ^4 ^21 chain[axis=z]
execute at @s rotated ~ 0 run fill ^-2 ^5 ^22 ^-2 ^5 ^23 chain[axis=z]

# --- Cáp treo bên phải (X=2)
execute at @s rotated ~ 0 run fill ^2 ^5 ^3 ^2 ^5 ^4 chain[axis=z]
execute at @s rotated ~ 0 run fill ^2 ^4 ^5 ^2 ^4 ^7 chain[axis=z]
execute at @s rotated ~ 0 run fill ^2 ^3 ^8 ^2 ^3 ^11 chain[axis=z]
execute at @s rotated ~ 0 run fill ^2 ^2 ^12 ^2 ^2 ^14 chain[axis=z]
execute at @s rotated ~ 0 run fill ^2 ^3 ^15 ^2 ^3 ^18 chain[axis=z]
execute at @s rotated ~ 0 run fill ^2 ^4 ^19 ^2 ^4 ^21 chain[axis=z]
execute at @s rotated ~ 0 run fill ^2 ^5 ^22 ^2 ^5 ^23 chain[axis=z]

# --- Dây xích thả đứng liên kết cáp chính xuống lan can (axis=y)
execute at @s rotated ~ 0 run setblock ^-2 ^3 ^6 chain[axis=y]
execute at @s rotated ~ 0 run setblock ^-2 ^2 ^6 chain[axis=y]
execute at @s rotated ~ 0 run setblock ^2 ^3 ^6 chain[axis=y]
execute at @s rotated ~ 0 run setblock ^2 ^2 ^6 chain[axis=y]

execute at @s rotated ~ 0 run setblock ^-2 ^2 ^10 chain[axis=y]
execute at @s rotated ~ 0 run setblock ^2 ^2 ^10 chain[axis=y]

execute at @s rotated ~ 0 run setblock ^-2 ^2 ^16 chain[axis=y]
execute at @s rotated ~ 0 run setblock ^2 ^2 ^16 chain[axis=y]

execute at @s rotated ~ 0 run setblock ^-2 ^3 ^20 chain[axis=y]
execute at @s rotated ~ 0 run setblock ^-2 ^2 ^20 chain[axis=y]
execute at @s rotated ~ 0 run setblock ^2 ^3 ^20 chain[axis=y]
execute at @s rotated ~ 0 run setblock ^2 ^2 ^20 chain[axis=y]

# 6. ĐÈN LỒNG CHIẾU SÁNG TREO AN TOÀN (Gắn trên đầu cọc lan can kiên cố, không bị rụng)
execute at @s rotated ~ 0 run setblock ^-2 ^2 ^8 lantern[hanging=false]
execute at @s rotated ~ 0 run setblock ^2 ^2 ^8 lantern[hanging=false]
execute at @s rotated ~ 0 run setblock ^-2 ^2 ^13 lantern[hanging=false]
execute at @s rotated ~ 0 run setblock ^2 ^2 ^13 lantern[hanging=false]
execute at @s rotated ~ 0 run setblock ^-2 ^2 ^18 lantern[hanging=false]
execute at @s rotated ~ 0 run setblock ^2 ^2 ^18 lantern[hanging=false]

# 7. Pháo hoa & Thẻ tag
execute at @s rotated ~ 0 run summon firework_rocket ^0 ^5 ^13 {LifeTime:20,FireworksItem:{id:"firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"burst",colors:[16755200,65535,16776960]}]}}}}

tag @s add built_bridge
tag @s remove built_villa
tag @s remove built_castle
tag @s remove built_modern
tag @s remove built_pagoda
tag @s remove built_windmill
tag @s remove built_warehouse
tag @s remove built_greenhouse
tag @s remove built_garden
tag @s remove built_enchant
tag @s remove built_lighthouse
tag @s remove built_nethergate

tellraw @s [{"text":"\n🌉⛓️ [KIẾN TRÚC SƯ ĐẢO] ","color":"aqua","bold":true},{"text":"Đã thi công hoàn tất ","color":"yellow"},{"text":"Cầu Treo Nghệ Thuật Vượt Hư Không!\n","color":"gold","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n","color":"dark_gray"},{"text":"📐 Chiều dài: ","color":"aqua"},{"text":"25 blocks | Tháp cầu Deepslate & Dây cáp xích thép vòm liên tục\n","color":"white"},{"text":"🚶 Tiện ích: ","color":"green"},{"text":"Lan can an toàn tuyệt đối, đèn lồng gắn trụ vững chắc không rơi rụng\n","color":"white"},{"text":"🛡️ Hoàn tác: ","color":"gold"},{"text":"Gõ ","color":"gray"},{"text":"/is undo","color":"yellow","bold":true},{"text":" trong 3 phút nếu muốn dỡ bỏ hoàn tiền!\n","color":"gray"},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"}]
