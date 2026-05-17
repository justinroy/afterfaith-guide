# Contributing Content

AfterFaith Guide is edited through Markdown files in this repository. There are no public accounts, public comments, forums, newsletter forms, or admin dashboard for the MVP.

## Where Content Lives

- Articles: `src/content/articles/`
- Guides: `src/content/guides/`
- Scripts: `src/content/scripts/`
- Resource records: Cloudflare D1, reviewed through the project owner workflow

## Article Frontmatter

Articles require:

```yaml
---
title: "Article title"
description: "One sentence summary."
category: "Resource safety"
audience: "People comparing support options"
tags: ["resources", "safety"]
author: "AfterFaith Guide team"
published: 2026-05-17
updated: 2026-05-17
featured: false
---
```

## Review Checklist

- Keep the tone calm, practical, and endpoint-neutral.
- Do not mock religion, proselytize, push atheism, push reconstruction, or invite debate.
- Do not publish public story submissions or personal details without an intentional review process.
- Add privacy, pacing, or safety cautions when content involves disclosure, family pressure, therapy, crisis, abuse, or high-control groups.
- Run `npm run build` before handing changes back.
