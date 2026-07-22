# Duski

🔒 Laatste security check: 2026-07-23 00:04 CEST

**Duski** is een native iOS-app (SwiftUI) met slaapgeluiden en witte ruis, gericht op een wereldwijd publiek. Alle geluiden worden 100% op het toestel zelf gegenereerd via `AVAudioEngine` — geen opnames, geen streaming, geen rechtenrisico.

## Functies

- 🎚️ **Geluidsmixer** — losse geluidslagen mixen, elk met eigen volumeslider, gegroepeerd per categorie:
  - **Ruis** — wit, roze, bruin, grijs en blauw
  - **Natuur** — regen, golven, wind, kampvuur, kabbelende beek
  - **Lichaam & baby** — hartslag, baarmoedergeluiden, ademhaling, sussen (shhh), föhn
  - **Overige** — klankschaal, ventilator, trein, tikkende klok, vliegtuigcabine, autorijden, en eigen arrangementen geïnspireerd op rechtenvrije klassieke stukken (Bach, Pachelbel, Satie, Debussy)
- 👶 **Leeftijdsgroepen** — onboarding kiest tussen Baby/Kind/Tiener/Volwassene/Oudere; content en een veilige volumelimiet passen zich automatisch aan
- ⏱️ **Sleeptimer** — 15 tot 90 minuten, dooft geleidelijk uit in de laatste 30 seconden
- 🌌 **Screensaver-kiezer** — eigen SwiftUI/emoji-animaties per categorie (sterrenhemel, schaapjes tellen, kaarsvlam, wolkendek, en meer)
- 💤 **Achtergrondaudio** — blijft doorspelen als het scherm vergrendelt
- 💳 **Abonnement (StoreKit 2)** — 30 dagen gratis proefperiode, daarna maandelijks

## Vereisten

- iOS 26.4 of nieuwer
- iPhone en iPad

## Zelf bouwen

```bash
git clone git@github.com:EdCafferata/duski.git
cd duski
open Duski.xcodeproj
```

## Status

Nog in ontwikkeling — App Store-indiening is voorbereid (fastlane/metadata/screenshots) maar wacht op afronding van de Apple Developer-accountverificatie. Zie `onderzoek/00_PRODUCTCONCEPT.md` in deze repo voor het volledige productconcept en de onderliggende research.
