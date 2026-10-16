scoreboard players set #boss_5_alive boss_status 0
scoreboard players set #boss_5_rewarded boss_status 0

# 1. Tìm người chơi trong world_boss tại Đấu Trường 5 (0, 75, -300)
execute in minecraft:world_boss as @p[x=-45,y=65,z=-345,dx=90,dy=35,dz=90] at @s run function skyblock:boss/announce_boss_5
execute if score #boss_5_rewarded boss_status matches 0 in minecraft:world_boss as @p[x=0,y=75,z=-300,distance=..60] at @s run function skyblock:boss/announce_boss_5

# 2. Tìm người chơi trong overworld tại Thâm Uyên Cổ Điện (35, 111, 115) nếu chưa trao trong world_boss
execute if score #boss_5_rewarded boss_status matches 0 in minecraft:overworld as @p[x=23,y=108,z=98,dx=24,dy=20,dz=34] at @s run function skyblock:boss/announce_boss_5
execute if score #boss_5_rewarded boss_status matches 0 in minecraft:overworld as @p[x=35,y=111,z=115,distance=..45] at @s run function skyblock:boss/announce_boss_5

# 3. Dự phòng bất kỳ người chơi nào gần nhất nếu chưa trao thưởng
execute if score #boss_5_rewarded boss_status matches 0 in minecraft:world_boss as @p[distance=..200] at @s run function skyblock:boss/announce_boss_5
execute if score #boss_5_rewarded boss_status matches 0 as @p at @s run function skyblock:boss/announce_boss_5
