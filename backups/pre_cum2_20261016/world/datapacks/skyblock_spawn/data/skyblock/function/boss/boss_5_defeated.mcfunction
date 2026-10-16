scoreboard players set #boss_5_alive boss_status 0
execute in minecraft:overworld as @p[x=23,y=108,z=98,dx=24,dy=20,dz=34] at @s run function skyblock:boss/announce_boss_5
execute in minecraft:overworld unless entity @p[x=23,y=108,z=98,dx=24,dy=20,dz=34] as @p[x=35,y=111,z=115,distance=..45] at @s run function skyblock:boss/announce_boss_5
