# ==============================================================================
# TICK KỸ NĂNG BOSS 5: CỔ THẦN THÂM UYÊN (2500 HP)
# ==============================================================================
scoreboard players add #boss5 boss_5_timer 1

# Kỹ năng Sonic Boom & Darkness mỗi 120 ticks (6 giây)
execute as @e[tag=boss_5,limit=1] at @s if score #boss5 boss_5_timer matches 120.. run particle minecraft:sonic_boom ~ ~1.5 ~ 0 0 0 0 1 normal
execute as @e[tag=boss_5,limit=1] at @s if score #boss5 boss_5_timer matches 120.. run playsound minecraft:entity.warden.sonic_boom master @a ~ ~ ~ 2.0 1.0
execute as @e[tag=boss_5,limit=1] at @s if score #boss5 boss_5_timer matches 120.. run damage @a[distance=..25] 25 minecraft:sonic_boom by @s
execute as @e[tag=boss_5,limit=1] at @s if score #boss5 boss_5_timer matches 120.. run effect give @a[distance=..35] minecraft:darkness 6 0 true
execute if score #boss5 boss_5_timer matches 120.. run scoreboard players set #boss5 boss_5_timer 0

# Kiểm tra Phase 2 Nộ Huyết: HP <= 1250 (50% của 2500 HP)
execute as @e[tag=boss_5,limit=1] store result score #boss5_hp boss_skill_rng run data get entity @s Health
execute if score #boss5_hp boss_skill_rng matches ..1250 run function skyblock:boss/boss_5_phase2
