# Deployment

AfterFaith Guide deploys to Cloudflare Workers with a D1 binding named `DB`.

## One-Time Cloudflare Setup

1. Install dependencies:

```bash
npm install
```

2. Log in to Cloudflare:

```bash
npx wrangler login
```

3. Create the D1 database:

```bash
npx wrangler d1 create afterfaith-guide
```

4. Copy the returned `database_id` into `wrangler.jsonc` under the `DB` binding.

5. Configure Turnstile:

```bash
npx wrangler secret put TURNSTILE_SECRET_KEY
```

Set `PUBLIC_TURNSTILE_SITE_KEY` as a non-secret variable in Cloudflare Workers settings or in `wrangler.jsonc` when appropriate for the environment.

## Migrations

Apply migrations locally:

```bash
npm run db:migrate:local
```

Apply migrations remotely:

```bash
npm run db:migrate:remote
```

## Seed Data

Seed local D1:

```bash
npm run db:seed:local
```

Seed remote D1:

```bash
npm run db:seed:remote
```

## Deploy

```bash
npm run build
npm run deploy
```

## Domains

Primary domain: `afterfaithguide.org`

In Cloudflare Workers, add a custom domain route for `afterfaithguide.org` to this Worker.

Redirect domain: `afterfaithguide.com -> afterfaithguide.org`

Create a Cloudflare Redirect Rule on `afterfaithguide.com`:

- If hostname equals `afterfaithguide.com`
- Static redirect to `https://afterfaithguide.org`
- Preserve path and query string
- Status code: `301`

