# Database Schema

D1 stores public resource records, resource tags, and resource suggestions.

## `resources`

- `id`
- `title`
- `url`
- `type`
- `stance`
- `emotional_intensity`
- `cost`
- `region`
- `best_for`
- `not_best_for`
- `safety_notes`
- `last_reviewed`
- `featured`
- `status`
- `created_at`
- `updated_at`

## `resource_tags`

- `id`
- `resource_id`
- `tag_type`
- `tag_slug`
- `tag_label`

## `suggested_resources`

- `id`
- `title`
- `url`
- `resource_type`
- `suggested_by_email`
- `notes`
- `status`
- `created_at`
- `reviewed_at`

## Status Values

Published resources should use `published`. Draft, archived, or rejected resources should not appear in the public directory.

Suggested resources should default to `pending`.

