# Limebird.org Development Environment Cleanup Script
# This script systematically finds and closes all development servers and processes
#
# USAGE (run with PowerShell):
#   powershell -ExecutionPolicy Bypass -File .\cleanup-dev.ps1
#   powershell -ExecutionPolicy Bypass -File .\cleanup-dev.ps1 -Force
#   powershell -ExecutionPolicy Bypass -File .\cleanup-dev.ps1 -Verbose
#
# OR use the batch wrapper:
#   .\cleanup-dev.bat
#   .\cleanup-dev.bat -Force
#
# WHAT IT CLEANS:
#   - Node.js processes (npm, node, vite, jest, etc.)
#   - Common development ports (3000, 3001, 5173, 8080, etc.)
#   - Package managers (npm, yarn, pnpm)
#   - Build tools (webpack, vite, rollup)
#   - Testing frameworks (jest, cypress, playwright)
#   - Development servers (next, react-scripts, etc.)
#   - Terminal windows (PowerShell, cmd, Windows Terminal)
#   - IDE terminals (VS Code, WebStorm, etc.)

param(
    [switch]$Force = $false,
    [switch]$Verbose = $false,
    [switch]$Selective = $false,
    [string]$LogFile = "cleanup-dev.log"
)

# Initialize logging
$LogPath = Join-Path $PSScriptRoot $LogFile
$StartTime = Get-Date

function Write-Log {
    param([string]$Message, [string]$Type = "INFO")
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logEntry = "[$timestamp] [$Type] $Message"
    
    # Console output with colors
    $color = switch ($Type) {
        "SUCCESS" { "Green" }    # 🟢 Cleanup successful
        "ERROR" { "Red" }        # 🔴 Problems that need attention
        "WARNING" { "Yellow" }   # 🟡 Potential issues
        "INFO" { "White" }       # ⚪ General information
        "DEBUG" { "Cyan" }       # 🔵 Verbose debugging info
        default { "White" }
    }
    
    Write-Host $logEntry -ForegroundColor $color
    
    # File logging
    Add-Content -Path $LogPath -Value $logEntry
}

function Write-Header {
    Write-Log "=== Limebird.org Development Environment Cleanup ===" "INFO"
    Write-Log "Started at: $StartTime" "INFO"
    Write-Log "Force mode: $Force" "INFO"
    Write-Log "Verbose mode: $Verbose" "INFO"
    Write-Log "Selective mode: $Selective" "INFO"
    Write-Log "Log file: $LogPath" "INFO"
}

function Get-ProcessInfo {
    param([string]$ProcessName)
    
    $processes = Get-Process -Name $ProcessName -ErrorAction SilentlyContinue
    if ($processes) {
        Write-Log "Found $($processes.Count) $ProcessName processes" "INFO"
        foreach ($proc in $processes) {
            $info = "  - PID: $($proc.Id), CPU: $([math]::Round($proc.CPU, 2))s, Memory: $([math]::Round($proc.WorkingSet64/1MB, 2))MB"
            Write-Log $info "DEBUG"
        }
        return $processes
    } else {
        Write-Log "No $ProcessName processes found" "DEBUG"
        return @()
    }
}

function Stop-Processes {
    param([string]$ProcessName, [string]$Description)
    
    Write-Log "Cleaning up $Description..." "INFO"
    
    $processes = Get-ProcessInfo $ProcessName
    if ($processes) {
        try {
            if ($Force) {
                Write-Log "Force stopping $($processes.Count) $ProcessName processes..." "WARNING"
                $processes | Stop-Process -Force
            } else {
                Write-Log "Gracefully stopping $($processes.Count) $ProcessName processes..." "INFO"
                $processes | Stop-Process
            }
            
            # Wait for processes to stop
            Start-Sleep -Seconds 1
            
            # Verify processes are stopped
            $remaining = Get-Process -Name $ProcessName -ErrorAction SilentlyContinue
            if ($remaining) {
                Write-Log "Warning: $($remaining.Count) $ProcessName processes still running" "WARNING"
                if ($Force) {
                    Write-Log "Force killing remaining processes..." "WARNING"
                    $remaining | Stop-Process -Force
                    Start-Sleep -Seconds 1
                }
            } else {
                Write-Log "Successfully stopped all $ProcessName processes" "SUCCESS"
            }
        } catch {
            Write-Log "Error stopping $ProcessName processes: $($_.Exception.Message)" "ERROR"
        }
    }
}

