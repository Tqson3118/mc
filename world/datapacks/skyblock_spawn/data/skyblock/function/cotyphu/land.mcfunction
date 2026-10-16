# Xử lý sự kiện khi bước chân lên ô
# Bắt Vào Tù (Ô 30)
execute if score @s ct_pos matches 30 run function skyblock:cotyphu/go_to_jail

# Bãi Xe Miễn Phí (Ô 20)
execute if score @s ct_pos matches 20 run function skyblock:cotyphu/free_parking

# Thuế (Ô 4 hoặc Ô 38)
execute if score @s ct_pos matches 4 run function skyblock:cotyphu/tax_income
execute if score @s ct_pos matches 38 run function skyblock:cotyphu/tax_luxury

# Cơ hội (Ô 7, 22, 36)
execute if score @s ct_pos matches 7 run function skyblock:cotyphu/chance
execute if score @s ct_pos matches 22 run function skyblock:cotyphu/chance
execute if score @s ct_pos matches 36 run function skyblock:cotyphu/chance

# Khí vận (Ô 2, 17, 33)
execute if score @s ct_pos matches 2 run function skyblock:cotyphu/chest
execute if score @s ct_pos matches 17 run function skyblock:cotyphu/chest
execute if score @s ct_pos matches 33 run function skyblock:cotyphu/chest

# Ô Đất / Nhà Ga / Tiện Ích
execute at @s run function skyblock:cotyphu/tile_prompt
