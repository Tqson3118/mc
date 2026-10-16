# ==============================================================================
# SKYBLOCK BUILDER - CỐI XAY GIÓ & VỰA LÚA MÌ (WINDMILL & GRANARY)
# ==============================================================================
# Kích thước: 11x11 x H14 block phía trước người chơi
# Chi phí: $20,000 Xu Vault | Cánh quạt khổng lồ, Vựa lúa mì chín vàng, Kiện rơm & Thùng thóc
# ==============================================================================

# 1. Âm thanh kích hoạt & Hiệu ứng
execute at @s run playsound minecraft:block.crop.break master @a ~ ~ ~ 1.5 1.0
execute at @s run playsound minecraft:item.bone_meal.use player @s ~ ~ ~ 1.2 1.1
execute at @s run playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1.2 1.4

# 2. Vườn Lúa Mì Bao Quanh & Nền Móng (11x11 tại Y=-1..0)
execute at @s rotated ~ 0 run fill ^-5 ^-1 ^2 ^5 ^-1 ^12 dirt
execute at @s rotated ~ 0 run fill ^-5 ^0 ^2 ^5 ^0 ^12 farmland[moisture=7]
execute at @s rotated ~ 0 run fill ^-5 ^1 ^2 ^5 ^1 ^12 wheat[age=7]

# Kênh dẫn nước tưới lúa
execute at @s rotated ~ 0 run setblock ^-4 ^0 ^7 water
execute at @s rotated ~ 0 run setblock ^-4 ^1 ^7 lily_pad
execute at @s rotated ~ 0 run setblock ^4 ^0 ^7 water
execute at @s rotated ~ 0 run setblock ^4 ^1 ^7 lily_pad

# Kiện rơm tích trữ quanh cối xay
execute at @s rotated ~ 0 run setblock ^-4 ^1 ^3 hay_block
execute at @s rotated ~ 0 run setblock ^-4 ^2 ^3 hay_block
execute at @s rotated ~ 0 run setblock ^-3 ^1 ^3 hay_block
execute at @s rotated ~ 0 run setblock ^4 ^1 ^11 hay_block
execute at @s rotated ~ 0 run setblock ^3 ^1 ^11 hay_block

# 3. Chân Tháp Cối Xay Gió Đá Cuội (7x7 tại Y=0..3)
execute at @s rotated ~ 0 run fill ^-3 ^0 ^4 ^3 ^0 ^10 stone_bricks
execute at @s rotated ~ 0 run fill ^-3 ^1 ^4 ^3 ^3 ^10 stone_bricks
execute at @s rotated ~ 0 run fill ^-2 ^1 ^5 ^2 ^3 ^9 air

# Cửa vào vựa lúa
execute at @s rotated ~ 0 run setblock ^0 ^1 ^4 oak_door[facing=north,half=lower]
execute at @s rotated ~ 0 run setblock ^0 ^2 ^4 oak_door[facing=north,half=upper]
execute at @s rotated ~ 0 run setblock ^0 ^0 ^3 oak_planks

# 4. Thân Tháp Gỗ Sồi & Thạch Cao (5x5 tại Y=4..8)
execute at @s rotated ~ 0 run fill ^-2 ^4 ^5 ^2 ^8 ^9 oak_planks
execute at @s rotated ~ 0 run fill ^-1 ^4 ^6 ^1 ^8 ^8 air

# Cửa sổ ngắm cảnh
execute at @s rotated ~ 0 run setblock ^-2 ^5 ^7 glass_pane
execute at @s rotated ~ 0 run setblock ^2 ^5 ^7 glass_pane
execute at @s rotated ~ 0 run setblock ^0 ^5 ^9 glass_pane

# 5. Mái Tháp Gỗ & Trục Quay Cối Xay (Y=9..11)
execute at @s rotated ~ 0 run fill ^-3 ^9 ^4 ^3 ^9 ^10 spruce_stairs[facing=south]
execute at @s rotated ~ 0 run fill ^-2 ^10 ^5 ^2 ^10 ^9 spruce_planks
execute at @s rotated ~ 0 run fill ^-1 ^11 ^6 ^1 ^11 ^8 spruce_slab

