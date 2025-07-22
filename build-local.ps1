# Local build script for testing production build
$logFile = "build-local.log"

# Create log entry function with dynamic timestamp
function Write-Log {
    param([string]$Message)
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logEntry = "[$timestamp] $Message"
    Add-Content -Path $logFile -Value $logEntry
    Write-Host $Message -ForegroundColor Cyan
}

# Create error log function
function Write-ErrorLog {
    param([string]$Message)
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logEntry = "[$timestamp] ERROR: $Message"
    Add-Content -Path $logFile -Value $logEntry
    Write-Host "ERROR: $Message" -ForegroundColor Red
}

# Create success log function
function Write-SuccessLog {
    param([string]$Message)
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logEntry = "[$timestamp] SUCCESS: $Message"
    Add-Content -Path $logFile -Value $logEntry
    Write-Host "SUCCESS: $Message" -ForegroundColor Green
}

# Start build with timestamp
$startTime = Get-Date
Write-Log "=== Starting LOCAL build at $($startTime.ToString('yyyy-MM-dd HH:mm:ss')) ==="

# Check if we're in the right directory
Write-Log "Checking project directory..."
if (-not (Test-Path "limebird-site-new/package.json")) {
    Write-ErrorLog "Not in project directory - package.json not found"
    Write-Host "Run this script from the project root directory" -ForegroundColor Red
    exit 1
}
Write-SuccessLog "Project directory confirmed"

# Check for uncommitted changes
Write-Log "Checking for uncommitted changes..."
$status = git status --porcelain
if ($status) {
    Write-Log "Found uncommitted changes:"
    Write-Host $status -ForegroundColor Yellow
    Write-Host "Consider committing changes before building" -ForegroundColor Yellow
} else {
    Write-Log "No uncommitted changes found"
}



# Clean up any existing processes before build
Write-Log "Cleaning up existing processes..."
Write-Host "DEBUG: About to run cleanup-dev.ps1 (SKIPPED)" -ForegroundColor Magenta
# .\cleanup-dev.ps1 -Force
Write-Host "DEBUG: Skipped cleanup-dev.ps1" -ForegroundColor Magenta
Write-Log "Cleanup step skipped, starting build..."

# Build the project with timing and error handling
Write-Log "Starting local build process..."

# Start build timing
$buildStartTime = Get-Date

