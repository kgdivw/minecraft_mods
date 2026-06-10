# Lava Mod 🔥

Een Minecraft Bedrock add-on die draait om lava.

## Wat doet het?

- **Lava in het landschap**: bij het genereren van nieuwe chunks worden er
  verspreid lavablokken aan de oppervlakte geplaatst, zodat de wereld vol
  gevaarlijke lavaplekken zit.
- **Alles zakt weg in de lava**: elk wezen (mobs, dieren, dropped items, enz.)
  dat in of op lava komt, verliest zijn opwaartse snelheid en wordt naar
  beneden de lava in getrokken — het "valt" dus weg.
- **Spelers blijven staan**: alle spelers zijn immuun. Jij (en je vrienden)
  blijven gewoon staan op de lava terwijl al het andere wegzakt.

## Installatie

1. Pak de map `BP` in als `.mcpack` (of kopieer hem naar
   `behavior_packs` van je wereld).
2. Activeer de **Lava Mod Behavior Pack** in je wereldinstellingen.
3. Zorg dat **Beta APIs / Experimentele scripting** aanstaat in de
   experimentele wereldinstellingen (nodig voor het script).
4. Maak een **nieuwe wereld** of verken nieuw terrein om de lavablokken te zien
   verschijnen.

> Vereist Minecraft Bedrock **1.21.0 of hoger**.

## Hoe het werkt (technisch)

| Onderdeel | Bestand | Functie |
|-----------|---------|---------|
| Lava plaatsen | `BP/features/single_lava_feature.json` | plaatst één lavablok |
| Spreiding | `BP/feature_rules/lava_pool_placement.json` | verspreidt lava over het oppervlak |
| Wegzakken | `BP/scripts/main.js` | trekt niet-spelers de lava in |

Het script controleert elke 5 ticks alle geladen wezens. Spelers worden
overgeslagen; al het andere dat op/in lava staat krijgt zijn snelheid gewist en
een neerwaartse impuls.

## Aanpassen

In `BP/scripts/main.js`:

- `CHECK_INTERVAL` — hoe vaak gecontroleerd wordt (in ticks).
- `SINK_STRENGTH` — hoe hard wezens de lava in geduwd worden.

In `BP/feature_rules/lava_pool_placement.json`:

- `iterations` en `scatter_chance` — hoeveel lava er per chunk verschijnt.
