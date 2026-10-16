# ==============================================================================
# PHẦN THƯỞNG HÒM THẦN THOẠI (MYTHIC CRATE REWARDS) - DÙNG SỐ DƯ
# ==============================================================================

# Trừ 1 chìa khóa thần thoại
execute store success score #cleared temp run clear @s *[custom_data~{crate_key:"mythic"}] 1

# Hiệu ứng nổ hào quang rực rỡ & sấm sét tượng trưng
particle minecraft:dragon_breath 3 122.5 7 0.8 0.8 0.8 0.05 100 normal
particle minecraft:totem_of_undying 3 122.5 7 1.0 1.0 1.0 0.2 100 normal
playsound minecraft:ui.toast.challenge_complete player @s ~ ~ ~ 1.5 1.5
playsound minecraft:entity.lightning_bolt.thunder master @a ~ ~ ~ 0.5 1.5
playsound minecraft:block.ender_chest.open block @a 3 122 7 1.0 1.0

# Quay số ngẫu nhiên 1..100
execute store result score #crate_roll temp run random value 1..100

# Tier 1 (1..40): Phôi Netherite & Spawner Spider
execute if score #crate_roll temp matches 1..40 run give @s netherite_ingot 2
execute if score #crate_roll temp matches 1..40 run give @s spawner[block_entity_data={id:"minecraft:spawner",SpawnData:{entity:{id:"minecraft:spider"}}},custom_name='{"text":"Spider Spawner","color":"dark_red","bold":true}'] 1
execute if score #crate_roll temp matches 1..40 run give @s diamond_block 8
execute if score #crate_roll temp matches 1..40 run scoreboard players add @s eco_add 50000
execute if score #crate_roll temp matches 1..40 run tellraw @s [{"text":"[Hòm Thần Thoại] ","color":"light_purple","bold":true},{"text":"Bạn nhận được: ","color":"yellow"},{"text":"2 Phôi Netherite, 1 Spawner Nhện, 8 Khối Kim Cương & +$50,000 Số Dư!","color":"gold"}]

# Tier 2 (41..70): Spawner Blaze & Sao Địa Ngục (Nether Star)
execute if score #crate_roll temp matches 41..70 run give @s netherite_ingot 4
execute if score #crate_roll temp matches 41..70 run give @s nether_star 1
execute if score #crate_roll temp matches 41..70 run give @s spawner[block_entity_data={id:"minecraft:spawner",SpawnData:{entity:{id:"minecraft:blaze"}}},custom_name='{"text":"Blaze Spawner","color":"gold","bold":true}'] 1
execute if score #crate_roll temp matches 41..70 run scoreboard players add @s eco_add 100000
execute if score #crate_roll temp matches 41..70 run tellraw @s [{"text":"[Hòm Thần Thoại] ","color":"light_purple","bold":true},{"text":"Bạn nhận được: ","color":"yellow"},{"text":"4 Phôi Netherite, 1 Sao Địa Ngục (Nether Star), 1 Spawner Blaze & +$100,000 Số Dư!","color":"aqua"}]

# Tier 3 (71..90): Spawner Iron Golem & Phôi Netherite Khủng
execute if score #crate_roll temp matches 71..90 run give @s netherite_ingot 6
execute if score #crate_roll temp matches 71..90 run give @s enchanted_golden_apple 4
execute if score #crate_roll temp matches 71..90 run give @s spawner[block_entity_data={id:"minecraft:spawner",SpawnData:{entity:{id:"minecraft:iron_golem"}}},custom_name='{"text":"Iron Golem Spawner","color":"aqua","bold":true}'] 1
execute if score #crate_roll temp matches 71..90 run scoreboard players add @s eco_add 150000
execute if score #crate_roll temp matches 71..90 run tellraw @a [{"text":"[Hòm Thần Thoại] ","color":"light_purple","bold":true},{"text":"Người chơi ","color":"yellow"},{"selector":"@s","color":"aqua","bold":true},{"text":" vừa mở Hòm Thần Thoại trúng: ","color":"yellow"},{"text":"1 IRON GOLEM SPAWNER & +$150,000 SỐ DƯ!","color":"aqua","bold":true}]

# Tier 4 (91..100): ✦ JACKPOT VĨNH CỬU: VŨ KHÍ THẦN THOẠI & $250,000 ✦
execute if score #crate_roll temp matches 91..100 run give @s netherite_sword[custom_data={ancient_lifesteal:1b,ancient_lightning:1b,mythic_weapon:1b},enchantments={levels:{"minecraft:sharpness":7,"minecraft:unbreaking":5,"minecraft:fire_aspect":3,"minecraft:looting":4}},item_name='{"text":"⚡ THẦN KIẾM HUY HOÀNG (MYTHIC) ⚡","color":"light_purple","bold":true}',lore=['{"text":"Vũ khí tối thượng từ Hòm Thần Thoại!","color":"gold"}','{"text":"Sở hữu hiệu ứng Hút Máu & Sấm Sét Huỷ Diệt!","color":"red"}']] 1
execute if score #crate_roll temp matches 91..100 run give @s spawner[block_entity_data={id:"minecraft:spawner",SpawnData:{entity:{id:"minecraft:iron_golem"}}},custom_name='{"text":"Iron Golem Spawner","color":"aqua","bold":true}'] 1
execute if score #crate_roll temp matches 91..100 run give @s netherite_block 1
execute if score #crate_roll temp matches 91..100 run scoreboard players add @s eco_add 250000
execute if score #crate_roll temp matches 91..100 run summon firework_rocket 3 125 7 {LifeTime:20,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"ball",colors:[16755200,16711935],fade_colors:[16776960]}]}}}}
execute if score #crate_roll temp matches 91..100 run tellraw @a [{"text":"═══════════════════════════════════════════════\n","color":"light_purple","bold":true},{"text":"✦ HUYỀN THOẠI XUẤT HIỆN! ✦\n","color":"gold","bold":true},{"text":"Người chơi ","color":"yellow"},{"selector":"@s","color":"aqua","bold":true},{"text":" vừa trúng JACKPOT HÒM THẦN THOẠI:\n","color":"yellow"},{"text":"⚡ THẦN KIẾM HUY HOÀNG (MYTHIC) TIER MAX ⚡\n","color":"light_purple","bold":true},{"text":"1 IRON GOLEM SPAWNER & +$250,000 SỐ DƯ!\n","color":"gold","bold":true},{"text":"═══════════════════════════════════════════════","color":"light_purple","bold":true}]
