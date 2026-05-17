# Content Review Workflow

AfterFaith Guide content should be source-grounded, calm, endpoint-neutral, and reviewed by the site owner before publication.

## Drafting

- Start with a source packet in `docs/content-research/`.
- Use credible sources that fit the claim: public health agencies, professional organizations, reputable nonprofits, qualified experts, books, research, and carefully framed lived-experience material.
- Keep public guides practical and readable. Do not turn them into academic literature reviews.
- Include a short "Sources and further reading" section when a guide relies on external sources.

## Owner Review

Before publishing, the owner should check:

- The guide answers a real visitor need.
- Every substantive claim is supported by the source packet or by a clearly named source.
- The tone is compassionate, plain, and restrained.
- The guide does not mock religion, proselytize, push atheism, push reconstruction, invite debate, or pressure disclosure.
- The guide does not give legal, medical, crisis, or mental health treatment instructions.
- Privacy and safety cautions are present where disclosure, family dependence, therapy, or partner conflict are involved.

## Publication Gate

Treat new or expanded guides as drafts until owner approval. After approval, run:

```bash
npm run build
```

Fix build errors before deploying.
