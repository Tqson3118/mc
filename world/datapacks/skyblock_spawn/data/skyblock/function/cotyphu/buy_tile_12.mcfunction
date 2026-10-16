# Trừ tiền mua ô 12
tag @e[tag=tile_12] add owned
tag @e[tag=tile_12] add owned_by_player
scoreboard players remove @s sb_money 150000
execute at @s run playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1.0 1.2
tellraw @a [{"text": "👑 [MUA ĐẤT THÀNH CÔNG] ", "color": "gold", "bold": true}, {"selector": "@s", "color": "yellow", "bold": true}, {"text": " đã chính thức mua ô đất ", "color": "yellow"}, {"text": "[⚡ Nhà Máy Redstone]", "color": "aqua", "bold": true}, {"text": " với giá ", "color": "yellow"}, {"text": "$150,000 xu", "color": "green", "bold": true}]

# Đặt khối đánh dấu quyền sở hữu
setblock 175 112 215 emerald_block
