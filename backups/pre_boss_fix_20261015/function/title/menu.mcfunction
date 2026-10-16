# ==============================================================================
# ROUTER MENU DANH HIỆU (/DANHHIEU, /TAGS, /ROLE)
# ==============================================================================

# Nếu score <= 1 hoặc mặc định: Mở Trang 1 (Phú Hào)
execute if score @s danhhieu matches ..1 run function skyblock:title/page1

# Nếu score == 2: Mở Trang 2 (Chiến Tích)
execute if score @s danhhieu matches 2 run function skyblock:title/page2

# Nếu score == 3: Mở Trang 3 (Đỏ Đen)
execute if score @s danhhieu matches 3 run function skyblock:title/page3

# Nếu score >= 4: Mở Trang 1
execute if score @s danhhieu matches 4.. run function skyblock:title/page1

# Âm thanh mở menu
playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 0.8 1.4
