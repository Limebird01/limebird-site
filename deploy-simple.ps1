# Simple deployment script
Write-Host "Starting deployment..." -ForegroundColor Cyan

# Check Git status
$status = git status --porcelain
if ($status) {
    Write-Host "Found changes to commit" -ForegroundColor Yellow
    Write-Host $status
    
    # Add and commit
    git add .
    git commit -m "Update website content ($(Get-Date -Format 'yyyy-MM-dd HH:mm'))"
    
    # Push
    git push origin main
    
    Write-Host "Deployment completed!" -ForegroundColor Green
} else {
    Write-Host "No changes to deploy" -ForegroundColor Yellow
} 