# Bán 5 level -> Nhận +$500 vào Số Dư
execute store result score @s player_lvl run experience query @s levels

execute if score @s player_lvl matches ..4 run tellraw @s [{"text":"[Bán EXP] ","color":"red","bold":true},{"text":"Bạn không đủ 5 Cấp độ để bán! (Hiện có: ","color":"yellow"},{"score":{"name":"@s","objective":"player_lvl"},"color":"white"},{"text":" Cấp)","color":"yellow"}]
execute if score @s player_lvl matches ..4 run playsound minecraft:entity.villager.no player @s ~ ~ ~ 1.0 1.0

execute if score @s player_lvl matches 5.. run experience add @s -5 levels
execute if score @s player_lvl matches 5.. run scoreboard players add @s eco_add 500
execute if score @s player_lvl matches 5.. run playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1.2 1.5
execute if score @s player_lvl matches 5.. run tellraw @s [{"text":"[Bán EXP] ","color":"green","bold":true},{"text":"Đã bán thành công ","color":"yellow"},{"text":"5 Cấp độ EXP","color":"aqua","bold":true},{"text":"! Nhận được ","color":"yellow"},{"text":"+$500 vào Số Dư ($)","color":"green","bold":true},{"text":"!","color":"green"}]
