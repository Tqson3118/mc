# Xử lý khi Boss 2 (Đao Phủ Địa Ngục) bị tiêu diệt
scoreboard players set #boss_2_alive boss_status 0
setblock 13 113 60 oak_wall_sign[facing=west]{front_text:{has_glowing_text:1b,messages:['{"text":"[ BOSS 2 ]","color":"gold","bold":true}','{"text":"Vực Đao Phủ Địa Ngục","color":"yellow"}','{"text":"Trạng thái:","color":"gray"}','{"text":"● SẴN SÀNG","color":"green","bold":true}']}}

# Tìm người chơi trong khu vực vực lửa để vinh danh
execute in minecraft:overworld as @p[x=17,y=108,z=73,dx=25,dy=20,dz=24] at @s run function skyblock:boss/announce_boss_2

# Dự phòng nếu người chơi đứng hơi xa vực lửa
execute in minecraft:overworld unless entity @p[x=17,y=108,z=73,dx=25,dy=20,dz=24] as @p[x=29,y=111,z=85,distance=..40] at @s run function skyblock:boss/announce_boss_2

# Dự phòng nếu không có ai quanh đó
execute in minecraft:overworld unless entity @p[x=29,y=111,z=85,distance=..40] run tellraw @a [{"text":"[BOSS CẤP 2] ","color":"red","bold":true},{"text":"Đao Phủ Địa Ngục (300 HP) đã bị tiêu diệt!","color":"gold"}]
