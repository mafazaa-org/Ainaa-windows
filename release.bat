@echo off
setlocal enabledelayedexpansion
chcp 65001

if "%~1"=="" (
    echo Usage: release.bat [version]
    exit /b 1
)
set NEW_VERSION=%~1
set NEW_VERSION_V=v%NEW_VERSION%

:: Check current branch
git branch --show-current > current_branch.txt
set /p CURRENT_BRANCH=<current_branch.txt
del current_branch.txt
if not "%CURRENT_BRANCH%"=="prod" (
    echo Must be on production branch to release.
    exit /b 1
)


git diff --cached --quiet
if %ERRORLEVEL% neq 0 (
    echo Warning: There are staged but uncommitted changes.
    git diff --cached --name-only
    endlocal
    exit /b 1
)

git diff --quiet
if %ERRORLEVEL% neq 0 (
    echo Error: There are unstaged changes in the working directory.
    git diff --name-only
    endlocal
    exit /b 1
)

:: Check for untracked files
git status --porcelain | findstr "^??" >nul
if %ERRORLEVEL% equ 0 (
    echo Error: There are untracked files in the repository.
    git status --porcelain | findstr "^??"
    endlocal
    exit /b 1
)

git fetch upstream
if %ERRORLEVEL% neq 0 (
    echo Error: Failed to fetch from upstream.
    exit /b 1
)

:: Compare local branch with upstream branch
git status -uno | findstr /C:"Your branch is up to date with" >nul
if %ERRORLEVEL% equ 0 (
    echo The local branch '%CURRENT_BRANCH%' is up to date with remote upstream.
) else (
    git status -uno | findstr /C:"Your branch is behind" >nul
    if %ERRORLEVEL% equ 0 (
        echo The local branch '%CURRENT_BRANCH%' is behind remote upstream. Run 'git pull' to update.
        exit /b 1
    ) else (
        git status -uno | findstr /C:"Your branch is ahead of" >nul
        if %ERRORLEVEL% equ 0 (
            echo The local branch '%CURRENT_BRANCH%' is ahead of remote upstream. Local changes need to be pushed or reset.
            exit /b 1
        ) else (
            echo The local branch '%CURRENT_BRANCH%' has diverged from remote upstream. Resolve conflicts or reset as needed.
            exit /b 1
        )
    )
)

gh release view %NEW_VERSION_V% -R https://github.com/mafazaa-org/Ainaa-windows >nul 2>&1
if %ERRORLEVEL% equ 0 (
    echo Release with tag '%NEW_VERSION_V%' already exists!
    exit /b 1
) else (
    echo there's no release for the version '%NEW_VERSION_V%' on github
)

echo Repository is clean: no unstaged changes, untracked files, or staged changes.


:: Update setupScript.iss
powershell -Command "(Get-Content installers\setupScript.iss) -replace '#define MyAppVersion ".*"', '#define MyAppVersion \"%NEW_VERSION_V%\"' | Set-Content installers\setupScript.iss"

powershell -Command "(Get-Content lib\constants\app_constants.dart) -replace 'static const String appVersion = ".*";', 'static const String appVersion = \"%NEW_VERSION%\";' | Set-Content lib\constants\app_constants.dart"

echo {"version": "%NEW_VERSION%"} > public\version.json

echo %NEW_VERSION_V% > version

call flutter build windows --release --dart-define=APP_ENV=prod --build-name %NEW_VERSION%

iscc installers\setupScript.iss

del version

git add .
git amend

git tag %NEW_VERSION_V% -f
git push upstream -f
git push --tags upstream -f

echo %NEW_VERSION_V% > version

gh release create %NEW_VERSION_V% --generate-notes ".\installers\مثبت عينا سلسبيلا.exe#مثبت عينا سلسبيلا" "version#version"

del version


echo Release completed.
endlocal