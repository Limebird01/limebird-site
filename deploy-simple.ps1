# Simple deployment script with logging
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$logFile = "deployment.log"

# Create log entry function
function Write-Log {
    param([string]$Message)
    $logEntry = "[$timestamp] $Message"
    Add-Content -Path $logFile -Value $logEntry
    Write-Host $Message -ForegroundColor Cyan
}

# Start deployment
Write-Log "Starting deployment..."

# Check Git status
$status = git status --porcelain
if ($status) {
    Write-Log "Found changes to commit"
    Write-Host $status -ForegroundColor Yellow
    
    # Add and commit
    Write-Log "Adding files to Git"
    git add .
    
    $commitMessage = "Update website content ($(Get-Date -Format 'yyyy-MM-dd HH:mm'))"
    Write-Log "Committing with message: $commitMessage"
    git commit -m $commitMessage
    
    # Push
    Write-Log "Pushing to GitHub"
    git push origin main
    
    Write-Log "Deployment completed successfully!"
    Write-Host "Deployment completed!" -ForegroundColor Green
} else {
    Write-Log "No changes to deploy"
    Write-Host "No changes to deploy" -ForegroundColor Yellow
} 