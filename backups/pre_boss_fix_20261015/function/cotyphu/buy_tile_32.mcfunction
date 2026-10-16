# Trừ tiền mua ô 32
tag @e[tag=tile_32] add owned
tag @e[tag=tile_32] add owned_by_player
scoreboard players remove @s sb_money 300000
execute at @s run playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1.0 1.2
tellraw @a [{"text": "👑 [MUA ĐẤT THÀNH CÔNG] ", "color": "gold", "bold": true}, {"selector": "@s", "color": "yellow", "bold": true}, {"text": " đã chính thức mua ô đất ", "color": "yellow"}, {"text": "[Đảo Điệp Viên Thần Bí]", "color": "aqua", "bold": true}, {"text": " với giá ", "color": "yellow"}, {"text": "$300,000 xu", "color": "green", "bold": true}]

# Đặt khối đánh dấu quyền sở hữu
setblock 225 112 185 emerald_block
