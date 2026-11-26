# Duski — verbeterplan voor meer downloads en meer actieve gebruikers

Opgesteld 26 november 2026 door Claude, op verzoek van Ed ("sommigen zien de app wel, maar downloaden niet").
Gebaseerd op de huidige App Store-pagina (versie 1.3), de code en een korte vergelijking met concurrenten.

## 1. Diagnose: waar lekt het?

Mensen zien de app wel, maar downloaden niet. Dan zit het probleem op de **productpagina** (de conversie), niet in de app zelf.
Wat een bezoeker nu ziet:

| Punt | Duski nu | Gangbaar bij de top-apps | Effect |
|---|---|---|---|
| Screenshots | **2 per toestel** (iPhone en iPad) | 6–10, met korte koptekst | Groot: de eerste 3 beelden bepalen of iemand doorleest |
| Beoordelingen | **2** (gemiddeld 5,0) | honderden tot duizenden | Groot: weinig sociaal bewijs |
| Categorie | Lifestyle (+ Entertainment) | Gezondheid en fitness | Middel: je staat niet tussen de slaap-apps in lijsten en zoekfilters |
| Preview-video | geen | vaak 15–30 s | Middel |
| Voorbeeld van het geluid | niet te horen op de pagina | video met geluid | Middel |
| Prijsverhaal | "gratis, Premium €0,99/mnd" | "gratis proef", "zonder reclame" bovenaan | Klein tot middel |

**Kort:** de pagina laat te weinig zien en heeft te weinig bewijs. Dat is ook het goedkoopste om te verbeteren.

Check zelf (5 min): App Store Connect › App Analytics › Conversieratio (weergaven van de productpagina → downloads) per land,
en Play Console › Gebruikers werven › Winkelvermelding. Dan weten we het startpunt en kunnen we het effect meten.

## 2. Stappenplan

### Fase 1 — Productpagina (week 1–2) · grootste winst, weinig bouwwerk
1. **8 screenshots per toestel met koptekst**, in alle 8 talen (zelfde aanpak als Dicom Viewer 2.2, automatisch gemaakt). Volgorde:
   1. "Slaap sneller in" — de mixer met een mooie mix
   2. "Veilig voor je baby" — babymodus met volumelimiet
   3. "Voor elke leeftijd" — de vijf groepen (zie fase 2)
   4. "Mix je eigen geluid" — volume per laag
   5. "Sleeptimer die zacht uitdooft"
   6. "Klassiek: Bach, Debussy, Satie"
   7. "Geen account, geen reclame, werkt offline"
   8. Schermbeveiliger/schaapjes tellen
2. **Categorie wijzigen naar Gezondheid en fitness** (tweede: Lifestyle). Dit is een beslissing voor Ed.
3. **Preview-video** (15–30 s) per platform: hergebruik de YouTube Shorts (audio komt uit de app-engine).
4. **Productpagina-optimalisatie (A/B-test)** in App Store Connect (gratis): test twee iconen of twee eerste screenshots tegen elkaar.
5. **Aangepaste productpagina's**: één voor ouders van baby's en één voor volwassenen/slapeloosheid. Gebruik die links in de influencer-DM's en mails, zodat een ouder meteen baby-screenshots ziet.
6. **Google Play**: dezelfde screenshots, een nieuwe feature-graphic en een "Store listing experiment".
7. **Meer beoordelingen**: `BeoordelingsVerzoek.swift` bestaat al. Vraag op een goed moment, bijvoorbeeld de ochtend na de 3e nacht waarin de sleeptimer tot het eind liep. Beantwoord elke review.

