execute at @s run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1.0 1.0
tellraw @s [{"text":"💸 [THUẾ THU NHẬP] ","color":"red","bold":true},{"text":"Bạn phải nộp phạt ","color":"yellow"},{"text":"$100,000 xu","color":"red","bold":true},{"text":" vào Quỹ Bãi Đỗ Xe!","color":"yellow"}]
scoreboard players remove @s sb_money 100000
