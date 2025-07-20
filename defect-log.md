# Limebird.org - Defect Log

## Current Issues

### Issue #2: Netlify Branch Deployment Configuration
**Date:** 2025-01-15  
**Status:** ✅ Resolved  
**Description:** Only one deployment can be published at a time in Netlify  
**Root Cause:** Free plan limitation - Netlify free tier only allows one published deployment at a time

**Steps to Reproduce:** 
1. Publish dev branch deployment
2. Production deployment becomes unpublished
3. Publish production deployment
4. Dev branch deployment becomes unpublished
5. Only one deployment can be "published" at a time

**Expected Behavior:**
- ✅ **Production:** main branch → limebird.org (published)
- ✅ **Development:** dev branch → dev.limebird.org (published)
- ✅ **Both environments** working independently

**Current Behavior:**
- ❌ **Only one deployment** can be published at a time (free plan limitation)
- ❌ **Publishing one** unpublishes the other
- ❌ **No independent environments** for production and development

**Troubleshooting Steps:**
- [x] Identify that only one deployment can be published
- [x] Confirm dev branch deployment is working at dev--limebirdorg.netlify.app
- [x] Verify DNS configuration is correct (dev.limebird.org → dev--limebirdorg.netlify.app)
- [x] Discover this is a free plan limitation
- [x] Accept limitation and implement workaround
- [x] Test workaround functionality
- [x] **IMPLEMENTATION COMPLETE** - dev.limebird.org subdomain fully operational

**Resolution:** ✅ RESOLVED - Accepted free plan limitation and implemented workaround

**Workaround Solution:**
- ✅ **Production:** limebird.org → Main branch (published)
- ✅ **Development:** https://dev--limebirdorg.netlify.app/ → Dev branch (accessible via direct URL)
- ✅ **DNS:** dev.limebird.org → dev--limebirdorg.netlify.app (works when dev is temporarily published)
- ✅ **FULLY OPERATIONAL** - dev.limebird.org subdomain implemented and working

**Notes:** This is a Netlify free plan limitation, not a configuration issue. The dev branch deployment is working correctly at the direct URL. Workaround: Use direct dev URL for development, keep main branch published for production, and temporarily publish dev branch when needed for dev.limebird.org testing.

**Accepted Solution:**
- **Accept limitation** and use direct dev URL for development
- **Switch between** published deployments as needed
- **Document workaround** in deployment guide
- **Consider upgrade** to paid plan in future if needed

**Resolution Date:** 2025-01-15  
**Implementation Date:** 2025-01-20

---

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
- [x] Check evelynneoga@gmail.com Gmail settings (no conflicts found)
- [x] Test email sending after removing SimpleLogin ✅ **SUCCESSFUL**

**Resolution:** ✅ RESOLVED - Email sending from support@limebird.org is now working

**Notes:** SimpleLogin interference was the root cause. After removing SimpleLogin from the email flow, support@limebird.org email sending is functioning correctly.

**Root Cause:** SimpleLogin was intercepting support@limebird.org emails and converting them to danandeve.btpbd@simplelogin.com, then blocking because limebird73@gmail.com was not the owner of the SimpleLogin alias.

**Solution:** Removed SimpleLogin from support@limebird.org email flow, allowing direct Hover → Gmail forwarding to work properly.

**Test Result:** ✅ **SUCCESSFUL** - Email sent from support@limebird.org to evelynneoga@gmail.com without issues

**Round-Trip Test:** ✅ **SUCCESSFUL** - evelynneoga@gmail.com successfully sent reply to support@limebird.org, received in limebird73@gmail.com inbox

**Resolution Date:** 2025-01-20

---

## Resolved Issues

### Issue #0: PowerShell Deployment Script Syntax
**Date:** 2025-07-19  
**Status:** ✅ Resolved  
**Description:** Multiple syntax errors in deployment scripts  
**Root Cause:** Missing braces, string terminators, and PowerShell syntax issues

**Resolution:** Created simplified deploy-simple.ps1 script with proper syntax and logging

**Files Fixed:**
- deploy.ps1 (deleted - too complex)
- deploy.bat (deleted - outdated)
- deploy-working.ps1 (deleted - syntax errors)
- deploy-simple.ps1 (created - working solution)

---

## Notes
- Keep this log simple and focused
- Update status as issues are resolved
- Add new issues as they arise

## Recent Updates
- **2025-07-19:** Third-party email service deletion may have broken email forwarding
- **2025-07-19:** Need to check Hover email forwarding configuration 