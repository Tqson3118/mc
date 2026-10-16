# ==============================================================================
# BOSS 4 — SKILL A: HỐ ĐEN (VOID VORTEX)
# Kéo người chơi trong arena về phía boss bằng teleport
# Arena Boss 4: X=-45..−23, Y=108..128, Z=100..130
# Tâm Boss 4: X=-35, Y=111, Z=115
# ==============================================================================

# Teleport người chơi gần boss (cách boss > 3 block) về gần tâm boss
execute at @e[tag=boss_4,limit=1] as @a[distance=3..35] run tp @s ~ ~ ~

# Hiệu ứng hạt hố đen quanh boss
execute at @e[tag=boss_4,limit=1] run particle minecraft:reverse_portal ~ ~2 ~ 4 2 4 0.1 200 force
execute at @e[tag=boss_4,limit=1] run particle minecraft:portal ~ ~1 ~ 3 1 3 0.3 150 force

# Âm thanh hút quanh boss
execute at @e[tag=boss_4,limit=1] run playsound minecraft:block.beacon.activate master @a[distance=..40] ~ ~ ~ 4.0 0.5
execute at @e[tag=boss_4,limit=1] run playsound minecraft:entity.warden.sonic_boom master @a[distance=..40] ~ ~ ~ 3.0 0.8

# Gây Darkness cho người chơi gần boss
execute at @e[tag=boss_4,limit=1] run effect give @a[distance=..35] minecraft:darkness 3 0 false

# Thông báo actionbar cho người chơi gần boss
execute at @e[tag=boss_4,limit=1] as @a[distance=..35] run title @s actionbar {"text":"🌌 HƯ KHÔNG CHI VƯƠNG: HỐ ĐEN! 🌌","color":"dark_purple","bold":true}
