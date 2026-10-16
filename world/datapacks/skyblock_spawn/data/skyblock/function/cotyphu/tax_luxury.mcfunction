execute at @s run playsound minecraft:entity.villager.no master @s ~ ~ ~ 1.0 1.0
tellraw @s [{"text":"💎 [THUẾ XA XỈ PHẨM] ","color":"dark_purple","bold":true},{"text":"Bạn là đại gia phải nộp phạt ","color":"yellow"},{"text":"$150,000 xu","color":"red","bold":true},{"text":" vào Quỹ Bãi Đỗ Xe!","color":"yellow"}]
scoreboard players remove @s sb_money 150000
