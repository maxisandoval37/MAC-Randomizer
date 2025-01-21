@echo off & setlocal EnableDelayedExpansion
color 0A
title MAC-randomizer

:: Check if the script has administrator privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo The script requires administrator privileges.
    echo Requesting permissions...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

echo.
echo                  _________-----_____
echo        ____------           __      ----_
echo  ___----             ___------              \
echo     ----________        ----                 \
echo                -----__    ^|             _____)
echo                     __-                /     \
echo         _______-----    ___--          \    /)\
echo   ------_______      ---____            \__/  /
echo                -----__    \ --    _          /\
echo                       --__--__     \_____/   \_/\
echo                               ---^|   /          ^|
echo                                  ^| ^|___________^|
echo                                  ^| ^| ((_(_)^| )_)
echo                                  ^|  \_((_(_)^|/(_)
echo                                   \             (
echo                                    \_____________)
echo.
echo.

echo.
echo ##########################################################
echo ###########CREDITS BY GITHUB.COM/MAXISANDOVAL37###########
echo ##########################################################
echo.

:: Generate a random MAC address
setlocal enabledelayedexpansion
set "chars=ABCDEF0123456789"

:: List available interfaces
echo Available interfaces:
wmic nic where "NetEnabled=True" get Name,DeviceID
echo.

:: Iterate over each enabled network interface
for /f "skip=1 tokens=2 delims==" %%i in ('wmic nic where "NetEnabled=True" get DeviceID /value') do (
    set "deviceID=%%i"
    
    :: Generate a new random MAC address
    set "mac="
    for /l %%j in (1,1,12) do (
        set /a idx=!random! %% 16
        for /f %%k in ('echo !chars:~!idx!,1!') do set "mac=!mac!%%k"
    )
    :: MAC address format
    set "mac=!mac:~0,2!-!mac:~2,2!-!mac:~4,2!-!mac:~6,2!-!mac:~8,2!-!mac:~10,2!"

    :: Disable the interface
    wmic path win32_networkadapter where "DeviceID=!deviceID!" call disable

    :: Change the MAC address
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4D36E972-E325-11CE-BFC1-08002BE10318}\!deviceID!" /v NetworkAddress /t REG_SZ /d !mac! /f

    :: Enable the interface again
    wmic path win32_networkadapter where "DeviceID=!deviceID!" call enable

    echo Interface with DeviceID=!deviceID! now has the new MAC: !mac!
    echo.
)