function Test-Port {
    param([int]$Port)
    
    try {
        $connection = Test-NetConnection -ComputerName "localhost" -Port $Port -WarningAction SilentlyContinue
        return $connection.TcpTestSucceeded
    } catch {
        return $false
    }
}

function Get-PortProcess {
    param([int]$Port)
    
    try {
        $netstat = netstat -ano | findstr ":$Port "
        if ($netstat) {
            $parts = $netstat -split '\s+'
            if ($parts.Length -ge 5) {
                $pid = $parts[4]
                try {
                    $process = Get-Process -Id $pid -ErrorAction SilentlyContinue
                    return $process
                } catch {
                    return $null
                }
            }
        }
        return $null
    } catch {
        return $null
    }
}

function Stop-PortProcess {
    param([int]$Port, [string]$Description)
    
    Write-Log "Checking port $Port ($Description)..." "INFO"
    
    if (Test-Port $Port) {
        Write-Log "Port $Port is in use" "WARNING"
        $process = Get-PortProcess $Port
        if ($process) {
            Write-Log "Process using port ${Port}: $($process.ProcessName) (PID: $($process.Id))" "INFO"
            try {
                if ($Force) {
                    Write-Log "Force stopping process on port ${Port}..." "WARNING"
                    $process | Stop-Process -Force
                } else {
                    Write-Log "Gracefully stopping process on port ${Port}..." "INFO"
                    $process | Stop-Process
                }
                Start-Sleep -Seconds 1
                Write-Log "Stopped process on port ${Port}" "SUCCESS"
            } catch {
                Write-Log "Error stopping process on port ${Port}: $($_.Exception.Message)" "ERROR"
            }
        } else {
            Write-Log "Could not identify process using port ${Port}" "WARNING"
        }
    } else {
        Write-Log "Port ${Port} is free" "DEBUG"
    }
}

function Cleanup-DevelopmentProcesses {
    Write-Log "=== Cleaning Development Processes ===" "INFO"
    
    # Node.js and related processes
    $nodeProcesses = @(
        @{Name="node"; Description="Node.js runtime"},
        @{Name="npm"; Description="Node Package Manager"},
        @{Name="npx"; Description="Node Package Execute"},
        @{Name="yarn"; Description="Yarn package manager"},
        @{Name="pnpm"; Description="PNPM package manager"}
    )
    
    foreach ($proc in $nodeProcesses) {
        Stop-Processes -ProcessName $proc.Name -Description $proc.Description
    }
    
    # Build tools and development servers
    $devProcesses = @(
        @{Name="vite"; Description="Vite development server"},
        @{Name="webpack"; Description="Webpack bundler"},
        @{Name="rollup"; Description="Rollup bundler"},
        @{Name="parcel"; Description="Parcel bundler"},
        @{Name="next"; Description="Next.js development server"},
        @{Name="react-scripts"; Description="Create React App"},
        @{Name="gatsby"; Description="Gatsby development server"},
        @{Name="nuxt"; Description="Nuxt.js development server"},
        @{Name="astro"; Description="Astro development server"}
    )
    
    foreach ($proc in $devProcesses) {
        Stop-Processes -ProcessName $proc.Name -Description $proc.Description
    }
    
    # Testing frameworks
    $testProcesses = @(
        @{Name="jest"; Description="Jest test runner"},
        @{Name="cypress"; Description="Cypress test runner"},
        @{Name="playwright"; Description="Playwright test runner"},
        @{Name="mocha"; Description="Mocha test runner"},
        @{Name="karma"; Description="Karma test runner"}
    )
    
    foreach ($proc in $testProcesses) {
        Stop-Processes -ProcessName $proc.Name -Description $proc.Description
    }
    
    # Package managers and tools
    $toolProcesses = @(
        @{Name="tsc"; Description="TypeScript compiler"},
        @{Name="eslint"; Description="ESLint linter"},
        @{Name="prettier"; Description="Prettier formatter"},
        @{Name="babel"; Description="Babel transpiler"},
        @{Name="postcss"; Description="PostCSS processor"}
    )
    
    foreach ($proc in $toolProcesses) {
        Stop-Processes -ProcessName $proc.Name -Description $proc.Description
    }
}

