# Đóng 1 bình EXP (rút 1 level)
execute store result score @s player_lvl run experience query @s levels

execute if score @s player_lvl matches ..0 run tellraw @s [{"text":"[Đóng Chai EXP] ","color":"red","bold":true},{"text":"Bạn cần ít nhất 1 Cấp độ EXP để đóng chai!","color":"yellow"}]
execute if score @s player_lvl matches ..0 run playsound minecraft:entity.villager.no player @s ~ ~ ~ 1.0 1.0

execute if score @s player_lvl matches 1.. run experience add @s -1 levels
execute if score @s player_lvl matches 1.. run give @s experience_bottle 1
execute if score @s player_lvl matches 1.. run playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 1.0 1.2
execute if score @s player_lvl matches 1.. run tellraw @s [{"text":"[Đóng Chai EXP] ","color":"green","bold":true},{"text":"Đã chiết xuất 1 Cấp độ thành ","color":"yellow"},{"text":"1 Bình Kinh Nghiệm (Bottle of Enchanting)","color":"aqua","bold":true},{"text":"!","color":"green"}]
