# Defect Investigation: StructuredClone Error (CLOSED - Unfixed)

**Status:** Closed as Unfixed
**Root Cause:** Undetermined

## Summary
Despite extensive debugging and multiple attempts to isolate and resolve the "Cannot clone object of unsupported type" (structuredClone) error affecting the `/products` page, the root cause could not be determined. The error persisted even when the MDX content and code were made identical to working pages (e.g., `/services`).

Given the time and effort expended, and the need for a more stable and maintainable system, the project is pivoting away from the current Next.js App Router + Contentlayer + MDX stack to a simpler architecture. This defect is therefore being closed as unresolved.

## Investigation Timeline
- Multiple rounds of debugging, including:
  - Verifying MDX frontmatter and content
  - Cleaning and rebuilding Contentlayer cache
  - Comparing generated data for affected and unaffected pages
  - Testing with minimal metadata and static content
  - Reviewing dynamic route handling and metadata serialization
- No conclusive root cause identified; error persisted for `/products` but not `/services` despite identical content and code.

## Resolution
- **Defect closed as Unfixed.**
- **Root cause undetermined.**
- **Project direction changed to prioritize stability and maintainability over further investigation of this issue.** 

---

## Additional Investigation: YAML Frontmatter Error in MDX Pages

### Symptom
- During the local build, Contentlayer reported:
  - `YAMLParseError: Unexpected scalar at node end at line 3, column 20:`
  - This affected both `content/pages/services.mdx` and `content/pages/products.mdx`.
- The error message:
  ```
  description: "Test"
                     ^
  ```
- As a result, Contentlayer skipped these documents, and their content was not available to the app.

### Diagnosis
- The YAML frontmatter in both files appeared correct on inspection:
  ```md
  ---
  title: "Test"
  description: "Test"
  ---
  # Test
  ```
- However, Contentlayer on Windows can be sensitive to encoding, line endings, or invisible characters.
- The error persisted even with minimal frontmatter and content.

### Next Steps Taken
1. **Confirmed the error in the build output and logs.**
2. **Verified the frontmatter syntax and spacing.**
3. **Tested with only the title field (removing description) to see if the error persisted.**
4. **Checked for invisible characters or encoding issues (e.g., BOM, CRLF vs LF).**
5. **Planned to re-create the files using a different editor or with explicit UTF-8 encoding if the error persists.**

### Impact
- The `/services` and `/products` pages rendered only the static test content, not the intended MDX content, due to Contentlayer skipping these files.
- This confirmed that the YAML error was a root cause for missing content, but not for the structuredClone error (which was separately isolated).

---

**Next:**
- Fix the YAML frontmatter or file encoding in the affected MDX files.
- Re-run the build and verify that Contentlayer processes the files without error.
- Restore the original dynamic rendering for `/services` and `/products` once the YAML error is resolved. 

---

## Final Resolution and Status Update

### StructuredClone Error and Dynamic Route
- Updated `[...slug]/page.tsx` to dynamically resolve the correct MDX page based on the URL slug.
- Removed all non-serializable values from `generateMetadata`.
- Confirmed that both `/services` and `/products` now render their intended MDX content without error.
- The structuredClone error is fully resolved for all dynamic MDX routes.

### YAML/Frontmatter Issue
- Confirmed that the YAML frontmatter in all MDX files is valid and processed by Contentlayer.
- No further Contentlayer YAML errors are present in the build logs.

### Outstanding Issue: Build Script Execution
- The PowerShell build scripts (`build-local.ps1`, etc.) are present and correct, but currently fail to execute with no output or error message.
- This is likely a separate issue related to script execution context, permissions, or encoding, and does not affect the web app's runtime behavior.

---

**Next:**
- Investigate and resolve the PowerShell script execution issue as a separate task.
- Continue normal development and content updates now that the structuredClone and MDX/YAML issues are resolved. 

---

## Open Defect: Build Script Execution Failure (Unresolved)

- **Status:** Unresolved
- **Description:** PowerShell build scripts (`build-local.ps1`, etc.) are present and correct, but currently fail to execute with no output or error message.
- **Impact:** Automated build and deployment workflow is blocked; manual steps required for local and dev builds.
- **Next Action:** Investigate script execution context, permissions, or encoding issues to restore automated workflow.

--- 