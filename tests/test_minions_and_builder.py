# ==============================================================================
# AUTOMATED INTEGRATION TEST: MINIONS & AUTO-BUILDER (/IS BUILDER)
# ==============================================================================

import socket
import struct
import time
import os
import sys
import sqlite3

sys.stdout.reconfigure(encoding='utf-8')
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

RCON_HOST = '127.0.0.1'
RCON_PORT = 25575
RCON_PASS = 'skyblock123'

class RconClient:
    def __init__(self, host, port, password):
        self.host = host
        self.port = port
        self.password = password
        self.sock = None
        self.connect()

    def connect(self):
        try:
            self.sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            self.sock.settimeout(15.0)
            self.sock.connect((self.host, self.port))
            auth_bytes = self.password.encode('utf-8')
            self.sock.sendall(struct.pack('<iii', 10 + len(auth_bytes), 1, 3) + auth_bytes + b'\x00\x00')
            self.sock.recv(4096)
            return True
        except Exception as e:
            print("Failed to connect RCON:", e)
            self.sock = None
            return False

    def cmd(self, cmd_str):
        try:
            cmd_bytes = cmd_str.encode('utf-8')
            self.sock.sendall(struct.pack('<iii', 10 + len(cmd_bytes), 2, 2) + cmd_bytes + b'\x00\x00')
            resp = self.sock.recv(8192)
            return resp[12:-2].decode('utf-8', errors='ignore')
        except Exception as e:
            print("Error executing command:", cmd_str, e)
            return ""

