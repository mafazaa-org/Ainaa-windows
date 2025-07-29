@echo off
chcp 65001
:: Main script for managing blocking functionalities
goto :start

:: --- log function ---
:log
    setlocal
    set "logDir=%ProgramFiles%\مفازا\عينا سلسبيلا\logs"
   
    echo [%date% %time%] %* >> "%logDir%\protect.log"
    endlocal
    goto :eof


:start

    if "%~1"=="" (
        goto :show_usage
    ) else if /i "%~1"=="add_domain" (
        goto :isAdmin
    ) else if /i "%~1"=="apply" (
        goto :isAdmin
    ) else if /i "%~1"=="deactivate" (
        goto :isAdmin
    ) else if /i "%~1"=="enable_youtube" (
        goto :isAdmin
    ) else (
        call :log Error: Invalid subcommand "%~1"
        goto :show_usage
    )

:: --- show usage ---
:show_usage
    echo.
    echo Usage: %~nx0 [subcommand]
    echo.
    echo Available subcommands:
    echo   add_domain [domain]        - Adds a domain to the hosts file
    echo   deactivate                 - Deactivates protection (removes hosts entries, resets DNS)
    echo   apply [level] [youtube]    - Applies protection with specified settings:
    echo                                level: high^|low 
    echo                                youtube: true^|false
    echo.
    goto :eof

:: --- check for admin permissions ---
:isAdmin

    :: Check for admin rights
    NET SESSION >nul 2>&1
    if %errorlevel% == 0 (
        call :log :::: start ::::
        echo running protect...
    ) else (
        call :log Requesting administrator permissions...
        echo Requesting administrator permissions...
        :: Re-launch as admin
        PowerShell -Command "Start-Process cmd -ArgumentList '/c %~dpnx0 %*' -Verb RunAs"
        
        call :log :::: finish ::::
        echo exiting
        exit /b 0
    )

    set "subcommand=%~1"
    shift

    if /i "%subcommand%"=="add_domain" (
        call :add_domain_func %*
    ) else if /i "%subcommand%"=="deactivate" (
        call :deactivate_func %*
    ) else if /i "%subcommand%"=="apply" (
        call :apply_func %*
    ) else if /i "%subcommand%"=="enable_youtube" (
        call :enable_youtube_func %*
    ) else (
        echo Error: Unknown subcommand "%subcommand%"
        echo Type %~nx0 for usage
    )

    goto :eof

:: --- Subcommand Functions ---

:: --- add domain subcommand ---
:add_domain_func
    setlocal
    
    set "text_to_add=%~2 %~3"

    call :log running add_domain

    call :log adding %text_to_add% to hosts file

    :: Check if any text was provided
    if "%text_to_add%"=="" (
        call :log Error: Text to add not provided.
        endlocal
        call :log :::: finish ::::
        echo exiting
        exit /b 1
    )

    :: Assign arguments to variables
    set "file_path=%SystemRoot%\System32\drivers\etc\hosts"

    call :log got hosts file path %file_path%

    :: Check if the text already exists in the file
    findstr /x /c:"%text_to_add%" "%file_path%" >nul
    if %ERRORLEVEL% equ 0 (

        call :log text "%text_to_add%" already exists in hosts file

        endlocal
        call :log :::: finish ::::
        echo exiting
        exit /b 1
    ) else (
        :: Append the text to the file

        call :log appending %text_to_add% to hosts file

        echo %text_to_add%>>"%file_path%"
        endlocal
        call :log :::: finish ::::
        echo exiting
        exit /b 0
    )

    endlocal

    call :log :::: finish ::::
    echo exiting
    exit /b 0

:: --- deactivate subcommand ---
:deactivate_func

    call :log running deactivate

    set "DnsOverHttps=family-filter-dns.cleanbrowsing.org"
    set "primaryAddress=185.228.168.168"
    set "secondaryAddress=185.228.169.168"
    set "act=removing"
    set "past_act=removed"

    call :log got variables %DnsOverHttps% %primaryAddress% %secondaryAddress%

    call :apply_dns

    call :log :::: finish ::::
    echo exiting

    pause
    exit /b 0

