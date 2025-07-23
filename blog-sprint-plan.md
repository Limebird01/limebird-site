# Sprint Plan: Site Simplification and Stabilization (2024-07-22)

## What is the simplest way to achieve the goals?

**Recommended Path:**
1. **Stop using the App Router and Contentlayer/MDX entirely.**
2. **Move all content pages to the classic `pages/` directory as static `.tsx` files.**
   - Copy/paste content from MDX files into new `.tsx` pages.
   - Use simple React components for content; avoid dynamic imports or advanced features.
3. **Delete all Contentlayer, MDX, and App Router-specific config and dependencies.**
4. **Update navigation and links to use the new static pages.**
5. **Test the site after each change to ensure stability.**
6. **Document the new workflow for content updates (edit `.tsx` files in `pages/`).**

*Note: All code changes in this migration will be made by the AI assistant as directed by the project owner.*

**Deployment, build, and clean scripts (e.g., `deploy-dev.ps1`, `build-local.ps1`, `cleanup-dev.ps1`) should be retained as part of the project infrastructure, but may be updated as needed to support the new site architecture, systems, and tools.**

---

## Migration Checklist

- [ ] **Backup**
  - [ ] Ensure all current code and content is committed and pushed to git.
  - [ ] Create a backup branch (e.g., `legacy-app-router`) for reference.

- [ ] **Dependency & Config Cleanup**
  - [ ] List and remove all Contentlayer, MDX, and App Router-related dependencies from `package.json`.
  - [ ] Delete or archive config files: `contentlayer.config.js`, MDX plugins, and related files.
  - [ ] Remove any custom scripts or npm commands related to the old stack.

- [ ] **Content Migration**
  - [ ] Create a new `pages/` directory if it doesn't exist.
  - [ ] For each MDX content page:
    - [ ] Create a new `.tsx` file in `pages/` (e.g., `pages/services.tsx`).
    - [ ] Copy content from the MDX file and convert to JSX/TSX as needed.
    - [ ] Use simple functional React components for layout/content.
  - [ ] Delete or archive the original MDX files.

- [ ] **Route & Navigation Update**
  - [ ] Remove or refactor dynamic App Router routes in `app/`.
  - [ ] Update navigation components to link to the new static pages in `pages/`.
  - [ ] Remove all references to dynamic routing and Contentlayer data fetching.

- [ ] **Script Review & Update**
  - [ ] Review all deployment, build, and clean scripts (e.g., `deploy-dev.ps1`, `build-local.ps1`, `cleanup-dev.ps1`).
  - [ ] Update scripts as needed to support the new site structure and tools.

- [ ] **Testing & Verification**
  - [ ] Run the site locally and verify all routes/pages work as expected.
  - [ ] Check for broken links or missing content.
  - [ ] Run linting and tests to ensure code quality.

- [ ] **Documentation Update**
  - [ ] Update `CONOPS.md` and `README.md` to reflect the new architecture and workflow.
  - [ ] Provide a simple guide for content updates ("Edit the appropriate `.tsx` file in `pages/` to update content").
  - [ ] Document any manual steps or caveats discovered during migration.

- [ ] **Final Review & Commit**
  - [ ] Review all changes for completeness and clarity.
  - [ ] Commit and push the migrated codebase to the main branch.
  - [ ] Deploy to dev and/or production as needed.

---

## Goal
Transition the project from a complex, hard-to-maintain stack (Next.js App Router + Contentlayer + MDX) to a simpler, more stable, and maintainable system that allows for efficient content updates and minimal troubleshooting.

## Objectives
- Remove or disable experimental/complex features and dependencies.
- Restore or migrate to a simpler architecture (e.g., Next.js Pages Router, static `.tsx` pages, or plain Markdown).
- Ensure the site is easy to update and maintain.
- Document options for future architecture.

## Tasks

### A. Cleanup and Decomplexification
- [ ] List all dependencies in `package.json` and identify those related to Contentlayer, MDX, and App Router.
- [ ] Remove Contentlayer, MDX, and related config files (e.g., `contentlayer.config.js`, MDX plugins, etc.).
- [ ] Delete or archive all MDX content files.
- [ ] Remove or refactor dynamic App Router routes (in `app/`) to static `.tsx` pages in `pages/`.
- [ ] Update or remove scripts and documentation referencing the old stack.
- [ ] Test the site for stability after each change (run locally and check all routes).

### B. Migration Options (Detailed)
- [ ] Create a new `pages/` directory if it doesn't exist.
- [ ] For each content page (e.g., services, products, about):
    - [ ] Create a new `.tsx` file in `pages/` (e.g., `pages/services.tsx`).
    - [ ] Copy content from the corresponding MDX file and convert to JSX/TSX as needed.
    - [ ] Use simple functional React components for layout/content.
- [ ] Update navigation components to link to the new static pages.
- [ ] Remove all references to dynamic routing and Contentlayer data fetching.
- [ ] (Optional) If Markdown is still desired, use a minimal loader or just copy/paste content as plain text/JSX.
- [ ] Document pros/cons of each approach for the project owner.

### C. Documentation
- [ ] Update CONOPS and README to reflect new priorities and architecture.
- [ ] Provide a simple guide for content updates in the new system ("Edit the appropriate `.tsx` file in `pages/` to update content").
- [ ] Document any manual steps required for migration (e.g., how to convert MDX to TSX, what to delete, etc.).

### D. Next Steps & Decision Points
- [ ] Present migration options and recommendations to project owner (summarize in a decision document).
- [ ] Decide on the new architecture and begin implementation.
- [ ] Set up a checklist for post-migration testing and verification.

## Deliverables
- Clean, stable codebase with minimal dependencies.
- Clear documentation for future maintenance and content updates.
- A decision document outlining the chosen path forward.
- A working site using the classic Next.js Pages Router and static `.tsx` pages for content. 