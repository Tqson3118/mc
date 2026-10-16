# -*- coding: utf-8 -*-
"""
SKYBLOCK AUCTION HOUSE SYSTEM (PAPER 1.21.4)
============================================
Auction House Engine using separate SQLite database 'auction.db'.
Features:
1. Player listings with 48h expiration.
2. 5% transaction tax (burnt on sale).
3. Mailbox system (/chợ mail / /ah mail) for expired / cancelled items.
4. Security validation: rejects items with custom_data like ancient_mat, totem, crate_key, royal_ticket.
5. Standardized ⟨Skyblock⟩ prefix with rich hover/click components.
"""

import sqlite3
import os
import time
import json
import re

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
DB_PATH = os.path.join(BASE_DIR, 'auction.db')

TAX_RATE = 0.05  # 5% transaction tax
LISTING_DURATION = 48 * 3600  # 48 hours

# Security blacklist for custom_data tags that cannot be traded on Auction House
DISALLOWED_CUSTOM_DATA = {
    "ancient_mat",
    "totem",
    "crate_key",
    "royal_ticket",
    "soul_fragment",
    "sea_scale",
    "storm_crystal"
}

def init_auction_db():
    conn = sqlite3.connect(DB_PATH)
    cur = conn.cursor()
    cur.execute('''
    CREATE TABLE IF NOT EXISTS listings (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        seller TEXT NOT NULL,
        item_id TEXT NOT NULL,
        count INTEGER NOT NULL,
        price INTEGER NOT NULL,
        snbt TEXT NOT NULL,
        display_name TEXT NOT NULL,
        category TEXT NOT NULL,
        created_at REAL NOT NULL,
        expires_at REAL NOT NULL,
        status TEXT DEFAULT 'active'
    )
    ''')
    cur.execute('''
    CREATE TABLE IF NOT EXISTS mail (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        recipient TEXT NOT NULL,
        item_id TEXT NOT NULL,
        count INTEGER NOT NULL,
        snbt TEXT NOT NULL,
        display_name TEXT NOT NULL,
        reason TEXT NOT NULL,
        created_at REAL NOT NULL,
        claimed INTEGER DEFAULT 0
    )
    ''')
    conn.commit()
    conn.close()

init_auction_db()

def categorize_item(item_id):
    iid = item_id.lower().replace("minecraft:", "")
    if any(k in iid for k in ["sword", "bow", "crossbow", "trident", "mace"]):
        return "weapon"
    if any(k in iid for k in ["helmet", "chestplate", "leggings", "boots", "shield"]):
        return "armor"
    if any(k in iid for k in ["pickaxe", "axe", "shovel", "hoe", "fishing_rod", "shears"]):
        return "tool"
    if any(k in iid for k in ["ore", "ingot", "raw_", "diamond", "emerald", "quartz", "redstone", "lapis", "copper", "netherite", "cobblestone", "stone", "obsidian", "debris"]):
        return "mining"
    if any(k in iid for k in ["wheat", "carrot", "potato", "melon", "pumpkin", "sugar_cane", "bamboo", "apple", "berries", "seeds"]):
        return "farming"
    return "misc"

def is_item_disallowed(snbt_str):
    """Checks if item contains forbidden custom_data that cannot be sold."""
    if not snbt_str:
        return False
    lower_snbt = snbt_str.lower()
    for tag in DISALLOWED_CUSTOM_DATA:
        if tag in lower_snbt:
            return True
    return False

def clean_display_name(raw_name, item_id):
    if raw_name:
        return raw_name
    iid = item_id.replace("minecraft:", "").replace("_", " ").title()
    return iid

