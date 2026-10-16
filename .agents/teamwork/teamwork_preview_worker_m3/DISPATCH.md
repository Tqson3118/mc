## 2026-10-12T07:28:03Z
You are Worker M3 implementing Milestone M3: Server Stability.

MANDATORY FIRST STEP:
Read C:\Users\Administrator\.gemini\antigravity\scratch\Skyblock-Server\.agents\teamwork\ORIGINAL_REQUEST.md in full before doing any other work.

Also read:
- Project Plan: C:\Users\Administrator\.gemini\antigravity\scratch\Skyblock-Server\.agents\teamwork\PROJECT.md
- Survey Report: C:\Users\Administrator\.gemini\antigravity\scratch\Skyblock-Server\.agents\teamwork\teamwork_preview_explorer_survey_3\survey_r3_r4.md

Working Directory: C:\Users\Administrator\.gemini\antigravity\scratch\Skyblock-Server\.agents\teamwork\teamwork_preview_worker_m3
Project Root: C:\Users\Administrator\.gemini\antigravity\scratch\Skyblock-Server
Parent Orchestrator ID: b445c53f-6e97-46d8-9262-8bf409bdae88

Exclusive Write Ownership:
- `spigot.yml`
- `Run-Server.bat`
- `plugins/Essentials/config.yml`
You MUST NOT edit any other files.

MANDATORY INTEGRITY WARNING:
DO NOT CHEAT. All implementations must be genuine. DO NOT hardcode test results, create dummy/facade implementations, or circumvent the intended task. A teamwork_preview_auditor will independently verify your work. Integrity violations WILL be detected and your work WILL be rejected.

Tasks:
1. Update `spigot.yml`:
   - Set `settings.restart-script` to `Run-Server.bat` (around line 36).
   - Set `world-settings.default.merge-radius.exp` to `3.0` (around line 162).
2. Update `Run-Server.bat`:
   - Configure line 18 with standard Aikar's Flags for Java 21 G1GC:
     `"%JAVA_CMD%" -Xms4G -Xmx4G -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar paper.jar --nogui`
3. Update `plugins/Essentials/config.yml`:
   - Set `newbies.kit` to `tanthu` (around line 1278).
4. Verify:
   - Run python validation script to check YAML validity of `spigot.yml` and `plugins/Essentials/config.yml`.
   - Verify `Run-Server.bat` syntax and flags.

Deliverables:
- Write C:\Users\Administrator\.gemini\antigravity\scratch\Skyblock-Server\.agents\teamwork\teamwork_preview_worker_m3\changes.md
- Write C:\Users\Administrator\.gemini\antigravity\scratch\Skyblock-Server\.agents\teamwork\teamwork_preview_worker_m3\handoff.md
- Send message to parent orchestrator (b445c53f-6e97-46d8-9262-8bf409bdae88) with test results and handoff path.
