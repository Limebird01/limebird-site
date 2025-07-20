# Limebird.org - Design Specification

## Project Overview

**Project Name:** Limebird.org  
**Domain:** limebird.org  
**Business Type:** Small Business Tech Support & Product Development  
**Brand Identity:** Innovation, creativity, and future digital tools  
**Development Environment:** Windows (PowerShell, Cursor IDE)  
**Terminal:** PowerShell available for command-line operations  
**Project Management:** AI-assisted markdown files for sprint planning and tasking

### Business Model
- **Tech Support Services** - Professional IT services and troubleshooting
- **Product Development** - Taskmaster ($1 Android app) + future products
- **Blog/Content Marketing** - Industry knowledge, tutorials, lead generation
- **Lead Generation** - Contact forms, service inquiries, product downloads

### Current Infrastructure
- **Domain Registrar:** Hover.com (limebird.org)
- **Hosting:** Netlify (limebirdorg.netlify.app)
- **Code Repository:** GitHub (limebird01/limebird-site)
- **Deployment:** Manual PowerShell script (deploy-simple.ps1)
- **SSL:** Let's Encrypt certificates (automatic via Netlify)
- **Project Management:** Markdown-based sprint plans and task tracking

### Subdomain Strategy
- **Production:** www.limebird.org (main site)
- **Development:** dev.limebird.org (experiments/staging)
- **Future:** blog.limebird.org

---

## Business System Architecture

### Core Business Functions
- **Tech Support Services** - Customer support, troubleshooting, IT consulting
- **Product Development** - Taskmaster ($1 Android app) + future products
- **Blog/Content Marketing** - Industry knowledge, tutorials, SEO content
- **Lead Generation** - Contact forms, service inquiries, product downloads

### System Architecture

#### Main Site (limebird.org):
- **Homepage** - Services + Products overview, value proposition
- **Services** - Tech support offerings, pricing, contact
- **Products** - Taskmaster + future products
- **About** - Company story, team, expertise
- **Contact** - Support requests, business inquiries
- **Portfolio** - Case studies, success stories

#### Product Pages:
- **Taskmaster** - Android app product page with Google Play download
- **Future Products** - Scalable product page template
- **Product Support** - Documentation, help, contact

#### Blog (blog.limebird.org):
- **Tech tutorials** - How-to guides, troubleshooting
- **Product updates** - Taskmaster features, releases
- **Industry insights** - Trends, best practices
- **Case studies** - Client success stories
- **SEO content** - Industry keywords, lead generation

### User Flows

#### Product Prospects:
1. **Homepage** → **Products** → **Taskmaster** → **Google Play Store**
2. **Blog** → **Product Tutorial** → **Taskmaster** → **Google Play Store**
3. **Search** → **Taskmaster Feature** → **Google Play Store**

#### Service Prospects:
1. **Homepage** → **Services** → **Contact Form**
2. **Blog** → **Tech Tutorial** → **Support Services**
3. **Portfolio** → **Case Study** → **Service Inquiry**

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

## Flexible Design System Architecture

### Scalable Component Library

#### Core Components (Reusable for Any Endeavor):
```jsx
// Layout components (works for anything)
<Header>                // Navigation, logo, menu
<Footer>                // Links, social, copyright
<Container>             // Content wrapper
<Grid>                  // Responsive grid system
<Section>               // Content sections

// UI components (works for anything)
<Button>                // Primary, secondary, ghost variants
<Card>                  // Content cards, product cards, blog cards
<Input>                 // Forms, search, contact
<Modal>                 // Popups, dialogs, overlays
<Icon>                  // Icon system (Heroicons + React Icons)

// Content components (works for anything)
<Hero>                  // Landing sections
<Feature>               // Feature highlights
<Testimonial>           // Reviews, testimonials
<ContactForm>           // Lead generation
<CallToAction>          // CTAs for any purpose
```

