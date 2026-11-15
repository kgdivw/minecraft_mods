import { world, system, ItemStack } from "@minecraft/server";
import { ActionFormData } from "@minecraft/server-ui";

// ============================================================
//  JE BENT EEN STEEN
//
//  Jij bent een steen. Drie mijnwerkers (Bert, Klaas en Dirk)
//  komen uit de mijn omhoog om je KAPOT TE MINEN. Ze rennen
//  achter je aan, graven door muren heen en slaan met hun
//  pikhouweel op je.
//
//  Jij verdedigt je met de UPGRADE-KNOP. Die zit in je rugzak:
//  tik ermee en er komt een menu met twee knoppen.
//
//    AANVAL  -> aanval-upgrades die je kunt unlocken
//    GROEIEN -> van level 1 tot level 6
//
//  Voor allebei moet je iets doen: elke upgrade en elk level
//  heeft zijn eigen opdracht, en die is elke keer anders.
//
//  Ben je level 6 (een BERG)? Dan is het jouw beurt: sloop alle
//  drie de mijnwerkers en jij hebt gewonnen.
//
//  Het spel start zelf zodra je de wereld binnenkomt.
//  Opnieuw starten: /function steen
// ============================================================

const MIJNWERKER = "steen:mijnwerker";
// Doet onze eigen mijnwerker het niet (bijvoorbeeld omdat het pakket niet
// helemaal aan staat)? Dan gebruiken we deze als reserve, want een spel zonder
// mijnwerkers is geen spel.
const MIJNWERKER_RESERVE = "minecraft:husk";
const MIJNWERKER_TAG = "steenmijnwerker";
const KNOP = "steen:upgrade";

const VOORNAMEN = ["Bert", "Klaas", "Dirk"];
const AANTAL_MIJNWERKERS = 3;
// Op hoeveel blokken afstand van jou een mijnwerker verschijnt.
const SPAWN_AFSTAND = 10;
const MAX_LEVEL = 6;
const DIMENSIES = ["overworld", "nether", "the_end"];
const VERSIE = "3";

// ============================================================
//  DE ZES LEVELS
//  boost  = extra hartjes (health_boost, 1 = 2 hartjes)
//  resist = hoeveel schade je wegslikt (-1 = niks)
//  klap   = extra schade als JIJ een mijnwerker slaat
//  pak    = welke stenen schil je draagt
// ============================================================
const LEVELS = [
    { naam: "Kiezelsteen", boost: 0, resist: -1, klap: 1, pak: "steen:pak_klein" },
    { naam: "Steen", boost: 2, resist: -1, klap: 3, pak: "steen:pak_klein" },
    { naam: "Rots", boost: 5, resist: 0, klap: 6, pak: "steen:pak_groot" },
    { naam: "Keisteen", boost: 8, resist: 0, klap: 10, pak: "steen:pak_groot" },
    { naam: "Rotsblok", boost: 11, resist: 1, klap: 15, pak: "steen:pak_mega" },
    { naam: "BERG", boost: 14, resist: 2, klap: 22, pak: "steen:pak_mega" }
];

// Hoe hoger jouw level, hoe beter hun pikhouweel.
const PIKHOUWELEN = [
    "minecraft:wooden_pickaxe",
    "minecraft:wooden_pickaxe",
    "minecraft:stone_pickaxe",
    "minecraft:iron_pickaxe",
    "minecraft:golden_pickaxe",
    "minecraft:diamond_pickaxe"
];

// ============================================================
//  DE OPDRACHTEN OM TE GROEIEN
//  Je krijgt er elke keer een willekeurige.
//  tijd:true    -> voortgang is in halve seconden
//  teller:false -> geen (3/10) in de actiebalk
//  minLevel     -> pas vanaf dit level
// ============================================================
const OPDRACHTEN = [
    {
        id: "rol", soort: "afstand", doel: 80,
        naam: "Rol 80 blokken ver",
        uitleg: "Stenen rollen graag. Ren gewoon weg van de mijnwerkers!"
    },
    {
        id: "eten", soort: "eten", doel: 3,
        naam: "Eet of drink 3 keer iets op",
        uitleg: "Ja, een steen eet ook. Houd je eten ingedrukt tot het helemaal op is."
    },
    {
        id: "water", soort: "water", doel: 16, tijd: true,
        naam: "Lig 8 seconden in het water",
        uitleg: "Lekker fris. Verdrinken kan een steen toch niet."
    },
    {
        id: "lava", soort: "lava", doel: 10, tijd: true,
        naam: "Zwem 5 seconden in LAVA",
        uitleg: "Jij bent van steen: lava doet je niets. De mijnwerkers durven niet."
    },
    {
        id: "steen", soort: "steen", doel: 15,
        naam: "Breek 15 steenblokken",
        uitleg: "Eet je eigen familie op, dan word je groter. Sorry, neefjes."
    },
    {
        id: "hout", soort: "hout", doel: 10,
        naam: "Sloop 10 houtblokken",
        uitleg: "Een boom is geen partij voor een steen."
    },
    {
        id: "hoog", soort: "hoog", doel: 1, teller: false,
        naam: "Klim naar hoogte 100",
        uitleg: "Hoog in de bergen wonen je grote broers. Kijk bij je coordinaten hoe hoog je bent."
    },
    {
        id: "diep", soort: "diep", doel: 1, teller: false,
        naam: "Duik naar hoogte -15",
        uitleg: "Diep onder de grond ben je echt thuis."
    },
    {
        id: "slaan", soort: "slaan", doel: 12,
        naam: "Sla de mijnwerkers 12 keer",
        uitleg: "Beuken! Hoe hoger je level, hoe harder het aankomt."
    },
    {
        id: "verstop", soort: "verstop", doel: 20, tijd: true,
        naam: "Verstop je 10 seconden (25 blokken van alle mijnwerkers)",
        uitleg: "Ren weg en houd je muisstil. Komt er een mijnwerker dichtbij, dan begint de tijd opnieuw."
    },
    {
        id: "val", soort: "val", doel: 1, teller: false,
        naam: "Val van 15 blokken hoog naar beneden",
        uitleg: "Zoek een klif of een gat. Vallen doet een steen geen pijn."
    },
    {
        id: "versla", soort: "versla", doel: 1, minLevel: 3,
        naam: "Versla 1 mijnwerker",
        uitleg: "Je bent nu groot genoeg om er een te slopen. Er komt wel een nieuwe uit de mijn..."
    },
    {
        id: "steenveel", soort: "steen", doel: 30, minLevel: 3,
        naam: "Breek 30 steenblokken",
        uitleg: "Een grote steen eet gewoon wat meer."
    },
    {
        id: "rolveel", soort: "afstand", doel: 200, minLevel: 4,
        naam: "Rol 200 blokken ver",
        uitleg: "Op reis! Een rollende steen is niet te stoppen."
    },
    {
        id: "slaanveel", soort: "slaan", doel: 25, minLevel: 4,
        naam: "Sla de mijnwerkers 25 keer",
        uitleg: "Jij bent nu de baas. Laat het ze voelen."
    }
];

