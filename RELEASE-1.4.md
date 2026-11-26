# Duski 1.4 (build 13): pre-release-check en indieningsstatus

Gemaakt op 26 november 2026 door Claude. **Advies: GO** na de handmatige punten hieronder. Er is niets ingediend; dat doet Ed.

## Inhoud
- "Voor jou"-kaart bovenaan, per leeftijdsgroep, altijd gratis (ook met premium-lagen). 65+: Clair de Lune + zachte regen en grotere tekst.
- Nieuwe geluiden: onweer, stofzuiger, speeldoos-slaapliedjes (Brahms' Wiegenlied, Altijd is Kortjakje ziek). 29 geluiden totaal.
- Categorie: Gezondheid en fitness (primair) + Lifestyle (gaat in met deze versie).

## Automatisch gecontroleerd (ASC-API)
| Punt | Status |
|---|---|
| Richtlijnen "Last Updated" = baseline 16 okt 2026, niets nieuws dat Duski raakt | ✅ |
| Versie 1.4 (PREPARE_FOR_SUBMISSION, release na goedkeuring), build 13 VALID en gekoppeld | ✅ |
| Beschrijving, zoekwoorden, promotietekst en "Wat is er nieuw" in 11 locales | ✅ |
| 8 screenshots met koptekst per toestel (iPhone 6,9" en iPad 13") in 8 talen; en-GB/en-AU = Engels, es-MX = Spaans | ✅ |
| Privacy-, support- en marketing-URL's geven 200 | ✅ |
| Export compliance: geen niet-vrijgestelde encryptie | ✅ |
| Abonnementen (maand + jaar) APPROVED, niets nieuws dat mee moet | ✅ |
| Review-notitie bijgewerkt (uitleg gratis "Voor jou"-mix, zodat de reviewer dat niet als paywall-lek ziet) | ✅ |
| Debug-demo-argumenten werken alleen in Debug (geen verborgen functies, 2.5.19) | ✅ |

## Getest
- Eds iPhone 13 Pro Max (iOS 27.2.1), build 12 (zelfde app als 13 op de screenshot-hulp en de geluidenteller na): "ziet er goed uit".
- Simulator iPhone 17 Pro Max en iPad Pro 13": alle schermen in 8 talen.
- Unit-tests groen, incl. nieuwe test dat de nieuwe geluiden hoorbaar zijn en niet clippen.

## Handmatig door Ed (vóór "Voeg toe voor review")
1. App Privacy: controleer "Data Not Collected".
2. Leeftijdsclassificatie: beantwoord eventuele nieuwe vragen.
3. Versie 1.4 openen, "Voeg toe voor review" en dan "Verstuur voor review".
4. Google Play: categorie in Play Console op "Gezondheid en fitness" zetten (kan niet via de API).
