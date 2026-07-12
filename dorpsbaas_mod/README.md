# Baas van het Dorp

Een Minecraft Bedrock addon. Je spawnt in een **mega dorp** vol wegen, huizen en
dorpelingen. Het doel: word de **BAAS van het dorp** — voordat **Herobrine** het
wordt! Herobrine gebruikt mobs en stoute villagers om de baas te worden.

## Starten

1. Activeer het Behavior Pack **én** Resource Pack in je wereld.
2. Zet in de wereld-instellingen **Cheats / Commands** aan.
3. Typ in de chat: `/function start`

Je bouwt dan het dorp rondom jezelf met een centraal plein vol keuze-platforms.

## Hoe word je de baas? (opdrachten)

Op het dorpsplein staan **winkels**. Loop naar binnen en stap op de mat om te kopen.
De winkelier vertelt je spontaan over de prijs.

1. **Kleermaker** (noord) — een **blauw pak met een rode strik** (die zie je op je buik). *(Herobrine draagt grijs.)*
2. **Garage** (west) — een **bestuurbare** auto van diamant, goud of emerald. *(Herobrine rijdt goud.)* De auto rijdt over obstakels van 1 blok heen.
3. **Makelaar** (oost) — een eigen huis van ijzer, diamant, goud of emerald.
4. **Gemeentehuis** (zuid) — **Versla Herobrine** (hij verschijnt met zijn leger) en daarna je **huis groter maken**.
5. **Rijk & beroemd worden**:
   - **100 EUR** → je huizen worden van **emerald** (nog geen zwembad).
   - **1000 EUR** → **regenboog** huizen **met zwembad** → je wordt **BEROEMD** en de **BAAS**!

## Geld (EUR)

Je verdient EUR op twee manieren:
- **Opdrachten** afmaken (elke opdracht geeft EUR).
- **Mobs verslaan** — Herobrine's stoute villagers en Herobrine zelf laten
  **muntjes** vallen. Raap ze op; ze worden automatisch omgezet in EUR.

Je huidige EUR staat rechts in beeld (scoreboard).

## Commands

- `/function start` — start de mod (bouwt het dorp + plein)
- `/function help` — uitleg in de chat
- `/function reset` — begin helemaal opnieuw

## Voor makers

Alle assets (het dorp, de huizen, het auto-model en de textures) worden
gegenereerd door `scripts/generate_dorpsbaas.py`. Draai dat script opnieuw als je
iets aan het dorp of de huizen wilt veranderen; pas daarna nooit
`build_dorp.mcfunction` of `huis_*.mcfunction` met de hand aan.