// ============================================================
//  DE AANVAL-UPGRADES
//  Tik er in het menu op, doe de opdracht die erbij hoort, en
//  dan is hij voor altijd van jou.
// ============================================================
const AANVALLEN = [
    {
        id: "kop", naam: "Harde Kop", uitleg: "+3 schade bij elke klap",
        soort: "slaan", doel: 10,
        eis: "Sla de mijnwerkers 10 keer"
    },
    {
        id: "splinter", naam: "Scherpe Splinters", uitleg: "+5 schade bij elke klap",
        soort: "hout", doel: 15,
        eis: "Sloop 15 houtblokken"
    },
    {
        id: "stoot", naam: "Steenstoot", uitleg: "de mijnwerker vliegt weg door je klap",
        soort: "steen", doel: 20,
        eis: "Breek 20 steenblokken"
    },
    {
        id: "vuur", naam: "Vuursteen", uitleg: "+6 schade en vonken bij elke klap",
        soort: "lava", doel: 10, tijd: true,
        eis: "Zwem 5 seconden in lava"
    },
    {
        id: "traag", naam: "Rotswervel", uitleg: "de mijnwerker loopt 5 seconden traag",
        soort: "water", doel: 16, tijd: true,
        eis: "Lig 8 seconden in het water"
    },
    {
        id: "beving", naam: "Aardbeving", uitleg: "elke 4e klap raakt ALLE mijnwerkers dichtbij",
        soort: "afstand", doel: 150,
        eis: "Rol 150 blokken ver"
    },
    {
        id: "donder", naam: "Donderklap", uitleg: "1 op de 4 klappen knalt extra hard (+10)",
        soort: "eten", doel: 4,
        eis: "Eet of drink 4 keer iets op"
    },
    {
        id: "bergkracht", naam: "Bergkracht", uitleg: "DUBBELE schade bij elke klap",
        soort: "versla", doel: 2, minLevel: 4,
        eis: "Versla 2 mijnwerkers"
    }
];

const STEEN_BLOKKEN = [
    "stone", "cobblestone", "deepslate", "andesite", "diorite", "granite",
    "tuff", "calcite", "basalt", "blackstone"
];
const HOUT_BLOKKEN = ["log", "_wood", "stem", "hyphae", "planks"];

// Hier is een steen gewoon immuun voor.
const STEEN_IMMUUN = [
    "fall", "fire", "fireTick", "lava", "magma", "freezing", "contact",
    "flyIntoWall", "drowning", "suffocation", "stalactite", "stalagmite",
    "cactus", "temperature"
];

const TAUNTS = [
    "He! Die steen beweegt!",
    "Pak die kei!",
    "Mijn pikhouweel wil die steen hebben!",
    "Kom hier, lekker stukje grind!",
    "Jij wordt mijn mooiste vondst van de dag!",
    "Hij groeit! Sla harder!",
    "Volgens mijn kaart zit die steen precies HIER.",
    "Stenen kunnen niet rennen... toch?",
    "Doorgraven jongens, hij ontsnapt!",
    "Ik ruik verse steen!"
];

// ============================================================
//  WAT WETEN WE OP DIT MOMENT?
// ============================================================
let actief = false;
let uitgezet = false;
let level = 1;
let groeiId = "";
let groeiVoort = 0;
let groeiKlaar = false;
let aanvalId = "";
let aanvalVoort = 0;
let ontgrendeld = [];
let gedaan = [];
let eindfase = false;
let laatsteKans = false;

let geladen = false;
let perksTeller = 0;
let tauntTeller = 0;
let respawnWacht = 0;
let opslaanTeller = 0;
let klapTeller = 0;
let soortMijnwerker = MIJNWERKER;
let reserveGemeld = false;
let laatsteSpawnFout = "";
const laatstePos = new Map();
const valTop = new Map();

function nivo() {
    const n = level < 1 ? 1 : (level > MAX_LEVEL ? MAX_LEVEL : level);
    return LEVELS[n - 1];
}

function opdrachtOp(id) {
    for (const q of OPDRACHTEN) {
        if (q.id === id) return q;
    }
    return undefined;
}

function aanvalOp(id) {
    for (const a of AANVALLEN) {
        if (a.id === id) return a;
    }
    return undefined;
}

function groeiOpdracht() {
    return opdrachtOp(groeiId);
}

function aanvalOpdracht() {
    return aanvalOp(aanvalId);
}

function heeft(id) {
    return ontgrendeld.indexOf(id) >= 0;
}

function afstand(a, b) {
    return Math.sqrt((a.x - b.x) * (a.x - b.x) + (a.y - b.y) * (a.y - b.y) + (a.z - b.z) * (a.z - b.z));
}

function lijstMatch(id, lijst) {
    for (const stuk of lijst) {
        if (id.indexOf(stuk) >= 0) return true;
    }
    return false;
}

function weergave(q, n) {
    if (q.tijd === true) return Math.floor(n / 2) + "s";
    return String(Math.floor(n));
}

// ============================================================
//  OPSLAAN, zodat je spel een herstart van de wereld overleeft
// ============================================================
function opslaan() {
    try {
        world.setDynamicProperty("steen_actief", actief);
        world.setDynamicProperty("steen_uit", uitgezet);
        world.setDynamicProperty("steen_level", level);
        world.setDynamicProperty("steen_groei", groeiId);
        world.setDynamicProperty("steen_groeivoort", groeiVoort);
        world.setDynamicProperty("steen_groeiklaar", groeiKlaar);
        world.setDynamicProperty("steen_aanval", aanvalId);
        world.setDynamicProperty("steen_aanvalvoort", aanvalVoort);
        world.setDynamicProperty("steen_unlocks", ontgrendeld.join(","));
        world.setDynamicProperty("steen_gedaan", gedaan.join(","));
        world.setDynamicProperty("steen_eind", eindfase);
        world.setDynamicProperty("steen_kans", laatsteKans);
    } catch (e) { /* niet erg */ }
}

function lijstUit(sleutel) {
    const s = world.getDynamicProperty(sleutel);
    return (typeof s === "string" && s.length > 0) ? s.split(",") : [];
}

function laad() {
    try {
        actief = world.getDynamicProperty("steen_actief") === true;
        uitgezet = world.getDynamicProperty("steen_uit") === true;
        const lv = world.getDynamicProperty("steen_level");
        level = (typeof lv === "number" && lv >= 1) ? lv : 1;
        const gr = world.getDynamicProperty("steen_groei");
        groeiId = typeof gr === "string" ? gr : "";
        const gv = world.getDynamicProperty("steen_groeivoort");
        groeiVoort = typeof gv === "number" ? gv : 0;
        groeiKlaar = world.getDynamicProperty("steen_groeiklaar") === true;
        const av = world.getDynamicProperty("steen_aanval");
        aanvalId = typeof av === "string" ? av : "";
        const avv = world.getDynamicProperty("steen_aanvalvoort");
        aanvalVoort = typeof avv === "number" ? avv : 0;
        ontgrendeld = lijstUit("steen_unlocks");
        gedaan = lijstUit("steen_gedaan");
        eindfase = world.getDynamicProperty("steen_eind") === true;
        laatsteKans = world.getDynamicProperty("steen_kans") === true;
    } catch (e) { /* niet erg */ }
}

// ============================================================
//  DE STEEN: schade, schil, krachten, hartjes en de knop
// ============================================================
function klapSchade() {
    let s = nivo().klap;
    if (heeft("kop")) s = s + 3;
    if (heeft("splinter")) s = s + 5;
    if (heeft("vuur")) s = s + 6;
    if (heeft("bergkracht")) s = s * 2;
    return s;
}

function geefPerks(p, g) {
    try {
        p.addEffect("fire_resistance", 400, { showParticles: false });
        if (g.boost > 0) p.addEffect("health_boost", 400, { amplifier: g.boost, showParticles: false });
        // Alleen als je op de grond staat, anders zou dit de val-bescherming
        // in checkTaken (resistance 4) overschrijven terwijl je naar beneden valt.
        if (g.resist >= 0 && p.isOnGround) {
            p.addEffect("resistance", 400, { amplifier: g.resist, showParticles: false });
        }
        if (g.naam === "BERG") p.addEffect("strength", 400, { amplifier: 1, showParticles: false });
    } catch (e) { /* niet erg */ }
}

// Draag je al een harnas? Dan stoppen we dat netjes in je rugzak in plaats van
// het weg te gooien.
function bewaarItem(p, stapel) {
    try {
        const inv = p.getComponent("minecraft:inventory");
        const bak = inv ? inv.container : undefined;
        if (bak && bak.emptySlotsCount > 0) {
            bak.addItem(stapel);
            return;
        }
        p.dimension.spawnItem(stapel, p.location);
    } catch (e) { /* niet erg */ }
}

