# Xử lý khi Boss 3 (Chúa Tể Bóng Tối) bị tiêu diệt
scoreboard players set #boss_3_alive boss_status 0
setblock -1 113 69 oak_wall_sign[facing=south]{front_text:{has_glowing_text:1b,messages:['{"text":"[ BOSS 3 ]","color":"gold","bold":true}','{"text":"Thành Trì Chúa Tể","color":"yellow"}','{"text":"Trạng thái:","color":"gray"}','{"text":"● SẴN SÀNG","color":"green","bold":true}']}}

# Tìm người chơi trong khu vực thành trì để vinh danh
execute in minecraft:overworld as @p[x=-19,y=108,z=98,dx=38,dy=20,dz=34] at @s run function skyblock:boss/announce_boss_3

# Dự phòng nếu người chơi đứng hơi xa thành trì
execute in minecraft:overworld unless entity @p[x=-19,y=108,z=98,dx=38,dy=20,dz=34] as @p[x=0,y=111,z=115,distance=..40] at @s run function skyblock:boss/announce_boss_3

# Dự phòng nếu không có ai quanh đó
execute in minecraft:overworld unless entity @p[x=0,y=111,z=115,distance=..40] run tellraw @a [{"text":"[BOSS TUẦN CẤP 3] ","color":"dark_red","bold":true},{"text":"Chúa Tể Bóng Tối (600 HP) đã bị tiêu diệt!","color":"yellow"}]
