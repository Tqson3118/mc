# ==============================================================================
# BOSS 1 — PHASE 2: KIỂM TRA VÀ KÍCH HOẠT (HP <= 75)
# Chỉ chạy 1 lần nhờ tag boss_1_phase2
# ==============================================================================

# Chỉ kích hoạt nếu boss chưa có tag phase2
execute as @e[tag=boss_1,limit=1] unless entity @s[tag=boss_1_phase2] run function skyblock:boss/boss_1_phase2_activate
