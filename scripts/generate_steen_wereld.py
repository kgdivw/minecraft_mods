"""Bouwt een kant-en-klare wereld voor de mod "Je Bent Een Steen".

Het resultaat is `build/JeBentEenSteen.mcworld`: een nieuwe survival-wereld waar
het gedragspakket EN het texturenpakket al in zitten en al aanstaan. Je hoeft
dus niets meer te importeren of aan te vinken - openen en spelen.

Zo'n .mcworld is gewoon een zip met:

    level.dat                 wereld-instellingen (Bedrock-NBT, little-endian)
    levelname.txt             de naam in je werelden-lijst
    world_behavior_packs.json welke gedragspakketten aanstaan
    world_resource_packs.json welke texturenpakketten aanstaan
    behavior_packs/<naam>/    het pakket zelf
    resource_packs/<naam>/    het pakket zelf
    db/                       leeg: Minecraft maakt het land bij het openen

level.dat is NBT in Bedrock-vorm: alle getallen little-endian, een kopje van 8
bytes ervoor (bestandsversie + lengte) en daarin EEN naamloze compound met
alles erin. Die schrijven we hieronder met de hand, zodat er geen extra
Python-pakketten nodig zijn.

De veldnamen, volgorde en types hieronder zijn overgenomen van een echte
Bedrock-wereld (de voorbeeldwereld uit microsoft/minecraft-scripting-samples),
zodat Minecraft er zeker raad mee weet. Alleen de waardes zijn van ons:
survival, normaal, cheats aan (anders werkt /function niet) en coordinaten in
beeld (handig voor de opdrachten "klim naar 100" en "duik naar -15").
"""

import json
import os
import random
import struct
import time
import zipfile

BASE = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..")
MOD = os.path.join(BASE, "steen_mod")
UIT = os.path.join(BASE, "build", "JeBentEenSteen.mcworld")

WERELD_NAAM = "Je Bent Een Steen"

# ============================================================
#  NBT SCHRIJVEN (Bedrock: little-endian)
# ============================================================
EIND = 0
BYTE = 1
SHORT = 2
INT = 3
LONG = 4
FLOAT = 5
DOUBLE = 6
STRING = 8
LIST = 9
COMPOUND = 10

VORM = {BYTE: "<b", SHORT: "<h", INT: "<i", LONG: "<q", FLOAT: "<f", DOUBLE: "<d"}
MAAT = {BYTE: 1, SHORT: 2, INT: 4, LONG: 8, FLOAT: 4, DOUBLE: 8}


def tekst(s):
    b = s.encode("utf-8")
    return struct.pack("<h", len(b)) + b


def waarde(soort, v):
    if soort in VORM:
        return struct.pack(VORM[soort], v)
    if soort == STRING:
        return tekst(v)
    if soort == LIST:
        soort_in, lijst = v
        uit = struct.pack("<b", soort_in) + struct.pack("<i", len(lijst))
        for item in lijst:
            uit += waarde(soort_in, item)
        return uit
    if soort == COMPOUND:
        return compound(v)
    raise ValueError("onbekende soort %r" % soort)


def compound(velden):
    """velden = lijst van (naam, soort, waarde), op volgorde."""
    uit = b""
    for naam, soort, v in velden:
        uit += struct.pack("<b", soort) + tekst(naam) + waarde(soort, v)
    return uit + struct.pack("<b", EIND)


# De vlakke-wereld-lagen die Minecraft zelf ook neerzet. We gebruiken ze niet
# (Generator 1 = gewone oneindige wereld), maar het veld hoort er wel te staan.
PLATTE_LAGEN = (
    '{"biome_id":1,"block_layers":['
    '{"block_name":"minecraft:bedrock","count":1},'
    '{"block_name":"minecraft:dirt","count":2},'
    '{"block_name":"minecraft:grass","count":1}],'
    '"encoding_version":6,"structure_options":null}'
)


