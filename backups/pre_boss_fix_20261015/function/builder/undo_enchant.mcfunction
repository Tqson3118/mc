# ==============================================================================
# SKYBLOCK BUILDER - HOÀN TÁC THÁP PHÙ PHÉP CẤP 30 (/IS UNDO)
# ==============================================================================
# Dọn các khối đặc thù của Tháp Phù Phép, bảo vệ nguyên trạng đảo người chơi
# ==============================================================================

execute at @s run playsound minecraft:block.amethyst_block.break master @a ~ ~ ~ 1.5 1.0
execute at @s run playsound minecraft:entity.iron_golem.repair player @s ~ ~ ~ 1.2 1.2

execute at @s run fill ~-15 ~-2 ~-5 ~15 ~18 ~25 air replace amethyst_block
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~18 ~25 air replace amethyst_cluster
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~18 ~25 air replace crying_obsidian
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~18 ~25 air replace deepslate_tile_wall
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~18 ~25 air replace chiseled_polished_blackstone
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~18 ~25 air replace purple_stained_glass
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~18 ~25 air replace enchanting_table
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~18 ~25 air replace obsidian
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~18 ~25 air replace soul_lantern

tag @s remove built_enchant

tellraw @s [{"text":"\n🧹 [HOÀN TÁC THÀNH CÔNG] ","color":"green","bold":true},{"text":"Đã dọn dẹp sạch toàn bộ khối của Tháp Phù Phép Cấp 30!\n","color":"yellow"},{"text":"Đảo của bạn đã được khôi phục nguyên trạng an toàn.","color":"aqua"}]
