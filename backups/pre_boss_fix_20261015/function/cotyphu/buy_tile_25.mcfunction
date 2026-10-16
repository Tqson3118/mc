# Trừ tiền mua ô 25
tag @e[tag=tile_25] add owned
tag @e[tag=tile_25] add owned_by_player
scoreboard players remove @s sb_money 200000
execute at @s run playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1.0 1.2
tellraw @a [{"text": "👑 [MUA ĐẤT THÀNH CÔNG] ", "color": "gold", "bold": true}, {"selector": "@s", "color": "yellow", "bold": true}, {"text": " đã chính thức mua ô đất ", "color": "yellow"}, {"text": "[🚂 Ga Thuyền Buồm Cổ]", "color": "aqua", "bold": true}, {"text": " với giá ", "color": "yellow"}, {"text": "$200,000 xu", "color": "green", "bold": true}]

# Đặt khối đánh dấu quyền sở hữu
setblock 200 112 175 emerald_block
