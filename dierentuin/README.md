# Dierentuin - Minecraft Bedrock Addon

[![Build and Release](../../actions/workflows/release.yml/badge.svg)](../../actions/workflows/release.yml)

Een Minecraft Bedrock Edition addon waarin je een lege dierentuin hebt en wilde dieren moet vangen met kooien en ze met een karretje naar de dierentuin brengt!

> [!NOTE]
> Dit project heeft een automatische CI/CD pipeline. Bij elke push naar `main` wordt er automatisch een nieuwe `.mcaddon` gebouwd en als release gepubliceerd.

## Features

- 4 wilde dieren om te vangen: Leeuw, Panda, Papegaai en Olifant
- Kooi craft-systeem: maak kooien van ijzeren staven
- Vang dieren door ze aan te raken met een lege kooi
- Bestuurbaar zoo karretje (WASD besturing)
- Bouw je dierentuin met `/function build_zoo`
- Dieren spawnen natuurlijk in de juiste biomen
- Nederlandse en Engelse vertalingen

## Installatie

1. Download `Dierentuin.mcaddon` van de [Releases](../../releases) pagina
2. Open het bestand met Minecraft Bedrock Edition
3. De addon wordt automatisch geimporteerd
4. Activeer het Behavior Pack in je wereld instellingen

## Hoe te spelen

### Dierentuin bouwen
```
/function build_zoo
```
Dit bouwt een complete dierentuin op je huidige positie met 4 lege hokken.

### Kooi craften
Maak een kooi op de crafting table met ijzeren staven:
```
I   I
I   I
I I I
```
(I = Iron Bars / IJzeren Staven)

### Dieren vangen
1. Zoek wilde dieren (ze spawnen in specifieke biomen)
   - Leeuw: savanne
   - Panda: jungle
   - Papegaai: jungle
   - Olifant: savanne/vlaktes
2. Houd een lege kooi vast
3. Tik het wilde dier aan
4. De kooi bevat nu het dier!

### Dieren plaatsen
1. Selecteer de gevulde kooi in je hotbar
2. Tik op de grond in een hok van de dierentuin
3. Het dier verschijnt en loopt rustig rond!

### Karretje
- Craft een karretje met ijzer + minecart
- Plaats het karretje en stap erin
- Bestuur met WASD toetsen
- Rijd door de dierentuin of naar wilde dieren!

## Project Structuur

```
dierentuin/
├── BP/                     # Behavior Pack
│   ├── entities/           # 8 wild + tam dier entities + 1 karretje
│   ├── items/              # 5 kooi items (leeg + 4 gevuld)
│   ├── recipes/            # Kooi en karretje recepten
│   ├── spawn_rules/        # Waar wilde dieren spawnen
│   ├── loot_tables/        # Lege loot table
│   └── functions/          # build_zoo commando
├��─ RP/                     # Resource Pack
│   ├── entity/             # Client entity definities
│   ├─�� textures/           # Dier en item textures
│   └── texts/              # Vertalingen (NL + EN)
└─�� README.md
```

## Technische Details

- **Minecraft versie**: 1.20+
- **Type**: Bedrock Edition Addon
- **Namespace**: `zoo:`
- **Dieren**: 4 types (leeuw, panda, papegaai, olifant)
- **Vang systeem**: `minecraft:interact` + `transform_to_item`
- **Karretje**: `minecraft:rideable` + `minecraft:input_ground_controlled`
