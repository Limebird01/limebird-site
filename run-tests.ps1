# Limebird.org - Run All Tests Script
# This script runs linting, unit tests, and E2E tests from the project root.

Write-Host "Running linting..." -ForegroundColor Cyan
npm run lint
if ($LASTEXITCODE -ne 0) {
    Write-Host "Linting failed!" -ForegroundColor Red
    exit 1
}

Write-Host "Running unit tests..." -ForegroundColor Cyan
npm run test
if ($LASTEXITCODE -ne 0) {
    Write-Host "Unit tests failed!" -ForegroundColor Red
    exit 1
}

Write-Host "Running E2E tests..." -ForegroundColor Cyan
npm run e2e
if ($LASTEXITCODE -ne 0) {
    Write-Host "E2E tests failed!" -ForegroundColor Red
    exit 1
}

Write-Host "All tests passed!" -ForegroundColor Green
exit 0 