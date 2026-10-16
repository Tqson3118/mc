execute at @s run playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 1.0 1.5
tellraw @a [{"text":"☕ [BÃI ĐỖ XE JACKPOT] ","color":"gold","bold":true},{"selector":"@s","color":"yellow","bold":true},{"text":" vừa trúng toàn bộ QUỸ TIỀN BÃI XE: ","color":"yellow"},{"text":"+$500,000 xu!","color":"green","bold":true}]
scoreboard players add @s eco_add 500000
