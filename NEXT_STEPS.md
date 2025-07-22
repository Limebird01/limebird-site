# Next Steps: Promoting to Dev Environment

This checklist outlines the immediate actions required to safely promote the current codebase to the development environment (`dev.limebird.org`).

---

## 1. Pre-Flight Checks

- [ ] **Ensure you are on the `dev` branch:**
  ```powershell
  git checkout dev
  git pull
  ```
- [ ] **Commit and push all changes:**
  ```powershell
  git status
  git add .
  git commit -m "Describe your changes"
  git push
  ```
- [ ] **Install dependencies (if needed):**
  ```powershell
  cd limebird-site-new
  npm install
  ```
- [ ] **Run linting:**
  ```powershell
  npm run lint
  ```
- [ ] **Run unit tests:**
  ```powershell
  npm test
  ```
- [ ] **Run E2E tests:**
  ```powershell
  npm run cypress:run
  ```
- [ ] **Check environment variables:**
  - Ensure all required `.env` values for dev are set.

---

## 2. Clean Up Dev Environment

- [ ] **Stop any running dev servers and free up ports:**
  ```powershell
  cd .. # From limebird-site-new to project root if needed
  .\cleanup-dev.ps1
  ```
- [ ] **Verify ports 3000, 3001, 5173, and 8080 are free.**

---

## 3. Deploy to Dev

- [ ] **Run the deployment script from the project root:**
  ```powershell
  .\deploy-dev.ps1
  ```
- [ ] **Monitor the output for errors.**
- [ ] **Check `deployment.log` for deployment details.**

---

## 4. Post-Deployment Verification

- [ ] **Visit the dev site:**
  - https://dev--limebirdorg.netlify.app/ (or your configured dev domain)
- [ ] **Perform a smoke test:**
  - Check homepage, login, dashboard, blog, and billing features.
- [ ] **Verify new features and bug fixes are present.**
- [ ] **Check for errors in the browser console and network tab.**

---

## 5. Log Results

- [ ] **Update the defect log (`defect-log.md`) with any issues found.**
- [ ] **Document any deployment issues or lessons learned.**

---

**Ready to proceed to production only after all dev environment checks are complete and approved.**

---

# Broader Project Next Steps

## Pivot: Simplicity, Stability, and Maintainability

- [ ] **Project Direction Update:**
  - The project is pivoting away from the complex Next.js App Router + Contentlayer + MDX stack.
  - New priorities: stability, ease of maintenance, and efficient content updates.
  - See updated [CONOPS.md](./CONOPS.md) for rationale and new project characteristics.

## A. Site Simplification & Migration Sprint
- [ ] **Follow the new sprint plan in `blog-sprint-plan.md`:**
  - Audit and remove complex/experimental dependencies.
  - Migrate to a simpler architecture (e.g., Next.js Pages Router, static `.tsx` pages, or plain Markdown).
  - Ensure the site is easy to update and maintain.
  - Document and present options for the next steps.

## B. Documentation & Polish
- [ ] **Update `limebird-site-new/README.md`:**
  - Replace default "Taxonomy" and shadcn references with Limebird.org-specific information.
  - Summarize business context, architecture, and features (pull from `CONOPS.md`).
  - Add instructions for local development, testing, deployment, and customization.
  - Document PowerShell scripts for dev, build, deploy, and cleanup.
- [ ] **Review and finalize `CONOPS.md`:**
  - Remove any remaining `[TO BE DEFINED]` placeholders if brand decisions are made.
  - Ensure all implementation details match the actual codebase and scripts.

## C. Testing & Quality Gates
- [ ] **Run full test suite:**
  - Execute all unit, E2E, accessibility, and visual regression tests (as applicable to the new stack).
  - Ensure all tests pass in local and dev environments.
- [ ] **Manual QA:**
  - Perform a final manual review in both local and dev environments.
  - Check for any UI/UX, accessibility, or performance issues.

## D. Deployment
- [ ] **Production Readiness:**
  - Confirm all environment variables and secrets are set for production.
  - Ensure the `main` branch is up to date and protected.
- [ ] **Deploy to Production:**
  - Use `deploy-simple.ps1` to deploy to production.
  - Monitor the site post-deployment for any issues.

## E. Ongoing Improvements
- [ ] **Branding:**
  - Once brand guidelines are finalized, update all `[TO BE DEFINED]` elements in the design system and site.
- [ ] **Content Creation:**
  - Start adding real blog posts, documentation, and marketing content.
- [ ] **User Onboarding & Feedback:**
  - Invite stakeholders or early users to test and provide feedback.
- [ ] **Defect Logging & Backlog:**
  - Use your markdown-based defect log and backlog to track any issues or feature requests.

---

**Reference:**
- [Sprint Plan: Site Simplification and Stabilization](./blog-sprint-plan.md)
- [Updated CONOPS](./CONOPS.md)
- [Defect Investigation: StructuredClone Error (Closed, Unfixed)](./defect-investigation-structured-clone-error.md) 