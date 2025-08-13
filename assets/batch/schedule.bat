@echo off
chcp 65001

goto :start

:log
    setlocal
    set "logDir=%ProgramFiles%\مفازا\عينا سلسبيلا\logs"
   
    echo [%date% %time%] %* >> "%logDir%\schedules.log"
    endlocal
    goto :eof

:: --- start ---
:start
    call :log :::: start ::::
    call :log Working directory: %CD%
    call :log the location of the batch script: %~dp0
    call :log command run: %CMDCMDLINE%


:: --- check for admin permissions ---
:isAdmin

    :: Check for admin rights
    NET SESSION >nul 2>&1
    if %errorlevel% == 0 (
        echo scheduling...
    ) else (
        call :log Requesting administrator permissions...
        echo Requesting administrator permissions...
        :: Re-launch as admin
        PowerShell -Command "Start-Process cmd -ArgumentList '/c %~dpnx0 %*' -Verb RunAs -WorkingDirectory '%~dp0' -Wait"
        
        call :log :::: finish ::::
        echo exiting
        exit /b 0
    )

:: --- update script schedule ---
:updateScriptSchedule
    setlocal

    set TASK_NAME=AinaaUpdate
    set "UPDATE_SCRIPT=%ProgramFiles%\مفازا\عينا سلسبيلا\batch\update.bat"

    schtasks /create /tn "%TASK_NAME%" /tr "\"%UPDATE_SCRIPT%"\" /sc onstart /f /ru "SYSTEM"
    if %errorlevel% equ 0 (
        call :log Scheduled task created successfully.
    ) else (
        call :log Failed to create scheduled task.
    )

    endlocal

:: --- protect script schedule ---
@REM :protectScriptSchedule
@REM     setlocal

@REM     set TASK_NAME=AinaaProtect

@REM     schtasks /create /tn "%TASK_NAME%" /tr "\"%ProgramFiles%\مفازا\عينا سلسبيلا\batch\protect.bat\" apply high false" /sc minute /mo 1 /f /ru "SYSTEM"
@REM     if %errorlevel% equ 0 (
@REM         call :log Scheduled task created successfully.
@REM     ) else (
@REM         call :log Failed to create scheduled task.
@REM     )

endlocal

