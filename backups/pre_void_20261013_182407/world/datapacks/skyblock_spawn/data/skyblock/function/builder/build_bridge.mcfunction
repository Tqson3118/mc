# ==============================================================================
# SKYBLOCK BUILDER - CẦU TREO NGHỆ THUẬT VƯỢT HƯ KHÔNG (SUSPENSION BRIDGE)
# ==============================================================================
# Chiều dài: 25 blocks | Rộng: 5 blocks | Cao: 6 blocks vươn thẳng phía trước
# Chi phí: $10,000 Xu Vault | Dây xích treo, Sàn gỗ thông, Đèn lồng an toàn
# ==============================================================================

# 1. Âm thanh kích hoạt & Hiệu ứng
execute at @s run playsound minecraft:block.chain.place master @a ~ ~ ~ 1.5 1.0
execute at @s run playsound minecraft:block.wood.place master @a ~ ~ ~ 1.2 1.0
execute at @s run playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1.2 1.3

# 2. Hai Trụ Cầu Đầu - Cuối (Tại Z=1..2 và Z=24..25)
# Trụ đầu cầu (Z=1)
execute at @s rotated ~ 0 run fill ^-2 ^0 ^1 ^-2 ^5 ^1 deepslate_brick_wall
execute at @s rotated ~ 0 run fill ^2 ^0 ^1 ^2 ^5 ^1 deepslate_brick_wall
execute at @s rotated ~ 0 run setblock ^-2 ^6 ^1 lantern
execute at @s rotated ~ 0 run setblock ^2 ^6 ^1 lantern

# Trụ cuối cầu (Z=25)
execute at @s rotated ~ 0 run fill ^-2 ^0 ^25 ^-2 ^5 ^25 deepslate_brick_wall
execute at @s rotated ~ 0 run fill ^2 ^0 ^25 ^2 ^5 ^25 deepslate_brick_wall
execute at @s rotated ~ 0 run setblock ^-2 ^6 ^25 lantern
execute at @s rotated ~ 0 run setblock ^2 ^6 ^25 lantern

# 3. Sàn Cầu Gỗ Thông (Rộng 3 block ở giữa, Z=1..25 tại Y=0)
execute at @s rotated ~ 0 run fill ^-1 ^0 ^1 ^1 ^0 ^25 spruce_planks

# 4. Lan Can Bảo Vệ An Toàn 2 Bên (X=-2 và X=2, Z=1..25)
execute at @s rotated ~ 0 run fill ^-2 ^1 ^2 ^-2 ^1 ^24 spruce_fence
execute at @s rotated ~ 0 run fill ^2 ^1 ^2 ^2 ^1 ^24 spruce_fence

# 5. Dây Xích Treo Uốn Lượn Đẹp Mắt (Chain Arcs)
# Bên trái (X=-2)
execute at @s rotated ~ 0 run fill ^-2 ^5 ^2 ^-2 ^5 ^4 chain
execute at @s rotated ~ 0 run fill ^-2 ^4 ^5 ^-2 ^4 ^8 chain
execute at @s rotated ~ 0 run fill ^-2 ^3 ^9 ^-2 ^3 ^12 chain
execute at @s rotated ~ 0 run fill ^-2 ^2 ^13 ^-2 ^2 ^14 chain
execute at @s rotated ~ 0 run fill ^-2 ^3 ^15 ^-2 ^3 ^18 chain
execute at @s rotated ~ 0 run fill ^-2 ^4 ^19 ^-2 ^4 ^22 chain
execute at @s rotated ~ 0 run fill ^-2 ^5 ^23 ^-2 ^5 ^24 chain

# Bên phải (X=2)
execute at @s rotated ~ 0 run fill ^2 ^5 ^2 ^2 ^5 ^4 chain
execute at @s rotated ~ 0 run fill ^2 ^4 ^5 ^2 ^4 ^8 chain
execute at @s rotated ~ 0 run fill ^2 ^3 ^9 ^2 ^3 ^12 chain
execute at @s rotated ~ 0 run fill ^2 ^2 ^13 ^2 ^2 ^14 chain
execute at @s rotated ~ 0 run fill ^2 ^3 ^15 ^2 ^3 ^18 chain
execute at @s rotated ~ 0 run fill ^2 ^4 ^19 ^2 ^4 ^22 chain
execute at @s rotated ~ 0 run fill ^2 ^5 ^23 ^2 ^5 ^24 chain

# Đèn lồng treo dọc cầu (Z=7, Z=13, Z=19)
execute at @s rotated ~ 0 run setblock ^-2 ^2 ^7 lantern[hanging=false]
execute at @s rotated ~ 0 run setblock ^2 ^2 ^7 lantern[hanging=false]
execute at @s rotated ~ 0 run setblock ^-2 ^3 ^13 lantern[hanging=false]
execute at @s rotated ~ 0 run setblock ^2 ^3 ^13 lantern[hanging=false]
execute at @s rotated ~ 0 run setblock ^-2 ^2 ^19 lantern[hanging=false]
execute at @s rotated ~ 0 run setblock ^2 ^2 ^19 lantern[hanging=false]

# 6. Pháo hoa & Thẻ tag
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

tellraw @s [{"text":"\n🌉⛓️ [KIẾN TRÚC SƯ ĐẢO] ","color":"aqua","bold":true},{"text":"Đã thi công hoàn tất ","color":"yellow"},{"text":"Cầu Treo Nghệ Thuật Vượt Hư Không!\n","color":"gold","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n","color":"dark_gray"},{"text":"📐 Chiều dài: ","color":"aqua"},{"text":"25 blocks | Nhịp cầu vòm xích thép kiên cố\n","color":"white"},{"text":"🚶 Tiện ích: ","color":"green"},{"text":"Kết nối sang đảo phụ, lan can an toàn & đèn lồng ban đêm\n","color":"white"},{"text":"🛡️ Hoàn tác: ","color":"gold"},{"text":"Gõ ","color":"gray"},{"text":"/is undo","color":"yellow","bold":true},{"text":" trong 3 phút nếu muốn dỡ bỏ hoàn tiền!\n","color":"gray"},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"}]
