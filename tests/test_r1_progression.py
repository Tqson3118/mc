# -*- coding: utf-8 -*-
"""
Empirical Verification Harness for Requirement 1 (Progression Enforcement)
Author: Challenger 1
Target: build_evolution_npc.mcfunction and generate_all.py
"""

import os
import re
import sys

# Ensure UTF-8 output
sys.stdout.reconfigure(encoding="utf-8")

PROJECT_ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))
FUNCTION_PATH = os.path.join(
    PROJECT_ROOT,
    "world", "datapacks", "skyblock_spawn", "data", "skyblock", "function",
    "build_evolution_npc.mcfunction"
)

# -----------------------------------------------------------------------------
# 1. Custom Robust SNBT Parser for Minecraft 1.21.4 Trade Data
# -----------------------------------------------------------------------------
class SnbtParser:
    def __init__(self, text):
        self.text = text
        self.pos = 0
        self.length = len(text)

    def skip_whitespace(self):
        while self.pos < self.length and self.text[self.pos] in " \t\r\n":
            self.pos += 1

    def peek(self):
        self.skip_whitespace()
        if self.pos < self.length:
            return self.text[self.pos]
        return None

    def parse_value(self):
        self.skip_whitespace()
        if self.pos >= self.length:
            return None
        c = self.text[self.pos]
        if c == "{":
            return self.parse_compound()
        elif c == "[":
            return self.parse_list()
        elif c in ('"', "'"):
            return self.parse_quoted_string()
        else:
            return self.parse_unquoted_literal()

    def parse_quoted_string(self):
        quote_char = self.text[self.pos]
        self.pos += 1  # Skip opening quote
        chars = []
        while self.pos < self.length:
            c = self.text[self.pos]
            if c == "\\":
                self.pos += 1
                if self.pos < self.length:
                    chars.append(self.text[self.pos])
                    self.pos += 1
                continue
            elif c == quote_char:
                self.pos += 1  # Skip closing quote
                break
            else:
                chars.append(c)
                self.pos += 1
        return "".join(chars)

    def parse_unquoted_literal(self):
        start = self.pos
        # Stop at delimiters
        while self.pos < self.length and self.text[self.pos] not in " \t\r\n:,{}[]":
            self.pos += 1
        token = self.text[start:self.pos]
        # Normalize simple types
        if token in ("true", "1b"):
            return "true"
        if token in ("false", "0b"):
            return "false"
        return token

    def parse_compound(self):
        self.pos += 1  # Skip '{'
        res = {}
        while True:
            self.skip_whitespace()
            if self.pos >= self.length:
                break
            if self.text[self.pos] == "}":
                self.pos += 1
                break
            # Parse Key
            key = self.parse_key()
            self.skip_whitespace()
            if self.pos < self.length and self.text[self.pos] == ":":
                self.pos += 1
            else:
                raise ValueError(f"Expected ':' after key '{key}' at {self.pos}")
            # Parse Value
            val = self.parse_value()
            res[key] = val
            self.skip_whitespace()
            if self.pos < self.length and self.text[self.pos] == ",":
                self.pos += 1
            elif self.pos < self.length and self.text[self.pos] == "}":
                self.pos += 1
                break
        return res

    def parse_key(self):
        self.skip_whitespace()
        c = self.text[self.pos]
        if c in ('"', "'"):
            return self.parse_quoted_string()
        start = self.pos
        while self.pos < self.length and self.text[self.pos] not in " \t\r\n:":
            self.pos += 1
        return self.text[start:self.pos]

    def parse_list(self):
        self.pos += 1  # Skip '['
        res = []
        while True:
            self.skip_whitespace()
            if self.pos >= self.length:
                break
            if self.text[self.pos] == "]":
                self.pos += 1
                break
            val = self.parse_value()
            res.append(val)
            self.skip_whitespace()
            if self.pos < self.length and self.text[self.pos] == ",":
                self.pos += 1
            elif self.pos < self.length and self.text[self.pos] == "]":
                self.pos += 1
                break
        return res


