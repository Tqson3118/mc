# Ham Do Xuc Xac Co Ty Phu
execute if score @s ct_jail matches 1.. run function skyblock:cotyphu/roll_jail
execute unless score @s ct_jail matches 1.. run function skyblock:cotyphu/roll_normal
