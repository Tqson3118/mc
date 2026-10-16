# Đóng toàn bộ cấp độ EXP hiện có thành Bình Kinh Nghiệm
execute store result score @s player_lvl run experience query @s levels

execute if score @s player_lvl matches ..0 run tellraw @s [{"text":"[Đóng Chai EXP] ","color":"red","bold":true},{"text":"Bạn không có Cấp độ EXP nào để đóng chai!","color":"yellow"}]
execute if score @s player_lvl matches ..0 run playsound minecraft:entity.villager.no player @s ~ ~ ~ 1.0 1.0

# Nếu còn >= 10 cấp, rút 10 cấp và tiếp tục
execute if score @s player_lvl matches 10.. run experience add @s -10 levels
execute if score @s player_lvl matches 10.. run give @s experience_bottle 10
execute if score @s player_lvl matches 10.. run function skyblock:exp/bottle_all

# Nếu còn 1..9 cấp, rút 1 cấp và tiếp tục
execute if score @s player_lvl matches 1..9 run experience add @s -1 levels
execute if score @s player_lvl matches 1..9 run give @s experience_bottle 1
execute if score @s player_lvl matches 1..9 run function skyblock:exp/bottle_all

# Hoàn thành
execute if score @s player_lvl matches 1 run playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1.0 1.5
execute if score @s player_lvl matches 1 run tellraw @s [{"text":"[Đóng Chai EXP] ","color":"green","bold":true},{"text":"Đã chiết xuất toàn bộ Cấp độ EXP thành ","color":"yellow"},{"text":"Bình Kinh Nghiệm (Bottle of Enchanting)","color":"aqua","bold":true},{"text":"!","color":"green"}]
