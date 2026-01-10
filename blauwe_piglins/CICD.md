# Blauwe Piglins - CI/CD

Dit project gebruikt GitHub Actions voor automatische builds en releases.

## Workflow

Bij elke push naar `master` of `main`:

1. **Build**: De workflow combineert de BP en RP directories in één .mcaddon bestand
2. **Release**: Het bestand wordt geüpload naar de "latest" release tag
3. **Update**: De release wordt bijgewerkt met commit informatie

## Workflow Bestand

`.github/workflows/release.yml`

## Handmatig Testen

Als je de workflow lokaal wilt testen zonder te pushen:

```bash
cd blauwe_piglins
mkdir -p build/addon
cp -r BP build/addon/
cp -r RP build/addon/
cd build/addon
zip -r ../BlauwePiglins.mcaddon BP/ RP/
```

Het resulterende `BlauwePiglins.mcaddon` bestand staat in de `build/` directory.

## Rolling Release Strategie

We gebruiken een "latest" rolling release in plaats van versioned releases omdat:
- Het een gaming mod is, niet enterprise software
- Gebruikers willen altijd de nieuwste versie
- Simpeler voor ontwikkeling en distributie
- Elke commit is direct beschikbaar voor testers

## Eerste Keer Setup

De eerste keer dat de workflow draait, wordt automatisch de "latest" release tag aangemaakt.
