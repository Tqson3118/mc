# Xử lý khi Boss 3 (Chúa Tể Bóng Tối) bị tiêu diệt
scoreboard players set #boss_3_alive boss_status 0
setblock -1 113 69 oak_wall_sign[facing=south]{front_text:{has_glowing_text:1b,messages:['{"text":"[ BOSS 3 ]","color":"gold","bold":true}','{"text":"Thành Trì Chúa Tể","color":"yellow"}','{"text":"Trạng thái:","color":"gray"}','{"text":"● SẴN SÀNG","color":"green","bold":true}']}}

# 1. Tìm người chơi trong world_boss tại Đấu Trường 3 (-180, 101, 180)
execute in minecraft:world_boss as @p[x=-180,y=101,z=180,distance=..60] at @s run function skyblock:boss/announce_boss_3

# 2. Tìm người chơi trong overworld tại Thành Trì (0, 111, 115)
execute in minecraft:overworld as @p[x=-19,y=108,z=98,dx=38,dy=20,dz=34] at @s run function skyblock:boss/announce_boss_3
execute in minecraft:overworld unless entity @p[x=-19,y=108,z=98,dx=38,dy=20,dz=34] as @p[x=0,y=111,z=115,distance=..40] at @s run function skyblock:boss/announce_boss_3

# 3. Dự phòng bất kỳ người chơi nào gần nhất
execute unless entity @p[x=-180,y=101,z=180,distance=..60] unless entity @p[x=0,y=111,z=115,distance=..40] as @p at @s run function skyblock:boss/announce_boss_3
