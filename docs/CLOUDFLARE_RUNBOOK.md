# Cloudflare Runbook

## Create D1

```bash
npx wrangler d1 create afterfaith-guide
```

Copy the returned `database_id` into `wrangler.jsonc`:

```jsonc
{
  "d1_databases": [
    {
      "binding": "DB",
      "database_name": "afterfaith-guide",
      "database_id": "paste-database-id-here",
      "migrations_dir": "migrations"
    }
  ]
}
```

## Apply Migrations

Local:

```bash
npm run db:migrate:local
```

Remote:

```bash
npm run db:migrate:remote
```

## Seed D1

Local:

```bash
npm run db:seed:local
```

Remote:

```bash
npm run db:seed:remote
```

## Configure Turnstile

Create a Cloudflare Turnstile widget for `afterfaithguide.org`.

Set:

- `PUBLIC_TURNSTILE_SITE_KEY`
- `TURNSTILE_SECRET_KEY`

Use `wrangler secret put TURNSTILE_SECRET_KEY` for the secret.

## Deploy

```bash
npm run build
npm run deploy
```

## Custom Domain

In Cloudflare Workers, add `afterfaithguide.org` as the custom domain for the Worker.

For `afterfaithguide.com`, create a Redirect Rule:

- Match hostname `afterfaithguide.com`
- Redirect to `https://afterfaithguide.org`
- Preserve path and query
- Use `301`