function zetPak(p, pakId) {
    try {
        const eq = p.getComponent("minecraft:equippable");
        if (!eq) return;
        const nu = eq.getEquipment("Chest");
        if (nu && nu.typeId === pakId) return;
        if (nu) bewaarItem(p, nu);
        eq.setEquipment("Chest", new ItemStack(pakId, 1));
    } catch (e) { /* niet erg */ }
}

function haalPakWeg(p) {
    try {
        const eq = p.getComponent("minecraft:equippable");
        if (!eq) return;
        const nu = eq.getEquipment("Chest");
        if (nu && nu.typeId.indexOf("steen:pak_") === 0) eq.setEquipment("Chest", undefined);
    } catch (e) { /* niet erg */ }
}

// De upgrade-knop hoort altijd in je rugzak te zitten.
function zorgVoorKnop(p) {
    try {
        const inv = p.getComponent("minecraft:inventory");
        const bak = inv ? inv.container : undefined;
        if (!bak) return;
        for (let i = 0; i < bak.size; i++) {
            const stapel = bak.getItem(i);
            if (stapel && stapel.typeId === KNOP) return;
        }
        if (bak.emptySlotsCount > 0) bak.addItem(new ItemStack(KNOP, 1));
    } catch (e) { /* niet erg */ }
}

function maakHeel(p) {
    try {
        const hp = p.getComponent("minecraft:health");
        if (hp) hp.setCurrentValue(hp.effectiveMax);
    } catch (e) { /* niet erg */ }
}

// ============================================================
//  DE MIJNWERKERS
// ============================================================
function isMijnwerker(e) {
    if (!e) return false;
    try {
        if (e.typeId === MIJNWERKER) return true;
        return e.hasTag(MIJNWERKER_TAG);
    } catch (err) {
        return false;
    }
}

function alleMijnwerkers() {
    const lijst = [];
    for (const d of DIMENSIES) {
        try {
            const dim = world.getDimension(d);
            for (const e of dim.getEntities({ type: MIJNWERKER })) lijst.push(e);
            for (const e of dim.getEntities({ tags: [MIJNWERKER_TAG] })) {
                if (e.typeId !== MIJNWERKER) lijst.push(e);
            }
        } catch (e) { /* dimensie nog niet geladen */ }
    }
    return lijst;
}

// Een plek rondom de speler: precies zo veel blokken ver, in een willekeurige
// richting.
function plekRondom(p, blokken, hoger) {
    const hoek = Math.random() * Math.PI * 2;
    return {
        x: p.location.x + Math.cos(hoek) * blokken,
        y: p.location.y + hoger,
        z: p.location.z + Math.sin(hoek) * blokken
    };
}

function spawnMijnwerker(speler, naam, melden) {
    // Zit die ene plek vol (muur, berg), dan proberen we een andere richting en
    // een iets andere hoogte, maar altijd op dezelfde afstand.
    const hoogtes = [1, 2, 0, 3, 1, 2, 0, 3, 1, 2, 0, 3];
    for (let ronde = 0; ronde < 2; ronde++) {
        for (let poging = 0; poging < hoogtes.length; poging++) {
            try {
                const m = speler.dimension.spawnEntity(
                    soortMijnwerker,
                    plekRondom(speler, SPAWN_AFSTAND, hoogtes[poging])
                );
                m.addTag(MIJNWERKER_TAG);
                m.nameTag = naam + " de Mijnwerker";
                if (melden) {
                    world.sendMessage("§8[Mijn]§r " + naam + " klimt uit de mijn omhoog... en hij ziet je!");
                }
                return m;
            } catch (e) {
                laatsteSpawnFout = String(e);
            }
        }
        // Lukt onze eigen mijnwerker helemaal niet? Dan schakelen we over op de
        // reserve, zodat je toch kunt spelen.
        if (soortMijnwerker === MIJNWERKER) {
            soortMijnwerker = MIJNWERKER_RESERVE;
            if (!reserveGemeld) {
                reserveGemeld = true;
                world.sendMessage("§c[Steen]§r Mijn eigen mijnwerker doet het niet in deze wereld.");
                world.sendMessage("§7Ik stuur nu gewone mijnwerkers op je af, dan kun je toch spelen.");
                world.sendMessage("§7Doe §e/function steen_test§7 en stuur me wat daar staat.");
            }
        } else {
            break;
        }
    }
    return undefined;
}

function vrijeNaam(mijners) {
    for (const n of VOORNAMEN) {
        let bezet = false;
        for (const m of mijners) {
            const t = m.nameTag ? m.nameTag : "";
            if (t.indexOf(n) >= 0) bezet = true;
        }
        if (!bezet) return n;
    }
    return "Nieuwe";
}

// Hier blijven hun pikhouwelen van af: kisten, bedden, bedrock enzovoort.
const NIET_SLOPEN = [
    "bedrock", "chest", "barrel", "shulker_box", "furnace", "smoker", "hopper",
    "beacon", "command_block", "structure_block", "jigsaw", "portal", "bed",
    "barrier", "obsidian", "spawner", "dispenser", "dropper", "brewing_stand",
    "anvil", "enchanting_table", "lectern", "campfire", "respawn_anchor"
];

function sloop(dim, x, y, z) {
    try {
        const b = dim.getBlock({ x: x, y: y, z: z });
        if (!b || b.isAir || b.isLiquid) return;
        if (lijstMatch(b.typeId, NIET_SLOPEN)) return;
        dim.runCommand("setblock " + x + " " + y + " " + z + " air destroy");
    } catch (e) { /* blok niet geladen */ }
}

// De mijnwerker graaft een tunnel richting de steen.
function graaf(m, speler) {
    const van = m.location;
    const naar = speler.location;
    let dx = naar.x - van.x;
    const dy = naar.y - van.y;
    let dz = naar.z - van.z;
    const lengte = Math.sqrt(dx * dx + dy * dy + dz * dz);
    if (lengte < 0.5) return;
    dx = dx / lengte;
    dz = dz / lengte;
    const dim = m.dimension;
    for (const stap of [1, 2]) {
        const x = Math.floor(van.x + dx * stap);
        const z = Math.floor(van.z + dz * stap);
        sloop(dim, x, Math.floor(van.y), z);
        sloop(dim, x, Math.floor(van.y) + 1, z);
    }
    if (dy > 1.5) sloop(dim, Math.floor(van.x), Math.floor(van.y) + 2, Math.floor(van.z));
    if (dy < -1.5) sloop(dim, Math.floor(van.x), Math.floor(van.y) - 1, Math.floor(van.z));
}

function stuurMijnwerker(m, spelers) {
    let doelwit = undefined;
    let best = 1000000;
    for (const p of spelers) {
        if (p.dimension.id !== m.dimension.id) continue;
        const d = afstand(m.location, p.location);
        if (d < best) {
            best = d;
            doelwit = p;
        }
    }
    // Zit de steen in een andere dimensie? Dan gaat deze mijnwerker de mijn
    // weer in en komt hij daar straks bovengronds.
    if (!doelwit) {
        try { m.remove(); } catch (e) { /* niet erg */ }
        return;
    }

    const nv = level - 1;
    try {
        m.addEffect("fire_resistance", 400, { showParticles: false });
        if (nv >= 1) m.addEffect("speed", 400, { amplifier: nv > 2 ? 2 : nv, showParticles: false });
        if (nv >= 3) m.addEffect("strength", 400, { amplifier: 0, showParticles: false });
        // Een reserve-mijnwerker is van zichzelf wat slapper: die krijgt extra
        // hartjes en we blussen hem als hij in de zon staat te roken.
        if (m.typeId !== MIJNWERKER) {
            m.addEffect("health_boost", 1200, { amplifier: 4, showParticles: false });
            m.extinguishFire(false);
        }
    } catch (e) { /* niet erg */ }

    try {
        const eq = m.getComponent("minecraft:equippable");
        if (eq) {
            const wil = PIKHOUWELEN[level > MAX_LEVEL ? MAX_LEVEL - 1 : level - 1];
            const nu = eq.getEquipment("Mainhand");
            if (!nu || nu.typeId !== wil) eq.setEquipment("Mainhand", new ItemStack(wil, 1));
        }
    } catch (e) { /* niet erg */ }

    if (best > 80) {
        try { m.teleport(plekRondom(doelwit, SPAWN_AFSTAND, 1)); } catch (e) { /* niet erg */ }
        return;
    }
    if (best > 3) graaf(m, doelwit);
}

