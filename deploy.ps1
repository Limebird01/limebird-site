# Limebird.org - Deployment Script
# 
# This script automates the deployment process for limebird.org
# Run this script to deploy changes to the live website
#
# Usage: .\deploy.ps1 [commit-message]
# Example: .\deploy.ps1 "Update contact information"

param(
    [Parameter(Mandatory=$false)]
    [string]$CommitMessage = "Update website content"
)

# ============================================================================
# CONFIGURATION
# ============================================================================

$PROJECT_NAME = "limebird.org"
$GITHUB_REPO = "limebird01/limebird-site"
$GIT_BRANCH = "main"
$NETLIFY_SITE = "limebirdorg.netlify.app"

# Logging configuration
$LOG_DIR = "logs"
$MAX_LOGS = 10
$LOG_FILE = ""

# Colors for output
$Green = "Green"
$Yellow = "Yellow"
$Red = "Red"
$Cyan = "Cyan"

# ============================================================================
# LOGGING FUNCTIONS
# ============================================================================

function Initialize-Logging {
    # Create logs directory if it doesn't exist
    if (-not (Test-Path $LOG_DIR)) {
        New-Item -ItemType Directory -Path $LOG_DIR | Out-Null
        Write-Status "Created logs directory: $LOG_DIR" $Green
    }
    
    # Generate log filename with timestamp
    $timestamp = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
    $script:LOG_FILE = "$LOG_DIR\deployment_$timestamp.log"
    
    # Clean up old logs if needed
    Cleanup-OldLogs
    
    # Start logging
    $deploymentStart = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logHeader = @"
===========================================
Limebird.org Deployment Log
===========================================
Deployment Started: $deploymentStart
Commit Message: $CommitMessage
Script Version: 1.0
===========================================

"@
    
    Add-Content -Path $LOG_FILE -Value $logHeader
    Write-Status "Logging to: $LOG_FILE" $Cyan
}

function Write-Log {
    param(
        [string]$Message,
        [string]$Level = "INFO"
    )
    
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logEntry = "[$timestamp] [$Level] $Message"
    
    # Write to log file
    Add-Content -Path $LOG_FILE -Value $logEntry
    
    # Also write to console with color
    $color = switch ($Level) {
        "ERROR" { $Red }
        "WARNING" { $Yellow }
        "SUCCESS" { $Green }
        default { $Cyan }
    }
    
    Write-Status $Message $color
}

function Cleanup-OldLogs {
    $logFiles = Get-ChildItem -Path $LOG_DIR -Filter "deployment_*.log" | Sort-Object LastWriteTime -Descending
    
    if ($logFiles.Count -gt $MAX_LOGS) {
        $filesToDelete = $logFiles | Select-Object -Skip $MAX_LOGS
        
        foreach ($file in $filesToDelete) {
            Remove-Item $file.FullName -Force
            Write-Status "Cleaned up old log: $($file.Name)" $Yellow
        }
        
        Write-Status "Log cleanup completed. Keeping $MAX_LOGS most recent logs." $Green
    }
}

function Write-DeploymentSummary {
    $deploymentEnd = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $duration = (Get-Date) - (Get-Item $LOG_FILE).CreationTime
    
    $summary = @"

===========================================
DEPLOYMENT SUMMARY
===========================================
Deployment End: $deploymentEnd
Duration: $($duration.Minutes)m $($duration.Seconds)s
Status: SUCCESS
Log File: $LOG_FILE
===========================================
"@
    
    Add-Content -Path $LOG_FILE -Value $summary
    Write-Host $summary -ForegroundColor $Green
}

function Write-ErrorSummary {
    param([string]$ErrorMessage)
    
    $deploymentEnd = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $duration = (Get-Date) - (Get-Item $LOG_FILE).CreationTime
    
    $errorSummary = @"

===========================================
DEPLOYMENT FAILED
===========================================
Deployment End: $deploymentEnd
Duration: $($duration.Minutes)m $($duration.Seconds)s
Status: FAILED
Error: $ErrorMessage
Log File: $LOG_FILE
===========================================
"@
    
    Add-Content -Path $LOG_FILE -Value $errorSummary
    Write-Host $errorSummary -ForegroundColor $Red
}

