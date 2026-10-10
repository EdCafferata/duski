# Duski — siteteksten voor v1.1 (DRAFT)

_Draft 10 okt 2026 (routine 18:12). **Niets op cafferata.info gewijzigd.** Doorvoeren pas wanneer v1.1 =
READY_FOR_SALE (nu PREPARE_FOR_SUBMISSION, wacht op Eds Submit)._

## Waarom

Twee dingen op `cafferata.info/duski/` kloppen niet meer zodra v1.1 live is:

1. **De pagina's zijn alleen Nederlands**, terwijl de support-, privacy- en marketing-URL van álle 8 store-locales
   (en-US, de-DE, fr-FR, es-ES, pt-BR, it, ja, nl-NL) ernaar wijzen. Een Engelse reviewer of gebruiker landt op NL-tekst.
2. **De teksten noemen alleen een maandabonnement.** v1.1 voegt het jaarabonnement toe (€ 9,99 / $ 8.99 per jaar,
   eerste maand gratis). Dat raakt `index.html`, `support.html` en `voorwaarden.html` — de laatste is de pagina waar
   Apple bij 3.1.2(c) naar kijkt.

## Voorstel (kleinste ingreep)

- NL-pagina's blijven op hun huidige URL's (store-URL's hoeven niet te veranderen).
- Engelse versies in `cafferata.info/duski/en/` (`index.html`, `support.html`, `privacy.html`, `terms.html`), met
  bovenaan elke pagina een taalwissel "Nederlands · English".
- De overige 6 talen verwijzen voorlopig naar de Engelse pagina's; per taal vertalen alleen als de downloads dat rechtvaardigen.
- Optioneel daarna: store-URL's van de 7 niet-NL-locales naar `/duski/en/…` zetten (ASC-API + `fastlane/metadata/*/*_url.txt`).

---

## A. Wijzigingen in de bestaande NL-pagina's

**`index.html` — blok "Duski Premium"**

> De basisgeluiden zijn gratis. Duski Premium ontgrendelt de volledige bibliotheek. Je kiest een maand- of een
> jaarabonnement; voor nieuwe abonnees is de eerste maand gratis, daarna betaal je de prijs die in de app staat. Het
> abonnement wordt automatisch verlengd en is elk moment op te zeggen via de abonnementsinstellingen van je Apple- of
> Google-account.

_Let op: op Google Play bestaat het jaarabonnement nog niet. Tot Android is bijgewerkt de zin "Je kiest een maand- of
een jaarabonnement" aanvullen met "(jaarabonnement voorlopig alleen op iPhone en iPad)"._

**`support.html` — eerste vraag**

> **Hoe werkt de gratis proefperiode?**
> Duski Premium is er als maand- en als jaarabonnement. Voor nieuwe abonnees is de eerste maand gratis. Zeg je niet
> op, dan wordt het abonnement daarna automatisch verlengd tegen de prijs die in de app en de store staat. Opzeggen
> moet minstens 24 uur vóór het einde van de lopende periode.

Nieuwe vraag toevoegen:

> **Kan ik wisselen tussen maand en jaar?**
> Ja. Ga naar de abonnementsinstellingen van je Apple-account, kies Duski en selecteer het andere abonnement. De
> wissel gaat in aan het einde van de lopende periode.

Nieuwe vraag toevoegen:

> **In welke talen is Duski beschikbaar?**
> Nederlands, Engels, Duits, Frans, Spaans, Portugees (Brazilië), Italiaans en Japans. De app volgt de taal van je toestel.

**`voorwaarden.html` — blok "Duski Premium"**

> - **Abonnementen:** Duski Premium Maandelijks (1 maand) en Duski Premium Jaarlijks (1 jaar), beide automatisch verlengd
> - **Prijs:** het exacte bedrag voor jouw land staat in de app vóór aankoop
> - **Proefperiode:** voor nieuwe abonnees is de eerste maand gratis

De rest van het blok (betaling, verlenging, 24-uurstermijn, vervallen proefperiode) blijft ongewijzigd. Datum
"Laatst bijgewerkt" aanpassen.

---

## B. Engelse pagina's (nieuw)

### `en/index.html`

**Duski 🌙** — iPhone · iPad · Android

Fall asleep faster with sounds that are generated entirely on your own device. No recordings, no streaming, and tuned
to the age of whoever is sleeping.

**Set safely for every age.** You first choose who the device is for: baby, child, teen, adult or senior. Duski adapts
the available sounds and a safe volume limit to that choice. Baby mode has a built-in volume cap, because standalone
white-noise machines are often too loud at full volume.

**Mix your own sound**
- **Noise:** white, pink, brown, grey and blue noise
- **Nature:** rain, waves, wind, campfire and a babbling brook
- **Body & baby:** heartbeat, womb sounds, breathing, shushing (shhh) and hair dryer
- **Other:** singing bowl, fan, train, ticking clock, aeroplane cabin, car ride, and our own arrangements of Bach,
  Pachelbel, Satie and Debussy

Duski also has a sleep timer (15 to 90 minutes) and calming screensavers.

**Honest about the science.** Duski draws on research from, among others, the AASM, the WHO and Harvard Medical School.
We are just as clear about what is not supported by evidence: no pseudoscientific claims.

**Duski Premium.** The basic sounds are free. Duski Premium unlocks the full library. Choose a monthly or a yearly
subscription; the first month is free for new subscribers, after that you pay the price shown in the app. The
subscription renews automatically and can be cancelled at any time in the subscription settings of your Apple or Google
account. See the terms and the privacy policy.

### `en/support.html`

**How does the free trial work?**
Duski Premium is available as a monthly or a yearly subscription. The first month is free for new subscribers. If you
don't cancel, the subscription then renews automatically at the price shown in the app and the store. Cancel at least
24 hours before the end of the current period.

**How do I cancel my subscription?**
iPhone/iPad: Settings → [your name] → Subscriptions → Duski → Cancel Subscription.
Android: Google Play → profile → Payments & subscriptions → Subscriptions → Duski → Cancel.

**Can I switch between monthly and yearly?**
Yes. Open the subscription settings of your Apple account, choose Duski and select the other plan. The change takes
effect at the end of the current period.

**I bought Premium but don't see it on my new device**
Open the Premium screen in Duski and tap **Restore purchases**. Use the same Apple or Google account you subscribed with.

**Why is the sound quieter in baby mode?**
Baby mode has a deliberate volume limit, because white-noise machines at full volume are often louder than is safe for
babies. Also, don't place the device right next to the baby's head.

**Do I need an internet connection?**
No. All sounds are generated on your device. A connection is only needed to start or restore a subscription.

**Which languages does Duski support?**
Dutch, English, German, French, Spanish, Portuguese (Brazil), Italian and Japanese. The app follows your device language.

**Another question or a problem?**
Email edcafferata@icloud.com, ideally with your device type, iOS or Android version and a short description of what
goes wrong. We reply as soon as we can.

### `en/privacy.html`

**Duski Privacy Policy** — Last updated: {datum van publicatie}

Duski (The IT Crowd, Ed Cafferata) is built on one principle: all sound and all animations are generated 100% on your
own device. No recordings are played, nothing is streamed, and there is no server listening or watching.

**What data does Duski collect?** None. Duski does not collect, transmit or sell personal data, analytics or
advertising identifiers. There is no tracking in the app.

**What is stored locally?** Only your settings, such as the chosen age group (baby, child, teen, adult or senior), are
kept on your device, so the app shows the right sounds and safety limits next time. This data never leaves your device.

**Subscriptions (in-app purchases).** Duski Premium is handled by the App Store (Apple) or Google Play (Google).
Payment details and purchase history are processed entirely through your Apple or Google account under their own
privacy policies. Duski does not see or store payment details.

**Children.** Duski has dedicated, safer modes for babies and children (including a built-in volume limit), and does
not collect personal data in those modes either.

**Changes.** If this policy changes, we update the date at the top of this page.

**Contact.** Questions about this policy? Email edcafferata@icloud.com.

_Dit is een getrouwe vertaling van de NL-tekst (24 sep 2026); inhoudelijk niets toegevoegd of weggelaten. De NL-versie
blijft leidend — die zin kan onderaan de EN-pagina: "This is a translation; in case of differences the Dutch version
prevails."_

### `en/terms.html`

**Duski Terms of Use** — Last updated: {datum van publicatie}

**Licence agreement (EULA).** Duski on the App Store is covered by Apple's standard Licensed Application End User
License Agreement: apple.com/legal/internet-services/itunes/dev/stdeula. Duski on Google Play is covered by the Google
Play Terms of Service.

**Duski Premium (auto-renewable subscription)**
- **Plans:** Duski Premium Monthly (1 month) and Duski Premium Yearly (1 year), both renewing automatically
- **Price:** the exact amount for your country is shown in the app before purchase
- **Free trial:** the first month is free for new subscribers

Payment is charged to your Apple or Google account at confirmation of purchase. The subscription renews automatically
unless cancelled at least 24 hours before the end of the current period. Renewal is charged within 24 hours before the
end of the period. You manage and cancel your subscription in the account settings of the store. Any unused part of a
free trial is forfeited when you purchase a subscription.

**Health and safety.** Duski is an aid for relaxation and sleep, not a medical device. With babies, always use baby
mode with the built-in volume limit and do not place the device right next to the baby's head.

**Privacy and contact.** See the privacy policy. Questions? Email edcafferata@icloud.com.

---

## Ed doet dit / beslist

- [ ] Akkoord op de opzet `/duski/en/` (past bij de afspraak: app-pagina's in de eigen submap).
- [ ] Juridische EN-tekst (privacy + terms) even lezen; het is een 1-op-1-vertaling, maar het blijft jouw beleid.
- [ ] Android: jaarabonnement eerst op Play, of de "voorlopig alleen iPhone/iPad"-zin gebruiken?
- [ ] Daarna in een sessie: HTML bouwen in `cafferata-site/duski/`, deployen, linkcheck, eventueel store-URL's omzetten.

## Niet gecontroleerd

- De knopnaam "Restore purchases" komt uit `Localizable.xcstrings`. De Engelse menupaden van iOS en Google Play
  (opzeggen/wisselen) zijn uit het hoofd geschreven, niet op een toestel nagekeken.
