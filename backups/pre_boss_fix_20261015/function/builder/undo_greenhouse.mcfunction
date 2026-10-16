# ==============================================================================
# SKYBLOCK BUILDER - HOÀN TÁC NHÀ KÍNH SINH THÁI (/IS UNDO)
# ==============================================================================
# Dọn các khối đặc thù của Nhà Kính, bảo tồn đảo người chơi
# ==============================================================================

execute at @s run playsound minecraft:block.crop.break master @a ~ ~ ~ 1.5 1.0
execute at @s run playsound minecraft:entity.iron_golem.repair player @s ~ ~ ~ 1.2 1.2

execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace carrots
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace potatoes
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace beetroots
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace sugar_cane
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace melon
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace beehive
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace rose_bush
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace peony
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace glass
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace tinted_glass
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace shroomlight
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace stripped_spruce_log
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace mossy_stone_bricks
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace mossy_cobblestone
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace spruce_door

tag @s remove built_greenhouse

tellraw @s [{"text":"\n🧹 [HOÀN TÁC THÀNH CÔNG] ","color":"green","bold":true},{"text":"Đã dọn dẹp sạch toàn bộ khối của Nhà Kính Sinh Thái!\n","color":"yellow"},{"text":"Đảo của bạn đã được khôi phục nguyên trạng an toàn.","color":"aqua"}]