#### Specialized Components (Add as Needed):
```jsx
// Product components (when needed)
<ProductCard>           // App products, physical products, services
<ProductHero>           // Product landing pages
<AppScreenshots>        // App products
<ServiceCard>           // Service offerings

// Blog components (when needed)
<BlogPost>              // Content marketing
<BlogCard>              // Post previews
<SearchBox>             // Content search
<CategoryFilter>        // Content filtering

// Future components (unknown endeavors)
<PortfolioItem>         // Work examples
<EventCard>             // Events, webinars
<CourseCard>            // Educational content
<ToolCard>              // Online tools
```

### Flexible Design Tokens

#### Color System (Extensible):
```css
/* Primary brand colors */
--limebird-blue: #667eea
--limebird-purple: #764ba2

/* Semantic colors (add as needed) */
--success: #4CAF50
--warning: #FF9800
--error: #F44336
--info: #2196F3

/* Future color additions */
--product-primary: #new-color
--service-primary: #new-color
--event-primary: #new-color
```

#### Typography System (Scalable):
```css
/* Type scale (add new sizes as needed) */
--text-xs: 0.75rem (12px)
--text-sm: 0.875rem (14px)
--text-base: 1rem (16px)
--text-lg: 1.125rem (18px)
--text-xl: 1.25rem (20px)
--text-2xl: 1.5rem (24px)
--text-3xl: 1.875rem (30px)
--text-4xl: 2.25rem (36px)
--text-5xl: 3rem (48px)
--text-6xl: 3.75rem (60px)
/* Add new sizes: --text-7xl, --text-8xl, etc. */
```

#### Spacing System (Flexible):
```css
/* Base spacing (extensible) */
--space-1: 0.25rem (4px)
--space-2: 0.5rem (8px)
--space-4: 1rem (16px)
--space-8: 2rem (32px)
--space-16: 4rem (64px)
/* Add new spaces: --space-24, --space-32, etc. */
```

### Modular Page Templates

#### Template System:
```jsx
// Base page template
<PageTemplate>
  <Header />
  <Main>
    <Hero />
    <Content />
    <CallToAction />
  </Main>
  <Footer />
</PageTemplate>

// Specialized templates (add as needed)
<ProductPageTemplate>    // For products
<ServicePageTemplate>    // For services
<BlogPageTemplate>       // For blog posts
<LandingPageTemplate>    // For campaigns
<AboutPageTemplate>      // For company info
```

### Configuration-Driven Design

#### Theme Configuration (Extensible):
```javascript
// tailwind.config.js
module.exports = {
  content: [
    "./pages/**/*.{js,ts,jsx,tsx}",
    "./components/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        limebird: {
          50: '#f0f4ff',
          100: '#e0e9ff',
          200: '#c7d6ff',
          300: '#a4b8ff',
          400: '#7b91ff',
          500: '#667eea',
          600: '#5a6fd8',
          700: '#4b5cc7',
          800: '#3f4ba8',
          900: '#364085',
        },
        purple: {
          500: '#764ba2',
          600: '#6a4190',
          700: '#5e377e',
        }
      },
      fontFamily: {
        sans: ['-apple-system', 'BlinkMacSystemFont', 'Segoe UI', 'Roboto', 'Oxygen', 'Ubuntu', 'Cantarell', 'sans-serif'],
      },
      spacing: {
        '18': '4.5rem',
        '88': '22rem',
      },
      borderRadius: {
        'xl': '1rem',
        '2xl': '1.5rem',
      },
    },
  },
  plugins: [],
}
```

#### CSS Variables and Utility Classes:
```css
/* globals.css */
:root {
  --limebird-blue: #667eea;
  --limebird-purple: #764ba2;
  --limebird-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
}

@layer base {
  body {
    @apply bg-white text-gray-900;
  }
}

@layer components {
  .btn-primary {
    @apply bg-limebird-500 text-white px-4 py-2 rounded-lg hover:bg-limebird-600 transition-colors;
  }
  
  .card {
    @apply bg-white rounded-xl shadow-sm border border-gray-200;
  }
  
  .gradient-bg {
    @apply bg-gradient-to-r from-limebird-500 to-purple-500;
  }
}
```