function Cleanup-TerminalProcesses {
    Write-Log "=== Cleaning Terminal Processes ===" "INFO"
    
    # Terminal and command line processes
    $terminalProcesses = @(
        @{Name="cmd"; Description="Command Prompt windows"},
        @{Name="conhost"; Description="Console Host processes"},
        @{Name="WindowsTerminal"; Description="Windows Terminal"},
        @{Name="wt"; Description="Windows Terminal executable"},
        @{Name="code"; Description="VS Code (if running standalone)"},
        @{Name="devenv"; Description="Visual Studio (if running)"},
        @{Name="webstorm64"; Description="WebStorm (if running)"},
        @{Name="idea64"; Description="IntelliJ IDEA (if running)"},
        @{Name="sublime_text"; Description="Sublime Text (if running)"},
        @{Name="notepad++"; Description="Notepad++ (if running)"}
    )
    
    # In selective mode, don't stop PowerShell processes to avoid killing the build script
    if (-not $Selective) {
        $terminalProcesses += @{Name="powershell"; Description="PowerShell terminals"}
    } else {
        Write-Log "Skipping PowerShell processes in selective mode to preserve build script" "INFO"
    }
    
    foreach ($proc in $terminalProcesses) {
        Stop-Processes -ProcessName $proc.Name -Description $proc.Description
    }
    
    # Additional terminal cleanup for IDE integrated terminals
    Write-Log "Cleaning up IDE integrated terminals..." "INFO"
    
    # Find processes that might be running in terminals
    $terminalKeywords = @("node", "npm", "yarn", "pnpm", "vite", "next", "jest", "cypress")
    $foundTerminalProcesses = @()
    
    foreach ($keyword in $terminalKeywords) {
        $processes = Get-Process -Name $keyword -ErrorAction SilentlyContinue
        if ($processes) {
            foreach ($proc in $processes) {
                try {
                    # Check if process has a console window
                    $hasConsole = $proc.MainWindowTitle -ne ""
                    if ($hasConsole) {
                        $foundTerminalProcesses += @{
                            Process = $proc
                            Name = $proc.ProcessName
                            PID = $proc.Id
                            WindowTitle = $proc.MainWindowTitle
                        }
                    }
                } catch {
                    # Process might not have window info, include anyway
                    $foundTerminalProcesses += @{
                        Process = $proc
                        Name = $proc.ProcessName
                        PID = $proc.Id
                        WindowTitle = "Unknown"
                    }
                }
            }
        }
    }
    
    if ($foundTerminalProcesses.Count -gt 0) {
        Write-Log "Found $($foundTerminalProcesses.Count) processes running in terminals:" "WARNING"
        foreach ($termProc in $foundTerminalProcesses) {
            Write-Log "  - $($termProc.Name) (PID: $($termProc.PID)) - $($termProc.WindowTitle)" "INFO"
            try {
                if ($Force) {
                    $termProc.Process | Stop-Process -Force
                } else {
                    $termProc.Process | Stop-Process
                }
            } catch {
                Write-Log "Error stopping terminal process $($termProc.Name): $($_.Exception.Message)" "ERROR"
            }
        }
        Start-Sleep -Seconds 2
        Write-Log "Terminal processes cleaned up" "SUCCESS"
    } else {
        Write-Log "No terminal processes found" "DEBUG"
    }
}

function Cleanup-DevelopmentPorts {
    Write-Log "=== Cleaning Development Ports ===" "INFO"
    
    # Common development ports
    $devPorts = @(
        @{Port=3000; Description="Next.js/React default"},
        @{Port=3001; Description="Next.js/React alternate"},
        @{Port=5173; Description="Vite default"},
        @{Port=8080; Description="Webpack dev server"},
        @{Port=8000; Description="Alternative dev server"},
        @{Port=4000; Description="Gatsby default"},
        @{Port=5000; Description="Flask/Express default"},
        @{Port=6000; Description="Alternative dev server"},
        @{Port=7000; Description="Alternative dev server"},
        @{Port=9000; Description="Alternative dev server"},
        @{Port=4200; Description="Angular default"},
        @{Port=4300; Description="Angular alternate"},
        @{Port=8888; Description="Alternative dev server"},
        @{Port=9999; Description="Alternative dev server"}
    )
    
    foreach ($portInfo in $devPorts) {
        Stop-PortProcess -Port $portInfo.Port -Description $portInfo.Description
    }
}

