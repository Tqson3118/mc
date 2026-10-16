# ==============================================================================
# PHẦN THƯỞNG HÒM ĐỒNG (COMMON CRATE REWARDS) - DÙNG SỐ DƯ
# ==============================================================================

# Trừ 1 chìa khóa đồng
execute store success score #cleared temp run clear @s *[custom_data~{crate_key:"common"}] 1

# Hiệu ứng âm thanh & hình ảnh mở rương
particle minecraft:totem_of_undying -3 122.5 7 0.4 0.4 0.4 0.1 40 normal
playsound minecraft:ui.toast.challenge_complete player @s ~ ~ ~ 1.0 1.2
playsound minecraft:block.chest.open block @a -3 122 7 1.0 1.0

# Quay số ngẫu nhiên 1..100
execute store result score #crate_roll temp run random value 1..100

# Tier 1 (1..40): Gói Khoáng Sản & Tiền Khởi Nghiệp
execute if score #crate_roll temp matches 1..40 run give @s iron_ingot 16
execute if score #crate_roll temp matches 1..40 run give @s gold_ingot 8
execute if score #crate_roll temp matches 1..40 run give @s coal 16
execute if score #crate_roll temp matches 1..40 run give @s cooked_beef 16
execute if score #crate_roll temp matches 1..40 run scoreboard players add @s eco_add 1000
execute if score #crate_roll temp matches 1..40 run tellraw @s [{"text":"[Hòm Đồng] ","color":"gold","bold":true},{"text":"Bạn nhận được: ","color":"green"},{"text":"16 Sắt, 8 Vàng, 16 Than, 16 Bò nướng & +$1,000 Số Dư!","color":"yellow"}]

# Tier 2 (41..70): Gói Kim Cương & Trang Bị
execute if score #crate_roll temp matches 41..70 run give @s diamond 4
execute if score #crate_roll temp matches 41..70 run give @s enchanted_book[stored_enchantments={levels:{"minecraft:sharpness":3,"minecraft:unbreaking":2}}] 1
execute if score #crate_roll temp matches 41..70 run give @s golden_apple 2
execute if score #crate_roll temp matches 41..70 run scoreboard players add @s eco_add 2500
execute if score #crate_roll temp matches 41..70 run tellraw @s [{"text":"[Hòm Đồng] ","color":"gold","bold":true},{"text":"Bạn nhận được: ","color":"green"},{"text":"4 Kim Cương, 1 Sách Sắc Bén III, 2 Táo Vàng & +$2,500 Số Dư!","color":"aqua"}]

# Tier 3 (71..90): Gói May Mắn + Chìa Khóa Vàng (Rare Key)!
execute if score #crate_roll temp matches 71..90 run give @s diamond 8
execute if score #crate_roll temp matches 71..90 run give @s trial_key[custom_data={crate_key:"rare"},item_name='{"text":"Chìa Khóa Vàng","color":"yellow","bold":true}',lore=['{"text":"Dùng để mở Hòm Hoàng Kim tại Spawn!","color":"gold"}']] 1
execute if score #crate_roll temp matches 71..90 run scoreboard players add @s eco_add 5000
execute if score #crate_roll temp matches 71..90 run tellraw @s [{"text":"[Hòm Đồng] ","color":"gold","bold":true},{"text":"✦ MAY MẮN! ✦ ","color":"gold","bold":true},{"text":"Bạn trúng ","color":"green"},{"text":"1 Chìa Khóa Vàng (Rare)","color":"yellow","bold":true},{"text":", 8 Kim Cương & +$5,000 Số Dư!","color":"green"}]

# Tier 4 (91..100): JACKPOT ĐỒNG! (Trúng Spawner Heo!)
execute if score #crate_roll temp matches 91..100 run give @s spawner[block_entity_data={id:"minecraft:spawner",SpawnData:{entity:{id:"minecraft:pig"}}},custom_name='{"text":"Pig Spawner","color":"light_purple","bold":true}'] 1
execute if score #crate_roll temp matches 91..100 run give @s diamond 16
execute if score #crate_roll temp matches 91..100 run scoreboard players add @s eco_add 10000
execute if score #crate_roll temp matches 91..100 run tellraw @a [{"text":"[Hòm Đồng] ","color":"gold","bold":true},{"text":"Chúc mừng ","color":"yellow"},{"selector":"@s","color":"aqua","bold":true},{"text":" vừa trúng JACKPOT HÒM ĐỒNG: ","color":"yellow"},{"text":"1 PIG SPAWNER, 16 KIM CƯƠNG & +$10,000 SỐ DƯ!","color":"light_purple","bold":true}]
