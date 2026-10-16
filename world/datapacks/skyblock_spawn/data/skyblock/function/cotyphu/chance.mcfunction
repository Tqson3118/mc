# Rút thẻ Cơ Hội (Chance) ngẫu nhiên 1-5
execute store result score #card ct_dice1 run random value 1..5

execute if score #card ct_dice1 matches 1 run tellraw @s [{"text":"❓ [CƠ HỘI] ","color":"gold","bold":true},{"text":"Trúng thưởng Xổ Số Hoàng Gia! Nhận ","color":"yellow"},{"text":"+$150,000 xu & 1 Vé Vàng Hoàng Gia!","color":"green","bold":true}]
execute if score #card ct_dice1 matches 1 run scoreboard players add @s eco_add 150000
execute if score #card ct_dice1 matches 1 run give @s gold_nugget[custom_data={ancient_mat:"royal_ticket"},item_name='{"text":"🎫 Vé Vàng Hoàng Gia 🎫","color":"gold","bold":true}',lore=['{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"}','{"text":"Tấm vé danh dự nạm vàng trao thưởng cho người chiến thắng Casino.","color":"yellow","italic":true}','{"text":"⚡ Dùng để đổi Danh Hiệu VIP & Phôi Trang Phục Đặc Quyền","color":"gold"}','{"text":"[Nguồn]: Cung Điện Casino world_casino (/xoso, /cf, /cotyphu)","color":"light_purple","bold":true}','{"text":"━━━━━━━━━━━━━━━━━━━━━","color":"dark_gray"}']] 1

execute if score #card ct_dice1 matches 2 run tellraw @s [{"text":"❓ [CƠ HỘI] ","color":"gold","bold":true},{"text":"Tổ chức tiệc rượu Skyblock khao cả làng! Chi trả ","color":"yellow"},{"text":"-$50,000 xu!","color":"red","bold":true}]
execute if score #card ct_dice1 matches 2 run scoreboard players remove @s sb_money 50000

execute if score #card ct_dice1 matches 3 run tellraw @s [{"text":"❓ [CƠ HỘI] ","color":"gold","bold":true},{"text":"Gió Hư Không thổi bay! Tiến thêm ","color":"yellow"},{"text":"3 bước!","color":"aqua","bold":true}]
execute if score #card ct_dice1 matches 3 run scoreboard players add @s ct_pos 3
execute if score #card ct_dice1 matches 3 run function skyblock:cotyphu/tp_to_tile

execute if score #card ct_dice1 matches 4 run tellraw @s [{"text":"❓ [CƠ HỘI] ","color":"gold","bold":true},{"text":"Trực thăng cá nhân bay thẳng về ô ","color":"yellow"},{"text":"[🏁 BẮT ĐẦU]","color":"green","bold":true},{"text":" nhận lương $200,000 xu!","color":"yellow"}]
execute if score #card ct_dice1 matches 4 run scoreboard players set @s ct_pos 0
execute if score #card ct_dice1 matches 4 run function skyblock:cotyphu/tp_to_tile
execute if score #card ct_dice1 matches 4 run scoreboard players add @s eco_add 200000

execute if score #card ct_dice1 matches 5 run tellraw @s [{"text":"❓ [CƠ HỘI] ","color":"gold","bold":true},{"text":"Bị cảnh sát tuần tra bắt quả tang trốn vé! Bị áp giải thẳng vào ","color":"yellow"},{"text":"[🔒 LỒNG GIAM TÙ]!","color":"red","bold":true}]
execute if score #card ct_dice1 matches 5 run function skyblock:cotyphu/go_to_jail

execute at @s run playsound minecraft:entity.player.levelup master @s ~ ~ ~ 1.0 1.2
