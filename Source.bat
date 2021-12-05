@echo off
setlocal Enabledelayedexpansion
chcp 437 >nul
pushd %~dp0

:: Config
set TempNumber=1
set "Default=[0m" & set "bgwhite=[107m" & set "bgblack=[40m" & set "bgyellow=[43m" & set "black=[30m" & set "red=[31m" & set "green=[32m" & set "yellow=[33m" & set "blue=[34m" & set "magenta=[35m" & set "cyan=[36m" & set "white=[37m" & set "grey=[90m" & set "brightred=[91m" & set "brightgreen=[92m" & set "brightyellow=[93m" & set "brightblue=[94m" & set "brightmagenta=[95m" & set "brightcyan=[96m" & set "brightwhite=[97m" & set "underline=[4m" & set "underlineoff=[24m"
title Devices Info Collection
cls

set "NoColors=false"
set "UseFilter=false"

:: Check Arguments
for %%a in (%*) do (
    set /a Args.length+=1
    set Arg[!Args.length!]=%%a
)

for /L %%a in (1 1 !Args.length!) do (
    for %%b in (NoColors FilterName Filter) do (
        if /i "--%%b"=="!Arg[%%a]!" (
            set Current=%%a
            set /a Current+=1
            if /i "%%b"=="NoColors" (
                set "NoColors=true"
                set "yellow=!Default!"
                set "brightred=!Default!"
            )
            if /i "%%b"=="Filter" (
                for /f "delims=" %%c in ("!Current!") do (
                    set "FilterName=!Arg[%%c]!"
                    if defined FilterName set "UseFilter=true"
                )
            )
        )
    )
)

if /i !UseFilter!==false (
    set "Parameters=^USB Bluetooth Media Net"
    call :GeneralInfo
    call :DeviceInfo
)

if /i !UseFilter!==true (
    if /i !FilterName!==PC (
        call :GeneralInfo
    )
    if /i !FilterName!==USB (
        set "Parameters=^USB"
        call :DeviceInfo
    )
    if /i !FilterName!==Bluetooth (
        set "Parameters=Bluethooth"
        call :DeviceInfo
    )
    if /i !FilterName!==Media (
        set "Parameters=Media"
        call :DeviceInfo
    )
    if /i !FilterName!==Net (
        set "Parameters=Net"
        call :DeviceInfo
    ) else (
        exit /b
    )
) 

exit /b

:: Store PC Info
:GeneralInfo
echo !Default!General Info for PC !yellow!{!computername!}!brightred!
for /f "delims=" %%i in ('fsutil fsinfo drives') do (
    set "Drives=%%i"
    set "Drives=!Drives:Drives: =!"
)

for /F %%C in ('powershell -command "(Get-CimInstance Win32_PhysicalMemory | Measure-Object -Property capacity -Sum).sum /1gb"') do set "RAM=%%CGB"
for /f "tokens=1* delims==" %%a in ('wmic cpu get name /VALUE') do if /i %%a EQU name set "CPU=%%b"
for /f "tokens=1* delims==" %%a in ('wmic path win32_VideoController get name /value') do if /i %%a equ name set "GPU=%%b"
for /f "delims=" %%a in ('systeminfo ^| findstr /B /C:"OS Name"') do set "Windows=%%a"
set windows=%windows:~-25%

echo !Default!  !yellow!Current drives: !Default!!Drives!
echo !Default!  !yellow!CPU: !Default!!CPU!
echo !Default!  !yellow!RAM: !Default!!RAM!
echo !Default!  !yellow!GPU: !Default!!GPU!
echo !Default!  !yellow!OS: !Default!!windows!
echo !Default!  !yellow!CPU Architecture: !Default!!PROCESSOR_ARCHITECTURE!

exit /b

:: Store Saved Device Info
:DeviceInfo
for %%y in (!Parameters!) do (
    echo.
    echo !yellow!%%y Devices
    for %%z in (FriendlyName) do (
        for /f "delims=" %%a in ('powershell -command "(Get-PnpDevice -PresentOnly | Where-Object { $_.InstanceId -match '%%y' }).%%~z"') do (
            echo !yellow!!TempNumber!. !Default!%%a
            set /a TempNumber+=1
        )
    )

    set TempNumber=1
)

exit /b