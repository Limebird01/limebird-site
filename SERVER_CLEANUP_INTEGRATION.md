# Server Cleanup Integration

## Overview

Server cleanup functionality has been integrated into all build and deployment scripts to ensure a clean environment before and after processes. This prevents port conflicts and ensures no lingering development processes interfere with builds or deployments.

## What Was Added

### 1. Server Cleanup Function

A `Cleanup-Servers` function was added to all scripts with the following capabilities:

#### **Port Management:**
- Checks common development ports: `3000, 3001, 5173, 8080, 8000, 4000, 5000, 6000, 7000, 9000`
- Identifies processes using these ports
- Forcefully stops processes to free ports
- Logs all cleanup activities

#### **Process Management:**
- Stops common development processes: `node, npm, next, vite, webpack, jest, cypress`
- Forcefully terminates processes that might interfere with builds
- Provides detailed logging of cleanup activities

#### **Safety Features:**
- Error handling for each cleanup step
- Graceful degradation if processes can't be stopped
- Detailed logging for troubleshooting
- Phase identification ("before" or "after")

### 2. Integration Points

#### **Build Scripts:**
- `build-local.ps1` - Local development builds
- `build-dev.ps1` - Development environment builds  
- `build-prod.ps1` - Production environment builds

#### **Deployment Scripts:**
- `deploy-dev.ps1` - Development deployments
- `deploy-simple.ps1` - Production deployments

### 3. Execution Flow

#### **Before Process:**
```
1. Pre-flight checks
2. Server cleanup (before)
3. Linting
4. Unit tests
5. Build process
```

#### **After Process:**
```
1. Build completion
2. Server cleanup (after)
3. Success message
4. Script termination
```

## Function Details

### Cleanup-Servers Function

```powershell
function Cleanup-Servers {
    param([string]$Phase = "before")
    
    Write-Log "=== Server Cleanup ($Phase build) ===" "INFO"
    
    # Common development ports to check and clean
    $devPorts = @(3000, 3001, 5173, 8080, 8000, 4000, 5000, 6000, 7000, 9000)
    
    foreach ($port in $devPorts) {
        Write-Log "Checking port $port..."
        try {
            $connection = Test-NetConnection -ComputerName "localhost" -Port $port -WarningAction SilentlyContinue
            if ($connection.TcpTestSucceeded) {
                Write-Log "Port $port is in use - attempting to free it" "WARNING"
                
                # Find process using the port
                $netstat = netstat -ano | findstr ":$port "
                if ($netstat) {
                    $parts = $netstat -split '\s+'
                    if ($parts.Length -ge 5) {
                        $pid = $parts[4]
                        try {
                            $process = Get-Process -Id $pid -ErrorAction SilentlyContinue
                            if ($process) {
                                Write-Log "Stopping process $($process.ProcessName) (PID: $pid) on port $port" "INFO"
                                $process | Stop-Process -Force
                                Start-Sleep -Seconds 1
                                Write-Log "Successfully freed port $port" "SUCCESS"
                            }
                        } catch {
                            Write-Log "Could not stop process on port $port" "WARNING"
                        }
                    }
                }
            } else {
                Write-Log "Port $port is free" "DEBUG"
            }
        } catch {
            Write-Log "Error checking port $port: $($_.Exception.Message)" "DEBUG"
        }
    }
    
    # Stop common development processes
    $devProcesses = @("node", "npm", "next", "vite", "webpack", "jest", "cypress")
    foreach ($procName in $devProcesses) {
        $processes = Get-Process -Name $procName -ErrorAction SilentlyContinue
        if ($processes) {
            Write-Log "Found $($processes.Count) $procName processes - stopping them" "WARNING"
            try {
                $processes | Stop-Process -Force
                Start-Sleep -Seconds 1
                Write-Log "Stopped all $procName processes" "SUCCESS"
            } catch {
                Write-Log "Error stopping $procName processes: $($_.Exception.Message)" "WARNING"
            }
        }
    }
    
    Write-Log "Server cleanup ($Phase) completed" "SUCCESS"
}
```

## Benefits

### 1. **Conflict Prevention**
- Prevents port conflicts during builds
- Ensures clean environment for deployment
- Eliminates interference from previous development sessions

### 2. **Reliability**
- Consistent environment for all builds
- Reduces build failures due to port conflicts
- Improves deployment success rates

