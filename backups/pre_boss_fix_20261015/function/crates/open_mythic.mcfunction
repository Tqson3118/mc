# ==============================================================================
# XỬ LÝ MỞ HÒM THẦN THOẠI (MYTHIC CRATE)
# ==============================================================================

# Kiểm tra người chơi có Chìa Khóa Thần Thoại không (theo custom_data hoặc tên)
execute store result score #has_key temp run clear @s *[custom_data~{crate_key:"mythic"}] 0
# custom_data crate_key check is sufficient and syntax safe

# Nếu không có chìa khóa: thông báo & âm thanh khóa
execute if score #has_key temp matches 0 run tellraw @s [{"text":"[Rương Báu] ","color":"gold","bold":true},{"text":"Bạn cần có ","color":"red"},{"text":"[Chìa Khóa Thần Thoại]","color":"light_purple","bold":true},{"text":" để mở Hòm Thần Thoại! (Mở từ Hòm Vàng hoặc quà Boss/Parkour)","color":"red"}]
execute if score #has_key temp matches 0 run playsound minecraft:block.chest.locked player @s ~ ~ ~ 1.0 1.0

# Nếu có chìa khóa: trừ 1 chìa & trao thưởng
execute if score #has_key temp matches 1.. run function skyblock:crates/reward_mythic