function Show-CleanupSummary {
    Write-Log "=== Cleanup Summary ===" "INFO"
    
    $EndTime = Get-Date
    $Duration = $EndTime - $StartTime
    Write-Log "Cleanup completed in $([math]::Round($Duration.TotalSeconds, 2)) seconds" "INFO"
    
    # Check for remaining processes
    Write-Log "Checking for remaining development processes..." "INFO"
    
    $remainingProcesses = @()
    $processNames = @("node", "npm", "npx", "yarn", "pnpm", "vite", "webpack", "jest", "cypress")
    
    foreach ($name in $processNames) {
        $processes = Get-Process -Name $name -ErrorAction SilentlyContinue
        if ($processes) {
            $remainingProcesses += @{Name=$name; Count=$processes.Count}
        }
    }
    
    # Check for remaining terminal processes
    Write-Log "Checking for remaining terminal processes..." "INFO"
    
    $remainingTerminalProcesses = @()
    $terminalProcessNames = @("powershell", "cmd", "conhost", "WindowsTerminal", "wt")
    
    foreach ($name in $terminalProcessNames) {
        $processes = Get-Process -Name $name -ErrorAction SilentlyContinue
        if ($processes) {
            $remainingTerminalProcesses += @{Name=$name; Count=$processes.Count}
        }
    }
    
    if ($remainingProcesses.Count -gt 0) {
        Write-Log "Warning: Found remaining development processes:" "WARNING"
        foreach ($proc in $remainingProcesses) {
            Write-Log "  - $($proc.Name): $($proc.Count) processes" "WARNING"
        }
        Write-Log "SOLUTION: Run cleanup again with -Force flag" "INFO"
    } else {
        Write-Log "All development processes cleaned successfully!" "SUCCESS"
    }
    
    if ($remainingTerminalProcesses.Count -gt 0) {
        Write-Log "Warning: Found remaining terminal processes:" "WARNING"
        foreach ($proc in $remainingTerminalProcesses) {
            Write-Log "  - $($proc.Name): $($proc.Count) processes" "WARNING"
        }
        Write-Log "SOLUTION: Run cleanup again with -Force flag" "INFO"
    } else {
        Write-Log "All terminal processes cleaned successfully!" "SUCCESS"
    }
    
    # Check for remaining ports
    Write-Log "Checking for remaining development ports..." "INFO"
    
    $devPorts = @(3000, 3001, 5173, 8080, 8000, 4000, 5000, 6000, 7000, 9000, 4200, 4300, 8888, 9999)
    $occupiedPorts = @()
    
    foreach ($port in $devPorts) {
        if (Test-Port $port) {
            $occupiedPorts += $port
        }
    }
    
    if ($occupiedPorts.Count -gt 0) {
        Write-Log "Warning: Found occupied development ports:" "WARNING"
        foreach ($port in $occupiedPorts) {
            Write-Log "  - Port $port" "WARNING"
        }
        Write-Log "SOLUTION: Run cleanup again with -Force flag" "INFO"
    } else {
        Write-Log "All development ports are free!" "SUCCESS"
    }
}

# Main execution
try {
    Write-Host "DEBUG: Starting cleanup-dev.ps1" -ForegroundColor Magenta
    Write-Header
    
    # Clean up development processes
    Cleanup-DevelopmentProcesses
    Write-Host "DEBUG: Finished Node.js cleanup" -ForegroundColor Magenta
    Write-Host "DEBUG: Finished npm cleanup" -ForegroundColor Magenta
    Write-Host "DEBUG: Finished npx cleanup" -ForegroundColor Magenta
    
    # Clean up terminal processes
    Cleanup-TerminalProcesses
    
    # Clean up ports
    Cleanup-DevelopmentPorts
    
    # Show summary
    Show-CleanupSummary
    
    Write-Log "Cleanup script completed successfully!" "SUCCESS"
    Write-Host "DEBUG: Finished all cleanup steps, about to exit cleanup-dev.ps1" -ForegroundColor Magenta
    
} catch {
    Write-Log "Error during cleanup: $($_.Exception.Message)" "ERROR"
    Write-Log "Stack trace: $($_.ScriptStackTrace)" "ERROR"
    exit 1
} 