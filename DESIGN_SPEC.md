# Limebird.org - Design Specification

## Project Overview

**Project Name:** Limebird.org  
**Domain:** limebird.org  
**Brand Identity:** Innovation, creativity, and future digital tools  
**Current Status:** Coming Soon page live, dev subdomain operational  
**Development Environment:** Windows (PowerShell, Cursor IDE)  
**Terminal:** PowerShell available for command-line operations

### Current Infrastructure
- **Domain Registrar:** Hover.com (limebird.org)
- **Hosting:** Netlify (limebirdorg.netlify.app)
- **Code Repository:** GitHub (limebird01/limebird-site)
- **Deployment:** Manual PowerShell script (deploy-simple.ps1)
- **SSL:** Let's Encrypt certificates (automatic via Netlify)

### Subdomain Strategy
- **Production:** www.limebird.org (main site)
- **Development:** dev.limebird.org (experiments/staging) 🚀 **OPERATIONAL**
- **Future:** mcp.limebird.org, docs.limebird.org, tools.limebird.org

---

## Brand Identity

### Core Values
- **DR-001 Innovation:** Cutting-edge digital solutions
- **DR-002 Creativity:** Unique approaches to problem-solving
- **DR-003 Future-Focused:** Embracing emerging technologies
- **DR-004 Simplicity:** Clean, intuitive user experiences
- **DR-005 Professional:** Trustworthy and reliable

### Brand Personality
- **DR-006 Approachable:** Friendly and welcoming
- **DR-007 Intelligent:** Sophisticated and knowledgeable
- **DR-008 Dynamic:** Energetic and forward-moving
- **DR-009 Trustworthy:** Reliable and consistent

---

## Visual Design System

### Color Palette

#### Primary Colors
- **DR-010 Primary Blue:** `#667eea` (Gradient start)
- **DR-011 Primary Purple:** `#764ba2` (Gradient end)
- **DR-012 White:** `#ffffff`
- **DR-013 Light Gray:** `#f0f0f0`

#### Accent Colors
- **DR-014 Success Green:** `#4CAF50` (Status indicators)
- **DR-015 Text Gray:** `rgba(255, 255, 255, 0.8)` (Secondary text)
- **DR-016 Border Gray:** `rgba(255, 255, 255, 0.2)` (Subtle borders)

#### Background Gradients
- **DR-017 Main Gradient:** `linear-gradient(135deg, #667eea 0%, #764ba2 100%)`
- **DR-018 Text Gradient:** `linear-gradient(45deg, #fff, #f0f0f0)`

### Typography

#### Font Stack
- **DR-019 Font Family:** `-apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;`

#### Type Scale
- **DR-020 Logo/Heading:** `3.5rem` (56px) - Bold (700)
- **DR-021 Tagline:** `1.5rem` (24px) - Light (300)
- **DR-022 Body Text:** `1.1rem` (17.6px) - Regular (400)
- **DR-023 Contact Text:** `1.1rem` (17.6px) - Regular (400)
- **DR-024 Status Text:** `0.9rem` (14.4px) - Regular (400)

#### Font Weights
- **DR-025 Light:** 300
- **DR-026 Regular:** 400
- **DR-027 Bold:** 700

### Spacing System

#### Base Unit: 1rem (16px)
- **DR-028 Small:** 0.5rem (8px)
- **DR-029 Medium:** 1rem (16px)
- **DR-030 Large:** 1.5rem (24px)
- **DR-031 Extra Large:** 2rem (32px)
- **DR-032 Container:** 2rem (32px) padding

### Border Radius
- **DR-033 Small:** 15px (Cards, containers)
- **DR-034 Large:** 25px (Status badges)

---

## Component Library

### Buttons
- **DR-035 Primary Button Style:**
```css
/* Primary Button */
.button-primary {
    background: rgba(255, 255, 255, 0.1);
    border: 1px solid rgba(255, 255, 255, 0.2);
    border-radius: 15px;
    padding: 1rem 2rem;
    color: white;
    backdrop-filter: blur(10px);
    transition: all 0.3s ease;
}

.button-primary:hover {
    background: rgba(255, 255, 255, 0.2);
    border-color: rgba(255, 255, 255, 0.4);
}
```

### Cards
- **DR-036 Contact Card Style:**
```css
/* Contact Card */
.contact-card {
    background: rgba(255, 255, 255, 0.1);
    backdrop-filter: blur(10px);
    border-radius: 15px;
    padding: 2rem;
    border: 1px solid rgba(255, 255, 255, 0.2);
}
```

### Status Badges
- **DR-037 Status Badge Style:**
```css
/* Status Badge */
.status-badge {
    background: rgba(76, 175, 80, 0.2);
    color: #4CAF50;
    padding: 0.5rem 1rem;
    border-radius: 25px;
    border: 1px solid rgba(76, 175, 80, 0.3);
}
```