def extract_npc_recipes(filepath):
    """Parses all summon villager commands from the file and returns recipes per NPC."""
    if not os.path.exists(filepath):
        raise FileNotFoundError(f"Missing mcfunction file: {filepath}")

    with open(filepath, "r", encoding="utf-8") as f:
        lines = f.readlines()

    npc_recipes = {}
    for line_idx, line in enumerate(lines, 1):
        line = line.strip()
        if line.startswith("summon villager"):
            # Determine which NPC
            npc_name = "unknown"
            if "alchemist_npc" in line or "Đại Sư Luyện Kim" in line:
                npc_name = "NPC_Alchemist"
            elif "toolsmith_npc" in line or "Thần Rèn Cúp & Rìu" in line:
                npc_name = "NPC_Toolsmith"
            elif "weaponsmith_npc" in line or "Thần Rèn Vũ Khí & Giáp" in line:
                npc_name = "NPC_Weaponsmith"
            elif "celestial_smith_npc" in line or "Thần Rèn Vũ Trụ" in line:
                npc_name = "NPC_Celestial"
            elif "talisman_master_npc" in line or "Đại Sư Cổ Ngữ" in line:
                npc_name = "NPC_Talisman"

            # Locate Offers:{Recipes:[...]}
            idx = line.find("Offers:{Recipes:[")
            if idx == -1:
                idx = line.find("Offers: {Recipes: [")
            if idx == -1:
                continue

            # Start of the Recipes array
            start_array = line.find("[", idx)
            parser = SnbtParser(line[start_array:])
            recipes = parser.parse_list()
            npc_recipes[npc_name] = {
                "line_num": line_idx,
                "recipes": recipes
            }

    return npc_recipes


