# ==============================================================================
# SKYBLOCK BUILDER - HOÀN TÁC CĂN HỘ PENTHOUSE KÍNH (/IS UNDO)
# ==============================================================================
# Dọn các khối đặc thù của Penthouse Modern Skybox, bảo tồn đảo & rương người chơi
# ==============================================================================

execute at @s run playsound minecraft:block.glass.break master @a ~ ~ ~ 1.5 1.0
execute at @s run playsound minecraft:entity.iron_golem.repair player @s ~ ~ ~ 1.2 1.2

execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace smooth_quartz
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace smooth_quartz_slab
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace smooth_quartz_stairs
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace quartz_pillar
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace tinted_glass
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace glass
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace water
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace birch_stairs
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace birch_slab
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace black_bed
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace sea_pickle
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace iron_door

tag @s remove built_modern

tellraw @s [{"text":"\n🧹 [HOÀN TÁC THÀNH CÔNG] ","color":"green","bold":true},{"text":"Đã dọn dẹp sạch toàn bộ khối của Căn Hộ Penthouse!\n","color":"yellow"},{"text":"Đảo của bạn đã được khôi phục nguyên trạng an toàn.","color":"aqua"}]
