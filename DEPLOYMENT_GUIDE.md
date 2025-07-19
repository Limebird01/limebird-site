# Limebird.org - Deployment Guide

## Overview

This guide explains how to deploy changes to the limebird.org website using the manual deployment script. The deployment process is intentionally manual to provide full control over when and what gets deployed.

## Quick Start

### Option 1: Using PowerShell Script (Recommended)
```powershell
.\deploy-simple.ps1
```

### Option 2: Manual Git Commands
```powershell
git add .
git commit -m "Your commit message here"
git push origin main
```

## What the Deployment Script Does

1. **Git Operations**
   - Checks for uncommitted changes
   - Generates auto-commit message with timestamp
   - Commits changes with message
   - Pushes to GitHub main branch

2. **Netlify Deployment**
   - Automatically triggers deployment on Netlify
   - Changes appear at https://limebird.org within 1-3 minutes

3. **Simple Output**
   - Colored console output for easy reading
   - Shows deployment status and progress

## Manual Deployment Philosophy

This deployment system is designed for **manual control** rather than automation:

- **Intentional Deployments:** You decide when to deploy
- **Review Process:** Check changes before committing
- **Quality Control:** Manual verification of changes
- **Audit Trail:** Complete logging of all deployments
- **No Auto-Triggers:** No automatic deployments from external sources

## Deployment URLs

After deployment, your changes will be available at:
- **Development:** https://limebirdorg.netlify.app
- **Production:** https://limebird.org
- **GitHub:** https://github.com/limebird01/limebird-site

## Examples

### Using the Script (Recommended)
```powershell
.\deploy-simple.ps1
```

### Manual Git Commands
```powershell
git add .
git commit -m "Update contact information"
git push origin main
```

### Custom Commit Message
```powershell
git add .
git commit -m "Fix typo in hero section"
git push origin main
```

## Simple Deployment

The current deployment system is intentionally simple and reliable:

### What It Does
- ✅ **Checks for changes** in your Git repository
- ✅ **Auto-generates commit messages** with timestamps
- ✅ **Commits and pushes** to GitHub
- ✅ **Triggers Netlify deployment** automatically
- ✅ **Shows colored output** for easy reading

### No Complex Logging
- The script provides immediate feedback in the console
- No log files to manage or clean up
- Simple, direct output shows deployment status

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

**Empty commit message**
- Script auto-generates a commit message with timestamp
- For custom messages, use manual Git commands

**Script execution issues**
- Ensure PowerShell execution policy allows script execution
- Run: `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser`

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

### Manual Deployment Workflow
1. **Make Changes:** Edit files in your local environment
2. **Test Locally:** Verify changes work as expected
3. **Review Changes:** Use `git status` and `git diff` to review
4. **Deploy:** Run `.\deploy-simple.ps1` for auto-generated message, or use manual Git commands
5. **Verify Deployment:** Check the live site after deployment

### Commit Messages
- Use descriptive, present-tense messages
- Keep messages under 50 characters
- **Auto-Generation:** Script generates timestamped messages automatically
- **Examples:**
  - ✅ "Update contact information" (manual)
  - ✅ "Fix typo in hero section" (manual)
  - ✅ "Update website content (2024-01-15 14:30)" (auto-generated)
  - ❌ "Updated stuff"

### Before Deploying
- Test changes locally first
- Review your changes with `git status`
- Ensure all files are saved
- **Manual Review:** Always review changes before deploying

### After Deploying
- Check the live site at https://limebird.org
- Verify changes appear correctly
- Test on different devices/browsers

## Script Configuration

The deployment script (`deploy-simple.ps1`) is intentionally simple and focused:
- **Auto-commit messages** with timestamps
- **Git operations** (add, commit, push)
- **Colored console output** for easy reading
- **No complex configuration** needed

## Manual vs Automated Deployment

### This System: Manual Deployment
- ✅ **Full Control:** You decide when to deploy
- ✅ **Quality Assurance:** Review changes before deployment
- ✅ **Audit Trail:** Complete logging of all deployments
- ✅ **No Surprises:** No unexpected deployments
- ✅ **Security:** No automated triggers from external sources

### Not Used: Automated Deployment
- ❌ No automatic deployments from Git pushes
- ❌ No CI/CD pipelines
- ❌ No automated testing triggers
- ❌ No webhook-based deployments

## Support

If you encounter issues:
- Check the error messages in the script output
- Verify your Git configuration
- Contact: dan@limebird.org

---

**Last Updated:** January 2024  
**Script Version:** Simple deployment script (deploy-simple.ps1) 