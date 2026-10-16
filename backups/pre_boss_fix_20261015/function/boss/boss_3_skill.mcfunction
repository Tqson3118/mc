# ==============================================================================
# KỸ NĂNG BOSS 3: CHỌN VÀ THỰC HIỆN KỸ NĂNG XEN KẼ
# Skill A (lượt lẻ): Nọc Độc AOE — Area Effect Cloud poison
# Skill B (lượt chẵn): Bão Sấm Sét — Lightning Beam dọc arena
# ==============================================================================

# Tăng lượt kỹ năng
scoreboard players add #boss3_skill_turn boss_skill_rng 1

# Lượt 1: Skill A — Nọc Độc AOE
execute if score #boss3_skill_turn boss_skill_rng matches 1 run function skyblock:boss/skill_poison_cloud

# Lượt 2 trở lên: Skill B — Bão Sấm Sét — rồi reset
execute if score #boss3_skill_turn boss_skill_rng matches 2.. run function skyblock:boss/skill_lightning_beam
execute if score #boss3_skill_turn boss_skill_rng matches 2.. run scoreboard players set #boss3_skill_turn boss_skill_rng 0
