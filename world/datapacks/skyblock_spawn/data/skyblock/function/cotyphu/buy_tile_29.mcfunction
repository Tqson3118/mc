# Trừ tiền mua ô 29
tag @e[tag=tile_29] add owned
tag @e[tag=tile_29] add owned_by_player
scoreboard players remove @s sb_money 280000
execute at @s run playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1.0 1.2
tellraw @a [{"text": "👑 [MUA ĐẤT THÀNH CÔNG] ", "color": "gold", "bold": true}, {"selector": "@s", "color": "yellow", "bold": true}, {"text": " đã chính thức mua ô đất ", "color": "yellow"}, {"text": "[Đền Thần Biển Prismarine]", "color": "aqua", "bold": true}, {"text": " với giá ", "color": "yellow"}, {"text": "$280,000 xu", "color": "green", "bold": true}]

# Đặt khối đánh dấu quyền sở hữu
setblock 220 112 175 emerald_block
