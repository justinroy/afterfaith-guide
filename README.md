# AfterFaith Guide

AfterFaith Guide is a calm, practical, endpoint-neutral resource website for people questioning, leaving, grieving, or rebuilding after religion.

It is intentionally non-monetized and privacy-aware. It does not include ads, payments, login, user accounts, public comments, forums, public story submissions, an admin dashboard, newsletter integration, or unnecessary tracking.

## Stack

- Astro
- TypeScript where useful
- `@astrojs/cloudflare`
- Cloudflare Workers
- Cloudflare D1
- Wrangler
- Cloudflare Turnstile for resource suggestions
- Markdown content collections for guides and scripts

## Project Structure

- `src/content/guides/` - Markdown guide collection
- `src/content/scripts/` - Markdown script collection
- `src/pages/` - Astro pages and API routes
- `src/components/` - Shared UI components
- `migrations/` - D1 migrations
- `seed.sql` - starter public resource records
- `docs/` - project, content, database, deployment, privacy, and review documentation

## Local Development

```bash
npm install
npm run dev
```

For local D1 work:

```bash
npm run db:migrate:local
npm run db:seed:local
```

## Build

```bash
npm run build
```

## Deployment

See `DEPLOYMENT.md` and `docs/CLOUDFLARE_RUNBOOK.md`.

