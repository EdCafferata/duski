# Duski — draaiboek voor de dag dat Apple goedkeurt (DRAFT, 26 sep 2026)

_Doel: zodra v1.0 bij Apple live is, in één keer alles in de goede volgorde doen, zonder te improviseren. Alles
hieronder verwijst naar drafts die al klaarstaan. **Status 26 sep 03:15: WAITING_FOR_REVIEW** (ASC-API)._

## 0. Trigger — hoe weten we dat hij live is?
ASC-API (Admin-key `5R3497VHF5`, issuer `69a6de7f-…`), app-id **6806373286**:
`GET /v1/apps/6806373286/appStoreVersions?limit=1` → `appStoreState`.
- **Let op:** `releaseType` staat op **AFTER_APPROVAL** (gecheckt 26 sep) → hij gaat **automatisch live** zodra Apple
  goedkeurt, ook midden in de nacht/het weekend. De routine moet dus zelf fase 1 oppakken bij de eerstvolgende run.
- `PENDING_DEVELOPER_RELEASE` → alleen als Ed de release alsnog op handmatig zet; dan klikt **hij** "Release this version".
- `READY_FOR_SALE` → live. Pas dan fase 1 starten. Controleer ook dat
  `https://apps.apple.com/app/id6806373286` een pagina geeft (kan tot ~24 u na goedkeuring duren per land).
- `REJECTED` → reden uit Resolution Center lezen, fix → nieuwe build (zie memory `project_duski_ios`); géén van
  onderstaande acties.

## 1. Direct (dag 0, eerste uur) — mag de routine zelf
| # | Actie | Draft/bron | Wie |
|---|---|---|---|
| 1 | Site `cafferata.info/duski/` Downloaden-blok: App Store-link toevoegen (zie snippet A) | `cafferata-site/duski/index.html:76` | Claude (commit + deploy via NAS, zie memory `reference_nas_deploy_access`) |
| 2 | Site-kaart op `cafferata.info`: badge "🍎 Apple in review" → "🍎 iOS LIVE" + App Store-link (snippet B) | `cafferata-site/index.html:189,194` | Claude |
| 3 | `MARKETING-PLAN.md` §0 + memory bijwerken: Apple live, datum | — | Claude |
| 4 | Linkcheck: App Store-, Play-, support-, privacy-URL's allemaal 200 | — | Claude |

**Snippet A** (`duski/index.html`, regel 76):
```html
<p><a href="https://apps.apple.com/app/id6806373286" target="_blank" rel="noopener"> App Store</a> · <a href="https://play.google.com/store/apps/details?id=info.cafferata.duski" target="_blank" rel="noopener">▶ Google Play</a></p>
```
**Snippet B** (`index.html`, Duski-kaart):
```html
<span class="badge badge-live">🍎 iOS LIVE</span>
<span class="badge badge-live">🤖 Android LIVE</span>
…
<a href="https://apps.apple.com/app/id6806373286" target="_blank" rel="noopener"> App Store</a>
<a href="https://play.google.com/store/apps/details?id=info.cafferata.duski" target="_blank" rel="noopener">▶ Google Play</a>
```

## 2. Dag 0–1 — publieke aankondiging (Ed-trigger nodig)
| # | Actie | Draft | Wie |
|---|---|---|---|
| 5 | LinkedIn-post (tekst C hieronder) | dit bestand | Ed post (of "Claude???"-mail) |
| 6 | TikTok: launch-clip + bio/CTA van "coming soon" naar "30 dagen gratis, link in bio" | `tiktok-batch-01.md` #9 omgebouwd, `tiktok-batch-02.md` "Mix van de week #1" | Posten alleen in sessie mét Ed |
| 7 | NL-persbericht 1-op-1 naar max. ~10 redacties (niet in bulk, geen BCC-lijst) | `LAUNCH-KIT.md` §1 + §2 | Claude via The IT Crowd, na Eds akkoord op citaat/plaatsnaam |
| 8 | Korte follow-up aan NL-ouder-/lifestyle-sites die al een Android-pitch kregen (tekst D) — **één keer**, alleen waar geen "nee" kwam | `NEDERLANDSE_BRONNEN.md` (Ouders van Nu, Baby portaal, Kek Mama, Webwijzer) | Claude via The IT Crowd |

Niet op dag 0: Android-techsites (Androidworld, Android Headlines) — de iOS-release is voor hen geen nieuws.
Niet: Product Hunt / EN-pers / Reddit (EN) — wacht op v1.1 met Engelse UI (`LOKALISATIE-EN-ASO.md`).

## 3. Week 1
- Eerste reviews/ratings bijhouden in ASC (niet zelf reviews "regelen"; wel binnen 48 u netjes reageren — Ed of
  Claude met akkoord).
- NL-listing-tekst uit `LOKALISATIE-EN-ASO.md` §NL doorvoeren in de volgende metadata-update (samen met v1.1-build,
  zodat er geen losse extra review nodig is).
- Mailchimp-aankondiging naar bestaande contacten — pas als Ed Mailchimp-toegang heeft; nooit via de NAS-server.
- Week-1-cijfers (downloads, trial-starts, conversie) → input voor `MONETISATIE-VOORSTEL.md`.

---

## Tekst C — LinkedIn (NL, launch)
> Duski staat vanaf vandaag ook in de App Store. 🌙
>
> Een slaapgeluiden-app waarin elk geluid live op je telefoon wordt gemaakt — geen opnames, geen streaming,
> geen account. Je mixt je eigen lagen: regen, golven, bruine ruis, een tikkende klok, zelfs Clair de Lune.
>
> Twee dingen waar ik trots op ben:
> • een babystand die het volume hard begrenst (veel witte-ruismachines kunnen veel te hard);
> • een slaaptimer die de laatste 30 seconden rustig uitfadet in plaats van ineens stil te vallen.
>
> 30 dagen gratis, daarna €0,99 per maand. Op Android stond hij al sinds augustus.
>
> iPhone: https://apps.apple.com/app/id6806373286
> Android: https://play.google.com/store/apps/details?id=info.cafferata.duski
>
> #indiedev #iosdev #slaap #buildinpublic

_(Controleer vóór posten: prijs/proefperiode ongewijzigd in ASC; claim "veel machines te hard" is de formulering uit
`LeeftijdsGroep.swift` — houd hem zo algemeen.)_

## Tekst D — follow-up (1-op-1, NL)
> **Onderwerp:** Duski nu ook voor iPhone
>
> Hallo [naam/redactie],
>
> Op [datum] mailde ik jullie over Duski, onze slaapgeluiden-app voor Android. Kort nieuws: sinds vandaag staat hij
> ook in de App Store, dus ook voor iPhone-gebruikers onder jullie lezers.
>
> Nog steeds: alle geluiden op het toestel gemaakt, geen account, geen tracking, en een babystand met
> volumelimiet. 30 dagen gratis te proberen.
>
> iPhone: https://apps.apple.com/app/id6806373286 · Android: https://play.google.com/store/apps/details?id=info.cafferata.duski
> Meer info: https://cafferata.info/duski/
>
> Mocht het niet passen: geen probleem, dan hoort u verder niets van ons.
>
> Met vriendelijke groet,
> Ed Cafferata — The IT Crowd

## Ed-checklist (launchdag)
- [ ] (Alleen als je de launch zelf wilt timen) release in ASC op "Manually release" zetten — staat nu op automatisch.
- [ ] Akkoord op persbericht-citaat + plaatsnaam (`LAUNCH-KIT.md`).
- [ ] Trigger geven voor LinkedIn- en TikTok-post.