try {
    # Change to project directory
    Set-Location "limebird-site-new"
    
    # Pre-flight checks for local environment
    Write-Log "Running pre-flight checks for local environment..."
    
    # Check if npm is available
    Write-Log "Checking npm availability..."
    try {
        $npmVersion = npm --version 2>$null
        if ($LASTEXITCODE -eq 0) {
            Write-SuccessLog "npm is available (version: $npmVersion)"
        } else {
            Write-ErrorLog "npm is not available or not working"
            Write-Host "npm is not available! Install Node.js and npm first." -ForegroundColor Red
            Set-Location ".."
            exit 1
        }
    } catch {
        Write-ErrorLog "npm is not available or not working"
        Write-Host "npm is not available! Install Node.js and npm first." -ForegroundColor Red
        Set-Location ".."
        exit 1
    }
    
    # Check if dependencies are installed
    Write-Log "Checking if dependencies are installed..."
    if (-not (Test-Path "node_modules")) {
        Write-ErrorLog "node_modules not found - dependencies not installed"
        Write-Host "Dependencies not installed! Run 'npm install' first." -ForegroundColor Red
        Set-Location ".."
        exit 1
    }
    Write-SuccessLog "Dependencies are installed"
    
    # Check if package.json has required scripts
    Write-Log "Checking package.json scripts..."
    $packageJson = Get-Content "package.json" | ConvertFrom-Json
    $requiredScripts = @("lint", "test", "build")
    foreach ($script in $requiredScripts) {
        if (-not $packageJson.scripts.PSObject.Properties.Name.Contains($script)) {
            Write-ErrorLog "Required script '$script' not found in package.json"
            Write-Host "Required script '$script' missing from package.json!" -ForegroundColor Red
            Set-Location ".."
            exit 1
        }
    }
    Write-SuccessLog "All required scripts found in package.json"
    
    # Check if port 3000 is available (local environment specific)
    Write-Log "Checking if port 3000 is available..."
    $portCheck = Get-NetTCPConnection -LocalPort 3000 -ErrorAction SilentlyContinue
    if ($portCheck) {
        Write-Log "Port 3000 is in use - this may cause conflicts"
        Write-Host "Warning: Port 3000 is in use. Consider stopping other servers." -ForegroundColor Yellow
    } else {
        Write-SuccessLog "Port 3000 is available"
    }
    
    # Set environment variable for local build
    $env:NEXT_PUBLIC_APP_URL = "http://localhost:3000"
    
    # Run linting first
    Write-Log "Running linting check..."
    try {
        npm run lint
        if ($LASTEXITCODE -ne 0) {
            Write-ErrorLog "Linting failed with exit code: $LASTEXITCODE"
            Write-Host "Linting failed! Fix linting errors before building." -ForegroundColor Red
            Set-Location ".."
            exit 1
        }
        Write-SuccessLog "Linting passed"
    } catch {
        Write-ErrorLog "Linting process failed with exception: $($_.Exception.Message)"
        Write-Host "Linting process failed! Fix errors before building." -ForegroundColor Red
        Set-Location ".."
        exit 1
    }
    
    # Run unit tests
    Write-Log "Running unit tests..."
    try {
        npm run test
        if ($LASTEXITCODE -ne 0) {
            Write-ErrorLog "Unit tests failed with exit code: $LASTEXITCODE"
            Write-Host "Unit tests failed! Fix test errors before building." -ForegroundColor Red
            Set-Location ".."
            exit 1
        }
        Write-SuccessLog "Unit tests passed"
    } catch {
        Write-ErrorLog "Unit tests process failed with exception: $($_.Exception.Message)"
        Write-Host "Unit tests process failed! Fix errors before building." -ForegroundColor Red
        Set-Location ".."
        exit 1
    }
    
    # Run build with timeout protection
    try {
        npm run build
        $buildEndTime = Get-Date
        $buildDuration = $buildEndTime - $buildStartTime
        
        if ($LASTEXITCODE -eq 0) {
            Write-SuccessLog "Local build completed successfully in $($buildDuration.TotalSeconds.ToString('F1')) seconds"
            Write-Host "Local build completed in $($buildDuration.TotalSeconds.ToString('F1')) seconds" -ForegroundColor Green
            Write-Host "Build is ready for local testing" -ForegroundColor Green
        } else {
            Write-ErrorLog "Local build failed with exit code: $LASTEXITCODE"
            Write-Host "Local build failed! Fix errors before proceeding." -ForegroundColor Red
            Write-Host "Check the build output above for errors." -ForegroundColor Red
            Set-Location ".."
            exit 1
        }
    } catch {
        Write-ErrorLog "Build process failed with exception: $($_.Exception.Message)"
        Write-Host "Build process failed! Fix errors before proceeding." -ForegroundColor Red
        Set-Location ".."
        exit 1
    }
} catch {
    Write-ErrorLog "Build process exception: $($_.Exception.Message)"
    Write-Host "Build process failed with exception: $($_.Exception.Message)" -ForegroundColor Red
    Set-Location ".."
    exit 1
}

# Return to root directory
Set-Location ".."



# Final success message with timing
$endTime = Get-Date
$buildDuration = $endTime - $buildStartTime
$totalDuration = $endTime - $startTime
Write-SuccessLog "LOCAL build completed successfully in $($buildDuration.TotalSeconds.ToString('F1')) seconds"
Write-Host "LOCAL build completed in $($buildDuration.TotalSeconds.ToString('F1')) seconds!" -ForegroundColor Green
Write-Host "Local site: http://localhost:3000" -ForegroundColor Cyan
Write-Host "Use dev-server.ps1 to start the development server" -ForegroundColor Yellow

# Close PowerShell after build
Write-Log "Closing PowerShell..."
Write-Host "Closing PowerShell..." -ForegroundColor Yellow
Start-Sleep -Seconds 2
exit 0 