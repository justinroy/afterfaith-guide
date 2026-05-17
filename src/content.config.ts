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

const articles = defineCollection({
  loader: glob({ pattern: '**/*.md', base: './src/content/articles' }),
  schema: z.object({
    title: z.string(),
    description: z.string(),
    category: z.string(),
    audience: z.string(),
    tags: z.array(z.string()).default([]),
    author: z.string(),
    updated: z.coerce.date(),
    published: z.coerce.date(),
    featured: z.boolean().default(false)
  })
});

export const collections = { guides, scripts, articles };
