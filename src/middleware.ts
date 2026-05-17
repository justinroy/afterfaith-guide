import { defineMiddleware } from 'astro:middleware';

export const onRequest = defineMiddleware((context, next) => {
  if (context.url.hostname === 'afterfaithguide.com') {
    const target = new URL(context.url);
    target.hostname = 'afterfaithguide.org';
    return Response.redirect(target, 301);
  }

  return next();
});

