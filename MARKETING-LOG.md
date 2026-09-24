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
