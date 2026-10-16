@echo off
title Skyblock Server (Co-op Radmin VPN)
cd /d "%~dp0"
echo ========================================================
echo      KHOI DONG SKYBLOCK SERVER (PAPER 1.21.4)
echo           Choi qua Radmin VPN ^| Port: 25565
echo ========================================================
echo.

set "JAVA_CMD=java"
if exist "C:\Program Files\Eclipse Adoptium\jre-21.0.12.101-hotspot\bin\java.exe" (
    set "JAVA_CMD=C:\Program Files\Eclipse Adoptium\jre-21.0.12.101-hotspot\bin\java.exe"
) else if exist "C:\Program Files\Eclipse Adoptium\jre-25.0.4.101-hotspot\bin\java.exe" (
    set "JAVA_CMD=C:\Program Files\Eclipse Adoptium\jre-25.0.4.101-hotspot\bin\java.exe"
)

echo Dang khoi dong Tien trinh Kinh Te & Casino Daemon...
start "Skyblock Economy Daemon" python -u skyblock_economy_daemon.py

echo Dang khoi dong server bang: %JAVA_CMD%
"%JAVA_CMD%" -Xms4G -Xmx4G -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar paper.jar --nogui
echo.
echo Server da dung lai. Bam phim bat ky de thoat...
pause >nul
