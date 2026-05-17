CREATE TABLE IF NOT EXISTS resource_tags (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  resource_id INTEGER NOT NULL,
  tag_type TEXT NOT NULL,
  tag_slug TEXT NOT NULL,
  tag_label TEXT NOT NULL,
  FOREIGN KEY (resource_id) REFERENCES resources(id) ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS idx_resource_tags_resource
ON resource_tags (resource_id);

CREATE INDEX IF NOT EXISTS idx_resource_tags_filter
ON resource_tags (tag_type, tag_slug);

