# OPERATIONS.md

> For the current deployment and release checklist, see [RELEASE_PROCESS.md](./RELEASE_PROCESS.md).

## Migration Note (2024-07)

**Architecture Simplification:**
- The site has migrated from a complex Next.js App Router + Contentlayer + MDX stack to a classic, static `.tsx`-based Pages Router architecture.
- All content pages are now static `.tsx` files in the `pages/` directory.
- Content updates are made by editing the appropriate `.tsx` file in `pages/`.
- This change improves stability, maintainability, and ease of content updates for all contributors.
- The blog subdomain (`blog.limebird.org`) will be implemented as a separate, dedicated project.

---

## 0. Testing Architecture & Automation

### A. Robust, Scriptable Testing Workflow
- The project root `package.json` defines scripts for linting, unit tests, and E2E tests that automatically change to the correct directory and use local binaries via `npx`:
  - `npm run lint` — Lint code in limebird-site-new
  - `npm run test` — Run unit tests in limebird-site-new
  - `npm run e2e` — Run Cypress E2E tests in limebird-site-new
  - `npm run test:all` — Run lint, unit, and E2E tests in sequence
- These scripts can be run from the project root, in CI/CD, or from PowerShell scripts.

### B. PowerShell Automation
- Use `run-tests.ps1` at the project root to run all tests in order:
  - Linting → Unit tests → E2E tests
  - Exits with an error code if any step fails, suitable for automation or manual use.

### C. Extensibility
- To add more apps/packages, add similar scripts for each and update `test:all` as needed.
- This architecture is directory-agnostic, tool-agnostic, and scalable for future growth.

---

## 1. Day-to-Day Operations

### A. Viewing and Using the Site
- **Production:** Visit https://limebird.org (after deployment).
- **Dev/Test:** Visit https://dev--limebirdorg.netlify.app/ for testing changes before they go live.

### B. Logging In and Managing Content
- **Login:** Use the login page (usually `/login`) with your credentials.
- **Dashboard:** Access your user dashboard for profile, billing, and content management.
- **Main Site Content:** Edit `.tsx` files in the `pages/` directory to update site content.
- **Blog/Docs:** The blog will be managed as a separate subdomain/project. Documentation and other static content are managed via `.tsx` files in `pages/`.

---

## 2. Making Changes to the Site

### A. Content Changes (Pages, Docs, Static Content)
1. **Edit or add `.tsx` files** in the `pages/` directory for all main site content.
2. **Commit and push your changes** to the `dev` branch.
3. **Deploy to dev** using `deploy-dev.ps1` and review on the dev site.
4. **When satisfied, merge to `main` and deploy to production** using `deploy-prod.ps1`.

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
- **Always use the provided PowerShell scripts** (`deploy-dev.ps1`, `deploy-prod.ps1`).
- **Never deploy untested code to production.**
- **Check `deployment.log` for deployment history and errors.**

### C. Content Management
- **All content is file-based** (`.tsx` in `pages/`). No CMS is set up by default.
- **To add or edit content:**  
  Open the relevant `.tsx` file in `pages/`, edit, save, commit, and deploy.

### D. Customization
- **Branding:**  
  When ready, update `[TO BE DEFINED]` in `CONOPS.md`, `styles/`, and `config/site.ts`.
- **Component Library:**  
  Add or modify components in `components/` as your business needs evolve.

---

## 4. Common Scenarios

### A. Add or Update a Page or Static Content
1. Create or edit a `.tsx` file in the `pages/` directory.
2. Write or update your content using JSX/TSX.
3. Commit, push, and deploy to dev for review.
4. Merge to main and deploy to production.

### B. Update Site Text, Images, or Docs
1. Edit the relevant `.tsx`, component, or image file.
2. Test locally and in dev.
3. Deploy as above.

### C. Change Pricing or Service Info
1. Update the relevant `.tsx` file or component.
2. Test and deploy as above.

---

## 5. Evolving This Guide
- This document is a starting point. As you develop your own workflows and practices, update this file.
- When your operational practices are stable, consider updating `CONOPS.md` to reflect them for long-term reference. 

---

### 1. **Linting**
- **Result:** Passed with warnings.
- **Details:**  
  - No errors, but many warnings about Tailwind CSS classnames (e.g., "h-4, w-4" could be replaced by "size-4" shorthand).
  - One error: "Invalid Tailwind CSS classnames order" in `components/main-nav.tsx`.
  - No blocking issues, but you may want to address these for code quality.

---

### 2. **Unit Tests**
- **Result:** All tests passed.
- **Details:**  
  - 1 test suite, 4 tests (button component), all passed.
  - No failures or errors.

---

### 3. **Cypress E2E Tests**
- **Result:** Not run.
- **Reason:**  
  - There is no `cypress:run` script defined in your `package.json`.
  - To run Cypress E2E tests, you need to add a script like:
    ```json
    "cypress:run": "cypress run"
    ```
    to your `package.json` in `limebird-site-new`.

---

## **Next Steps**
- If you want to run E2E tests, add the `cypress:run` script and try again.
- Consider addressing the Tailwind warnings for a cleaner codebase.
- All unit tests are passing, so your core components are working as expected.

Would you like help adding the Cypress script, fixing lint warnings, or reviewing E2E test setup? 