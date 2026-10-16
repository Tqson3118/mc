# Trừ tiền mua ô 15
tag @e[tag=tile_15] add owned
tag @e[tag=tile_15] add owned_by_player
scoreboard players remove @s sb_money 200000
execute at @s run playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1.0 1.2
tellraw @a [{"text": "👑 [MUA ĐẤT THÀNH CÔNG] ", "color": "gold", "bold": true}, {"selector": "@s", "color": "yellow", "bold": true}, {"text": " đã chính thức mua ô đất ", "color": "yellow"}, {"text": "[🚂 Ga Cổng End Siêu Tốc]", "color": "aqua", "bold": true}, {"text": " với giá ", "color": "yellow"}, {"text": "$200,000 xu", "color": "green", "bold": true}]

# Đặt khối đánh dấu quyền sở hữu
setblock 175 112 200 emerald_block
