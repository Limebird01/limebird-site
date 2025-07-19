# Limebird.org - Simple Deployment Script
# Usage: .\deploy.ps1 [commit-message]

param(
    [Parameter(Mandatory=$false)]
    [string]$CommitMessage = ""
)

# Configuration
$PROJECT_NAME = "limebird.org"
$LOG_DIR = "logs"
$LOG_FILE = ""

# Colors
$Green = "Green"
$Yellow = "Yellow"
$Red = "Red"
$Cyan = "Cyan"

function Write-Log {
    param([string]$Message, [string]$Level = "INFO")
    
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logEntry = "[$timestamp] [$Level] $Message"
    
    # Write to log file
    if ($LOG_FILE) {
        Add-Content -Path $LOG_FILE -Value $logEntry
    }
    
    # Write to console with color
    $color = switch ($Level) {
        "ERROR" { $Red }
        "WARNING" { $Yellow }
        "SUCCESS" { $Green }
        default { $Cyan }
    }
    
    Write-Host "[$timestamp] $Message" -ForegroundColor $color
}

function Initialize-Logging {
    # Create logs directory if it doesn't exist
    if (-not (Test-Path $LOG_DIR)) {
        New-Item -ItemType Directory -Path $LOG_DIR | Out-Null
    }
    
    # Generate log filename with timestamp
    $timestamp = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
    $script:LOG_FILE = "$LOG_DIR\deployment_$timestamp.log"
    
    $deploymentStart = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logHeader = @"
===========================================
Limebird.org Deployment Log
===========================================
Deployment Started: $deploymentStart
Commit Message: $CommitMessage
===========================================

"@
    
    Add-Content -Path $LOG_FILE -Value $logHeader
    Write-Log "Logging to: $LOG_FILE" "INFO"
}

function Generate-CommitMessage {
    Write-Log "Generating commit message..." "INFO"
    
    $changedFiles = git status --porcelain
    $message = "Update project files"
    
    if ($changedFiles -match "M.*\.html") {
        $message = "Update website content"
    } elseif ($changedFiles -match "M.*\.css") {
        $message = "Update styling"
    } elseif ($changedFiles -match "M.*\.js") {
        $message = "Update JavaScript"
    } elseif ($changedFiles -match "M.*\.md") {
        $message = "Update documentation"
    }
    
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm"
    $message = "$message ($timestamp)"
    
    Write-Log "Generated commit message: $message" "SUCCESS"
    return $message
}

function Test-GitStatus {
    Write-Log "Checking Git status..." "INFO"
    
    if (-not (Test-Path ".git")) {
        Write-Log "Error: Not in a Git repository!" "ERROR"
        exit 1
    }
    
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

function Invoke-GitCommit {
    param([string]$Message)
    
    Write-Log "Committing changes..." "INFO"
    
    git add .
    if ($LASTEXITCODE -ne 0) {
        Write-Log "Error: Failed to add files to Git" "ERROR"
        exit 1
    }
    
    git commit -m $Message
    if ($LASTEXITCODE -ne 0) {
        Write-Log "Error: Failed to commit changes" "ERROR"
        exit 1
    }
    
    Write-Log "Changes committed successfully" "SUCCESS"
}

function Invoke-GitPush {
    Write-Log "Pushing to GitHub..." "INFO"
    
    git push origin main
    if ($LASTEXITCODE -ne 0) {
        Write-Log "Error: Failed to push to GitHub" "ERROR"
        exit 1
    }
    
    Write-Log "Successfully pushed to GitHub" "SUCCESS"
}

function Show-DeploymentInfo {
    Write-Host ""
    Write-Host "=" * 50 -ForegroundColor $Cyan
    Write-Host "DEPLOYMENT SUMMARY" -ForegroundColor $Cyan
    Write-Host "=" * 50 -ForegroundColor $Cyan
    Write-Host "Project: $PROJECT_NAME" -ForegroundColor $Green
    Write-Host "Production URL: https://limebird.org" -ForegroundColor $Green
    Write-Host "Log File: $LOG_FILE" -ForegroundColor $Green
    Write-Host "=" * 50 -ForegroundColor $Cyan
    Write-Host ""
}

# Main deployment process
Write-Host ""
Write-Host "🚀 Starting deployment for $PROJECT_NAME" -ForegroundColor $Cyan
Write-Host ""

# Initialize logging
Initialize-Logging

# Check Git status
$hasChanges = Test-GitStatus

if ($hasChanges) {
    # Generate or use commit message
    if ([string]::IsNullOrWhiteSpace($CommitMessage)) {
        $CommitMessage = Generate-CommitMessage
    }
    
    # Commit and push
    Invoke-GitCommit -Message $CommitMessage
    Invoke-GitPush
    
    # Show deployment info
    Show-DeploymentInfo
    
    Write-Host ""
    Write-Host "✅ Deployment completed successfully!" -ForegroundColor $Green
    Write-Host "📧 Contact: dan@limebird.org" -ForegroundColor $Cyan
    Write-Host ""
} else {
    Write-Log "No changes to deploy" "WARNING"
    Show-DeploymentInfo
} 