function zorgVoorAantal(mijners, spelers) {
    if (eindfase) return;
    if (mijners.length >= AANTAL_MIJNWERKERS) {
        respawnWacht = 0;
        return;
    }
    respawnWacht++;
    if (respawnWacht < 20) return;
    respawnWacht = 0;
    const p = spelers[Math.floor(Math.random() * spelers.length)];
    spawnMijnwerker(p, vrijeNaam(mijners), true);
}

function taunt(mijners) {
    if (mijners.length === 0) return;
    const m = mijners[Math.floor(Math.random() * mijners.length)];
    const naam = m.nameTag ? m.nameTag : "Mijnwerker";
    world.sendMessage("§8<" + naam + "> §7" + TAUNTS[Math.floor(Math.random() * TAUNTS.length)]);
}

// ============================================================
//  GROEIEN: van level 1 naar level 6
// ============================================================
function nieuweGroeiOpdracht(zegIets) {
    let keuze = [];
    for (const q of OPDRACHTEN) {
        const min = q.minLevel ? q.minLevel : 0;
        if (min <= level && gedaan.indexOf(q.id) < 0) keuze.push(q);
    }
    if (keuze.length === 0) {
        gedaan = [];
        for (const q of OPDRACHTEN) {
            const min = q.minLevel ? q.minLevel : 0;
            if (min <= level) keuze.push(q);
        }
    }
    const q = keuze[Math.floor(Math.random() * keuze.length)];
    groeiId = q.id;
    groeiVoort = 0;
    groeiKlaar = false;
    if (zegIets) {
        world.sendMessage("§6[Steen]§r Je groei-opdracht voor level " + (level + 1) + ": §a" + q.naam);
        world.sendMessage("§7" + q.uitleg);
        for (const p of world.getAllPlayers()) {
            try { p.playSound("random.orb"); } catch (e) { /* niet erg */ }
        }
    }
    opslaan();
}

function groeiOpdrachtAf() {
    const q = groeiOpdracht();
    if (q && gedaan.indexOf(q.id) < 0) gedaan.push(q.id);
    groeiKlaar = true;
    world.sendMessage("§a[Steen]§r Groei-opdracht gehaald!");
    world.sendMessage("§e[Steen]§r Pak je §eUpgrade-knop§r, tik op §aGROEIEN§r en word level " + (level + 1) + "!");
    for (const p of world.getAllPlayers()) {
        try {
            p.playSound("random.levelup");
            p.onScreenDisplay.setTitle("§aKLAAR OM TE GROEIEN", {
                subtitle: "§7tik met je upgrade-knop",
                fadeInDuration: 5,
                stayDuration: 40,
                fadeOutDuration: 10
            });
        } catch (e) { /* niet erg */ }
    }
    opslaan();
}

function groeiFeest() {
    const g = nivo();
    world.sendMessage("§6=========================================");
    world.sendMessage("§6[Steen]§r Je bent nu §elevel " + level + ": " + g.naam + "§r!");
    world.sendMessage("§7Je klap doet nu §e" + klapSchade() + " §7extra schade.");
    world.sendMessage("§6=========================================");
    for (const p of world.getAllPlayers()) {
        try {
            p.onScreenDisplay.setTitle("§eLEVEL " + level + "!", {
                subtitle: "§7je bent een " + g.naam,
                fadeInDuration: 5,
                stayDuration: 40,
                fadeOutDuration: 10
            });
            p.playSound("random.levelup");
            geefPerks(p, g);
            zetPak(p, g.pak);
            p.dimension.runCommand(
                "particle minecraft:villager_happy " +
                p.location.x.toFixed(1) + " " + (p.location.y + 1).toFixed(1) + " " + p.location.z.toFixed(1)
            );
        } catch (e) { /* niet erg */ }
    }
    // De nieuwe hartjes moeten eerst bestaan, daarna vullen we ze.
    system.runTimeout(() => {
        for (const p of world.getAllPlayers()) maakHeel(p);
    }, 10);
}

// Dit gebeurt als je op de GROEI-knop drukt.
function groeiNu() {
    if (level >= MAX_LEVEL) return;
    level = level + 1;
    groeiKlaar = false;
    groeiVoort = 0;
    laatsteKans = false;
    groeiFeest();
    if (level >= MAX_LEVEL) {
        eindfase = true;
        groeiId = "";
        world.sendMessage("§6[Steen]§r Je bent een §eBERG§r: hoger dan level " + MAX_LEVEL + " kan niet.");
        world.sendMessage("§c[Steen]§r Nu is het JOUW beurt: sloop alle drie de mijnwerkers en je wint!");
        opslaan();
    } else {
        nieuweGroeiOpdracht(true);
    }
}

// ============================================================
//  AANVAL-UPGRADES
// ============================================================
function kiesAanval(a) {
    aanvalId = a.id;
    aanvalVoort = 0;
    world.sendMessage("§c[Steen]§r Je werkt nu aan de aanval-upgrade §e" + a.naam + "§r.");
    world.sendMessage("§7Daarvoor moet je: §a" + a.eis);
    world.sendMessage("§7Daarna is §e" + a.uitleg + " §7voor altijd van jou.");
    opslaan();
}

function aanvalAf() {
    const a = aanvalOpdracht();
    if (!a) return;
    if (!heeft(a.id)) ontgrendeld.push(a.id);
    aanvalId = "";
    aanvalVoort = 0;
    world.sendMessage("§c=========================================");
    world.sendMessage("§c[Steen]§r AANVAL-UPGRADE UNLOCKED: §e" + a.naam + "§r!");
    world.sendMessage("§7" + a.uitleg + ". Je klap doet nu §e" + klapSchade() + " §7extra schade.");
    world.sendMessage("§c=========================================");
    for (const p of world.getAllPlayers()) {
        try {
            p.onScreenDisplay.setTitle("§c" + a.naam + "!", {
                subtitle: "§7aanval-upgrade unlocked",
                fadeInDuration: 5,
                stayDuration: 40,
                fadeOutDuration: 10
            });
            p.playSound("random.anvil_use");
        } catch (e) { /* niet erg */ }
    }
    opslaan();
}

// ============================================================
//  VOORTGANG
//  Je groei-opdracht en je aanval-opdracht lopen tegelijk, dus
//  elk puntje gaat naar allebei als het past.
// ============================================================
function soortActief(soort) {
    const q = groeiOpdracht();
    if (!eindfase && !groeiKlaar && q && q.soort === soort) return true;
    const a = aanvalOpdracht();
    if (a && a.soort === soort) return true;
    return false;
}

function geefVoort(soort, n) {
    if (!actief) return;
    const q = groeiOpdracht();
    if (!eindfase && !groeiKlaar && q && q.soort === soort) {
        groeiVoort = groeiVoort + n;
        if (groeiVoort >= q.doel) {
            groeiVoort = q.doel;
            groeiOpdrachtAf();
        }
    }
    const a = aanvalOpdracht();
    if (a && a.soort === soort) {
        aanvalVoort = aanvalVoort + n;
        if (aanvalVoort >= a.doel) aanvalAf();
    }
}

// Voor opdrachten die in een keer klaar zijn (hoogte, diepte, vallen).
function zetAf(soort) {
    const q = groeiOpdracht();
    if (!eindfase && !groeiKlaar && q && q.soort === soort) geefVoort(soort, q.doel);
    const a = aanvalOpdracht();
    if (a && a.soort === soort) geefVoort(soort, a.doel);
}

