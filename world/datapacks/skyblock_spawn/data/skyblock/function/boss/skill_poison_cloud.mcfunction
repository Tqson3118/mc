# ==============================================================================
# BOSS 3 — SKILL A: NỌC ĐỘC AOE (POISON CLOUD)
# Triệu hồi 3 Area Effect Cloud poison xung quanh boss
# Arena Boss 3: X=-18..18, Y=108..128, Z=100..130
# Tâm Boss 3: X=0, Y=111, Z=115
# ==============================================================================

# Triệu hồi 3 đám mây độc tại 3 vị trí xung quanh boss
execute at @e[tag=boss_3,limit=1] run summon area_effect_cloud ~3 ~1 ~3 {Radius:4f,RadiusPerTick:-0.005f,Duration:80,Particle:{type:"minecraft:entity_effect",options:{r:0.5,g:0.5,b:0.0,a:1.0}},Effects:[{id:"minecraft:poison",duration:80,amplifier:1}],Tags:["boss3_cloud"]}
execute at @e[tag=boss_3,limit=1] run summon area_effect_cloud ~-4 ~1 ~0 {Radius:4f,RadiusPerTick:-0.005f,Duration:80,Particle:{type:"minecraft:entity_effect",options:{r:0.5,g:0.5,b:0.0,a:1.0}},Effects:[{id:"minecraft:poison",duration:80,amplifier:1}],Tags:["boss3_cloud"]}
execute at @e[tag=boss_3,limit=1] run summon area_effect_cloud ~0 ~1 ~-5 {Radius:4f,RadiusPerTick:-0.005f,Duration:80,Particle:{type:"minecraft:entity_effect",options:{r:0.5,g:0.5,b:0.0,a:1.0}},Effects:[{id:"minecraft:poison",duration:80,amplifier:1}],Tags:["boss3_cloud"]}

# Hiệu ứng hạt độc quanh boss
execute at @e[tag=boss_3,limit=1] run particle minecraft:witch ~ ~1 ~ 4 2 4 0.05 60 force
execute at @e[tag=boss_3,limit=1] run particle minecraft:item_slime ~ ~1 ~ 3 1 3 0.1 40 force

# Âm thanh quanh boss
execute at @e[tag=boss_3,limit=1] run playsound minecraft:entity.spider.ambient master @a[distance=..40] ~ ~ ~ 3.0 0.3
execute at @e[tag=boss_3,limit=1] run playsound minecraft:block.slime_block.place master @a[distance=..40] ~ ~ ~ 2.0 0.5

# Thông báo actionbar cho người chơi gần boss
execute at @e[tag=boss_3,limit=1] as @a[distance=..35] run title @s actionbar {"text":"☠ CHÚA TỂ: NỌC ĐỘC AOE HỦY DIỆT! ☠","color":"dark_green","bold":true}
