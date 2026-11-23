# Duski iOS 1.3 — wat er klaarstaat (uit de pre-release-check van 19 nov 2026)

Al in de code/repo gedaan, gaat automatisch mee met de volgende build:

- [x] **Minimale iOS-versie 26.4 → 18.0** (`IPHONEOS_DEPLOYMENT_TARGET`). Compileert schoon tegen iOS 17/18,
      er zitten geen iOS-26-only API's in. Meer ouders kunnen de app installeren.
- [x] **Privacylink in de paywall in de taal van de app**: NL → `/duski/privacy.html`, anders `/duski/en/privacy.html`
      (`PremiumView.privacyURL`).
- [x] **Screenshots per taal** (8 talen × iPhone + iPad × onboarding + mixer) in `AppStore/Screenshots/`.
      De oude "en-US"-set was per ongeluk Nederlands. Opnieuw maken: `AppStore/maak-screenshots.sh`.

Nog te doen bij het indienen van 1.3:

- [x] Versie + build ophogen (1.3 / build 9) en release-notes per taal (11 locales) — 22/23 nov.
- [ ] **Testen op een echt toestel met iOS 18** (simulator heeft alleen iOS 26.5): starten, onboarding, geluid
      afspelen op de achtergrond, paywall, aankopen herstellen, code inwisselen.
- [x] Versie 1.3 aangemaakt in ASC (`fastlane prepare version:1.3 build:9`), build 9 gekoppeld (API), screenshots in alle 11 locales.
- [ ] App Privacy-label in ASC controleren ("Data Not Collected").
- [ ] Pre-release-check draaien (skill `pre-release-app-review`) vóór indienen.

## Stand 23 nov 2026 (nacht) — pre-release-check: **GO onder voorbehoud**
Nieuw in 1.3: "Altijd aan" + hervatten na onderbreking (#5/#6), beoordeelknop (#1), timerknoppen schalen mee op
kleine iPhones, extra ASO-locales en-GB/en-AU/es-MX (extra zoekwoorden), minOS iOS 18.

| Check | Status |
|---|---|
| Guidelines "Last Updated" | ✅ October 16, 2026 = baseline, niets nieuws |
| Metadata 11 locales (beschrijving, keywords, promo, release-notes, URL's) | ✅ compleet, geen placeholder-taal |
| Screenshots iPhone 6.7" + iPad 12.9" | ✅ 2+2 in alle 11 locales |
| Privacy/support/marketing-URL's | ✅ allemaal HTTP 200 (NL → /duski/, rest → /duski/en/) |
| Build 9 | ✅ VALID, gekoppeld aan 1.3, minOS 18.0, encryptie = NO |
| Leeftijd | ✅ 4+ |
| Abonnementen | ✅ maand + jaar APPROVED, geen nieuwe IAP die mee moet |
| Permissies | ✅ geen NS…UsageDescription nodig (geen camera/locatie/micro) |
| Account/Sign in with Apple | ✅ n.v.t. (geen account) |
| App Privacy-label ("Data Not Collected") | ▲ niet via de API te zien → Ed checkt in ASC (App Privacy) |
| **Echt toestel** | ▲ **Ed:** TestFlight build 9 op iPhone (liefst ook een iOS 18-toestel): start, onboarding, geluid + scherm vergrendelen, "Altijd aan", telefoontje/wekker → hervat het geluid?, paywall, aankopen herstellen. Zie issue #6. |

**Indienen (Ed):** ASC → Duski → 1.3 → "Add for Review" → "Submit to App Review". Release staat op MANUAL
(handmatig vrijgeven na goedkeuring); zet op automatisch als je dat liever hebt.

## 23 nov 2026 (avond) — kritieke fix na Eds toesteltest
Ed: "als ik de telefoon vergrendel stopt het geluid direct". Oorzaak: `UIBackgroundModes=audio` stond **niet** in de
gebouwde Info.plist (`INFOPLIST_KEY_UIBackgroundModes` wordt door Xcode genegeerd) → achtergrondaudio werkte nooit,
ook niet in 1.0–1.2. Fix: `Duski-Info.plist` (samengevoegd met de gegenereerde) + regressietest `InfoPlistTests`.
**1.3 gebruikt nu build 2** (build 9 eraf gehaald). Opnieuw testen op het toestel vóór indienen.

## 23 nov 2026 19:33 — INGEDIEND (WAITING_FOR_REVIEW)
Ed testte build 2 op zijn iPhone: geluid speelt door met vergrendeld scherm, wekker onderbreekt en daarna gaat het
netjes verder, beoordeelknop OK. Ed: "je mag alles aanbieden aan Apple". Release-notes aangevuld ("speelt nu door met
vergrendeld scherm"), releaseType AFTER_APPROVAL, review-submission `4fab9988-753a-40f4-9680-d79fb12e346c`.

## 23 nov 2026 ~20:45 — opnieuw ingediend met build 11
Gevonden bij het maken van de autorijden-video: 9 modulatiefases (golven, regen, ademhaling, sussen, vliegtuig,
föhn, ventilator, autorijden) liepen als Float eindeloos op → na 2–8 min bevroren/scheef (86de84b + LangeSessieTests).
1.3 uit review gehaald (Ed akkoord), build 11 gekoppeld, release-notes aangevuld, opnieuw ingediend:
submission `c881dfbc-66f2-48ec-865f-349148e551e8`, WAITING_FOR_REVIEW, AFTER_APPROVAL.
Android: 1.2 (vc5) is al LIVE; 1.2.1 (vc6) met dezelfde fase-fix staat op intern, Ed promoot naar productie.
