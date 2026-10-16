# ==============================================================================
# SKYBLOCK BUILDER - HOÀN TÁC CỔNG DI TÍCH ĐỊA NGỤC (/IS UNDO)
# ==============================================================================
# Dọn các khối đặc thù của Cổng Nether Cổ Đại, bảo vệ nguyên trạng đảo người chơi
# ==============================================================================

execute at @s run playsound minecraft:block.portal.travel master @a ~ ~ ~ 1.5 0.8
execute at @s run playsound minecraft:entity.iron_golem.repair player @s ~ ~ ~ 1.2 1.2

execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace nether_portal
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace obsidian
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace crying_obsidian
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace gilded_blackstone
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace magma_block
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace cracked_polished_blackstone_bricks
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace wither_skeleton_skull
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace soul_campfire
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace chain
execute at @s run fill ~-15 ~-2 ~-5 ~15 ~15 ~25 air replace lava

tag @s remove built_nethergate

tellraw @s [{"text":"\n🧹 [HOÀN TÁC THÀNH CÔNG] ","color":"green","bold":true},{"text":"Đã dọn dẹp sạch toàn bộ khối của Cổng Di Tích Địa Ngục!\n","color":"yellow"},{"text":"Đảo của bạn đã được khôi phục nguyên trạng an toàn.","color":"aqua"}]