def maak_level_dat():
    nu = int(time.time())
    seed = random.getrandbits(31)

    rechten = [
        ("attackmobs", BYTE, 1),
        ("attackplayers", BYTE, 1),
        ("build", BYTE, 1),
        ("doorsandswitches", BYTE, 1),
        ("flySpeed", FLOAT, 0.05),
        ("flying", BYTE, 0),
        ("instabuild", BYTE, 0),
        ("invulnerable", BYTE, 0),
        ("lightning", BYTE, 0),
        ("mayfly", BYTE, 0),
        ("mine", BYTE, 1),
        ("op", BYTE, 1),
        ("opencontainers", BYTE, 1),
        ("teleport", BYTE, 1),
        ("walkSpeed", FLOAT, 0.1),
    ]

    # Geen enkel experiment nodig: de mod draait op de stabiele Script API.
    experimenten = [
        ("data_driven_items", BYTE, 0),
        ("data_driven_vanilla_blocks_and_items", BYTE, 0),
        ("experiments_ever_used", BYTE, 0),
        ("gametest", BYTE, 0),
        ("next_major_update", BYTE, 0),
        ("saved_with_toggled_experiments", BYTE, 0),
        ("wild_update_internal", BYTE, 0),
    ]

    velden = [
        ("BiomeOverride", STRING, ""),
        ("CenterMapsToOrigin", BYTE, 0),
        ("ConfirmedPlatformLockedContent", BYTE, 0),
        ("Difficulty", INT, 2),                       # normaal
        ("FlatWorldLayers", STRING, PLATTE_LAGEN),
        ("ForceGameType", BYTE, 0),
        ("GameType", INT, 0),                         # survival
        ("Generator", INT, 1),                        # gewone oneindige wereld
        ("InventoryVersion", STRING, "1.21.0"),
        ("LANBroadcast", BYTE, 1),
        ("LANBroadcastIntent", BYTE, 1),
        ("LastPlayed", LONG, nu),
        ("LevelName", STRING, WERELD_NAAM),
        ("LimitedWorldOriginX", INT, 0),
        ("LimitedWorldOriginY", INT, 32767),
        ("LimitedWorldOriginZ", INT, 0),
        ("MinimumCompatibleClientVersion", LIST, (INT, [1, 21, 0, 0, 0])),
        ("MultiplayerGame", BYTE, 1),
        ("MultiplayerGameIntent", BYTE, 1),
        ("NetherScale", INT, 8),
        ("NetworkVersion", INT, 686),
        ("Platform", INT, 2),
        ("PlatformBroadcastIntent", INT, 2),
        ("RandomSeed", LONG, seed),
        ("SpawnV1Villagers", BYTE, 0),
        ("SpawnX", INT, 0),
        ("SpawnY", INT, 32767),                       # 32767 = zoek zelf een plek
        ("SpawnZ", INT, 0),
        ("StorageVersion", INT, 10),
        ("Time", LONG, 1000),                         # ochtend
        ("WorldVersion", INT, 1),
        ("XBLBroadcastIntent", INT, 2),
        ("abilities", COMPOUND, rechten),
        ("baseGameVersion", STRING, "*"),
        ("bonusChestEnabled", BYTE, 0),
        ("bonusChestSpawned", BYTE, 0),
        ("commandblockoutput", BYTE, 1),
        ("commandblocksenabled", BYTE, 1),
        ("commandsEnabled", BYTE, 1),                 # anders werkt /function niet
        ("currentTick", LONG, 0),
        ("dodaylightcycle", BYTE, 1),
        ("doentitydrops", BYTE, 1),
        ("dofiretick", BYTE, 1),
        ("doimmediaterespawn", BYTE, 0),
        ("doinsomnia", BYTE, 1),
        ("domobloot", BYTE, 1),
        ("domobspawning", BYTE, 1),
        ("dotiledrops", BYTE, 1),
        ("doweathercycle", BYTE, 1),
        ("drowningdamage", BYTE, 1),
        ("eduOffer", INT, 0),
        ("educationFeaturesEnabled", BYTE, 0),
        ("experiments", COMPOUND, experimenten),
        ("falldamage", BYTE, 1),
        ("firedamage", BYTE, 1),
        ("freezedamage", BYTE, 1),
        ("functioncommandlimit", INT, 10000),
        ("hasBeenLoadedInCreative", BYTE, 0),
        ("hasLockedBehaviorPack", BYTE, 0),
        ("hasLockedResourcePack", BYTE, 0),
        ("immutableWorld", BYTE, 0),
        ("isFromLockedTemplate", BYTE, 0),
        ("isFromWorldTemplate", BYTE, 0),
        ("isSingleUseWorld", BYTE, 0),
        ("isWorldTemplateOptionLocked", BYTE, 0),
        ("keepinventory", BYTE, 0),
        ("lastOpenedWithVersion", LIST, (INT, [1, 21, 0, 3, 0])),
        ("lightningLevel", FLOAT, 0.0),
        ("lightningTime", INT, 50000),
        ("limitedWorldDepth", INT, 16),
        ("limitedWorldWidth", INT, 16),
        ("maxcommandchainlength", INT, 65535),
        ("mobgriefing", BYTE, 1),
        ("naturalregeneration", BYTE, 1),
        ("permissionsLevel", INT, 2),                 # jij bent de baas (operator)
        ("playerPermissionsLevel", INT, 2),
        ("prid", STRING, ""),
        ("pvp", BYTE, 1),
        ("rainLevel", FLOAT, 0.0),
        ("rainTime", INT, 50000),
        ("randomtickspeed", INT, 1),
        ("requiresCopiedPackRemovalCheck", BYTE, 0),
        ("respawnblocksexplode", BYTE, 1),
        ("sendcommandfeedback", BYTE, 1),
        ("serverChunkTickRange", INT, 4),
        ("showbordereffect", BYTE, 1),
        ("showcoordinates", BYTE, 1),                 # handig voor de opdrachten
        ("showdeathmessages", BYTE, 1),
        ("showtags", BYTE, 1),
        ("spawnMobs", BYTE, 1),
        ("spawnradius", INT, 5),
        ("startWithMapEnabled", BYTE, 0),
        ("texturePacksRequired", BYTE, 0),
        ("tntexplodes", BYTE, 1),
        ("useMsaGamertagsOnly", BYTE, 0),
        ("worldStartCount", LONG, 4294967294),
        ("world_policies", COMPOUND, []),
    ]

    # Alles zit in EEN naamloze compound; die staat in het bestand als een
    # gewoon veld zonder naam.
    inhoud = struct.pack("<b", COMPOUND) + tekst("") + compound(velden)
    return struct.pack("<ii", 10, len(inhoud)) + inhoud


