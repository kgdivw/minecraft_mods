# Robot Mod

Bouw je eigen robot! Hij vecht voor je en gaat diamanten mijnen. Wordt hij aangevallen, dan gaat hij **kapot** — en dan moet jij hem repareren met **redstone en ijzer**.

## Hoe krijg je een robot?

1. **Craft het Robot Bouwpakket** in een crafting table: 8x ijzerstaaf in een rondje, 1x redstone in het midden.
   ```
   I I I
   I R I     I = ijzerstaaf, R = redstone
   I I I
   ```
2. **Craft de Afstandsbediening**: redstone boven een ijzerstaaf boven een stok.
   ```
   . R .
   . I .     R = redstone, I = ijzerstaaf, S = stok
   . S .
   ```
3. Of typ in de chat `/function robot` — dan krijg je alles meteen (bouwpakket, afstandsbediening, 32 redstone en 32 ijzer).

Klik met het bouwpakket op de grond en je robot wordt in elkaar gezet. Je mag er maximaal **3** hebben.

## Wat kan de robot?

Klik met de **afstandsbediening** om te wisselen tussen drie standen:

| Stand | Wat doet hij? |
| --- | --- |
| **VOLGEN** | Hij blijft bij jou en teleporteert naar je toe als je te ver weg loopt. |
| **VECHTEN** | Hij zoekt monsters in de buurt en slaat ze weg (7 schade per klap). |
| **DIAMANT MIJNEN** | Hij zoekt diamanterts, graaft anders een mijn naar beneden, en legt elke gevonden diamant bij jou neer. |

Boven zijn hoofd zie je altijd zijn stand en hoeveel leven hij nog heeft.

## Kapot en repareren

- De robot heeft 40 leven. Zakt hij door aanvallen onder de 16, dan gaat hij **KAPOT**: hij wordt roestig met rode ogen, staat stil, rookt en doet niets meer.
- Een kapotte robot kan **niet doodgaan** — hij wacht gewoon op jou.
- **Repareren:** pak **redstone** in je hand en klik op de robot (je hebt ook **ijzer** in je rugzak nodig). Elke reparatie kost 1 redstone + 1 ijzerstaaf en geeft 12 leven terug.
- Is hij weer op 40/40? Dan piept hij vrolijk en gaat hij weer aan het werk.

## Installeren

Download `RobotMod.mcaddon` bij de laatste release en open hem met Minecraft Bedrock. Zet daarna in je wereld-instellingen het gedragspakket **én** het resourcepakket aan.

Er is **geen** experiment nodig: de mod gebruikt de gewone (stabiele) Script API van Minecraft.

## Textures opnieuw maken

```bash
python scripts/generate_robot_textures.py
```
