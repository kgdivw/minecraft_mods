# Je Bent Een Steen

Jij bent een **steen**. Drie mijnwerkers — **Bert, Klaas en Dirk** — komen uit de
mijn omhoog om je **kapot te minen**. Ze rennen achter je aan, graven dwars door
muren heen en beuken met hun pikhouweel op je.

Jij verdedigt je op de enige manier die een steen kent: **opdrachten doen**. Ja,
een steen die opdrachten uitvoert. Elke opdracht die je haalt maakt je een stukje
**groter**, en groter betekent meer leven, een dikkere stenen schil en veel
hardere klappen.

## Starten

1. Installeer `JeBentEenSteen.mcaddon` (dubbelklikken opent Minecraft).
   Lukt dat niet op tablet? Installeer dan eerst `JeBentEenSteenTexturen.mcpack`
   en daarna `JeBentEenSteenGedrag.mcpack`.
2. Zet in je wereld-instellingen het behavior pack **en** het resource pack aan.
3. Typ in de chat: `/function steen`

Je krijgt meteen je stenen schil, de drie mijnwerkers verschijnen op **10 blokken
afstand** van je en je eerste opdracht staat in de chat en onderin je scherm.
Ren je verder dan 80 blokken weg, dan duiken ze weer op diezelfde 10 blokken
afstand naast je op.

## Hoe groot kun je worden

| Groei | Grootte | Extra hartjes | Jouw klap |
|-------|---------|---------------|-----------|
| 0-1 | Kiezelsteen | - | +1 |
| 2-3 | Steen | 4 | +4 |
| 4-5 | Rots | 10 (+ taai) | +9 |
| 6-7 | Keisteen | 18 (+ taaier) | +16 |
| 8 | **BERG** | 28 (+ kracht) | +25 |

Je schil groeit mee: van een dun laagje grind tot een enorme rotsjas.

## Winnen en verliezen

- Ben je een **BERG**? Dan stoppen de opdrachten en begint de laatste missie:
  **sloop alle drie de mijnwerkers**. Lukt dat, dan heb jij gewonnen.
- Ga je dood, dan **breekt er een stuk van je af**: je wordt een maat kleiner en
  gaat gewoon door. De mijnwerkers schrikken ervan en lopen eerst een stuk weg.
- Ben je al een kiezelsteen als je doodgaat? Dan krijg je nog één **laatste
  kans**. Gaat het dan weer mis, dan hebben de mijnwerkers gewonnen.
- Zolang je nog geen BERG bent, komt er binnen 10 seconden een nieuwe mijnwerker
  uit de mijn als je er een verslaat.

## De opdrachten

Je krijgt er steeds één, willekeurig gekozen:

- Rol 80 blokken ver
- Eet of drink 3 keer iets op
- Lig 8 seconden in het water
- Zwem 5 seconden in **lava**
- Breek 15 steenblokken (sorry, neefjes)
- Sloop 10 houtblokken
- Klim naar hoogte 100
- Duik naar hoogte -15
- Sla de mijnwerkers 12 keer
- Verstop je 10 seconden, 25 blokken bij ze vandaan
- Val van 15 blokken hoog naar beneden
- Versla 1 mijnwerker (pas als je een Rots bent)

## Omdat je van steen bent

- **Vallen, vuur, lava, verdrinken en stikken doen je niets.** Die schade krijg je
  meteen weer terug, en bij een diepe val word je onderweg zelfs even keihard, dus
  springen van een berg mag altijd. Alleen de mijnwerkers (en andere monsters)
  kunnen je echt slopen.
- Je draagt altijd je stenen schil. Had je al een harnas aan? Dat gaat netjes je
  rugzak in in plaats van verloren te gaan.
- De mijnwerkers graven naar je toe, maar blijven af van kisten, bedden, ovens,
  obsidiaan en bedrock — je spullen zijn veilig.

## Commando's

| Commando | Wat het doet |
|----------|--------------|
| `/function steen` | Start het spel (opnieuw) |
| `/function steen_info` | Laat je grootte, je opdracht en de regels zien |
| `/function steen_overslaan` | Te moeilijke opdracht? Je krijgt een andere |
| `/function steen_groter` | Valsspelen: meteen een groei erbij |
| `/function steen_stop` | Stoppen; de mijnwerkers verdwijnen |

## Geen experimenten nodig

De mod gebruikt de stabiele Script API (`@minecraft/server` 2.9.0), dus "Beta
APIs" hoeft **niet** aan. Wel Minecraft Bedrock 1.21 of nieuwer.

Alle getallen (hoeveel mijnwerkers, hoeveel groei je nodig hebt, welke
opdrachten) staan bovenin [BP/scripts/main.js](BP/scripts/main.js). De textures
maak je opnieuw met `python scripts/generate_steen_textures.py`.
