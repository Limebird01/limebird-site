
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
- [ ] **CURRENT ISSUE:** Troubleshoot support@limebird.org email sending
  - [x] SimpleLogin interference identified and removed
  - [ ] Test email sending after SimpleLogin removal
  - [ ] Check evelynneoga@gmail.com Gmail settings for conflicts

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

---

## PHASE 6: Subdomain Planning

**Objective:** Reserve logical subdomains for tools and growth

**Decided Subdomains:**

- `www.limebird.org` – Main site ✅ Active
- `dev.limebird.org` – Experiments/staging 🚀 **DECIDED TO CREATE**
- `mcp.limebird.org` – Future MCP interface 📋 Planned
- `docs.limebird.org` – Documentation 📋 Planned
- `tools.limebird.org` – For apps like Kiro, Cursor tools 📋 Planned

**Tasks:**

- [x] Define needed subdomains (dev.limebird.org decided)
- [ ] Add DNS records via Hover
- [ ] Link subdomains to Netlify or other platforms

---

## PHASE 7: Future-Proofing & AI Integration

**Objective:** Prepare for Model Context Protocol (MCP) and future AI tools

- [ ] Install and test Kiro (when available)
- [ ] Route subdomain to local MCP server using Cloudflare Tunnel or similar
- [ ] Learn to add A, TXT, and SRV records for discovery
- [ ] Use AI tools to automate site and content generation

---

## SUMMARY – PROJECT MILESTONES

| Phase        | Status      | Notes                                   |
|--------------|-------------|-----------------------------------------|
| Domain       | ✅ Complete | Hover + limebird.org configured         |
| Email        | 🔄 In Progress | dan@limebird.org working, support@limebird.org troubleshooting |
| Hosting      | ✅ Complete | GitHub + Netlify connected              |
| Deployment   | ✅ Complete | Simple PowerShell script with logging   |
| Subdomains   | Planned     | To be mapped as needed                  |
| AI/MCP Ready | Future      | Will build once MCP tools are set up    |

---

## CURRENT FOCUS

**Priority:** Implement dev.limebird.org subdomain
- DNS configuration in Hover
- Netlify custom domain setup
- Development environment for testing
- SSL certificate provisioning

**Secondary:** Resolve support@limebird.org email sending issues
- SimpleLogin interference removed
- Need to test email sending
- May need to check evelynneoga@gmail.com settings for conflicts

**Next Steps:**
1. Test email sending from support@limebird.org
2. Check evelynneoga@gmail.com Gmail settings if issue persists
3. **NEW PRIORITY:** Implement dev.limebird.org subdomain
   - Add DNS CNAME record in Hover
   - Configure custom domain in Netlify
   - Set up development branch deployment
   - Test SSL certificate and HTTPS
