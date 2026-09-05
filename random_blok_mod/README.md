# Random Blok Battle

Een behavior pack voor Minecraft **Bedrock Edition**. Elk blok dat je
breekt geeft een heel ander item — en na 100 dagen begint de battle.

## Wat doet het?

### 1. Elk blok geeft een ander item

Breek je een blok, dan valt het gewone drop-item **niet**. In plaats
daarvan krijg je het item dat bij dat blok hoort. Een paar voorbeelden:

| Blok | Item dat je krijgt |
| --- | --- |
| Glas | Diamant |
| Zand | Goudstaaf |
| Steen | IJzerstaaf |
| Cobblestone | Kolen |
| Obsidiaan | Netherite-staaf |
| Ancient debris | Nether Star |
| Eikenhout | Gebakken biefstuk |
| IJzererts | IJzerblok |
| Deepslate diamanterts | Diamanten pikhouweel |

Er zijn **114 blokken** met hun eigen item, en **twee blokken geven nooit
hetzelfde item**. Breek je een blok dat niet in de lijst staat, dan krijgt
dat blok automatisch een eigen reserve-item toegewezen — ook weer eentje
die nog nergens anders voor gebruikt wordt. Die keuze blijft bewaard als
je de wereld sluit en later verder speelt.

De hele lijst zien? Typ `/function battle_lijst`.

**Kisten en shulkerboxen doen ook mee.** Breek je een kist, dan valt
eerst alles eruit wat erin zat (je raakt dus niks kwijt) en daarbovenop
krijg je het item van dat blok:

| Blok | Item dat je krijgt |
| --- | --- |
| Kist | Betoverde gouden appel |
| Shulkerbox | Netherite bijl |
| Ender chest | Shulkerschaal |
| Vat | Bietensoep |
| Oven | Kolenblok |
| Hopper | Mijnkarretje |

Dat geldt ook voor de trapped chest, blast furnace, smoker, dispenser,
dropper, brouwstandaard, kampvuur, lezenaar, jukebox, beacon en bloempot.
Gekleurde shulkerboxen krijgen automatisch elk hun eigen item.

### 2. De timer van 100 dagen

Zodra je de wereld start loopt er een klok van **100 Minecraft-dagen**.
In de chat lees je hoeveel dagen je nog hebt (elke 10 dagen, en de
laatste 5 dagen elke dag). De laatste 3 dagen krijg je het ook groot in
beeld te zien.

Gebruik die 100 dagen om zo veel mogelijk goede spullen te verzamelen.

### 3. De BATTLE

Zijn de 100 dagen om, dan wordt iedereen naar een **arena hoog in de
lucht** getoverd (op y=180, boven het spawnpunt — zo gaat er niets van je
eigen bouwwerken kapot). Er wordt afgeteld van 5 naar 1 en dan is het
vechten met de spullen die je in die 100 dagen hebt verzameld.

- Iedereen licht op, zodat je elkaar door de muren heen ziet.
- Ga je dood, dan ben je uitgeschakeld en zegt de chat hoeveel spelers er
  nog over zijn.
- De laatste die leeft wint.

**Speel je alleen?** Dan vecht je in de arena tegen **5 golven monsters**
(5, 7, 9, 11 en 13 stuks). Overleef ze allemaal en jij bent de winnaar.

## Commando's

| Commando | Wat het doet |
| --- | --- |
| `/function battle_info` | Hoeveel dagen zijn er nog over? |
| `/function battle_lijst` | Zet de hele blok → item-lijst in de chat |
| `/function battle_nu` | Niet wachten: start de battle meteen |
| `/function battle_reset` | Nieuwe ronde, de klok begint weer op 100 dagen |

## Installeren

1. Download `RandomBlokBattle.mcaddon` bij de laatste release.
2. Open het bestand; Minecraft importeert het vanzelf.
3. Zet in je wereldinstellingen het **Behavior Pack "Random Blok Battle"**
   aan.
4. Bij Experimenten hoeft niets aan te staan — deze mod gebruikt de
   stabiele Script API (`@minecraft/server` 2.9.0), dus géén "Beta APIs".

Minimaal Minecraft 1.21.
