import sqlite3
import os

db_path = r"plugins/IridiumSkyblock/IridiumSkyblock.db"
print("DB File exists:", os.path.exists(db_path))
print("DB File size:", os.path.getsize(db_path), "bytes")

conn = sqlite3.connect(db_path)
cur = conn.cursor()

# 1. Integrity check
cur.execute("PRAGMA integrity_check;")
integrity = cur.fetchall()
print("PRAGMA integrity_check:", integrity)

# 2. Quick check
cur.execute("PRAGMA quick_check;")
quick = cur.fetchall()
print("PRAGMA quick_check:", quick)

# 3. Journal mode & synchronous
cur.execute("PRAGMA journal_mode;")
print("PRAGMA journal_mode:", cur.fetchall())

cur.execute("PRAGMA synchronous;")
print("PRAGMA synchronous:", cur.fetchall())

# 4. Tables and schemas
cur.execute("SELECT type, name, sql FROM sqlite_master WHERE type IN ('table', 'index') ORDER BY type, name;")
items = cur.fetchall()
print("\n=== TABLES AND INDEXES ===")
for t, name, sql in items:
    print(f"[{t.upper()}] {name}")
    if sql:
        for line in sql.splitlines():
            print("   ", line)
    if t == "table":
        try:
            cur.execute(f'SELECT COUNT(*) FROM "{name}"')
            cnt = cur.fetchone()[0]
            print(f"    --> Row count: {cnt}")
        except Exception as e:
            print(f"    --> Count error: {e}")
    print()

conn.close()