function nulVoort(soort) {
    const q = groeiOpdracht();
    if (q && q.soort === soort) groeiVoort = 0;
    const a = aanvalOpdracht();
    if (a && a.soort === soort) aanvalVoort = 0;
}

function checkTaken(spelers, mijners) {
    // Hoe hoog was je voordat je landde? (voor de val-opdracht)
    for (const p of spelers) {
        const sleutel = p.id;
        if (!p.isOnGround) {
            const h = valTop.get(sleutel);
            if (h === undefined || p.location.y > h) valTop.set(sleutel, p.location.y);
            // Val je al meer dan 6 blokken? Dan word je even keihard, zodat de
            // klap op de grond je NOOIT kan doden. Stenen vallen nu eenmaal.
            else if (h - p.location.y > 6) {
                try { p.addEffect("resistance", 60, { amplifier: 4, showParticles: false }); } catch (e) { /* niet erg */ }
            }
        } else {
            const h = valTop.get(sleutel);
            if (h !== undefined) {
                valTop.delete(sleutel);
                if (soortActief("val") && (h - p.location.y) >= 15) zetAf("val");
            }
        }
    }

    // Hoeveel is de verste speler gerold?
    let meest = 0;
    for (const p of spelers) {
        const vorige = laatstePos.get(p.id);
        const nu = p.location;
        laatstePos.set(p.id, { x: nu.x, y: nu.y, z: nu.z, dim: p.dimension.id });
        if (vorige && vorige.dim === p.dimension.id) {
            const dx = nu.x - vorige.x;
            const dz = nu.z - vorige.z;
            const d = Math.sqrt(dx * dx + dz * dz);
            if (d < 30 && d > meest) meest = d;
        }
    }
    if (meest > 0.05 && soortActief("afstand")) geefVoort("afstand", meest);

    for (const soort of ["water", "lava"]) {
        if (!soortActief(soort)) continue;
        for (const p of spelers) {
            let b = undefined;
            try {
                b = p.dimension.getBlock({
                    x: Math.floor(p.location.x),
                    y: Math.floor(p.location.y),
                    z: Math.floor(p.location.z)
                });
            } catch (e) { /* blok niet geladen */ }
            if (b && b.typeId.indexOf(soort) >= 0) {
                geefVoort(soort, 1);
                break;
            }
        }
    }

    if (soortActief("hoog")) {
        for (const p of spelers) {
            if (p.location.y >= 100) {
                zetAf("hoog");
                break;
            }
        }
    }

    if (soortActief("diep")) {
        for (const p of spelers) {
            if (p.location.y <= -15) {
                zetAf("diep");
                break;
            }
        }
    }

    if (soortActief("verstop")) {
        let veilig = spelers.length > 0;
        for (const p of spelers) {
            for (const m of mijners) {
                if (m.dimension.id !== p.dimension.id) continue;
                if (afstand(p.location, m.location) < 25) veilig = false;
            }
        }
        if (veilig) geefVoort("verstop", 1);
        else nulVoort("verstop");
    }
}

function toonBalk(spelers, mijners) {
    const g = nivo();
    let tekst = "§8Level §e" + level + "/" + MAX_LEVEL + " §8" + g.naam;
    if (eindfase) {
        tekst = tekst + " §8| §cSLOOP DE MIJNWERKERS: §e" + mijners.length + " §cover";
    } else if (groeiKlaar) {
        tekst = tekst + " §8| §aKLAAR! tik met je upgrade-knop en GROEI";
    } else {
        const q = groeiOpdracht();
        if (q) {
            tekst = tekst + " §8| §aGroei: §f" + q.naam;
            if (q.teller !== false) {
                tekst = tekst + " §7[" + weergave(q, groeiVoort) + "/" + weergave(q, q.doel) + "]";
            }
        }
    }
    const a = aanvalOpdracht();
    if (a) {
        tekst = tekst + " §8| §cAanval: §f" + a.naam +
            " §7[" + weergave(a, aanvalVoort) + "/" + weergave(a, a.doel) + "]";
    }
    for (const p of spelers) {
        try { p.onScreenDisplay.setActionBar(tekst); } catch (e) { /* niet erg */ }
    }
}

// ============================================================
//  HET UPGRADE-MENU: echte knoppen om op te drukken
// ============================================================
// Soms is je scherm nog bezig (je houdt je vinger nog op het item). Dan
// proberen we het gewoon nog een paar keer.
function toon(form, p, klaar, poging) {
    const nr = poging ? poging : 0;
    form.show(p).then((antwoord) => {
        if (antwoord.canceled) {
            if (antwoord.cancelationReason === "UserBusy" && nr < 10) {
                system.runTimeout(() => { toon(form, p, klaar, nr + 1); }, 10);
            }
            return;
        }
        klaar(antwoord.selection);
    }).catch(() => { /* het menu lukte niet */ });
}

function menuHoofd(p) {
    if (!actief) {
        const start = new ActionFormData()
            .title("Je Bent Een Steen")
            .body("§7Het spel loopt niet.\n\n§7Begin je? Dan komen Bert, Klaas en Dirk op " +
                SPAWN_AFSTAND + " blokken van je af uit de mijn.")
            .button("§aSTART HET SPEL\n§7jij bent de steen")
            .button("§8Laat maar");
        toon(start, p, (keuze) => {
            if (keuze === 0) startSpel();
        });
        return;
    }
    const g = nivo();
    const body = "§7Jij bent §elevel " + level + " van " + MAX_LEVEL + "§7: een " + g.naam + ".\n" +
        "§7Jouw klap doet §e+" + klapSchade() + " §7schade.\n" +
        "§7Aanval-upgrades: §e" + ontgrendeld.length + " van " + AANVALLEN.length + "\n" +
        "§7Mijnwerkers in de wereld: §e" + alleMijnwerkers().length + "\n\n" +
        "§7Waar wil je aan werken?";
    const form = new ActionFormData()
        .title("Upgrades")
        .body(body)
        .button("§cAANVAL\n§7harder slaan")
        .button("§aGROEIEN\n§7nu level " + level + " van " + MAX_LEVEL)
        .button("§7Uitleg en regels")
        .button("§8Stop het spel");
    toon(form, p, (keuze) => {
        if (keuze === 0) menuAanval(p);
        else if (keuze === 1) menuGroei(p);
        else if (keuze === 2) toonInfo();
        else if (keuze === 3) stopSpel(true);
    });
}

