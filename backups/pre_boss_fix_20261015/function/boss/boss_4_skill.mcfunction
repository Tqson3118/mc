# ==============================================================================
# KỸ NĂNG BOSS 4: CHỌN VÀ THỰC HIỆN KỸ NĂNG XEN KẼ
# Skill A (lượt lẻ): Hố Đen — Kéo người chơi về phía boss
# Skill B (lượt chẵn): Mưa Đạn Huyền Không — Dragon breath + Levitation
# ==============================================================================

# Tăng lượt kỹ năng
scoreboard players add #boss4_skill_turn boss_skill_rng 1

# Lượt 1: Skill A — Hố Đen
execute if score #boss4_skill_turn boss_skill_rng matches 1 run function skyblock:boss/skill_void_vortex

# Lượt 2 trở lên: Skill B — Mưa Đạn Huyền Không — rồi reset
execute if score #boss4_skill_turn boss_skill_rng matches 2.. run function skyblock:boss/skill_orb_rain
execute if score #boss4_skill_turn boss_skill_rng matches 2.. run scoreboard players set #boss4_skill_turn boss_skill_rng 0
