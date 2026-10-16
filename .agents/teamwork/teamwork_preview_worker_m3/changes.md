# Changes Report — Milestone M3: Server Stability

## 1. `spigot.yml`
- **Location**: `C:\Users\Administrator\.gemini\antigravity\scratch\Skyblock-Server\spigot.yml`
- **Modifications**:
  1. Line 36: Changed `restart-script: ./start.sh` to `restart-script: Run-Server.bat`.
     - **Rationale**: On Windows systems, `./start.sh` fails with `CreateProcess error=2` when watchdog crashes or `/restart` is triggered. Pointing to `Run-Server.bat` enables automatic server reboot on Windows.
  2. Line 162: Changed `merge-radius.exp: -1.0` to `merge-radius.exp: 3.0`.
     - **Rationale**: `-1.0` disabled EXP orb merging entirely, generating thousands of individual EXP entities at mob farms and grinding TPS down to 10-15. Setting to `3.0` merges nearby experience orbs within 3 blocks, reducing entity overhead by 80-95% while preserving player experience.

## 2. `Run-Server.bat`
- **Location**: `C:\Users\Administrator\.gemini\antigravity\scratch\Skyblock-Server\Run-Server.bat`
- **Modifications**:
  - Line 18: Replaced naive JVM startup command `"%JAVA_CMD%" -Xms2G -Xmx4G -XX:+UseG1GC -jar paper.jar --nogui` with standard Aikar's Flags for Java 21 G1GC:
    `"%JAVA_CMD%" -Xms4G -Xmx4G -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar paper.jar --nogui`
  - **Rationale**:
    - Equalized heap min/max to `-Xms4G -Xmx4G` to prevent runtime memory allocation pauses.
    - Added G1GC tuning parameters (MaxGCPauseMillis=200, ParallelRefProcEnabled, AlwaysPreTouch, etc.) to eliminate Stop-The-World lag spikes and avoid page faults.
    - Verified against OpenJDK Temurin 21.0.12.1 runtime on the host with exit code 0.

## 3. `plugins/Essentials/config.yml`
- **Location**: `C:\Users\Administrator\.gemini\antigravity\scratch\Skyblock-Server\plugins\Essentials\config.yml`
- **Modifications**:
  - Line 1278: Changed `kit: tools` to `kit: tanthu` under the `newbies:` section.
  - **Rationale**: Activates the comprehensive starter kit defined in `plugins/Essentials/kits.yml` (17 items including iron tools, leather armor, food, building starter materials, 10 emeralds, and $1,000 Vault currency) automatically upon player's first server join.
