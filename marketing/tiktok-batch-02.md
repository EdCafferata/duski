# Duski — TikTok/Reels-pakket #02 (DRAFTS, 26 sep 2026)

_Vervolg op `tiktok-batch-01.md`. Focus: content-pilaren **3 (slaap-tips & uitleg)**, **2 (POV/relatable)** en
**4 (behind-the-app)**, met de geluiden en functies die in batch-01 nog niet gebruikt zijn. NL-only: de app-UI is
alleen Nederlands (zie `LOKALISATIE-EN-ASO.md`), dus geen EN-captions vóór v1.1._

**Gecheckt tegen de code (26 sep):** alle genoemde geluiden staan in `Duski/Models/GeluidCategorie.swift`;
slaaptimer-opties 15/30/45/60/90 min met 30 s uitfaden (`Audio/SlaapTimer.swift`); baby-modus begrenst het volume
op 50 % (`Models/LeeftijdsGroep.swift`); screensavers incl. schaapjes tellen (`Models/ScreensaverOptie.swift`).
**Niet claimen:** onweer, oceaan-"surf" anders dan *Golven*, krekels, vogels, stemmen/verhalen, slaaptracking.

**Posten:** alleen in een sessie mét Ed erbij (zie memory — de routine post niet onbeheerd). Pre-launch-regel
uit batch-01 blijft: géén harde App-Store-CTA zolang Apple niet live is; Google Play mag wel ("link in bio" zodra
er een zakelijk account/link is).

**Toon & claims (vaste regel voor dit pakket):** "kan helpen", "veel mensen vinden", nooit "geneest",
"tegen slapeloosheid", "therapie". Bij tinnitus alléén "maskeren/afleiden" en altijd "bij klachten: huisarts".
Baby-clips: telefoon **niet in het bedje**, volume laag, baby-modus tonen.

---

### 13. Kleur-ruis uitgelegd in 20 seconden (pilaar 3)
- **Hook (0–2s):** "wit, roze, bruin… waarom heeft ruis kleuren? 🎨"
- **Beeld:** schermopname Ruis-categorie; per kleur 3 s laten horen: wit → roze → bruin → grijs → blauw.
- **On-screen tekst per cut:** "wit = alle tonen even hard" · "roze = hoge tonen zachter" · "bruin = nog dieper, als
  een verre waterval" · "grijs = klinkt voor je oor 'vlak'" · "blauw = juist helderder".
- **Payoff:** "de meeste mensen slapen het fijnst bij roze of bruin. jij?"
- **Caption:** "Welke kleur is jouw ruis? 🤔 #whitenoise #brownnoise #pinknoise #slaaptips"
- **Productie:** `make_clip.py` per ruiskleur (bestaande pijplijn kan al bruine ruis; roze/grijs/blauw toevoegen of
  opname uit de simulator).

### 14. "Waarom slaap je beter bij regen?" (pilaar 3)
- **Hook:** "waarom word je zo slaperig van regen? 🌧️"
- **Tekst-cuts:** "gelijkmatig geluid, geen verrassingen" → "het dekt plotselinge geluiden af (buren, verkeer)" →
  "je brein hoeft niet 'op te letten'".
- **Beeld:** Duski met alleen *Regen* aan, daarna *Wind* zacht erbij.
- **Caption:** "Regen = het ultieme achtergrondgeluid. Eens? #regengeluid #slapen #rust"
- **Let op:** uitleg houden bij 'maskeren' — geen harde wetenschappelijke claims zonder bron.

### 15. POV: je slaapt in een hotel naast de lift (pilaar 2)
- **Hook:** "POV: hotelkamer naast de lift 🛗😩"
- **Beeld:** "ding"-lift-humor (tekst, geen echt liftgeluid nodig) → Duski open → *Ventilator* + *Bruine ruis*.
- **Payoff tekst:** "thuisgevoel, overal. werkt offline, geen account."
- **Caption:** "Reistip die niemand je vertelt 🧳 #reistips #hotel #slapen"

### 16. Het vliegtuigcabine-geluid (pilaar 1/2)
- **Hook:** "waarom val je in het vliegtuig WÉL in slaap? ✈️"
- **Beeld:** scherm met *Vliegtuigcabine* aan, rustige animatie-screensaver.
- **Payoff:** "dat gebrom zit gewoon in je telefoon. zonder turbulentie."
- **Caption:** "Wie herkent dit? 😴 #vliegtuig #slaapgeluiden #asmr"

### 17. Oude-school: de tikkende klok (pilaar 2)
- **Hook:** "net als vroeger bij oma 🕰️"
- **Beeld:** *Tikkende klok* + *Kampvuur*; screensaver 'deinen'.
- **Caption:** "Rustgevend of juist irritant? Zeg het eerlijk 😅 #nostalgie #oma #slapen"
- **Doel:** comment-haakje (discussie → bereik).

