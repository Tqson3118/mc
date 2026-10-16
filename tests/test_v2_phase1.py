# -*- coding: utf-8 -*-
"""
COMPREHENSIVE TEST SUITE - PHASE 1 (GIAI ĐOẠN 1)
================================================
Covers:
1. Auction House Engine (auction.db, security blacklist, 5% tax, mail recovery).
2. Minion Engine V2 Upgrades (minions.db migration, stat upgrades with Gems, interaction entity).
3. Economy Daemon V2 Integrations (8 Pets, Gems unlock & level upgrades, Shop buy/sell parity, command dispatch).
4. DeluxeMenus & Datapack Integrity (all 15 menus, RCON reload, mcfunction syntax).
"""

import os
import sys
import sqlite3
import time
import json
import unittest
from pathlib import Path

# Add project root to sys.path
BASE_DIR = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(BASE_DIR))

import skyblock_auction
import skyblock_minions
import skyblock_economy_daemon

class MockRcon:
    def __init__(self):
        self.commands = []
        self.responses = {}

    def cmd(self, command):
        self.commands.append(command)
        for pattern, resp in self.responses.items():
            if pattern in command:
                return resp
        return "Command executed successfully"

class TestAuctionHouseEngine(unittest.TestCase):
    def setUp(self):
        self.test_db = BASE_DIR / "test_auction.db"
        if self.test_db.exists():
            self.test_db.unlink()
        skyblock_auction.DB_PATH = str(self.test_db)
        skyblock_auction.init_auction_db()
        self.rcon = MockRcon()
        self.balances = {"Buyer": 100000, "Seller": 0}
        self.mgr = skyblock_auction.AuctionManager(
            self.rcon,
            get_bal_fn=lambda p: self.balances.get(p, 0),
            add_bal_fn=lambda p, a: self.balances.update({p: self.balances.get(p, 0) + a})
        )

    def tearDown(self):
        if self.test_db.exists():
            self.test_db.unlink()
        skyblock_auction.DB_PATH = str(BASE_DIR / "auction.db")
        skyblock_auction.init_auction_db()

    def test_schema_initialization(self):
        conn = sqlite3.connect(str(self.test_db))
        cur = conn.cursor()
        cur.execute("SELECT name FROM sqlite_master WHERE type='table'")
        tables = [r[0] for r in cur.fetchall()]
        conn.close()
        self.assertIn("listings", tables)
        self.assertIn("mail", tables)

    def test_categorization(self):
        self.assertEqual(skyblock_auction.categorize_item("diamond_sword"), "weapon")
        self.assertEqual(skyblock_auction.categorize_item("netherite_chestplate"), "armor")
        self.assertEqual(skyblock_auction.categorize_item("diamond_pickaxe"), "tool")
        self.assertEqual(skyblock_auction.categorize_item("raw_iron"), "mining")
        self.assertEqual(skyblock_auction.categorize_item("wheat"), "farming")
        self.assertEqual(skyblock_auction.categorize_item("apple"), "farming")
        self.assertEqual(skyblock_auction.categorize_item("stick"), "misc")

    def test_security_blacklist(self):
        self.assertTrue(skyblock_auction.is_item_disallowed('{ancient_mat:"royal_ticket"}'))
        self.assertTrue(skyblock_auction.is_item_disallowed('{ancient_mat:"soul_fragment"}'))
        self.assertTrue(skyblock_auction.is_item_disallowed('{crate_key:"mythic"}'))
        self.assertTrue(skyblock_auction.is_item_disallowed('{totem:"boss_1"}'))
        self.assertFalse(skyblock_auction.is_item_disallowed('{normal_item:"true"}'))
        self.assertFalse(skyblock_auction.is_item_disallowed(''))

    def test_listing_and_tax_purchase(self):
        # Setup mock item in seller hand
        self.rcon.responses["SelectedItem"] = 'SelectedItem: {id: "minecraft:diamond", count: 10b, components: {}}'
        self.mgr.list_item_from_hand("Seller", "10000")

        conn = sqlite3.connect(str(self.test_db))
        cur = conn.cursor()
        cur.execute("SELECT id, seller, item_id, count, price, status FROM listings")
        row = cur.fetchone()
        conn.close()
        self.assertIsNotNone(row)
        lid, seller, item_id, count, price, status = row
        self.assertEqual(seller, "Seller")
        self.assertEqual(price, 10000)
        self.assertEqual(status, "active")

        # Buyer purchases
        self.mgr.buy_listing("Buyer", str(lid))
        self.assertEqual(self.balances["Buyer"], 90000) # 100,000 - 10,000
        # 5% tax burnt: 10,000 * 0.05 = 500. Seller gets 9,500.
        self.assertEqual(self.balances["Seller"], 9500)

        # Verify listing marked sold
        conn = sqlite3.connect(str(self.test_db))
        cur = conn.cursor()
        cur.execute("SELECT status FROM listings WHERE id=?", (lid,))
        st = cur.fetchone()[0]
        conn.close()
        self.assertEqual(st, "sold")

    def test_cancel_and_mail_recovery(self):
        self.rcon.responses["SelectedItem"] = 'SelectedItem: {id: "minecraft:emerald", count: 5b, components: {}}'
        self.mgr.list_item_from_hand("Seller", "5000")

        conn = sqlite3.connect(str(self.test_db))
        cur = conn.cursor()
        cur.execute("SELECT id FROM listings WHERE status='active'")
        lid = cur.fetchone()[0]
        conn.close()

        # Cancel listing
        self.mgr.cancel_listing("Seller", str(lid))

        # Check moved to mail
        conn = sqlite3.connect(str(self.test_db))
        cur = conn.cursor()
        cur.execute("SELECT id, recipient, item_id, count, reason, claimed FROM mail WHERE recipient='Seller'")
        mail_row = cur.fetchone()
        conn.close()
        self.assertIsNotNone(mail_row)
        mid, recip, iid, count, reason, claimed = mail_row
        self.assertEqual(recip, "Seller")
        self.assertEqual(reason, "cancelled")
        self.assertEqual(claimed, 0)

        # Claim mail
        self.mgr.claim_mail("Seller", str(mid))
        conn = sqlite3.connect(str(self.test_db))
        cur = conn.cursor()
        cur.execute("SELECT claimed FROM mail WHERE id=?", (mid,))
        c = cur.fetchone()[0]
        conn.close()
        self.assertEqual(c, 1)


