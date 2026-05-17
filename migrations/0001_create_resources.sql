CREATE TABLE IF NOT EXISTS resources (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT NOT NULL,
  url TEXT NOT NULL,
  type TEXT NOT NULL,
  stance TEXT NOT NULL,
  emotional_intensity TEXT NOT NULL,
  cost TEXT NOT NULL,
  region TEXT NOT NULL,
  best_for TEXT NOT NULL,
  not_best_for TEXT,
  safety_notes TEXT,
  last_reviewed TEXT NOT NULL,
  featured INTEGER NOT NULL DEFAULT 0,
  status TEXT NOT NULL DEFAULT 'draft',
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_resources_status_featured
ON resources (status, featured, last_reviewed);

