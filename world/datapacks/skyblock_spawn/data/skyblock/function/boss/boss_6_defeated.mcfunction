scoreboard players set #boss_6_alive boss_status 0
scoreboard players set #boss_6_rewarded boss_status 0

# 1. Tìm người chơi trong world_boss tại Đấu Trường 6 (0, 241, 0)
execute in minecraft:world_boss as @p[x=-50,y=230,z=-50,dx=100,dy=40,dz=100] at @s run function skyblock:boss/announce_boss_6
execute if score #boss_6_rewarded boss_status matches 0 in minecraft:world_boss as @p[x=0,y=241,z=0,distance=..70] at @s run function skyblock:boss/announce_boss_6

# 2. Tìm người chơi trong overworld tại Thiên Cung (0, 137, 115) nếu chưa trao trong world_boss
execute if score #boss_6_rewarded boss_status matches 0 in minecraft:overworld as @p[x=-20,y=134,z=98,dx=40,dy=25,dz=34] at @s run function skyblock:boss/announce_boss_6
execute if score #boss_6_rewarded boss_status matches 0 in minecraft:overworld as @p[x=0,y=137,z=115,distance=..50] at @s run function skyblock:boss/announce_boss_6

# 3. Dự phòng bất kỳ người chơi nào gần nhất nếu chưa trao thưởng
execute if score #boss_6_rewarded boss_status matches 0 in minecraft:world_boss as @p[distance=..200] at @s run function skyblock:boss/announce_boss_6
execute if score #boss_6_rewarded boss_status matches 0 as @p at @s run function skyblock:boss/announce_boss_6
