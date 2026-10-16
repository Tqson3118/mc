# ==============================================================================
# KỸ NĂNG BOSS 1: CHỌN VÀ THỰC HIỆN KỸ NĂNG XEN KẼ
# Skill A (lượt lẻ): Phun Tơ Độc — Poison + Slowness AOE
# Skill B (lượt chẵn): Bẫy Tơ Nhện — Teleport người chơi về tâm boss
# ==============================================================================

# Tăng lượt kỹ năng (0 → 1 → 2 → reset về 0)
scoreboard players add #boss1_skill_turn boss_skill_rng 1

# Lượt 1: Skill A — Phun Tơ Độc
execute if score #boss1_skill_turn boss_skill_rng matches 1 run function skyblock:boss/skill_spider_web

# Lượt 2 trở lên: Skill B — Bẫy Tơ Nhện — rồi reset
execute if score #boss1_skill_turn boss_skill_rng matches 2.. run function skyblock:boss/skill_spider_teleport
execute if score #boss1_skill_turn boss_skill_rng matches 2.. run scoreboard players set #boss1_skill_turn boss_skill_rng 0
