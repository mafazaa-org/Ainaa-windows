@echo off

setlocal enabledelayedexpansion
chcp 65001

if "%~1"=="" (
    echo Usage: release.bat [version]
    exit /b 1
)
set NEW_VERSION=%~1
set NEW_VERSION_V=v%NEW_VERSION%

:: Update setupScript.iss
powershell -Command "(Get-Content installers\setupScript.iss) -replace '#define MyAppVersion ".*"', '#define MyAppVersion \"%NEW_VERSION_V%\"' | Set-Content installers\setupScript.iss"

powershell -Command "(Get-Content lib\constants\app_constants.dart) -replace 'static const String appVersion = ".*";', 'static const String appVersion = \"%NEW_VERSION%\";' | Set-Content lib\constants\app_constants.dart"


echo {"version": "%NEW_VERSION%"} > public\version.json

echo %NEW_VERSION_V% > version

@REM call flutter build windows --release --dart-define=APP_ENV=prod --build-name %NEW_VERSION%

iscc installers\setupScript.iss

del version

"installers\مثبت عينا سلسبيلا.exe" /silent