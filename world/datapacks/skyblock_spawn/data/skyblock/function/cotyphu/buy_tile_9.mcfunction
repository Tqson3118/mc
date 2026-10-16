# Trừ tiền mua ô 9
tag @e[tag=tile_9] add owned
tag @e[tag=tile_9] add owned_by_player
scoreboard players remove @s sb_money 120000
execute at @s run playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1.0 1.2
tellraw @a [{"text": "👑 [MUA ĐẤT THÀNH CÔNG] ", "color": "gold", "bold": true}, {"selector": "@s", "color": "yellow", "bold": true}, {"text": " đã chính thức mua ô đất ", "color": "yellow"}, {"text": "[Thảo Nguyên Xavan]", "color": "aqua", "bold": true}, {"text": " với giá ", "color": "yellow"}, {"text": "$120,000 xu", "color": "green", "bold": true}]

# Đặt khối đánh dấu quyền sở hữu
setblock 180 112 225 emerald_block
