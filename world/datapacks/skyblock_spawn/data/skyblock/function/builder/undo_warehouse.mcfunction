# ==============================================================================
# SKYBLOCK BUILDER - HOÀN TÁC KHO LƯU TRỮ 36 RƯƠNG (/IS UNDO)
# ==============================================================================
# Dọn các khối đặc thù của Kho Lưu Trữ, bảo vệ nguyên trạng đảo người chơi
# ==============================================================================

execute at @s run playsound minecraft:block.stone.break master @a ~ ~ ~ 1.5 0.9
execute at @s run playsound minecraft:entity.iron_golem.repair player @s ~ ~ ~ 1.2 1.2

execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace deepslate_bricks
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace polished_deepslate
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace deepslate_tile_slab
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace chest
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace ender_chest
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace anvil
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace blast_furnace
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace smoker
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace stonecutter
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace iron_door

tag @s remove built_warehouse

tellraw @s [{"text":"\n🧹 [HOÀN TÁC THÀNH CÔNG] ","color":"green","bold":true},{"text":"Đã dọn dẹp sạch toàn bộ khối của Kho Lưu Trữ 36 Rương!\n","color":"yellow"},{"text":"Đảo của bạn đã được khôi phục nguyên trạng an toàn.","color":"aqua"}]
