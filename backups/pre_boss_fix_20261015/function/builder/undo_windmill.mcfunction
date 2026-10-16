# ==============================================================================
# SKYBLOCK BUILDER - HOÀN TÁC CỐI XAY GIÓ & VỰA LÚA (/IS UNDO)
# ==============================================================================
# Dọn các khối đặc thù của Cối Xay Gió, bảo tồn đảo & rương người chơi
# ==============================================================================

execute at @s run playsound minecraft:block.crop.break master @a ~ ~ ~ 1.5 1.0
execute at @s run playsound minecraft:entity.iron_golem.repair player @s ~ ~ ~ 1.2 1.2

execute at @s run fill ~-15 ~-2 ~-5 ~15 ~18 ~25 air replace wheat
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~18 ~25 dirt replace farmland
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~18 ~25 air replace hay_block
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~18 ~25 air replace stone_bricks
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~18 ~25 air replace white_wool
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~18 ~25 air replace oak_fence
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~18 ~25 air replace grindstone
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~18 ~25 air replace lily_pad
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~18 ~25 air replace barrel
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~18 ~25 air replace oak_door

tag @s remove built_windmill

tellraw @s [{"text":"\n🧹 [HOÀN TÁC THÀNH CÔNG] ","color":"green","bold":true},{"text":"Đã dọn dẹp sạch toàn bộ khối của Cối Xay Gió & Vựa Lúa!\n","color":"yellow"},{"text":"Đảo của bạn đã được khôi phục nguyên trạng an toàn.","color":"aqua"}]
