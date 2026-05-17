export type Resource = {
  id: number;
  title: string;
  url: string;
  type: string;
  stance: string;
  emotional_intensity: string;
  cost: string;
  region: string;
  best_for: string;
  not_best_for: string | null;
  safety_notes: string | null;
  last_reviewed: string;
  featured: number;
  status: string;
  created_at: string;
  updated_at: string;
};

export type ResourceTag = {
  resource_id: number;
  tag_type: string;
  tag_slug: string;
  tag_label: string;
};

export type FilterOption = {
  type: string;
  slug: string;
  label: string;
};

export type ResourceFilters = {
  stage?: string;
  topic?: string;
  tradition?: string;
  type?: string;
};

const filterTypes = ['stage', 'topic', 'tradition', 'type'] as const;

export async function getPublishedResources(db: D1Database, filters: ResourceFilters) {
  const clauses = ["status = 'published'"];
  const bindings: string[] = [];

  for (const filterType of filterTypes) {
    const value = filters[filterType];
    if (!value) continue;
    clauses.push(
      `EXISTS (
        SELECT 1 FROM resource_tags
        WHERE resource_tags.resource_id = resources.id
        AND resource_tags.tag_type = ?
        AND resource_tags.tag_slug = ?
      )`
    );
    bindings.push(filterType, value);
  }

  const resources = await db
    .prepare(
      `SELECT * FROM resources
       WHERE ${clauses.join(' AND ')}
       ORDER BY featured DESC, last_reviewed DESC, title ASC`
    )
    .bind(...bindings)
    .all<Resource>();

  const tags = await db
    .prepare(
      `SELECT resource_id, tag_type, tag_slug, tag_label
       FROM resource_tags
       ORDER BY tag_type ASC, tag_label ASC`
    )
    .all<ResourceTag>();

  return {
    resources: resources.results ?? [],
    tags: tags.results ?? []
  };
}

export async function getResourceFilterOptions(db: D1Database) {
  const results = await db
    .prepare(
      `SELECT DISTINCT tag_type as type, tag_slug as slug, tag_label as label
       FROM resource_tags
       WHERE tag_type IN ('stage', 'topic', 'tradition', 'type')
       ORDER BY tag_type ASC, tag_label ASC`
    )
    .all<FilterOption>();

  return results.results ?? [];
}

