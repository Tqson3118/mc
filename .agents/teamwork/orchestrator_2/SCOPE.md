# Scope: Comprehensive Paper 1.21.4 Skyblock Server Technical Audit

## Architecture & Subsystems
- **R1: Server Infrastructure & Daemon Process**
  - Java 21 flags in `Run-Server.bat` (`-Xms4G -Xmx4G`, G1GC, `AlwaysPreTouch`).
  - Crash recovery (`restart-on-crash: true`), EXP orb merge (`merge-radius.exp: 3.0`) in `spigot.yml`.
  - Network & RCON in `server.properties` (`online-mode=false`, RCON port `25575`, password `skyblock123`).
  - `spawn-protection` evaluation for Non-OP players interacting with NPCs and chests.
  - `skyblock_economy_daemon.py` parallel startup and auto-reconnect logic to RCON.
- **R2: World & Island Generation**
  - IridiumSkyblock commands (`/is create`, `/is home`, `/is sethome`, `/is level`, `/is team`, `/upgrade`, `/boosters`).
  - Void world generation in `IridiumSkyblock` world.
  - Disabled BentoBox world status (`bskyblock_world*`, `disabled_plugins/`).
  - SQLite database integrity of `plugins/IridiumSkyblock/IridiumSkyblock.db`.
- **R3: Plugins, Permissions & Scoreboard HUD**
  - Non-OP permissions check (island commands, 16 warps, kits, economy commands).
  - ScoreboardPL + PlaceholderAPI placeholders (`%iridiumskyblock_island_name%`, `%iridiumskyblock_island_level%`, ping, online count, Vault).
  - Orphan 10KB `config.yml` in server root analysis.
  - ChestShop functionality and permissions.
- **R4: RPG Datapack & Boss Arenas**
  - Syntax error in `skyblock:tick` function (specifically `fill ... air destroy replace` around lines 101/792-793).
  - Test execution: `python tests/test_r1_progression.py`.
  - Tier 10+ weapon & armor effects (3x3 pickaxe, lifesteal/lightning sword, tree feller axe, set bonuses).
  - Central Boss Sanctuary, 4 Arenas, Fail-Safe Return TP, Boss 3 drop (Devil's Heart).
  - Guide NPC and Crates at `/warp crates`.
- **R5: Economy Daemon, Casino & Easter Eggs**
  - Test execution: `python tests/test_r4_daemon.py`.
  - RCON connection, log console listener, Alias Warning verification.
  - `/bankhoangsan` sell pricing & custom item safety.
  - Casino `/cf`, `/xoso`, Jackpot 20%, NPC interaction handler check.
  - Easter egg odds manipulation (`sondzvc` 85%, `hieudzvc` 25%) risk analysis.
  - Lighthouse `/haidang` utility.
- **R6: Runtime Logs & Audit Acceptance Deliverables**
  - In-depth triage of all `[WARN]` and `[ERROR]` entries in `logs/latest.log`.
  - Help dictionary coverage in `help.yml`.
  - Generator sanity check: `generate_all.py`.
  - Compilation of `AUDIT_REPORT.md`.

## Audit Milestones
| # | Milestone | Target Focus | Lead Agent Role | Status |
|---|-----------|--------------|-----------------|--------|
| A1 | Infrastructure & World Audit | R1 & R2: Configs, scripts, world gen, SQLite db | Explorer 1 | PLANNED |
| A2 | Plugins, Datapack & Boss Audit | R3 & R4: Permissions, Scoreboard, `skyblock:tick` error, Boss arenas | Explorer 2 | PLANNED |
| A3 | Economy Backend & Runtime Logs Audit | R5 & R6: Daemon, Casino, Easter Eggs, log triage, help.yml | Explorer 3 | PLANNED |
| A4 | Automated Test Execution | Run `tests/test_r1_progression.py` & `tests/test_r4_daemon.py` with full logs | Worker 1 | PLANNED |
| A5 | Forensic Verification & Defect Cataloging | Deep forensic audit of integrity, syntax, configuration, and security | Forensic Auditor | PLANNED |
| A6 | Final Acceptance Report Assembly | Generate `AUDIT_REPORT.md` conforming to client specifications | Worker 2 | PLANNED |
| A7 | Review & Final Gate | Final review of AUDIT_REPORT.md, handoff generation, Sentinel notification | Reviewer & Orchestrator | PLANNED |
