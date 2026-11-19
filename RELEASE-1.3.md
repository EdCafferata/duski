# Duski iOS 1.3 — wat er klaarstaat (uit de pre-release-check van 19 nov 2026)

Al in de code/repo gedaan, gaat automatisch mee met de volgende build:

- [x] **Minimale iOS-versie 26.4 → 18.0** (`IPHONEOS_DEPLOYMENT_TARGET`). Compileert schoon tegen iOS 17/18,
      er zitten geen iOS-26-only API's in. Meer ouders kunnen de app installeren.
- [x] **Privacylink in de paywall in de taal van de app**: NL → `/duski/privacy.html`, anders `/duski/en/privacy.html`
      (`PremiumView.privacyURL`).
- [x] **Screenshots per taal** (8 talen × iPhone + iPad × onboarding + mixer) in `AppStore/Screenshots/`.
      De oude "en-US"-set was per ongeluk Nederlands. Opnieuw maken: `AppStore/maak-screenshots.sh`.

Nog te doen bij het indienen van 1.3:

- [ ] Versie + build ophogen (`MARKETING_VERSION` 1.3, `CURRENT_PROJECT_VERSION` 9) en release-notes per taal
      in `fastlane/metadata/<locale>/release_notes.txt`.
- [ ] **Testen op een echt toestel met iOS 18** (simulator heeft alleen iOS 26.5): starten, onboarding, geluid
      afspelen op de achtergrond, paywall, aankopen herstellen, code inwisselen.
- [ ] Na het aanmaken van versie 1.3 in ASC: `fastlane screenshots` (alleen op een bewerkbare versie).
- [ ] App Privacy-label in ASC controleren ("Data Not Collected").
- [ ] Pre-release-check draaien (skill `pre-release-app-review`) vóór indienen.
