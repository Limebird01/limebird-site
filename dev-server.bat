@echo off
REM Limebird.org Development Server Manager - Batch Wrapper
REM This batch file runs the PowerShell dev-server script

echo Starting Limebird.org Development Server...
powershell -ExecutionPolicy Bypass -File "%~dp0dev-server.ps1" %*

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo Error running dev-server script.
    echo Make sure PowerShell execution policy allows running scripts.
    echo Try: Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
    pause
) 