# ==============================================================================
# BOSS 4 — PHASE 2: KIỂM TRA VÀ KÍCH HOẠT (HP <= 600)
# Chỉ chạy 1 lần nhờ tag boss_4_phase2
# ==============================================================================

# Chỉ kích hoạt nếu boss chưa có tag phase2
execute as @e[tag=boss_4,limit=1] unless entity @s[tag=boss_4_phase2] run function skyblock:boss/boss_4_phase2_activate
