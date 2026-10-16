# ==============================================================================
# MASTER BUILDER: KÍCH HOẠT TÁI TẠO 6 THẾ GIỚI 1000x1000
# ==============================================================================
tellraw @a [{"text":"[Server] ","color":"gold","bold":true},{"text":"Bắt đầu thi công toàn diện 6 Đại Thế Giới 1000x1000...","color":"yellow"}]
execute in minecraft:overworld run function skyblock:builder/world_spawn_1000
execute in minecraft:world_boss run function skyblock:builder/world_boss_1000
execute in minecraft:world_farm run function skyblock:builder/world_farm_1000
execute in minecraft:world_cauca run function skyblock:builder/world_cauca_1000
execute in minecraft:world_parkour run function skyblock:builder/world_parkour_1000
execute in minecraft:world_casino run function skyblock:builder/world_casino_1000
tellraw @a [{"text":"[Server] ","color":"gold","bold":true},{"text":"HOÀN TẤT 100% CẢ 6 ĐẠI THẾ GIỚI 1000x1000 KHÔNG LỖI!","color":"green","bold":true}]
