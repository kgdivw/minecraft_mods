# Ridder Mod - Minecraft Bedrock Addon

Een Bedrock Edition addon over ridders! Kies of je een **Ridder**, **Prins/Prinses** of **Koning/Koningin** wordt. Je keuze bepaalt je uitrusting (je "avatar") en waar je spawnt. Je komt terecht in een **gigantisch stenen kasteel** met 3 verdiepingen, hoge torens, een troonzaal, slaapkamer, keuken en kelder — vol fakkels. In het kasteel wonen een **kok, uitvinder, hofnar en butler**, en buiten staat een heel **leger ridders** klaar.

## Hoe te spelen

### Starten

1. Activeer het Behavior Pack **én** het Resource Pack in je wereld (creative aangeraden, cheats AAN).
2. Run het start-commando waar je staat:
   ```
   /function start
   ```
   Dit bouwt een keuze-hal rondom je met 3 portals.

### Een rol kiezen

Loop in de keuze-hal naar een van de 3 portals en **stap erop**:

| Richting | Rol | Wat je krijgt |
|----------|-----|----------------|
| ◀ West (ijzer) | ⚔ **Ridder** | Sterkste harnas (netherite), zwaard, schild, boog, kruisboog, speer (drietand) & pijlen. Spawnt midden in het leger op de binnenplaats. |
| ▲ Noord (diamant) | ♦ **Prins / Prinses** | Diamanten harnas. Spawnt op de **diamanten troon**. |
| ▶ Oost (goud) | ♚ **Koning / Koningin** | Gouden harnas + kroon. Spawnt op de **gouden troon**. |

Zodra je op een portal stapt word je automatisch naar het kasteel geteleporteerd, krijg je je uitrusting aangetrokken en (de eerste keer) wordt het kasteel met alle bewoners gebouwd.

### Het kasteel

- **Stenen kasteel** met 3 verdiepingen, 4 hoge hoekttorens en een centrale spits die ~100 blokken hoog reikt.
- Een ruime binnenplaats omringd door een muur met kantelen (~200 blokken breed) waar het leger staat.
- **Troonzaal** met een gouden én een diamanten troon op een verhoging.
- Een **lang rood tapijt** dat van de slaapkamer naar de tronen loopt.
- Kamers: **slaapkamer(s)**, **keuken**, **uitvinderswerkplaats**, **eetkamer** en een **kelder** met opslag.
- Overal **fakkels** en lantaarns.

### Bewoners (ze doen allemaal echt iets!)

| Bewoner | Wat hij/zij doet |
|---------|------------------|
| 👨‍🍳 Kok | Kookt soep op het kampvuur in de keuken en deelt dampende kommen soep uit aan wie in de buurt is |
| 🔧 Uitvinder | Staat bij zijn zelfgebouwde **katapult** op de binnenplaats; tijdens een gevecht bekogelt de katapult de vijand met vuurballen |
| 🤹 Hofnar | Danst energiek rond met vrolijke hartjes- en feestdeeltjes |
| 🤵 Butler | Brengt **gebraden kip** naar de koninklijke familie — maar alleen als je die nog niet hebt (dus pas weer als je het op hebt) |
| 🏹 Boogschutter-ridders | Staan boven op de 4 hoektorens en beschieten naderende vijanden met pijlen |

### Het leger & de vijand

Buiten staat een leger van **ridders** klaar. Ze vallen monsters en alle vijanden aan.

Ten noorden ligt een **even groot ROOD kasteel** van de vijand, met een eigen **vijandige koning** (een boss met 150 HP en een bossbalk) en zijn leger:

| Vijand | Wapen |
|--------|-------|
| 🔴 Vijandige Ridder | Zwaard (van dichtbij) |
| 🏹 Vijandige Boogschutter | Pijl en boog (van veraf) |
| 💣 Vijandige Kanonnier | Kanonskogels / vuurballen |
| 👑 Vijandige Koning | Boss — versla hem! |

**Let op:** zodra je een rol kiest, krijg je een waarschuwing dat **over 1 minuut** de vijand aanvalt. Na 60 seconden verschijnt een gemengd vijandig leger (zwaardvechters, boogschutters, kanonniers) op een **vlak spawn-platform binnen de binnenplaats bij de noordmuur** (op exact hetzelfde grondniveau als de rest van het kasteel) en bestormt je kasteel — bereid je voor met je ridders! Je kunt ook zelf een golf oproepen of zelf aanvallen:
```
/function vijand_leger   # roep meteen een extra aanvalsgolf op
/function naar_vijand    # jij valt het rode kasteel aan
```

> Tip: `mobgriefing` staat uit, dus de kanonskogels beschadigen de kastelen niet — ze doen alleen schade aan ridders en spelers.

### Commando's

| Commando | Wat het doet |
|----------|--------------|
| `/function start` | Open de keuze-hal met 3 portals |
| `/function vijand_leger` | Vijandige aanvalsgolf op ons kasteel |
| `/function naar_vijand` | Teleporteer naar het rode kasteel om aan te vallen |
| `/function reset` | Wis je rol zodat je opnieuw kunt kiezen |
| `/function help` | Toon het hulpscherm in de chat |

## Opmerking over de "avatar"

Een Bedrock-addon kan de echte speler-*skin* niet veranderen. De "avatar" wordt daarom gemaakt met je **uitrusting**: een koning draagt gouden harnas + kroon, een prins/prinses diamanten harnas, en een ridder het volledige netherite-wapenpakket. In het spel zie je zo duidelijk wie je bent.

## Techniek

- Het kasteel wordt **rondom de speler** gebouwd (relatieve `~`-coördinaten) op de plek waar je een rol kiest, dus je staat meteen ín je eigen kasteel — geen verre teleport. Een onzichtbaar anker (`kasteel_anker`) onthoudt het middelpunt, zodat de aanvallen op de juiste plek gebeuren. Het rode vijandkasteel wordt 260 blokken naar het noorden gebouwd zodra je het met `/function naar_vijand` aanvalt. Beide worden gegenereerd door `scripts/generate_ridder_kasteel.py`; grote `fill`-commando's worden opgedeeld onder de Bedrock-limiet van 32768 blokken.
- Entity-textures worden gegenereerd door `scripts/generate_ridder_textures.py`.
- De portal-keuze werkt via een tick-functie (`tick.mcfunction`) die detecteert of een speler op een keuze-portal staat.
