# ==============================================================================
# TỰ ĐỘNG TÁI SINH NÔNG SẢN RUỘNG BẬC THANG HOÀNG GIA (world_farm)
# ==============================================================================

# 1. Phục hồi đất cày và nước tưới tiêu nếu bị giẫm đạp thành đất thường hoặc mất nước
execute in minecraft:world_farm run fill -180 110 -30 -120 110 30 farmland[moisture=7] replace dirt
execute in minecraft:world_farm run fill -180 110 -30 -120 110 30 farmland[moisture=7] replace air
execute in minecraft:world_farm run fill -150 110 -35 -150 110 35 water replace air

# 2. Tự động trồng lại lúa mì chín vàng (age=7) tại luống lúa (-180..-120, Z: -30..-10)
execute in minecraft:world_farm run fill -180 111 -30 -120 111 -10 wheat[age=7] replace air

# 3. Tự động trồng lại cà rốt chín đỏ (age=7) tại luống cà rốt (-180..-120, Z: -5..10)
execute in minecraft:world_farm run fill -180 111 -5 -120 111 10 carrots[age=7] replace air

# 4. Tự động trồng lại khoai tây bội thu (age=7) tại luống khoai tây (-180..-120, Z: 15..30)
execute in minecraft:world_farm run fill -180 111 15 -120 111 30 potatoes[age=7] replace air
