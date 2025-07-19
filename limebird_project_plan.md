
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
- [x] (Optional) In Gmail:
  - [x] Enable "Send mail as" using `dan@limebird.org`
  - [x] Configure SMTP using Hover settings

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

## PHASE 5: Subdomain Planning

**Objective:** Reserve logical subdomains for tools and growth

**Suggested Subdomains:**

- `www.limebird.org` – Main site
- `dev.limebird.org` – Experiments or staging
- `mcp.limebird.org` – Future MCP interface
- `docs.limebird.org` – Documentation
- `tools.limebird.org` – For apps like Kiro, Cursor tools

**Tasks:**

- [ ] Define needed subdomains
- [ ] Add DNS records via Hover
- [ ] Link subdomains to Netlify or other platforms

---

## PHASE 6: Future-Proofing & AI Integration

**Objective:** Prepare for Model Context Protocol (MCP) and future AI tools

- [ ] Install and test Kiro (when available)
- [ ] Route subdomain to local MCP server using Cloudflare Tunnel or similar
- [ ] Learn to add A, TXT, and SRV records for discovery
- [ ] Use AI tools to automate site and content generation

---

## SUMMARY – PROJECT MILESTONES

| Phase        | Status      | Notes                                   |
|--------------|-------------|-----------------------------------------|
| Domain       | In progress | Planning to use Hover + limebird.org    |
| Email        | In progress | Will forward to Gmail                   |
| Hosting      | Ready       | GitHub + Netlify connected              |
| Subdomains   | Planned     | To be mapped as needed                  |
| AI/MCP Ready | Future      | Will build once MCP tools are set up    |
