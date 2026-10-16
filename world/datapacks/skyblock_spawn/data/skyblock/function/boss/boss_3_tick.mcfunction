# ==============================================================================
# TICK KỸ NĂNG BOSS 3: CHÚA TỂ BÓNG TỐI (600 HP)
# Chạy mỗi tick khi boss còn sống
# ==============================================================================

# Tăng timer mỗi tick
scoreboard players add #boss3 boss_3_timer 1

# Mỗi 140 tick (~7 giây): kích hoạt kỹ năng ngẫu nhiên
execute if score #boss3 boss_3_timer matches 140.. run function skyblock:boss/boss_3_skill
execute if score #boss3 boss_3_timer matches 140.. run scoreboard players set #boss3 boss_3_timer 0

# Kiểm tra Phase 2: HP <= 300 (50% của 600 HP)
execute as @e[tag=boss_3,limit=1] store result score #boss3_hp boss_skill_rng run data get entity @s Health
execute if score #boss3_hp boss_skill_rng matches ..300 run function skyblock:boss/boss_3_phase2
