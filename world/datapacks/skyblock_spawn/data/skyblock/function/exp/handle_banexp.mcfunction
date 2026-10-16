# Xử lý trigger banexp
execute if score @s banexp matches 1 run function skyblock:exp/menu
execute if score @s banexp matches 5 run function skyblock:exp/sell_5
execute if score @s banexp matches 10 run function skyblock:exp/sell_10
execute if score @s banexp matches 30 run function skyblock:exp/sell_30

scoreboard players set @s banexp 0
scoreboard players enable @s banexp