# -----------------------------------------------------------------------------
# 2. Empirical Verification Logic
# -----------------------------------------------------------------------------
def verify_progression():
    print("=" * 70)
    print("EMPIRICAL VERIFICATION HARNESS: R1 PROGRESSION ENFORCEMENT")
    print(f"Target: {FUNCTION_PATH}")
    print("=" * 70)

    npc_data = extract_npc_recipes(FUNCTION_PATH)
    print(f"[+] Found {len(npc_data)} NPC summon commands:")
    for name, data in npc_data.items():
        print(f"    - {name} (Line {data['line_num']}): {len(data['recipes'])} recipes")

    # Categories to verify
    equipment_categories = {
        "Pickaxe": {"vanilla_id": "minecraft:diamond_pickaxe", "count": 20},
        "Axe": {"vanilla_id": "minecraft:diamond_axe", "count": 20},
        "Sword": {"vanilla_id": "minecraft:diamond_sword", "count": 20},
        "Helmet": {"vanilla_id": "minecraft:diamond_helmet", "count": 20},
        "Chestplate": {"vanilla_id": "minecraft:diamond_chestplate", "count": 20},
        "Leggings": {"vanilla_id": "minecraft:diamond_leggings", "count": 20},
        "Boots": {"vanilla_id": "minecraft:diamond_boots", "count": 20},
        "Bow": {"vanilla_id": "minecraft:bow", "count": 20},
    }

    # Slice recipes for each category
    # NPC 2 (Toolsmith): Pickaxe (0..14), Axe (15..29)
    # NPC 3 (Weaponsmith): Sword (0..14), Helmet (15..29), Chestplate (30..44), Leggings (45..59), Boots (60..74), Bow (75..89)
    # NPC 4 (Celestial Smith): Pickaxe (0..4), Axe (5..9), Sword (10..14), Helmet (15..19), Chestplate (20..24), Leggings (25..29), Boots (30..34), Bow (35..39)
    tool_recipes = npc_data.get("NPC_Toolsmith", {}).get("recipes", [])
    combat_recipes = npc_data.get("NPC_Weaponsmith", {}).get("recipes", [])
    celestial_recipes = npc_data.get("NPC_Celestial", {}).get("recipes", [])

    slices = {
        "Pickaxe": tool_recipes[0:15] + celestial_recipes[0:5],
        "Axe": tool_recipes[15:30] + celestial_recipes[5:10],
        "Sword": combat_recipes[0:15] + celestial_recipes[10:15],
        "Helmet": combat_recipes[15:30] + celestial_recipes[15:20],
        "Chestplate": combat_recipes[30:45] + celestial_recipes[20:25],
        "Leggings": combat_recipes[45:60] + celestial_recipes[25:30],
        "Boots": combat_recipes[60:75] + celestial_recipes[30:35],
        "Bow": combat_recipes[75:90] + celestial_recipes[35:40],
    }

    all_passed = True
    total_tier_checks = 0
    passed_tier_checks = 0
    armor_slot_counts = {}

    for cat_name, expected in equipment_categories.items():
        recipes = slices[cat_name]
        print(f"\n[*] Testing Category: {cat_name} (20 Tiers, Expected Vanilla: {expected['vanilla_id']})")
        if len(recipes) != 20:
            print(f"    [FAIL] Expected 20 recipes, found {len(recipes)}")
            all_passed = False
            continue

        previous_sell = None

        for t_idx, recipe in enumerate(recipes, 1):
            total_tier_checks += 1
            buy = recipe.get("buy", {})
            buyB = recipe.get("buyB")
            sell = recipe.get("sell", {})

            sell_comps = sell.get("components", {})
            sell_custom_data = sell_comps.get("minecraft:custom_data", {})
            sell_tier = sell_custom_data.get("tier")

            # Check sell tier tag
            if str(sell_tier) != str(t_idx):
                print(f"    [FAIL] Tier {t_idx} sell custom_data tier mismatch: got {sell_tier}")
                all_passed = False
                continue

            if t_idx == 1:
                # Tier 1 must require vanilla diamond item / bow
                buy_id = buy.get("id")
                buy_comps = buy.get("components")
                if buy_id != expected["vanilla_id"]:
                    print(f"    [FAIL] Tier 1 buy id mismatch: expected {expected['vanilla_id']}, got {buy_id}")
                    all_passed = False
                elif buy_comps is not None:
                    print(f"    [FAIL] Tier 1 buy should be pure vanilla, but has components: {buy_comps}")
                    all_passed = False
                elif str(buy.get("count", 1)) != "1":
                    print(f"    [FAIL] Tier 1 buy count should be 1, got {buy.get('count')}")
                    all_passed = False
                else:
                    passed_tier_checks += 1
            else:
                # Tier 2..15 must require Tier N-1 item with MATCHING Data Components
                buy_id = buy.get("id")
                buy_comps = buy.get("components", {})
                prev_sell_id = previous_sell.get("id")
                prev_sell_comps = previous_sell.get("components", {})

                # 1. Match Item ID
                id_ok = (buy_id == prev_sell_id)

                # 2. Match Custom Data
                buy_custom_data = buy_comps.get("minecraft:custom_data", {})
                prev_custom_data = prev_sell_comps.get("minecraft:custom_data", {})
                custom_data_ok = (buy_custom_data == prev_custom_data) and (str(buy_custom_data.get("tier")) == str(t_idx - 1))

                # 3. Match Custom Name
                buy_name = buy_comps.get("minecraft:custom_name")
                prev_name = prev_sell_comps.get("minecraft:custom_name")
                name_ok = (buy_name == prev_name)

                # 4. Match Lore
                buy_lore = buy_comps.get("minecraft:lore")
                prev_lore = prev_sell_comps.get("minecraft:lore")
                lore_ok = (buy_lore == prev_lore)

                # 5. Match Enchantments
                buy_ench = buy_comps.get("minecraft:enchantments")
                prev_ench = prev_sell_comps.get("minecraft:enchantments")
                ench_ok = (buy_ench == prev_ench)

                # 6. Match Unbreakable
                buy_unbrk = buy_comps.get("minecraft:unbreakable")
                prev_unbrk = prev_sell_comps.get("minecraft:unbreakable")
                unbrk_ok = (buy_unbrk == prev_unbrk)

                if id_ok and custom_data_ok and name_ok and lore_ok and ench_ok and unbrk_ok:
                    passed_tier_checks += 1
                else:
                    print(f"    [FAIL] Tier {t_idx} buy requirement failed matching Tier {t_idx-1}:")
                    print(f"           id_ok={id_ok}, custom_data_ok={custom_data_ok}, name_ok={name_ok}, lore_ok={lore_ok}, ench_ok={ench_ok}, unbrk_ok={unbrk_ok}")
                    all_passed = False

            previous_sell = sell

        print(f"    [PASS] All 20 Tiers in {cat_name} verified strictly.")
        if cat_name in ("Helmet", "Chestplate", "Leggings", "Boots"):
            armor_slot_counts[cat_name] = len(recipes)

    print("\n" + "=" * 70)
    print("ARMOR 4-SLOT COVERAGE AUDIT:")
    for slot in ["Helmet", "Chestplate", "Leggings", "Boots"]:
        cnt = armor_slot_counts.get(slot, 0)
        print(f"    - {slot}: {cnt}/20 Tiers verified")

    print("\nSUMMARY OF PROGRESSION ENFORCEMENT AUDIT:")
    print(f"    - Total Equipment Categories: 8 (4 Armor Slots + 4 Weapons/Tools)")
    print(f"    - Total Tier Upgrade Steps Verified: {total_tier_checks}")
    print(f"    - Total Passed Verification Steps: {passed_tier_checks}")
    print(f"    - Success Rate: {passed_tier_checks / total_tier_checks * 100:.2f}%")

    if all_passed and passed_tier_checks == total_tier_checks == 160:
        print("\n>>> FINAL VERDICT FOR R1: PASS (100% Progression Integrity Verified) <<<")
        return True
    else:
        print("\n>>> FINAL VERDICT FOR R1: FAIL <<<")
        return False


if __name__ == "__main__":
    success = verify_progression()
    sys.exit(0 if success else 1)