---

## Implementation Setup for New Projects

### Project Initialization
```powershell
# Create new Next.js project with Tailwind CSS
npx create-next-app@latest limebird-project --typescript --tailwind --eslint

# Navigate to project
cd limebird-project

# Install core UI dependencies
npm install @heroicons/react react-icons
npm install @headlessui/react @radix-ui/react-dialog

# Initialize shadcn/ui
npx shadcn-ui@latest init
```

### shadcn/ui Component Installation
```powershell
# Install base components
npx shadcn-ui@latest add button
npx shadcn-ui@latest add card
npx shadcn-ui@latest add input
npx shadcn-ui@latest add textarea
npx shadcn-ui@latest add select
npx shadcn-ui@latest add dialog
npx shadcn-ui@latest add dropdown-menu
npx shadcn-ui@latest add navigation-menu
```

### Icon System Setup
```powershell
# Install icon libraries
npm install @heroicons/react react-icons

# Verify installation
npm list @heroicons/react react-icons
```

### Tailwind Configuration
```javascript
// tailwind.config.js
module.exports = {
  content: [
    "./pages/**/*.{js,ts,jsx,tsx}",
    "./components/**/*.{js,ts,jsx,tsx}",
    "./app/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        limebird: {
          50: '#f0f4ff',
          100: '#e0e9ff',
          200: '#c7d6ff',
          300: '#a4b8ff',
          400: '#7b91ff',
          500: '#667eea',
          600: '#5a6fd8',
          700: '#4b5cc7',
          800: '#3f4ba8',
          900: '#364085',
        },
        purple: {
          500: '#764ba2',
          600: '#6a4190',
          700: '#5e377e',
        }
      },
      fontFamily: {
        sans: ['-apple-system', 'BlinkMacSystemFont', 'Segoe UI', 'Roboto', 'Oxygen', 'Ubuntu', 'Cantarell', 'sans-serif'],
      },
      spacing: {
        '18': '4.5rem',
        '88': '22rem',
      },
      borderRadius: {
        'xl': '1rem',
        '2xl': '1.5rem',
      },
    },
  },
  plugins: [],
}
```

### CSS Setup
```css
/* globals.css */
@tailwind base;
@tailwind components;
@tailwind utilities;

:root {
  --limebird-blue: #667eea;
  --limebird-purple: #764ba2;
  --limebird-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
}

@layer base {
  body {
    @apply bg-white text-gray-900;
  }
}

@layer components {
  .btn-primary {
    @apply bg-limebird-500 text-white px-4 py-2 rounded-lg hover:bg-limebird-600 transition-colors;
  }
  
  .card {
    @apply bg-white rounded-xl shadow-sm border border-gray-200;
  }
  
  .gradient-bg {
    @apply bg-gradient-to-r from-limebird-500 to-purple-500;
  }
}
```

### Component Import Examples
```jsx
// Import shadcn/ui components
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardDescription, CardFooter, CardHeader, CardTitle } from "@/components/ui/card"
import { Input } from "@/components/ui/input"
import { Textarea } from "@/components/ui/textarea"
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select"

// Import Heroicons
import { HomeIcon, UserIcon, EnvelopeIcon } from '@heroicons/react/24/outline'
import { MagnifyingGlassIcon, BellIcon, CogIcon } from '@heroicons/react/24/outline'
import { PlusIcon, MinusIcon, XMarkIcon } from '@heroicons/react/24/outline'

// Import React Icons
import { FiGithub, FiTwitter, FiLinkedin } from 'react-icons/fi'
import { SiNextdotjs, SiReact, SiTailwindcss } from 'react-icons/si'
import { FiMail, FiPhone, FiMapPin } from 'react-icons/fi'
```

