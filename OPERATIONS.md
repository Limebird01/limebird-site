# OPERATIONS.md

## Limebird.org — Owner’s Operational Guide

This document is a practical, living guide for using, updating, and managing the Limebird.org site. It is designed for site owners and contributors who want to understand the real workflow for making changes, adding content, updating features, and deploying the site.

---

## 1. Day-to-Day Operations

### A. Viewing and Using the Site
- **Production:** Visit https://limebird.org (after deployment).
- **Dev/Test:** Visit https://dev--limebirdorg.netlify.app/ for testing changes before they go live.

### B. Logging In and Managing Content
- **Login:** Use the login page (usually `/login`) with your credentials.
- **Dashboard:** Access your user dashboard for profile, billing, and content management.
- **Blog/Docs:** View and manage blog posts and documentation via the dashboard or by editing files in `content/blog/`, `content/docs/`, and `content/guides/`.

---

## 2. Making Changes to the Site

### A. Content Changes (Blog Posts, Docs, Guides)
1. **Edit or add MDX files** in:
   - `content/blog/` for blog posts
   - `content/docs/` for documentation
   - `content/guides/` for guides
2. **Commit and push your changes** to the `dev` branch.
3. **Deploy to dev** using `deploy-dev.ps1` and review on the dev site.
4. **When satisfied, merge to `main` and deploy to production** using `deploy-simple.ps1`.

### B. Visual/Design Changes
1. **Edit components** in `components/` or update styles in `styles/`.
2. **Test locally** (`dev-server.ps1`), then follow the same deploy workflow as above.

### C. Adding Features or Fixing Bugs
1. **Create a new feature or hotfix branch**:
   ```powershell
   git checkout -b feature/my-new-feature
   ```
2. **Make your changes** (code, config, etc.).
3. **Test locally and in dev**.
4. **Merge to `dev` for further testing, then to `main` for production**.

---

## 3. Workflow & Best Practices

### A. Standard Workflow
1. **Start on the `dev` branch** (or a feature branch).
2. **Make and test changes locally**.
3. **Push to GitHub** and deploy to the dev environment.
4. **Review and test on the dev site**.
5. **Merge to `main` and deploy to production** only after full testing.

### B. Deployment
- **Always use the provided PowerShell scripts** (`deploy-dev.ps1`, `deploy-simple.ps1`).
- **Never deploy untested code to production.**
- **Check `deployment.log` for deployment history and errors.**

### C. Content Management
- **All content is file-based** (MDX). No CMS is set up by default.
- **To add or edit content:**  
  Open the relevant `.mdx` file, edit, save, commit, and deploy.

### D. Customization
- **Branding:**  
  When ready, update `[TO BE DEFINED]` in `CONOPS.md`, `styles/`, and `config/site.ts`.
- **Component Library:**  
  Add or modify components in `components/` as your business needs evolve.

---

## 4. Common Scenarios

### A. Add a New Blog Post
1. Create a new `.mdx` file in `content/blog/`.
2. Write your post using Markdown/MDX.
3. Commit, push, and deploy to dev for review.
4. Merge to main and deploy to production.

### B. Update Site Text or Images
1. Edit the relevant MDX, component, or image file.
2. Test locally and in dev.
3. Deploy as above.

### C. Change Pricing or Service Info
1. Update the relevant content file or component.
2. Test and deploy as above.

---

## 5. Evolving This Guide
- This document is a starting point. As you develop your own workflows and practices, update this file.
- When your operational practices are stable, consider updating `CONOPS.md` to reflect them for long-term reference. 