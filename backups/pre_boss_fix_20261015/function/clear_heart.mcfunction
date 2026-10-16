# ===============================================================
# SKYBLOCK - DỌN DẸP TƯỢNG TRÁI TIM AN TOÀN (SAFE HEART REMOVAL)
# ===============================================================

# 1. Âm thanh dọn dẹp
execute at @s run playsound minecraft:block.amethyst_block.break player @s ~ ~ ~ 1.5 1.0

# 2. Thay thế chính xác các khối tạo nên tượng Trái Tim thành Air trong bán kính 35 block
execute at @s run fill ~-35 ~-15 ~-35 ~35 ~35 ~35 air replace light_blue_concrete
execute at @s run fill ~-35 ~-15 ~-35 ~35 ~35 ~35 air replace yellow_concrete
execute at @s run fill ~-35 ~-15 ~-35 ~35 ~35 ~35 air replace white_concrete
execute at @s run fill ~-35 ~-15 ~-35 ~35 ~35 ~35 air replace light_blue_stained_glass
execute at @s run fill ~-35 ~-15 ~-35 ~35 ~35 ~35 air replace yellow_stained_glass
execute at @s run fill ~-35 ~-15 ~-35 ~35 ~35 ~35 air replace white_stained_glass

# 3. Hiệu ứng hạt bụi biến mất
execute at @s run particle minecraft:poof ~ ~5 ~ 10 5 10 0.05 100

# 4. Thông báo tellraw
tellraw @s [{"text":"\n🧹 [DỌN DẸP TRÁI TIM] ","color":"gold","bold":true},{"text":"Đã dọn sạch các tượng Trái Tim xung quanh bạn an toàn 100%!\n","color":"green"},{"text":"(Bảo vệ nguyên vẹn toàn bộ rương đồ, spawner và công trình đảo của bạn)\n","color":"gray"}]
