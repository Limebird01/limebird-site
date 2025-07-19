@echo off
REM Limebird.org - Deployment Script Wrapper
REM 
REM This batch file makes it easy to run the PowerShell deployment script
REM 
REM Usage: deploy.bat [commit-message]
REM Example: deploy.bat "Update website content"

echo.
echo 🚀 Limebird.org - Deployment Script
echo ===================================
echo.

REM Check if PowerShell is available
powershell -Command "Write-Host 'PowerShell is available'" >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Error: PowerShell is not available
    echo Please ensure PowerShell is installed and accessible
    pause
    exit /b 1
)

REM Check if the PowerShell script exists
if not exist "deploy.ps1" (
    echo ❌ Error: deploy.ps1 not found
    echo Please ensure you're in the correct directory
    pause
    exit /b 1
)

REM Run the PowerShell script with any arguments
if "%1"=="" (
    echo Running deployment with default commit message...
    powershell -ExecutionPolicy Bypass -File "deploy.ps1"
) else (
    echo Running deployment with commit message: "%1"
    powershell -ExecutionPolicy Bypass -File "deploy.ps1" "%1"
)

REM Check if the deployment was successful
if %errorlevel% equ 0 (
    echo.
    echo ✅ Deployment script completed successfully
) else (
    echo.
    echo ❌ Deployment script encountered an error
)

echo.
pause 