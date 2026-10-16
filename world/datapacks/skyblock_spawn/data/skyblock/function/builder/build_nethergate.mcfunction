# ==============================================================================
# SKYBLOCK BUILDER - CỔNG DI TÍCH ĐỊA NGỤC HẮC ĐIỆN (ANCIENT NETHER SHRINE)
# ==============================================================================
# Kích thước: 13x13 x H12 block phía trước người chơi
# Chi phí: $45,000 Xu Vault | Cổng Nether Obsidian nguyên khối, Lửa Linh Hồn & Vạc Dung Nham An Toàn
# Kiến trúc: Đền thờ cổ Hắc Điện Thạch, Khung cổng chuẩn hóa 100% kích hoạt tự nhiên, Không tràn dung nham
# ==============================================================================

# 1. Âm thanh kích hoạt & Hiệu ứng ma quái
execute at @s run playsound minecraft:block.portal.trigger master @a ~ ~ ~ 1.5 1.0
execute at @s run playsound minecraft:entity.wither.spawn player @s ~ ~ ~ 1.0 1.2
execute at @s run playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1.2 1.4

# 2. Xóa không gian & Bệ thờ di tích đá đen cổ kiên cố (13x13 tại Y=-1..1)
execute at @s rotated ~ 0 run fill ^-5 ^-1 ^2 ^5 ^-1 ^14 polished_blackstone_bricks
execute at @s rotated ~ 0 run fill ^-5 ^0 ^2 ^5 ^0 ^14 polished_blackstone
execute at @s rotated ~ 0 run fill ^-3 ^0 ^4 ^3 ^0 ^12 gilded_blackstone

# Lối đi an toàn lát đá đen mài bóng (Không gây bỏng chân người chơi)
execute at @s rotated ~ 0 run fill ^-1 ^0 ^2 ^1 ^0 ^14 polished_blackstone_bricks

# Bậc thang tế lễ 2 đầu
execute at @s rotated ~ 0 run fill ^-4 ^0 ^2 ^4 ^0 ^2 polished_blackstone_brick_stairs[facing=south]
execute at @s rotated ~ 0 run fill ^-4 ^0 ^14 ^4 ^0 ^14 polished_blackstone_brick_stairs[facing=north]

# Dọn sạch lòng đền thờ (Y=1..10)
execute at @s rotated ~ 0 run fill ^-4 ^1 ^3 ^4 ^10 ^13 air

# 3. TRỤ CỘT TÀN TÍCH HẮC ĐIỆN & ĐÈN LINH HỒN AN TOÀN (Y=1..8)
# 4 Trụ Cột Góc Đá Đen Nứt Cổ
execute at @s rotated ~ 0 run fill ^-4 ^1 ^4 ^-4 ^7 ^4 cracked_polished_blackstone_bricks
execute at @s rotated ~ 0 run fill ^4 ^1 ^4 ^4 ^7 ^4 cracked_polished_blackstone_bricks
execute at @s rotated ~ 0 run fill ^-4 ^1 ^12 ^-4 ^7 ^12 cracked_polished_blackstone_bricks
execute at @s rotated ~ 0 run fill ^4 ^1 ^12 ^4 ^7 ^12 cracked_polished_blackstone_bricks

# Gờ đua đỡ xích sắt (Đảm bảo xích gắn vào trụ, không trôi nổi giữa không trung)
execute at @s rotated ~ 0 run setblock ^-4 ^7 ^5 polished_blackstone_brick_stairs[facing=south,half=top]
execute at @s rotated ~ 0 run setblock ^-4 ^6 ^5 chain[axis=y]
execute at @s rotated ~ 0 run setblock ^-4 ^5 ^5 soul_lantern[hanging=true]

execute at @s rotated ~ 0 run setblock ^4 ^7 ^5 polished_blackstone_brick_stairs[facing=south,half=top]
execute at @s rotated ~ 0 run setblock ^4 ^6 ^5 chain[axis=y]
execute at @s rotated ~ 0 run setblock ^4 ^5 ^5 soul_lantern[hanging=true]

execute at @s rotated ~ 0 run setblock ^-4 ^7 ^11 polished_blackstone_brick_stairs[facing=north,half=top]
execute at @s rotated ~ 0 run setblock ^-4 ^6 ^11 chain[axis=y]
execute at @s rotated ~ 0 run setblock ^-4 ^5 ^11 soul_lantern[hanging=true]

execute at @s rotated ~ 0 run setblock ^4 ^7 ^11 polished_blackstone_brick_stairs[facing=north,half=top]
execute at @s rotated ~ 0 run setblock ^4 ^6 ^11 chain[axis=y]
execute at @s rotated ~ 0 run setblock ^4 ^5 ^11 soul_lantern[hanging=true]

# 4. KHUNG CỔNG NETHER OBSIDIAN CHUẨN XÁC VÀNG SON (Y=1..7, Z=8)
# Khung Obsidian nguyên khối tiêu chuẩn (Rộng 4 lòng trong, Cao 4 lòng trong)
# Chân cổng (Y=1)
execute at @s rotated ~ 0 run fill ^-2 ^1 ^8 ^2 ^1 ^8 obsidian
execute at @s rotated ~ 0 run setblock ^-3 ^1 ^8 crying_obsidian
execute at @s rotated ~ 0 run setblock ^3 ^1 ^8 crying_obsidian