:: --- apply protection subommand ---
:apply_func

    call :log running apply

    call :log level = %~2, youtube = %~3
  
    set /a layer=1

    @rem hosts file script


    if /i not "%~2"=="high" if /i not "%~2"=="low" (
        call :log Error: Level must be either "high" or "low"
        call :log :::: finish ::::
        echo exiting
        exit /b 1
    )

    if /i not "%~3"=="true" if /i not "%~3"=="false" (
        call :log Error: YouTube setting must be either "true" or "false"
        call :log :::: finish ::::
        echo exiting
        exit /b 1
    )
    
    set "level=%~2"
    set "youtube=%~3"

    set "DnsOverHttps=%level%-dns.mafazaa.com"

    call :log got Dns-Over-Https %DnsOverHttps%

    if /i "%level%"=="high" (
        set "primaryAddress=15.184.147.40"
        set "secondaryAddress=15.184.182.221"
    ) else (
        set "primaryAddress=16.24.111.209"
        set "secondaryAddress=16.24.202.94"
    )

    call :log got addresses %primaryAddress%, %secondaryAddress% for level %level%

    set "act=applying"
    set "past_act=applied"
    
    call :log applying hosts file script

    call :hostsFileScript

    call :log applying dns
    call :apply_dns

    call :log :::: finish ::::
    echo exiting

    pause

    exit /b 0

:: --- common used functions ---

:: --- hosts file script ---
:hostsFileScript

    call :log called hosts file script

    echo %act% layer %layer% protection
    set file_path=C:\Windows\System32\drivers\etc\hosts

    :: Check if hosts already exists in the file
    findstr /x /c:"#mafazaa-hosts-start" "%file_path%" >nul
    if %ERRORLEVEL% equ 1 (
        call :log appending domains to hosts file
        :: Append the text to the file
        type domains.txt >> %file_path%
    ) else (
        call :log domains already exists in hosts file
    )

    call :log youtube is %youtube%

    if /i "%youtube%"=="false" (

        call :log making sure youtube domains aren't in hosts file
            
        for /f "usebackq delims=" %%d in ("youtube.txt") do (
        call :log removing "%%d" from hosts file
            findstr /v /x /c:"%%d" "%file_path%" > "%file_path%.tmp"
            move /y "%file_path%.tmp" "%file_path%" >nul
        )
        
        exit /b 0
    )

    :: Check if hosts already exists in the file
    findstr /x /c:"#mafazaa-youtube-enable-start" "%file_path%" >nul
    if %ERRORLEVEL% equ 1 (
        call :log appending youtube domains to hosts file
        :: Append the text to the file
        type youtube.txt >> %file_path%
    ) else (
        call :log youtube domains already exists in hosts file
    )

    echo protection layer %layer% is %past_act% successfully

    exit /b 0

:: --- apply dns ---
:apply_dns

    call :log called apply_dns with values %primaryAddress% %secondaryAddress% %DnsOverHttps%

    @rem chrome script from the registry editor
    :regEditChromeScript
    set /a layer=1

    echo applying layer %layer% protection
    call :log applying DnsOverHttps for google chrome
    set k=HKLM\SOFTWARE\Policies\Google\Chrome

    call :log got key %k%
    reg query "%k%" >nul 2>&1 || (
        reg add "%k%" /f
    )
    reg add "%k%" /v "DnsOverHttpsMode" /t REG_SZ /d "automatic" /f
    call :log added DnsOverHttpsMode to automatic for google chrome
    reg add "%k%" /v "DnsOverHttpsTemplates" /t REG_SZ /d "https://%DnsOverHttps%" /f
    call :log added DnsOverHttpsTemplates to https://%DnsOverHttps% for google chrome
    echo protection layer %layer% is %past_act% successfully


    @rem brave script from the registry editor
    :regEditBraveScript
    set /a layer=%layer%+1

    echo %act% layer %layer% protection
    call :log applying DnsOverHttps for brave

    set k=HKLM\Software\Policies\BraveSoftware\Brave

    call :log got key %k%
    reg query "%k%" >nul 2>&1 || (
        reg add "%k%" /f
    )
    reg add "%k%" /v "DnsOverHttpsMode" /t REG_SZ /d "automatic" /f
    call :log added DnsOverHttpsMode to automatic for google chrome
    reg add "%k%" /v "DnsOverHttpsTemplates" /t REG_SZ /d "https://%DnsOverHttps%" /f
    call :log added DnsOverHttpsTemplates to https://%DnsOverHttps% for google chrome
    echo protection layer %layer% is %past_act% successfully


    @rem netsh script
    :netshScript
    setlocal enableDelayedExpansion

    call :log starting netsh script

    for /f "tokens=5 delims= " %%i in ('netsh interface ip show interfaces ^| findstr "connected"') do (

        call set /a layer=layer+1
        
        netsh interface ip set dns %%i static %primaryAddress%
        call :log running "netsh interface ip set dns %%i static %primaryAddress%"

        netsh interface ip add dns name="%%i" %secondaryAddress% index=2
        call :log running "netsh interface ip add dns name="%%i" %secondaryAddress% index=2"

        echo layer !layer! is %past_act% successfully
    )

    call :log finished all netsh interfaces
    echo.
    echo.
    echo %layer% layers of protection are %past_act% on the device successfully!

    exit /b 0
