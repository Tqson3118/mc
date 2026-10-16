# ==================================================
# HƯỚNG DẪN CHESTSHOP (CHỢ NGƯỜI CHƠI TỰ DO BUÔN BÁN)
# Vị trí: Cánh Tây (Đại Chợ Thương Gia) - X=-45, Y=121, Z=-5
# ==================================================
# Xóa vị trí cũ ở trục Bắc để tránh chắn đường
setblock 0 121 -9 air destroy
setblock 0 122 -9 air destroy
setblock -1 122 -9 air destroy
setblock 1 122 -9 air destroy

# Đặt quầy mẫu tại Cánh Tây (Đại Chợ Thương Gia)
setblock -46 121 -5 oak_planks
setblock -45 121 -5 chest[facing=east]
setblock -46 122 -5 oak_wall_sign[facing=east]{front_text:{has_glowing_text:1b,messages:['{"text":"sondzvc","color":"dark_blue"}','{"text":"64","color":"black"}','{"text":"B 100 : S 50","color":"black"}','{"text":"cobblestone","color":"black"}']}}
setblock -46 121 -6 oak_planks
setblock -46 122 -6 oak_wall_sign[facing=east]{front_text:{has_glowing_text:1b,messages:['{"text":"🛒 CÁCH TẠO SHOP 🛒","color":"gold","bold":true}','{"text":"1. Đặt rương trên đảo","color":"yellow"}','{"text":"2. Cắm biển lên rương","color":"yellow"}','{"text":"3. Dòng 1: Tên bạn","color":"green"}']}}
setblock -46 121 -4 oak_planks
setblock -46 122 -4 oak_wall_sign[facing=east]{front_text:{has_glowing_text:1b,messages:['{"text":"[ CÚ PHÁP BIỂN ]","color":"blue","bold":true}','{"text":"Dòng 2: Số lượng (vd: 1)","color":"white"}','{"text":"Dòng 3: B <giá> : S <giá>","color":"gold"}','{"text":"Dòng 4: Tên item (hoặc ?)","color":"green"}']}}