### Usage Examples
```jsx
// Button with icon
<Button>
  <HomeIcon className="h-4 w-4 mr-2" />
  Home
</Button>

// Card with content
<Card>
  <CardHeader>
    <CardTitle>Card Title</CardTitle>
    <CardDescription>Card description</CardDescription>
  </CardHeader>
  <CardContent>
    <p>Card content goes here</p>
  </CardContent>
  <CardFooter>
    <Button>Action</Button>
  </CardFooter>
</Card>

// Form with inputs
<div className="space-y-4">
  <Input placeholder="Enter your name" />
  <Textarea placeholder="Enter description" />
  <Select>
    <SelectTrigger>
      <SelectValue placeholder="Select option" />
    </SelectTrigger>
    <SelectContent>
      <SelectItem value="option1">Option 1</SelectItem>
      <SelectItem value="option2">Option 2</SelectItem>
    </SelectContent>
  </Select>
</div>
```

### Project Structure
```
limebird-project/
├── components/
│   ├── ui/                    # shadcn/ui components
│   │   ├── button.tsx
│   │   ├── card.tsx
│   │   ├── input.tsx
│   │   └── ...
│   ├── layout/                # Layout components
│   │   ├── Header.tsx
│   │   ├── Footer.tsx
│   │   └── Layout.tsx
│   └── business/              # Business-specific components
│       ├── ProductCard.tsx
│       ├── ServiceCard.tsx
│       └── BlogCard.tsx
├── app/                       # Next.js 13+ app directory
│   ├── page.tsx
│   ├── layout.tsx
│   └── globals.css
├── lib/                       # Utility functions
│   └── utils.ts
├── tailwind.config.js
├── components.json            # shadcn/ui configuration
└── package.json
```

### Verification Commands
```powershell
# Check if all dependencies are installed
npm list @heroicons/react react-icons @headlessui/react @radix-ui/react-dialog

# Verify shadcn/ui components
Get-ChildItem components/ui/

# Test build
npm run build

# Start development
npm run dev
```

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

### Base Components (shadcn/ui)

#### Button Variants:
```jsx
<Button variant="default">Default</Button>
<Button variant="outline">Outline</Button>
<Button variant="ghost">Ghost</Button>
<Button variant="link">Link</Button>
```

#### Card Component:
```jsx
<Card>
  <CardHeader>
    <CardTitle>Card Title</CardTitle>
    <CardDescription>Card description</CardDescription>
  </CardHeader>
  <CardContent>Card content</CardContent>
  <CardFooter>Card footer</CardFooter>
</Card>
```

#### Form Components:
```jsx
<Input placeholder="Enter text" />
<Textarea placeholder="Enter description" />
<Select>
  <SelectTrigger>
    <SelectValue placeholder="Select option" />
  </SelectTrigger>
  <SelectContent>
    <SelectItem value="option1">Option 1</SelectItem>
    <SelectItem value="option2">Option 2</SelectItem>
  </SelectContent>
</Select>
```

### Navigation Components

#### Header Component:
```jsx
<Header>
  <Logo />
  <Navigation>
    <NavItem href="/">Home</NavItem>
    <NavItem href="/about">About</NavItem>
    <NavItem href="/blog">Blog</NavItem>
  </Navigation>
  <UserMenu />
</Header>
```

#### Footer Component:
```jsx
<Footer>
  <FooterContent>
    <FooterSection>
      <FooterTitle>Limebird</FooterTitle>
      <FooterDescription>Innovation and creativity</FooterDescription>
    </FooterSection>
    <FooterSection>
      <FooterTitle>Links</FooterTitle>
      <FooterLink href="/">Home</FooterLink>
      <FooterLink href="/blog">Blog</FooterLink>
    </FooterSection>
  </FooterContent>
  <FooterBottom>
    <FooterCopyright>© 2025 Limebird. All rights reserved.</FooterCopyright>
  </FooterBottom>
</Footer>
```

### Layout System

#### Container System:
```jsx
// Main container
<Container>
  <Header />
  <Main>
    <PageContent />
  </Main>
  <Footer />
</Container>

// Content containers
<ContentContainer>
  <ContentSection>
    <ContentTitle>Section Title</ContentTitle>
    <ContentBody>Section content...</ContentBody>
  </ContentSection>
</ContentContainer>
```

