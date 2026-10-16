# Nộp $50,000 xu để ra tù
execute if score @s ct_jail matches 1.. run scoreboard players remove @s sb_money 50000
execute if score @s ct_jail matches 1.. run scoreboard players set @s ct_jail 0
execute if score @s ct_jail matches 0 run execute at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1.0 1.5
execute if score @s ct_jail matches 0 run tellraw @s [{"text":"🔓 [RA TÙ THÀNH CÔNG] ","color":"green","bold":true},{"text":"Bạn đã nộp phạt $50,000 xu và được tự do!","color":"yellow"}]
