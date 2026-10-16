# Quà Tham Gia Tổ Đội Boss 5: Cổ Thần Thâm Uyên
scoreboard players add @s eco_add 5000
scoreboard players add @s gems_add 50
experience add @s 1500 points
give @s trial_key[custom_data={crate_key:"gold"},item_name='{"text":"Chìa Khóa Hoàng Kim","color":"gold","bold":true}'] 1
tellraw @s [{"text":"[Quà Tổ Đội] ","color":"gold","bold":true},{"text":"Bạn nhận được Rương Tham Gia Boss 5: ","color":"yellow"},{"text":"+$5,000 Xu, +50 Linh Thạch, 1500 EXP & 1 Chìa Khóa Hoàng Kim!","color":"green","bold":true}]
playsound minecraft:ui.toast.challenge_complete player @s ~ ~ ~ 1.2 1.2
