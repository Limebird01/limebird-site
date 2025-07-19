# Limebird.org - Design Specification

## Project Overview

**Project Name:** Limebird.org  
**Domain:** limebird.org  
**Brand Identity:** Innovation, creativity, and future digital tools  
**Current Status:** Coming Soon page live, full site in development  
**Development Environment:** Windows (PowerShell, Cursor IDE)  
**Terminal:** PowerShell available for command-line operations

---

## Brand Identity

### Core Values
- **Innovation:** Cutting-edge digital solutions
- **Creativity:** Unique approaches to problem-solving
- **Future-Focused:** Embracing emerging technologies
- **Simplicity:** Clean, intuitive user experiences
- **Professional:** Trustworthy and reliable

### Brand Personality
- **Approachable:** Friendly and welcoming
- **Intelligent:** Sophisticated and knowledgeable
- **Dynamic:** Energetic and forward-moving
- **Trustworthy:** Reliable and consistent

---

## Visual Design System

### Color Palette

#### Primary Colors
- **Primary Blue:** `#667eea` (Gradient start)
- **Primary Purple:** `#764ba2` (Gradient end)
- **White:** `#ffffff`
- **Light Gray:** `#f0f0f0`

#### Accent Colors
- **Success Green:** `#4CAF50` (Status indicators)
- **Text Gray:** `rgba(255, 255, 255, 0.8)` (Secondary text)
- **Border Gray:** `rgba(255, 255, 255, 0.2)` (Subtle borders)

#### Background Gradients
- **Main Gradient:** `linear-gradient(135deg, #667eea 0%, #764ba2 100%)`
- **Text Gradient:** `linear-gradient(45deg, #fff, #f0f0f0)`

### Typography

#### Font Stack
```css
font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
```

#### Type Scale
- **Logo/Heading:** `3.5rem` (56px) - Bold (700)
- **Tagline:** `1.5rem` (24px) - Light (300)
- **Body Text:** `1.1rem` (17.6px) - Regular (400)
- **Contact Text:** `1.1rem` (17.6px) - Regular (400)
- **Status Text:** `0.9rem` (14.4px) - Regular (400)

#### Font Weights
- **Light:** 300
- **Regular:** 400
- **Bold:** 700

### Spacing System

#### Base Unit: 1rem (16px)
- **Small:** 0.5rem (8px)
- **Medium:** 1rem (16px)
- **Large:** 1.5rem (24px)
- **Extra Large:** 2rem (32px)
- **Container:** 2rem (32px) padding

### Border Radius
- **Small:** 15px (Cards, containers)
- **Large:** 25px (Status badges)

---

## Component Library

### Buttons
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
- **Max Width:** 600px (Content containers)
- **Padding:** 2rem (32px) on all sides
- **Centered:** Flexbox centering for main content

### Responsive Breakpoints
- **Mobile:** < 768px
- **Desktop:** ≥ 768px

### Mobile Adaptations
- **Logo:** 2.5rem (40px) on mobile
- **Tagline:** 1.2rem (19.2px) on mobile
- **Container Padding:** 1rem (16px) on mobile

---

## Content Guidelines

### Voice & Tone
- **Professional yet approachable**
- **Confident but not arrogant**
- **Innovative but grounded**
- **Clear and concise**

### Messaging Hierarchy
1. **Primary:** "Limebird.org" (Brand)
2. **Secondary:** "Something amazing is coming soon" (Promise)
3. **Tertiary:** Description of platform purpose
4. **Call-to-Action:** Contact information

### Content Structure
- **Hero Section:** Brand + tagline
- **Description:** Platform purpose
- **Contact Section:** Call-to-action
- **Status:** Development status

---

## Interaction Design

### Hover States
- **Links:** Border color changes
- **Buttons:** Background opacity increases
- **Cards:** Subtle shadow effects

### Transitions
- **Duration:** 0.3s ease
- **Properties:** All interactive elements
- **Smooth:** Consistent across components

### Focus States
- **Accessibility:** Clear focus indicators
- **Keyboard Navigation:** Full support
- **Screen Readers:** Semantic HTML structure

---

## Accessibility Standards

### WCAG 2.1 AA Compliance
- **Color Contrast:** Minimum 4.5:1 ratio
- **Text Scaling:** Supports 200% zoom
- **Keyboard Navigation:** Full keyboard support
- **Screen Readers:** Semantic HTML and ARIA labels

### Semantic HTML
- **Headings:** Proper hierarchy (h1, h2, h3)
- **Links:** Descriptive text
- **Images:** Alt text for all images
- **Forms:** Labels and error states

---

## Performance Guidelines

### Loading Speed
- **Target:** < 2 seconds initial load
- **Optimization:** Minified CSS/JS
- **Images:** Optimized and compressed
- **Fonts:** System fonts for performance
- **Constants:** Centralized in `constants.js` for efficient updates

### Core Web Vitals
- **LCP:** < 2.5s (Largest Contentful Paint)
- **FID:** < 100ms (First Input Delay)
- **CLS:** < 0.1 (Cumulative Layout Shift)

---

## Future Design Considerations

### Dark/Light Mode
- **System Preference:** Respect user's choice
- **Toggle Option:** Manual override available
- **Consistent:** Maintain brand across modes

### Animation Guidelines
- **Subtle:** Enhance, don't distract
- **Purposeful:** Support user actions
- **Performance:** 60fps smooth animations
- **Reduced Motion:** Respect user preferences

### Micro-interactions
- **Loading States:** Skeleton screens
- **Success States:** Confirmation feedback
- **Error States:** Clear error messages
- **Empty States:** Helpful guidance

---

## File Organization

**Note:** This project is developed on Windows using PowerShell and Cursor IDE. All file paths use Windows backslash notation. PowerShell is available for all command-line operations including Git, npm, and other development tools.

### Project Constants
All website addresses, URLs, and domain-related constants are centralized in `constants.js`. This file contains:
- Domain constants (limebird.org, subdomains)
- Website URLs (production, development, external)
- Email configuration (SMTP, forwarding)
- DNS records (Netlify IPs, Hover servers)
- Environment settings (Windows, PowerShell, Cursor IDE)
- Project paths (Windows file system)
- Utility functions for URL validation and email generation

**Reference:** `constants.js` - Single source of truth for all website addresses

### CSS Structure
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
```
constants.js - Centralized website addresses and configuration
```

---

## Version Control

### Design Versioning
- **Major:** Significant brand changes
- **Minor:** Component updates
- **Patch:** Bug fixes and refinements

### Change Log
- **Date:** When changes were made
- **Type:** Feature, bug fix, or enhancement
- **Description:** What was changed and why
- **Impact:** How it affects the user experience

---

## Design Review Process

### Pre-Implementation
- [ ] Design mockups approved
- [ ] Accessibility review completed
- [ ] Performance considerations addressed
- [ ] Responsive design tested

### Post-Implementation
- [ ] Visual QA completed
- [ ] Cross-browser testing done
- [ ] Performance metrics met
- [ ] Accessibility audit passed

---

*Last Updated: [Current Date]*  
*Version: 1.0*  
*Next Review: [Date + 3 months]* 