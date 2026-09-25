# Duski — monetisatie-voorstel (DRAFT, beslissing Ed)

_Opgesteld 2026-09-25 door de marketing-routine. **Niets hiervan is doorgevoerd**: prijzen, nieuwe
abonnementen en trial-lengte zijn Eds beslissing. Dit document zet de opties op een rij zodat hij na
de vakantie in één keer kan kiezen. Hoort bij MARKETING-PLAN.md §6._

## Huidige stand (feitelijk, gecheckt in code/ASC-memory)
- **iOS:** één abonnement `info.cafferata.duski.premium.maandelijks` — laagste tier (€0,99/mnd),
  30 dagen gratis proef (introductory offer, geen einddatum), 175 landen. v1.0 build 5 = Waiting for Review.
- **Freemium-knip:** gratis = 4 geluiden (Witte ruis, Regen, Hartslag, Klankschaal) + timer, volumelimiet,
  screensavers. Premium = de overige 22 (o.a. bruine/roze ruis, golven, kampvuur, baarmoedergeluiden,
  sussen, föhn, 5 klassieke arrangementen).
- **Geen review-prompt** in de app (`requestReview`/`SKStoreReviewController` komt nergens voor).
- **Android:** volgens `onderzoek/00_PRODUCTCONCEPT.md` (30 aug) was er **nog geen abonnementsproduct in
  Play Console** → Duski op Play verdient mogelijk nog niets. **Ed: checken.**

## Opties (in volgorde van verwachte impact)

### 1. Review-prompt op een goed moment — _geen prijsbeslissing, wel een v1.1-codewijziging_
Meer en betere ratings geven een hogere ranking en dus meer organische installs. Dit is de goedkoopste
groeihefboom die er is.
- **Moment:** de ochtend na een geslaagde sessie: slaaptimer is afgelopen **of** er is ≥ 20 min
  afgespeeld, én het is minimaal de 3e dag van gebruik. Nooit tijdens het inslapen (geen pop-up in het
  donker), dus bij de **volgende app-start**.
- **Techniek:** SwiftUI `@Environment(\.requestReview)`; Apple toont hem max. 3×/365 dagen; zelf een
  teller in `GebruikersVoorkeuren` bijhouden. Android: Play In-App Review API met dezelfde trigger.
- **Niet doen:** vooraf vragen "vind je Duski leuk?" en alleen tevreden mensen doorsturen (review-gating
  is tegen de Apple- en Play-regels).
- **Voorstel:** in v1.1 meenemen (samen met de EN-UI). Kost ±1 uur.

### 2. Jaarabonnement naast maandelijks — _prijsbeslissing Ed_
Een jaarabonnement levert per klant meer op, geeft minder churn en een betere marge na de
Apple-commissie (15 % Small Business Program). De meeste slaap-apps sturen op jaar.
- Zelfde subscription group **Premium** (22389048) → gebruikers kunnen op- en afstappen zonder dubbel te
  betalen.
- **Ter keuze (voorbeelden, geen advies):**
  | Variant | Maand | Jaar | Jaar ≈ maanden |
  |---|---|---|---|
  | A — blijf laag | €0,99 | €7,99 | 8 |
  | B — middensegment | €1,99 | €12,99 | 6,5 |
  | C — marktconform | €2,99 | €19,99 | 6,7 |
  Ter vergelijking: grote slaap-apps (Calm, BetterSleep) zitten typisch ruim boven de €40/jaar;
  Duski kan zich positioneren als "de betaalbare, rustige, zonder-account"-optie.
- **Let op:** een bestaande abonneeprijs verhogen vergt bij Apple een prijsverhogingsflow (opt-in
  bij grote stijging); dat is vóór launch nog makkelijk en na launch lastiger. **Nu kiezen is dus
  goedkoper dan later.**
- Paywall-UI toont nu één product → twee kaarten (Jaar "meest gekozen" + Maand). Code-werk ±2 uur.

### 3. Trial-lengte — _beslissing Ed, pas na data_
30 dagen is ruim; kortere trials (7 dagen) converteren in de branche vaak beter, maar bij een app die je
elke nacht gebruikt is 30 dagen ook een sterk gewoonte-argument. **Voorstel:** laten staan tot er
≥ 4 weken echte conversiedata in ASC/Play is, dan beslissen. Geen actie nu.

### 4. Offer codes voor pers/influencers — _aantal: beslissing Ed_
ASC → Subscriptions → Offer Codes: bijv. 3 maanden gratis Premium, eenmalige codes. Hoort bij de
launch-kit (persbericht, micro-influencers). **Voorstel:** 25 codes als startbatch.

### 5. Win-back-aanbod voor verlopen proefperiodes — _later_
Apple win-back offers / Play "resubscribe"-aanbiedingen (bijv. 1 maand gratis na verloop). Pas relevant
als er een eerste cohort trials is afgelopen (≥ half november 2026).

### 6. Paywall-copy — _geen prijsbeslissing, kan in v1.1_
De paywall noemt nu naam, looptijd en prijs (3.1.2(c)-proof). Sterker verkopend zonder iets te beloven
wat niet klopt:
- Kop: "Ontgrendel alle 26 geluiden" → sub: "Bruine ruis, golven, kampvuur, baarmoedergeluiden,
  sussen en 5 klassieke stukken — zo vaak en zo lang je wilt."
- Rij met 3 concrete voordelen (✔︎ alle geluiden ✔︎ onbeperkt mixen ✔︎ geen account, geen advertenties).
- De bestaande EULA-/privacylinks, "Aankopen herstellen" en de verlengingstekst **blijven staan**.
- Controleer vóór livegang dat "geen advertenties" klopt (er zit nu geen advertentie-SDK in).

## Wat Ed moet kiezen (samengevat)
1. [ ] Review-prompt in v1.1: ja/nee.
2. [ ] Jaarabonnement: ja/nee + variant (A/B/C of eigen prijs).
3. [ ] Aantal offer codes voor pers (voorstel 25).
4. [ ] Play Console: bestaat het abonnementsproduct al? Zo niet: aanmaken (zelfde prijsstructuur).
5. [ ] Paywall-copy uit §6: akkoord?