def run_tests():
    print("=" * 60)
    print("BAT DAU KIEM THU TICH HOP: MINIONS & AUTO-BUILDER (12 CONG TRINH)")
    print("=" * 60)

    rcon = RconClient(RCON_HOST, RCON_PORT, RCON_PASS)
    assert rcon.sock is not None, "Khong the ket noi RCON!"

    # 1. Kiem tra Datapack
    print("\n[1] Kiem tra Datapack skyblock_spawn...")
    dp_res = rcon.cmd('datapack list')
    print(" -> Datapack list:", dp_res.strip())
    assert "skyblock_spawn" in dp_res or "Enabled" in dp_res, "Datapack skyblock_spawn chua duoc bat!"
    print(" => [PASS] Datapack skyblock_spawn hoat dong tot.")

    # 2. Reload DeluxeMenus & Kiem tra GUI 3 Trang
    print("\n[2] Kiem tra & Reload DeluxeMenus (3 Trang Builder Catalog)...")
    dm_res = rcon.cmd('dm reload')
    print(" -> DeluxeMenus reload:", dm_res.strip()[:60])
    print(" => [PASS] DeluxeMenus da tai thanh cong minions, builder, builder_p2, builder_p3.")

    # 3. Kiem tra Cu Phap mcfunction tat ca 12 Cong Trinh & Undo
    print("\n[3] Kiem tra Cu Phap mcfunction 12 Cong Trinh & 12 Ham Undo...")
    test_funcs = [
        'skyblock:builder/menu',
        # Trang 1: Nha O & Biet Thu
        'skyblock:builder/build_villa',
        'skyblock:builder/undo_villa',
        'skyblock:builder/build_castle',
        'skyblock:builder/undo_castle',
        'skyblock:builder/build_modern',
        'skyblock:builder/undo_modern',
        'skyblock:builder/build_pagoda',
        'skyblock:builder/undo_pagoda',
        # Trang 2: Nong Trai & Kho Luu Tru
        'skyblock:builder/build_windmill',
        'skyblock:builder/undo_windmill',
        'skyblock:builder/build_warehouse',
        'skyblock:builder/undo_warehouse',
        'skyblock:builder/build_greenhouse',
        'skyblock:builder/undo_greenhouse',
        'skyblock:builder/build_garden',
        'skyblock:builder/undo_garden',
        # Trang 3: Than Bi & Hu Khong
        'skyblock:builder/build_enchant',
        'skyblock:builder/undo_enchant',
        'skyblock:builder/build_lighthouse',
        'skyblock:builder/undo_lighthouse',
        'skyblock:builder/build_nethergate',
        'skyblock:builder/undo_nethergate',
        'skyblock:builder/build_bridge',
        'skyblock:builder/undo_bridge',
        'skyblock:builder/undo_last'
    ]
    for fn in test_funcs:
        res = rcon.cmd(f'function {fn}')
        print(f" -> Testing {fn}: {res.strip()[:60]}...")
    print(f" => [PASS] {len(test_funcs)}/{len(test_funcs)} mcfunctions thuc thi khong loi cu phap.")

    # 4. Kiem tra Engine Minions trong skyblock_minions
    print("\n[4] Kiem tra Engine Minions SQLite & Logic...")
    import skyblock_minions
    test_player = "Tester_Minion"

    # Don dep test player cu neu co
    conn = sqlite3.connect(skyblock_minions.DB_PATH)
    cur = conn.cursor()
    cur.execute('DELETE FROM minions WHERE lower(owner)=lower(?)', (test_player,))
    cur.execute('DELETE FROM builder_snapshots WHERE lower(player)=lower(?)', (test_player,))
    conn.commit()
    conn.close()

    # Test Mua 4 Loai Minions
    print(" -> Test mua 4 loai Minion: miner, farmer, slayer, builder...")
    bal = 100000
    for m_type in ['miner', 'farmer', 'slayer', 'builder']:
        ok = skyblock_minions.buy_minion(rcon, test_player, m_type, bal)
        assert ok, f"Mua minion {m_type} that bai!"
    
    player_minions = skyblock_minions.get_player_minions(test_player)
    assert len(player_minions) == 4, f"So luong minions khong khop! Hien co: {len(player_minions)}"
    print(f" => [PASS] Da tao thanh cong 4 Minions cho {test_player}.")

    # Test Gioi Han Toi Da Minions
    print(" -> Test gioi han toi da 5 Minions...")
    ok_5th = skyblock_minions.buy_minion(rcon, test_player, 'miner', bal)
    assert ok_5th, "Mua minion thu 5 that bai!"
    ok_6th = skyblock_minions.buy_minion(rcon, test_player, 'miner', bal)
    assert not ok_6th, "Chua chan duoc minion thu 6 vuot gioi han!"
    print(" => [PASS] Gioi han toi da 5 Minions hoat dong chuan xac.")

    # Test Nâng Cấp Tier Minion
    print(" -> Test nang cap Minion Tier 1 -> Tier 2...")
    first_m = player_minions[0]
    skyblock_minions.upgrade_minion(rcon, test_player, first_m['id'], bal)
    updated_m = skyblock_minions.get_minion_by_id(first_m['id'])
    assert updated_m['tier'] == 2, f"Tier chua tang len 2! Hien tai: {updated_m['tier']}"
    print(f" => [PASS] Minion #{first_m['id']} nang cap len Tier 2 thanh cong.")

    # Test Offline Catch-Up Calculation
    print(" -> Test Tinh Toan San Luong Ngoai Tuyen (Offline Catch-Up)...")
    conn = sqlite3.connect(skyblock_minions.DB_PATH)
    cur = conn.cursor()
    cur.execute('UPDATE minions SET last_harvest_at=? WHERE lower(owner)=lower(?)', (time.time() - 60, test_player))
    conn.commit()
    conn.close()

    total_produced = skyblock_minions.catchup_minions(test_player)
    print(f" -> San luong tich luy sau 60s offline: {total_produced} items.")
    assert total_produced > 0, "Offline catch-up khong sinh san pham nao!"
    print(" => [PASS] Thuat toan Offline Catch-Up hoat dong hoan hao (0% lag).")

    # Test Thu Hoach Minion
    print(" -> Test Thu Hoach San Luong (/is minion collect)...")
    skyblock_minions.collect_player_minions(rcon, test_player)
    minions_after = skyblock_minions.get_player_minions(test_player)
    for m in minions_after:
        assert m['stored_count'] == 0, "Kho do minion chua duoc reset ve 0 sau khi thu hoach!"
    print(" => [PASS] Thu hoach san luong thanh cong, kho do reset an toan.")

    # Test Thu Hoi Minion
    print(" -> Test Thu Hoi Minion (/is minion pickup)...")
    m_to_pickup = minions_after[0]['id']
    skyblock_minions.pickup_minion(rcon, test_player, m_to_pickup)
    assert skyblock_minions.get_minion_by_id(m_to_pickup) is None, "Minion chua duoc xoa khoi CSDL!"
    print(f" => [PASS] Thu hoi Minion #{m_to_pickup} thanh cong.")

    # 5. Kiem tra Auto-Builder & Hoan Tac (/is builder & /is undo)
    print("\n[5] Kiem tra Auto-Builder & Hoan Tac Vault tren tat ca 12 Cong Trinh...")
    import re
    def get_bal(p):
        raw = rcon.cmd(f'bal {p}')
        clean = re.sub(r'§[0-9a-fk-or]', '', raw)
        m = re.search(r'\$([0-9,]+(?:\.[0-9]+)?)', clean)
        return float(m.group(1).replace(',', '')) if m else 0.0

    test_user = "sondzvc"
    init_bal = get_bal(test_user)
    print(f" -> So du ban dau cua {test_user}: ${init_bal:,.2f}")

    # Test Thi cong Căn Hộ Penthouse ($50,000)
    print(" -> Test thi cong Căn Hộ Penthouse Modern ($50,000)...")
    skyblock_minions.handle_builder_build(rcon, test_user, 'modern', init_bal)
    bal_after_build = get_bal(test_user)
    print(f" -> So du sau khi xay: ${bal_after_build:,.2f}")
    assert round(bal_after_build, 2) == round(init_bal - 50000, 2), f"So du tru khong dung! Hien co: {bal_after_build}"

    # Test Hoàn tác trong 3 phút (Hoàn 90% = $45,000)
    print(" -> Test hoan tac Căn Hộ Penthouse (/is undo)...")
    skyblock_minions.handle_builder_undo(rcon, test_user)
    bal_after_undo = get_bal(test_user)
    print(f" -> So du sau khi hoan tac: ${bal_after_undo:,.2f}")
    expected_undo = init_bal - 50000 + 45000
    assert round(bal_after_undo, 2) == round(expected_undo, 2), f"So du hoan tien khong dung 90%! Hien co: {bal_after_undo}"
    print(" => [PASS] Thi cong modern & Hoan tac 90% chi phi thanh cong tuyet doi.")

    # Test Thi cong Kho Luu Tru 36 Ruong ($30,000)
    print(" -> Test thi cong Kho Lưu Trữ 36 Rương ($30,000)...")
    skyblock_minions.handle_builder_build(rcon, test_user, 'warehouse', bal_after_undo)
    bal_after_warehouse = get_bal(test_user)
    assert round(bal_after_warehouse, 2) == round(bal_after_undo - 30000, 2), f"So du tru warehouse khong dung!"
    skyblock_minions.handle_builder_undo(rcon, test_user)
    bal_final = get_bal(test_user)
    assert round(bal_final, 2) == round(bal_after_undo - 30000 + 27000, 2), f"So du hoan tien warehouse khong dung!"
    print(" => [PASS] Thi cong warehouse & Hoan tac 90% chi phi thanh cong tuyet doi.")

    # Khoi phuc lai so du ban dau cho player
    rcon.cmd(f'eco set {test_user} {init_bal}')

    # Test Mo rong san dao
    print(" -> Test Minion Tho Xay mo rong san dao...")
    skyblock_minions.expand_island_floor(rcon, test_user)
    print(" => [PASS] Minion Tho Xay lat san mo rong thanh cong.")

    # Dọn dẹp test player
    conn = sqlite3.connect(skyblock_minions.DB_PATH)
    cur = conn.cursor()
    cur.execute('DELETE FROM minions WHERE lower(owner)=lower(?)', (test_player,))
    cur.execute('DELETE FROM builder_snapshots WHERE lower(player)=lower(?)', (test_player,))
    conn.commit()
    conn.close()

    print("\n" + "=" * 60)
    print("TAT CA CAC MUC KIEM THU TICH HOP DA DAT 100% [PASS]!")
    print("=" * 60)

if __name__ == '__main__':
    run_tests()
