scoreboard players set @s ct_jail 0
execute at @s run playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1.0 1.2
tellraw @s [{"text":"🔓 [RA TÙ] ","color":"green","bold":true},{"text":"Tuyệt vời! Bạn đổ ra 2 số đôi (","color":"yellow"},{"score":{"name":"@s","objective":"ct_dice1"},"color":"aqua"},{"text":" = ","color":"yellow"},{"score":{"name":"@s","objective":"ct_dice2"},"color":"aqua"},{"text":") nên được RA TÙ TỰ DO!","color":"green","bold":true}]
function skyblock:cotyphu/roll_normal
