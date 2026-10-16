# ==============================================================================
# SKYBLOCK BUILDER - HOÀN TÁC BIỆT THỰ GỖ CHERRY (/IS UNDO)
# ==============================================================================
# Chỉ dọn các khối đặc thù của Biệt Thự, bảo tồn hoàn toàn rương và đảo người chơi
# ==============================================================================

execute at @s run playsound minecraft:block.wood.break master @a ~ ~ ~ 1.5 1.0
execute at @s run playsound minecraft:entity.iron_golem.repair player @s ~ ~ ~ 1.2 1.2

# Dọn các khối kiến trúc biệt thự trong phạm vi quanh người chơi
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace cherry_planks
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace stripped_cherry_wood
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace cherry_stairs
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace cherry_slab
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace cherry_fence
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace cherry_door
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace pink_bed
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace tinted_glass
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace polished_deepslate

tag @s remove built_villa

tellraw @s [{"text":"\n🧹 [HOÀN TÁC THÀNH CÔNG] ","color":"green","bold":true},{"text":"Đã dọn dẹp sạch toàn bộ khối của Biệt Thự Hiện Đại!\n","color":"yellow"},{"text":"Đảo của bạn đã được khôi phục nguyên trạng an toàn.","color":"aqua"}]
