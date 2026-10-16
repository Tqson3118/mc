# ===============================================================
# SKYBLOCK - DỌN DẸP TRÁI TIM TRIỆT ĐỂ (FULL HEART REMOVAL)
# Bao gồm cả Khối Vàng và Đèn Biển tạo nên Trái Tim
# ===============================================================

# 1. Xóa toàn bộ khối bê tông và kính
execute at @s run fill ~-35 ~-15 ~-35 ~35 ~35 ~35 air replace light_blue_concrete
execute at @s run fill ~-35 ~-15 ~-35 ~35 ~35 ~35 air replace yellow_concrete
execute at @s run fill ~-35 ~-15 ~-35 ~35 ~35 ~35 air replace white_concrete
execute at @s run fill ~-35 ~-15 ~-35 ~35 ~35 ~35 air replace light_blue_stained_glass
execute at @s run fill ~-35 ~-15 ~-35 ~35 ~35 ~35 air replace yellow_stained_glass
execute at @s run fill ~-35 ~-15 ~-35 ~35 ~35 ~35 air replace white_stained_glass

# 2. Xóa các khối Vàng và Đèn Biển ở tầng cao của tượng trái tim (Y >= 77)
execute at @s run fill ~-35 ~-5 ~-35 ~35 ~35 ~35 air replace gold_block
execute at @s run fill ~-35 ~-5 ~-35 ~35 ~35 ~35 air replace sea_lantern

# 3. Hiệu ứng hạt bụi biến mất
execute at @s run particle minecraft:poof ~ ~5 ~ 10 5 10 0.05 150
execute at @s run playsound minecraft:block.amethyst_block.break player @s ~ ~ ~ 1.5 1.0

# 4. Thông báo tellraw
tellraw @s [{"text":"\n🧹 [DỌN DẸP TRIỆT ĐỂ] ","color":"gold","bold":true},{"text":"Đã dọn sạch 100% tượng Trái Tim (bao gồm cả khối vàng và đèn biển) xung quanh bạn!\n","color":"green"}]
