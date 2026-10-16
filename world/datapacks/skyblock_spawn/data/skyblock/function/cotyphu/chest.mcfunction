# Rút thẻ Khí Vận (Community Chest) ngẫu nhiên 1-4
execute store result score #card ct_dice1 run random value 1..4

execute if score #card ct_dice1 matches 1 run tellraw @s [{"text":"🎁 [KHÍ VẬN] ","color":"aqua","bold":true},{"text":"Lãi suất ngân hàng Vault sinh lời! Nhận ","color":"yellow"},{"text":"+$100,000 xu!","color":"green","bold":true}]
execute if score #card ct_dice1 matches 1 run scoreboard players add @s eco_add 100000

execute if score #card ct_dice1 matches 2 run tellraw @s [{"text":"🎁 [KHÍ VẬN] ","color":"aqua","bold":true},{"text":"Sửa chữa bảo trì biệt thự Skyblock! Mất ","color":"yellow"},{"text":"-$40,000 xu!","color":"red","bold":true}]
execute if score #card ct_dice1 matches 2 run scoreboard players remove @s sb_money 40000

execute if score #card ct_dice1 matches 3 run tellraw @s [{"text":"🎁 [KHÍ VẬN] ","color":"aqua","bold":true},{"text":"Bảo hiểm nhân thọ bồi thường thương tật! Nhận ","color":"yellow"},{"text":"+$80,000 xu!","color":"green","bold":true}]
execute if score #card ct_dice1 matches 3 run scoreboard players add @s eco_add 80000

execute if score #card ct_dice1 matches 4 run tellraw @s [{"text":"🎁 [KHÍ VẬN] ","color":"aqua","bold":true},{"text":"Được tặng thẻ Thẻ Miễn Phí Ra Tù!","color":"green","bold":true}]
execute if score #card ct_dice1 matches 4 run tag @s add has_get_out_jail_card

execute at @s run playsound minecraft:item.totem.use master @s ~ ~ ~ 0.5 1.5
