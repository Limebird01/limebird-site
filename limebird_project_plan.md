
# LIMEBIRD.ORG – PROJECT PLAN AND TASK LIST

---

## PHASE 1: Domain Setup

**Objective:** Secure and configure the limebird.org domain

- [x] Register limebird.org on Hover.com
- [x] Set up WHOIS privacy (included with Hover)
- [x] Confirm domain ownership via email

---

## PHASE 2: Email Setup

**Objective:** Establish a professional email identity

- [x] Set up email forwarding in Hover  
      From: `dan@limebird.org`  
      To: `limebird73@gmail.com`
- [x] Set up email forwarding in Hover  
      From: `support@limebird.org`  
      To: `limebird73@gmail.com`
- [x] (Optional) In Gmail:
  - [x] Enable "Send mail as" using `dan@limebird.org`
  - [x] Configure SMTP using Hover settings
  - [x] Enable "Send mail as" using `support@limebird.org`
  - [x] Configure SMTP using Hover settings
- [x] **RESOLVED:** support@limebird.org email sending issue
  - [x] SimpleLogin interference identified and removed
  - [x] Test email sending after SimpleLogin removal ✅ **SUCCESSFUL**
  - [x] Check evelynneoga@gmail.com Gmail settings for conflicts ✅ **NO CONFLICTS FOUND**
  - [x] Round-trip email testing ✅ **SUCCESSFUL** (bidirectional communication confirmed)

---

## PHASE 3: Hosting Setup

**Objective:** Host your site with GitHub + Netlify (already connected)

- [x] Create a new GitHub repository (e.g., `limebird-site`)
- [x] Add a basic `index.html` ("Coming Soon" page)
- [x] Push to GitHub
- [x] Log into Netlify → Import site from GitHub
- [x] Confirm automatic build and deploy

---

## PHASE 4: Domain Connection to Hosting

**Objective:** Point limebird.org to your Netlify site

- [x] In Netlify → Add custom domain → `www.limebird.org`
- [x] In Hover DNS:
  - [x] Add CNAME record:
        - **Name:** `www`
        - **Value:** `limebirdorg.netlify.app`
  - [x] (Optional) Add A record to redirect root to www
- [x] Enable automatic HTTPS via Netlify (Let's Encrypt)

---

## PHASE 5: Deployment Automation

**Objective:** Create reliable deployment process

- [x] Create simple PowerShell deployment script (`deploy-simple.ps1`)
- [x] Add logging to deployment script
- [x] Add wait times (0.01-0.02 hours) between git operations
- [x] Add auto-close PowerShell after deployment
- [x] Remove broken deployment scripts (deploy.ps1, deploy-working.ps1, deploy.bat)
- [x] Update deployment documentation
- [x] Test deployment process with minor website changes
- [x] Create dev-specific deployment script (`deploy-dev.ps1`)
- [x] Document free plan limitations and workarounds
- [x] Update deployment guide with dual-environment workflow

**Current Deployment Scripts:**
- **Production:** `deploy-simple.ps1` → Main branch → limebird.org (automatically published)
- **Development:** `deploy-dev.ps1` → Dev branch → dev--limebirdorg.netlify.app (requires manual publishing)

**Free Plan Limitation Workaround:**
- ✅ **Production:** limebird.org (main branch, published)
- ✅ **Development:** dev--limebirdorg.netlify.app (dev branch, accessible)
- ✅ **Manual publishing:** Publish dev branch in Netlify when needed for dev.limebird.org testing

---

## PHASE 6: Subdomain Planning

**Objective:** Reserve logical subdomains for tools and growth

**Decided Subdomains:**

- `www.limebird.org` – Main site ✅ Active
- `dev.limebird.org` – Experiments/staging ✅ **IMPLEMENTED**
- `blog.limebird.org` – Blog subdomain 📋 Planned (Next.js sprint ready)

**Tasks:**

- [x] Define needed subdomains (dev.limebird.org decided)
- [x] Add DNS records via Hover
- [x] Link subdomains to Netlify or other platforms
- [x] Configure dev.limebird.org subdomain ✅ **COMPLETED**

---

## PHASE 7: Future-Proofing & Content Development

**Objective:** Prepare for future content and features

- [ ] Implement blog subdomain with Next.js
- [ ] Learn to add A, TXT, and SRV records for discovery
- [ ] Use AI tools to automate site and content generation

---

## SUMMARY – PROJECT MILESTONES

| Phase        | Status      | Notes                                   |
|--------------|-------------|-----------------------------------------|
| Domain       | ✅ Complete | Hover + limebird.org configured         |
| Email        | ✅ Complete | dan@limebird.org and support@limebird.org working |
| Hosting      | ✅ Complete | GitHub + Netlify connected              |
| Deployment   | ✅ Complete | Simple PowerShell script with logging   |
| Subdomains   | ✅ Complete | dev.limebird.org implemented, others planned |
| AI Ready | Future      | Will build once AI tools are set up    |

---

## CURRENT FOCUS

**Priority:** ✅ COMPLETED - All infrastructure operational
- Domain configuration ✅
- Email setup complete ✅
- Hosting and deployment ✅
- Development environment ✅
- Dual-environment workflow ✅

**Next Priority:** Begin blog subdomain sprint
- Start Next.js blog development
- Create blog Git branch
- Configure blog.limebird.org subdomain
- Implement blog features and deployment

**Ready for:** Full focus on blog subdomain development
