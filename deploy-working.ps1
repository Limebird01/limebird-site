# Limebird.org - Working Deployment Script
# Usage: .\deploy-working.ps1 [commit-message]

param(
    [Parameter(Mandatory=$false)]
    [string]$CommitMessage = ""
)

# Configuration
$PROJECT_NAME = "limebird.org"
$LOG_DIR = "logs"

# Colors
$Green = "Green"
$Yellow = "Yellow"
$Red = "Red"
$Cyan = "Cyan"

function Write-Log {
    param([string]$Message, [string]$Level = "INFO")
    
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logEntry = "[$timestamp] [$Level] $Message"
    
    # Write to console with color
    $color = switch ($Level) {
        "ERROR" { $Red }
        "WARNING" { $Yellow }
        "SUCCESS" { $Green }
        default { $Cyan }
    }
    
    Write-Host "[$timestamp] $Message" -ForegroundColor $color
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

# Main deployment process
Write-Host ""
Write-Host "🚀 Starting deployment for $PROJECT_NAME" -ForegroundColor $Cyan
Write-Host ""

# Check Git status
$hasChanges = Test-GitStatus

if ($hasChanges) {
    # Use provided commit message or generate one
    if ([string]::IsNullOrWhiteSpace($CommitMessage)) {
        $CommitMessage = "Update website content ($(Get-Date -Format 'yyyy-MM-dd HH:mm'))"
    }
    
    # Commit and push
    Invoke-GitCommit -Message $CommitMessage
    Invoke-GitPush
    
    Write-Host ""
    Write-Host "✅ Deployment completed successfully!" -ForegroundColor $Green
    Write-Host "📧 Contact: dan@limebird.org" -ForegroundColor $Cyan
    Write-Host ""
} else {
    Write-Log "No changes to deploy" "WARNING"
} 