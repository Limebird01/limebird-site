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
Write-Log "=== Starting PRODUCTION deployment at $($startTime.ToString('yyyy-MM-dd HH:mm:ss')) ==="

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
if ($currentBranch -ne "main") {
    Write-ErrorLog "Wrong branch detected: $currentBranch (expected: main)"
    Write-Host "Switch to main branch first: git checkout main" -ForegroundColor Yellow
    Write-Host "Current branch: $currentBranch" -ForegroundColor Yellow
    exit 1
}
Write-SuccessLog "Confirmed: On main branch"

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
.\cleanup-dev.ps1 -Force
Write-Log "Cleanup completed, starting build..."

# Build the project with timing and better error handling
Write-Log "Starting build process..."
$buildStartTime = Get-Date



try {
    # Change to project directory
    Set-Location "limebird-site-new"
    
    # Pre-flight checks for production deployment
    Write-Log "Running pre-flight checks for production deployment..."
    
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
    
    # Check if we're on main branch (production deployment specific)
    Write-Log "Checking if we're on main branch..."
    $currentBranch = git branch --show-current
    if ($currentBranch -ne "main") {
        Write-ErrorLog "Not on main branch - current branch: $currentBranch"
        Write-Host "ERROR: Not on main branch! Production deployments must be from main branch." -ForegroundColor Red
        Write-Host "Current branch: $currentBranch" -ForegroundColor Red
        Write-Host "Switch to main branch before production deployment." -ForegroundColor Red
        Set-Location ".."
        exit 1
    }
    Write-SuccessLog "On main branch"
    
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
    $env:NEXT_PUBLIC_APP_URL = "https://limebird.org"
    
    # Run linting first
    Write-Log "Running linting check..."
    try {
        npm run lint
        if ($LASTEXITCODE -ne 0) {
            Write-ErrorLog "Linting failed with exit code: $LASTEXITCODE"
            Write-Host "Linting failed! Fix linting errors before deploying." -ForegroundColor Red
            Set-Location ".."
            exit 1
        }
        Write-SuccessLog "Linting passed"
    } catch {
        Write-ErrorLog "Linting process failed with exception: $($_.Exception.Message)"
        Write-Host "Linting process failed! Fix errors before deploying." -ForegroundColor Red
        Set-Location ".."
        exit 1
    }
    
    # Run unit tests
    Write-Log "Running unit tests..."
    try {
        npm run test
        if ($LASTEXITCODE -ne 0) {
            Write-ErrorLog "Unit tests failed with exit code: $LASTEXITCODE"
            Write-Host "Unit tests failed! Fix test errors before deploying." -ForegroundColor Red
            Set-Location ".."
            exit 1
        }
        Write-SuccessLog "Unit tests passed"
    } catch {
        Write-ErrorLog "Unit tests process failed with exception: $($_.Exception.Message)"
        Write-Host "Unit tests process failed! Fix errors before deploying." -ForegroundColor Red
        Set-Location ".."
        exit 1
    }
    
    # Run build with timeout protection
    try {
        npm run build
        $buildEndTime = Get-Date
        $buildDuration = $buildEndTime - $buildStartTime
        
        if ($LASTEXITCODE -eq 0) {
            Write-SuccessLog "Build completed successfully in $($buildDuration.TotalSeconds.ToString('F1')) seconds"
            Write-Host "Build completed in $($buildDuration.TotalSeconds.ToString('F1')) seconds" -ForegroundColor Green
        } else {
            Write-ErrorLog "Build failed with exit code: $LASTEXITCODE"
            Write-Host "Build failed! Fix errors before deploying." -ForegroundColor Red
            Write-Host "Check the build output above for errors." -ForegroundColor Red
            Set-Location ".."
            exit 1
        }
    } catch {
        Write-ErrorLog "Build process failed with exception: $($_.Exception.Message)"
        Write-Host "Build process failed! Fix errors before deploying." -ForegroundColor Red
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
Write-Log "Pushing to GitHub main branch..."
$pushStart = Get-Date
$pushAttempts = 0
$maxPushAttempts = 3

do {
    $pushAttempts++
    Write-Log "Push attempt $pushAttempts of $maxPushAttempts"
    
    git push origin main
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
Write-SuccessLog "PRODUCTION deployment completed successfully in $($totalDuration.TotalSeconds.ToString('F1')) seconds"
Write-Host "PRODUCTION deployment completed in $($totalDuration.TotalSeconds.ToString('F1')) seconds!" -ForegroundColor Green
Write-Host "Production site: https://limebird.org/" -ForegroundColor Cyan
Write-Host "Note: Manual publish required in Netlify for limebird.org" -ForegroundColor Yellow

# Close PowerShell after deployment
Write-Log "Closing PowerShell..."
Write-Host "Closing PowerShell..." -ForegroundColor Yellow
Start-Sleep -Seconds 2
exit 0 