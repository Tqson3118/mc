# ==================================================
# HƯỚNG DẪN CHESTSHOP (CHỢ NGƯỜI CHƠI TỰ DO BUÔN BÁN)
# Vị trí: X=0, Y=121, Z=-9 (Quầy phía Bắc Spawn)
# ==================================================
setblock 0 121 -9 chest[facing=south]
setblock 0 122 -9 oak_wall_sign[facing=south]{front_text:{has_glowing_text:1b,messages:['{"text":"sondzvc","color":"dark_blue"}','{"text":"64","color":"black"}','{"text":"B 100 : S 50","color":"black"}','{"text":"cobblestone","color":"black"}']}}
setblock -1 122 -9 oak_wall_sign[facing=south]{front_text:{has_glowing_text:1b,messages:['{"text":"🛒 CÁCH TẠO SHOP 🛒","color":"gold","bold":true}','{"text":"1. Đặt rương trên đảo","color":"yellow"}','{"text":"2. Cắm biển lên rương","color":"yellow"}','{"text":"3. Dòng 1: Tên bạn","color":"green"}']}}
setblock 1 122 -9 oak_wall_sign[facing=south]{front_text:{has_glowing_text:1b,messages:['{"text":"[ CÚ PHÁP BIỂN ]","color":"blue","bold":true}','{"text":"Dòng 2: Số lượng (vd: 1)","color":"white"}','{"text":"Dòng 3: B <giá> : S <giá>","color":"gold"}','{"text":"Dòng 4: Tên item (hoặc ?)","color":"green"}']}}