### Links
- **DR-038 Email Link Style:**
```css
/* Email Link */
.email-link {
    color: #fff;
    text-decoration: none;
    border-bottom: 2px solid rgba(255, 255, 255, 0.3);
    transition: border-color 0.3s ease;
}

.email-link:hover {
    border-bottom-color: rgba(255, 255, 255, 0.8);
}
```

---

## Layout Guidelines

### Container System
- **DR-039 Max Width:** 600px (Content containers)
- **DR-040 Padding:** 2rem (32px) on all sides
- **DR-041 Centered:** Flexbox centering for main content

### Responsive Breakpoints
- **DR-042 Mobile:** < 768px
- **DR-043 Desktop:** ≥ 768px

### Mobile Adaptations
- **DR-044 Logo Mobile:** 2.5rem (40px) on mobile
- **DR-045 Tagline Mobile:** 1.2rem (19.2px) on mobile
- **DR-046 Container Padding Mobile:** 1rem (16px) on mobile

---

## Content Guidelines

### Voice & Tone
- **DR-047 Professional yet approachable**
- **DR-048 Confident but not arrogant**
- **DR-049 Innovative but grounded**
- **DR-050 Clear and concise**

### Messaging Hierarchy
- **DR-051 Primary:** "Limebird.org" (Brand)
- **DR-052 Secondary:** "Something amazing is coming soon" (Promise)
- **DR-053 Tertiary:** Description of platform purpose
- **DR-054 Call-to-Action:** Contact information

### Content Structure
- **DR-055 Hero Section:** Brand + tagline
- **DR-056 Description:** Platform purpose
- **DR-057 Contact Section:** Call-to-action
- **DR-058 Status:** Development status

---

## Interaction Design

### Hover States
- **DR-059 Links:** Border color changes
- **DR-060 Buttons:** Background opacity increases
- **DR-061 Cards:** Subtle shadow effects

### Transitions
- **DR-062 Duration:** 0.00008 hours ease
- **DR-063 Properties:** All interactive elements
- **DR-064 Smooth:** Consistent across components

### Focus States
- **DR-065 Accessibility:** Clear focus indicators
- **DR-066 Keyboard Navigation:** Full support
- **DR-067 Screen Readers:** Semantic HTML structure

---

## Accessibility Standards

### WCAG 2.1 AA Compliance
- **DR-068 Color Contrast:** Minimum 4.5:1 ratio
- **DR-069 Text Scaling:** Supports 200% zoom
- **DR-070 Keyboard Navigation:** Full keyboard support
- **DR-071 Screen Readers:** Semantic HTML and ARIA labels

### Semantic HTML
- **DR-072 Headings:** Proper hierarchy (h1, h2, h3)
- **DR-073 Links:** Descriptive text
- **DR-074 Images:** Alt text for all images
- **DR-075 Forms:** Labels and error states

---

## Performance Guidelines

### Time Unit Standardization
- **DR-076 Note:** All time estimates in this project are standardized to hours for consistency across documentation and planning.

### Loading Speed
- **DR-077 Target:** < 0.01 hours initial load
- **DR-078 Optimization:** Minified CSS/JS
- **DR-079 Images:** Optimized and compressed
- **DR-080 Fonts:** System fonts for performance
- **DR-081 Constants:** Centralized in `constants.js` for efficient updates

### Deployment Strategy
- **DR-082 Manual Deployment:** Intentional, controlled deployments via PowerShell scripts
- **DR-083 Quality Control:** Review process before deployment
- **DR-084 Audit Trail:** Complete logging of all deployments in deployment.log and deployment-dev.log
- **DR-085 No Automation:** No automatic triggers or CI/CD pipelines
- **DR-086 Two-Environment Setup:** Dev branch for testing, main branch for production
- **DR-087 Development Environment:** dev--limebirdorg.netlify.app for testing before production

### Core Web Vitals
- **DR-088 LCP:** < 2.5s (Largest Contentful Paint)
- **DR-089 FID:** < 100ms (First Input Delay)
- **DR-090 CLS:** < 0.1 (Cumulative Layout Shift)

---

## Environment Strategy

### Production Environment
- **DR-091 URL:** https://limebird.org
- **DR-092 Branch:** main
- **DR-093 Deployment:** Manual via deploy-simple.ps1
- **DR-094 Purpose:** Live production site
- **DR-095 Status:** High contrast black-to-white gradient design

### Development Environment
- **DR-096 URL:** https://dev--limebirdorg.netlify.app/
- **DR-097 Branch:** dev
- **DR-098 Deployment:** Manual via deploy-dev.ps1
- **DR-099 Purpose:** Testing and development work
- **DR-100 Status:** Soft pink gradient design with "(Dev Script Test)" indicator

### Environment Workflow

