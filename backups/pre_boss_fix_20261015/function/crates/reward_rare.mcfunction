# ==============================================================================
# PHẦN THƯỞNG HÒM HOÀNG KIM (RARE CRATE REWARDS) - DÙNG SỐ DƯ
# ==============================================================================

# Trừ 1 chìa khóa vàng
execute store success score #cleared temp run clear @s *[custom_data~{crate_key:"rare"}] 1

# Hiệu ứng âm thanh & hình ảnh mở rương
particle minecraft:totem_of_undying 0 122.5 7 0.5 0.5 0.5 0.15 60 normal
playsound minecraft:ui.toast.challenge_complete player @s ~ ~ ~ 1.2 1.3
playsound minecraft:block.chest.open block @a 0 122 7 1.0 1.0

# Quay số ngẫu nhiên 1..100
execute store result score #crate_roll temp run random value 1..100

# Tier 1 (1..40): Gói Kim Cương & Mảnh Netherite
execute if score #crate_roll temp matches 1..40 run give @s diamond 16
execute if score #crate_roll temp matches 1..40 run give @s netherite_scrap 1
execute if score #crate_roll temp matches 1..40 run give @s enchanted_book[stored_enchantments={levels:{"minecraft:unbreaking":3,"minecraft:fortune":3}}] 1
execute if score #crate_roll temp matches 1..40 run scoreboard players add @s eco_add 10000
execute if score #crate_roll temp matches 1..40 run tellraw @s [{"text":"[Hòm Hoàng Kim] ","color":"gold","bold":true},{"text":"Bạn nhận được: ","color":"yellow"},{"text":"16 Kim Cương, 1 Mảnh Netherite, Sách Bùa Cấp Cao & +$10,000 Số Dư!","color":"aqua"}]

# Tier 2 (41..70): Gói Mending & Táo Vàng Thần Thánh
execute if score #crate_roll temp matches 41..70 run give @s diamond 32
execute if score #crate_roll temp matches 41..70 run give @s netherite_scrap 2
execute if score #crate_roll temp matches 41..70 run give @s enchanted_book[stored_enchantments={levels:{"minecraft:mending":1}}] 1
execute if score #crate_roll temp matches 41..70 run give @s enchanted_golden_apple 1
execute if score #crate_roll temp matches 41..70 run scoreboard players add @s eco_add 20000
execute if score #crate_roll temp matches 41..70 run tellraw @s [{"text":"[Hòm Hoàng Kim] ","color":"gold","bold":true},{"text":"Bạn nhận được: ","color":"yellow"},{"text":"32 Kim Cương, Sách Mending (Sửa Chữa), Táo Vàng Phù Phép & +$20,000 Số Dư!","color":"light_purple"}]

# Tier 3 (71..90): Spawner Zombie + Chìa Khóa Thần Thoại!
execute if score #crate_roll temp matches 71..90 run give @s spawner[block_entity_data={id:"minecraft:spawner",SpawnData:{entity:{id:"minecraft:zombie"}}},custom_name='{"text":"Zombie Spawner","color":"dark_green","bold":true}'] 1
execute if score #crate_roll temp matches 71..90 run give @s ominous_trial_key[custom_data={crate_key:"mythic"},item_name='{"text":"Chìa Khóa Thần Thoại","color":"light_purple","bold":true}',lore=['{"text":"Dùng để mở Hòm Thần Thoại tại Spawn!","color":"light_purple"}']] 1
execute if score #crate_roll temp matches 71..90 run scoreboard players add @s eco_add 30000
execute if score #crate_roll temp matches 71..90 run tellraw @s [{"text":"[Hòm Hoàng Kim] ","color":"gold","bold":true},{"text":"✦ ĐẠI CÁT! ✦ ","color":"gold","bold":true},{"text":"Bạn trúng ","color":"green"},{"text":"1 Spawner Zombie, 1 Chìa Khóa Thần Thoại (Mythic) & +$30,000 Số Dư!","color":"light_purple","bold":true}]

# Tier 4 (91..100): JACKPOT HOÀNG KIM! (Spawner Skeleton + Phôi Netherite!)
execute if score #crate_roll temp matches 91..100 run give @s spawner[block_entity_data={id:"minecraft:spawner",SpawnData:{entity:{id:"minecraft:skeleton"}}},custom_name='{"text":"Skeleton Spawner","color":"white","bold":true}'] 1
execute if score #crate_roll temp matches 91..100 run give @s netherite_ingot 1
execute if score #crate_roll temp matches 91..100 run give @s diamond_block 4
execute if score #crate_roll temp matches 91..100 run scoreboard players add @s eco_add 50000
execute if score #crate_roll temp matches 91..100 run tellraw @a [{"text":"[Hòm Hoàng Kim] ","color":"gold","bold":true},{"text":"Chúc mừng ","color":"yellow"},{"selector":"@s","color":"aqua","bold":true},{"text":" vừa trúng JACKPOT HOÀNG KIM: ","color":"yellow"},{"text":"1 SKELETON SPAWNER, 1 PHÔI NETHERITE & +$50,000 SỐ DƯ!","color":"gold","bold":true}]
