# ==============================================================================
# TICK KỸ NĂNG BOSS 6: HOÀNG ĐẾ TINH TÚ VĨNH HẰNG (5000 HP)
# ==============================================================================
scoreboard players add #boss6 boss_6_timer 1

# Kỹ năng Bão Thiên Thạch Sấm Sét mỗi 100 ticks (5 giây)
execute as @e[tag=boss_6,limit=1] at @s if score #boss6 boss_6_timer matches 100.. run particle minecraft:explosion_emitter ~ ~2 ~ 0 0 0 0 1 normal
execute as @e[tag=boss_6,limit=1] at @s if score #boss6 boss_6_timer matches 100.. run playsound minecraft:entity.lightning_bolt.thunder master @a ~ ~ ~ 2.5 1.0
execute as @e[tag=boss_6,limit=1] at @s if score #boss6 boss_6_timer matches 100.. as @a[distance=..30] run damage @s 35 minecraft:lightning_bolt by @e[tag=boss_6,limit=1]
execute as @e[tag=boss_6,limit=1] at @s if score #boss6 boss_6_timer matches 100.. run effect give @a[distance=..30] minecraft:slowness 4 2 true
execute if score #boss6 boss_6_timer matches 100.. run scoreboard players set #boss6 boss_6_timer 0

# Kiểm tra Phase 2 Nộ Sáng Thế: HP <= 2500 (50% của 5000 HP)
execute as @e[tag=boss_6,limit=1] store result score #boss6_hp boss_skill_rng run data get entity @s Health
execute if score #boss6_hp boss_skill_rng matches ..2500 run function skyblock:boss/boss_6_phase2
