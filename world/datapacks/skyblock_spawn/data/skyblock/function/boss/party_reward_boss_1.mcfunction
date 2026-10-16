# Quà Tham Gia Tổ Đội Boss 1: Nữ Hoàng Nhện Độc
scoreboard players add @s eco_add 250
scoreboard players add @s gems_add 10
experience add @s 150 points
tellraw @s [{"text":"[Quà Tổ Đội] ","color":"gold","bold":true},{"text":"Bạn đã hỗ trợ hạ gục Boss 1: ","color":"yellow"},{"text":"+$250 Xu, +10 Linh Thạch & 150 EXP!","color":"green","bold":true}]
playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 1.0 1.2
