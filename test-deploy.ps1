# Simple test deployment script

Write-Host "Testing deployment script..." -ForegroundColor Green

# Check Git status
$status = git status --porcelain
if ($status) {
    Write-Host "Found changes to commit" -ForegroundColor Yellow
    Write-Host $status
} else {
    Write-Host "No changes to commit" -ForegroundColor Green
}

Write-Host "Test completed" -ForegroundColor Green 