# ============================================================================
# FUNCTIONS
# ============================================================================

function Write-Status {
    param(
        [string]$Message,
        [string]$Color = "White"
    )
    $timestamp = Get-Date -Format "HH:mm:ss"
    Write-Host "[$timestamp] $Message" -ForegroundColor $Color
}

function Test-GitStatus {
    Write-Log "Checking Git status..." "INFO"
    
    # Check if we're in a Git repository
    if (-not (Test-Path ".git")) {
        Write-Log "Error: Not in a Git repository!" "ERROR"
        exit 1
    }
    
    # Check if there are changes to commit
    $status = git status --porcelain
    if ($status) {
        Write-Log "Found uncommitted changes:" "WARNING"
        Write-Log $status "INFO"
        return $true
    } else {
        Write-Log "No changes to commit" "SUCCESS"
        return $false
    }
}

function Test-GitRemote {
    Write-Log "Checking Git remote..." "INFO"
    
    $remote = git remote get-url origin
    if ($remote -like "*$GITHUB_REPO*") {
        Write-Log "Git remote is correct: $remote" "SUCCESS"
        return $true
    } else {
        Write-Log "Warning: Git remote doesn't match expected repository" "WARNING"
        Write-Log "Expected: $GITHUB_REPO" "WARNING"
        Write-Log "Found: $remote" "WARNING"
        return $false
    }
}

function Invoke-GitCommit {
    param([string]$Message)
    
    Write-Log "Committing changes..." "INFO"
    
    # Add all changes
    git add .
    if ($LASTEXITCODE -ne 0) {
        Write-Log "Error: Failed to add files to Git" "ERROR"
        exit 1
    }
    
    # Commit with message
    git commit -m $Message
    if ($LASTEXITCODE -ne 0) {
        Write-Log "Error: Failed to commit changes" "ERROR"
        exit 1
    }
    
    Write-Log "Changes committed successfully" "SUCCESS"
}

function Invoke-GitPush {
    Write-Log "Pushing to GitHub..." "INFO"
    
    git push origin $GIT_BRANCH
    if ($LASTEXITCODE -ne 0) {
        Write-Log "Error: Failed to push to GitHub" "ERROR"
        exit 1
    }
    
    Write-Log "Successfully pushed to GitHub" "SUCCESS"
}

function Test-NetlifyDeployment {
    Write-Log "Checking Netlify deployment..." "INFO"
    
    # Wait a moment for Netlify to start building
    Start-Sleep -Seconds 5
    
    Write-Log "Deployment triggered on Netlify" "SUCCESS"
    Write-Log "Site URL: https://$NETLIFY_SITE" "INFO"
    Write-Log "Production URL: https://limebird.org" "INFO"
    
    # Note: Netlify deployment status checking would require API access
    # For now, we'll just inform the user
    Write-Log "Deployment typically takes 1-3 minutes" "WARNING"
    Write-Log "Check Netlify dashboard for deployment status" "WARNING"
}

function Show-DeploymentInfo {
    Write-Host ""
    Write-Host "=" * 60 -ForegroundColor $Cyan
    Write-Host "DEPLOYMENT SUMMARY" -ForegroundColor $Cyan
    Write-Host "=" * 60 -ForegroundColor $Cyan
    Write-Host "Project: $PROJECT_NAME" -ForegroundColor $Green
    Write-Host "Repository: $GITHUB_REPO" -ForegroundColor $Green
    Write-Host "Branch: $GIT_BRANCH" -ForegroundColor $Green
    Write-Host "Netlify Site: $NETLIFY_SITE" -ForegroundColor $Green
    Write-Host "Production URL: https://limebird.org" -ForegroundColor $Green
    Write-Host "Log File: $LOG_FILE" -ForegroundColor $Green
    Write-Host "=" * 60 -ForegroundColor $Cyan
    Write-Host ""
}

