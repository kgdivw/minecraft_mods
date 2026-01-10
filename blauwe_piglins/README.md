# Blauwe Piglins Minecraft Bedrock Addon

![Build Status](https://github.com/kgdivw/minecraft_mods/workflows/Build%20and%20Release/badge.svg)
[![Latest Release](https://img.shields.io/github/v/release/kgdivw/minecraft_mods?label=latest)](https://github.com/kgdivw/minecraft_mods/releases/tag/latest)

Een Minecraft Bedrock Edition addon die blauwe piglins toevoegt. Word vrienden met ze door 5 diamonds te geven!

> [!NOTE]
> Deze addon wordt automatisch gebouwd en uitgebracht via GitHub Actions. Bij elke commit naar `master` wordt een nieuwe `BlauwePiglins.mcaddon` gegenereerd en beschikbaar gemaakt in de [latest release](../../releases/tag/latest).

## 🎮 Features

- **Blauwe Piglins**: Custom variant van de piglin met blauwe skin
- **Vriendschap systeem**: Geef 5 diamonds om een blauwe piglin je vriend te maken
- **Loyaal gedrag**: Getamede blauwe piglins volgen je en verdedigen je tegen vijandige piglins

## 📦 Installatie

### Voor Tablet/Bedrock Edition:

1. Download de nieuwste release van de [Releases pagina](../../releases):
   - `BlauwePiglins.mcaddon` (bevat beide packs)

2. Open het bestand met Minecraft Bedrock Edition
   - Minecraft importeert automatisch zowel behavior pack als resource pack (je ziet twee keer 'Import Started')

3. Activeer beide packs in je wereld instellingen:
   - Ga naar **Behavior Packs** → Activeer "Blauwe Piglins Behavior Pack"
   - Ga naar **Resource Packs** → Activeer "Blauwe Piglins Resource Pack"

## 🎯 Hoe te Gebruiken

1. **Spawn een blauwe piglin**:
   - Creative: Gebruik het blauwe spawn egg
   - Command: `/summon custom:blue_piglin`

2. **Maak hem je vriend**:
   - Verzamel 5 diamonds
   - Klik/tap op de blauwe piglin om te handelen
   - Geef de 5 diamonds → Je krijgt 1 gold nugget terug
   - Nu is de piglin je vriend! 🎉

3. **Gedrag als vriend**:
   - Volgt de speler
   - Valt vijandige piglins aan
   - Verdedigt je als je aangevallen wordt

## 📁 Project Structuur

```
blauwe_piglins/
├── BP/                          # Behavior Pack
│   ├── manifest.json
│   ├── pack_icon.png
│   ├── entities/
│   │   └── blue_piglin.json
│   ├── trading/
│   │   └── blue_piglin.json
│   └── loot_tables/
│       └── empty.json
│
├── RP/                          # Resource Pack
│   ├── manifest.json
│   ├── pack_icon.png
│   ├── entity/
│   │   └── blue_piglin.entity.json
│   ├── textures/entity/
│   │   └── blue_piglin.png
│   └── texts/
│       ├── en_US.lang
│       └── nl_NL.lang
│
└── README.md

Note: BlauwePiglins.mcaddon wordt automatisch gegenereerd via GitHub Actions
```

## 🔧 Technische Details

- **Minecraft Versie**: 1.20+
- **Entity ID**: `custom:blue_piglin`
- **Trade**: 5x Diamond → 1x Gold Nugget (+ taming)
- **AI**: Follow owner, attack hostile piglins

## 📖 Meer Info

Zie `walkthrough.md` in de artifacts folder voor gedetailleerde documentatie.

## 🚀 Ontwikkeling & Credits
 
Dit project is een experiment in geavanceerde **AI Pair Programming**. Het is volledig ontwikkeld door een samenwerking tussen een menselijke gebruiker en **Antigravity**, een agentic AI assistent van Google DeepMind.
 
### Hoe het tot stand kwam:
1. **Concept**: Het idee voor vriendelijke blauwe piglins kwam van de gebruiker.
2. **Realisatie**: Antigravity heeft de code geschreven voor de behavior packs, resource packs, en de texture definities.
3. **Automatisering**: Er is een volledig geautomatiseerde CI/CD pipeline opgezet. Elke wijziging die we pushen via git wordt automatisch:
   - Verwerkt door GitHub Actions
   - Ingepakt als `.mcaddon`
   - Gepubliceerd als "Latest Build" release
 
Deze workflow laat zien hoe AI en mens kunnen samenwerken om snel werkende software (en Minecraft mods!) te bouwen.
 
---
 *Gemaakt met 💙 en 🤖 Antigravity*
