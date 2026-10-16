# Xử lý khi Boss 4 (Chúa Tể Hư Không) bị tiêu diệt
scoreboard players set #boss_4_alive boss_status 0
scoreboard players set #boss_4_rewarded boss_status 0
setblock -13 113 66 oak_wall_sign[facing=east]{front_text:{has_glowing_text:1b,messages:['{"text":"[ BOSS 4 ]","color":"gold","bold":true}','{"text":"Thánh Địa Hư Không","color":"yellow"}','{"text":"Trạng thái:","color":"gray"}','{"text":"● SẴN SÀNG","color":"green","bold":true}']}}

# 1. Tìm người chơi trong world_boss tại Đấu Trường 4 (180, 101, 180)
execute in minecraft:world_boss as @p[x=180,y=101,z=180,distance=..60] at @s run function skyblock:boss/announce_boss_4

# 2. Tìm người chơi trong overworld tại Thánh Địa (-35, 111, 115)
execute if score #boss_4_rewarded boss_status matches 0 in minecraft:overworld as @p[x=-47,y=108,z=98,dx=24,dy=20,dz=34] at @s run function skyblock:boss/announce_boss_4
execute if score #boss_4_rewarded boss_status matches 0 in minecraft:overworld unless entity @p[x=-47,y=108,z=98,dx=24,dy=20,dz=34] as @p[x=-35,y=111,z=115,distance=..40] at @s run function skyblock:boss/announce_boss_4

# 3. Dự phòng bất kỳ người chơi nào gần nhất
execute if score #boss_4_rewarded boss_status matches 0 in minecraft:world_boss as @p[distance=..200] at @s run function skyblock:boss/announce_boss_4
execute if score #boss_4_rewarded boss_status matches 0 as @p at @s run function skyblock:boss/announce_boss_4
