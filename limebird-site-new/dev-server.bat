@echo off
REM Limebird.org Development Server Manager - Batch Wrapper
REM This batch file runs the PowerShell script with proper execution policy

if "%1"=="" (
    echo Usage: dev-server.bat [start^|stop^|restart^|status^|test] [wait-time] [port]
    echo Examples:
    echo   dev-server.bat start
    echo   dev-server.bat restart 20
    echo   dev-server.bat status
    goto :eof
)

powershell -ExecutionPolicy Bypass -File "%~dp0dev-server.ps1" %* 