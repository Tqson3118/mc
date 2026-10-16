scoreboard players set #boss_6_alive boss_status 0

# 1. Tìm người chơi trong world_boss tại Đấu Trường 6 (0, 242, 0)
execute in minecraft:world_boss as @p[x=0,y=242,z=0,distance=..60] at @s run function skyblock:boss/announce_boss_6

# 2. Tìm người chơi trong overworld (0, 137, 115)
execute in minecraft:overworld as @p[x=-20,y=134,z=98,dx=40,dy=25,dz=34] at @s run function skyblock:boss/announce_boss_6
execute in minecraft:overworld unless entity @p[x=-20,y=134,z=98,dx=40,dy=25,dz=34] as @p[x=0,y=137,z=115,distance=..50] at @s run function skyblock:boss/announce_boss_6

# 3. Dự phòng bất kỳ người chơi nào gần nhất
execute unless entity @p[x=0,y=242,z=0,distance=..60] unless entity @p[x=0,y=137,z=115,distance=..50] as @p at @s run function skyblock:boss/announce_boss_6
