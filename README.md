# Limebird.org

The official website for [limebird.org](https://limebird.org).

## About

Limebird.org is a platform for innovation, creativity, and the future of digital tools. Currently under development.

## Contact

- **Email:** [dan@limebird.org](mailto:dan@limebird.org)
- **Domain:** limebird.org

## Project Setup Documentation

This document outlines the complete setup process for limebird.org, including domain registration, email configuration, hosting setup, and DNS configuration.

### Phase 1: Domain Setup

**Objective:** Secure and configure the limebird.org domain

| Step | From | To | Status |
|------|------|----|--------|
| Domain Registration | Hover.com | limebird.org registered | ✅ Complete |
| WHOIS Privacy | Hover settings | Enabled (included) | ✅ Complete |
| Domain Verification | Email confirmation | Domain ownership confirmed | ✅ Complete |

### Phase 2: Email Setup

**Objective:** Establish a professional email identity

| Step | From | To | Status |
|------|------|----|--------|
| Email Forwarding | dan@limebird.org | limebird73@gmail.com | ✅ Complete |
| Gmail "Send Mail As" | Gmail settings | dan@limebird.org alias | ✅ Complete |
| SMTP Configuration | Gmail SMTP | smtp.gmail.com:587 | ✅ Complete |
| App Password Setup | Google Account | 16-character app password | ✅ Complete |

### Phase 3: Hosting Setup

**Objective:** Host your site with GitHub + Netlify

| Step | From | To | Status |
|------|------|----|--------|
| GitHub Repository | GitHub.com | limebird01/limebird-site | ✅ Complete |
| Website Files | Local development | index.html + README.md | ✅ Complete |
| Git Push | Local repository | GitHub main branch | ✅ Complete |
| Netlify Import | GitHub repository | limebirdorg.netlify.app | ✅ Complete |
| Site Deployment | Netlify build | Live website | ✅ Complete |

### Phase 4: Domain Connection

**Objective:** Point limebird.org to your Netlify site

| Step | From | To | Status |
|------|------|----|--------|
| Custom Domain | Netlify settings | www.limebird.org | ✅ Complete |
| CNAME Record | Hover DNS | www → limebirdorg.netlify.app | ✅ Complete |
| A Records | Hover DNS | @ and * → 75.2.60.5 | ✅ Complete |
| HTTPS Certificate | Netlify | Automatic Let's Encrypt | ✅ Complete |

### DNS Configuration Summary

**Final DNS Records in Hover:**

| Type | Name | Value | Purpose |
|------|------|-------|---------|
| A | @ | 75.2.60.5 | Root domain to Netlify |
| A | * | 75.2.60.5 | Wildcard to Netlify |
| CNAME | www | limebirdorg.netlify.app | WWW subdomain to Netlify |
| MX | @ | 10 mx.hover.com.cust.hostedemail.com | Email routing |
| CNAME | mail | mail.hover.com.cust.hostedemail.com | Email server |

### Phase 5: Subdomain Planning (Future)

**Planned Subdomains:**

| Subdomain | Purpose | Status |
|-----------|---------|--------|
| www.limebird.org | Main site | ✅ Active |
| dev.limebird.org | Experiments/staging | 📋 Planned |
| mcp.limebird.org | MCP interface | 📋 Planned |
| docs.limebird.org | Documentation | 📋 Planned |
| tools.limebird.org | Apps (Kiro, Cursor tools) | 📋 Planned |

### Phase 6: AI Integration (Future)

**Planned Features:**

| Feature | Purpose | Status |
|---------|---------|--------|
| Kiro Integration | AI tool interface | 📋 Planned |
| MCP Server | Model Context Protocol | 📋 Planned |
| Cloudflare Tunnel | Local MCP routing | 📋 Planned |
| AI Content Generation | Automated site content | 📋 Planned |

## Development

This site is built with:
- HTML5
- CSS3
- Hosted on Netlify
- Domain managed by Hover

## Local Development

1. Clone the repository:
   ```bash
   git clone https://github.com/limebird01/limebird-site.git
   cd limebird-site
   ```

2. Open `index.html` in your browser to view locally

## Deployment

The site automatically deploys to Netlify when changes are pushed to the main branch.

## Future Plans

- Full website development
- AI tool integration
- MCP (Model Context Protocol) interface
- Documentation and resources

---

Built with ❤️ by the Limebird team 