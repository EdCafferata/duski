# Duski — Groei- & Marketingplan

_Doel: Duski (slaapgeluiden-app, iOS + Android, Premium-abonnement met 30 dagen gratis proef) maximaal laten groeien in alle landen en omzet genereren. Opgezet 2026-09-24. Dit is een levend document; de 3-uurlijkse routine bouwt het uit (zie MARKETING-LOG.md)._

## 0. Status & gating
- **Apple:** v1.0 build 5 = Waiting for Review (ingediend 24 sep 2026). Abonnement `info.cafferata.duski.premium.maandelijks`, €0,99/mnd, 30 dagen gratis, 175 landen.
- **Google Play:** .aab + assets bestaan (~/Desktop/Duski-PlayStore-Assets, jul 2026) — **status listing bevestigen** (live? draft?). ACTIE: uitzoeken/afmaken.
- **Regel:** losse mail-/info-acties worden pas ECHT verstuurd zodra Duski **live** is bij Apple. Tot dan: alles klaarzetten in drafts.

## 1. Positionering (basis voor alle content)
- **Wat:** rustgevende slaapgeluiden met stapelbare geluidslagen (layers), zonder limieten in Premium.
- **Voor wie:** mensen met inslaapproblemen, stress, focus-behoefte (studie/werk), ouders (baby-slaap), tinnitus-maskering, reizigers.
- **Waarom Duski:** mooie rustige UI, laagjes mixen, geen login nodig, 30 dagen gratis.
- **Kernboodschap (NL):** "Val makkelijker in slaap. Meng je eigen rustgevende geluidsmix — 30 dagen gratis."
- **EN:** "Fall asleep easier. Mix your own calming soundscape — free for 30 days."
- **Emotie > feature.** Verkoop rust/slaap, niet "een app met geluiden".

## 2. App Store Optimization (ASO) — hoogste ROI, gratis
Voor BEIDE stores, in de belangrijkste talen (NL, EN, DE, FR, ES, PT, IT, JP — grote slaap-app-markten).
- **Titel/subtitel met keywords** (Apple: 30+30 tekens; Play: titel 30 + korte beschrijving 80).
- **Keyword-set (EN, start):** sleep sounds, white noise, rain sounds, sleep aid, relax, calm, insomnia, focus, meditation, brown noise, nature sounds, sleep timer, baby sleep, tinnitus.
- **Keyword-set (NL):** slaapgeluiden, witte ruis, regengeluiden, in slaap vallen, ontspanning, rust, meditatie, focus, natuurgeluiden, slaaptimer, baby slaap.
- **Screenshots met tekst-overlay** (benefit-driven, per taal): "Meng je eigen slaapmix", "Val sneller in slaap", "30 dagen gratis". A/B-test later via Apple's Product Page Optimization + Play Store Experiments.
- **App Preview video** (15-30s): sfeer, layers mixen, nachtmodus.
- ACTIE (ik): keyword-research uitwerken per taal + store-teksten schrijven per taal → fastlane `metadata` (Apple) / Play listing.

