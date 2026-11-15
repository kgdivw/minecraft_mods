# Je Bent Een Steen

Jij bent een **steen**. Drie mijnwerkers — **Bert, Klaas en Dirk** — komen uit de
mijn omhoog om je **kapot te minen**. Ze rennen achter je aan, graven dwars door
muren heen en beuken met hun pikhouweel op je.

Jij verdedigt je met de **Upgrade-knop**. Die zit in je rugzak. Tik ermee en er
komt een menu met twee knoppen:

- **AANVAL** — acht aanval-upgrades die je kunt unlocken
- **GROEIEN** — van **level 1** tot **level 6**

Voor allebei moet je iets doen: elke upgrade en elk level heeft zijn eigen
opdracht, en die is elke keer anders.

## Starten

**De makkelijkste manier (ook op tablet): `JeBentEenSteen.mcworld`.** Dat is een
kant-en-klare wereld waar allebei de pakketten al in zitten en al aanstaan, met
cheats aan en coordinaten in beeld. Openen, en je speelt. Er is niets te
importeren en niets aan te vinken.

Liever in je eigen wereld?

1. Installeer `JeBentEenSteen.mcaddon` (dubbelklikken opent Minecraft).
   Lukt dat niet op tablet? Installeer dan eerst `JeBentEenSteenTexturen.mcpack`
   en daarna `JeBentEenSteenGedrag.mcpack`.
2. Zet in je wereld-instellingen het behavior pack **en** het resource pack aan.
3. Ga de wereld in. **Het spel start vanzelf.** Werkt dat niet, typ dan
   `/function steen`.

De wereld maak je opnieuw met `python scripts/generate_steen_wereld.py`.

De drie mijnwerkers verschijnen op **10 blokken afstand** van je, ook na je
dood en ook als je verder dan 80 blokken wegrent.

## Het upgrade-menu

Tik met de **Upgrade-knop** uit je rugzak. Knop kwijt? `/function steen_knop`.
Lukt tikken niet, dan opent `/function steen_menu` hetzelfde menu.

### GROEIEN: level 1 tot 6

| Level | Jij bent een | Extra hartjes | Jouw klap |
|-------|--------------|---------------|-----------|
| 1 | Kiezelsteen | - | +1 |
| 2 | Steen | 4 | +3 |
| 3 | Rots | 10 | +6 |
| 4 | Keisteen | 16 | +10 |
| 5 | Rotsblok | 22 (+ taai) | +15 |
| 6 | **BERG** | 28 (+ taaier, + kracht) | +22 |

Elk level krijg je een **willekeurige groei-opdracht**. Is die klaar, dan licht
je scherm op: pak je upgrade-knop, tik op **GROEIEN** en druk op **GROEI NU!**
Je schil groeit mee, van een dun laagje grind tot een enorme rotsjas.

De groei-opdrachten die je kunt krijgen:

- Rol 80 (of 200) blokken ver
- Eet of drink 3 keer iets op
- Lig 8 seconden in het water
- Zwem 5 seconden in **lava**
- Breek 15 (of 30) steenblokken
- Sloop 10 houtblokken
- Klim naar hoogte 100
- Duik naar hoogte -15
- Sla de mijnwerkers 12 (of 25) keer
- Verstop je 10 seconden, 25 blokken bij ze vandaan
- Val van 15 blokken hoog naar beneden
- Versla 1 mijnwerker (vanaf level 3)

Te moeilijk? In het groei-menu zit een knop voor een andere opdracht.

### AANVAL: acht upgrades om te unlocken

Tik op een upgrade en je gaat eraan werken. Is de opdracht klaar, dan is de
upgrade **voor altijd** van jou — ook als je doodgaat.