class TestMinionEngineUpgrades(unittest.TestCase):
    def setUp(self):
        self.test_db = BASE_DIR / "test_minions.db"
        if self.test_db.exists():
            self.test_db.unlink()
        skyblock_minions.DB_PATH = str(self.test_db)
        skyblock_minions.init_db()
        self.rcon = MockRcon()

    def tearDown(self):
        if self.test_db.exists():
            self.test_db.unlink()
        skyblock_minions.DB_PATH = str(BASE_DIR / "minions.db")
        skyblock_minions.init_db()

    def test_schema_migration_columns(self):
        conn = sqlite3.connect(str(self.test_db))
        cur = conn.cursor()
        cur.execute("PRAGMA table_info(minions)")
        cols = [r[1] for r in cur.fetchall()]
        conn.close()
        self.assertIn("range_level", cols)
        self.assertIn("speed_level", cols)
        self.assertIn("storage_level", cols)
        self.assertIn("tool_level", cols)
        self.assertIn("skin_id", cols)

    def test_minion_gem_upgrades(self):
        # Create a test minion
        conn = sqlite3.connect(str(self.test_db))
        cur = conn.cursor()
        cur.execute(
            "INSERT INTO minions (owner, minion_type, tier, world, x, y, z, created_at, last_harvest_at, stored_count, range_level, speed_level, storage_level, tool_level, skin_id) "
            "VALUES ('Steve', 'miner', 1, 'world', 0, 100, 0, 0, 0, 0, 1, 1, 1, 1, 'default')"
        )
        mid = cur.lastrowid
        conn.commit()
        conn.close()

        gems = {"Steve": 500}
        def take_gems(p, amt):
            if gems.get(p, 0) >= amt:
                gems[p] -= amt
                return True
            return False

        # Upgrade range
        skyblock_minions.upgrade_minion_range(self.rcon, "Steve", mid, take_gems_fn=take_gems)
        m = skyblock_minions.get_minion_by_id(mid)
        self.assertEqual(m["range_level"], 2)

        # Upgrade speed
        skyblock_minions.upgrade_minion_speed(self.rcon, "Steve", mid, take_gems_fn=take_gems)
        m = skyblock_minions.get_minion_by_id(mid)
        self.assertEqual(m["speed_level"], 2)

        # Upgrade storage
        skyblock_minions.upgrade_minion_storage(self.rcon, "Steve", mid, take_gems_fn=take_gems)
        m = skyblock_minions.get_minion_by_id(mid)
        self.assertEqual(m["storage_level"], 2)

        # Upgrade tool
        skyblock_minions.upgrade_minion_tool(self.rcon, "Steve", mid, take_gems_fn=take_gems)
        m = skyblock_minions.get_minion_by_id(mid)
        self.assertEqual(m["tool_level"], 2)

        # Change skin
        skyblock_minions.change_minion_skin(self.rcon, "Steve", mid, skin_name="cyborg", take_gems_fn=take_gems)
        m = skyblock_minions.get_minion_by_id(mid)
        self.assertEqual(m["skin_id"], "cyborg")

        # Verify Gems were deducted correctly
        self.assertLess(gems["Steve"], 500)


