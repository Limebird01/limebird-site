# Limebird.org - Deployment Guide

## Overview

This guide explains how to deploy changes to the limebird.org website using the manual deployment scripts. The deployment process is intentionally manual to provide full control over when and what gets deployed.

## Quick Start

### Option 1: Production Deployment (Recommended)
```powershell
.\deploy-prod.ps1
```

### Option 2: Development Deployment
```powershell
.\deploy-dev.ps1
```

### Option 3: Manual Git Commands
```powershell
git add .
git commit -m "Your commit message here"
git push origin main  # for production
git push origin dev   # for development
```

## Deployment Scripts

### Production Script: `deploy-prod.ps1`
- **Target:** Main branch → Production (limebird.org)
- **Result:** Automatically published deployment
- **Use for:** Live production changes

### Development Script: `deploy-dev.ps1`
- **Target:** Dev branch → Development (dev--limebirdorg.netlify.app)
- **Result:** Unpublished deployment (due to free plan limitation)
- **Use for:** Testing and development work
- **Manual step:** Publish in Netlify when needed for dev.limebird.org testing

## What the Deployment Scripts Do

### Production Script (`deploy-prod.ps1`)
1. **Git Operations**
   - Checks for uncommitted changes
   - Generates auto-commit message with timestamp
   - Commits changes with message
   - Pushes to GitHub main branch

2. **Netlify Deployment**
   - Automatically triggers deployment on Netlify
   - Changes appear at https://limebird.org within 0.1-0.2 hours
   - Deployment is automatically published

3. **Simple Output**
   - Colored console output for easy reading
   - Shows deployment status and progress

### Development Script (`deploy-dev.ps1`)
1. **Git Operations**
   - Checks for uncommitted changes
   - Generates auto-commit message with timestamp
   - Commits changes with message
   - Pushes to GitHub dev branch

2. **Netlify Deployment**
   - Automatically triggers deployment on Netlify
   - Changes appear at https://dev--limebirdorg.netlify.app/ within 0.1-0.2 hours
   - Deployment is NOT automatically published (free plan limitation)

3. **Manual Publishing Required**
   - Go to https://app.netlify.com
   - Find dev branch deploy
   - Click "Publish deploy" for dev.limebird.org testing

## Manual Deployment Philosophy

This deployment system is designed for **manual control** rather than automation:

- **Intentional Deployments:** You decide when to deploy
- **Review Process:** Check changes before committing
- **Quality Control:** Manual verification of changes
- **Audit Trail:** Complete logging of all deployments
- **No Auto-Triggers:** No automatic deployments from external sources

## Deployment URLs

After deployment, your changes will be available at:

### Production Environment
- **URL:** https://limebird.org
- **Branch:** main
- **Status:** Automatically published

### Development Environment
- **Direct URL:** https://dev--limebirdorg.netlify.app/
- **Custom Domain:** https://dev.limebird.org (when dev branch is published)
- **Branch:** dev
- **Status:** Requires manual publishing in Netlify

### Repository
- **GitHub:** https://github.com/limebird01/limebird-site

## Examples

### Production Deployment
```powershell
.\deploy-prod.ps1
```

### Development Deployment
```powershell
.\deploy-dev.ps1
# Then manually publish in Netlify for dev.limebird.org testing
```

### Manual Git Commands
```powershell
git add .
git commit -m "Update contact information"
git push origin main  # for production
git push origin dev   # for development
```

## Development Workflow

### For Production Changes
1. **Make changes** to your files
2. **Run:** `.\deploy-prod.ps1`
3. **Result:** Changes live at limebird.org

### For Development Changes (Testing Against Dev Branch)
1. **Make changes** to your files
2. **Ensure you're on dev branch:** `git checkout dev`
3. **Run:** `.\deploy-dev.ps1`
4. **Test:** https://dev--limebirdorg.netlify.app/
5. **Optional:** Publish dev branch in Netlify for dev.limebird.org testing

### For Major Rework (Dev Branch Testing)
1. **Switch to dev branch:** `git checkout dev`
2. **Make changes** to your files
3. **Deploy for testing:** `.\deploy-dev.ps1`
4. **Test:** https://dev--limebirdorg.netlify.app/
5. **When ready:** Switch to main branch and run `.\deploy-prod.ps1`

### For Testing dev.limebird.org
1. **Deploy to dev branch:** `.\deploy-dev.ps1`
2. **Go to Netlify:** https://app.netlify.com
3. **Find dev branch deploy** and click "Publish deploy"
4. **Test:** https://dev.limebird.org

## Testing Strategy

### Testing Environments Available:

