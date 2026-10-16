# Trừ tiền mua ô 14
tag @e[tag=tile_14] add owned
tag @e[tag=tile_14] add owned_by_player
scoreboard players remove @s sb_money 160000
execute at @s run playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1.0 1.2
tellraw @a [{"text": "👑 [MUA ĐẤT THÀNH CÔNG] ", "color": "gold", "bold": true}, {"selector": "@s", "color": "yellow", "bold": true}, {"text": " đã chính thức mua ô đất ", "color": "yellow"}, {"text": "[Rừng Bạch Dương Trắng]", "color": "aqua", "bold": true}, {"text": " với giá ", "color": "yellow"}, {"text": "$160,000 xu", "color": "green", "bold": true}]

# Đặt khối đánh dấu quyền sở hữu
setblock 175 112 205 emerald_block
