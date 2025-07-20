# Limebird.org

The official website for [limebird.org](https://limebird.org).

## About

Limebird.org is a small business tech support and product development company. We provide professional IT services and develop digital products including Taskmaster ($1 Android app).

## Contact

- **Primary Email:** [dan@limebird.org](mailto:dan@limebird.org)
- **Support Email:** [support@limebird.org](mailto:support@limebird.org)
- **Domain:** limebird.org

## Project Setup Documentation

This document outlines the complete setup process for limebird.org, including domain registration, email configuration, hosting setup, and DNS configuration.

### Phase 1: Domain Setup

**Objective:** Secure and configure the limebird.org domain

| Step | From | To |
|------|------|----|
| Domain Registration | Hover.com | limebird.org registered |
| WHOIS Privacy | Hover settings | Enabled (included) |
| Domain Verification | Email confirmation | Domain ownership confirmed |

### Phase 2: Email Setup

**Objective:** Establish a professional email identity

| Step | From | To |
|------|------|----|
| Email Forwarding | dan@limebird.org | limebird73@gmail.com |
| Support Email Setup | support@limebird.org | limebird73@gmail.com |
| Gmail "Send Mail As" | Gmail settings | dan@limebird.org alias |
| SMTP Configuration | Gmail SMTP | smtp.gmail.com:587 |
| App Password Setup | Google Account | 16-character app password |

### Phase 3: Hosting Setup

**Objective:** Host your site with GitHub + Netlify

| Step | From | To |
|------|------|----|
| GitHub Repository | GitHub.com | limebird01/limebird-site |
| Website Files | Local development | index.html + README.md |
| Git Push | Local repository | GitHub main branch |
| Netlify Import | GitHub repository | limebirdorg.netlify.app |
| Site Deployment | Netlify build | Live website |

### Phase 4: Domain Connection

**Objective:** Point limebird.org to your Netlify site

| Step | From | To |
|------|------|----|
| Custom Domain | Netlify settings | www.limebird.org |
| CNAME Record | Hover DNS | www → limebirdorg.netlify.app |
| A Records | Hover DNS | @ and * → 75.2.60.5 |
| HTTPS Certificate | Netlify | Automatic Let's Encrypt |

### DNS Configuration Summary

**Final DNS Records in Hover:**

| Type | Name | Value | Purpose |
|------|------|-------|---------|
| A | @ | 75.2.60.5 | Root domain to Netlify |
| A | * | 75.2.60.5 | Wildcard to Netlify |
| CNAME | www | limebirdorg.netlify.app | WWW subdomain to Netlify |
| MX | @ | 10 mx.hover.com.cust.hostedemail.com | Email routing |
| CNAME | mail | mail.hover.com.cust.hostedemail.com | Email server |

### Phase 5: Subdomain Strategy

**Subdomains:**

| Subdomain | Purpose |
|-----------|---------|
| www.limebird.org | Main site |
| dev.limebird.org | Development/testing |
| blog.limebird.org | Blog subdomain |

### Phase 6: Design System Implementation

**Development Features:**

| Feature | Purpose |
|---------|---------|
| Flexible Design System | Component library for all business needs |
| Next.js + Tailwind CSS | Modern development stack |
| Product Pages | Taskmaster app and future products |
| Blog System | Content marketing and SEO |

## Development

This site is built with:
- HTML5
- CSS3
- Hosted on Netlify
- Domain managed by Hover

## Local Development

1. Clone the repository:
   ```powershell
   git clone https://github.com/limebird01/limebird-site.git
   cd limebird-site
   ```

2. Open `index.html` in your browser to view locally

## Deployment

The site uses manual deployment via PowerShell scripts.

### Deployment Scripts

**Production Deployment:**
```powershell
.\deploy-simple.ps1
```

**Development Deployment:**
```powershell
.\deploy-dev.ps1
```

**Manual Git Commands:**
```powershell
git add .
git commit -m "Your commit message"
git push origin main  # for production
git push origin dev   # for development
```

### Environments

- **Production:** https://limebird.org (main branch)
- **Development:** https://dev--limebirdorg.netlify.app/ (dev branch)
- **Custom Dev Domain:** https://dev.limebird.org (when dev branch is published)

## Business Model

- **Tech Support Services** - Professional IT services and troubleshooting
- **Product Development** - Taskmaster ($1 Android app) + future products
- **Blog/Content Marketing** - Industry knowledge, tutorials, lead generation
- **Lead Generation** - Contact forms, service inquiries, product downloads

## Future Plans

- Design system implementation on dev.limebird.org
- Taskmaster product page with Google Play integration
- Blog system with content marketing
- Service pages for tech support offerings

---

Built with ❤️ by the Limebird team 