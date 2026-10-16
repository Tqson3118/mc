# ==============================================================================
# SKYBLOCK BUILDER - HẢI ĐĂNG PHA LÊ HƯ KHÔNG (VOID LIGHTHOUSE)
# ==============================================================================
# Kích thước: 9x9 x H18 block phía trước người chơi
# Chi phí: $35,000 Xu Vault | Tháp phát quang xuyên màn đêm, Ban công ngắm mây 360 độ
# Kiến trúc: Tháp sọc đỏ trắng vươn cao, Thang leo có nắp sập ra ban công, Vòm đèn biển Sea Lantern
# ==============================================================================

# 1. Âm thanh kích hoạt & Hiệu ứng
execute at @s run playsound minecraft:block.beacon.activate master @a ~ ~ ~ 1.5 1.0
execute at @s run playsound minecraft:ambient.underwater.loop player @s ~ ~ ~ 1.0 1.2
execute at @s run playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1.2 1.4

# 2. Xóa không gian & Chân đế hải đăng kiên cố (9x9 tại Y=-1..1)
execute at @s rotated ~ 0 run fill ^-4 ^-1 ^2 ^4 ^-1 ^10 prismarine_bricks
execute at @s rotated ~ 0 run fill ^-3 ^0 ^3 ^3 ^0 ^9 dark_prismarine

# Bậc thềm chân đế đá lăng kính
execute at @s rotated ~ 0 run fill ^-4 ^0 ^2 ^4 ^0 ^2 prismarine_brick_stairs[facing=south]
execute at @s rotated ~ 0 run fill ^-4 ^0 ^10 ^4 ^0 ^10 prismarine_brick_stairs[facing=north]
execute at @s rotated ~ 0 run fill ^-4 ^0 ^3 ^-4 ^0 ^9 prismarine_brick_stairs[facing=east]
execute at @s rotated ~ 0 run fill ^4 ^0 ^3 ^4 ^0 ^9 prismarine_brick_stairs[facing=west]

# Dọn sạch lòng tháp (Y=1..11)
execute at @s rotated ~ 0 run fill ^-1 ^1 ^5 ^1 ^11 ^7 air

# 3. THÂN THÁP HẢI ĐĂNG SỌC ĐỎ - TRẮNG VƯƠN CAO (Y=1..11)
# --- Tầng trắng 1 (Y=1..3): Smooth Quartz
execute at @s rotated ~ 0 run fill ^-2 ^1 ^4 ^2 ^3 ^8 smooth_quartz
execute at @s rotated ~ 0 run fill ^-1 ^1 ^5 ^1 ^3 ^7 air

# Cửa vào hải đăng (X=0, Z=4)
execute at @s rotated ~ 0 run setblock ^0 ^1 ^4 air
execute at @s rotated ~ 0 run setblock ^0 ^2 ^4 air
execute at @s rotated ~ 0 run setblock ^0 ^3 ^4 smooth_quartz_stairs[facing=south,half=top]

# --- Tầng đỏ 1 (Y=4..6): Red Concrete
execute at @s rotated ~ 0 run fill ^-2 ^4 ^4 ^2 ^6 ^8 red_concrete
execute at @s rotated ~ 0 run fill ^-1 ^4 ^5 ^1 ^6 ^7 air

# Cửa sổ ngắm mây tầng 1
execute at @s rotated ~ 0 run setblock ^0 ^5 ^4 glass
execute at @s rotated ~ 0 run setblock ^0 ^5 ^8 glass

# --- Tầng trắng 2 (Y=7..9): Smooth Quartz
execute at @s rotated ~ 0 run fill ^-2 ^7 ^4 ^2 ^9 ^8 smooth_quartz
execute at @s rotated ~ 0 run fill ^-1 ^7 ^5 ^1 ^9 ^7 air

# Cửa sổ ngắm mây tầng 2
execute at @s rotated ~ 0 run setblock ^-2 ^8 ^6 glass
execute at @s rotated ~ 0 run setblock ^2 ^8 ^6 glass

# --- Tầng đỏ 2 (Y=10..11): Red Concrete
execute at @s rotated ~ 0 run fill ^-2 ^10 ^4 ^2 ^11 ^8 red_concrete
execute at @s rotated ~ 0 run fill ^-1 ^10 ^5 ^1 ^11 ^7 air

# THANG LEO THẲNG ĐỨNG THÔNG SUỐT (Gắn trên vách Z=7, leo thẳng lên nắp hầm ban công)
execute at @s rotated ~ 0 run fill ^0 ^1 ^7 ^0 ^11 ^7 ladder[facing=north]

# 4. SÀN VỌNG LÂU & BAN CÔNG NGẮM CẢNH 360 ĐỘ (Y=12)
# Mặt sàn ban công mở rộng 7x7
execute at @s rotated ~ 0 run fill ^-3 ^12 ^3 ^3 ^12 ^9 smooth_stone
execute at @s rotated ~ 0 run fill ^-1 ^12 ^5 ^1 ^12 ^7 air

# Cửa nắp sập thông từ thang leo lên sàn ban công (Người chơi trèo lên dễ dàng, không bị cộc đầu)
execute at @s rotated ~ 0 run setblock ^0 ^12 ^7 iron_trapdoor[facing=north,half=bottom,open=false]

