# ==============================================================================
# SKYBLOCK - HOÀN TÁC / ROLLBACK TRẠM FARM THỦY HỎA
# ==============================================================================
# Chỉ dọn dẹp các khối vật liệu thuộc về build_lava_water_farm, không đụng tới đảo
# ==============================================================================

execute at @s run playsound minecraft:block.lava.extinguish master @a ~ ~ ~ 1.5 1.0
execute at @s run playsound minecraft:entity.item.break player @s ~ ~ ~ 1.2 1.0

# Dọn các khối đặc thù của công trình trong bán kính quanh người chơi
execute at @s run fill ~-20 ~-5 ~-20 ~20 ~15 ~20 air replace deepslate_tiles
execute at @s run fill ~-20 ~-5 ~-20 ~20 ~15 ~20 air replace deepslate_bricks
execute at @s run fill ~-20 ~-5 ~-20 ~20 ~15 ~20 air replace deepslate_brick_wall
execute at @s run fill ~-20 ~-5 ~-20 ~20 ~15 ~20 air replace smooth_quartz
execute at @s run fill ~-20 ~-5 ~-20 ~20 ~15 ~20 air replace smooth_quartz_slab
execute at @s run fill ~-20 ~-5 ~-20 ~20 ~15 ~20 air replace sea_lantern
execute at @s run fill ~-20 ~-5 ~-20 ~20 ~15 ~20 air replace orange_stained_glass
execute at @s run fill ~-20 ~-5 ~-20 ~20 ~15 ~20 air replace cyan_stained_glass
execute at @s run fill ~-20 ~-5 ~-20 ~20 ~15 ~20 air replace tinted_glass
execute at @s run fill ~-20 ~-5 ~-20 ~20 ~15 ~20 air replace shroomlight
execute at @s run fill ~-20 ~-5 ~-20 ~20 ~15 ~20 air replace lava_cauldron
execute at @s run fill ~-20 ~-5 ~-20 ~20 ~15 ~20 air replace water_cauldron
execute at @s run fill ~-20 ~-5 ~-20 ~20 ~15 ~20 air replace cauldron
execute at @s run fill ~-20 ~-5 ~-20 ~20 ~15 ~20 air replace pointed_dripstone
execute at @s run fill ~-20 ~-5 ~-20 ~20 ~15 ~20 air replace prismarine_bricks

tellraw @s [{"text":"\n🧹 [HOÀN TÁC THÀNH CÔNG] ","color":"green","bold":true},{"text":"Đã dọn dẹp sạch toàn bộ các khối của Trạm Thủy Hỏa quanh bạn!\n","color":"yellow"},{"text":"Đảo của bạn đã trở lại nguyên trạng an toàn.","color":"aqua"}]
