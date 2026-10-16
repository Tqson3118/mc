# Đóng 16 bình EXP (rút 16 level)
execute store result score @s player_lvl run experience query @s levels

execute if score @s player_lvl matches ..15 run tellraw @s [{"text":"[Đóng Chai EXP] ","color":"red","bold":true},{"text":"Bạn cần ít nhất 16 Cấp độ để đóng 16 bình! (Hiện có: ","color":"yellow"},{"score":{"name":"@s","objective":"player_lvl"},"color":"white"},{"text":" Cấp)","color":"yellow"}]
execute if score @s player_lvl matches ..15 run playsound minecraft:entity.villager.no player @s ~ ~ ~ 1.0 1.0

execute if score @s player_lvl matches 16.. run experience add @s -16 levels
execute if score @s player_lvl matches 16.. run give @s experience_bottle 16
execute if score @s player_lvl matches 16.. run playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 1.0 1.2
execute if score @s player_lvl matches 16.. run tellraw @s [{"text":"[Đóng Chai EXP] ","color":"green","bold":true},{"text":"Đã chiết xuất 16 Cấp độ thành ","color":"yellow"},{"text":"16 Bình Kinh Nghiệm (Bottle of Enchanting)","color":"aqua","bold":true},{"text":"!","color":"green"}]
