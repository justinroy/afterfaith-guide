# AfterFaith Guide Agent Instructions

AfterFaith Guide is a calm, practical, non-monetized resource for people questioning, leaving, grieving, or rebuilding after religion. Future Codex work should preserve that mission before making product or technical decisions.

## Standing Rules

- Read `README.md`, `docs/PROJECT_BRIEF.md`, `docs/TECHNICAL_PLAN.md`, and any task-relevant docs before making architectural or product decisions.
- Preserve an endpoint-neutral, calm, privacy-aware tone. Do not mock religion, proselytize, push atheism, push reconstruction, invite debate, or exploit trauma.
- Do not add monetization, ads, payments, login, user accounts, public comments, forums, public story submissions, an admin dashboard, newsletter integration, or unnecessary tracking.
- Public resource directory records are backed by Cloudflare D1.
- Suggested resource submissions are backed by Cloudflare D1.
- Guides and scripts are backed by Markdown content collections for the MVP. Do not move guides or scripts into D1 unless the project docs are intentionally updated first.
- The D1 binding name is `DB`.
- Production resource submissions must validate Cloudflare Turnstile server-side before inserting into D1.
- Avoid collecting unnecessary personal data. Email is optional for suggestions and should not be required.
- After changes, run `npm run build` and fix errors before handing work back.

## Product Tone

Use plain, compassionate language. The site should help visitors find a next safe step without deciding their destination for them.

