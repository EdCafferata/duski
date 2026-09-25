# Duski — lokalisatie-gap + ASO-roadmap (draft, 25 sep 2026)

## ⚠️ Bevinding: de iOS-app is alleen Nederlandstalig
- Alle UI-teksten staan hardcoded in het Nederlands in de Swift-views (`Text("Voor wie is dit toestel?")`,
  `Text("Tik om terug te gaan")`, `"Sleeptimer"`, …). Er is geen String Catalog (`Localizable.xcstrings`);
  `knownRegions` in het project = alleen `en` + `Base`.
- Omvang: grofweg **60–90 unieke UI-strings** (8 views + modellen: categorie-/geluidsnamen, leeftijdsgroepen,
  screensaver-namen, paywall `PremiumView`, `VeiligheidsBanner`, `SlaapTimerKaart`).
- Gevolg: de **en-US-listing belooft impliciet een Engelstalige app**. Een Engelse/Duitse/… gebruiker die
  installeert krijgt Nederlands → slechte reviews + refunds, en Apple kan op 2.3 (accurate metadata) vallen.
- **Daarom schrijf ik nog géén store-teksten voor DE/FR/ES/PT/IT/JA.** Eerst de app zelf vertalen.

## Voorstel v1.1 (pas ná goedkeuring v1.0 — niet de lopende review verstoren)
1. `Localizable.xcstrings` toevoegen, ontwikkeltaal **nl**, `knownRegions` + `nl`, `en`.
   SwiftUI `Text("…")` met letterlijke string is al `LocalizedStringKey` → strings verschijnen automatisch in
   de catalog na een build; alleen strings die via `String`-variabelen lopen (enum `rawValue`s voor
   categorie/leeftijd/screensaver) omzetten naar `String(localized:)` of `LocalizedStringResource`.
2. Eerste golf: **EN** (grootste markt). Daarna DE, FR, ES, PT-BR, IT, JA (zie ASO-drafts hieronder).
3. Paywall-teksten (prijs, verlenging, EULA/privacy) extra zorgvuldig: 3.1.2(c) geldt per taal.
4. Screenshots per taal opnieuw maken (simulator met `-AppleLanguages "(en)"`).
- **Geen beslissing van Ed nodig** voor de techniek; wél timing: pas bouwen/indienen als v1.0 live is.
  → staat op de Ed-checklist als "akkoord op v1.1 = lokalisatie".

## Tussentijdse fixes lokale metadata (gedaan in deze run)
- `fastlane/metadata/{en-US,nl-NL}/` wezen nog naar `edcafferata.github.io/duski/…` en support `cafferata.info`.
  Live in ASC staat al `cafferata.info/duski/…` (via API gezet op 24 sep). Lokale bestanden gelijkgetrokken
  zodat een toekomstige metadata-upload niet terugvalt op de oude URL's.

## ASO-drafts (klaar voor gebruik zodra de UI in die taal bestaat)
Apple: naam 30 · subtitel 30 · keywords 100 tekens (komma's, geen spaties, geen woorden die al in
naam/subtitel staan). Play: titel 30 · korte beschrijving 80.

### en-US (UI-vertaling eerst!)
- Subtitel (30): `White noise & baby sleep` (24)
- Keywords (100): `rain,brown noise,pink noise,nap,insomnia,relax,calm,timer,lullaby,womb,heartbeat,fan,tinnitus`
  (93 — `white`, `noise`, `baby`, `sleep` al gedekt door subtitel; geen herhaling)
- Promo-tekst (170): `Mix your own sleep sounds — all generated on your device, with a safe volume limit for babies. No recordings, no account. Free for 30 days.`
- Play korte beschrijving (80): `Mix calming sleep sounds: white & brown noise, rain, womb sounds. 30 days free.` (79)

### nl-NL (UI is al NL → mag nu al naar ASC als Ed akkoord is met metadata-wijziging na livegang)
- Subtitel (30): `Witte ruis & babyslaapgeluid` (28)
- Keywords (100): `regen,bruine ruis,roze ruis,inslapen,ontspanning,rust,timer,slaapliedje,hartslag,föhn,tinnitus` (94)
- Promo-tekst: `Meng je eigen slaapgeluiden — volledig op je toestel gemaakt, met veilige volumelimiet voor baby's. Geen opnames, geen account. 30 dagen gratis.`
- Play korte beschrijving (80): `Meng rustgevende slaapgeluiden: witte & bruine ruis, regen. 30 dagen gratis.` (76)

### de-DE (wacht op DE-UI)
- Subtitel: `Weißes Rauschen & Babyschlaf` (28)
- Keywords: `einschlafen,regen,braunes rauschen,schlafhilfe,entspannung,timer,schlaflied,herzschlag,föhn,tinnitus` (100)
- Play kort: `Schlafgeräusche mischen: weißes & braunes Rauschen, Regen. 30 Tage gratis.` (74)

### Overige talen — keyword-richting (uitwerken zodra UI-vertaling gepland is)
- **fr-FR:** bruit blanc, sommeil bébé, pluie, bruit brun, endormissement, relaxation, berceuse, acouphènes
- **es-ES / es-MX:** ruido blanco, dormir bebé, lluvia, ruido marrón, insomnio, relajación, canción de cuna
- **pt-BR:** ruído branco, sono do bebê, chuva, ruído marrom, insônia, relaxar, canção de ninar
- **it-IT:** rumore bianco, sonno neonato, pioggia, rumore marrone, insonnia, rilassamento, ninna nanna
- **ja:** ホワイトノイズ, 睡眠, 赤ちゃん 寝かしつけ, 雨音, 胎内音, 快眠, タイマー

## Screenshot-overlays (NL nu, EN na vertaling) — 6 schermen
1. „Val sneller in slaap" / "Fall asleep faster" — mixer met 3 lagen actief
2. „Meng je eigen slaapmix" / "Mix your own sleep sound" — laag-volumes
3. „Veilig volume voor baby's" / "Safe volume for babies" — onboarding leeftijdskeuze + banner
4. „Stopt vanzelf" / "Stops on its own" — sleeptimer 15–90 min
5. „Rustig beeld in het donker" / "Calm screen in the dark" — schaapjes-screensaver
6. „30 dagen gratis" / "Free for 30 days" — paywall (prijs zichtbaar, geen verborgen voorwaarden)
