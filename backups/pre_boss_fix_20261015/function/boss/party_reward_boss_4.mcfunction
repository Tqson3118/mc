# Quà Tham Gia Tổ Đội Boss 4: Chúa Tể Hư Không Vô Tận
scoreboard players add @s eco_add 2500
scoreboard players add @s gems_add 35
experience add @s 800 points
tellraw @s [{"text":"[Quà Tổ Đội] ","color":"gold","bold":true},{"text":"Bạn đã hỗ trợ hạ gục Boss 4: ","color":"yellow"},{"text":"+$2,500 Xu, +35 Linh Thạch & 800 EXP!","color":"green","bold":true}]
playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 1.0 1.2
