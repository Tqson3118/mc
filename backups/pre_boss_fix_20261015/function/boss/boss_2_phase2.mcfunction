# ==============================================================================
# BOSS 2 — PHASE 2: KIỂM TRA VÀ KÍCH HOẠT (HP <= 150)
# Chỉ chạy 1 lần nhờ tag boss_2_phase2
# ==============================================================================

# Chỉ kích hoạt nếu boss chưa có tag phase2
execute as @e[tag=boss_2,limit=1] unless entity @s[tag=boss_2_phase2] run function skyblock:boss/boss_2_phase2_activate
