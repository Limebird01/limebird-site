# Limebird.org Development Server Manager
# This script helps manage the Next.js development server with proper timing and error handling
#
# USAGE (run with PowerShell):
#   powershell -ExecutionPolicy Bypass -File .\dev-server.ps1 start
#   powershell -ExecutionPolicy Bypass -File .\dev-server.ps1 stop
#   powershell -ExecutionPolicy Bypass -File .\dev-server.ps1 restart
#   powershell -ExecutionPolicy Bypass -File .\dev-server.ps1 status
#   powershell -ExecutionPolicy Bypass -File .\dev-server.ps1 test
#
# OR create a batch file wrapper (see dev-server.bat)
#
# TROUBLESHOOTING:
#   If server won't start: powershell -ExecutionPolicy Bypass -File .\dev-server.ps1 stop && powershell -ExecutionPolicy Bypass -File .\dev-server.ps1 start
#   If port in use: powershell -ExecutionPolicy Bypass -File .\dev-server.ps1 restart
#   If 404 errors: powershell -ExecutionPolicy Bypass -File .\dev-server.ps1 restart && powershell -ExecutionPolicy Bypass -File .\dev-server.ps1 test

param(
    [string]$Action = "start",
    [int]$WaitTime = 15,
    [string]$Port = "3000"
)

function Write-Status {
    param([string]$Message, [string]$Type = "INFO")
    $timestamp = Get-Date -Format "HH:mm:ss"
    $color = switch ($Type) {
        "SUCCESS" { "Green" }    # 🟢 Everything working
        "ERROR" { "Red" }        # 🔴 Problems that need attention
        "WARNING" { "Yellow" }   # 🟡 Potential issues
        default { "White" }      # ⚪ General information
    }
    Write-Host "[$timestamp] [$Type] $Message" -ForegroundColor $color
}

function Stop-DevServer {
    Write-Status "Stopping development server..."
    
    # Stop Node.js processes (cleans up conflicting processes)
    $nodeProcesses = Get-Process node -ErrorAction SilentlyContinue
    if ($nodeProcesses) {
        Write-Status "Found $($nodeProcesses.Count) Node.js processes, stopping..."
        $nodeProcesses | Stop-Process -Force
        Start-Sleep -Seconds 3  # Wait for process cleanup
        Write-Status "Node.js processes stopped" "SUCCESS"
    } else {
        Write-Status "No Node.js processes found" "WARNING"
    }
    
    # Check if port is still in use (prevents port conflicts)
    $portInUse = netstat -ano | findstr ":$Port "
    if ($portInUse) {
        Write-Status "Port $Port is still in use, waiting for cleanup..."
        Start-Sleep -Seconds 5  # Wait for port cleanup
    }
}

function Start-DevServer {
    Write-Status "Starting development server..."
    
    # Check if we're in the right directory (prevents wrong directory errors)
    if (-not (Test-Path "package.json")) {
        Write-Status "ERROR: package.json not found. Make sure you're in the limebird-site-new directory!" "ERROR"
        Write-Status "SOLUTION: cd limebird-site-new" "INFO"
        return $false
    }
    
    # Start the server in background (avoids blocking the terminal)
    Write-Status "Running npm run dev..."
    Start-Process -FilePath "npm" -ArgumentList "run", "dev" -WindowStyle Hidden
    
    # Wait for server to start (ensures server is ready before testing)
    Write-Status "Waiting $WaitTime seconds for server to start..."
    Start-Sleep -Seconds $WaitTime
    
    return $true
}

function Test-Server {
    param([string]$Url = "http://localhost:$Port")
    
    Write-Status "Testing server at $Url..."
    
    try {
        # Test server connection (validates server is responding)
        $response = Invoke-WebRequest -Uri $Url -UseBasicParsing -TimeoutSec 10 -ErrorAction Stop
        if ($response.StatusCode -eq 200) {
            Write-Status "Server is running successfully! Status: $($response.StatusCode)" "SUCCESS"
            Write-Status "Content length: $($response.RawContentLength) bytes" "SUCCESS"
            return $true
        } else {
            Write-Status "Server responded with status: $($response.StatusCode)" "WARNING"
            Write-Status "SOLUTION: .\dev-server.ps1 restart" "INFO"
            return $false
        }
    } catch {
        Write-Status "Failed to connect to server: $($_.Exception.Message)" "ERROR"
        Write-Status "SOLUTION: .\dev-server.ps1 restart" "INFO"
        return $false
    }
}

function Show-Status {
    Write-Status "=== Limebird.org Development Server Status ==="
    
    # Check Node.js processes (shows what's currently running)
    $nodeProcesses = Get-Process node -ErrorAction SilentlyContinue
    if ($nodeProcesses) {
        Write-Status "Node.js processes running: $($nodeProcesses.Count)" "SUCCESS"
        $nodeProcesses | ForEach-Object { Write-Status "  - PID: $($_.Id), CPU: $([math]::Round($_.CPU, 2))s" }
    } else {
        Write-Status "No Node.js processes running" "WARNING"
        Write-Status "SOLUTION: .\dev-server.ps1 start" "INFO"
    }
    
    # Check port usage (validates port availability)
    $portInUse = netstat -ano | findstr ":$Port "
    if ($portInUse) {
        Write-Status "Port $Port is in use" "SUCCESS"
    } else {
        Write-Status "Port $Port is not in use" "WARNING"
        Write-Status "SOLUTION: .\dev-server.ps1 start" "INFO"
    }
    
    # Test server connection (validates server is responding)
    Test-Server
}

# Main script logic (handles all commands)
switch ($Action.ToLower()) {
    "start" {
        # Start server: cleanup + start + test
        Stop-DevServer
        if (Start-DevServer) {
            Test-Server
        }
    }
    "stop" {
        # Stop server: cleanup only
        Stop-DevServer
        Write-Status "Development server stopped" "SUCCESS"
    }
    "restart" {
        # Restart server: cleanup + wait + start + test
        Write-Status "Restarting development server..."
        Stop-DevServer
        Start-Sleep -Seconds 3  # Wait between stop and start
        if (Start-DevServer) {
            Test-Server
        }
    }
    "status" {
        # Check status: processes + port + connection
        Show-Status
    }
    "test" {
        # Test only: connection test
        Test-Server
    }
    default {
        # Show help: usage examples
        Write-Status "Usage: dev-server.bat [start|stop|restart|status|test] [wait-time] [port]" "WARNING"
        Write-Status "Examples:" "INFO"
        Write-Status "  dev-server.bat start" "INFO"
        Write-Status "  dev-server.bat restart 20" "INFO"
        Write-Status "  dev-server.bat status" "INFO"
        Write-Status "Troubleshooting:" "INFO"
        Write-Status "  If server won't start: dev-server.bat stop && dev-server.bat start" "INFO"
        Write-Status "  If port in use: dev-server.bat restart" "INFO"
        Write-Status "  If 404 errors: dev-server.bat restart && dev-server.bat test" "INFO"
        Write-Status "Note: Use dev-server.bat instead of .\dev-server.ps1 to avoid execution policy issues" "INFO"
    }
} 