#### Grid System:
```jsx
// Responsive grid
<Grid>
  <GridItem className="col-span-12 md:col-span-6 lg:col-span-4">
    <Card>Content 1</Card>
  </GridItem>
  <GridItem className="col-span-12 md:col-span-6 lg:col-span-4">
    <Card>Content 2</Card>
  </GridItem>
  <GridItem className="col-span-12 md:col-span-6 lg:col-span-4">
    <Card>Content 3</Card>
  </GridItem>
</Grid>
```

### Icon System

#### Primary Icons (Heroicons):
```jsx
// Navigation icons
import { HomeIcon, UserIcon, EnvelopeIcon } from '@heroicons/react/24/outline'

// UI icons
import { MagnifyingGlassIcon, BellIcon, CogIcon } from '@heroicons/react/24/outline'

// Action icons
import { PlusIcon, MinusIcon, XMarkIcon } from '@heroicons/react/24/outline'
```

#### Supplementary Icons (React Icons):
```jsx
// Social media icons
import { FiGithub, FiTwitter, FiLinkedin } from 'react-icons/fi'

// Tech logos
import { SiNextdotjs, SiReact, SiTailwindcss } from 'react-icons/si'

// Brand icons
import { FiMail, FiPhone, FiMapPin } from 'react-icons/fi'
```

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

## Business-Specific Components

### Product Components (Taskmaster)
```jsx
// Taskmaster product page components
<ProductHero>           // App name, tagline, $1 price
<AppScreenshots>        // Android screenshots
<AppFeatures>           // Key features list
<GooglePlayButton>      // Direct link to Google Play Store
<AppDescription>        // What it does, who it's for
<SupportLink>           // Contact for app support
```

### Service Components (Tech Support)
```jsx
// Tech support service components
<ServiceCard>           // Service offerings
<ContactForm>           // Lead generation
<TestimonialCard>       // Client testimonials
<PortfolioItem>         // Case studies
<FAQSection>            // Common questions
<CallToAction>          // Service inquiries
```

