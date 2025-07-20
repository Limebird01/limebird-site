# 🚀 **Sprint: Blog Subdomain with Next.js**

## 📋 **Sprint Overview**

**Goal:** Create a blog subdomain (blog.limebird.org) using Next.js with a dedicated Git branch for independent development and deployment.

**Duration:** 2 weeks  
**Team:** Solo developer  
**Technology:** Next.js, React, Markdown, Netlify, PowerShell  
**Project Management:** AI-assisted markdown files for sprint planning and tasking

---

## 🎯 **Sprint Objectives**

### **✅ Primary Goals:**
1. **Set up Next.js blog project** with proper structure
2. **Configure blog subdomain** and DNS settings
3. **Create Git branch workflow** for blog development
4. **Implement blog features** (posts, categories, search)
5. **Deploy to blog.limebird.org** via Netlify

### **✅ Success Criteria:**
- [ ] Blog accessible at blog.limebird.org
- [ ] Blog posts display correctly with markdown
- [ ] Search functionality works
- [ ] Responsive design matches main site
- [ ] Independent deployment from main site

---

## 📅 **Sprint Timeline**

### **Week 1: Foundation & Setup**

#### **Day 1-2: Project Setup**
- [ ] **Create Next.js blog project**
- [ ] **Set up Git repository structure**
- [ ] **Configure development environment**
- [ ] **Plan file structure and architecture**

#### **Day 3-4: Domain & Deployment**
- [ ] **Configure blog subdomain DNS**
- [ ] **Set up Netlify deployment**
- [ ] **Create PowerShell deployment scripts**
- [ ] **Test deployment workflow**

#### **Day 5-7: Core Features**
- [ ] **Implement blog post rendering**
- [ ] **Create blog listing page**
- [ ] **Add markdown support**
- [ ] **Style blog to match main site**

### **Week 2: Features & Polish**

#### **Day 8-10: Enhanced Features**
- [ ] **Add search functionality**
- [ ] **Implement category filtering**
- [ ] **Create RSS feed**
- [ ] **Add pagination**

#### **Day 11-12: Integration & Testing**
- [ ] **Link blog to main site**
- [ ] **Test responsive design**
- [ ] **Performance optimization**
- [ ] **Cross-browser testing**

#### **Day 13-14: Launch Preparation**
- [ ] **Content creation (sample posts)**
- [ ] **SEO optimization**
- [ ] **Final testing and bug fixes**
- [ ] **Documentation and handoff**

---

## 🛠️ **Technical Architecture**

### **✅ Design System First Approach:**
```
dev.limebird.org → limebird.org → blog.limebird.org
```

### **✅ Repository Structure:**
```
limebird-site/
├── main branch          → Main site (limebird.org)
├── dev branch           → Dev site (dev.limebird.org) 🚀 **DESIGN SYSTEM TESTING**
└── blog branch          → Blog site (blog.limebird.org)
    ├── pages/
    │   ├── index.js     → Blog listing
    │   ├── [slug].js    → Individual posts
    │   └── api/
    │       └── search.js → Search API
    ├── posts/            → Markdown files
    ├── components/       → Shared design system components
    ├── styles/           → Tailwind + custom CSS
    └── lib/              → Utility functions
```

### **✅ Design System Components:**
- **shadcn/ui** - Base components (Button, Card, Input, etc.)
- **Heroicons** - Primary icon system
- **React Icons** - Supplementary icons (social, tech logos)
- **Custom Tailwind config** - Limebird brand colors and spacing
- **Shared components** - Header, Footer, Navigation, Layout

### **✅ DNS Configuration:**
```
Hover DNS Records:
├── CNAME blog.limebird.org → limebirdorg.netlify.app
└── SSL Certificate → Automatic via Netlify
```

### **✅ Deployment Workflow:**
```
Development → Git Push → Netlify Build → blog.limebird.org
```

---

## 📋 **Detailed Tasks**

### **Phase 1: Project Setup (Days 1-2)**

#### **Task 1.1: Create Next.js Project**
- [ ] Run `npx create-next-app@latest limebird-blog`
- [ ] Configure TypeScript and Tailwind CSS
- [ ] Set up ESLint and Prettier
- [ ] Create initial file structure

#### **Task 1.2: Git Branch Setup**
- [ ] Create `blog` branch from main
- [ ] Set up branch protection rules
- [ ] Configure branch-specific deployment
- [ ] Test branch workflow

#### **Task 1.3: Project Configuration**
- [ ] Configure `next.config.js`
- [ ] Set up environment variables
- [ ] Configure build settings
- [ ] Set up development scripts

### **Phase 2: Domain & Deployment (Days 3-4)**

