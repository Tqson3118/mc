# ==============================================================================
# SKYBLOCK BUILDER - CUNG ĐIỆN LƯU LY CHÂN KHÔNG HOÀNG GIA (CELESTIAL SKY PALACE)
# Kích thước: 19x19 x H16 blocks | Chi phí: $100,000 Xu Vault
# ==============================================================================
execute at @s run playsound minecraft:block.beacon.activate master @a ~ ~ ~ 1.5 1.2
execute at @s run playsound minecraft:ui.toast.challenge_complete player @s ~ ~ ~ 1.2 1.2

# 1. Nền móng & Bậc thềm Cẩm Thạch Vàng (19x19 tại Y=-1..0)
execute at @s rotated ~ 0 run fill ^-9 ^-1 ^2 ^9 ^15 ^20 air
execute at @s rotated ~ 0 run fill ^-9 ^-1 ^2 ^9 ^-1 ^20 polished_blackstone_bricks
execute at @s rotated ~ 0 run fill ^-8 ^0 ^3 ^8 ^0 ^19 smooth_quartz
execute at @s rotated ~ 0 run fill ^-6 ^0 ^5 ^6 ^0 ^17 chiseled_quartz_block
execute at @s rotated ~ 0 run fill ^-2 ^0 ^3 ^2 ^0 ^19 yellow_carpet

# Bậc tam cấp thạch anh 4 phía
execute at @s rotated ~ 0 run fill ^-9 ^0 ^2 ^9 ^0 ^2 smooth_quartz_stairs[facing=south]
execute at @s rotated ~ 0 run fill ^-9 ^0 ^20 ^9 ^0 ^20 smooth_quartz_stairs[facing=north]
execute at @s rotated ~ 0 run fill ^-9 ^0 ^3 ^-9 ^0 ^19 smooth_quartz_stairs[facing=east]
execute at @s rotated ~ 0 run fill ^9 ^0 ^3 ^9 ^0 ^19 smooth_quartz_stairs[facing=west]

# 2. 8 Đại Trụ Thạch Anh Khảm Vàng Hoàng Gia (Y=1..7)
execute at @s rotated ~ 0 run fill ^-7 ^1 ^4 ^-7 ^7 ^4 quartz_pillar
execute at @s rotated ~ 0 run fill ^7 ^1 ^4 ^7 ^7 ^4 quartz_pillar
execute at @s rotated ~ 0 run fill ^-7 ^1 ^18 ^-7 ^7 ^18 quartz_pillar
execute at @s rotated ~ 0 run fill ^7 ^1 ^18 ^7 ^7 ^18 quartz_pillar
execute at @s rotated ~ 0 run fill ^-7 ^1 ^11 ^-7 ^7 ^11 quartz_pillar
execute at @s rotated ~ 0 run fill ^7 ^1 ^11 ^7 ^7 ^11 quartz_pillar
execute at @s rotated ~ 0 run setblock ^-7 ^4 ^4 gold_block
execute at @s rotated ~ 0 run setblock ^7 ^4 ^4 gold_block
execute at @s rotated ~ 0 run setblock ^-7 ^4 ^18 gold_block
execute at @s rotated ~ 0 run setblock ^7 ^4 ^18 gold_block

# Tường Kính Ngọc Bích & Khung Vàng (Y=1..6)
execute at @s rotated ~ 0 run fill ^-6 ^1 ^18 ^6 ^6 ^18 cyan_stained_glass
execute at @s rotated ~ 0 run fill ^-7 ^1 ^5 ^-7 ^6 ^17 cyan_stained_glass
execute at @s rotated ~ 0 run fill ^7 ^1 ^5 ^7 ^6 ^17 cyan_stained_glass

# 3. Đài Phun Nước Pha Lê Trung Tâm & Ngai Vàng Thiên Đế
execute at @s rotated ~ 0 run fill ^-2 ^0 ^9 ^2 ^0 ^13 sea_lantern
execute at @s rotated ~ 0 run setblock ^0 ^1 ^11 amethyst_block
execute at @s rotated ~ 0 run setblock ^0 ^2 ^11 end_rod
execute at @s rotated ~ 0 run fill ^-3 ^1 ^15 ^3 ^1 ^17 gold_block
execute at @s rotated ~ 0 run setblock ^0 ^2 ^16 smooth_quartz_stairs[facing=north]
execute at @s rotated ~ 0 run setblock ^-2 ^2 ^16 ender_chest[facing=north]
execute at @s rotated ~ 0 run setblock ^2 ^2 ^16 enchanting_table

# 4. Mái Vòm Lưu Ly 3 Tầng Cong Vút (Dark Prismarine & Gold Trim Y=7..14)
execute at @s rotated ~ 0 run fill ^-9 ^7 ^2 ^9 ^7 ^20 dark_prismarine_slab
execute at @s rotated ~ 0 run fill ^-8 ^8 ^3 ^8 ^8 ^19 dark_prismarine
execute at @s rotated ~ 0 run fill ^-6 ^9 ^5 ^6 ^9 ^17 smooth_quartz
execute at @s rotated ~ 0 run fill ^-7 ^10 ^4 ^7 ^10 ^18 dark_prismarine_slab
execute at @s rotated ~ 0 run fill ^-5 ^11 ^6 ^5 ^11 ^16 dark_prismarine
execute at @s rotated ~ 0 run fill ^-3 ^12 ^8 ^3 ^12 ^14 gold_block
execute at @s rotated ~ 0 run fill ^-1 ^13 ^10 ^1 ^13 ^12 sea_lantern
execute at @s rotated ~ 0 run setblock ^0 ^14 ^11 beacon
execute at @s rotated ~ 0 run setblock ^0 ^15 ^11 end_rod

# Đèn lồng treo 4 góc mái
execute at @s rotated ~ 0 run setblock ^-9 ^6 ^2 lantern[hanging=true]
execute at @s rotated ~ 0 run setblock ^9 ^6 ^2 lantern[hanging=true]
execute at @s rotated ~ 0 run setblock ^-9 ^6 ^20 lantern[hanging=true]
execute at @s rotated ~ 0 run setblock ^9 ^6 ^20 lantern[hanging=true]

execute at @s rotated ~ 0 run summon firework_rocket ^0 ^12 ^11 {LifeTime:25,FireworksItem:{id:"firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"large_ball",has_twinkle:1b,colors:[16766720,65535,16711935]}]}}}}
tellraw @s [{"text":"\n🏯👑 [KIẾN TRÚC SƯ ĐẢO] ","color":"gold","bold":true},{"text":"Đã khánh thành tuyệt tác ","color":"yellow"},{"text":"Cung Điện Lưu Ly Chân Không Hoàng Gia (19x19x16)!\n","color":"aqua","bold":true},{"text":"🛡️ Gõ /is undo trong 3 phút nếu muốn hoàn tác nhận lại 90% tiền!","color":"gray"}]
