# Gieo 2 xuc xac doc lap
execute store result score @s ct_dice1 run random value 1..6
execute store result score @s ct_dice2 run random value 1..6
scoreboard players operation @s ct_total = @s ct_dice1
scoreboard players operation @s ct_total += @s ct_dice2

# Hieu ung am thanh va hat phao hoa
execute at @s run playsound minecraft:entity.firework_rocket.blast master @a ~ ~ ~ 1.0 1.2
execute at @s run playsound minecraft:block.bell.use master @a ~ ~ ~ 1.0 1.5
execute at @s run particle minecraft:firework ~ ~1.5 ~ 0.5 0.5 0.5 0.1 20 normal

# Hien thi ket qua ra man hinh
title @s title {"text":"🎲 XÚC XẮC!","color":"gold","bold":true}
title @s subtitle [{"text":"Đổ được: ","color":"yellow"},{"score":{"name":"@s","objective":"ct_dice1"},"color":"aqua","bold":true},{"text":" + ","color":"white"},{"score":{"name":"@s","objective":"ct_dice2"},"color":"aqua","bold":true},{"text":" = ","color":"white"},{"score":{"name":"@s","objective":"ct_total"},"color":"green","bold":true}]

tellraw @a [{"text":"🎲 [CỜ TỶ PHÚ] ","color":"gold","bold":true},{"selector":"@s","color":"yellow","bold":true},{"text":" vừa đổ được ","color":"white"},{"score":{"name":"@s","objective":"ct_total"},"color":"green","bold":true},{"text":" nút! (","color":"gray"},{"score":{"name":"@s","objective":"ct_dice1"},"color":"aqua"},{"text":" + ","color":"gray"},{"score":{"name":"@s","objective":"ct_dice2"},"color":"aqua"},{"text":")","color":"gray"}]

# Cong buoc di
scoreboard players operation @s ct_pos += @s ct_total

# Neu di qua hoac cham O 0 (Bat Dau)
execute if score @s ct_pos matches 40.. run function skyblock:cotyphu/pass_go

# Dua nguoi choi toi o tuong ung
function skyblock:cotyphu/tp_to_tile
function skyblock:cotyphu/land
