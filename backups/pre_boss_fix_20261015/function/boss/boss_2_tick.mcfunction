# ==============================================================================
# TICK KỸ NĂNG BOSS 2: ĐAO PHỦ ĐỊA NGỤC (300 HP)
# Chạy mỗi tick khi boss còn sống
# ==============================================================================

# Tăng timer mỗi tick
scoreboard players add #boss2 boss_2_timer 1

# Mỗi 120 tick (~6 giây): kích hoạt kỹ năng ngẫu nhiên
execute if score #boss2 boss_2_timer matches 120.. run function skyblock:boss/boss_2_skill
execute if score #boss2 boss_2_timer matches 120.. run scoreboard players set #boss2 boss_2_timer 0

# Kiểm tra Phase 2: HP <= 150 (50% của 300 HP)
execute as @e[tag=boss_2,limit=1] store result score #boss2_hp boss_skill_rng run data get entity @s Health
execute if score #boss2_hp boss_skill_rng matches ..150 run function skyblock:boss/boss_2_phase2
