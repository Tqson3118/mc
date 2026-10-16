# Xử lý khi Boss 2 (Đao Phủ Địa Ngục) bị tiêu diệt
scoreboard players set #boss_2_alive boss_status 0
scoreboard players set #boss_2_rewarded boss_status 0
setblock 13 113 60 oak_wall_sign[facing=west]{front_text:{has_glowing_text:1b,messages:['{"text":"[ BOSS 2 ]","color":"gold","bold":true}','{"text":"Vực Đao Phủ Địa Ngục","color":"yellow"}','{"text":"Trạng thái:","color":"gray"}','{"text":"● SẴN SÀNG","color":"green","bold":true}']}}

# 1. Tìm người chơi trong world_boss tại Đấu Trường 2 (180, 101, -180)
execute in minecraft:world_boss as @p[x=180,y=101,z=-180,distance=..60] at @s run function skyblock:boss/announce_boss_2

# 2. Tìm người chơi trong overworld tại Vực Lửa (29, 111, 85)
execute if score #boss_2_rewarded boss_status matches 0 in minecraft:overworld as @p[x=17,y=108,z=73,dx=25,dy=20,dz=24] at @s run function skyblock:boss/announce_boss_2
execute if score #boss_2_rewarded boss_status matches 0 in minecraft:overworld unless entity @p[x=17,y=108,z=73,dx=25,dy=20,dz=24] as @p[x=29,y=111,z=85,distance=..40] at @s run function skyblock:boss/announce_boss_2

# 3. Dự phòng bất kỳ người chơi nào gần nhất
execute if score #boss_2_rewarded boss_status matches 0 in minecraft:world_boss as @p[distance=..200] at @s run function skyblock:boss/announce_boss_2
execute if score #boss_2_rewarded boss_status matches 0 as @p at @s run function skyblock:boss/announce_boss_2
