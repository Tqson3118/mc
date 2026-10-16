# ==============================================================================
# SKYBLOCK BUILDER - HOÀN TÁC VƯỜN HOA ZEN SUỐI NƯỚC (/IS UNDO)
# ==============================================================================
# Chỉ dọn các khối cây cỏ, hồ nước và rêu của vườn Zen, bảo toàn rương và đảo
# ==============================================================================

execute at @s run playsound minecraft:block.grass.break master @a ~ ~ ~ 1.5 1.0
execute at @s run playsound minecraft:entity.iron_golem.repair player @s ~ ~ ~ 1.2 1.2

# Dọn các khối đặc thù của Vườn Hoa Zen
execute at @s run fill ~-18 ~-2 ~-5 ~18 ~12 ~25 air replace moss_block
execute at @s run fill ~-18 ~-2 ~-5 ~18 ~12 ~25 air replace mossy_cobblestone
execute at @s run fill ~-18 ~-2 ~-5 ~18 ~12 ~25 air replace prismarine_bricks
execute at @s run fill ~-18 ~-2 ~-5 ~18 ~12 ~25 air replace water
execute at @s run fill ~-18 ~-2 ~-5 ~18 ~12 ~25 air replace lily_pad
execute at @s run fill ~-18 ~-2 ~-5 ~18 ~12 ~25 air replace sea_pickle
execute at @s run fill ~-18 ~-2 ~-5 ~18 ~12 ~25 air replace spruce_stairs
execute at @s run fill ~-18 ~-2 ~-5 ~18 ~12 ~25 air replace spruce_slab
execute at @s run fill ~-18 ~-2 ~-5 ~18 ~12 ~25 air replace spruce_fence
execute at @s run fill ~-18 ~-2 ~-5 ~18 ~12 ~25 air replace cherry_leaves
execute at @s run fill ~-18 ~-2 ~-5 ~18 ~12 ~25 air replace cherry_log
execute at @s run fill ~-18 ~-2 ~-5 ~18 ~12 ~25 air replace flowering_azalea
execute at @s run fill ~-18 ~-2 ~-5 ~18 ~12 ~25 air replace azalea
execute at @s run fill ~-18 ~-2 ~-5 ~18 ~12 ~25 air replace peony
execute at @s run fill ~-18 ~-2 ~-5 ~18 ~12 ~25 air replace rose_bush
execute at @s run fill ~-18 ~-2 ~-5 ~18 ~12 ~25 air replace mossy_stone_brick_wall

tag @s remove built_garden

tellraw @s [{"text":"\n🧹 [HOÀN TÁC THÀNH CÔNG] ","color":"green","bold":true},{"text":"Đã dọn dẹp sạch toàn bộ khối của Vườn Hoa Zen Suối Nước!\n","color":"yellow"},{"text":"Đảo của bạn đã được khôi phục nguyên trạng an toàn.","color":"aqua"}]
