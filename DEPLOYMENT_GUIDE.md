# Limebird.org - Deployment Guide

## Overview

This guide explains how to deploy changes to the limebird.org website using the automated deployment scripts.

## Quick Start

### Option 1: Using Batch File (Recommended)
```cmd
deploy.bat "Your commit message here"
```

### Option 2: Using PowerShell Directly
```powershell
.\deploy.ps1 "Your commit message here"
```

### Option 3: Default Commit Message
```cmd
deploy.bat
```

## What the Deployment Script Does

1. **Checks Prerequisites**
   - Verifies Git is installed
   - Confirms you're in the correct directory
   - Checks for required files (index.html, README.md, constants.js)

2. **Git Operations**
   - Checks for uncommitted changes
   - Verifies Git remote is correct
   - Commits changes with your message
   - Pushes to GitHub main branch

3. **Netlify Deployment**
   - Triggers automatic deployment on Netlify
   - Provides deployment URLs
   - Shows deployment status information

4. **Logging & Cleanup**
   - Logs all activities to `logs\deployment_[timestamp].log`
   - Automatically cleans up old logs (keeps max 10 logs)
   - Provides detailed deployment summaries

## Deployment URLs

After deployment, your changes will be available at:
- **Development:** https://limebirdorg.netlify.app
- **Production:** https://limebird.org
- **GitHub:** https://github.com/limebird01/limebird-site

## Examples

### Update Contact Information
```cmd
deploy.bat "Update contact email and phone number"
```

### Fix Typo
```cmd
deploy.bat "Fix typo in hero section"
```

### Add New Feature
```cmd
deploy.bat "Add dark mode toggle feature"
```

### Content Update
```cmd
deploy.bat "Update about section with new company information"
```

## Logging

### Log Files
The deployment script automatically creates detailed logs for each deployment:

- **Location:** `logs\deployment_[timestamp].log`
- **Format:** Timestamped entries with log levels (INFO, SUCCESS, WARNING, ERROR)
- **Retention:** Automatically keeps the 10 most recent logs
- **Cleanup:** Old logs are automatically deleted to save space

### Log Levels
- **INFO:** General information and progress updates
- **SUCCESS:** Successful operations (green in console)
- **WARNING:** Non-critical issues (yellow in console)
- **ERROR:** Critical failures (red in console)

### Viewing Logs
```cmd
# View the most recent log
type logs\deployment_*.log | Select-Object -Last 1

# View all logs
dir logs\deployment_*.log

# View specific log file
type logs\deployment_2024-01-15_14-30-25.log
```

## Troubleshooting

### Common Issues

**Error: "Not in a Git repository"**
- Solution: Run the script from the project root directory
- Ensure you're in `C:\Users\limeb\Projects\Limebird_org`

**Error: "Git remote doesn't match"**
- Solution: Check that your Git remote points to the correct repository
- Run: `git remote -v` to verify

**Error: "Failed to push to GitHub"**
- Solution: Check your internet connection
- Verify you have push permissions to the repository
- Check GitHub authentication

**No changes to deploy**
- This is normal if no files have been modified
- Make changes to your files first, then run the deployment script

**Log file issues**
- Check that the `logs` directory exists
- Ensure you have write permissions in the project directory
- Verify PowerShell execution policy allows script execution

### Manual Deployment Steps

If the script fails, you can deploy manually:

1. **Commit changes:**
   ```cmd
   git add .
   git commit -m "Your commit message"
   ```

2. **Push to GitHub:**
   ```cmd
   git push origin main
   ```

3. **Check Netlify:**
   - Visit https://app.netlify.com
   - Check deployment status
   - Verify changes are live

## Deployment Timeline

- **Git operations:** 10-30 seconds
- **Netlify build:** 1-3 minutes
- **DNS propagation:** 5-30 minutes (if DNS changes)

## Best Practices

### Commit Messages
- Use descriptive, present-tense messages
- Keep messages under 50 characters
- Examples:
  - ✅ "Update contact information"
  - ✅ "Fix typo in hero section"
  - ❌ "Updated stuff"

### Before Deploying
- Test changes locally first
- Review your changes with `git status`
- Ensure all files are saved

### After Deploying
- Check the live site at https://limebird.org
- Verify changes appear correctly
- Test on different devices/browsers

## Script Configuration

The deployment script uses these constants (in `deploy.ps1`):
```powershell
$PROJECT_NAME = "limebird.org"
$GITHUB_REPO = "limebird01/limebird-site"
$GIT_BRANCH = "main"
$NETLIFY_SITE = "limebirdorg.netlify.app"
```

## Support

If you encounter issues:
- Check the error messages in the script output
- Verify your Git configuration
- Contact: dan@limebird.org

---

**Last Updated:** [Current Date]  
**Script Version:** 1.0 