# ============================================================
#  CONTROLEREN: lezen we onze eigen level.dat weer netjes terug?
# ============================================================
def lees_waarde(data, i, soort):
    if soort in VORM:
        return struct.unpack_from(VORM[soort], data, i)[0], i + MAAT[soort]
    if soort == STRING:
        n = struct.unpack_from("<h", data, i)[0]
        i += 2
        return data[i:i + n].decode("utf-8"), i + n
    if soort == LIST:
        soort_in = data[i]
        i += 1
        aantal = struct.unpack_from("<i", data, i)[0]
        i += 4
        uit = []
        for _ in range(aantal):
            v, i = lees_waarde(data, i, soort_in)
            uit.append(v)
        return (soort_in, uit), i
    if soort == COMPOUND:
        velden = []
        while True:
            s = data[i]
            i += 1
            if s == EIND:
                return velden, i
            n = struct.unpack_from("<h", data, i)[0]
            i += 2
            naam = data[i:i + n].decode("utf-8")
            i += n
            v, i = lees_waarde(data, i, s)
            velden.append((naam, s, v))
    raise ValueError("onbekende soort %r op %d" % (soort, i))


def controleer(rauw):
    versie, lengte = struct.unpack_from("<ii", rauw, 0)
    assert versie == 10, "verkeerde bestandsversie"
    assert lengte == len(rauw) - 8, "de lengte in het kopje klopt niet"
    assert rauw[8] == COMPOUND, "het begint niet met een compound"
    naam_lengte = struct.unpack_from("<h", rauw, 9)[0]
    assert naam_lengte == 0, "de buitenste compound hoort naamloos te zijn"
    velden, eind = lees_waarde(rauw, 11, COMPOUND)
    assert eind == len(rauw), "er bleef %d byte over" % (len(rauw) - eind)
    namen = [n for n, _, _ in velden]
    assert len(namen) == len(set(namen)), "dubbele veldnamen"
    assert namen == sorted(namen, key=lambda s: s), "velden staan niet op volgorde"
    terug = dict((n, v) for n, _, v in velden)
    assert terug["LevelName"] == WERELD_NAAM
    assert terug["commandsEnabled"] == 1, "zonder cheats werkt /function niet"
    assert terug["GameType"] == 0, "moet survival zijn"
    assert terug["Difficulty"] == 2
    print("level.dat: versie %d, %d bytes, %d velden - teruglezen ok"
          % (versie, lengte, len(velden)))


# ============================================================
#  DE WERELD INPAKKEN
# ============================================================
def pak_uuid(manifest):
    d = json.load(open(manifest, encoding="utf-8"))
    return d["header"]["uuid"], d["header"]["version"]


def voeg_map_toe(zf, map_pad, doel):
    for root, dirs, files in os.walk(map_pad):
        dirs.sort()
        for f in sorted(files):
            vol = os.path.join(root, f)
            naam = doel + "/" + os.path.relpath(vol, map_pad).replace(os.sep, "/")
            zf.write(vol, naam)


def main():
    bp_uuid, bp_versie = pak_uuid(os.path.join(MOD, "BP", "manifest.json"))
    rp_uuid, rp_versie = pak_uuid(os.path.join(MOD, "RP", "manifest.json"))

    level = maak_level_dat()
    controleer(level)

    if not os.path.isdir(os.path.dirname(UIT)):
        os.makedirs(os.path.dirname(UIT))
    if os.path.exists(UIT):
        os.remove(UIT)

    with zipfile.ZipFile(UIT, "w", zipfile.ZIP_DEFLATED) as zf:
        zf.writestr("level.dat", level)
        zf.writestr("levelname.txt", WERELD_NAAM)
        zf.writestr("world_behavior_packs.json",
                    json.dumps([{"pack_id": bp_uuid, "version": bp_versie}], indent=4))
        zf.writestr("world_resource_packs.json",
                    json.dumps([{"pack_id": rp_uuid, "version": rp_versie}], indent=4))
        # Lege db-map: Minecraft maakt het land zelf zodra je de wereld opent.
        zf.writestr(zipfile.ZipInfo("db/"), b"")
        voeg_map_toe(zf, os.path.join(MOD, "BP"), "behavior_packs/JeBentEenSteenGedrag")
        voeg_map_toe(zf, os.path.join(MOD, "RP"), "resource_packs/JeBentEenSteenTexturen")

    print("Gemaakt:", os.path.normpath(UIT))
    print("Gedragspakket:  ", bp_uuid, bp_versie)
    print("Texturenpakket: ", rp_uuid, rp_versie)
    with zipfile.ZipFile(UIT) as zf:
        print("%d bestanden, %d bytes" % (len(zf.namelist()), os.path.getsize(UIT)))


if __name__ == "__main__":
    main()
