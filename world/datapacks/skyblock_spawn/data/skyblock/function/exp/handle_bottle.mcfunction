# Xử lý trigger bottle
execute if score @s bottle matches 1 run function skyblock:exp/bottle_1
execute if score @s bottle matches 16 run function skyblock:exp/bottle_16
execute if score @s bottle matches 99 run function skyblock:exp/bottle_all

scoreboard players set @s bottle 0
scoreboard players enable @s bottle
