-- ═══════════════════════════════════════════════════════════════
--  BurntToastHub — Supabase Schema
--  Run once in Supabase SQL Editor → Database → SQL Editor
-- ═══════════════════════════════════════════════════════════════

CREATE TABLE IF NOT EXISTS public.subscribers (
  id              uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  name            text NOT NULL,
  email           text NOT NULL,
  profession      text,
  utm_source      text,
  utm_medium      text,
  utm_campaign    text,
  page_path       text DEFAULT '/',
  confirmed       boolean DEFAULT false,
  subscribed_at   timestamptz DEFAULT now(),
  ip_country      text,
  CONSTRAINT subscribers_email_unique UNIQUE (email)
);

CREATE TABLE IF NOT EXISTS public.waitlist (
  id          uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  email       text NOT NULL,
  product     text NOT NULL,
  created_at  timestamptz DEFAULT now(),
  CONSTRAINT waitlist_email_product_unique UNIQUE (email, product)
);

CREATE TABLE IF NOT EXISTS public.click_events (
  id          uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  event_name  text NOT NULL,
  product     text,
  destination text,
  utm_source  text,
  created_at  timestamptz DEFAULT now()
);

ALTER TABLE public.subscribers  ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.waitlist     ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.click_events ENABLE ROW LEVEL SECURITY;

CREATE POLICY "anon_insert_subscribers"  ON public.subscribers  FOR INSERT TO anon WITH CHECK (true);
CREATE POLICY "anon_insert_waitlist"     ON public.waitlist     FOR INSERT TO anon WITH CHECK (true);
CREATE POLICY "anon_insert_clicks"       ON public.click_events FOR INSERT TO anon WITH CHECK (true);
CREATE POLICY "block_anon_read_subs"     ON public.subscribers  FOR SELECT TO anon USING (false);
CREATE POLICY "block_anon_read_waitlist" ON public.waitlist     FOR SELECT TO anon USING (false);

CREATE INDEX IF NOT EXISTS idx_subs_email      ON public.subscribers(email);
CREATE INDEX IF NOT EXISTS idx_subs_profession ON public.subscribers(profession);
CREATE INDEX IF NOT EXISTS idx_subs_source     ON public.subscribers(utm_source);
CREATE INDEX IF NOT EXISTS idx_subs_date       ON public.subscribers(subscribed_at);
CREATE INDEX IF NOT EXISTS idx_waitlist_prod   ON public.waitlist(product);

CREATE OR REPLACE VIEW public.subs_by_profession AS
  SELECT profession, COUNT(*) AS total,
         MAX(subscribed_at) AS latest
  FROM public.subscribers GROUP BY profession ORDER BY total DESC;

CREATE OR REPLACE VIEW public.subs_by_source AS
  SELECT utm_source, COUNT(*) AS total
  FROM public.subscribers GROUP BY utm_source ORDER BY total DESC;

SELECT 'BurntToastHub schema ready' AS status;