# Hai cột đứng cổng (Y=2..5)
execute at @s rotated ~ 0 run fill ^-3 ^2 ^8 ^-3 ^5 ^8 obsidian
execute at @s rotated ~ 0 run fill ^3 ^2 ^8 ^3 ^5 ^8 obsidian

# Đỉnh cổng vòm (Y=6)
execute at @s rotated ~ 0 run fill ^-2 ^6 ^8 ^2 ^6 ^8 obsidian
execute at @s rotated ~ 0 run setblock ^-3 ^6 ^8 crying_obsidian
execute at @s rotated ~ 0 run setblock ^3 ^6 ^8 crying_obsidian

# Trang trí phù điêu vòm trên đỉnh cổng (Y=7..9)
execute at @s rotated ~ 0 run fill ^-2 ^7 ^8 ^2 ^7 ^8 gilded_blackstone
execute at @s rotated ~ 0 run setblock ^0 ^8 ^8 crying_obsidian
execute at @s rotated ~ 0 run setblock ^0 ^9 ^8 lodestone

# Kích hoạt màn cổng Nether tự nhiên bằng ngọn lửa ma thuật
execute at @s rotated ~ 0 run setblock ^0 ^2 ^8 fire

# 5. VẠC DUNG NHAM AN TOÀN & LỬA LINH HỒN TẾ LỄ (CHỐNG TRÀN DUNG NHAM 100%)
# Vạc chứa dung nham phong cách lò tế cổ (Không bao giờ chảy tràn ra đảo hay đốt gỗ của người chơi)
execute at @s rotated ~ 0 run setblock ^-3 ^1 ^6 cauldron
execute at @s rotated ~ 0 run setblock ^3 ^1 ^6 cauldron
execute at @s rotated ~ 0 run setblock ^-3 ^1 ^10 cauldron
execute at @s rotated ~ 0 run setblock ^3 ^1 ^10 cauldron
execute at @s rotated ~ 0 run setblock ^-3 ^1 ^6 lava_cauldron
execute at @s rotated ~ 0 run setblock ^3 ^1 ^6 lava_cauldron
execute at @s rotated ~ 0 run setblock ^-3 ^1 ^10 lava_cauldron
execute at @s rotated ~ 0 run setblock ^3 ^1 ^10 lava_cauldron

# Lửa linh hồn tế lễ trên bục đá đen
execute at @s rotated ~ 0 run setblock ^-1 ^1 ^5 soul_campfire
execute at @s rotated ~ 0 run setblock ^1 ^1 ^5 soul_campfire
execute at @s rotated ~ 0 run setblock ^-1 ^1 ^11 soul_campfire
execute at @s rotated ~ 0 run setblock ^1 ^1 ^11 soul_campfire

# Cọc tế lễ đầu lâu Wither Skeleton
execute at @s rotated ~ 0 run setblock ^-3 ^1 ^4 nether_brick_fence
execute at @s rotated ~ 0 run setblock ^-3 ^2 ^4 wither_skeleton_skull[rotation=8]
execute at @s rotated ~ 0 run setblock ^3 ^1 ^4 nether_brick_fence
execute at @s rotated ~ 0 run setblock ^3 ^2 ^4 wither_skeleton_skull[rotation=8]

# Khóm nấm địa ngục Crimson & Warped cổ xưa
execute at @s rotated ~ 0 run setblock ^-4 ^1 ^8 warped_nylium
execute at @s rotated ~ 0 run setblock ^-4 ^2 ^8 warped_fungus
execute at @s rotated ~ 0 run setblock ^4 ^1 ^8 crimson_nylium
execute at @s rotated ~ 0 run setblock ^4 ^2 ^8 crimson_fungus

# 6. Pháo hoa & Thẻ tag
execute at @s rotated ~ 0 run summon firework_rocket ^0 ^9 ^8 {LifeTime:25,FireworksItem:{id:"firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"burst",colors:[16711680,11141375,0]}]}}}}

tag @s add built_nethergate
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
tag @s remove built_lighthouse

tellraw @s [{"text":"\n🔥✨ [KIẾN TRÚC SƯ ĐẢO] ","color":"dark_red","bold":true},{"text":"Đã thi công hoàn tất ","color":"yellow"},{"text":"Cổng Di Tích Địa Ngục Hắc Điện!\n","color":"gold","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n","color":"dark_gray"},{"text":"📐 Quy mô: ","color":"aqua"},{"text":"13x13 x H12 blocks | Hắc diện thạch nguyên khối & Vạc dung nham an toàn\n","color":"white"},{"text":"👹 Huyền bí: ","color":"red"},{"text":"Cổng Nether kích hoạt chuẩn xác, ngọn lửa linh hồn vĩnh cửu & đầu lâu Wither\n","color":"white"},{"text":"🛡️ Hoàn tác: ","color":"gold"},{"text":"Gõ ","color":"gray"},{"text":"/is undo","color":"yellow","bold":true},{"text":" trong 3 phút nếu muốn dỡ bỏ hoàn 90% tiền!\n","color":"gray"},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"}]
