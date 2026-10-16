# Trừ tiền mua ô 31
tag @e[tag=tile_31] add owned
tag @e[tag=tile_31] add owned_by_player
scoreboard players remove @s sb_money 300000
execute at @s run playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1.0 1.2
tellraw @a [{"text": "👑 [MUA ĐẤT THÀNH CÔNG] ", "color": "gold", "bold": true}, {"selector": "@s", "color": "yellow", "bold": true}, {"text": " đã chính thức mua ô đất ", "color": "yellow"}, {"text": "[Thành Phố Cổ Deep Dark]", "color": "aqua", "bold": true}, {"text": " với giá ", "color": "yellow"}, {"text": "$300,000 xu", "color": "green", "bold": true}]

# Đặt khối đánh dấu quyền sở hữu
setblock 225 112 180 emerald_block
