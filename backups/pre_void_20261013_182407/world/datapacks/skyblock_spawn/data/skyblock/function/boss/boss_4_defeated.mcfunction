# Xử lý khi Boss 4 (Chúa Tể Hư Không) bị tiêu diệt
scoreboard players set #boss_4_alive boss_status 0
setblock -13 113 66 oak_wall_sign[facing=east]{front_text:{has_glowing_text:1b,messages:['{"text":"[ BOSS 4 ]","color":"gold","bold":true}','{"text":"Thánh Địa Hư Không","color":"yellow"}','{"text":"Trạng thái:","color":"gray"}','{"text":"● SẴN SÀNG","color":"green","bold":true}']}}

# Tìm người chơi trong khu vực thánh địa hư không để vinh danh
execute in minecraft:overworld as @p[x=-47,y=108,z=98,dx=24,dy=20,dz=34] at @s run function skyblock:boss/announce_boss_4

# Dự phòng nếu người chơi đứng hơi xa thánh địa
execute in minecraft:overworld unless entity @p[x=-47,y=108,z=98,dx=24,dy=20,dz=34] as @p[x=-35,y=111,z=115,distance=..40] at @s run function skyblock:boss/announce_boss_4

# Dự phòng nếu không có ai quanh đó
execute in minecraft:overworld unless entity @p[x=-35,y=111,z=115,distance=..40] run tellraw @a [{"text":"[WORLD BOSS CẤP 4] ","color":"dark_purple","bold":true},{"text":"Chúa Tể Hư Không Vô Tận (1200 HP) đã bị tiêu diệt!","color":"light_purple"}]