## 3. Organische social — de "los laten gaan"-motor
Kort verticaal video is het krachtigste gratis kanaal voor een sfeer/rust-app.
- **Kanalen (Ed maakt aan, ik lever naam/bio/kunst/content):** TikTok, Instagram (Reels), YouTube (Shorts + lange "8 uur regengeluid"-video's), Pinterest (slaap/rust pins), Facebook-pagina, evt. Threads/X.
- **Handle-voorstel:** `@duskiapp` (of `@duski.sleep` als bezet) — overal consistent.
- **Content-pilaren:**
  1. **ASMR/sfeer-clips** (regen op raam, onweer, haardvuur) met zachte CTA — deelbaar, algoritme-vriendelijk.
  2. **"POV: je kunt niet slapen"** relatable/humor haakjes.
  3. **Slaap-tips & wetenschap** (white vs brown noise, slaaphygiëne) — waarde + autoriteit.
  4. **Behind-the-app** (layers mixen laten zien) — product-demo als content.
  5. **User-gen / duetten** aanmoedigen.
- **YouTube long-form:** "10 uur regengeluid voor slaap" met Duski-branding + link in beschrijving → gratis, evergreen, monetiseert zelf óók (AdSense) en drijft app-installs.
- **Cadans:** 1 short/dag/kanaal target. ACTIE (ik): eerste 30 scripts/hooks + on-screen tekst klaarzetten; audio komt uit de app.

## 4. Community & launch-platformen
- **Product Hunt launch** (dag dat Apple live gaat) — voorbereiden: tagline, gallery, first comment, hunter regelen. Kan flinke piek geven.
- **Reddit** (waardevol, niet spammen): r/sleep, r/insomnia, r/tinnitus, r/GetStudying, r/productivity — meedoen + subtiel delen waar relevant/toegestaan.
- **Hacker News / Show HN** (indie-hoek), **Indie Hackers**, **Betalist**, **AlternativeTo** (vs Calm/Endel/BetterSleep).
- **App-directories:** appadvice, apps.apple lijstjes, Play-collecties.

## 5. Pers & influencers (relatiegericht, geen spam)
- **Micro-influencers** in slaap/wellness/ADHD-focus niche (10k-100k) — gratis proef aanbieden i.r.v. eerlijke review.
- **Wellness/tech-blogs & nieuwsbrieven** — korte, persoonlijke pitch (geen bulk-blast).
- **Persbericht** klaar voor livegang (NL + EN).
- ACTIE (ik): pitch-templates + influencer-longlist + persbericht in drafts.

## 6. Monetisatie-optimalisatie (omzet)
- **Paywall/pricing testen:** jaarabonnement toevoegen (hoger LTV, betere marge dan maandelijks) + evt. lifetime. Trial-lengte testen (7 vs 30 dagen conversie).
- **Onboarding → paywall flow** optimaliseren (waarde tonen vóór de vraag).
- **Win-back offers** voor verlopen trials (via App Store/Play promoties).
- **Ratings-prompt** op het juiste moment (na een goede slaapsessie) — meer/betere reviews = hogere ranking = meer organische installs.
- Later: **Apple Search Ads / Google App Campaigns** met klein budget zodra CAC vs LTV klopt (pas ná organische basis).

## 7. E-mail (pas uitvoeren zodra Apple live is)
- Via **Mailchimp** (niet de NAS-server): aankondiging naar bestaande contacten/nieuwsbrief, launch-mail, influencer-outreach.
- Persoonlijke 1-op-1 mails (geen bulk) mogen via The IT Crowd.

## 8. "Alle landen" — lokalisatie
- Store-listings + eerste social-hooks vertalen naar de grote slaap-markten (EN, DE, FR, ES, PT-BR, IT, JP, KR). Grootste hefboom voor wereldwijde installs zonder ad-spend.

## 9. Wat ALLEEN Ed kan doen (checklist)
- [ ] Social accounts aanmaken: TikTok, Instagram, YouTube, Pinterest, Facebook (handle `duskiapp`/variant). Login-gegevens veilig bewaren (niet naar mij mailen in platte tekst).
- [ ] Google Play listing-status bevestigen/afmaken + publiceren.
- [ ] Product Hunt: account + hunter regelen.
- [ ] Mailchimp: account/toegang + verzenddomein verifiëren (zie ook OG-Consent alias-werk).
- [ ] Eventueel klein ad-budget vrijgeven (later).
- [ ] **v1.1 = Engelse (en later meer) UI-lokalisatie** akkoord — de app is nu alleen NL; voorwaarde voor internationale ASO/Product Hunt (zie marketing/LOKALISATIE-EN-ASO.md).
- [ ] Persbericht NL (marketing/LAUNCH-KIT.md): plaatsnaam + citaat goedkeuren; of/hoeveel Premium-promocodes voor pers.

## 10. Wat ik (Claude) doe in de routine
Per idle-run 2 acties, bijv.: ASO-teksten per taal schrijven, social-scripts/hooks batchen, persbericht/pitch-templates opstellen, Product-Hunt-launchpagina voorbereiden, screenshots-tekst-overlays specificeren, monetisatie-experimenten uitschrijven. Alles in drafts in deze repo (MARKETING-LOG.md bijhouden). Zodra Apple live is: mail-/info-acties daadwerkelijk uitvoeren (via Mailchimp / The IT Crowd).
