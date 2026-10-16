# ==============================================================================
# SKYBLOCK BUILDER - HOÀN TÁC CẦU TREO NGHỆ THUẬT (/IS UNDO)
# ==============================================================================
# Chỉ dọn các khối của Cầu Treo, bảo tồn rương đồ và nền đảo người chơi
# ==============================================================================

execute at @s run playsound minecraft:block.chain.break master @a ~ ~ ~ 1.5 1.0
execute at @s run playsound minecraft:entity.iron_golem.repair player @s ~ ~ ~ 1.2 1.2

# Dọn các khối đặc thù của Cầu Treo trong bán kính
execute at @s run fill ~-8 ~-2 ~-5 ~8 ~10 ~35 air replace chain
execute at @s run fill ~-8 ~-2 ~-5 ~8 ~10 ~35 air replace deepslate_brick_wall
execute at @s run fill ~-8 ~-2 ~-5 ~8 ~10 ~35 air replace spruce_fence
execute at @s run fill ~-8 ~-2 ~-5 ~8 ~10 ~35 air replace spruce_planks

tag @s remove built_bridge

tellraw @s [{"text":"\n🧹 [HOÀN TÁC THÀNH CÔNG] ","color":"green","bold":true},{"text":"Đã dọn dẹp sạch toàn bộ khối của Cầu Treo Nghệ Thuật!\n","color":"yellow"},{"text":"Đảo của bạn đã được khôi phục nguyên trạng an toàn.","color":"aqua"}]
