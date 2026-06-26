# BurntToastHub — Go-Live Checklist
# burnttoasthub.com | GitHub: mmpolok666-cpu | DNS: Cloudflare

Work through in order. Each step ~5 min.

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 PHASE 1 — GitHub repo
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

 □  github.com/new
    Name: burnttoasthub
    Visibility: Public
    Initialize: NO (leave everything unticked)

 □  Unzip burnttoasthub-deploy.zip on your computer

 □  Upload files to GitHub (easiest: drag-drop to repo page)
    OR push via terminal:
      cd burnttoasthub-deploy
      git init
      git remote add origin https://github.com/mmpolok666-cpu/burnttoasthub.git
      git add .
      git commit -m "initial deploy"
      git push -u origin main

 □  Repo → Settings → Pages
    Source: GitHub Actions (not Deploy from branch)

 □  Go to Actions tab — watch deploy job run (30 sec)
    Green tick = deployed

 □  Test: https://mmpolok666-cpu.github.io/burnttoasthub
    Site should load (unstyled domain, but works)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 PHASE 2 — Supabase (already pre-filled in index.html)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

 □  Open your Supabase project dashboard
 □  SQL Editor (left sidebar) → New query
 □  Paste entire contents of supabase/schema.sql
 □  Click RUN
 □  Verify in Table Editor: 3 tables visible
    subscribers | waitlist | click_events
 □  Test form on live site → check subscribers table for the row

 ✅  Credentials are already in index.html — no manual edits needed.

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 PHASE 3 — DNS via Cloudflare (see DNS_SETUP.md)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

 □  Add burnttoasthub.com to Cloudflare (free tier)
 □  Add the 5 DNS records (4× A records + 1× CNAME)
 □  Switch Namecheap nameservers to Cloudflare
 □  Set SSL/TLS to Full (strict)
 □  Enable Always Use HTTPS
 □  Add redirect rule: apex → www
 □  GitHub Pages → Custom domain: www.burnttoasthub.com
 □  Enable Enforce HTTPS in GitHub

 ✅  Site live at https://www.burnttoasthub.com

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 PHASE 4 — Final wiring (tell Claude when ready)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

 □  Paste real Gumroad product URLs → Claude updates cards
 □  Upload videos to YouTube unlisted → Claude builds video section
 □  Create OG cover image 1200×630px → save as docs/assets/og-cover.jpg
 □  Submit to Google Search Console → Request Indexing
 □  Submit sitemap: https://www.burnttoasthub.com/sitemap.xml

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 CREDENTIALS (keep safe — never share publicly)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

 Supabase URL:     https://ckqfwfuaaploynfwqivm.supabase.co
 Supabase anon:    sb_publishable_TrYN75AOzcxWt7ibUrCwBg_B-DeXLsm
 GitHub repo:      https://github.com/mmpolok666-cpu/burnttoasthub
 Live URL:         https://www.burnttoasthub.com
