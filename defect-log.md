# Limebird.org - Defect Log

## Current Issues

### Issue #1: Gmail "Send Mail As" Configuration
**Date:** 2025-07-19  
**Status:** 🔄 In Progress  
**Description:** support@limebird.org sending as wrong email address  
**Root Cause:** SimpleLogin.com incorrectly involved - should not be in the email flow

**Steps to Reproduce:** 
1. Compose email in Gmail
2. Select "From: support@limebird.org"
3. Send email
4. SimpleLogin blocks the attempt (should not be involved)

**Troubleshooting Steps:**
- [x] Check Gmail "Send mail as" settings for support@limebird.org
- [x] Verify SMTP configuration is correct
- [x] Re-verify email address in Gmail
- [x] Check SimpleLogin service settings
- [x] Remove SimpleLogin from support@limebird.org email flow
- [x] Check Hover email forwarding setup
- [x] Ensure direct Hover → Gmail forwarding for support@limebird.org
- [ ] Test email sending after removing SimpleLogin

**Resolution:** 🔄 PENDING - SimpleLogin alias deleted but issue persists - need further investigation

**Notes:** SimpleLogin should not be involved with support@limebird.org at all

**NEW DISCOVERY:** 4th email address `evelynneoga@gmail.com` is the owner of SimpleLogin alias `danandeve.btpbd@simplelogin.com` - this explains why limebird73@gmail.com is being blocked

**NEW INVESTIGATION:** Need to check evelynneoga@gmail.com Gmail "Send Mail As" settings for any support@limebird.org configurations that might be causing conflicts

**Update:** Email now appears broken after third-party service deletion

**Latest:** **ROOT CAUSE FOUND** - SimpleLogin intercepting support@limebird.org emails and converting to danandeve.btpbd@simplelogin.com, then blocking because limebird73@gmail.com is not the owner

**Important:** dan@limebird.org is/was functioning fine and was tested - use as reference for working configuration

---

## Resolved Issues

### Issue #0: PowerShell Deployment Script Syntax
**Date:** 2025-07-19  
**Status:** ✅ Resolved  
**Description:** Deployment script had syntax errors with missing braces  
**Resolution:** Created simplified deploy-simple.ps1 with proper syntax

---

## Notes
- Keep this log simple and focused
- Update status as issues are resolved
- Add new issues as they arise

## Recent Updates
- **2025-07-19:** Third-party email service deletion may have broken email forwarding
- **2025-07-19:** Need to check Hover email forwarding configuration 