| Upgrade | Wat het doet | Wat je ervoor moet doen |
|---------|--------------|-------------------------|
| Harde Kop | +3 schade | Sla de mijnwerkers 10 keer |
| Scherpe Splinters | +5 schade | Sloop 15 houtblokken |
| Steenstoot | ze vliegen weg door je klap | Breek 20 steenblokken |
| Vuursteen | +6 schade en vonken | Zwem 5 seconden in lava |
| Rotswervel | ze lopen 5 seconden traag | Lig 8 seconden in het water |
| Aardbeving | elke 4e klap raakt ze allemaal | Rol 150 blokken ver |
| Donderklap | 1 op de 4 klappen knalt (+10) | Eet of drink 4 keer iets op |
| Bergkracht | **dubbele** schade | Versla 2 mijnwerkers (vanaf level 4) |

Je groei-opdracht en je aanval-opdracht lopen gewoon tegelijk. Allebei staan ze
onderin je scherm.

## Winnen en verliezen

- Ben je **level 6**? Dan stoppen de opdrachten en begint de laatste missie:
  **sloop alle drie de mijnwerkers**. Lukt dat, dan heb jij gewonnen.
- Ga je dood, dan **breekt er een stuk van je af**: je zakt een level en gaat
  gewoon door. Je aanval-upgrades blijven van jou. De mijnwerkers staan weer op
  10 blokken van je af, op de plek waar je wakker wordt.
- Ga je dood op level 1? Dan krijg je nog één **laatste kans**. Gaat het dan
  weer mis, dan hebben de mijnwerkers gewonnen.
- Zolang je nog geen BERG bent, komt er binnen 10 seconden een nieuwe mijnwerker
  uit de mijn als je er een verslaat.

## Omdat je van steen bent

- **Vallen, vuur, lava, verdrinken en stikken doen je niets.** Die schade krijg
  je meteen weer terug, en bij een diepe val word je onderweg zelfs even keihard,
  dus springen van een berg mag altijd. Alleen de mijnwerkers (en andere
  monsters) kunnen je echt slopen.
- Je draagt altijd je stenen schil. Had je al een harnas aan? Dat gaat netjes je
  rugzak in in plaats van verloren te gaan.
- De mijnwerkers graven naar je toe, maar blijven af van kisten, bedden, ovens,
  obsidiaan en bedrock — je spullen zijn veilig.

## Commando's

| Commando | Wat het doet |
|----------|--------------|
| `/function steen` | Start het spel (opnieuw) |
| `/function steen_menu` | Opent het upgrade-menu |
| `/function steen_knop` | Geeft je een nieuwe upgrade-knop |
| `/function steen_info` | Laat je level, je opdrachten en de regels zien |
| `/function steen_overslaan` | Te moeilijke groei-opdracht? Je krijgt een andere |
| `/function steen_groter` | Valsspelen: meteen een level erbij |
| `/function steen_test` | Zoekt uit wat er mis is als er iets niet werkt |
| `/function steen_stop` | Stoppen; de mijnwerkers verdwijnen |

## Er gebeurt niets?

Typ `/function steen_test`. Dan zegt het spel zelf wat er aan de hand is:

- Zie je **niets** in de chat? Dan staat het **gedragspakket** niet aan in deze
  wereld (of het staat er wel, maar het is uitgezet in de wereld-instellingen).
- Staat er `Mijnwerker steen:mijnwerker: FOUT`? Dan kwam het pakket niet
  helemaal mee. Het spel stuurt dan vanzelf gewone mijnwerkers op je af, zodat
  je toch kunt spelen.
- Staat er wel `Mijnwerkers nu in de wereld: 3` maar zie je ze niet? Dan mist
  het **texturenpakket**: zet het resource pack aan in je wereld.

## Geen experimenten nodig

De mod gebruikt de stabiele Script API (`@minecraft/server` 2.0.0 en
`@minecraft/server-ui` 2.0.0), dus "Beta APIs" hoeft **niet** aan. Wel Minecraft
Bedrock 1.21 of nieuwer.

Alle getallen (hoeveel mijnwerkers, de zes levels, de opdrachten en de
aanval-upgrades) staan bovenin [BP/scripts/main.js](BP/scripts/main.js). De
textures maak je opnieuw met `python scripts/generate_steen_textures.py`.