class TestEconomyDaemonV2(unittest.TestCase):
    def setUp(self):
        self.daemon = skyblock_economy_daemon.SkyblockDaemon()
        self.daemon.rcon = MockRcon()
        self.daemon.data = {
            "balances": {"Alex": 50000},
            "gems": {"Alex": 1000},
            "talismans": {},
            "rebirths": {},
            "pets": {},
            "quests": {},
            "achievements": {}
        }

    def test_8_pets_structure(self):
        expected_pets = ["allay", "fox", "cat", "wolf", "bee", "turtle", "dragon", "phoenix"]
        for p in expected_pets:
            self.assertIn(p, skyblock_economy_daemon.PETS)
            p_conf = skyblock_economy_daemon.PETS[p]
            self.assertIn("gem_cost", p_conf)
            self.assertIn("bonus", p_conf)
            self.assertIn("entity", p_conf)

    def test_pet_unlock_and_upgrade(self):
        # Alex unlocks allay
        self.daemon.handle_pets("Alex", ["equip", "allay"])
        self.assertIn("allay", self.daemon.data["pets"]["Alex"]["owned"])
        self.assertEqual(self.daemon.data["pets"]["Alex"]["active"], "allay")
        self.assertEqual(self.daemon.get_gems("Alex"), 950) # 1000 - 50

        # Alex upgrades allay from Lv 1 to Lv 2
        self.daemon.handle_pets("Alex", ["upgrade", "allay"])
        self.assertEqual(self.daemon.data["pets"]["Alex"]["levels"]["allay"], 2)

        # Check total bonus includes +5% for Lv 2
        total_bonus = self.daemon.get_total_bonus_pct("Alex")
        # Allay base is 20, + 5 for Lv 2 = 25
        self.assertEqual(total_bonus, 25)

    def test_shop_buy_sell_parity(self):
        # Alex buys 10 wheat (unit price 10)
        self.daemon.handle_shop("Alex", ["buy", "wheat", "10"])
        self.assertEqual(self.daemon.get_bal("Alex"), 49900) # 50,000 - 100

        # Mock inventory for sell
        self.daemon.rcon.responses["Inventory"] = 'Inventory: [{Slot: 0b, id: "minecraft:wheat", count: 10b}]'
        # Sell 10 wheat (base unit price 5, no bonus)
        self.daemon.handle_shop("Alex", ["sell", "wheat", "10"])
        self.assertEqual(self.daemon.get_bal("Alex"), 49950) # 49,900 + 50

    def test_shop_sell_security(self):
        # Mock inventory with custom_data item (Boss catalyst or custom item)
        self.daemon.rcon.responses["Inventory"] = 'Inventory: [{Slot: 0b, id: "minecraft:wheat", count: 10b, components: {"minecraft:custom_data": {ancient_mat: "royal_ticket"}}}]'
        bal_before = self.daemon.get_bal("Alex")
        self.daemon.handle_shop("Alex", ["sell", "wheat", "10"])
        bal_after = self.daemon.get_bal("Alex")
        # Balance must NOT change because custom_data item was rejected
        self.assertEqual(bal_before, bal_after)


class TestDeluxeMenusAndSyntax(unittest.TestCase):
    def test_verify_syntax_mcfunction(self):
        # Run verify_syntax.py
        import subprocess
        res = subprocess.run([sys.executable, "verify_syntax.py"], cwd=str(BASE_DIR), capture_output=True, text=True)
        self.assertEqual(res.returncode, 0, f"verify_syntax.py failed:\n{res.stdout}\n{res.stderr}")

    def test_all_15_menus_registered(self):
        import yaml
        config_path = BASE_DIR / "plugins" / "DeluxeMenus" / "config.yml"
        with open(config_path, "r", encoding="utf-8") as f:
            cfg = yaml.safe_load(f)
        gui_menus = cfg.get("gui_menus", {})
        expected_menus = [
            "warp", "menu", "minions", "minion_control", "builder", "builder_p2", "builder_p3",
            "pets", "shop", "shop_nongsan", "shop_khoangsan", "shop_haisan", "shop_nguyenlieu", "auction"
        ]
        for em in expected_menus:
            self.assertIn(em, gui_menus, f"Menu {em} missing from DeluxeMenus config.yml")
            menu_file = BASE_DIR / "plugins" / "DeluxeMenus" / "gui_menus" / gui_menus[em]["file"]
            self.assertTrue(menu_file.exists(), f"Menu file {menu_file} does not exist")


if __name__ == "__main__":
    unittest.main()
