# Xử lý khi Boss 1 (Nữ Hoàng Nhện) bị tiêu diệt
scoreboard players set #boss_1_alive boss_status 0
setblock -13 113 60 oak_wall_sign[facing=east]{front_text:{has_glowing_text:1b,messages:['{"text":"[ BOSS 1 ]","color":"gold","bold":true}','{"text":"Động Nữ Hoàng Nhện","color":"yellow"}','{"text":"Trạng thái:","color":"gray"}','{"text":"● SẴN SÀNG","color":"green","bold":true}']}}

# Tìm người chơi trong khu vực động nhện để vinh danh
execute in minecraft:overworld as @p[x=-42,y=108,z=73,dx=25,dy=20,dz=24] at @s run function skyblock:boss/announce_boss_1

# Dự phòng nếu người chơi đứng hơi xa động nhện
execute in minecraft:overworld unless entity @p[x=-42,y=108,z=73,dx=25,dy=20,dz=24] as @p[x=-29,y=111,z=85,distance=..40] at @s run function skyblock:boss/announce_boss_1

# Dự phòng nếu không có ai quanh đó
execute in minecraft:overworld unless entity @p[x=-29,y=111,z=85,distance=..40] run tellraw @a [{"text":"[BOSS CẤP 1] ","color":"green","bold":true},{"text":"Nữ Hoàng Nhện Độc (150 HP) đã bị tiêu diệt!","color":"yellow"}]
