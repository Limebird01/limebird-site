# Simple deployment script with logging
$logFile = "deployment.log"

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

# Start deployment with timestamp
$startTime = Get-Date
Write-Log "=== Starting DEV deployment at $($startTime.ToString('yyyy-MM-dd HH:mm:ss')) ==="

# Check if we're in the right directory
Write-Log "Checking project directory..."
if (-not (Test-Path "limebird-site-new/package.json")) {
    Write-ErrorLog "Not in project directory - package.json not found"
    Write-Host "Run this script from the project root directory" -ForegroundColor Red
    exit 1
}
Write-SuccessLog "Project directory confirmed"

# Check current branch
Write-Log "Checking current Git branch..."
$currentBranch = git branch --show-current
if ($currentBranch -ne "dev") {
    Write-ErrorLog "Wrong branch detected: $currentBranch (expected: dev)"
    Write-Host "Switch to dev branch first: git checkout dev" -ForegroundColor Yellow
    Write-Host "Current branch: $currentBranch" -ForegroundColor Yellow
    exit 1
}
Write-SuccessLog "Confirmed: On dev branch"

# Check for uncommitted changes before build
Write-Log "Checking for uncommitted changes..."
$status = git status --porcelain
if (-not $status) {
    Write-Log "No changes to deploy - exiting"
    Write-Host "No changes to deploy" -ForegroundColor Yellow
    exit 0
}

Write-Log "Found changes to commit:"
Write-Host $status -ForegroundColor Yellow



# Clean up any existing processes before build
Write-Log "Cleaning up existing processes..."
Write-Host "DEBUG: About to run cleanup-dev.ps1 (SKIPPED)" -ForegroundColor Magenta
# .\cleanup-dev.ps1 -Force
Write-Host "DEBUG: Skipped cleanup-dev.ps1" -ForegroundColor Magenta
Write-Log "Cleanup step skipped, continuing deployment..."

# Build the project with timing and better error handling
Write-Log "Starting build process..."
$buildStartTime = Get-Date