### 3. **Resource Management**
- Frees up system resources
- Prevents memory leaks from lingering processes
- Optimizes system performance

### 4. **Debugging**
- Clear logging of cleanup activities
- Easy identification of problematic processes
- Detailed error reporting

## Usage

### **Automatic Execution**
The cleanup runs automatically as part of the build/deployment process:

```powershell
# Before process
Cleanup-Servers -Phase "before"

# ... build/deployment process ...

# After process  
Cleanup-Servers -Phase "after"
```

### **Manual Execution**
You can also run the existing cleanup script manually:

```powershell
# Full cleanup
.\cleanup-dev.ps1

# Force cleanup
.\cleanup-dev.ps1 -Force

# Verbose cleanup
.\cleanup-dev.ps1 -Verbose
```

## Monitoring

### **Log Files**
All cleanup activities are logged to the respective script log files:
- `build-local.log`
- `build-dev.log` 
- `build-prod.log`
- `deploy-dev.log`
- `deploy-simple.log`

### **Console Output**
Real-time feedback is provided through colored console output:
- 🟢 **Green** - Successful cleanup
- 🟡 **Yellow** - Warnings
- 🔴 **Red** - Errors
- ⚪ **White** - Information
- 🔵 **Cyan** - Debug information

## Troubleshooting

### **Common Issues**

1. **Process Won't Stop**
   - Use the existing `cleanup-dev.ps1` script with `-Force` flag
   - Manually kill processes through Task Manager

2. **Port Still in Use**
   - Check if process was successfully terminated
   - Wait a few seconds for port to be released
   - Restart the build/deployment process

3. **Permission Issues**
   - Run PowerShell as Administrator
   - Check Windows Defender settings
   - Verify user permissions

### **Debug Mode**
Enable verbose logging to see detailed cleanup activities:

```powershell
.\cleanup-dev.ps1 -Verbose
```

## Future Enhancements

### **Potential Improvements**

1. **Configurable Ports**
   - Make port list configurable via environment variables
   - Allow custom port ranges

2. **Process Whitelist**
   - Allow certain processes to be excluded from cleanup
   - Configurable process lists per environment

3. **Cleanup Profiles**
   - Different cleanup strategies for different environments
   - Light vs. aggressive cleanup options

4. **Integration with CI/CD**
   - Automated cleanup in continuous integration
   - Pre and post-deployment cleanup hooks

## Summary

The server cleanup integration provides a robust foundation for reliable builds and deployments by ensuring a clean environment before and after all processes. This prevents conflicts, improves reliability, and provides better debugging capabilities.

**Key Features:**
- ✅ Automatic port cleanup
- ✅ Process termination
- ✅ Detailed logging
- ✅ Error handling
- ✅ Phase identification
- ✅ Integration with all build/deployment scripts

**Files Modified:**
- `build-local.ps1`
- `build-dev.ps1`
- `build-prod.ps1`
- `deploy-dev.ps1`
- `deploy-simple.ps1`

The integration leverages the existing `cleanup-dev.ps1` script's functionality while providing targeted cleanup specifically for build and deployment processes.

## Additional Fixes Applied

### **npm Command Execution Standardization**

All scripts have been updated to use consistent npm command execution patterns:

#### **Before (Inconsistent):**
```powershell
# Old method - used in dev/prod scripts
$lintProcess = Start-Process -FilePath "npm" -ArgumentList "run", "lint" -Wait -PassThru -NoNewWindow
if ($lintProcess.ExitCode -ne 0) {
    # Error handling
}
```

#### **After (Standardized):**
```powershell
# New method - consistent across all scripts
try {
    npm run lint
    if ($LASTEXITCODE -ne 0) {
        # Error handling
    }
} catch {
    # Exception handling
}
```

#### **Benefits of Standardization:**
- ✅ **Consistent error handling** across all environments
- ✅ **Better exception handling** with try/catch blocks
- ✅ **Improved logging** with detailed error messages
- ✅ **Fail-fast methodology** properly implemented
- ✅ **Cleaner code** with direct command execution

#### **Scripts Updated:**
- ✅ `build-dev.ps1` - Updated npm command execution
- ✅ `build-prod.ps1` - Updated npm command execution  
- ✅ `deploy-dev.ps1` - Updated npm command execution
- ✅ `deploy-simple.ps1` - Updated npm command execution
- ✅ `build-local.ps1` - Already had correct implementation 