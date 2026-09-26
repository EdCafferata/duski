# Duski — Marketing-log

## 2026-09-24
- Masterplan opgezet (MARKETING-PLAN.md).
- Duski bevestigd LIVE op **Google Play** (Apple nog in review).
- **TikTok studio-account ingericht** (@cafferatae → naam "The IT Crowd" + bio) via Claude-in-Chrome.
- **TikTok-startpakket #01** klaar (marketing/tiktok-batch-01.md): 12 video-concepten + profiel-setup + postritme + hashtag-banken.
- **Profielfoto** ✅ oranje iT CROWD-logo geüpload via Claude-in-Chrome.
- Openstaand voor Ed: Business-account voor klikbare link, voorwaarden-melding wegklikken, content filmen/uploaden.

## 2026-09-25
- **Eerste TikTok GEPOST** (publiek) op @cafferatae/The IT Crowd: clip #1 "Je eigen slaapmix in 10 seconden" (mixer-demo, 12s). Caption + 7 hashtags. Via Claude-in-Chrome → TikTok Studio.
- **Clip-pijplijn gevalideerd** (marketing/make_clip.py): screenshot + PIL-tekst + ffmpeg + bruine ruis → 1080x1920 mp4 (~6s render, ~460KB).
- **Learnings voor volgende posts (belangrijk):**
  1. TikTok Studio-upload: `tiktok.com/tiktokstudio/upload`, file-input via find→file_upload.
  2. Caption is een contenteditable combobox → **triple_click + type** (form_input/losse type werkt niet).
  3. Bij upload verschijnt dialoog "Automatische contentcontroles inschakelen?" → **Annuleren** (optioneel, geen voorwaarden).
  4. Nieuwe posts staan default op **"Alleen ik"** → na plaatsen op de Content-pagina de privacy-dropdown op **"Iedereen"** zetten.
  5. **Screenshots time-outen** op TikTok Studio (zware pagina) → werk via read_page/find, niet screenshot.
  6. Post komt eerst "Content wordt beoordeeld" → wordt vanzelf publiek.
- **Routine 15:12 (2 acties, drafts — Apple nog Waiting for Review, via ASC-API gecheckt):**
  1. **Lokalisatie-gap + ASO** (`marketing/LOKALISATIE-EN-ASO.md`): bevinding — de iOS-UI is **alleen Nederlands**
     (hardcoded, geen String Catalog), terwijl er een en-US-listing is. Daarom géén DE/FR/ES/…-store-teksten
     gepubliceerd; wel v1.1-lokalisatieplan + gevalideerde ASO-drafts (tekenlimieten gecheckt) voor NL (nu bruikbaar),
     EN en DE (na UI-vertaling) + keyword-richting FR/ES/PT/IT/JA + 6 screenshot-overlays. Lokale
     `fastlane/metadata/*/*_url.txt` gelijkgetrokken met live (cafferata.info/duski/…, alle 200).
  2. **Launch-kit** (`marketing/LAUNCH-KIT.md`): persbericht NL (bij livegang), 1-op-1-pitchtemplate, EN-press release +
     Product-Hunt-draft (beide pas na EN-UI). Ed-checklist aangevuld (v1.1-akkoord, citaat, promocodes, PH-account).
- **Routine 21:12 (2 acties, drafts — Apple nog WAITING_FOR_REVIEW via ASC-API; geen nieuwe mail van Ed):**
  1. **Monetisatie-voorstel** (`marketing/MONETISATIE-VOORSTEL.md`): review-prompt-timing (v1.1), jaarabonnement met
     3 prijsvarianten ter keuze, trial-lengte (pas na data), offer codes voor pers, win-back, sterkere paywall-copy
     (3.1.2(c)-elementen blijven). **Niets doorgevoerd — beslissingen Ed**; ook gevlagd: Play Console had op 30 aug
     nog geen abonnementsproduct.
  2. **YouTube long-form-pakket** (`marketing/YOUTUBE-LONGFORM.md`): 6 evergreen video's (titels/thumbnail-tekst NL,
     EN na v1.1), beschrijvingssjabloon met baby-veiligheidsregel, rechten-check (100 % procedureel + publiek-domein-
     composities), ffmpeg-productierecept (60 min opname → 8–10 u).
  - **Correctie:** TikTok-batch-01 (#1/#3/#5/#11) en MARKETING-PLAN §3 noemden onweer/oceaan/krekels — die
    geluiden zitten **niet** in Duski → vervangen door echte app-geluiden (geen misleidende clips).

## 2026-09-26
- **Routine 03:12 (2 acties, drafts — Apple nog WAITING_FOR_REVIEW via ASC-API; geen nieuwe mail van Ed):**
  1. **TikTok/Reels-pakket #02** (`marketing/tiktok-batch-02.md`): 12 nieuwe scripts (#13–#24) + serie "Mix van de week",
     gericht op uitleg (kleur-ruis, regen), POV/humor (hotel, vliegtuig, trein, klok, schaapjes) en de nog ongebruikte
     functies/geluiden (slaaptimer-fade, baby-modus-volumelimiet, föhn/sussen/baarmoeder, Satie/Debussy). Alles
     gecheckt tegen de code; claimregels (geen medische beloftes, veilig-slapen bij baby-clips) vastgelegd.
  2. **Launchdag-draaiboek** (`marketing/LAUNCHDAG-DRAAIBOEK.md`): trigger via ASC-API, volgorde van acties, site-snippets
     voor cafferata.info, LinkedIn-launchtekst, 1-op-1-follow-up voor al gepitchte NL-sites. **Bevinding:** release staat
     op **AFTER_APPROVAL** → Duski gaat automatisch live bij goedkeuring; routine moet dat zelf oppikken.
