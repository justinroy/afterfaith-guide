import { defineCollection } from 'astro:content';
import { glob } from 'astro/loaders';
import { z } from 'astro/zod';

const sharedContent = {
  title: z.string(),
  description: z.string(),
  stage: z.string(),
  tags: z.array(z.string()).default([]),
  updated: z.coerce.date()
};

const guides = defineCollection({
  loader: glob({ pattern: '**/*.md', base: './src/content/guides' }),
  schema: z.object({
    ...sharedContent,
    order: z.number()
  })
});

const scripts = defineCollection({
  loader: glob({ pattern: '**/*.md', base: './src/content/scripts' }),
  schema: z.object({
    ...sharedContent,
    context: z.string()
  })
});

export const collections = { guides, scripts };
