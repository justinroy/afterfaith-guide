import type { APIRoute } from 'astro';
import { env } from 'cloudflare:workers';
import { verifyTurnstile } from '../../lib/turnstile';

const maxLengths = {
  title: 180,
  url: 500,
  resource_type: 80,
  suggested_by_email: 254,
  notes: 1600
};

function clean(value: FormDataEntryValue | null, max: number) {
  if (typeof value !== 'string') return '';
  return value.trim().slice(0, max);
}

function isValidUrl(value: string) {
  try {
    const url = new URL(value);
    return url.protocol === 'http:' || url.protocol === 'https:';
  } catch {
    return false;
  }
}

export const POST: APIRoute = async ({ request, redirect }) => {
  const db = env.DB;
  if (!db) {
    return new Response('Resource suggestions are temporarily unavailable. Please try again soon.', { status: 503 });
  }

  const formData = await request.formData();
  const title = clean(formData.get('title'), maxLengths.title);
  const url = clean(formData.get('url'), maxLengths.url);
  const resourceType = clean(formData.get('resource_type'), maxLengths.resource_type);
  const email = clean(formData.get('suggested_by_email'), maxLengths.suggested_by_email);
  const notes = clean(formData.get('notes'), maxLengths.notes);

  if (!title || !url || !resourceType || !isValidUrl(url)) {
    return new Response('Please provide a title, valid URL, and resource type.', { status: 400 });
  }

  const isProduction = import.meta.env.PROD;
  const secret = env.TURNSTILE_SECRET_KEY;
  const token = clean(formData.get('cf-turnstile-response'), 2048);

  if (isProduction) {
    if (!secret || !token) {
      return new Response('Please complete the spam check and try again.', { status: 400 });
    }

    const remoteIp = request.headers.get('CF-Connecting-IP') ?? undefined;
    const ok = await verifyTurnstile(token, secret, remoteIp);
    if (!ok) {
      return new Response('The spam check did not complete. Please try again.', { status: 400 });
    }
  }

  await db
    .prepare(
      `INSERT INTO suggested_resources
        (title, url, resource_type, suggested_by_email, notes, status)
       VALUES (?, ?, ?, ?, ?, 'pending')`
    )
    .bind(title, url, resourceType, email || null, notes || null)
    .run();

  return redirect('/suggest-a-resource/thanks', 303);
};
