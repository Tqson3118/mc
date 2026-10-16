# Lĩnh lương khi đi qua ô Bắt Đầu
scoreboard players remove @s ct_pos 40
execute at @s run playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1.0 1.5
tellraw @s [{"text":"🏁 [BẮT ĐẦU] ","color":"green","bold":true},{"text":"Bạn đã đi qua vạch Bắt Đầu! Nhận lương ","color":"yellow"},{"text":"+$200,000 xu","color":"gold","bold":true},{"text":"!","color":"green"}]
scoreboard players add @s eco_add 200000
