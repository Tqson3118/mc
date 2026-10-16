# ==============================================================================
# KỸ NĂNG BOSS 2: CHỌN VÀ THỰC HIỆN KỸ NĂNG XEN KẼ
# Skill A (lượt lẻ): Bão Lửa — Fireball mưa từ trên xuống
# Skill B (lượt chẵn): Mù Lòa Hắc Ám — Blindness + Wither AOE
# ==============================================================================

# Tăng lượt kỹ năng
scoreboard players add #boss2_skill_turn boss_skill_rng 1

# Lượt 1: Skill A — Bão Lửa
execute if score #boss2_skill_turn boss_skill_rng matches 1 run function skyblock:boss/skill_fire_storm

# Lượt 2 trở lên: Skill B — Mù Lòa — rồi reset
execute if score #boss2_skill_turn boss_skill_rng matches 2.. run function skyblock:boss/skill_hellfire_blindness
execute if score #boss2_skill_turn boss_skill_rng matches 2.. run scoreboard players set #boss2_skill_turn boss_skill_rng 0