# 6. 4 Cánh Quạt Cối Xay Gió Vươn Cao (Y=5..13 tại mặt tiền Z=3)
# Trục trung tâm
execute at @s rotated ~ 0 run setblock ^0 ^7 ^4 stripped_oak_log[axis=z]
execute at @s rotated ~ 0 run setblock ^0 ^7 ^3 grindstone[face=wall,facing=south]

# Cánh quạt trên (Y=8..13)
execute at @s rotated ~ 0 run fill ^0 ^8 ^3 ^0 ^12 ^3 oak_fence
execute at @s rotated ~ 0 run fill ^1 ^8 ^3 ^1 ^12 ^3 white_wool

# Cánh quạt dưới (Y=2..6)
execute at @s rotated ~ 0 run fill ^0 ^2 ^3 ^0 ^6 ^3 oak_fence
execute at @s rotated ~ 0 run fill ^-1 ^2 ^3 ^-1 ^6 ^3 white_wool

# Cánh quạt phải (X=1..5)
execute at @s rotated ~ 0 run fill ^1 ^7 ^3 ^5 ^7 ^3 oak_fence
execute at @s rotated ~ 0 run fill ^1 ^8 ^3 ^5 ^8 ^3 white_wool

# Cánh quạt trái (X=-5..-1)
execute at @s rotated ~ 0 run fill ^-5 ^7 ^3 ^-1 ^7 ^3 oak_fence
execute at @s rotated ~ 0 run fill ^-5 ^6 ^3 ^-1 ^6 ^3 white_wool

# 7. Nội Thất Tầng 1: Cối Nghiền Bột, Thùng Lúa Mì & Rương Đồ
execute at @s rotated ~ 0 run setblock ^-1 ^1 ^8 barrel[facing=up]
execute at @s rotated ~ 0 run setblock ^-1 ^2 ^8 barrel[facing=up]
execute at @s rotated ~ 0 run setblock ^1 ^1 ^8 chest[facing=west]
execute at @s rotated ~ 0 run setblock ^0 ^1 ^8 crafting_table
execute at @s rotated ~ 0 run setblock ^0 ^3 ^7 lantern[hanging=true]

# 8. Pháo hoa & Thẻ tag
execute at @s rotated ~ 0 run summon firework_rocket ^0 ^10 ^7 {LifeTime:25,FireworksItem:{id:"firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"burst",colors:[16776960,16753920,65280]}]}}}}

tag @s add built_windmill
tag @s remove built_villa
tag @s remove built_castle
tag @s remove built_modern
tag @s remove built_garden
tag @s remove built_bridge
tag @s remove built_pagoda
tag @s remove built_warehouse
tag @s remove built_greenhouse
tag @s remove built_enchant
tag @s remove built_lighthouse
tag @s remove built_nethergate

tellraw @s [{"text":"\n🌾✨ [KIẾN TRÚC SƯ ĐẢO] ","color":"gold","bold":true},{"text":"Đã thi công hoàn tất ","color":"yellow"},{"text":"Cối Xay Gió & Vựa Lúa Mì!\n","color":"gold","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n","color":"dark_gray"},{"text":"📐 Quy mô: ","color":"aqua"},{"text":"11x11 x H14 blocks | 4 cánh quạt khổng lồ & tháp đá cổ kính\n","color":"white"},{"text":"🍞 Tiện ích: ","color":"green"},{"text":"Vườn lúa mì chín rộ sẵn sàng thu hoạch, kiện rơm, thùng thóc & bàn chế tạo\n","color":"white"},{"text":"🛡️ Hoàn tác: ","color":"gold"},{"text":"Gõ ","color":"gray"},{"text":"/is undo","color":"yellow","bold":true},{"text":" trong 3 phút nếu muốn dỡ bỏ hoàn 90% tiền!\n","color":"gray"},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"}]
