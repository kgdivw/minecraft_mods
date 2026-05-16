# Superteams - Minecraft Bedrock Addon

Een Bedrock Edition addon waar je een team van villagers leidt, een superkracht krijgt, je eigen eiland claimt en met je Zee Paard andere teams aanvalt over de oceaan. Verzamel sjards om twee extra superkrachten te unlocken!

## Hoe te spelen

### Starten

1. Activeer Behavior Pack EN Resource Pack in je wereld (creative aangeraden, cheats AAN)
2. Run het start-commando waar je staat:
   ```
   /function start
   ```
   Dit bouwt het hub platform op (0, 80, 0), alle 4 team-eilanden in de verte, EN zet de scoreboards op.

### Een team kiezen

Loop in het hub platform naar een van de 4 gekleurde portals:

| Richting | Team | Passieve Superkracht |
|----------|------|----------------------|
| Noord (rood) | TEAM VUUR 🔥 | Vuurresistentie + Sterkte |
| West (blauw) | TEAM IJS ❄️ | Water Ademen + Conduit Power |
| Zuid (geel) | TEAM BLIKSEM ⚡ | Snelheid + Sprongkracht |
| Oost (groen) | TEAM AARDE 🪨 | Resistance + Extra Leven |

Stap op de gekleurde portal-vloer → automatisch teleport naar je eiland + superkracht + tag + start-uitrusting.

### HUD: Sjards en Powers

Bovenin je scherm zie je een actiebalk:
```
🔥 VUUR | 🔮 3/5 voor Vuurballen | 15 voor Aura
```

### Sjards verdienen → 2 extra superkrachten unlocken

Je krijgt **Sjards** door vijandige team-villagers te doden. Sjards worden AUTOMATISCH opgepikt en getrackt:

| Sjards | Unlock |
|--------|--------|
| 5 | **Power 1** - werpbaar projectiel-item |
| 15 | **Power 2** - aura die vijanden om je heen schade doet |

Per team:

| Team | Power 1 (5 sjards) | Power 2 (15 sjards) |
|------|----|----|
| 🔥 Vuur | Vuurballen werpen | Vuurstekels aura (brand binnen 4 blokken) |
| ❄️ IJs | IJsballen werpen (knockback) | Ijspegels aura (slow + dmg binnen 4 blokken) |
| ⚡ Bliksem | Bliksembollen (homing!) | Donderslag aura (binnen 5 blokken) |
| 🪨 Aarde | Aardeballen werpen | Rotsstekels aura (poison binnen 4 blokken) |

### Neutrale Villagers - groei je team

Op elk eiland staan **5 neutrale villagers** (grijs). Dood ze - ze laten een **Wedergeboorte Token** vallen. Loop eroverheen en er verschijnt direct een nieuwe villager van JOUW team op die plek!

Zo kan je een leger groter dan 10 opbouwen.

### Op je eiland

```
/function spawn_team
```
Spawnt 10 villagers van jouw team. Ze vechten automatisch tegen vijandige team-villagers.

### Huizen bouwen

```
/function build_house     # Klein huis met 4 bedden
/function build_mansion   # Gigantisch herenhuis (10 bedden, 2 verdiepingen)
/function build_armory    # Wapenkamer + Zee Paard + diamond/iron/gold/chainmail armor stands
```

### Vijandige eilanden aanvallen

1. Run `/function build_armory` voor je Zee Paard + harnas + zadel
2. Equip de saddle + iron_horse_armor op het Zee Paard (vanuit je inventory)
3. Stap op het Zee Paard
4. Rijd over de zee naar een ander eiland (amphibische navigatie + buoyancy)
5. Val daar de vijandige team-villagers aan. Elk doodt = 1 sjard
6. Gebruik je projectile + aura krachten voor extra power

### Eiland coordinaten

- 🔥 Vuur: `500, 70, 0`
- ❄️ IJs: `-500, 70, 0`
- ⚡ Bliksem: `0, 70, 500`
- 🪨 Aarde: `0, 70, -500`

Opposing teams (Vuur vs IJs, Bliksem vs Aarde) zijn 1000 blokken uit elkaar.

### Extra commandos

```
/function help     # Toont alle beschikbare commandos
/function reset    # Vergeet team + powers, kies opnieuw via portal
```

## Project structuur

```
superteams/
├── BP/                          # Behavior Pack
│   ├── entities/                # team_*, neutral_villager, sea_horse, portal_marker
│   ├── items/                   # soul_shard, respawn_token, 4x projectile items
│   ├── functions/               # start, tick, enter_*, island_*, spawn_*, build_*, unlock_p*
│   ├── loot_tables/             # empty, shard (team villagers), token (neutrals)
│   └── manifest.json
├── RP/                          # Resource Pack
│   ├── entity/                  # Client entity definities
│   ├── models/entity/           # portal_marker geometry
│   ├── textures/entity/         # Villager + zee paard texturen
│   ├── textures/items/          # Item icons
│   ├── texts/                   # nl_NL, en_US
│   └── manifest.json
└── README.md
```

## Technische details

- **Minecraft versie**: Bedrock 1.20+
- **Namespace**: `superteams:`
- **Teams**: 4 vijandige type_families voorkomen friendly-fire binnen eigen team
- **Scoreboards**:
  - `shards` - per speler bijgehouden sjards count
  - `aura_t` - aura cooldown timer (resets elke 20 ticks)
- **Custom items**: Bedrock `minecraft:throwable` + `minecraft:projectile` op de 4 bal-items, koppelt naar vanilla projectile entities (small_fireball, snowball, shulker_bullet, egg)
- **Zee paard**: `minecraft:buoyant` + amphibische navigatie + `minecraft:rideable`
- **Portal trigger**: invisible `portal_marker` entities die `tick.mcfunction` controleert
- **Unlock systeem**: tick checkt scoreboards en tags, draait per-team unlock functies automatisch
- **HUD**: `titleraw` met scoreboard-injectie in rawtext, per tag-combinatie ander bericht
- **Respawn token**: loot table op neutral_villager, geconsumeerd door tick via `hasitem` selector
