# Xử lý khi Boss 1 (Nữ Hoàng Nhện) bị tiêu diệt
scoreboard players set #boss_1_alive boss_status 0
setblock -13 113 60 oak_wall_sign[facing=east]{front_text:{has_glowing_text:1b,messages:['{"text":"[ BOSS 1 ]","color":"gold","bold":true}','{"text":"Động Nữ Hoàng Nhện","color":"yellow"}','{"text":"Trạng thái:","color":"gray"}','{"text":"● SẴN SÀNG","color":"green","bold":true}']}}

# 1. Tìm người chơi trong world_boss tại Đấu Trường 1 (-180, 101, -180)
execute in minecraft:world_boss as @p[x=-180,y=101,z=-180,distance=..60] at @s run function skyblock:boss/announce_boss_1

# 2. Tìm người chơi trong overworld tại Động Nhện (-29, 111, 85)
execute in minecraft:overworld as @p[x=-42,y=108,z=73,dx=25,dy=20,dz=24] at @s run function skyblock:boss/announce_boss_1
execute in minecraft:overworld unless entity @p[x=-42,y=108,z=73,dx=25,dy=20,dz=24] as @p[x=-29,y=111,z=85,distance=..40] at @s run function skyblock:boss/announce_boss_1

# 3. Dự phòng bất kỳ người chơi nào gần nhất
execute unless entity @p[x=-180,y=101,z=-180,distance=..60] unless entity @p[x=-29,y=111,z=85,distance=..40] as @p at @s run function skyblock:boss/announce_boss_1