# Lan can an toàn bao bọc 360 độ (Y=13)
execute at @s rotated ~ 0 run fill ^-3 ^13 ^3 ^3 ^13 ^3 iron_bars
execute at @s rotated ~ 0 run fill ^-3 ^13 ^9 ^3 ^13 ^9 iron_bars
execute at @s rotated ~ 0 run fill ^-3 ^13 ^4 ^-3 ^13 ^8 iron_bars
execute at @s rotated ~ 0 run fill ^3 ^13 ^4 ^3 ^13 ^8 iron_bars

# 5. BUỒNG ĐÈN BIỂN SEA LANTERN SIÊU SÁNG (Y=13..14)
# Lõi đèn phát quang rực rỡ
execute at @s rotated ~ 0 run fill ^-1 ^13 ^5 ^1 ^14 ^7 sea_lantern
execute at @s rotated ~ 0 run setblock ^0 ^13 ^6 beacon

# Buồng kính cường lực trong suốt bao quanh đèn (Tỏa sáng xuyên màn đêm)
execute at @s rotated ~ 0 run fill ^-2 ^13 ^4 ^2 ^14 ^4 glass
execute at @s rotated ~ 0 run fill ^-2 ^13 ^8 ^2 ^14 ^8 glass
execute at @s rotated ~ 0 run fill ^-2 ^13 ^5 ^-2 ^14 ^7 glass
execute at @s rotated ~ 0 run fill ^2 ^13 ^5 ^2 ^14 ^7 glass

# 4 Cột góc buồng kính
execute at @s rotated ~ 0 run setblock ^-2 ^13 ^4 smooth_quartz
execute at @s rotated ~ 0 run setblock ^2 ^13 ^4 smooth_quartz
execute at @s rotated ~ 0 run setblock ^-2 ^13 ^8 smooth_quartz
execute at @s rotated ~ 0 run setblock ^2 ^13 ^8 smooth_quartz
execute at @s rotated ~ 0 run setblock ^-2 ^14 ^4 smooth_quartz
execute at @s rotated ~ 0 run setblock ^2 ^14 ^4 smooth_quartz
execute at @s rotated ~ 0 run setblock ^-2 ^14 ^8 smooth_quartz
execute at @s rotated ~ 0 run setblock ^2 ^14 ^8 smooth_quartz

# 6. MÁI CHÓP ĐỒNG 4 HƯỚNG & CỘT THU LÔI (Y=15..18)
# Gờ mái đồng dốc 4 phía chuẩn kiến trúc chóp nón
execute at @s rotated ~ 0 run fill ^-2 ^15 ^4 ^2 ^15 ^4 cut_copper_stairs[facing=south]
execute at @s rotated ~ 0 run fill ^-2 ^15 ^8 ^2 ^15 ^8 cut_copper_stairs[facing=north]
execute at @s rotated ~ 0 run fill ^-2 ^15 ^5 ^-2 ^15 ^7 cut_copper_stairs[facing=east]
execute at @s rotated ~ 0 run fill ^2 ^15 ^5 ^2 ^15 ^7 cut_copper_stairs[facing=west]
execute at @s rotated ~ 0 run fill ^-1 ^15 ^5 ^1 ^15 ^7 cut_copper

# Đỉnh chóp thu lôi vươn cao
execute at @s rotated ~ 0 run fill ^-1 ^16 ^5 ^1 ^16 ^7 cut_copper_slab
execute at @s rotated ~ 0 run setblock ^0 ^17 ^6 cut_copper
execute at @s rotated ~ 0 run setblock ^0 ^18 ^6 lightning_rod

# 7. Pháo hoa & Thẻ tag
execute at @s rotated ~ 0 run summon firework_rocket ^0 ^17 ^6 {LifeTime:25,FireworksItem:{id:"firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"burst",colors:[16777215,65535,16711680]}]}}}}

tag @s add built_lighthouse
tag @s remove built_villa
tag @s remove built_castle
tag @s remove built_modern
tag @s remove built_garden
tag @s remove built_bridge
tag @s remove built_pagoda
tag @s remove built_windmill
tag @s remove built_warehouse
tag @s remove built_greenhouse
tag @s remove built_enchant
tag @s remove built_nethergate

tellraw @s [{"text":"\n🏮✨ [KIẾN TRÚC SƯ ĐẢO] ","color":"aqua","bold":true},{"text":"Đã thi công hoàn tất ","color":"yellow"},{"text":"Hải Đăng Pha Lê Hư Không!\n","color":"gold","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n","color":"dark_gray"},{"text":"📐 Quy mô: ","color":"aqua"},{"text":"9x9 x H18 blocks | Tháp sọc đỏ trắng cao vút xé toạc màn đêm\n","color":"white"},{"text":"🔭 Tầm nhìn: ","color":"aqua"},{"text":"Cụm đèn Sea Lantern phát quang buồng kính trong suốt, nắp sập ra ban công 360 độ\n","color":"white"},{"text":"🛡️ Hoàn tác: ","color":"gold"},{"text":"Gõ ","color":"gray"},{"text":"/is undo","color":"yellow","bold":true},{"text":" trong 3 phút nếu muốn dỡ bỏ hoàn 90% tiền!\n","color":"gray"},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"}]