### Fase 2 — In de app: sneller waarde, vaker terugkomen (week 2–4)
1. **"Voor jou"-kaart bovenaan, per leeftijdsgroep** (Eds idee). Eén tik en een kant-en-klare mix speelt:

   | Groep | Bovenste keuze | Waarom |
   |---|---|---|
   | Baby (0–1) | "Baarmoeder + sussen" (en: hartslag) | Lijkt op geluid in de buik; meest gebruikte babygeluiden |
   | Kind (1–12) | "Slaapliedje-speeldoos + zachte regen" (nieuw geluid) | Vertrouwd en rustig |
   | Tiener (13–17) | "Bruine ruis + regen", later lo-fi | Bruine ruis is populair bij jongeren, ook voor focus |
   | Volwassene (18–64) | "Regen + onweer in de verte" (nieuw) of bruine ruis | Meest gekozen bij slapeloosheid |
   | 65+ | **Klassiek: Debussy *Clair de Lune* of Bach *Air* + zachte regen** | Onderzoek: langzame instrumentale muziek (60–80 bpm) verbetert de ervaren slaapkwaliteit bij ouderen |

   Bij 65+ ook: grotere letters en knoppen, en de "Voor jou"-kaart met één grote afspeelknop.
2. **Kant-en-klare mixen** per groep (3–4 stuks, "recepten") naast de vrije mixer. Nieuwe gebruikers horen dan binnen 5 seconden iets moois.
3. **Gratis laag ruimer maken** (beslissing voor Ed). Nu is 4 van de 26 geluiden gratis. Voorstel: de "Voor jou"-mix van je eigen groep is altijd gratis. Wie elke avond gratis goed slaapt, blijft, beoordeelt en neemt later eerder Premium.
4. **Doorgaan waar je was**: een grote knop "Speel mijn mix van gisteren" bij openen.
5. **Snel starten zonder de app te openen**: een widget, een knop in het bedieningspaneel (iOS 18+ Controls) en een Siri-opdracht ("Start Duski"). Op Android een Quick Settings-tegel. Dit zorgt voor dagelijks gebruik.
6. **Bedtijdherinnering** (opt-in, lokaal): "Tijd om te ontspannen?" op een zelfgekozen tijd. Geen tracking nodig.
7. **Onboarding**: na de leeftijdskeuze meteen de "Voor jou"-mix laten spelen, met een korte uitleg in één scherm.

### Fase 3 — Nieuwe geluiden: wat de grote apps hebben en Duski nog niet (week 3–8)
Wat Duski al heeft: 5 soorten ruis, regen, golven, wind, kampvuur, beek, hartslag, baarmoeder, ademhaling, sussen, föhn, klankschaal, ventilator, trein, klok, vliegtuig, auto, 5 klassieke stukken.

