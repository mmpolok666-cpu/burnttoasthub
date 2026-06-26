# BurntToastHub

Static site for [burnttoasthub.com](https://www.burnttoasthub.com)

Built by: PromptDesk (theCorporateGuy) + M M Polok  
Stack: GitHub Pages · Cloudflare CDN · Supabase backend

## Deploy
Push to `main` — GitHub Actions auto-deploys the `docs/` folder.

## Structure
```
docs/
  index.html        ← Main site
  404.html          ← Custom 404
  CNAME             ← Custom domain
  robots.txt        ← SEO crawl rules
  sitemap.xml       ← SEO sitemap
  site.webmanifest  ← PWA manifest
  assets/           ← Images, icons, OG images
.github/
  workflows/
    deploy.yml      ← Auto-deploy on push
supabase/
  schema.sql        ← Database setup
```

## Supabase setup
Run `supabase/schema.sql` in your Supabase SQL editor once to create tables.
Then replace `REPLACE_WITH_YOUR_SUPABASE_URL` and `REPLACE_WITH_YOUR_SUPABASE_ANON_KEY`
in `docs/index.html` with your actual values.