### 18. Klassiek slapen: Satie / Debussy (pilaar 1)
- **Hook:** "klassiek als slaapmuziek, maar dan zacht 🎹"
- **Beeld:** *Satie – Gymnopédie* of *Debussy – Clair de Lune* + zachte *Regen* eronder; screensaver twinkelen.
- **Tekst:** "zelf opnieuw gegenereerd in de app — publiek domein, geen rechten-gedoe".
- **Caption:** "Clair de Lune + regen = 🌙 #klassiekemuziek #slaapmuziek #debussy"

### 19. Slaaptimer die langzaam uitfadet (pilaar 4)
- **Hook:** "geluid dat midden in de nacht afknapt? niet meer 🙅"
- **Beeld:** timer op 15 min zetten → (versneld) laatste 30 s: volumeschuiven zakken zichtbaar mee.
- **Tekst:** "kies 15–90 min. laatste 30 seconden fadet alles zacht uit."
- **Caption:** "Kleine functie, groot verschil 🔉 #slaaptimer #app #slapen"
- **Productie:** schermopname timer-kaart + fade (vergt echte simulator-opname in een sessie mét Ed).

### 20. Schaapjes tellen, maar dan letterlijk (pilaar 4, humor)
- **Hook:** "schaapjes tellen, maar dan in 2026 🐑"
- **Beeld:** de schaapjes-screensaver full-screen, *Hartslag* of *Regen* eronder.
- **Caption:** "Hoeveel tel jij er voordat je slaapt? 🐑💤 #schaapjestellen #slapen #humor"

### 21. Ouders: de föhn-truc (pilaar 1, baby)
- **Hook:** "de föhn-truc die ouders al jaren doen 👶💨"
- **Beeld:** tekst-intro → Duski *Föhn* + *Sussen (shhh)*; leeftijdsgroep **Baby** laten zien met de volumelimiet.
- **Tekst:** "geen echte föhn nodig. volume blijft in baby-modus begrensd."
- **Veilig-slapen-regel in beeld of caption:** "telefoon buiten het bedje, volume laag."
- **Caption:** "Welke ouder herkent dit? 🙋 #baby #ouders #babyslaap #mamaleven"

### 22. Baarmoedergeluiden & hartslag (pilaar 3, baby)
- **Hook:** "waarom worden baby's rustig van 'shhh'? 🤫"
- **Tekst-cuts:** "in de buik was het helemaal niet stil" → "gedempt ruisen + hartslag" → "vertrouwd geluid = rust".
- **Beeld:** *Baarmoedergeluiden* + *Hartslag*, baby-modus zichtbaar.
- **Caption:** "Voor alle nieuwe ouders 💛 #babyslaap #kraamtijd #nieuweouders"
- **Let op:** geen belofte "slaapt de nacht door"; alleen "kan helpen tot rust te komen".

### 23. Trein-geluid voor pendelaars (pilaar 2)
- **Hook:** "iedereen die ooit in de trein in slaap viel 🚂"
- **Beeld:** *Trein* + *Regen*; tekst "nu zonder je halte te missen".
- **Caption:** "Pendelaars weten het 😴 #ns #trein #slapen"
- **Let op:** "#ns" alleen als hashtag, geen NS-logo/branding in beeld.

### 24. Ademhalingsritme als afsluiter (pilaar 3)
- **Hook:** "adem mee. 10 seconden. 🫁"
- **Beeld:** *Ademhaling* + *Klankschaal* (gratis geluid), screensaver 'drijven omhoog'; tekst "in… … uit…".
- **Payoff:** "zo klinkt je avond-routine vanaf nu."
- **Caption:** "Probeer 'm voor het slapen 🌙 #ademhaling #ontspanning #avondroutine"
- **Let op:** geen medische ademhalingsclaim, puur ontspanning.

---

## Serie-idee: "Mix van de week" (vast format, makkelijk te herhalen)
Elke week één combinatie van 2–3 lagen met naam + emoji, bv. **"Berghut"** (Kampvuur + Wind + Tikkende klok),
**"Nachttrein"** (Trein + Regen), **"Strandhuis"** (Golven + Wind), **"Kraamkamer"** (Hartslag + Sussen, baby-modus),
**"Studiezaal"** (Roze ruis + Regen). Eén vaste intro-tekst ("Mix van de week #1"), zodat kijkers terugkomen.
Alle lagen bestaan in de app.

## Wat Ed nog moet doen voor dit pakket
- [ ] Schermopnames in de simulator mét geluid voor #19 (timer-fade) en #20/#21 (screensaver, baby-modus) — onbeheerde
      routine kan de simulator-UI niet bedienen.
- [ ] Per post "ja, post" geven in een sessie (of via een `Claude???`-mail).
