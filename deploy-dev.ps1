# Dev branch deployment script with logging
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$logFile = "deployment-dev.log"

# Create log entry function
function Write-Log {
    param([string]$Message)
    $logEntry = "[$timestamp] $Message"
    Add-Content -Path $logFile -Value $logEntry
    Write-Host $Message -ForegroundColor Cyan
}

# Start dev deployment
Write-Log "Starting dev branch deployment..."

# Check Git status
$status = git status --porcelain
if ($status) {
    Write-Log "Found changes to commit"
    Write-Host $status -ForegroundColor Yellow
    
    # Add and commit
    Write-Log "Adding files to Git"
    git add .
    Start-Sleep -Seconds 1
    
    $commitMessage = "Dev branch update ($(Get-Date -Format 'yyyy-MM-dd HH:mm'))"
    Write-Log "Committing with message: $commitMessage"
    git commit -m $commitMessage
    Start-Sleep -Seconds 1
    
    # Push to dev branch
    Write-Log "Pushing to GitHub dev branch"
    git push origin dev
    
    # Check if push was successful
    if ($LASTEXITCODE -eq 0) {
        Write-Log "Dev deployment completed successfully!"
        Write-Host "Dev deployment completed!" -ForegroundColor Green
        Write-Host "🌐 Dev site: https://dev--limebirdorg.netlify.app/" -ForegroundColor Cyan
        Write-Host "📋 Next step: Publish dev branch in Netlify for dev.limebird.org" -ForegroundColor Yellow
        Write-Host "   - Go to: https://app.netlify.com" -ForegroundColor Yellow
        Write-Host "   - Find dev branch deploy and click 'Publish deploy'" -ForegroundColor Yellow
    } else {
        Write-Log "Dev deployment failed - push unsuccessful"
        Write-Host "Dev deployment failed!" -ForegroundColor Red
    }
    
    # Close PowerShell after deployment
    Write-Host "Closing PowerShell..." -ForegroundColor Yellow
    Start-Sleep -Seconds 2
    exit
} else {
    Write-Log "No changes to deploy to dev branch"
    Write-Host "No changes to deploy to dev branch" -ForegroundColor Yellow
} 