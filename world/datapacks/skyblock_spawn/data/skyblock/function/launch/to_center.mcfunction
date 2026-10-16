# Launch Pad function: to_center
execute at @s run playsound minecraft:entity.wind_charge.wind_burst player @s ~ ~ ~ 2.0 1.2
execute at @s run playsound minecraft:entity.firework_rocket.launch player @s ~ ~ ~ 1.5 1.0
execute at @s run particle gust_emitter_large ~ ~ ~ 0 0 0 0 1 normal
execute at @s run particle cloud ~ ~ ~ 0.5 0.5 0.5 0.1 30 normal
execute at @s run title @s actionbar {"text":"⚡ ĐANG PHÓNG ĐẾN ĐẢO TRUNG TÂM SPAWN HUB... ⚡","color":"gold","bold":true}
effect give @s slow_falling 3 0 true
tp @s 0.5 122.0 0.5 0.0 0.0
execute at @s run playsound minecraft:block.amethyst_block.hit player @s ~ ~ ~ 1.5 1.5
execute at @s run particle portal ~ ~1 ~ 0.5 0.5 0.5 0.1 50 normal