### Blog Components (Content Marketing)
```jsx
// Blog post card
<BlogCard>
  <BlogImage src="/post-image.jpg" alt="Post title" />
  <BlogContent>
    <BlogTitle>Post Title</BlogTitle>
    <BlogExcerpt>Post excerpt...</BlogExcerpt>
    <BlogMeta>
      <BlogDate>January 20, 2025</BlogDate>
      <BlogCategory>Technology</BlogCategory>
    </BlogMeta>
  </BlogContent>
</BlogCard>

// Search component
<SearchBox>
  <SearchInput placeholder="Search posts..." />
  <SearchButton>
    <SearchIcon className="h-4 w-4" />
  </SearchButton>
</SearchBox>

// Category filter
<CategoryFilter>
  <CategoryButton active>All</CategoryButton>
  <CategoryButton>Technology</CategoryButton>
  <CategoryButton>Design</CategoryButton>
</CategoryFilter>
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
- **DR-052 Secondary:** "Tech Support & Product Development" (Business)
- **DR-053 Tertiary:** Description of services and products
- **DR-054 Call-to-Action:** Contact information and downloads

### Content Structure
- **DR-055 Hero Section:** Brand + business value proposition
- **DR-056 Services Section:** Tech support offerings
- **DR-057 Products Section:** Taskmaster and future products
- **DR-058 Contact Section:** Call-to-action

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

### Development Environment
- **DR-096 URL:** https://dev--limebirdorg.netlify.app/
- **DR-097 Branch:** dev
- **DR-098 Deployment:** Manual via deploy-dev.ps1
- **DR-099 Purpose:** Testing and development work

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

## Project Management Strategy

### AI-Assisted Sprint Planning
- **DR-161 Sprint Planning:** AI-assisted creation of detailed sprint plans in markdown format
- **DR-162 Task Management:** Markdown-based task tracking with checkboxes and progress indicators
- **DR-163 Defect Logging:** Centralized defect tracking in markdown files with systematic categorization
- **DR-164 Sprint Documentation:** Comprehensive sprint plans with timelines, objectives, and success criteria
- **DR-165 Backlog Management:** AI-assisted backlog creation and prioritization in markdown format

### Sprint Planning Process
- **DR-166 Sprint Duration:** 2-week sprints for focused development cycles
- **DR-167 Sprint Goals:** Clear objectives with measurable success criteria
- **DR-168 Task Breakdown:** Detailed task lists with time estimates and dependencies
- **DR-169 Progress Tracking:** Checkbox-based progress monitoring throughout sprint
- **DR-170 Sprint Review:** End-of-sprint documentation and lessons learned

### Task Management Approach
- **DR-171 Markdown Format:** All tasks documented in markdown files for version control
- **DR-172 AI Assistance:** AI helps create, organize, and prioritize tasks
- **DR-173 Defect Tracking:** Systematic defect logging with categories and resolution status
- **DR-174 Sprint Backlog:** AI-assisted backlog creation for future sprints
- **DR-175 Documentation:** Comprehensive documentation of all project activities

### Current Sprint Focus
- **DR-176 Design System:** Flexible component library for all business needs
- **DR-177 Product Development:** Taskmaster app and future products
- **DR-178 Service System:** Tech support services and lead generation
- **DR-179 Blog System:** Content marketing and SEO optimization

---

## Automated Testing Strategy

### Automated Testing Tools
- **DR-180 Unit Testing:** React Testing Library for component testing
- **DR-181 E2E Testing:** Cypress for critical user flows
- **DR-182 Performance Testing:** Lighthouse CI for automated performance audits
- **DR-183 Accessibility Testing:** axe-core for automated accessibility checks
- **DR-184 Visual Testing:** Percy for automated visual regression testing

### Automated Quality Gates
- **DR-185 Build Validation:** Automated build and deployment validation
- **DR-186 Code Quality:** ESLint and Prettier for automated code formatting
- **DR-187 Type Safety:** TypeScript for automated type checking
- **DR-188 Bundle Analysis:** Webpack bundle analyzer for automated size monitoring
- **DR-189 Security Scanning:** Automated dependency vulnerability scanning

### Minimal Manual Testing
- **DR-190 Critical Paths:** Only essential user journeys require manual verification
- **DR-191 Edge Cases:** Automated tools handle most edge case detection
- **DR-192 Cross-browser:** Automated browser testing with Playwright
- **DR-193 Mobile Testing:** Automated responsive design validation
- **DR-194 Performance Monitoring:** Automated Core Web Vitals tracking

---

## Business Metrics & Success Criteria

### Technical Metrics
- **DR-195 Page Load Time:** < 2 seconds for all pages
- **DR-196 Lighthouse Score:** > 90 (Performance, Accessibility, Best Practices, SEO)
- **DR-197 Mobile Usability:** 100% functional on mobile devices
- **DR-198 Cross-browser Compatibility:** 100% on major browsers

### Business Metrics
- **DR-199 Lead Generation:** Contact form submissions and conversions
- **DR-200 Product Downloads:** Google Play Store clicks for Taskmaster
- **DR-201 Content Engagement:** Blog read time and social shares
- **DR-202 Service Discovery:** Service page views and inquiries

### User Experience Metrics
- **DR-203 Navigation Time:** < 3 seconds to find desired information
- **DR-204 Search Response:** < 500ms for blog search functionality
- **DR-205 Contact Conversion:** < 3 clicks to submit contact form
- **DR-206 Product Discovery:** Clear path from homepage to product pages

### Development Metrics
- **DR-207 Component Reusability:** > 80%
- **DR-208 Code Coverage:** > 90%
- **DR-209 Build Time:** < 30 seconds
- **DR-210 Deployment Time:** < 5 minutes

---

*Last Updated: January 20, 2025*  
*Version: 2.0*  
*Next Review: February 20, 2025* 