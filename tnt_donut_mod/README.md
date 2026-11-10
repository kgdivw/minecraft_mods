# TNT Donut

Een heel simpele mod met **één blok**: het **TNT Donut Blok**.

Zet het blok ergens neer en er verschijnt meteen een gigantische **donut van TNT**
om je heen — net als in de video: een dikke ring TNT die op de grond ligt, met een
gat in het midden.

## Hoe gebruik je het

1. Installeer `TntDonut.mcaddon` (dubbelklikken opent Minecraft).
   Lukt dat niet op tablet? Installeer dan eerst `TntDonutTexturen.mcpack` en
   daarna `TntDonutGedrag.mcpack`.
2. Zet in je wereld-instellingen zowel het behavior pack als het resource pack aan.
3. Pak in het creatieve menu bij de **bouwblokken** het **TNT Donut Blok**.
4. Plaats het blok op een open plek. De donut wordt in een paar tellen opgebouwd.
5. Het blok zelf verdwijnt, dus je kunt er zoveel neerzetten als je wilt.
6. Aansteken met vuursteen en staal mag — maar ren wel heel hard weg.

## Hoe groot is de donut

- 12.460 blokken TNT
- 49 blokken breed, 13 blokken hoog
- Wordt in ongeveer 11 ticks (een halve seconde) geplaatst, zodat de game niet hapert

Andere maat? Pas `STRAAL` (hoe groot de ring is) en `DIKTE` (hoe dik de ring is)
bovenin [BP/scripts/main.js](BP/scripts/main.js) aan.

## Geen experimenten nodig

De mod gebruikt de stabiele Script API (`@minecraft/server` 2.9.0), dus je hoeft
"Beta APIs" **niet** aan te zetten. Wel Minecraft Bedrock 1.21 of nieuwer.
