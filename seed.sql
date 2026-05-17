DELETE FROM resource_tags;
DELETE FROM resources;

INSERT INTO resources (id, title, url, type, stance, emotional_intensity, cost, region, best_for, not_best_for, safety_notes, last_reviewed, featured, status)
VALUES
  (1, 'Recovering from Religion', 'https://www.recoveringfromreligion.org/', 'support organization', 'secular, endpoint-neutral support', 'medium', 'free', 'International', 'People who want peer support while questioning, leaving, or recovering from religion.', 'People seeking clergy counseling or conversion-focused support.', 'Peer support is not therapy or crisis care.', '2026-05-17', 1, 'published'),
  (2, 'Secular Therapy Project', 'https://www.seculartherapy.org/', 'therapist directory', 'secular', 'low', 'varies', 'United States', 'People seeking a therapist who will not use religion as a treatment frame.', 'People outside supported regions or seeking immediate crisis care.', 'Always verify licensure, fit, fees, and emergency policies directly.', '2026-05-17', 1, 'published'),
  (3, 'Reclamation Collective', 'https://www.reclamationcollective.com/', 'support organization', 'religious-trauma-informed', 'medium', 'free and paid options', 'United States', 'People seeking religious-trauma-informed education, groups, or referrals.', 'People seeking a purely secular framing.', 'Review costs and provider qualifications before joining paid offerings.', '2026-05-17', 1, 'published'),
  (4, 'Religious Trauma Institute', 'https://www.religioustraumainstitute.com/', 'education', 'religious-trauma-informed', 'medium', 'free and paid options', 'International', 'People learning about religious trauma and professionals seeking training.', 'People looking for immediate peer support.', 'Educational content is not a substitute for personal mental health care.', '2026-05-17', 0, 'published'),
  (5, 'Journey Free', 'https://journeyfree.org/', 'therapy and education', 'religious-trauma-informed', 'medium', 'paid', 'United States', 'People seeking professional help related to harmful religion or cultic control.', 'People seeking free-only support.', 'Confirm clinician availability, licensure, and fees.', '2026-05-17', 0, 'published'),
  (6, 'The Clergy Project', 'https://clergyproject.org/', 'peer community', 'secular', 'medium', 'free', 'International', 'Current or former clergy who no longer hold supernatural beliefs.', 'People who were not clergy or religious professionals.', 'Community access has eligibility limits.', '2026-05-17', 0, 'published'),
  (7, 'Spiritual First Responders Project', 'https://www.spiritualfirstresponders.org/', 'training and support', 'spiritual-care-informed', 'medium', 'varies', 'United States', 'People interested in religious trauma care from a spiritual care lens.', 'People seeking explicitly atheist spaces.', 'Check current programs and scope before relying on services.', '2026-05-17', 0, 'published'),
  (8, 'Graceful Atheist', 'https://gracefulatheist.com/', 'podcast', 'secular', 'medium', 'free', 'International', 'People who want thoughtful deconversion stories without a combative tone.', 'People avoiding personal faith-transition stories.', 'Some episodes may discuss trauma, grief, or family conflict.', '2026-05-17', 0, 'published'),
  (9, 'Exvangelical', 'https://exvangelicalpodcast.com/', 'podcast', 'post-evangelical', 'medium', 'free', 'International', 'People processing evangelical culture and post-evangelical identity.', 'People outside evangelical contexts who want broad interfaith coverage.', 'Episode intensity varies by guest and topic.', '2026-05-17', 0, 'published'),
  (10, 'Mormon Stories', 'https://www.mormonstories.org/', 'podcast and community', 'post-Mormon', 'high', 'free and paid options', 'International', 'People leaving, questioning, or processing Mormonism.', 'People who want short, low-intensity resources.', 'Long-form stories may include intense material and family conflict.', '2026-05-17', 0, 'published'),
  (11, 'Cults to Consciousness', 'https://www.cultstoconsciousness.com/', 'podcast and video', 'cult-recovery-informed', 'high', 'free', 'International', 'People trying to understand high-control groups and coercive systems.', 'People who are easily activated by detailed trauma narratives.', 'Content can be emotionally intense; pace yourself.', '2026-05-17', 0, 'published'),
  (12, 'So You''re Deconstructing', 'https://www.soyouredeconstructing.com/', 'education', 'endpoint-neutral', 'low', 'free', 'International', 'People looking for accessible language around deconstruction.', 'People needing therapist directories or urgent support.', 'Check individual articles for fit and date.', '2026-05-17', 0, 'published'),
  (13, 'Room to Thrive', 'https://www.roomtothrive.com/', 'coaching and education', 'religious-trauma-informed', 'medium', 'paid', 'International', 'People seeking structured support around religious trauma and identity rebuilding.', 'People needing licensed therapy or free-only resources.', 'Coaching is not therapy; review credentials and fit.', '2026-05-17', 0, 'published'),
  (14, 'Footsteps', 'https://www.footstepsorg.org/', 'support organization', 'ex-Orthodox Jewish support', 'medium', 'free and paid options', 'United States', 'People leaving or exploring life beyond ultra-Orthodox Jewish communities.', 'People outside the served community or geography.', 'Some programs have eligibility requirements.', '2026-05-17', 1, 'published'),
  (15, 'Ex-Muslims of North America', 'https://exmuslims.org/', 'support organization', 'ex-Muslim support', 'high', 'free', 'North America', 'People leaving or questioning Islam who need community, safety resources, or advocacy.', 'People seeking religious counseling within Islam.', 'Privacy and safety may be especially important; use care before disclosure.', '2026-05-17', 1, 'published');

INSERT INTO resource_tags (resource_id, tag_type, tag_slug, tag_label)
VALUES
  (1, 'stage', 'support-now', 'Support now'),
  (1, 'topic', 'peer-support', 'Peer support'),
  (1, 'tradition', 'multi-tradition', 'Multi-tradition'),
  (2, 'topic', 'therapy', 'Therapy'),
  (2, 'stage', 'rebuilding', 'Rebuilding'),
  (3, 'topic', 'religious-trauma', 'Religious trauma'),
  (3, 'stage', 'healing', 'Healing'),
  (4, 'topic', 'religious-trauma', 'Religious trauma'),
  (4, 'type', 'education', 'Education'),
  (5, 'topic', 'therapy', 'Therapy'),
  (5, 'topic', 'high-control', 'High-control groups'),
  (6, 'topic', 'clergy', 'Clergy'),
  (6, 'stage', 'leaving', 'Leaving'),
  (7, 'topic', 'spiritual-care', 'Spiritual care'),
  (8, 'type', 'podcast', 'Podcast'),
  (8, 'stage', 'leaving', 'Leaving'),
  (9, 'tradition', 'evangelical', 'Evangelical'),
  (9, 'type', 'podcast', 'Podcast'),
  (10, 'tradition', 'mormon', 'Mormon'),
  (10, 'type', 'podcast', 'Podcast'),
  (11, 'topic', 'high-control', 'High-control groups'),
  (11, 'type', 'video', 'Video'),
  (12, 'stage', 'questioning', 'Questioning'),
  (12, 'topic', 'deconstruction', 'Deconstruction'),
  (13, 'topic', 'religious-trauma', 'Religious trauma'),
  (13, 'stage', 'rebuilding', 'Rebuilding'),
  (14, 'tradition', 'orthodox-jewish', 'Orthodox Jewish'),
  (14, 'stage', 'leaving', 'Leaving'),
  (15, 'tradition', 'muslim', 'Muslim'),
  (15, 'topic', 'safety', 'Safety');
