# ==============================================================================
# SKYBLOCK BUILDER - HOÀN TÁC LÂU ĐÀI ĐÁ CỔ KÍNH (/IS UNDO)
# ==============================================================================
# Chỉ dọn các khối kiến trúc Lâu Đài, bảo vệ nguyên trạng đảo và rương đồ
# ==============================================================================

execute at @s run playsound minecraft:block.stone.break master @a ~ ~ ~ 1.5 0.8
execute at @s run playsound minecraft:entity.iron_golem.repair player @s ~ ~ ~ 1.2 1.2

# Dọn các khối đặc thù của Lâu Đài trong bán kính
execute at @s run fill ~-20 ~-2 ~-5 ~20 ~18 ~30 air replace stone_bricks
execute at @s run fill ~-20 ~-2 ~-5 ~20 ~18 ~30 air replace stone_brick_wall
execute at @s run fill ~-20 ~-2 ~-5 ~20 ~18 ~30 air replace deepslate_tiles
execute at @s run fill ~-20 ~-2 ~-5 ~20 ~18 ~30 air replace deepslate_brick_wall
execute at @s run fill ~-20 ~-2 ~-5 ~20 ~18 ~30 air replace deepslate_brick_stairs
execute at @s run fill ~-20 ~-2 ~-5 ~20 ~18 ~30 air replace red_carpet
execute at @s run fill ~-20 ~-2 ~-5 ~20 ~18 ~30 air replace soul_torch
execute at @s run fill ~-20 ~-2 ~-5 ~20 ~18 ~30 air replace soul_campfire
execute at @s run fill ~-20 ~-2 ~-5 ~20 ~18 ~30 air replace iron_bars
execute at @s run fill ~-20 ~-2 ~-5 ~20 ~18 ~30 air replace smooth_quartz
execute at @s run fill ~-20 ~-2 ~-5 ~20 ~18 ~30 air replace smooth_quartz_stairs
execute at @s run fill ~-20 ~-2 ~-5 ~20 ~18 ~30 air replace smooth_quartz_slab

tag @s remove built_castle

tellraw @s [{"text":"\n🧹 [HOÀN TÁC THÀNH CÔNG] ","color":"green","bold":true},{"text":"Đã dọn dẹp sạch toàn bộ khối của Lâu Đài Đá Cổ Kính!\n","color":"yellow"},{"text":"Đảo của bạn đã được khôi phục nguyên trạng an toàn.","color":"aqua"}]