function Test-Prerequisites {
    Write-Log "Checking prerequisites..." "INFO"
    
    # Check if Git is installed
    try {
        $gitVersion = git --version
        Write-Log "Git found: $gitVersion" "SUCCESS"
    } catch {
        Write-Log "Error: Git is not installed!" "ERROR"
        exit 1
    }
    
    # Check if we're in the right directory
    $currentDir = Get-Location
    Write-Log "Current directory: $currentDir" "SUCCESS"
    
    # Check if key files exist
    $requiredFiles = @("index.html", "README.md", "constants.js")
    foreach ($file in $requiredFiles) {
        if (Test-Path $file) {
            Write-Log "✓ Found $file" "SUCCESS"
        } else {
            Write-Log "Warning: $file not found" "WARNING"
        }
    }
}

# ============================================================================
# MAIN DEPLOYMENT PROCESS
# ============================================================================

function Start-Deployment {
    try {
        Write-Host ""
        Write-Host "🚀 Starting deployment for $PROJECT_NAME" -ForegroundColor $Cyan
        Write-Host ""
        
        # Initialize logging
        Initialize-Logging
        
        # Step 1: Check prerequisites
        Test-Prerequisites
        
        # Step 2: Check Git status
        $hasChanges = Test-GitStatus
        
        # Step 3: Check Git remote
        Test-GitRemote
        
        # Step 4: Commit changes if any
        if ($hasChanges) {
            Invoke-GitCommit -Message $CommitMessage
        } else {
            Write-Log "No changes to deploy" "WARNING"
            Show-DeploymentInfo
            Write-DeploymentSummary
            return
        }
        
        # Step 5: Push to GitHub
        Invoke-GitPush
        
        # Step 6: Trigger Netlify deployment
        Test-NetlifyDeployment
        
        # Step 7: Show deployment info
        Show-DeploymentInfo
        
        # Step 8: Write deployment summary
        Write-DeploymentSummary
        
        Write-Host ""
        Write-Host "✅ Deployment completed successfully!" -ForegroundColor $Green
        Write-Host "📧 Contact: dan@limebird.org" -ForegroundColor $Cyan
        Write-Host ""
        
    } catch {
        $errorMessage = $_.Exception.Message
        Write-Log "Deployment failed: $errorMessage" "ERROR"
        Write-ErrorSummary $errorMessage
        Write-Host ""
        Write-Host "❌ Deployment failed!" -ForegroundColor $Red
        Write-Host "📧 Contact: dan@limebird.org" -ForegroundColor $Cyan
        Write-Host ""
        exit 1
    }
}

# ============================================================================
# SCRIPT EXECUTION
# ============================================================================

# Check if help is requested
if ($args[0] -eq "--help" -or $args[0] -eq "-h") {
    Write-Host ""
    Write-Host "Limebird.org - Deployment Script" -ForegroundColor $Cyan
    Write-Host "=================================" -ForegroundColor $Cyan
    Write-Host ""
    Write-Host "Usage: .\deploy.ps1 [commit-message]" -ForegroundColor $Green
    Write-Host ""
    Write-Host "Examples:" -ForegroundColor $Yellow
    Write-Host "  .\deploy.ps1" -ForegroundColor $White
    Write-Host "  .\deploy.ps1 'Update contact information'" -ForegroundColor $White
    Write-Host "  .\deploy.ps1 'Fix typo in hero section'" -ForegroundColor $White
    Write-Host ""
    Write-Host "This script will:" -ForegroundColor $Yellow
    Write-Host "  1. Check Git status and prerequisites" -ForegroundColor $White
    Write-Host "  2. Commit changes with your message" -ForegroundColor $White
    Write-Host "  3. Push to GitHub" -ForegroundColor $White
    Write-Host "  4. Trigger Netlify deployment" -ForegroundColor $White
    Write-Host "  5. Log all activities to logs\deployment_[timestamp].log" -ForegroundColor $White
    Write-Host "  6. Clean up old logs (keeps max $MAX_LOGS logs)" -ForegroundColor $White
    Write-Host ""
    exit 0
}

# Start the deployment process
Start-Deployment 