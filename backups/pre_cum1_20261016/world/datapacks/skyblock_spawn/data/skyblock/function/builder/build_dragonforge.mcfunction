# ==============================================================================
# SKYBLOCK BUILDER - ĐỀN RỒNG HẮC ÁM & LÒ LUYỆN TỰ ĐỘNG (BLACK DRAGON FORGE)
# Kích thước: 15x15 x H13 blocks | Chi phí: $85,000 Xu Vault
# ==============================================================================
execute at @s run playsound minecraft:entity.ender_dragon.growl master @a ~ ~ ~ 1.5 0.9
execute at @s run playsound minecraft:block.anvil.use player @s ~ ~ ~ 1.2 0.8

execute at @s rotated ~ 0 run fill ^-7 ^-1 ^2 ^7 ^12 ^16 air
execute at @s rotated ~ 0 run fill ^-7 ^-1 ^2 ^7 ^-1 ^16 polished_blackstone_bricks
execute at @s rotated ~ 0 run fill ^-6 ^0 ^3 ^6 ^0 ^15 deepslate_tiles
execute at @s rotated ~ 0 run fill ^-2 ^0 ^3 ^2 ^0 ^14 crying_obsidian

# 4 Trụ Lửa Hắc Diệu Thạch & Mái Vòm Huyết Long
execute at @s rotated ~ 0 run fill ^-6 ^1 ^3 ^-6 ^7 ^3 obsidian
execute at @s rotated ~ 0 run fill ^6 ^1 ^3 ^6 ^7 ^3 obsidian
execute at @s rotated ~ 0 run fill ^-6 ^1 ^15 ^-6 ^7 ^15 obsidian
execute at @s rotated ~ 0 run fill ^6 ^1 ^15 ^6 ^7 ^15 obsidian
execute at @s rotated ~ 0 run setblock ^-6 ^8 ^3 soul_campfire
execute at @s rotated ~ 0 run setblock ^6 ^8 ^3 soul_campfire
execute at @s rotated ~ 0 run setblock ^-6 ^8 ^15 soul_campfire
execute at @s rotated ~ 0 run setblock ^6 ^8 ^15 soul_campfire

# Tượng Đầu Rồng Phun Dung Nham vào Hồ Kính Cường Lực (Z=12..14)
execute at @s rotated ~ 0 run fill ^-3 ^1 ^12 ^3 ^4 ^14 polished_blackstone
execute at @s rotated ~ 0 run fill ^-2 ^1 ^12 ^2 ^3 ^13 lava
execute at @s rotated ~ 0 run fill ^-2 ^1 ^11 ^2 ^3 ^11 orange_stained_glass
execute at @s rotated ~ 0 run setblock ^0 ^5 ^11 dragon_head[rotation=0]
execute at @s rotated ~ 0 run setblock ^-2 ^5 ^11 end_rod
execute at @s rotated ~ 0 run setblock ^2 ^5 ^11 end_rod

# Dàn 8 Lò Luyện Kim Siêu Tốc + 4 Đe Sắt + Bàn Rèn + Rương Đôi
execute at @s rotated ~ 0 run fill ^-5 ^1 ^5 ^-5 ^2 ^8 blast_furnace[facing=east]
execute at @s rotated ~ 0 run fill ^5 ^1 ^5 ^5 ^2 ^8 blast_furnace[facing=west]
execute at @s rotated ~ 0 run setblock ^-4 ^1 ^10 anvil[facing=east]
execute at @s rotated ~ 0 run setblock ^4 ^1 ^10 anvil[facing=west]
execute at @s rotated ~ 0 run setblock ^-3 ^1 ^10 smithing_table
execute at @s rotated ~ 0 run setblock ^3 ^1 ^10 grindstone[face=floor,facing=north]
execute at @s rotated ~ 0 run setblock ^0 ^1 ^9 enchanting_table
execute at @s rotated ~ 0 run setblock ^-4 ^1 ^4 ender_chest[facing=south]
execute at @s rotated ~ 0 run setblock ^4 ^1 ^4 chest[facing=south]

# Mái Vòm Đền Rồng (Y=7..11)
execute at @s rotated ~ 0 run fill ^-7 ^7 ^2 ^7 ^7 ^16 polished_blackstone_brick_slab
execute at @s rotated ~ 0 run fill ^-5 ^8 ^4 ^5 ^8 ^14 red_nether_bricks
execute at @s rotated ~ 0 run fill ^-3 ^9 ^6 ^3 ^9 ^12 gilded_blackstone
execute at @s rotated ~ 0 run fill ^-1 ^10 ^8 ^1 ^10 ^10 crying_obsidian
execute at @s rotated ~ 0 run setblock ^0 ^6 ^9 soul_lantern[hanging=true]

execute at @s rotated ~ 0 run summon firework_rocket ^0 ^11 ^9 {LifeTime:25,FireworksItem:{id:"firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"large_ball",colors:[16711680,11141375,16755200]}]}}}}
tellraw @s [{"text":"
🐉🔥 [KIẾN TRÚC SƯ ĐẢO] ","color":"dark_red","bold":true},{"text":"Đã khánh thành tuyệt tác ","color":"yellow"},{"text":"Đền Rồng Hắc Ám & Tổ Hợp 8 Lò Luyện Kim (15x15x13)!
","color":"gold","bold":true},{"text":"🛡️ Gõ /is undo trong 3 phút nếu muốn hoàn tác nhận lại 90% tiền!","color":"gray"}]
