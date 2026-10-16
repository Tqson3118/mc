# Trừ tiền mua ô 37
tag @e[tag=tile_37] add owned
tag @e[tag=tile_37] add owned_by_player
scoreboard players remove @s sb_money 350000
execute at @s run playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1.0 1.2
tellraw @a [{"text": "👑 [MUA ĐẤT THÀNH CÔNG] ", "color": "gold", "bold": true}, {"selector": "@s", "color": "yellow", "bold": true}, {"text": " đã chính thức mua ô đất ", "color": "yellow"}, {"text": "[Long Đền Rồng The End]", "color": "aqua", "bold": true}, {"text": " với giá ", "color": "yellow"}, {"text": "$350,000 xu", "color": "green", "bold": true}]

# Đặt khối đánh dấu quyền sở hữu
setblock 225 112 210 emerald_block
