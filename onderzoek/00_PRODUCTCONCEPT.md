# Productconcept — "Slaap-app" (werktitel, naam nog niet gekozen)

> Samengesteld door Claude, 8 juli 2026, op basis van vier onderzoeksrapporten
> (zie `01_demografie_wetenschap_appstore.md` en `02_muziek_en_geluidscategorieen.md`
> voor de volledige bronnen). Dit is de synthese (onderzoeksvraag 6: alles samenvoegen
> tot 1 app) en het startpunt voor de bouw.

## Positionering

Een wereldwijde, wetenschappelijk-onderbouwde slaapgeluiden-app met:
1. **100% zelf gegenereerde audio** (geen opnames/muziek van derden — dus geen enkel
   rechtenrisico, zie sectie Audio-engine).
2. **Culturele personalisatie** — niet alleen vertaalde teksten, maar regio-passende
   content (zie sectie Doelgroepen/lokalisatie) — dit is een aantoonbare
   effectiviteitsfactor uit het onderzoek, niet alleen marketing.
3. **Eerlijke wetenschap** — features gebaseerd op wat echt onderbouwd is, met een
   ingebouwde grens tegen pseudowetenschappelijke claims (zie sectie Wat we WEL/NIET
   claimen).
4. **Vroege Liquid Glass-adoptie + wit gebied benutten** waar de grote spelers
   (Calm/Headspace) nog niet zitten: Apple Intelligence-achtige personalisatie,
   Live Activities/Dynamic Island voor een lopende sessie — zie sectie Differentiatie.

## Doelgroepen en lokalisatie

Op basis van AASM/WHO/NSF-richtlijnen (zie onderzoek) bouwen we **leeftijdsprofielen**,
geen aparte apps:
- **Baby (0-12 mnd)**: witte-ruis/hartslag/baarmoedergeluiden, met **verplichte
  volumewaarschuwing en -limiet** (onderzoek: alle geteste baby-geluidsmachines op
  max. volume overschreden ziekenhuis-veilige niveaus; AAP-advies: >2m afstand,
  <50 dB). Dit is geen keuze maar een verantwoordelijkheid, gezien wie de doelgroep is.
- **Kind (1-12 jaar)**: slaapliedjes/verhaaltjes-toon, kortere sessies, geen
  binaurale-beats-content (niet onderzocht bij kinderen).
