scoreboard players set @s ct_pos 10
scoreboard players set @s ct_jail 1
teleport @s 175.5 111.0 225.5
execute at @s run playsound minecraft:entity.elder_guardian.curse master @s ~ ~ ~ 1.0 1.0
title @s title {"text":"👮 BỊ BẮT VÀO TÙ!","color":"red","bold":true}
title @s subtitle {"text":"Áp giải thẳng vào Lồng Giam Ô 10","color":"gray"}
tellraw @a [{"text":"👮 [CỜ TỶ PHÚ] ","color":"red","bold":true},{"selector":"@s","color":"yellow","bold":true},{"text":" đã bị bắt vào Lồng Giam Tù Hư Không!","color":"gray"}]
