# ==============================================================================
# HỆ THỐNG MUA DANH HIỆU (BUY TITLE)
# ==============================================================================

# 1. [🌱 Tân Binh] - Miễn phí
execute if score @s buy_title matches 1 if entity @s[tag=title_tanbinh] run tellraw @s [{"text":"[Danh Hiệu] ","color":"gold","bold":true},{"text":"Bạn đã sở hữu danh hiệu ","color":"yellow"},{"text":"[🌱 Tân Binh]","color":"green","bold":true},{"text":" rồi! Hãy bấm [ĐEO] để trang bị.","color":"yellow"}]
execute if score @s buy_title matches 1 unless entity @s[tag=title_tanbinh] run tag @s add title_tanbinh
execute if score @s buy_title matches 1 run team join tag_tanbinh @s
execute if score @s buy_title matches 1 run tellraw @s [{"text":"[Danh Hiệu] ","color":"gold","bold":true},{"text":"Chúc mừng bạn đã nhận danh hiệu: ","color":"green"},{"text":"[🌱 Tân Binh]","color":"green","bold":true},{"text":" (Miễn phí)! Đã tự động trang bị lên đầu và Tablist!","color":"yellow"}]
execute if score @s buy_title matches 1 run playsound minecraft:ui.toast.challenge_complete player @s ~ ~ ~ 1.0 1.2
execute if score @s buy_title matches 1 run scoreboard players set @s buy_title 0

# 2..7: Nhóm Phú Hào (Mua bằng Số Dư Vault) - Được tự động xử lý và trừ tiền bởi Skyblock Economy Daemon
execute if score @s buy_title matches 2..7 run tellraw @s [{"text":"[Danh Hiệu] ","color":"gold","bold":true},{"text":"Đang kiểm tra Số Dư Vault và hoàn tất giao dịch mua danh hiệu...","color":"yellow"}]

# Không bán danh hiệu Chiến Tích & Đỏ Đen bằng tiền
execute if score @s buy_title matches 8..14 run tellraw @s [{"text":"[Danh Hiệu] ","color":"red","bold":true},{"text":"Danh hiệu này thuộc nhóm Chiến Tích / Đỏ Đen, không thể mua bằng tiền! Hãy hoàn thành thử thách để mở khóa rồi bấm [ĐEO].","color":"yellow"}]
execute if score @s buy_title matches 8..14 run playsound minecraft:block.chest.locked player @s ~ ~ ~ 1.0 0.8
execute if score @s buy_title matches 8..14 run scoreboard players set @s buy_title 0
