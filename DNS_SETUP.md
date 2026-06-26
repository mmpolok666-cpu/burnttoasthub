# DNS Setup — burnttoasthub.com via Cloudflare
# GitHub username: mmpolok666-cpu
# Canonical URL:   www.burnttoasthub.com

═══════════════════════════════════════════════════════
  STEP 1 — Add site to Cloudflare
═══════════════════════════════════════════════════════

1. Log in → dash.cloudflare.com
2. Click "Add a Site" → type: burnttoasthub.com → Continue
3. Select FREE plan → Continue
4. Cloudflare scans DNS → let it finish → Continue
5. You will see two Cloudflare nameservers e.g:
      alex.ns.cloudflare.com
      nina.ns.cloudflare.com
   KEEP THIS PAGE OPEN — you need these in Step 3.

═══════════════════════════════════════════════════════
  STEP 2 — Set DNS records in Cloudflare
═══════════════════════════════════════════════════════

Delete ANY existing A or CNAME records for @ and www first.
Then add EXACTLY these records:

  Type   │ Name │ Content                        │ Proxy Status
  ───────┼──────┼────────────────────────────────┼─────────────
  A      │ @    │ 185.199.108.153                │ Proxied 🟠
  A      │ @    │ 185.199.109.153                │ Proxied 🟠
  A      │ @    │ 185.199.110.153                │ Proxied 🟠
  A      │ @    │ 185.199.111.153                │ Proxied 🟠
  CNAME  │ www  │ mmpolok666-cpu.github.io       │ Proxied 🟠

  ⚠️  ALL records must be PROXIED (orange cloud), not DNS-only (grey).
  ⚠️  CNAME value is:  mmpolok666-cpu.github.io  (no trailing slash)

Click Save.

═══════════════════════════════════════════════════════
  STEP 3 — Point Namecheap to Cloudflare nameservers
═══════════════════════════════════════════════════════

1. Log in to namecheap.com
2. Domain List → burnttoasthub.com → MANAGE
3. Nameservers section → change dropdown to "Custom DNS"
4. Enter the TWO nameservers from Cloudflare Step 1
   (e.g. alex.ns.cloudflare.com and nina.ns.cloudflare.com)
5. Click the green tick / Save

  ⚠️  Your Premium DNS on Namecheap is now dormant — Cloudflare
      handles DNS. Domain Privacy (WHOIS) stays active regardless.

Propagation: usually 5–15 min with Premium DNS.
Cloudflare dashboard will show "Active" when done.

═══════════════════════════════════════════════════════
  STEP 4 — Cloudflare SSL settings
═══════════════════════════════════════════════════════

Cloudflare → your site → SSL/TLS → Overview
Set encryption mode to: Full (strict)

═══════════════════════════════════════════════════════
  STEP 5 — Force HTTPS redirect
═══════════════════════════════════════════════════════

Cloudflare → your site → SSL/TLS → Edge Certificates
Toggle ON: "Always Use HTTPS"
Toggle ON: "Automatic HTTPS Rewrites"

═══════════════════════════════════════════════════════
  STEP 6 — www redirect rule (apex → www)
═══════════════════════════════════════════════════════

Cloudflare → your site → Rules → Redirect Rules → Create rule

  Rule name:    Apex to www
  Field:        Hostname
  Operator:     equals
  Value:        burnttoasthub.com
  Action:       Dynamic redirect
  Expression:   concat("https://www.burnttoasthub.com", http.request.uri.path)
  Status code:  301

Save.

═══════════════════════════════════════════════════════
  STEP 7 — Add custom domain in GitHub
═══════════════════════════════════════════════════════

AFTER DNS is showing Active in Cloudflare:

1. github.com/mmpolok666-cpu/burnttoasthub
2. Settings → Pages → Custom domain
3. Type: www.burnttoasthub.com → Save
4. GitHub verifies DNS — takes 2–5 min
5. Tick "Enforce HTTPS" when it appears

═══════════════════════════════════════════════════════
  VERIFY
═══════════════════════════════════════════════════════

Open terminal or use https://dnschecker.org

  curl -I https://www.burnttoasthub.com
  # Expect: HTTP/2 200

  # Check Cloudflare is serving (look for cf-ray header):
  curl -sI https://www.burnttoasthub.com | grep cf-ray

Done. Your site is live.
