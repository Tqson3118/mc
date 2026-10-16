scoreboard players set #boss_5_alive boss_status 0

# 1. Tìm người chơi trong world_boss tại Đấu Trường 5 (0, 76, -300)
execute in minecraft:world_boss as @p[x=0,y=76,z=-300,distance=..60] at @s run function skyblock:boss/announce_boss_5

# 2. Tìm người chơi trong overworld (35, 111, 115)
execute in minecraft:overworld as @p[x=23,y=108,z=98,dx=24,dy=20,dz=34] at @s run function skyblock:boss/announce_boss_5
execute in minecraft:overworld unless entity @p[x=23,y=108,z=98,dx=24,dy=20,dz=34] as @p[x=35,y=111,z=115,distance=..45] at @s run function skyblock:boss/announce_boss_5

# 3. Dự phòng bất kỳ người chơi nào gần nhất
execute unless entity @p[x=0,y=76,z=-300,distance=..60] unless entity @p[x=35,y=111,z=115,distance=..45] as @p at @s run function skyblock:boss/announce_boss_5
