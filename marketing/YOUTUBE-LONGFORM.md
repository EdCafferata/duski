# Duski — YouTube long-form pakket (DRAFT)

_Opgesteld 2026-09-25 door de marketing-routine. Hoort bij MARKETING-PLAN.md §3 ("YouTube long-form").
**Er is nog geen YouTube-kanaal**: aanmaken en uploaden doet Ed (zie checklist onderaan). Tot Apple
Duski goedkeurt, linkt alles alleen naar Google Play; de App Store-regel wordt toegevoegd zodra v1.0
live is._

## Waarom dit werkt
"8/10 uur regen/witte ruis om te slapen"-video's zijn evergreen zoekcontent: ze worden jaren later nog
gevonden, iedere nacht opnieuw afgespeeld (veel kijktijd), en zijn een natuurlijke plek voor een
"liever zelf mixen? → Duski"-link. Ze kunnen later ook zelf wat opleveren (AdSense vanaf 1.000 abonnees
en 4.000 kijkuren).

## Rechten: schoon
Alle Duski-geluiden zijn **procedureel gegenereerd** in de app (`Duski/Audio/*Generator.swift`), zonder
samples en zonder licenties. De 5 klassieke stukken zijn **eigen synthese van composities in het publieke
domein** (Bach, Pachelbel, Satie, Debussy). Content ID matcht opnames, geen composities, dus claims zijn
onwaarschijnlijk. Komt er toch een onterechte claim, dan betwisten met "own procedural synthesis of a
public-domain composition".

## Eerlijkheid (harde regel)
Alleen geluiden die **echt in Duski zitten** gebruiken (zie `Duski/Models/GeluidCategorie.swift`). Dus
**geen** "onweer", "krekels" of "oceaan met meeuwen": die bestaan niet in de app. Titel, thumbnail en audio
moeten overeenkomen met wat een kijker in de app terugvindt.

## De eerste 6 video's (NL eerst, EN pas na de v1.1-UI-vertaling)

| # | Duur | Geluid(en) in Duski | Titel (NL) | Thumbnail-tekst |
|---|---|---|---|---|
| 1 | 10 u | Bruine ruis | Bruine ruis 10 uur – diep slapen, focus, zwart scherm | BRUINE RUIS · 10 UUR |
| 2 | 8 u | Regen (gratis in de app) | Regen om in slaap te vallen – 8 uur, zwart scherm na 10 min | REGEN · 8 UUR |
| 3 | 10 u | Witte ruis (gratis) | Witte ruis voor baby's – 10 uur, rustig inslapen | WITTE RUIS · BABY |
| 4 | 8 u | Baarmoedergeluiden + Hartslag | Baarmoedergeluiden & hartslag – 8 uur voor je baby | BAARMOEDER · HARTSLAG |
| 5 | 3 u | Kampvuur + Wind | Knisperend kampvuur met zachte wind – 3 uur ontspannen | KAMPVUUR · WIND |
| 6 | 1 u | Debussy – Clair de Lune (Duski-arrangement) | Clair de Lune – 1 uur rustige slaapversie | CLAIR DE LUNE · SLAAP |

EN-titels voor later (na v1.1): "Brown Noise 10 Hours – Deep Sleep, Focus, Black Screen",
"Rain Sounds for Sleeping – 8 Hours", "White Noise for Babies – 10 Hours", "Womb Sounds & Heartbeat –
8 Hours for Baby", "Crackling Campfire with Soft Wind – 3 Hours", "Clair de Lune – 1 Hour Sleep Version".

## Beschrijvingssjabloon (NL)
```
{Geluid} voor {X} uur, rechtstreeks uit Duski, een rustige slaapgeluiden-app van een kleine
Nederlandse indie-studio. Na 10 minuten wordt het scherm zwart, zodat je telefoon of tv je
niet wakker houdt.

🌙 Liever je eigen mix? In Duski stapel je geluiden (bijv. regen + bruine ruis + hartslag)
en stel je een slaaptimer in. Geen account nodig.
▶ Google Play: https://play.google.com/store/apps/details?id=info.cafferata.duski
(App Store-link volgt zodra de iOS-versie live is.)

{Alleen bij baby-video's:}
👶 Veilig gebruik: houd het volume laag en zet het apparaat minstens 2 meter van je baby
(AAP-richtlijn). Dit is geen medisch hulpmiddel.

#slapen #slaapgeluiden #{geluid}
```
**Vastgepinde reactie:** "Welk geluid moet de volgende lange versie worden? 👇", plus eerlijk antwoorden
op reacties (geen nep-reacties, geen gekochte views).

## Productierecept (Ed: ±10 min actief werk per video)
1. **Opname:** iPhone/Android → Duski → geluid(en) kiezen → **schermopname mét geluid** (iOS
   Bedieningspaneel, microfoon uit, dus interne audio) van **60 min**. Screensaver aan voor het beeld.
2. Bestand naar de Mac, dan audio eruit en naadloos lussen tot de doellengte met een zwart beeld (na een
   intro van 10 min met het app-scherm):
   ```bash
   ffmpeg -i opname.mov -vn -ac 2 -ar 48000 -c:a pcm_s16le loop.wav
   ffmpeg -stream_loop 9 -i loop.wav -af "afade=t=in:d=5,afade=t=out:st=35995:d=5" -t 36000 lang.wav
   ffmpeg -f lavfi -i color=c=black:s=1920x1080:r=1 -i lang.wav -shortest -c:v libx264 -tune stillimage -c:a aac -b:a 160k video.mp4
   ```
   (Procedurele geluiden hebben geen hoorbare "naad", dus een harde lus is prima. `-t` en de
   `afade`-start aanpassen per duur.)
3. **Thumbnail:** 1280×720, donker, groot wit woord + het oranje DUSKI-merk. Kan Claude met PIL genereren
   zodra Ed de opname (of een screenshot van de screensaver) aanlevert.

## Ritme
1 lange video per week is genoeg (evergreen). Volgorde: #1 → #2 → #3 → #4 → #5 → #6.

## Ed doet dit
- [ ] YouTube-kanaal aanmaken (voorstel naam "Duski – Slaapgeluiden", handle `@duskiapp`, of `@duski.sleep`
      als die bezet is) en zelf inloggen/uploaden.
- [ ] Per video 60 min opname maken (recept hierboven), of vragen of Claude de ffmpeg-/thumbnail-stappen
      doet zodra de opname op de NAS staat.
- [ ] Na Apple-livegang: App Store-link toevoegen aan alle beschrijvingen.