class AuctionManager:
    def __init__(self, rcon, get_bal_fn, add_bal_fn):
        self.rcon = rcon
        self.get_bal = get_bal_fn
        self.add_bal = add_bal_fn

    def check_expired_listings(self):
        """Moves expired listings to the seller's mailbox."""
        now = time.time()
        conn = sqlite3.connect(DB_PATH)
        cur = conn.cursor()
        cur.execute("SELECT id, seller, item_id, count, snbt, display_name FROM listings WHERE status='active' AND expires_at <= ?", (now,))
        expired = cur.fetchall()
        for exp in expired:
            lid, seller, item_id, count, snbt, dname = exp
            cur.execute("UPDATE listings SET status='expired' WHERE id=?", (lid,))
            cur.execute(
                "INSERT INTO mail (recipient, item_id, count, snbt, display_name, reason, created_at, claimed) VALUES (?, ?, ?, ?, ?, 'expired', ?, 0)",
                (seller, item_id, count, snbt, dname, now)
            )
        conn.commit()
        conn.close()

    def list_item_from_hand(self, player, price_str):
        self.check_expired_listings()
        try:
            price = int(price_str.replace("k", "000").replace("m", "000000").replace(",", "").replace(".", ""))
            if price <= 0:
                raise ValueError
        except ValueError:
            self.rcon.cmd(f'tellraw {player} [{{"text":"⟨Skyblock⟩ ","color":"gold","bold":true}},{{"text":"Giá bán không hợp lệ! Dùng: ","color":"red"}},{{"text":"/chợ ban <giá>","color":"yellow","bold":true}},{{"text":" (Ví dụ: /chợ ban 5000 hoặc /ah sell 50k)","color":"gray"}}]')
            return

        # Check item in hand via RCON
        item_data = self.rcon.cmd(f"data get entity {player} SelectedItem")
        if not item_data or "id:" not in item_data or "SelectedItem: {}" in item_data:
            self.rcon.cmd(f'tellraw {player} [{{"text":"⟨Skyblock⟩ ","color":"gold","bold":true}},{{"text":"Bạn phải cầm vật phẩm trên tay để đăng bán!","color":"red"}}]')
            self.rcon.cmd(f"execute at {player} run playsound minecraft:block.stone_button.click_off player @s ~ ~ ~ 1.0 0.8")
            return

        # Check forbidden security tags
        if is_item_disallowed(item_data):
            self.rcon.cmd(f'tellraw {player} [{{"text":"⟨Skyblock⟩ ","color":"gold","bold":true}},{{"text":"Vật phẩm hệ thống đặc quyền (Bùa, Catalyst, Vé Vàng) bị cấm đăng lên Chợ Đấu Giá!","color":"red","bold":true}}]')
            self.rcon.cmd(f"execute at {player} run playsound minecraft:block.chest.locked player @s ~ ~ ~ 1.0 0.8")
            return

        # Extract item id, count, components
        m_id = re.search(r'id:\s*"([^"]+)"', item_data)
        m_count = re.search(r'count:\s*(\d+)b?', item_data)
        if not m_id:
            self.rcon.cmd(f'tellraw {player} [{{"text":"⟨Skyblock⟩ ","color":"gold","bold":true}},{{"text":"Không thể nhận diện vật phẩm trên tay!","color":"red"}}]')
            return

        item_id = m_id.group(1)
        count = int(m_count.group(1)) if m_count else 1

        # Extract components if any
        components_snbt = ""
        m_comp = re.search(r'components:\s*({.*})', item_data)
        if m_comp:
            components_snbt = m_comp.group(1)

        # Extract custom name
        display_name = clean_display_name("", item_id)
        m_name = re.search(r'custom_name:\s*\'({.*?})\'', item_data)
        if m_name:
            try:
                name_json = json.loads(m_name.group(1))
                if isinstance(name_json, dict) and "text" in name_json:
                    display_name = name_json["text"]
            except Exception:
                pass

        category = categorize_item(item_id)
        now = time.time()
        expires = now + LISTING_DURATION

        # Clear item from hand
        self.rcon.cmd(f"clear {player} {item_id} {count}")

        # Store in auction.db
        conn = sqlite3.connect(DB_PATH)
        cur = conn.cursor()
        cur.execute(
            '''INSERT INTO listings (seller, item_id, count, price, snbt, display_name, category, created_at, expires_at, status)
               VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, 'active')''',
            (player, item_id, count, price, components_snbt, display_name, category, now, expires)
        )
        listing_id = cur.lastrowid
        conn.commit()
        conn.close()

        tax_sample = int(price * TAX_RATE)
        self.rcon.cmd(f'tellraw {player} [{{"text":"⟨Skyblock⟩ ","color":"gold","bold":true}},{{"text":"Đăng bán thành công ","color":"green"}},{{"text":"{count}x {display_name}","color":"yellow","bold":true}},{{"text":" với giá ","color":"green"}},{{"text":"${price:,} Xu","color":"aqua","bold":true}},{{"text":" (Mã #{listing_id}, Thuế 5% ~ ${tax_sample:,} Xu khi bán). Thời hạn 48 giờ!","color":"gray"}}]')
        self.rcon.cmd(f"execute at {player} run playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 1.0 1.2")
        self.rcon.cmd(f'title {player} actionbar {{"text":"Đã đăng bán #{listing_id} thành công!","color":"green"}}')

    def buy_listing(self, player, listing_id_str):
        self.check_expired_listings()
        try:
            listing_id = int(listing_id_str)
        except ValueError:
            self.rcon.cmd(f'tellraw {player} [{{"text":"⟨Skyblock⟩ ","color":"gold","bold":true}},{{"text":"Mã vật phẩm không hợp lệ!","color":"red"}}]')
            return

        conn = sqlite3.connect(DB_PATH)
        cur = conn.cursor()
        cur.execute("SELECT id, seller, item_id, count, price, snbt, display_name, status, expires_at FROM listings WHERE id=?", (listing_id,))
        row = cur.fetchone()
        if not row:
            conn.close()
            self.rcon.cmd(f'tellraw {player} [{{"text":"⟨Skyblock⟩ ","color":"gold","bold":true}},{{"text":"Không tìm thấy mã đăng bán #{listing_id}!","color":"red"}}]')
            return

        lid, seller, item_id, count, price, snbt, dname, status, expires_at = row
        now = time.time()

        if status != 'active' or expires_at <= now:
            conn.close()
            self.rcon.cmd(f'tellraw {player} [{{"text":"⟨Skyblock⟩ ","color":"gold","bold":true}},{{"text":"Vật phẩm này đã được bán hoặc đã hết hạn!","color":"red"}}]')
            return

        if seller.lower() == player.lower():
            conn.close()
            self.rcon.cmd(f'tellraw {player} [{{"text":"⟨Skyblock⟩ ","color":"gold","bold":true}},{{"text":"Bạn không thể mua vật phẩm do chính mình đăng! Dùng /chợ huy {listing_id} để hủy bán.","color":"yellow"}}]')
            return

        # Check buyer balance
        buyer_bal = self.get_bal(player)
        if buyer_bal < price:
            conn.close()
            self.rcon.cmd(f'tellraw {player} [{{"text":"⟨Skyblock⟩ ","color":"gold","bold":true}},{{"text":"Bạn không đủ tiền! Cần ","color":"red"}},{{"text":"${price:,} Xu","color":"yellow","bold":true}},{{"text":" (Hiện có: ${buyer_bal:,} Xu).","color":"gray"}}]')
            self.rcon.cmd(f"execute at {player} run playsound minecraft:block.chest.locked player @s ~ ~ ~ 1.0 0.8")
            return

        # Deduct price from buyer
        self.add_bal(player, -price)

        # 5% tax deduction (burnt)
        tax = int(price * TAX_RATE)
        seller_receive = price - tax
        self.add_bal(seller, seller_receive)

        # Give item to buyer
        if snbt:
            give_cmd = f"give {player} {item_id}[{snbt}] {count}"
        else:
            give_cmd = f"give {player} {item_id} {count}"
        self.rcon.cmd(give_cmd)

        # Update listing status
        cur.execute("UPDATE listings SET status='sold' WHERE id=?", (listing_id,))
        conn.commit()
        conn.close()

        # Feedback
        self.rcon.cmd(f'tellraw {player} [{{"text":"⟨Skyblock⟩ ","color":"gold","bold":true}},{{"text":"Mua thành công ","color":"green"}},{{"text":"{count}x {dname}","color":"yellow","bold":true}},{{"text":" với giá ","color":"green"}},{{"text":"${price:,} Xu!","color":"aqua","bold":true}}]')
        self.rcon.cmd(f"execute at {player} run playsound minecraft:ui.toast.challenge_complete player @s ~ ~ ~ 1.0 1.2")
        self.rcon.cmd(f'title {player} actionbar {{"text":"Mua thành công {count}x {dname}!","color":"green"}}')

        # Notify seller if online
        self.rcon.cmd(f'tellraw {seller} [{{"text":"⟨Skyblock⟩ ","color":"gold","bold":true}},{{"text":"Vật phẩm ","color":"yellow"}},{{"text":"{count}x {dname}","color":"aqua","bold":true}},{{"text":" của bạn đã được bán cho ","color":"yellow"}},{{"text":"{player}","color":"green","bold":true}},{{"text":"! Nhận ","color":"yellow"}},{{"text":"+${seller_receive:,} Xu","color":"green","bold":true}},{{"text":" (Đã trừ 5% thuế: ${tax:,} Xu).","color":"gray"}}]')

    def cancel_listing(self, player, listing_id_str):
        try:
            listing_id = int(listing_id_str)
        except ValueError:
            self.rcon.cmd(f'tellraw {player} [{{"text":"⟨Skyblock⟩ ","color":"gold","bold":true}},{{"text":"Mã vật phẩm không hợp lệ!","color":"red"}}]')
            return

        conn = sqlite3.connect(DB_PATH)
        cur = conn.cursor()
        cur.execute("SELECT id, seller, item_id, count, snbt, display_name, status FROM listings WHERE id=?", (listing_id,))
        row = cur.fetchone()
        if not row:
            conn.close()
            self.rcon.cmd(f'tellraw {player} [{{"text":"⟨Skyblock⟩ ","color":"gold","bold":true}},{{"text":"Không tìm thấy mã đăng bán #{listing_id}!","color":"red"}}]')
            return

        lid, seller, item_id, count, snbt, dname, status = row
        if seller.lower() != player.lower():
            conn.close()
            self.rcon.cmd(f'tellraw {player} [{{"text":"⟨Skyblock⟩ ","color":"gold","bold":true}},{{"text":"Bạn không sở hữu vật phẩm này!","color":"red"}}]')
            return

        if status != 'active':
            conn.close()
            self.rcon.cmd(f'tellraw {player} [{{"text":"⟨Skyblock⟩ ","color":"gold","bold":true}},{{"text":"Vật phẩm này không còn ở trạng thái đang bán!","color":"red"}}]')
            return

        cur.execute("UPDATE listings SET status='cancelled' WHERE id=?", (listing_id,))
        now = time.time()
        cur.execute(
            "INSERT INTO mail (recipient, item_id, count, snbt, display_name, reason, created_at, claimed) VALUES (?, ?, ?, ?, ?, 'cancelled', ?, 0)",
            (seller, item_id, count, snbt, dname, now)
        )
        conn.commit()
        conn.close()

        self.rcon.cmd(f'tellraw {player} [{{"text":"⟨Skyblock⟩ ","color":"gold","bold":true}},{{"text":"Đã hủy bán vật phẩm #{listing_id}! Vật phẩm đã được gửi vào Hộp Thư. Dùng ","color":"yellow"}},{{"text":"/chợ mail","color":"aqua","bold":true,"clickEvent":{{"action":"run_command","value":"/chợ mail"}},"hoverEvent":{{"action":"show_text","contents":"Click để nhận lại vật phẩm"}}}},{{"text":" để nhận lại.","color":"yellow"}}]')

    def show_browser(self, player, category=None, page=1):
        self.check_expired_listings()
        page = max(1, page)
        limit = 6
        offset = (page - 1) * limit

        conn = sqlite3.connect(DB_PATH)
        cur = conn.cursor()
        now = time.time()

        if category and category.lower() != "all":
            cur.execute("SELECT COUNT(*) FROM listings WHERE status='active' AND expires_at > ? AND category=?", (now, category.lower()))
            total_items = cur.fetchone()[0]
            cur.execute("SELECT id, seller, item_id, count, price, display_name, expires_at FROM listings WHERE status='active' AND expires_at > ? AND category=? ORDER BY id DESC LIMIT ? OFFSET ?", (now, category.lower(), limit, offset))
        else:
            cur.execute("SELECT COUNT(*) FROM listings WHERE status='active' AND expires_at > ?", (now,))
            total_items = cur.fetchone()[0]
            cur.execute("SELECT id, seller, item_id, count, price, display_name, expires_at FROM listings WHERE status='active' AND expires_at > ? ORDER BY id DESC LIMIT ? OFFSET ?", (now, limit, offset))

        rows = cur.fetchall()
        conn.close()

        total_pages = max(1, (total_items + limit - 1) // limit)
        cat_title = f" [{category.upper()}]" if category and category != "all" else " [TẤT CẢ]"

        msg = [
            {"text": f"\n═══════════════════════════════════════════════════════\n", "color": "gold", "bold": True},
            {"text": f"         💰 CHỢ ĐẤU GIÁ SKYBLOCK{cat_title} (Trang {page}/{total_pages}) 💰\n", "color": "yellow", "bold": True},
            {"text": f"═══════════════════════════════════════════════════════\n", "color": "gold", "bold": True},
            {"text": "Danh mục: ", "color": "gray"},
            {"text": "[Tất Cả] ", "color": "green" if not category or category=="all" else "aqua", "clickEvent": {"action": "run_command", "value": "/chợ list all 1"}},
            {"text": "[Vũ Khí] ", "color": "green" if category=="weapon" else "aqua", "clickEvent": {"action": "run_command", "value": "/chợ list weapon 1"}},
            {"text": "[Giáp] ", "color": "green" if category=="armor" else "aqua", "clickEvent": {"action": "run_command", "value": "/chợ list armor 1"}},
            {"text": "[Công Cụ] ", "color": "green" if category=="tool" else "aqua", "clickEvent": {"action": "run_command", "value": "/chợ list tool 1"}},
            {"text": "[Khoáng Sản] ", "color": "green" if category=="mining" else "aqua", "clickEvent": {"action": "run_command", "value": "/chợ list mining 1"}},
            {"text": "[Nông Sản] ", "color": "green" if category=="farming" else "aqua", "clickEvent": {"action": "run_command", "value": "/chợ list farming 1"}},
            {"text": "\n───────────────────────────────────────────────────────\n", "color": "dark_gray"}
        ]

        if not rows:
            msg.append({"text": "Hiện tại không có vật phẩm nào đang được đăng bán trong mục này.\n", "color": "gray"})
        else:
            for r in rows:
                lid, seller, item_id, count, price, dname, expires_at = r
                remain_min = max(1, int((expires_at - now) // 60))
                remain_str = f"{remain_min//60}h{remain_min%60}m" if remain_min >= 60 else f"{remain_min}m"
                msg.extend([
                    {"text": f"• #{lid} ", "color": "gold", "bold": True},
                    {"text": f"{count}x {dname} ", "color": "white", "bold": True},
                    {"text": f"— Người bán: ", "color": "gray"},
                    {"text": f"{seller} ", "color": "green"},
                    {"text": f"— Giá: ", "color": "gray"},
                    {"text": f"${price:,} Xu ", "color": "yellow", "bold": True},
                    {"text": f"({remain_str} còn lại)\n", "color": "dark_gray"},
                    {"text": "   ", "color": "gray"},
                    {"text": "[ MUA NGAY ]", "color": "green", "bold": True, "clickEvent": {"action": "run_command", "value": f"/chợ mua {lid}"}, "hoverEvent": {"action": "show_text", "contents": f"Nhấp để mua {count}x {dname} với giá ${price:,} Xu"}},
                    {"text": "  ", "color": "gray"},
                    {"text": "[ HỦY BÁN ]\n" if seller.lower() == player.lower() else "\n", "color": "red", "clickEvent": {"action": "run_command", "value": f"/chợ huy {lid}"}, "hoverEvent": {"action": "show_text", "contents": "Thu hồi vật phẩm về Hộp Thư"}}
                ])

        msg.extend([
            {"text": "───────────────────────────────────────────────────────\n", "color": "dark_gray"},
            {"text": "◀ [Trang Trước] ", "color": "yellow", "clickEvent": {"action": "run_command", "value": f"/chợ list {category or 'all'} {max(1, page-1)}"}},
            {"text": " | ", "color": "gray"},
            {"text": "[Trang Kế] ▶", "color": "yellow", "clickEvent": {"action": "run_command", "value": f"/chợ list {category or 'all'} {min(total_pages, page+1)}"}},
            {"text": "  |  ", "color": "gray"},
            {"text": "[📬 HỘP THƯ / MAILBOX]\n", "color": "light_purple", "bold": True, "clickEvent": {"action": "run_command", "value": "/chợ mail"}},
            {"text": "💡 Cú pháp bán đồ: ", "color": "gray"},
            {"text": "/chợ ban <giá>", "color": "yellow", "bold": True},
            {"text": " (Cầm vật phẩm trên tay rồi gõ lệnh, thuế 5%)\n", "color": "gray"},
            {"text": "═══════════════════════════════════════════════════════", "color": "gold", "bold": True}
        ])

        self.rcon.cmd(f"tellraw {player} {json.dumps(msg, ensure_ascii=False)}")

    def show_mail(self, player):
        self.check_expired_listings()
        conn = sqlite3.connect(DB_PATH)
        cur = conn.cursor()
        cur.execute("SELECT id, item_id, count, display_name, reason, created_at FROM mail WHERE lower(recipient)=lower(?) AND claimed=0 ORDER BY id DESC", (player,))
        rows = cur.fetchall()
        conn.close()

        msg = [
            {"text": f"\n═══════════════════════════════════════════════════════\n", "color": "gold", "bold": True},
            {"text": f"         📬 HỘP THƯ VẬT PHẨM (MAILBOX): {player} 📬\n", "color": "light_purple", "bold": True},
            {"text": f"═══════════════════════════════════════════════════════\n", "color": "gold", "bold": True}
        ]

        if not rows:
            msg.append({"text": "Hộp thư của bạn hiện đang trống! Không có vật phẩm hết hạn hoặc hoàn trả.\n", "color": "gray"})
        else:
            msg.append({"text": "Danh sách vật phẩm đang chờ nhận lại:\n", "color": "yellow"})
            for r in rows:
                mid, item_id, count, dname, reason, cat = r
                reason_vn = "Hết hạn 48h" if reason == "expired" else "Hủy bán"
                msg.extend([
                    {"text": f"• #{mid} ", "color": "gold", "bold": True},
                    {"text": f"{count}x {dname} ", "color": "white", "bold": True},
                    {"text": f"({reason_vn}) ", "color": "gray"},
                    {"text": "[ NHẬN LẠI ]\n", "color": "green", "bold": True, "clickEvent": {"action": "run_command", "value": f"/chợ mail claim {mid}"}, "hoverEvent": {"action": "show_text", "contents": f"Nhấp để nhận {count}x {dname} vào túi đồ"}}
                ])
            msg.extend([
                {"text": "\n", "color": "gray"},
                {"text": "▶ [ NHẬN TẤT CẢ VẬT PHẨM VÀO TÚI ĐỒ ]\n", "color": "green", "bold": True, "clickEvent": {"action": "run_command", "value": "/chợ mail claimall"}}
            ])

        msg.append({"text": "═══════════════════════════════════════════════════════", "color": "gold", "bold": True})
        self.rcon.cmd(f"tellraw {player} {json.dumps(msg, ensure_ascii=False)}")

    def claim_mail(self, player, mail_id=None):
        conn = sqlite3.connect(DB_PATH)
        cur = conn.cursor()
        if mail_id:
            try:
                mid = int(mail_id)
                cur.execute("SELECT id, item_id, count, snbt, display_name FROM mail WHERE id=? AND lower(recipient)=lower(?) AND claimed=0", (mid, player))
            except ValueError:
                conn.close()
                return
        else:
            cur.execute("SELECT id, item_id, count, snbt, display_name FROM mail WHERE lower(recipient)=lower(?) AND claimed=0", (player,))

        rows = cur.fetchall()
        if not rows:
            conn.close()
            self.rcon.cmd(f'tellraw {player} [{{"text":"⟨Skyblock⟩ ","color":"gold","bold":true}},{{"text":"Không có vật phẩm nào để nhận trong Hộp Thư!","color":"yellow"}}]')
            return

        claimed_ids = []
        for r in rows:
            mid, item_id, count, snbt, dname = r
            if snbt:
                give_cmd = f"give {player} {item_id}[{snbt}] {count}"
            else:
                give_cmd = f"give {player} {item_id} {count}"
            self.rcon.cmd(give_cmd)
            claimed_ids.append(mid)

        for cid in claimed_ids:
            cur.execute("UPDATE mail SET claimed=1 WHERE id=?", (cid,))
        conn.commit()
        conn.close()

        self.rcon.cmd(f'tellraw {player} [{{"text":"⟨Skyblock⟩ ","color":"gold","bold":true}},{{"text":"Đã nhận thành công ","color":"green"}},{{"text":"{len(claimed_ids)} món đồ","color":"yellow","bold":true}},{{"text":" từ Hộp Thư vào túi đồ của bạn!","color":"green"}}]')
        self.rcon.cmd(f"execute at {player} run playsound minecraft:entity.item.pickup player @s ~ ~ ~ 1.0 1.2")
        self.rcon.cmd(f'title {player} actionbar {{"text":"Đã nhận đồ từ Hộp Thư!","color":"green"}}')