function menuGroei(p) {
    const g = nivo();
    const knoppen = [];
    let body;

    if (eindfase || level >= MAX_LEVEL) {
        body = "§7Je bent §elevel " + MAX_LEVEL + ": een BERG§7. Hoger kan niet!\n\n" +
            "§cLaatste missie:§7 sloop alle drie de mijnwerkers. Er lopen er nog §e" +
            alleMijnwerkers().length + "§7.";
        knoppen.push({ doe: "terug", tekst: "§8Terug" });
    } else if (groeiKlaar) {
        const volgende = LEVELS[level];
        body = "§aJe groei-opdracht is klaar!\n\n" +
            "§7Druk op de knop en je wordt §elevel " + (level + 1) + ": " + volgende.naam + "§7.\n" +
            "§7Dat geeft je §e" + volgende.boost + " extra hartjes§7 en een klap van §e+" + volgende.klap + "§7.";
        knoppen.push({ doe: "groei", tekst: "§a§lGROEI NU!\n§7word level " + (level + 1) + ": " + volgende.naam });
        knoppen.push({ doe: "terug", tekst: "§8Terug" });
    } else {
        const q = groeiOpdracht();
        const volgende = LEVELS[level];
        body = "§7Jij bent §elevel " + level + "§7: een " + g.naam + ".\n" +
            "§7Volgend level: §e" + volgende.naam + "§7 (+" + volgende.boost +
            " hartjes, klap +" + volgende.klap + ").\n\n" +
            "§7Om te groeien moet je eerst deze opdracht doen:";
        if (q) {
            let regel = "§e" + q.naam;
            if (q.teller !== false) {
                regel = regel + "\n§7" + weergave(q, groeiVoort) + " van " + weergave(q, q.doel) + " gedaan";
            } else {
                regel = regel + "\n§7tik voor de uitleg";
            }
            knoppen.push({ doe: "uitleg", tekst: regel });
            knoppen.push({ doe: "andere", tekst: "§7Te moeilijk?\n§8geef me een andere opdracht" });
        } else {
            knoppen.push({ doe: "andere", tekst: "§eGeef me een groei-opdracht" });
        }
        knoppen.push({ doe: "terug", tekst: "§8Terug" });
    }

    const form = new ActionFormData().title("Groeien").body(body);
    for (const k of knoppen) form.button(k.tekst);
    toon(form, p, (keuze) => {
        const k = knoppen[keuze];
        if (!k) return;
        if (k.doe === "groei") groeiNu();
        else if (k.doe === "uitleg") {
            const q = groeiOpdracht();
            if (q) {
                world.sendMessage("§6[Steen]§r Groei-opdracht: §a" + q.naam);
                world.sendMessage("§7" + q.uitleg);
            }
        } else if (k.doe === "andere") {
            const q = groeiOpdracht();
            if (q && gedaan.indexOf(q.id) < 0) gedaan.push(q.id);
            world.sendMessage("§6[Steen]§r Oke, die slaan we over.");
            nieuweGroeiOpdracht(true);
        } else if (k.doe === "terug") menuHoofd(p);
    });
}

function menuAanval(p) {
    const knoppen = [];
    const body = "§7Elke aanval-upgrade moet je unlocken: tik erop en doe de opdracht die erbij hoort.\n" +
        "§7Je klap doet nu §e+" + klapSchade() + " §7schade.\n\n" +
        "§a[KLAAR]§7 = al van jou  §e[BEZIG]§7 = je werkt eraan  §8[SLOT]§7 = nog niet";
    for (const a of AANVALLEN) {
        const min = a.minLevel ? a.minLevel : 0;
        if (heeft(a.id)) {
            knoppen.push({ id: a.id, tekst: "§a[KLAAR] " + a.naam + "\n§7" + a.uitleg });
        } else if (aanvalId === a.id) {
            knoppen.push({
                id: a.id,
                tekst: "§e[BEZIG] " + a.naam + " (" + weergave(a, aanvalVoort) + "/" +
                    weergave(a, a.doel) + ")\n§7" + a.eis
            });
        } else if (level < min) {
            knoppen.push({ id: a.id, tekst: "§8[SLOT] " + a.naam + "\n§8kan pas vanaf level " + min });
        } else {
            knoppen.push({ id: a.id, tekst: "§7[SLOT] " + a.naam + "\n§8" + a.eis });
        }
    }
    knoppen.push({ id: "terug", tekst: "§8Terug" });

    const form = new ActionFormData().title("Aanval-upgrades").body(body);
    for (const k of knoppen) form.button(k.tekst);
    toon(form, p, (keuze) => {
        const k = knoppen[keuze];
        if (!k) return;
        if (k.id === "terug") {
            menuHoofd(p);
            return;
        }
        const a = aanvalOp(k.id);
        if (!a) return;
        if (heeft(a.id)) {
            world.sendMessage("§a[Steen]§r " + a.naam + " heb je al: " + a.uitleg + ".");
            return;
        }
        const min = a.minLevel ? a.minLevel : 0;
        if (level < min) {
            world.sendMessage("§c[Steen]§r " + a.naam + " kan pas vanaf level " + min + ". Groei eerst!");
            return;
        }
        if (aanvalId === a.id) {
            world.sendMessage("§e[Steen]§r Je werkt al aan " + a.naam + ": §a" + a.eis +
                " §7(" + weergave(a, aanvalVoort) + "/" + weergave(a, a.doel) + ")");
            return;
        }
        kiesAanval(a);
    });
}

// ============================================================
//  SPEL STARTEN, STOPPEN, WINNEN EN KRIMPEN
// ============================================================
function startSpel() {
    actief = true;
    uitgezet = false;
    level = 1;
    gedaan = [];
    groeiVoort = 0;
    groeiKlaar = false;
    aanvalId = "";
    aanvalVoort = 0;
    ontgrendeld = [];
    eindfase = false;
    laatsteKans = false;
    laatstePos.clear();
    valTop.clear();

    for (const m of alleMijnwerkers()) {
        try { m.remove(); } catch (e) { /* niet erg */ }
    }

    world.sendMessage("§6=== JE BENT EEN STEEN ===");
    world.sendMessage("§7Jij bent een steen. Drie mijnwerkers willen je §ckapot minen§7!");
    world.sendMessage("§7Je begint op §elevel 1§7 en je kunt tot §elevel " + MAX_LEVEL + "§7 groeien.");
    world.sendMessage("§7In je rugzak zit de §eUpgrade-knop§7. Tik ermee en je krijgt een menu");
    world.sendMessage("§7met een §cAANVAL§7-knop en een §aGROEI§7-knop. Voor allebei moet je iets doen.");
    world.sendMessage("§7Vallen, vuur, lava en verdrinken doen je niets. Je bent van steen.");
    world.sendMessage("§7Word een §eBERG§7 en sloop daarna alle drie de mijnwerkers: dan heb JIJ gewonnen.");

    const spelers = world.getAllPlayers();
    let gelukt = 0;
    for (let i = 0; i < AANTAL_MIJNWERKERS; i++) {
        if (spelers.length === 0) break;
        if (spawnMijnwerker(spelers[i % spelers.length], VOORNAMEN[i], false)) gelukt++;
    }
    if (spelers.length > 0) {
        if (gelukt === AANTAL_MIJNWERKERS) {
            world.sendMessage("§8[Mijn]§r Bert, Klaas en Dirk staan op §e" + SPAWN_AFSTAND +
                " blokken§r van je af. RENNEN!");
        } else {
            world.sendMessage("§c[Steen]§r Er verschenen maar " + gelukt + " van de " +
                AANTAL_MIJNWERKERS + " mijnwerkers.");
            if (laatsteSpawnFout.length > 0) {
                world.sendMessage("§8Laatste foutmelding: " + laatsteSpawnFout);
            }
            world.sendMessage("§7Doe §e/function steen_test§7 en stuur me wat daar staat.");
        }
    }
    for (const p of spelers) {
        geefPerks(p, nivo());
        zetPak(p, nivo().pak);
        zorgVoorKnop(p);
        try { p.playSound("random.anvil_land"); } catch (e) { /* niet erg */ }
    }
    nieuweGroeiOpdracht(true);
    opslaan();
}

function stopSpel(zegIets) {
    actief = false;
    uitgezet = true;
    eindfase = false;
    for (const m of alleMijnwerkers()) {
        try { m.remove(); } catch (e) { /* niet erg */ }
    }
    for (const p of world.getAllPlayers()) {
        haalPakWeg(p);
        try { p.runCommand("effect @s clear"); } catch (e) { /* niet erg */ }
    }
    if (zegIets) {
        world.sendMessage("§6[Steen]§r Gestopt. De mijnwerkers zijn weg. Weer beginnen: §e/function steen");
    }
    opslaan();
}

function winnen() {
    world.sendMessage("§6=========================================");
    world.sendMessage("§6[Steen]§r Alle mijnwerkers zijn verslagen!");
    world.sendMessage("§e JIJ BENT EEN BERG EN JIJ HEBT GEWONNEN!");
    world.sendMessage("§6=========================================");
    for (const p of world.getAllPlayers()) {
        try {
            p.onScreenDisplay.setTitle("§6JE HEBT GEWONNEN!", {
                subtitle: "§eeen berg verslaat elke mijnwerker",
                fadeInDuration: 5,
                stayDuration: 60,
                fadeOutDuration: 20
            });
            p.playSound("random.levelup");
            p.dimension.runCommand(
                "particle minecraft:huge_explosion_emitter " +
                p.location.x.toFixed(1) + " " + (p.location.y + 3).toFixed(1) + " " + p.location.z.toFixed(1)
            );
        } catch (e) { /* niet erg */ }
    }
    stopSpel(false);
}

