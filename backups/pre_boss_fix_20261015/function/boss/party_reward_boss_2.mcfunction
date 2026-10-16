# Quà Tham Gia Tổ Đội Boss 2: Lãnh Chúa Dung Nham
scoreboard players add @s eco_add 500
scoreboard players add @s gems_add 15
experience add @s 300 points
tellraw @s [{"text":"[Quà Tổ Đội] ","color":"gold","bold":true},{"text":"Bạn đã hỗ trợ hạ gục Boss 2: ","color":"yellow"},{"text":"+$500 Xu, +15 Linh Thạch & 300 EXP!","color":"green","bold":true}]
playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 1.0 1.2
