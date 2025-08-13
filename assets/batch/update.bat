@echo off
chcp 65001
setlocal enableDelayedExpansion

:: Main script for managing blocking functionalities
goto :isAdmin

:: --- log function ---
:log
    setlocal
    set "logDir=%ProgramFiles%\مفازا\عينا سلسبيلا\logs"
   
    echo [%date% %time%] %* >> "%logDir%\update.log"
    endlocal
    goto :eof


:isAdmin

    :: Check for admin rights
    NET SESSION >nul 2>&1
    if %errorlevel% == 0 (
        echo running update...
    ) else (
        call :log Requesting administrator permissions...
        echo Requesting administrator permissions...
        :: Re-launch as admin
        PowerShell -Command "Start-Process cmd -ArgumentList '/c %~dpnx0 %*' -Verb RunAs -WorkingDirectory '%~dp0' -Wait"
        
        call :log :::: finish ::::
        echo exiting
        exit /b 0
    )

:start
    call :log :::: start ::::
    call :log Working directory: %CD%
    call :log the location of the batch script: %~dp0
    call :log command run: %CMDCMDLINE%
    call :log args: %*

    cd %~dp0
    call :log changed directory to the location of the batch script
    call :log current working directory: %CD%


:: check version
:checkVerison

set LOCAL_VERSION_FILE=%programFiles%\مفازا\عينا سلسبيلا\version
set TEMP_DIR=%TEMP%\ainaa_update
set GITHUB_API_URL=https://github.com/mafazaa-org/Ainaa-windows/releases/latest/download

call :log got local version file path %LOCAL_VERSION_FILE%
call :log got temp dir %TEMP%\ainaa_update
call :log got github api url %GITHUB_API_URL%

:: Create temp dir if not exists
if not exist "%TEMP_DIR%" mkdir "%TEMP_DIR%"
call :log made sure temp dir exists

set /p LOCAL_VERSION=<"%LOCAL_VERSION_FILE%"
call :log got local version %LOCAL_VERSION%

:: Get latest release info using curl
call :log getting latest release version
curl -L -o "%TEMP_DIR%\version" %GITHUB_API_URL%/version

set /p LATEST_VERSION=<"%TEMP_DIR%\version"
call :log got latest release version %LATEST_VERSION%
:: Compare versions
if "%LATEST_VERSION%" == "%LOCAL_VERSION%" (
    call :log App is up to date.
    goto end
)

curl -L -o "%TEMP_DIR%\مثبت عينا سلسبيلا.exe" %GITHUB_API_URL%/default.exe
call :log installed setup

"%TEMP_DIR%\مثبت عينا سلسبيلا.exe" /silent
call :log setup done

:end
call :log deleting temp dir
rmdir /q /s %TEMP_DIR%
call :log :::: finish ::::
endlocal