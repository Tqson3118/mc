# ==============================================================================
# SKYBLOCK BUILDER - HOÀN TÁC ĐÌNH CỔ PHƯƠNG ĐÔNG (/IS UNDO)
# ==============================================================================
# Dọn các khối đặc thù của Đình Cổ, bảo tồn đảo & rương người chơi
# ==============================================================================

execute at @s run playsound minecraft:block.wood.break master @a ~ ~ ~ 1.5 0.9
execute at @s run playsound minecraft:entity.iron_golem.repair player @s ~ ~ ~ 1.2 1.2

execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace polished_blackstone_bricks
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace polished_blackstone_brick_stairs
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace dark_prismarine
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace dark_prismarine_stairs
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace dark_prismarine_slab
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace stripped_dark_oak_log
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace spruce_fence
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace bell
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace flower_pot
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace lightning_rod

tag @s remove built_pagoda

tellraw @s [{"text":"\n🧹 [HOÀN TÁC THÀNH CÔNG] ","color":"green","bold":true},{"text":"Đã dọn dẹp sạch toàn bộ khối của Đình Cổ Phương Đông!\n","color":"yellow"},{"text":"Đảo của bạn đã được khôi phục nguyên trạng an toàn.","color":"aqua"}]