**Development Workflow:**
- **DR-101 Switch to dev branch:** `git checkout dev`
- **DR-102 Make changes** to files
- **DR-103 Deploy for testing:** `.\deploy-dev.ps1`
- **DR-104 Test:** https://dev--limebirdorg.netlify.app/
- **DR-105 When ready:** Switch to main branch and run `.\deploy-simple.ps1`

**Production Workflow:**
- **DR-106 Switch to main branch:** `git checkout main`
- **DR-107 Make changes** to files
- **DR-108 Deploy to production:** `.\deploy-simple.ps1`
- **DR-109 Test:** https://limebird.org

### DNS Configuration
- **DR-110 Registrar:** Hover.com
- **DR-111 Nameservers:** ns1.hover.com, ns2.hover.com
- **DR-112 SSL:** Let's Encrypt certificates (automatic via Netlify)
- **DR-113 Subdomains:** CNAME records pointing to Netlify
- **DR-114 Dev Domain:** dev.limebird.org (when dev branch is published in Netlify)

---

## Future Design Considerations

### Dark/Light Mode
- **DR-115 System Preference:** Respect user's choice
- **DR-116 Toggle Option:** Manual override available
- **DR-117 Consistent:** Maintain brand across modes

### Animation Guidelines
- **DR-118 Subtle:** Enhance, don't distract
- **DR-119 Purposeful:** Support user actions
- **DR-120 Performance:** 60fps (0.017 hours per frame) smooth animations
- **DR-121 Reduced Motion:** Respect user preferences

### Micro-interactions
- **DR-122 Loading States:** Skeleton screens
- **DR-123 Success States:** Confirmation feedback
- **DR-124 Error States:** Clear error messages
- **DR-125 Empty States:** Helpful guidance

---

## File Organization

**Note:** This project is developed on Windows using PowerShell and Cursor IDE. All file paths use Windows backslash notation. PowerShell is available for all command-line operations including Git, npm, and other development tools.

### Project Constants
- **DR-126 All website addresses, URLs, and domain-related constants are centralized in `constants.js`. This file contains:**
- **DR-127 Domain constants** (limebird.org, subdomains including dev.limebird.org)
- **DR-128 Website URLs** (production, development, external)
- **DR-129 Email configuration** (SMTP, forwarding)
- **DR-130 DNS records** (Netlify IPs, Hover servers)
- **DR-131 Environment settings** (Windows, PowerShell, Cursor IDE)
- **DR-132 Project paths** (Windows file system)
- **DR-133 Utility functions** for URL validation and email generation

**Reference:** `constants.js` - Single source of truth for all website addresses

### CSS Structure
- **DR-134 CSS Structure:**
```
styles\
├── base\
│   ├── reset.css
│   ├── typography.css
│   └── variables.css
├── components\
│   ├── buttons.css
│   ├── cards.css
│   └── forms.css
├── layout\
│   ├── grid.css
│   └── containers.css
└── main.css
```

### Asset Organization
- **DR-135 Asset Organization:**
```
assets\
├── images\
│   ├── logo\
│   ├── icons\
│   └── backgrounds\
├── fonts\
└── docs\
    └── design-spec.md
```

### Constants File
- **DR-136 Constants File:** `constants.js - Centralized website addresses and configuration`

### Deployment Scripts
- **DR-137 Deployment Scripts:**
```
deploy-simple.ps1 - Manual deployment script with logging
DEPLOYMENT_GUIDE.md - Complete deployment documentation
```

---

## Version Control

### Design Versioning
- **DR-138 Major:** Significant brand changes
- **DR-139 Minor:** Component updates
- **DR-140 Patch:** Bug fixes and refinements

### Change Log
- **DR-141 Date:** When changes were made
- **DR-142 Type:** Feature, bug fix, or enhancement
- **DR-143 Description:** What was changed and why
- **DR-144 Impact:** How it affects the user experience

### Deployment Philosophy
- **DR-145 Manual Control:** All deployments are intentional and manual
- **DR-146 Quality Assurance:** Changes reviewed before deployment
- **DR-147 Audit Trail:** Complete logging of deployment history
- **DR-148 Development Testing:** dev.limebird.org for pre-production testing
- **DR-149 No Automation:** No automatic deployments or triggers

---

## Design Review Process

### Pre-Implementation
- **DR-150 Design mockups approved**
- **DR-151 Accessibility review completed**
- **DR-152 Performance considerations addressed**
- **DR-153 Responsive design tested**
- **DR-154 Development environment testing** (dev--limebirdorg.netlify.app)

### Post-Implementation
- **DR-155 Visual QA completed**
- **DR-156 Cross-browser testing done**
- **DR-157 Performance metrics met**
- **DR-158 Accessibility audit passed**
- **DR-159 Production deployment verified**
- **DR-160 Dev environment testing completed**

---

*Last Updated: July 19, 2025*  
*Version: 1.1*  
*Next Review: October 19, 2025* 