# Quà Tham Gia Tổ Đội Boss 6: Hoàng Đế Tinh Tú Vĩnh Hằng
scoreboard players add @s eco_add 15000
scoreboard players add @s gems_add 100
experience add @s 3000 points
give @s ominous_trial_key[custom_data={crate_key:"mythic"},item_name='{"text":"Chìa Khóa Thần Thoại","color":"light_purple","bold":true}'] 1
tellraw @s [{"text":"[Quà Tổ Đội] ","color":"gold","bold":true},{"text":"Bạn nhận được Rương Tham Gia Boss 6: ","color":"yellow"},{"text":"+$15,000 Xu, +100 Linh Thạch, 3000 EXP & 1 Chìa Khóa Thần Thoại!","color":"green","bold":true}]
playsound minecraft:ui.toast.challenge_complete player @s ~ ~ ~ 1.5 1.2