try {
    # Change to project directory
    Set-Location "limebird-site-new"
    
    # Pre-flight checks for dev deployment
    Write-Log "Running pre-flight checks for dev deployment..."
    
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
    
    # Check if git remote is configured
    Write-Log "Checking git remote configuration..."
    $remoteCheck = git remote -v
    if (-not $remoteCheck) {
        Write-ErrorLog "No git remote configured"
        Write-Host "No git remote configured! Set up remote repository first." -ForegroundColor Red
        Set-Location ".."
        exit 1
    }
    Write-SuccessLog "Git remote is configured"
    
    # Set environment variable for build
    $env:NEXT_PUBLIC_APP_URL = "https://dev.limebird.org"
    
    # Run linting first
    Write-Log "Running linting check..."
    "==== LINT OUTPUT START ====" | Add-Content -Path $logFile
    npm run lint 2>&1 | Tee-Object -FilePath $logFile -Append
    "==== LINT OUTPUT END ====" | Add-Content -Path $logFile
    if ($LASTEXITCODE -ne 0) {
        Write-ErrorLog "Linting failed with exit code: $LASTEXITCODE"
        Write-Host "Linting failed! Fix linting errors before deploying." -ForegroundColor Red
        Set-Location ".."
        exit 1
    }
    Write-SuccessLog "Linting passed"
    # Run unit tests
    Write-Log "Running unit tests..."
    "==== UNIT TEST OUTPUT START ====" | Add-Content -Path $logFile
    npm run test 2>&1 | Tee-Object -FilePath $logFile -Append
    "==== UNIT TEST OUTPUT END ====" | Add-Content -Path $logFile
    if ($LASTEXITCODE -ne 0) {
        Write-ErrorLog "Unit tests failed with exit code: $LASTEXITCODE"
        Write-Host "Unit tests failed! Fix test errors before deploying." -ForegroundColor Red
        Set-Location ".."
        exit 1
    }
    Write-SuccessLog "Unit tests passed"
    # Run build with timeout protection
    Write-Log "Running build..."
    "==== BUILD OUTPUT START ====" | Add-Content -Path $logFile
    npm run build 2>&1 | Tee-Object -FilePath $logFile -Append
    "==== BUILD OUTPUT END ====" | Add-Content -Path $logFile
    if ($LASTEXITCODE -eq 0) {
        $buildEndTime = Get-Date
        $buildDuration = $buildEndTime - $buildStartTime
        Write-SuccessLog "Build completed successfully in $($buildDuration.TotalSeconds.ToString('F1')) seconds"
        Write-Host "Build completed in $($buildDuration.TotalSeconds.ToString('F1')) seconds" -ForegroundColor Green
        Write-Host "See full output in $logFile" -ForegroundColor Yellow
    } else {
        Write-ErrorLog "Build failed with exit code: $LASTEXITCODE"
        Write-Host "Build failed! Fix errors before deploying." -ForegroundColor Red
        Write-Host "Check the build output above and in $logFile for errors." -ForegroundColor Red
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

# Add and commit with timing
Write-Log "Adding files to Git..."
$gitAddStart = Get-Date
git add .
if ($LASTEXITCODE -ne 0) {
    Write-ErrorLog "Git add failed"
    Write-Host "Git add failed!" -ForegroundColor Red
    exit 1
}
$gitAddEnd = Get-Date
Write-SuccessLog "Files added to Git in $($($gitAddEnd - $gitAddStart).TotalSeconds.ToString('F1')) seconds"

# Commit with timestamp
$commitMessage = "Update website content ($(Get-Date -Format 'yyyy-MM-dd HH:mm'))"
Write-Log "Committing with message: $commitMessage"
$commitStart = Get-Date
git commit -m $commitMessage
if ($LASTEXITCODE -ne 0) {
    Write-ErrorLog "Git commit failed"
    Write-Host "Git commit failed!" -ForegroundColor Red
    exit 1
}
$commitEnd = Get-Date
Write-SuccessLog "Commit completed in $($($commitEnd - $commitStart).TotalSeconds.ToString('F1')) seconds"

# Push with timing and retry logic
Write-Log "Pushing to GitHub dev branch..."
$pushStart = Get-Date
$pushAttempts = 0
$maxPushAttempts = 3

do {
    $pushAttempts++
    Write-Log "Push attempt $pushAttempts of $maxPushAttempts"
    
    git push origin dev
    $pushExitCode = $LASTEXITCODE
    
    if ($pushExitCode -eq 0) {
        $pushEnd = Get-Date
        $pushDuration = $pushEnd - $pushStart
        Write-SuccessLog "Push completed successfully in $($pushDuration.TotalSeconds.ToString('F1')) seconds"
        break
    } else {
        Write-ErrorLog "Push attempt $pushAttempts failed with exit code: $pushExitCode"
        
        if ($pushAttempts -lt $maxPushAttempts) {
            Write-Log "Retrying push in 3 seconds..."
            Start-Sleep -Seconds 3
        } else {
            Write-ErrorLog "All push attempts failed - deployment cancelled"
            Write-Host "All push attempts failed! Check your internet connection and try again." -ForegroundColor Red
            exit 1
        }
    }
} while ($pushAttempts -lt $maxPushAttempts)



# Final success message with timing
$endTime = Get-Date
$totalDuration = $endTime - $startTime
Write-SuccessLog "DEV deployment completed successfully in $($totalDuration.TotalSeconds.ToString('F1')) seconds"
Write-Host "DEV deployment completed in $($totalDuration.TotalSeconds.ToString('F1')) seconds!" -ForegroundColor Green
Write-Host "Dev site: https://dev--limebirdorg.netlify.app/" -ForegroundColor Cyan
Write-Host "Note: Manual publish required in Netlify for dev.limebird.org" -ForegroundColor Yellow

# Close PowerShell after deployment
Write-Log "Closing PowerShell..."
Write-Host "Closing PowerShell..." -ForegroundColor Yellow
Start-Sleep -Seconds 2
exit 0 