#### **Task 2.1: DNS Configuration**
- [ ] Add CNAME record for blog.limebird.org
- [ ] Configure SSL certificate
- [ ] Test domain resolution
- [ ] Set up redirects if needed

#### **Task 2.2: Netlify Setup**
- [ ] Connect blog branch to Netlify
- [ ] Configure build settings
- [ ] Set up custom domain
- [ ] Test deployment pipeline

#### **Task 2.3: Deployment Scripts**
- [ ] Create `deploy-blog.ps1` script
- [ ] Add logging and error handling
- [ ] Test deployment workflow
- [ ] Document deployment process

### **Phase 3: Core Features (Days 5-7)**

#### **Task 3.1: Blog Post System**
- [ ] Create markdown parser
- [ ] Implement post rendering
- [ ] Add front matter support
- [ ] Create post templates

#### **Task 3.2: Blog Listing**
- [ ] Create blog index page
- [ ] Implement post listing
- [ ] Add post metadata display
- [ ] Style blog listing

#### **Task 3.3: Design Integration**
- [ ] Apply main site design system
- [ ] Create blog-specific styles
- [ ] Ensure responsive design
- [ ] Match brand colors and typography

### **Phase 4: Enhanced Features (Days 8-10)**

#### **Task 4.1: Search Functionality**
- [ ] Create search API endpoint
- [ ] Implement client-side search
- [ ] Add search results display
- [ ] Style search interface

#### **Task 4.2: Category System**
- [ ] Implement tag/category system
- [ ] Create category filtering
- [ ] Add category pages
- [ ] Style category interface

#### **Task 4.3: RSS Feed**
- [ ] Generate RSS feed
- [ ] Add RSS endpoint
- [ ] Include feed link in blog
- [ ] Test RSS functionality

### **Phase 5: Integration & Testing (Days 11-12)**

#### **Task 5.1: Main Site Integration**
- [ ] Add blog link to main site
- [ ] Create navigation between sites
- [ ] Ensure consistent branding
- [ ] Test cross-site navigation

#### **Task 5.2: Testing & Optimization**
- [ ] Cross-browser testing
- [ ] Mobile responsiveness testing
- [ ] Performance optimization
- [ ] Accessibility testing

### **Phase 6: Launch Preparation (Days 13-14)**

#### **Task 6.1: Content Creation**
- [ ] Create sample blog posts
- [ ] Write about section
- [ ] Add meta descriptions
- [ ] Create author profile

#### **Task 6.2: SEO & Analytics**
- [ ] Add meta tags
- [ ] Configure Google Analytics
- [ ] Set up sitemap
- [ ] Add structured data

#### **Task 6.3: Final Testing**
- [ ] End-to-end testing
- [ ] Performance testing
- [ ] Security review
- [ ] Documentation update

---

## 📊 **Progress Tracking**

### **✅ Sprint Progress:**
- **Week 1:** 0/7 days completed
- **Week 2:** 0/7 days completed
- **Overall:** 0/14 days completed

### **✅ Task Completion:**
- **Phase 1:** 0/12 tasks completed
- **Phase 2:** 0/12 tasks completed
- **Phase 3:** 0/12 tasks completed
- **Phase 4:** 0/12 tasks completed
- **Phase 5:** 0/8 tasks completed
- **Phase 6:** 0/12 tasks completed

### **✅ Defect Tracking:**
- **Open Defects:** 0
- **Resolved Defects:** 0
- **Total Defects:** 0

---

## 🎯 **Success Metrics**

### **✅ Technical Metrics:**
- [ ] Blog loads in < 2 seconds
- [ ] Search responds in < 500ms
- [ ] Mobile responsive design
- [ ] WCAG 2.1 AA compliance
- [ ] SEO score > 90

### **✅ User Experience Metrics:**
- [ ] Intuitive navigation
- [ ] Clear content hierarchy
- [ ] Consistent branding
- [ ] Fast page transitions
- [ ] Accessible to all users

### **✅ Development Metrics:**
- [ ] Independent deployment workflow
- [ ] Clean code structure
- [ ] Comprehensive documentation
- [ ] Version control best practices
- [ ] Automated testing coverage

---

## 📝 **Sprint Notes**

### **✅ AI-Assisted Planning:**
This sprint plan was created using AI-assisted markdown file management, following our project management strategy of using markdown files for all sprint planning and task tracking.

### **✅ Documentation Strategy:**
All sprint progress, defects, and lessons learned will be documented in markdown files for version control and easy reference.

### **✅ Future Planning:**
After this sprint, we'll use AI assistance to plan the next sprint based on backlog items and project priorities.

---

*Sprint Created: January 2025*  
*Project Management: AI-assisted markdown files*  
*Next Review: End of sprint* 