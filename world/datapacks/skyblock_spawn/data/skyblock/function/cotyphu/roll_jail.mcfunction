# Xử lý khi đổ xúc xắc trong tù
execute store result score @s ct_dice1 run random value 1..6
execute store result score @s ct_dice2 run random value 1..6

# Nếu đổ ra đôi
execute if score @s ct_dice1 = @s ct_dice2 run function skyblock:cotyphu/escape_jail
execute unless score @s ct_dice1 = @s ct_dice2 run function skyblock:cotyphu/stay_jail
