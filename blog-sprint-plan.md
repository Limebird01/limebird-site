# Sprint Plan: Expanding Limebird.org from Minimal Template to Full Business Site

## Overview
This sprint plan outlines a phased, testable approach to evolve the current minimal site template into a robust, production-ready business website. Each phase includes clear deliverables, checklists, and is designed to be actionable and trackable.

---

## Phase 1: Foundation & Navigation
- Review and finalize site navigation (main nav, footer)
- Create placeholder pages for all key sections (Services, Products, About, Contact, Blog, Dashboard, Docs, Pricing, etc.)
- Ensure all navigation links work and route correctly
- Add basic content/headers to each page

**Checklist:**
- [ ] All nav links route to correct pages
- [ ] Placeholder pages exist for all sections
- [ ] Footer is present and consistent
- [ ] Site builds and deploys successfully

### Phase 1 Detailed Checklist:

#### **Main Navigation Structure:**
- [x] Home (`/`) - Landing/marketing page
- [x] Services (`/services`) - Tech support offerings
- [x] Products (`/products`) - Taskmaster and future products
- [x] Blog (`/blog`) - Company blog and updates
- [x] Docs (`/docs`) - Documentation and guides
- [x] About (`/about`) - Company info and team
- [x] Contact (`/contact`) - Contact form and business inquiries
- [x] Dashboard (`/dashboard`) - Admin dashboard (login required)
- [x] Pricing (`/pricing`) - Service/product pricing
- [x] Terms (`/terms`) - Terms of Service
- [x] Privacy (`/privacy`) - Privacy Policy

#### **Page Creation Tasks:**
- [x] Create placeholder page for Services (`/services`)
- [x] Create placeholder page for Products (`/products`)
- [x] Create placeholder page for Blog (`/blog`)
- [x] Create placeholder page for Docs (`/docs`)
- [x] Create placeholder page for About (`/about`)
- [x] Create placeholder page for Contact (`/contact`)
- [x] Create placeholder page for Pricing (`/pricing`)
- [x] Create placeholder page for Terms (`/terms`)
- [x] Create placeholder page for Privacy (`/privacy`)
- [x] Update main navigation component to include all links
- [x] Update footer navigation to include key links
- [x] Test all navigation links route correctly
- [x] Verify site builds without errors
- [ ] Test mobile navigation on different screen sizes
- [ ] Verify mobile menu opens and closes correctly
- [ ] Test all mobile navigation links work
- [ ] Test mobile navigation on actual mobile devices
- [ ] Deploy to dev environment and test all pages

#### **Content Placeholders:**
- [x] Add basic headers to all placeholder pages
- [x] Add "Coming Soon" or placeholder content
- [x] Ensure consistent layout across all pages
- [x] Add basic SEO metadata to all pages

---

## Phase 2: Content & Marketing Pages
- Flesh out Services, Products, About, and Contact pages with real content
- Add business descriptions, offerings, and contact form (admin email only)
- Add legal pages (Terms, Privacy) with boilerplate content

**Checklist:**
- [ ] Services page describes offerings
- [ ] Products page lists products (e.g., Taskmaster)
- [ ] About page has company info
- [ ] Contact form submits to admin email
- [ ] Terms and Privacy pages present
- [ ] All content proofread and accurate

---

## Phase 3: Admin Dashboard & Content Management
- Enable admin-only login and dashboard access
- Implement content editor for blog posts (admin only)
- Add ability to create, edit, and delete posts (admin only)

**Checklist:**
- [ ] Admin login works (only owner/editor can access)
- [ ] Dashboard page accessible after login
- [ ] Blog post editor functional
- [ ] Posts can be created, edited, deleted
- [ ] All changes reflected on the public blog (if enabled)

---

## Phase 4: Blog & Documentation System
- Build out public blog listing and post pages (read-only for public)
- Add documentation/guides section (read-only for public)
- Ensure SEO and metadata for blog/docs

**Checklist:**
- [ ] Blog index and post pages display content
- [ ] Docs/guides section accessible
- [ ] SEO metadata present for blog/docs
- [ ] Blog/docs content is searchable (optional)

---

## Phase 5: Business Features & Integrations
- Add billing (Stripe) integration (admin only, for future customer use)
- Add analytics and monitoring (admin dashboard)
- Prepare for future customer account support (keep registration disabled for now)

**Checklist:**
- [ ] Stripe integration present (test mode)
- [ ] Analytics visible in admin dashboard
- [ ] Customer registration remains disabled
- [ ] All business features documented

---

## Phase 6: Polish, Testing, and Launch Readiness
- Review accessibility, performance, and cross-browser compatibility
- Add automated tests (unit, E2E) for all critical flows
- Finalize documentation (CONOPS, README, DEPLOYMENT_GUIDE)
- Prepare for production launch

**Checklist:**
- [ ] Accessibility audit complete
- [ ] Performance meets targets
- [ ] All tests pass (unit, E2E)
- [ ] Documentation up to date
- [ ] Production deploy checklist complete

---

## Summary
- This plan enables a gradual, low-risk expansion from a minimal template to a full-featured business site.
- Each phase is self-contained and testable, with clear checklists for tracking progress.
- The approach supports admin-only access initially, with flexibility to expand to customer-facing features in the future.
- Use this plan as a living document—update checklists and deliverables as the project evolves.

--- 

---

## Build Status and Upgrade Rationale (2024-07-23)

- The project builds and compiles successfully on Next.js 14.x, with only minor linter warnings and no fatal errors or type issues.
- Previous attempts to upgrade to Next.js 15.x resulted in a build-blocking type generation bug for dynamic routes, which is not present in 14.x.
- **Rationale:** Remain on Next.js 14.x for stability and maintainability until the type generation bug in 15.x is resolved upstream. This decision should be referenced for any future upgrade considerations.

--- 

### New Sprint Tasks (2024-07-24)

- Implement full output logging for all test tools in build and deploy scripts (capture stdout/stderr to log files, add section headers, document log locations).
- Always run test suites/scripts in the foreground or log output to files.
- Improve cleanup-dev.ps1 reliability: add timeouts, robust try/catch, always call summary/exit, never kill self, forced exit at end. 