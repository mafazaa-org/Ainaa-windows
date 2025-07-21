@echo off

:: Main script for managing blocker functionalities

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
        echo Error: Invalid subcommand "%~1"
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
        echo running protect...
    ) else (
        echo Requesting administrator permissions...
        :: Re-launch as admin
        PowerShell -Command "Start-Process cmd -ArgumentList '/c %~dpnx0 %*' -Verb RunAs"
        exit /b
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
        echo Error: Unknown subcommand "%subcommand%".
        echo Type %~nx0 for usage.
    )

    goto :eof

:: --- Subcommand Functions ---

:: --- add domain subcommand ---
:add_domain_func
    setlocal
    
    :: Check if called from command line or internally
    if /i "%~1"=="add_domain" (
        :: Called from command line, shift arguments
        set "text_to_add=%~2 %~3"
    ) else (
        :: Called internally
        set "text_to_add=%~1"
    )

    :: Check if any text was provided
    if "%text_to_add%"=="" (
        echo Error: Text to add not provided.
        endlocal
        exit /b 1
    )

    :: Assign arguments to variables
    set "file_path=%SystemRoot%\System32\drivers\etc\hosts"

    :: Check if the text already exists in the file
    findstr /x /c:"%text_to_add%" "%file_path%" >nul
    if %ERRORLEVEL% equ 0 (
        endlocal
        exit /b 1
    ) else (
        :: Append the text to the file
        echo %text_to_add%>>"%file_path%"
        endlocal
        exit /b 0
    )

    endlocal
    goto :eof

:: --- deactivate subcommand ---
:deactivate_func

    set "DnsOverHttps=family-filter-dns.cleanbrowsing.org"
    set "primaryAddress=185.228.168.168"
    set "secondaryAddress=185.228.169.168"
    set "act=removing"
    set "past_act=removed"

    call :apply_dns

    exit /b 0

:: --- apply protection subommand ---
:apply_func
  
    set /a layer=1

    @rem hosts file script

    if /i not "%~2"=="high" if /i not "%~2"=="low" (
        echo Error: Level must be either "high" or "low"
        exit /b 1
    )

    if /i not "%~3"=="true" if /i not "%~3"=="false" (
        echo Error: YouTube setting must be either "true" or "false"
        exit /b 1
    )

    set "level=%~2"
    set "youtube=%~3"

    set "DnsOverHttps=%level%-dns.mafazaa.com"

    if /i "%level%"=="high" (
        set "primaryAddress=15.184.147.40"
        set "secondaryAddress=15.184.182.221"
    ) else (
        set "primaryAddress=16.24.111.209"
        set "secondaryAddress=16.24.202.94"
    )

    set "act=applying"
    set "past_act=applied"

    call :hostsFileScript

    call :apply_dns

    echo exiting
    exit /b 0

:: --- common used functions ---

:: --- hosts file script ---
:hostsFileScript
    echo %act% layer %layer% protection
    set file=C:\Windows\System32\drivers\etc\hosts

    :: Check if hosts already exists in the file
    findstr /x /c:"#mafazaa-hosts-start" "%file_path%" >nul
    if %ERRORLEVEL% equ 1 (
        echo appending
        :: Append the text to the file
        type domains.txt >> %file_path%
    )

    echo youtube is %youtube%

    if /i "%youtube%"=="false" (
        exit /b 0
    )

    :: Check if hosts already exists in the file
    findstr /x /c:"#mafazaa-youtube-enable-start" "%file_path%" >nul
    if %ERRORLEVEL% equ 1 (
        :: Append the text to the file
        type youtube.txt >> %file_path%
    )

    echo protection layer %layer% is %past_act% successfully

    exit /b 0

:: --- apply dns ---
:apply_dns

    @rem chrome script from the registry editor
    :regEditChromeScript
    set /a layer=1

    echo applying layer %layer% protection
    set k=HKLM\SOFTWARE\Policies\Google\Chrome
    reg query "%k%" >nul 2>&1 || (
        reg add "%k%" /f
    )
    reg add "%k%" /v "DnsOverHttpsMode" /t REG_SZ /d "automatic" /f
    reg add "%k%" /v "DnsOverHttpsTemplates" /t REG_SZ /d "https://%DnsOverHttps%" /f
    echo protection layer %layer% is %past_act% successfully


    @rem brave script from the registry editor
    :regEditBraveScript
    set /a layer=%layer%+1

    echo %act% layer %layer% protection
    set k=HKLM\Software\Policies\BraveSoftware\Brave
    reg query "%k%" >nul 2>&1 || (
        reg add "%k%" /f
    )
    reg add "%k%" /v "DnsOverHttpsMode" /t REG_SZ /d "automatic" /f
    reg add "%k%" /v "DnsOverHttpsTemplates" /t REG_SZ /d "https://%DnsOverHttps%" /f
    echo protection layer %layer% is %past_act% successfully


    @rem netsh script
    :netshScript
    setlocal enableDelayedExpansion


    for /f "tokens=5 delims= " %%i in ('netsh interface ip show interfaces ^| findstr "connected"') do (

        call set /a layer=layer+1
        
        netsh interface ip set dns %%i static %primaryAddress%

        netsh interface ip add dns name="%%i" %secondaryAddress% index=2

        echo layer !layer! is %past_act% successfully
    )
    echo.
    echo.
    echo %layer% layers of protection are %past_act% on the device successfully!

    exit /b 0
