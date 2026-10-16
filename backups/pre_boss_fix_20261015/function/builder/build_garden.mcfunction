# ==============================================================================
# SKYBLOCK BUILDER - VƯỜN HOA ZEN & SUỐI NƯỚC THƯ GIÃN (ZEN FLORA & WATER GARDEN)
# ==============================================================================
# Kích thước: 15x15 x H8 block phía trước mặt người chơi
# Chi phí: $15,000 Xu Vault | Hồ sen, Cầu gỗ thông chân cọc chịu lực, Cây anh đào, Đèn đá thiền
# Kiến trúc: Phong cách sân vườn Nhật Bản Zen, Không có khối trôi nổi, Hồ nước viền đá sâu
# ==============================================================================

# 1. Âm thanh kích hoạt & Hiệu ứng thiên nhiên
execute at @s run playsound minecraft:block.grass.place master @a ~ ~ ~ 1.5 1.0
execute at @s run playsound minecraft:ambient.underwater.enter master @a ~ ~ ~ 1.0 1.2
execute at @s run playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1.2 1.4

# 2. Xóa không gian & Nền móng thảm cỏ rêu tươi mát (15x15 tại Y=-1..0)
execute at @s rotated ~ 0 run fill ^-7 ^-1 ^2 ^7 ^-1 ^16 dirt
execute at @s rotated ~ 0 run fill ^-7 ^0 ^2 ^7 ^0 ^16 moss_block

# Lối đi thiền rải đá sỏi mài tự nhiên (Z=2..6)
execute at @s rotated ~ 0 run fill ^-1 ^0 ^2 ^1 ^0 ^6 mossy_stone_bricks

# Viền đá rêu tự nhiên quanh vườn (Y=1)
execute at @s rotated ~ 0 run fill ^-7 ^1 ^2 ^7 ^1 ^2 mossy_stone_brick_wall
execute at @s rotated ~ 0 run fill ^-7 ^1 ^16 ^7 ^1 ^16 mossy_stone_brick_wall
execute at @s rotated ~ 0 run fill ^-7 ^1 ^3 ^-7 ^1 ^15 mossy_stone_brick_wall
execute at @s rotated ~ 0 run fill ^7 ^1 ^3 ^7 ^1 ^15 mossy_stone_brick_wall

# Cổng vào vườn mở rộng (X=-1..1, Z=2)
execute at @s rotated ~ 0 run setblock ^-1 ^1 ^2 air
execute at @s rotated ~ 0 run setblock ^0 ^1 ^2 air
execute at @s rotated ~ 0 run setblock ^1 ^1 ^2 air
execute at @s rotated ~ 0 run setblock ^0 ^0 ^1 mossy_stone_brick_stairs[facing=south]

# 3. HỒ NƯỚC SUỐI ZEN NHÂN TẠO (Lòng hồ âm sâu, không khối trôi nổi)
execute at @s rotated ~ 0 run fill ^-4 ^-1 ^7 ^4 ^-1 ^11 prismarine_bricks
execute at @s rotated ~ 0 run fill ^-3 ^0 ^7 ^3 ^0 ^11 water

# Hoa súng & Dưa biển phát sáng trong nước
execute at @s rotated ~ 0 run setblock ^-2 ^1 ^8 lily_pad
execute at @s rotated ~ 0 run setblock ^2 ^1 ^8 lily_pad
execute at @s rotated ~ 0 run setblock ^-2 ^1 ^10 lily_pad
execute at @s rotated ~ 0 run setblock ^2 ^1 ^10 lily_pad
execute at @s rotated ~ 0 run setblock ^-2 ^-1 ^9 sea_pickle[waterlogged=true,pickles=3]
execute at @s rotated ~ 0 run setblock ^2 ^-1 ^9 sea_pickle[waterlogged=true,pickles=3]

# 4. CẦU GỖ THÔNG CÓ CHÂN CỌC CHỊU LỰC KIÊN CỐ (X=0, Z=6..12)
# Chân cọc cầu cắm thẳng xuống đáy hồ (Loại bỏ triệt để lỗi hàng rào trôi nổi trên nước)
execute at @s rotated ~ 0 run fill ^-1 ^-1 ^7 ^-1 ^1 ^7 stripped_spruce_log
execute at @s rotated ~ 0 run fill ^1 ^-1 ^7 ^1 ^1 ^7 stripped_spruce_log
execute at @s rotated ~ 0 run fill ^-1 ^-1 ^9 ^-1 ^1 ^9 stripped_spruce_log
execute at @s rotated ~ 0 run fill ^1 ^-1 ^9 ^1 ^1 ^9 stripped_spruce_log
execute at @s rotated ~ 0 run fill ^-1 ^-1 ^11 ^-1 ^1 ^11 stripped_spruce_log
execute at @s rotated ~ 0 run fill ^1 ^-1 ^11 ^1 ^1 ^11 stripped_spruce_log

# Mặt sàn cầu uốn vòm tao nhã
execute at @s rotated ~ 0 run setblock ^0 ^1 ^6 spruce_stairs[facing=south]
execute at @s rotated ~ 0 run setblock ^0 ^2 ^7 spruce_stairs[facing=south]
execute at @s rotated ~ 0 run fill ^0 ^2 ^8 ^0 ^2 ^10 spruce_slab[type=top]
execute at @s rotated ~ 0 run setblock ^0 ^2 ^11 spruce_stairs[facing=north]
execute at @s rotated ~ 0 run setblock ^0 ^1 ^12 spruce_stairs[facing=north]