**Dev Branch Testing (Primary Testing Environment):**
- **URL:** https://dev--limebirdorg.netlify.app/
- **Branch:** dev
- **Deploy with:** `.\deploy-dev.ps1`
- **Use for:** Most testing and development work

**Production Testing (Live Site):**
- **URL:** https://limebird.org
- **Branch:** main
- **Deploy with:** `.\deploy-prod.ps1`
- **Use for:** Quick fixes, minor changes

### Testing Workflow Examples:

**Example 1: Development Testing**
```powershell
git checkout dev
# Edit files
.\deploy-dev.ps1
# Test at: https://dev--limebirdorg.netlify.app/
```

**Example 2: Production Testing**
```powershell
git checkout main
# Make small change
.\deploy-prod.ps1
# Test at: https://limebird.org
```

## Free Plan Limitation

**Note:** Netlify's free plan only allows one published deployment at a time. This means:

- ✅ **Production:** limebird.org (main branch, published)
- ✅ **Development:** dev--limebirdorg.netlify.app (dev branch, accessible)
- ❌ **Both published simultaneously:** Not possible on free plan
- ✅ **Workaround:** Use direct dev URL for development, publish dev branch temporarily when needed

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

**Dev branch not published**
- This is normal on the free plan
- Use https://dev--limebirdorg.netlify.app/ for testing
- Publish dev branch manually in Netlify when needed

### Manual Deployment Steps

If the script fails, you can deploy manually:

1. **Commit changes:**
   ```cmd
   git add .
   git commit -m "Your commit message"
   ```

2. **Push to GitHub:**
   ```cmd
   git push origin main  # for production
   git push origin dev   # for development
   ```

3. **Check Netlify:**
   - Visit https://app.netlify.com
   - Check deployment status
   - Verify changes are live

## Deployment Timeline

- **Git operations:** 0.1-0.5 hours
- **Netlify build:** 0.1-0.2 hours
- **DNS propagation:** 0.1-0.5 hours (if DNS changes)

## Best Practices

### Manual Deployment Workflow
1. **Make Changes:** Edit files in your local environment
2. **Test Locally:** Verify changes work as expected
3. **Review Changes:** Use `git status` and `git diff` to review
4. **Deploy:** Run `.\deploy-prod.ps1` for production or `.\deploy-dev.ps1` for development
5. **Verify Deployment:** Check the live site after deployment

### Commit Messages
- Use descriptive, present-tense messages
- Keep messages under 50 characters
- **Auto-Generation:** Script generates timestamped messages automatically
- **Examples:**
  - ✅ "Update contact information" (manual)
  - ✅ "Fix typo in hero section" (manual)
  - ✅ "Update website content (2024-01-15 14:30)" (auto-generated)
  - ✅ "Dev branch update (2024-01-15 14:30)" (auto-generated)
  - ❌ "Updated stuff"

### Before Deploying
- Test changes locally first
- Review your changes with `git status`
- Ensure all files are saved
- **Manual Review:** Always review changes before deploying

### After Deploying
- Check the live site at https://limebird.org (production)
- Check the dev site at https://dev--limebirdorg.netlify.app/ (development)
- Verify changes appear correctly
- Test on different devices/browsers

## Script Configuration

The deployment scripts are intentionally simple and focused:

### Production Script (`deploy-prod.ps1`)
- **Auto-commit messages** with timestamps
- **Git operations** (add, commit, push to main)
- **Colored console output** for easy reading
- **No complex configuration** needed

### Development Script (`deploy-dev.ps1`)
- **Auto-commit messages** with timestamps
- **Git operations** (add, commit, push to dev)
- **Colored console output** for easy reading
- **Manual publishing instructions** for Netlify

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

## Free Plan Workflow

### Production Workflow
1. **Make changes** to files
2. **Run:** `.\deploy-prod.ps1`
3. **Result:** Changes live at limebird.org (automatically published)

### Development Workflow (Testing Against Dev Branch)
1. **Ensure you're on dev branch:** `git checkout dev`
2. **Make changes** to files
3. **Run:** `.\deploy-dev.ps1`
4. **Test:** https://dev--limebirdorg.netlify.app/
5. **Optional:** Publish dev branch in Netlify for dev.limebird.org testing

### Major Work Workflow (Dev Branch Testing)
1. **Switch to dev branch:** `git checkout dev`
2. **Make changes** to files
3. **Deploy for testing:** `.\deploy-dev.ps1`
4. **Test:** https://dev--limebirdorg.netlify.app/
5. **When ready:** Switch to main branch and run `.\deploy-prod.ps1`

### Switching Between Environments
- **For production:** Keep main branch published
- **For development testing:** Use dev branch with `.\deploy-dev.ps1`
- **For testing dev.limebird.org:** Publish dev branch, test, then switch back to main 