// Na een dreun worden de mijnwerkers op de plek waar je weer wakker wordt
// neergezet: net als bij de start op precies SPAWN_AFSTAND blokken van je af.
function zetMijnwerkersOpAfstand() {
    system.runTimeout(() => {
        const spelers = world.getAllPlayers();
        if (spelers.length === 0) return;
        for (const m of alleMijnwerkers()) {
            const p = spelers[Math.floor(Math.random() * spelers.length)];
            try { m.teleport(plekRondom(p, SPAWN_AFSTAND, 1)); } catch (e) { /* niet erg */ }
        }
    }, 60);
}

function krimp(naam) {
    if (level <= 1) {
        if (!laatsteKans) {
            laatsteKans = true;
            world.sendMessage("§c[Steen]§r " + naam + " is bijna vergruizeld! Dit was je §claatste kans§r.");
            world.sendMessage("§7De mijnwerkers schrikken ervan en gaan op afstand staan. RENNEN!");
            zetMijnwerkersOpAfstand();
            opslaan();
            return;
        }
        world.sendMessage("§c[Steen]§r " + naam + " is helemaal vergruizeld...");
        world.sendMessage("§c DE MIJNWERKERS HEBBEN GEWONNEN. §7Nog een keer? §e/function steen");
        stopSpel(false);
        return;
    }
    level = level - 1;
    eindfase = false;
    groeiKlaar = false;
    world.sendMessage("§c[Steen]§r " + naam + " is kapot geslagen! Er breekt een stuk van je af.");
    world.sendMessage("§7Je zakt naar §elevel " + level + ": " + nivo().naam + "§7. Doorgaan maar!");
    world.sendMessage("§7Je aanval-upgrades blijven gewoon van jou.");
    zetMijnwerkersOpAfstand();
    nieuweGroeiOpdracht(true);
    opslaan();
}

// ============================================================
//  COMMANDOS
//  Een mcfunction kan geen script aanroepen, dus zet hij een
//  scorebord-getal en wij kijken elke halve seconde of er iets
//  klaarstaat.
// ============================================================
const OBJECTIVE = "steencmd";

function scorebord() {
    let obj = world.scoreboard.getObjective(OBJECTIVE);
    if (!obj) {
        try {
            obj = world.scoreboard.addObjective(OBJECTIVE, "Je Bent Een Steen");
        } catch (e) {
            return undefined;
        }
    }
    return obj;
}

function gevraagd(obj, naam) {
    let score;
    try {
        score = obj.getScore(naam);
    } catch (e) {
        return false;
    }
    if (score === 1) {
        try { obj.setScore(naam, 0); } catch (e) { /* niet erg */ }
        return true;
    }
    return false;
}

function toonInfo() {
    world.sendMessage("§6=== JE BENT EEN STEEN ===");
    if (!actief) {
        world.sendMessage("§7Het spel loopt niet. Starten: §e/function steen");
        return;
    }
    const g = nivo();
    world.sendMessage("§7Jouw level: §e" + level + " van " + MAX_LEVEL + " §7(" + g.naam + ")");
    world.sendMessage("§7Jouw klap: §e+" + klapSchade() + " §7schade. Mijnwerkers: §e" + alleMijnwerkers().length);
    world.sendMessage("§7Aanval-upgrades: §e" + ontgrendeld.length + " van " + AANVALLEN.length);
    if (eindfase) {
        world.sendMessage("§cLaatste missie:§r sloop alle drie de mijnwerkers!");
    } else if (groeiKlaar) {
        world.sendMessage("§aJe mag GROEIEN!§r Tik met je upgrade-knop en kies Groeien.");
    } else {
        const q = groeiOpdracht();
        if (q) {
            let regel = "§7Groei-opdracht: §a" + q.naam;
            if (q.teller !== false) regel = regel + " §7[" + weergave(q, groeiVoort) + "/" + weergave(q, q.doel) + "]";
            world.sendMessage(regel);
            world.sendMessage("§7" + q.uitleg);
        }
    }
    const a = aanvalOpdracht();
    if (a) {
        world.sendMessage("§7Aanval-opdracht: §c" + a.naam + " §7- " + a.eis +
            " [" + weergave(a, aanvalVoort) + "/" + weergave(a, a.doel) + "]");
    }
    world.sendMessage("§7Alles zit in de §eUpgrade-knop§7 in je rugzak. Tik ermee!");
}

// Doet er iets niet? Dit vertelt precies wat er aan de hand is.
function toonTest() {
    world.sendMessage("§6=== STEEN-TEST ===");
    world.sendMessage("§aHet script loopt§7 (versie " + VERSIE + ").");
    world.sendMessage("§7Spel: " + (actief ? "§aaan" : "§cuit") + "§7, level §e" + level + "§7.");

    const spelers = world.getAllPlayers();
    let eigen = "§cniet getest (geen speler)";
    if (spelers.length > 0) {
        try {
            const proef = spelers[0].dimension.spawnEntity(MIJNWERKER, {
                x: spelers[0].location.x,
                y: spelers[0].location.y + 1,
                z: spelers[0].location.z
            });
            proef.remove();
            eigen = "§aok";
        } catch (e) {
            eigen = "§cFOUT: " + String(e);
        }
    }
    world.sendMessage("§7Mijnwerker " + MIJNWERKER + ": " + eigen);

    for (const id of [KNOP, "steen:pak_klein"]) {
        let uit = "§aok";
        try {
            new ItemStack(id, 1);
        } catch (e) {
            uit = "§cFOUT: " + String(e);
        }
        world.sendMessage("§7Item " + id + ": " + uit);
    }

    const mijners = alleMijnwerkers();
    world.sendMessage("§7Mijnwerkers nu in de wereld: §e" + mijners.length);
    for (const m of mijners) {
        let regel = "§8- " + (m.nameTag ? m.nameTag : m.typeId) + " (" + m.typeId + ")";
        if (spelers.length > 0 && spelers[0].dimension.id === m.dimension.id) {
            regel = regel + " op §e" + afstand(spelers[0].location, m.location).toFixed(1) + " §8blokken";
        }
        world.sendMessage(regel);
    }
    if (mijners.length > 0) {
        world.sendMessage("§7Staan ze er wel maar zie je ze niet? Dan mist het §etexturenpakket§7.");
    }
    if (laatsteSpawnFout.length > 0) {
        world.sendMessage("§8Laatste spawn-fout: " + laatsteSpawnFout);
    }
}

function verwerkCommandos(obj) {
    if (gevraagd(obj, "start")) startSpel();
    if (gevraagd(obj, "stop")) stopSpel(true);
    if (gevraagd(obj, "info")) toonInfo();
    if (gevraagd(obj, "test")) toonTest();
    if (gevraagd(obj, "menu")) {
        const spelers = world.getAllPlayers();
        for (const p of spelers) zorgVoorKnop(p);
        if (spelers.length > 0) menuHoofd(spelers[0]);
    }
    if (gevraagd(obj, "groter")) {
        if (!actief) world.sendMessage("§6[Steen]§r Start eerst met §e/function steen");
        else if (level >= MAX_LEVEL) world.sendMessage("§6[Steen]§r Je bent al een BERG! Sloop de mijnwerkers.");
        else {
            groeiKlaar = true;
            groeiNu();
        }
    }
    if (gevraagd(obj, "overslaan")) {
        if (!actief) world.sendMessage("§6[Steen]§r Start eerst met §e/function steen");
        else if (eindfase) world.sendMessage("§6[Steen]§r Er zijn geen opdrachten meer: sloop de mijnwerkers!");
        else {
            const q = groeiOpdracht();
            if (q && gedaan.indexOf(q.id) < 0) gedaan.push(q.id);
            world.sendMessage("§6[Steen]§r Oke, die slaan we over.");
            nieuweGroeiOpdracht(true);
        }
    }
}

