# ==============================================================================
# TICK KỸ NĂNG BOSS 1: NỮ HOÀNG NHỆN ĐỘC (150 HP)
# Chạy mỗi tick khi boss còn sống
# ==============================================================================

# Tăng timer mỗi tick
scoreboard players add #boss1 boss_1_timer 1

# Mỗi 100 tick (~5 giây): kích hoạt kỹ năng ngẫu nhiên
execute if score #boss1 boss_1_timer matches 100.. run function skyblock:boss/boss_1_skill
execute if score #boss1 boss_1_timer matches 100.. run scoreboard players set #boss1 boss_1_timer 0

# Kiểm tra Phase 2: HP <= 75 (50% của 150 HP)
execute as @e[tag=boss_1,limit=1] store result score #boss1_hp boss_skill_rng run data get entity @s Health
execute if score #boss1_hp boss_skill_rng matches ..75 run function skyblock:boss/boss_1_phase2
