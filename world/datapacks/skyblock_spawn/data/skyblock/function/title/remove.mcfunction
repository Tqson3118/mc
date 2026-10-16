# ==============================================================================
# HỆ THỐNG THÁO DANH HIỆU (REMOVE TITLE)
# ==============================================================================

# Rời khỏi Scoreboard Team hiện tại
team leave @s

# Thông báo cho người chơi
tellraw @s [{"text":"[Danh Hiệu] ","color":"gold","bold":true},{"text":"Bạn đã ","color":"yellow"},{"text":"THÁO DANH HIỆU","color":"red","bold":true},{"text":"! Tên trên đầu và Tablist đã trở về mặc định.","color":"yellow"}]

# Âm thanh tháo danh hiệu
playsound minecraft:block.stone_button.click_off player @s ~ ~ ~ 1.0 1.0

# Reset trigger
scoreboard players set @s remove_title 0