// ============================================================
//  DE MOTOR: twee keer per seconde
// ============================================================
system.runInterval(() => {
    if (!geladen) {
        laad();
        geladen = true;
    }
    const obj = scorebord();
    if (obj) verwerkCommandos(obj);
    if (!actief) return;

    const spelers = world.getAllPlayers();
    if (spelers.length === 0) return;

    perksTeller++;
    if (perksTeller >= 10) {
        perksTeller = 0;
        const g = nivo();
        for (const p of spelers) {
            geefPerks(p, g);
            zetPak(p, g.pak);
            zorgVoorKnop(p);
        }
    }

    const mijners = alleMijnwerkers();
    zorgVoorAantal(mijners, spelers);
    for (const m of mijners) stuurMijnwerker(m, spelers);

    tauntTeller++;
    if (tauntTeller >= 30) {
        tauntTeller = 0;
        taunt(mijners);
    }

    checkTaken(spelers, mijners);
    toonBalk(spelers, mijners);

    opslaanTeller++;
    if (opslaanTeller >= 20) {
        opslaanTeller = 0;
        opslaan();
    }
}, 10);

// ============================================================
//  WAT GEBEURT ER IN DE WERELD?
// ============================================================

// Een steen voelt geen val, vuur, lava of water: die schade genezen we terug.
// De mijnwerkers hebben er ook geen last van, anders vallen ze onderweg dood.
world.afterEvents.entityHurt.subscribe((ev) => {
    if (!actief) return;
    const e = ev.hurtEntity;
    if (!e) return;
    if (e.typeId !== "minecraft:player" && !isMijnwerker(e)) return;
    const oorzaak = ev.damageSource ? ev.damageSource.cause : "";
    if (STEEN_IMMUUN.indexOf(oorzaak) < 0) return;
    try {
        const hp = e.getComponent("minecraft:health");
        if (hp) {
            const nieuw = hp.currentValue + ev.damage;
            hp.setCurrentValue(nieuw > hp.effectiveMax ? hp.effectiveMax : nieuw);
        }
    } catch (err) { /* niet erg */ }
});

function aardbeving(bron, doel) {
    const schade = Math.floor(klapSchade() / 2) + 2;
    try {
        doel.dimension.runCommand(
            "particle minecraft:knockback_roar_particle " +
            doel.location.x.toFixed(1) + " " + doel.location.y.toFixed(1) + " " + doel.location.z.toFixed(1)
        );
    } catch (e) { /* niet erg */ }
    for (const m of alleMijnwerkers()) {
        if (m.id === doel.id) continue;
        if (m.dimension.id !== doel.dimension.id) continue;
        if (afstand(m.location, doel.location) > 12) continue;
        try { m.applyDamage(schade, { cause: "entityAttack", damagingEntity: bron }); } catch (e) { /* niet erg */ }
    }
    world.sendMessage("§6[Steen]§r AARDBEVING! Alle mijnwerkers dichtbij krijgen " + schade + " schade.");
}

// Sla jij een mijnwerker? Dan komen je level en je upgrades er bovenop.
world.afterEvents.entityHitEntity.subscribe((ev) => {
    if (!actief) return;
    const bron = ev.damagingEntity;
    const doel = ev.hitEntity;
    if (!bron || !doel) return;
    if (bron.typeId !== "minecraft:player" || !isMijnwerker(doel)) return;

    let schade = klapSchade();
    let donder = false;
    if (heeft("donder") && Math.random() < 0.25) {
        donder = true;
        schade = schade + 10;
    }
    try {
        doel.applyDamage(schade, { cause: "entityAttack", damagingEntity: bron });
    } catch (e) { /* niet erg */ }

    try {
        if (heeft("vuur")) {
            doel.dimension.runCommand(
                "particle minecraft:basic_flame_particle " +
                doel.location.x.toFixed(1) + " " + (doel.location.y + 1).toFixed(1) + " " + doel.location.z.toFixed(1)
            );
        }
        if (heeft("traag")) doel.addEffect("slowness", 100, { amplifier: 2 });
        if (heeft("stoot")) {
            let dx = doel.location.x - bron.location.x;
            let dz = doel.location.z - bron.location.z;
            const len = Math.sqrt(dx * dx + dz * dz);
            if (len > 0.01) {
                dx = (dx / len) * 2.5;
                dz = (dz / len) * 2.5;
                doel.applyKnockback({ x: dx, z: dz }, 0.5);
            }
        }
        if (donder) {
            doel.dimension.runCommand(
                "particle minecraft:large_explosion " +
                doel.location.x.toFixed(1) + " " + (doel.location.y + 1).toFixed(1) + " " + doel.location.z.toFixed(1)
            );
            bron.playSound("ambient.weather.thunder");
        }
    } catch (e) { /* niet erg */ }

    if (heeft("beving")) {
        klapTeller++;
        if (klapTeller >= 4) {
            klapTeller = 0;
            aardbeving(bron, doel);
        }
    }

    if (soortActief("slaan")) geefVoort("slaan", 1);
});

world.afterEvents.entityDie.subscribe((ev) => {
    const dood = ev.deadEntity;
    if (!dood || !actief) return;

    if (isMijnwerker(dood)) {
        const naam = dood.nameTag ? dood.nameTag : "Een mijnwerker";
        world.sendMessage("§a[Steen]§r " + naam + " is verslagen!");
        if (soortActief("versla")) geefVoort("versla", 1);
        if (eindfase) {
            system.runTimeout(() => {
                if (actief && eindfase && alleMijnwerkers().length === 0) winnen();
            }, 20);
        }
        return;
    }

    if (dood.typeId === "minecraft:player") {
        const naam = dood.nameTag ? dood.nameTag : "De steen";
        krimp(naam);
    }
});

world.afterEvents.playerBreakBlock.subscribe((ev) => {
    if (!actief) return;
    let id = "";
    try { id = ev.brokenBlockPermutation.type.id; } catch (e) { return; }
    if (soortActief("steen") && lijstMatch(id, STEEN_BLOKKEN)) geefVoort("steen", 1);
    if (soortActief("hout") && lijstMatch(id, HOUT_BLOKKEN)) geefVoort("hout", 1);
});

// Tik met de upgrade-knop en het menu gaat open.
world.afterEvents.itemUse.subscribe((ev) => {
    const p = ev.source;
    if (!p || p.typeId !== "minecraft:player") return;
    if (!ev.itemStack || ev.itemStack.typeId !== KNOP) return;
    system.run(() => { menuHoofd(p); });
});

// Eten dat je helemaal opeet telt voor de eet-opdracht.
world.afterEvents.itemCompleteUse.subscribe((ev) => {
    if (!actief) return;
    if (!ev.source || ev.source.typeId !== "minecraft:player") return;
    if (ev.itemStack && ev.itemStack.typeId === KNOP) return;
    if (soortActief("eten")) geefVoort("eten", 1);
});

// Na doodgaan of inloggen: je schil, je krachten en je knop weer terug.
// Kom je voor het eerst binnen en is het spel nooit gestopt? Dan start het
// spel gewoon zelf, zodat je niets hoeft te typen.
world.afterEvents.playerSpawn.subscribe((ev) => {
    const p = ev.player;
    if (!geladen) {
        laad();
        geladen = true;
    }
    if (!actief && !uitgezet) {
        system.runTimeout(() => {
            if (!actief && !uitgezet) startSpel();
        }, 60);
        return;
    }
    if (!actief) return;
    system.runTimeout(() => {
        if (!actief) return;
        try {
            geefPerks(p, nivo());
            zetPak(p, nivo().pak);
            zorgVoorKnop(p);
        } catch (e) { /* niet erg */ }
    }, 20);
});
