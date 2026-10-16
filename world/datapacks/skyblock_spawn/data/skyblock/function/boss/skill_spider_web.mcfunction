# ==============================================================================
# BOSS 1 — SKILL A: PHUN TƠ ĐỘC
# Gây Poison + Slowness AOE cho toàn bộ người chơi trong arena Boss 1
# Arena Boss 1: X=-40..−18, Y=108..123, Z=75..95
# ==============================================================================

# Gây hiệu ứng độc và trói chân cho người chơi gần boss
execute at @e[tag=boss_1,limit=1] run effect give @a[distance=..35] minecraft:slowness 5 2 false
execute at @e[tag=boss_1,limit=1] run effect give @a[distance=..35] minecraft:poison 3 0 false

# Hiệu ứng hạt tơ nhện xung quanh boss
execute at @e[tag=boss_1,limit=1] run particle minecraft:item_slime ~ ~1 ~ 3 1 3 0.1 80 force
execute at @e[tag=boss_1,limit=1] run particle minecraft:witch ~ ~1 ~ 2 1 2 0.05 30 force

# Âm thanh
execute at @e[tag=boss_1,limit=1] run playsound minecraft:entity.spider.ambient master @a[distance=..35] ~ ~ ~ 3.0 0.5

# Thông báo actionbar cho người chơi gần boss
execute at @e[tag=boss_1,limit=1] as @a[distance=..35] run title @s actionbar {"text":"🕸 NỮ HOÀNG: PHUN TƠ ĐỘC! 🕸","color":"dark_green","bold":true}