Wat bij concurrenten steeds terugkomt en bij Duski ontbreekt (in volgorde van verwacht belang):
1. **Onweer** (regen + onweer in de verte), een van de meest gekozen geluiden
2. **Stofzuiger** (baby's): standaard in baby-apps, naast föhn en ventilator
3. **Speeldoos-slaapliedjes**: Brahms *Wiegenlied*, *Twinkle Twinkle* / *Altijd is Kortjakje ziek*, Mozart. Alle publiek domein, en te genereren met de bestaande melodie-engine
4. **Spinnende kat**
5. **Krekels / zomernacht**
6. **Bos met vogels** (ochtend)
7. **Wasmachine / droger**
8. **Regen op een tentdoek / op het dak** (variant op regen)
9. **Waterval**
10. **Lo-fi / zacht ambient-tapijt** (tieners en volwassenen)

Extra klassiek voor 65+ (langzaam, publiek domein): Chopin *Nocturne op. 9 nr. 2*, Beethoven *Mondscheinsonate* (deel 1), Schumann *Träumerei*, Satie *Gnossienne nr. 1*, Brahms *Wiegenlied* (ook voor kinderen).

Alles kan met de eigen synthese-engine, net als de huidige geluiden. Daardoor blijft er geen licentierisico. Elk nieuw geluid is ook een update en een marketingmoment ("Nieuw: onweer").

### Fase 4 — Bereik (doorlopend)
- Influencer-outreach blijft (max. 100 codes/maand), maar dan met links naar de **aangepaste productpagina's**.
- YouTube Shorts per nieuw geluid ("1 uur onweer – Duski"), met beide store-links.
- Seizoensmomenten: wintertijd, zomerhitte (ventilator), feestdagen of reizen (vliegtuig, auto).
- Lokaliseer de winkelpagina's verder voor landen waar al downloads vandaan komen (zie App Analytics).

### Fase 5 — Meten (vanaf week 1)
Zonder tracking in de app, alleen met de cijfers van Apple en Google:

| Meetpunt | Waar | Doel na 8 weken |
|---|---|---|
| Conversie productpagina → download | ASC App Analytics / Play Console | ×2 t.o.v. nu |
| Aantal beoordelingen | App Store / Play | van 2 naar 25+ |
| Actieve apparaten en sessies per dag | ASC (gebruikers die delen) / Play | stijgend, week op week |
| Retentie dag 1 / dag 7 | ASC App Analytics | dag 7 ≥ 20 % |
| Premium-proeven en -omzettingen | ASC Abonnementen | meer proeven na fase 2 |

## 3. Beslissingen voor Ed

**26 nov 2026: Ed zei "ja op alle vier".** Stand van uitvoering:
- 1.4 gebouwd (commit 2b0b9fa): "Voor jou"-kaart per leeftijd (altijd gratis, ook met premium-lagen), onweer, stofzuiger, speeldoos-slaapliedjes, grotere tekst voor 65+. Ed testte op zijn iPhone: "ziet er goed uit".
- ASC: versie 1.4 aangemaakt, categorie Gezondheid en fitness + Lifestyle (gaat in met 1.4), "Wat is er nieuw" en beschrijving (29 geluiden, "Voor jou") in 11 locales, 8 screenshots met koptekst per toestel in 8 talen (`AppStore/1.4/`).
- Nog: build 12 uploaden en koppelen, pre-release-check, Ed dient in. Daarna: Play (categorie via Play Console door Ed; Android-versie van 1.4), preview-video, A/B-test en aangepaste productpagina's.

1. **Categorie** naar Gezondheid en fitness? (advies: ja)
2. **Gratis laag ruimer** (de "Voor jou"-mix altijd gratis)? (advies: ja)
3. **Volgorde nieuwe geluiden**: akkoord met onweer, stofzuiger, speeldoos als eerste drie?
4. Mag Claude de **screenshots en video** maken en in App Store Connect en Play zetten (zoals bij Dicom Viewer)?

## 4. Voorgestelde planning
| Week | Wat | Wie |
|---|---|---|
| 1 | 8 screenshots × 8 talen, categorie, A/B-test starten, review-moment verbeteren | Claude (Ed: categorie-akkoord) |
| 2 | "Voor jou"-kaart + mixen per leeftijd, 65+ grotere letters, versie 1.4 | Claude bouwt, Ed test en dient in |
| 3–4 | Widget, Control Center-knop, Siri, Android-tegel, bedtijdherinnering | Claude |
| 3–8 | Nieuwe geluiden in 2–3 updates (onweer, stofzuiger, speeldoos eerst) | Claude |
| doorlopend | Outreach met aangepaste productpagina's, Shorts per nieuw geluid | dagelijkse routine |

Bronnen voor de geluidenvergelijking en ouderen/muziek:
[Sleep Foundation – best white noise apps](https://www.sleepfoundation.org/best-sleep-apps/best-white-noise-apps),
[Babylist – best sound machines](https://www.babylist.com/hello-baby/best-sound-machines),
App Store-vermeldingen van o.a. [White Noise Deep Sleep Sounds](https://apps.apple.com/app/id1083248251) en [Sleeptot](https://apps.apple.com/app/id1229010143),
[Frontiers in Sleep 2025 – muziek en slaap](https://www.frontiersin.org/journals/sleep/articles/10.3389/frsle.2025.1707162/full),
[Slumber Studios – klassieke muziek en slaap](https://slumberstudios.com/blog/classical-music-for-sleep/).
