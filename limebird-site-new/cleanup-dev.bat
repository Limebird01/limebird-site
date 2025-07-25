@echo off
REM Limebird.org Development Environment Cleanup - Batch Wrapper
REM This batch file runs the PowerShell cleanup script with proper execution policy

if "%1"=="" (
    echo Usage: cleanup-dev.bat [options]
    echo Options:
    echo   -Force    Force kill stubborn processes
    echo   -Verbose  Show detailed debugging info
    echo Examples:
    echo   cleanup-dev.bat
    echo   cleanup-dev.bat -Force
    echo   cleanup-dev.bat -Verbose
    goto :eof
)

powershell -ExecutionPolicy Bypass -File "%~dp0cleanup-dev.ps1" %* 