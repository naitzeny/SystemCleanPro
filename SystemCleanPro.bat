@echo off
color 0A
title System Cleaner Script

:main
cls
echo =========================================
echo System Cleaner Script v1.0
echo =========================================
echo 1. Clean system temporary files
echo 2. Empty Recycle Bin
echo 3. Clean Prefetch
echo 4. Clear DNS cache
echo 5. Exit
echo.
set /p choice=Select an action: 

if "%choice%"=="1" goto cleanTemp
if "%choice%"=="2" goto cleanRecycle
if "%choice%"=="3" goto cleanPrefetch
if "%choice%"=="4" goto cleanDNS
if "%choice%"=="5" goto exit
goto main

:cleanTemp
echo Cleaning temporary files...
del /f /s /q %temp%\*.* >nul 2>&1
del /f /s /q %windir%\temp\*.* >nul 2>&1
echo Temporary files have been cleaned
pause
goto main

:cleanRecycle
echo Emptying Recycle Bin...
echo Y|del /f /s /q %systemdrive%\$Recycle.Bin >nul 2>&1
echo Recycle Bin has been emptied
pause
goto main

:cleanPrefetch
echo Cleaning Prefetch...
del /f /q %windir%\prefetch\*.* >nul 2>&1
echo Prefetch has been cleaned
pause
goto main

:cleanDNS
echo Flushing DNS cache...
ipconfig /flushdns >nul 2>&1
echo DNS cache has been flushed
pause
goto main

:exit
echo Goodbye!
pause
exit