# Lan can an toàn 2 bên thành cầu đặt vững chắc trên các chân cọc
execute at @s rotated ~ 0 run fill ^-1 ^2 ^7 ^-1 ^2 ^11 spruce_fence
execute at @s rotated ~ 0 run fill ^1 ^2 ^7 ^1 ^2 ^11 spruce_fence

# Đèn lồng đặt vững chãi trên đầu cọc lan can giữa cầu
execute at @s rotated ~ 0 run setblock ^-1 ^3 ^9 lantern[hanging=false]
execute at @s rotated ~ 0 run setblock ^1 ^3 ^9 lantern[hanging=false]

# 5. CÂY HOA ANH ĐÀO BONSAI THIÊN NHIÊN (Góc vườn X=-4, Z=13)
# Thân & cành cây uốn lượn tự nhiên
execute at @s rotated ~ 0 run fill ^-4 ^1 ^13 ^-4 ^3 ^13 cherry_log[axis=y]
execute at @s rotated ~ 0 run setblock ^-4 ^4 ^13 cherry_wood
execute at @s rotated ~ 0 run setblock ^-3 ^4 ^13 cherry_wood
execute at @s rotated ~ 0 run setblock ^-5 ^4 ^13 cherry_wood
execute at @s rotated ~ 0 run setblock ^-4 ^4 ^14 cherry_wood
execute at @s rotated ~ 0 run setblock ^-4 ^5 ^13 cherry_log[axis=y]

# Tán lá hoa anh đào sum sê phủ bóng
execute at @s rotated ~ 0 run fill ^-6 ^4 ^11 ^-2 ^5 ^15 cherry_leaves
execute at @s rotated ~ 0 run fill ^-5 ^6 ^12 ^-3 ^6 ^14 cherry_leaves
execute at @s rotated ~ 0 run setblock ^-4 ^7 ^13 cherry_leaves

# Đèn lồng treo thanh nhã dưới cành anh đào (Treo dưới khối cành thật, không đục thủng thân cây)
execute at @s rotated ~ 0 run setblock ^-3 ^3 ^13 lantern[hanging=true]
execute at @s rotated ~ 0 run setblock ^-4 ^1 ^12 pink_petals[flower_amount=4]
execute at @s rotated ~ 0 run setblock ^-5 ^1 ^13 pink_petals[flower_amount=3]

# 6. KHÓM HOA ZEN & ĐÈN ĐÁ NHẬT BẢN (TORO STONE LANTERNS)
# Cụm hoa thanh nhã góc phải
execute at @s rotated ~ 0 run setblock ^4 ^1 ^5 flowering_azalea
execute at @s rotated ~ 0 run setblock ^5 ^1 ^6 peony[half=lower]
execute at @s rotated ~ 0 run setblock ^5 ^2 ^6 peony[half=upper]
execute at @s rotated ~ 0 run setblock ^3 ^1 ^4 rose_bush[half=lower]
execute at @s rotated ~ 0 run setblock ^3 ^2 ^4 rose_bush[half=upper]
execute at @s rotated ~ 0 run setblock ^4 ^1 ^13 flowering_azalea
execute at @s rotated ~ 0 run setblock ^5 ^1 ^14 azalea

# Đèn đá Nhật Bản nghệ thuật (Toro)
execute at @s rotated ~ 0 run setblock ^5 ^1 ^14 chiseled_stone_bricks
execute at @s rotated ~ 0 run setblock ^5 ^2 ^14 cobblestone_wall
execute at @s rotated ~ 0 run setblock ^5 ^3 ^14 soul_lantern[hanging=false]

execute at @s rotated ~ 0 run setblock ^-5 ^1 ^4 chiseled_stone_bricks
execute at @s rotated ~ 0 run setblock ^-5 ^2 ^4 cobblestone_wall
execute at @s rotated ~ 0 run setblock ^-5 ^3 ^4 soul_lantern[hanging=false]

# 7. Pháo hoa & Thẻ tag
execute at @s rotated ~ 0 run summon firework_rocket ^0 ^6 ^9 {LifeTime:20,FireworksItem:{id:"firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"burst",has_twinkle:1b,colors:[65280,16737975,16777215]}]}}}}

tag @s add built_garden
tag @s remove built_villa
tag @s remove built_castle
tag @s remove built_modern
tag @s remove built_pagoda
tag @s remove built_windmill
tag @s remove built_warehouse
tag @s remove built_greenhouse
tag @s remove built_enchant
tag @s remove built_lighthouse
tag @s remove built_nethergate
tag @s remove built_bridge

tellraw @s [{"text":"\n🌸🌿 [KIẾN TRÚC SƯ ĐẢO] ","color":"green","bold":true},{"text":"Đã thi công hoàn tất ","color":"yellow"},{"text":"Vườn Hoa Zen & Suối Nước Thư Giãn!\n","color":"light_purple","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n","color":"dark_gray"},{"text":"📐 Quy mô: ","color":"aqua"},{"text":"15x15 x H8 blocks | Thảm cỏ rêu ngát xanh, chân cọc gỗ chịu lực\n","color":"white"},{"text":"🌊 Cảnh quan: ","color":"green"},{"text":"Hồ sen ngắm trăng, cầu vòm có lan can an toàn & cây anh đào rủ bóng\n","color":"white"},{"text":"🛡️ Hoàn tác: ","color":"gold"},{"text":"Gõ ","color":"gray"},{"text":"/is undo","color":"yellow","bold":true},{"text":" trong 3 phút nếu muốn dỡ bỏ hoàn tiền!\n","color":"gray"},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"}]
