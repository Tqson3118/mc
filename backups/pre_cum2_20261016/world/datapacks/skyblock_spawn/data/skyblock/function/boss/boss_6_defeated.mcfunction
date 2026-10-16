scoreboard players set #boss_6_alive boss_status 0
execute in minecraft:overworld as @p[x=-20,y=134,z=98,dx=40,dy=25,dz=34] at @s run function skyblock:boss/announce_boss_6
execute in minecraft:overworld unless entity @p[x=-20,y=134,z=98,dx=40,dy=25,dz=34] as @p[x=0,y=137,z=115,distance=..50] at @s run function skyblock:boss/announce_boss_6
