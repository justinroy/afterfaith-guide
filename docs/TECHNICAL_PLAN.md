# Technical Plan

## Architecture

AfterFaith Guide is an Astro application deployed to Cloudflare Workers with the Cloudflare adapter. It uses Cloudflare D1 for resource directory data and suggested resource submissions.

## Data Ownership

- Guides: Markdown collection in `src/content/guides`
- Scripts: Markdown collection in `src/content/scripts`
- Published resources: D1 table `resources`
- Resource tags: D1 table `resource_tags`
- Suggested resources: D1 table `suggested_resources`

## Runtime Bindings

The D1 binding must be named `DB`.

Astro API and server-rendered pages should read the binding from Cloudflare runtime locals. Local fallbacks may be used for development only when D1 is unavailable.

## Turnstile

The suggest-a-resource form uses:

- `PUBLIC_TURNSTILE_SITE_KEY`
- `TURNSTILE_SECRET_KEY`

Production submissions must validate Turnstile server-side before inserting into `suggested_resources`. Local development may allow a safe fallback when keys are missing.

## Dependency Policy

Keep dependencies light. Add libraries only when they meaningfully reduce risk or complexity.

