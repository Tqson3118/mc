# Quà Tham Gia Tổ Đội Boss 3: Chúa Tể Bóng Tối
scoreboard players add @s eco_add 1000
scoreboard players add @s gems_add 20
experience add @s 500 points
tellraw @s [{"text":"[Quà Tổ Đội] ","color":"gold","bold":true},{"text":"Bạn đã hỗ trợ hạ gục Boss 3: ","color":"yellow"},{"text":"+$1,000 Xu, +20 Linh Thạch & 500 EXP!","color":"green","bold":true}]
playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 1.0 1.2