- **Tiener/volwassene (13-64 jaar)**: volledige bibliotheek: natuur, wit-ruis-familie,
  ambient-plekken, meditatie/klankschalen, binaurale beats (met duidelijke "voorlopig
  bewijs"-context, niet als wondermiddel verkocht).
- **Oudere (65+)**: grotere lettertypen/eenvoudiger bediening als toegankelijkheidsoptie,
  content zoals roze ruis (onderzoek specifiek positief bij oudere volwassenen).

**Cultureel/regionaal** (uit onderzoek): naast de universele "slow-tempo instrumentale"
basislaag (klassiek, ambient, lo-fi) een regionale contentlaag — Arabisch instrumentaal
voor MENA, Aziatische traditionele instrumenten, Latijns-Amerikaanse zachte
instrumentale muziek, en region-specifieke content-toon voor slaapliedjes (India/Afrika
kennen sterke eigen tradities). Optioneel: een "siësta-modus" (korte dutjes-timer,
20-30 min, cultureel relevant voor Zuid-Europa/Latijns-Amerika) naast de
hoofd-nachtmodus — geen enkele cultuur als "afwijkend" framen, gewoon opt-in regio-content.

## Content: alle geluiden 100% procedureel gegenereerd (geen licenties nodig)

Uit onderzoek (zie `02_muziek_en_geluidscategorieen.md`) de volgende categorie-structuur,
allemaal te synthetiseren met AVFoundation/AVAudioEngine (ruis-generatoren, gefilterde
oscillators, envelope-modulatie — geen samples nodig):

| Categorie | Voorbeelden | Synthese-aanpak |
|---|---|---|
| Natuur | regen (licht/zwaar/dak/tent), onweer, wind, golven, beek, vogels, krekels, vuur | gefilterde ruis + envelope-modulatie (regen = hoogdoorlaat-ruis + willekeurige druppel-transiënten; vuur = laagfrequent gerommel + knetter-transiënten) |
| Kleurruis | wit, roze, bruin, groen | digitale ruisfilters (goed gedocumenteerde algoritmes, geen IP-risico) |
| Mechanisch | ventilator, airco, trein, vliegtuigcabine | gefilterde ruis + laagfrequente periodieke modulatie |
| Lichaam/baby | hartslag, baarmoedergeluiden, ademhaling | laagfrequente ritmische amplitude-envelope over gefilterde ruis (nabootsen "lub-dub"-patroon) |
| Meditatie | klankschalen, windklokken, gong | additieve synthese van boventonen (fysiek goed gedocumenteerd, geen samples nodig) |
| Muziek (basis) | rustgevende instrumentale loops | eigen algoritmische compositie: 60-80bpm, mineur, geen percussie/lyrics (exact het wetenschappelijk profiel uit onderzoeksvraag 2) — bijv. generatieve piano/ambient-pad-synthese |
| Binaurale beats | delta (0,5-4Hz) als losse, optionele laag | twee oscillators met klein frequentieverschil per oor — triviaal te implementeren, wél met duidelijke in-app-uitleg over het voorlopige bewijsniveau |

**Waarom dit beter is dan concurrenten**: Endel/Pzizz bewijzen dat generatieve audio
zelfs als marketing-differentiator werkt ("nooit twee keer hetzelfde"). Voor ons is het
in de eerste plaats een **rechten-oplossing**, met generatieve variatie als bonus.

## Wat we WEL en NIET claimen (App Store-compliance + eerlijkheid)

**WEL** (onderbouwd, mag als feature-beschrijving):
- Witte/roze ruis kan helpen bij inslapen, vooral bij baby's en in rumoerige
  omgevingen (Harvard Health, Weill Cornell-onderzoek).
- ASMR-content kan ontspanning bevorderen (meerdere peer-reviewed studies).
- Binaurale beats: "voorlopig, veelbelovend onderzoek" — nooit als bewezen genezing.
- Consistente bedtijdroutine + koelere kamer (15-19°C) + minder blauw licht voor
  bedtijd: stevig onderbouwd, mag als tips-sectie in de app.

**NIET** (expliciet vermijden — pseudowetenschap of misbruikte wetenschap):
- 528 Hz / Solfeggio-frequenties als "helend" of "DNA-herstellend".
- 40Hz als slaaphulp (dit is een alertheids-/focusfrequentie, het tegenovergestelde).
- Bruine ruis als "bewezen" — mag aangeboden worden (populair), niet als
  wetenschappelijk bewezen gepresenteerd.
- Elke medische taal ("geneest", "behandelt insomnia") — wellness-taal alleen
  ("kan helpen ontspannen", "kan bijdragen aan").

## Differentiatie t.o.v. top-apps (Calm, Headspace, Sleep Cycle, BetterSleep, Pzizz, Endel)

- **Liquid Glass vanaf dag 1** — Apple's nieuwe designtaal is pas sinds iOS 26 verplicht
  (september 2026); geen van de onderzochte concurrenten is hier nog specifiek op
  geredesigned. Vroege, doordachte implementatie is een kans voor Apple-featuring.
- **Live Activities/Dynamic Island voor de lopende sessie** — wordt door de grote
  spelers nog nauwelijks ingezet.
- **Geen agressieve paywall** — meest genoemde klacht over Calm/Sleep Cycle in reviews
  is prijsstijgingen en een gratis versie die als "teaser" aanvoelt. Onze aanpak:
  30 dagen volledig gratis (zie pricing), daarna transparant de laagste door Apple
  toegestane prijs per land — geen kunstmatige schaarste in de gratis periode.
- **Volume-veiligheid als feature, niet als kleine lettertjes** — expliciet
  gecommuniceerd voordeel t.o.v. apps die dit niet benoemen.

## Pricing

- Eerste 30 dagen: volledig gratis, geen beperkingen (StoreKit 2 introductory offer /
  free trial op het abonnement).
- Daarna: laagste door Apple toegestane prijstier per land/regio (App Store Connect
  prijstabellen doen dit automatisch per territory zodra het abonnementsproduct is
  aangemaakt — vereist dat het Apple Developer-account-verificatieprobleem is opgelost,
  zie project_apple_developer_account.md, dit is een blokkerende afhankelijkheid voor
  de daadwerkelijke App Store Connect-configuratie, niet voor de code zelf).

## Stroombesparing tijdens gebruik

Technisch kan een app geen Vliegtuigmodus voor de gebruiker aanzetten (geen publieke
iOS-API hiervoor, om veiligheidsredenen). Realistische implementatie:
- Bij start van een sessie: optioneel voorstel/sheet "Wil je storingen beperken?" met
  een directe link naar Instellingen > Focus, of een eigen "Nachtmodus"-Focus-filter
  (iOS Focus API, wél beschikbaar voor apps) die notificaties dempt zolang de sessie
  loopt.
- Zelf energiezuinig zijn: laag CPU-gebruik audio-synthese, scherm mag uitgaan
  (`isIdleTimerDisabled` NIET permanent aanzetten, alleen als gebruiker dat kiest),
  geen onnodige achtergrond-netwerkactiviteit tijdens een sessie.

## Onschuldig "deelbaar" element (i.p.v. het geweigerde schrik-geluid)

In plaats van een verrassings-schrikgeluid (afgewezen, zie eerdere toelichting):
een **grappig gegenereerd "goedemorgen"-deelkaartje** — bijvoorbeeld een speelse
badge/kaart na een voltooide nacht ("Je hebt 8u geslapen terwijl er ergens een kat
2600 keer heeft gespind" — gegenereerd op basis van sessie-statistieken, puur
positief/grappig, niets schrikaanjagends), deelbaar naar sociale media. Zelfde
"viraal potentieel" zonder risico.

## Naamsvoorstellen (kort, wereldwijd uitspreekbaar, .com/app-store-vriendelijk te checken)

Werktitel blijft "slaap-app" tot Ed een naam goedkeurt — pas dan repo/site aanmaken.
Voorstellen (kort, geen taalgebonden woordgrap, makkelijk uit te spreken in meerdere talen):
- **Dozz** (van "doze")
- **Nyra** (klinkt zacht, geen betekenis-conflict in grote talen gecheckt nodig)
- **Somni** (van "somnus", Latijn voor slaap — internationaal herkenbaar)
- **Lullo**
- **Driftly**
- **Hushly**

*(Ed: laat weten welke je wilt, of geef een eigen richting — dan check ik
beschikbaarheid van naam/domein/App Store voordat we 'm definitief vastleggen.)*

## Volgende stappen (technische bouw, al gestart)

1. Lokale Xcode-projectstructuur (SwiftUI, iOS 17 min. target maar Liquid-Glass-ready
   waar beschikbaar).
2. Audio-engine: ruis-/geluid-synthese-modules per categorie (modulair, één
   generator-type per bestand, zoals gebruikelijk in Eds projecten).
3. Basis-UI: sound-mixer-scherm (tiles per categorie, individueel volume), sessie/timer,
   onboarding met leeftijdsgroep-keuze.
4. StoreKit 2-scaffolding voor het abonnement (proefperiode + laagste prijstier).
5. Lokalisatie-structuur (String Catalog) vanaf het begin, niet achteraf.

**Why:** Ed wilde een volledig nieuw wereldwijd product, ditmaal bewust
research-first opgezet in plaats van meteen te bouwen — dit document is het
scharnierpunt tussen onderzoek en code.
**How to apply:** bij een volgende sessie eerst dit bestand lezen voor de volledige
context, dan pas verder bouwen. Naam moet nog door Ed worden goedgekeurd voordat
GitHub-repo/site worden aangemaakt.
