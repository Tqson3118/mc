# ==============================================================================
# TICK KỸ NĂNG BOSS 4: CHÚA TỂ HƯ KHÔNG (1200 HP)
# Chạy mỗi tick khi boss còn sống
# ==============================================================================

# Tăng timer mỗi tick
scoreboard players add #boss4 boss_4_timer 1

# Mỗi 160 tick (~8 giây): kích hoạt kỹ năng ngẫu nhiên
execute if score #boss4 boss_4_timer matches 160.. run function skyblock:boss/boss_4_skill
execute if score #boss4 boss_4_timer matches 160.. run scoreboard players set #boss4 boss_4_timer 0

# Kiểm tra Phase 2: HP <= 600 (50% của 1200 HP)
execute as @e[tag=boss_4,limit=1] store result score #boss4_hp boss_skill_rng run data get entity @s Health
execute if score #boss4_hp boss_skill_rng matches ..600 run function skyblock:boss/boss_4_phase2
