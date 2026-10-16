# ==============================================================================
# SKYBLOCK BUILDER - HOÀN TÁC HẢI ĐĂNG HƯ KHÔNG (/IS UNDO)
# ==============================================================================
# Dọn các khối đặc thù của Hải Đăng, bảo vệ nguyên trạng đảo người chơi
# ==============================================================================

execute at @s run playsound minecraft:block.stone.break master @a ~ ~ ~ 1.5 1.0
execute at @s run playsound minecraft:entity.iron_golem.repair player @s ~ ~ ~ 1.2 1.2

execute at @s run fill ~-15 ~-2 ~-5 ~15 ~20 ~25 air replace prismarine_bricks
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~20 ~25 air replace prismarine_brick_stairs
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~20 ~25 air replace red_concrete
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~20 ~25 air replace cut_copper_stairs
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~20 ~25 air replace cut_copper_slab
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~20 ~25 air replace ladder
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~20 ~25 air replace sea_lantern
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~20 ~25 air replace smooth_stone_slab

tag @s remove built_lighthouse

tellraw @s [{"text":"\n🧹 [HOÀN TÁC THÀNH CÔNG] ","color":"green","bold":true},{"text":"Đã dọn dẹp sạch toàn bộ khối của Hải Đăng Pha Lê!\n","color":"yellow"},{"text":"Đảo của bạn đã được khôi phục nguyên trạng an toàn.","color":"aqua"}]
