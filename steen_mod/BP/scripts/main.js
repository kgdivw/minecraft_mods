import { world, system, ItemStack } from "@minecraft/server";

// ============================================================
//  JE BENT EEN STEEN
//
//  Jij bent een steen. Drie mijnwerkers (Bert, Klaas en Dirk)
//  komen uit de mijn omhoog om je KAPOT TE MINEN. Ze rennen
//  achter je aan, graven door muren heen en slaan met hun
//  pikhouweel op je.
//
//  Jij verdedigt je door OPDRACHTEN te doen. Elke opdracht die
//  je haalt maakt je een stukje groter: meer leven, een dikkere
//  stenen schil en veel hardere klappen. Van Kiezelsteen tot
//  BERG.
//
//  Ben je een BERG? Dan is het jouw beurt: sloop alle drie de
//  mijnwerkers en jij hebt gewonnen. Ga je dood, dan breekt er
//  een stuk van je af en word je weer kleiner.
//
//  Starten: /function steen
// ============================================================

const MIJNWERKER = "steen:mijnwerker";
const VOORNAMEN = ["Bert", "Klaas", "Dirk"];
const AANTAL_MIJNWERKERS = 3;
const MAX_PUNTEN = 8;
const DIMENSIES = ["overworld", "nether", "the_end"];

// ============================================================
//  HOE GROOT KAN EEN STEEN WORDEN?
//  boost  = extra hartjes (health_boost, 1 = 2 hartjes)
//  resist = hoeveel schade je wegslikt (-1 = niks)
//  klap   = extra schade als JIJ een mijnwerker slaat
//  pak    = welke stenen schil je draagt
// ============================================================
const GROOTTES = [
    { naam: "Kiezelsteen", boost: 0, resist: -1, klap: 1, pak: "steen:pak_klein" },
    { naam: "Steen", boost: 2, resist: -1, klap: 4, pak: "steen:pak_klein" },
    { naam: "Rots", boost: 5, resist: 0, klap: 9, pak: "steen:pak_groot" },
    { naam: "Keisteen", boost: 9, resist: 1, klap: 16, pak: "steen:pak_groot" },
    { naam: "BERG", boost: 14, resist: 2, klap: 25, pak: "steen:pak_mega" }
];

// Hoe groter jij wordt, hoe beter hun pikhouweel.
const PIKHOUWELEN = [
    "minecraft:wooden_pickaxe",
    "minecraft:stone_pickaxe",
    "minecraft:iron_pickaxe",
    "minecraft:golden_pickaxe",
    "minecraft:diamond_pickaxe"
];

// ============================================================
//  DE OPDRACHTEN
//  tijd:true    -> voortgang is in halve seconden
//  teller:false -> geen (3/10) in de actiebalk
//  minNiveau    -> pas vanaf deze grootte
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
        uitleg: "Beuken! Hoe groter je bent, hoe harder het aankomt."
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
        id: "versla", soort: "versla", doel: 1, minNiveau: 2,
        naam: "Versla 1 mijnwerker",
        uitleg: "Je bent nu groot genoeg om er een te slopen. Er komt wel een nieuwe uit de mijn..."
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
let punten = 0;
let opdrachtId = "";
let voortgang = 0;
let gedaan = [];
let eindfase = false;
let laatsteKans = false;

let geladen = false;
let perksTeller = 0;
let tauntTeller = 0;
let respawnWacht = 0;
let opslaanTeller = 0;
const laatstePos = new Map();
const valTop = new Map();

function niveau() {
    const n = Math.floor(punten / 2);
    return n > 4 ? 4 : n;
}

function grootte() {
    return GROOTTES[niveau()];
}

function huidigeOpdracht() {
    for (const q of OPDRACHTEN) {
        if (q.id === opdrachtId) return q;
    }
    return undefined;
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
        world.setDynamicProperty("steen_punten", punten);
        world.setDynamicProperty("steen_opdracht", opdrachtId);
        world.setDynamicProperty("steen_voort", voortgang);
        world.setDynamicProperty("steen_gedaan", gedaan.join(","));
        world.setDynamicProperty("steen_eind", eindfase);
        world.setDynamicProperty("steen_kans", laatsteKans);
    } catch (e) { /* niet erg */ }
}

function laad() {
    try {
        actief = world.getDynamicProperty("steen_actief") === true;
        const pu = world.getDynamicProperty("steen_punten");
        punten = typeof pu === "number" ? pu : 0;
        const op = world.getDynamicProperty("steen_opdracht");
        opdrachtId = typeof op === "string" ? op : "";
        const vo = world.getDynamicProperty("steen_voort");
        voortgang = typeof vo === "number" ? vo : 0;
        const ge = world.getDynamicProperty("steen_gedaan");
        gedaan = (typeof ge === "string" && ge.length > 0) ? ge.split(",") : [];
        eindfase = world.getDynamicProperty("steen_eind") === true;
        laatsteKans = world.getDynamicProperty("steen_kans") === true;
    } catch (e) { /* niet erg */ }
}

// ============================================================
//  DE STEEN: schil, krachten en hartjes
// ============================================================
function geefPerks(p, g) {
    try {
        p.addEffect("fire_resistance", 400, { showParticles: false });
        if (g.boost > 0) p.addEffect("health_boost", 400, { amplifier: g.boost, showParticles: false });
        // Alleen als je op de grond staat, anders zou dit de val-bescherming
        // hieronder (resistance 4) overschrijven terwijl je naar beneden valt.
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

function maakHeel(p) {
    try {
        const hp = p.getComponent("minecraft:health");
        if (hp) hp.setCurrentValue(hp.effectiveMax);
    } catch (e) { /* niet erg */ }
}

// ============================================================
//  DE MIJNWERKERS
// ============================================================
function alleMijnwerkers() {
    const lijst = [];
    for (const d of DIMENSIES) {
        try {
            for (const e of world.getDimension(d).getEntities({ type: MIJNWERKER })) lijst.push(e);
        } catch (e) { /* dimensie nog niet geladen */ }
    }
    return lijst;
}

function veiligePlek(p, minR, maxR) {
    const hoek = Math.random() * Math.PI * 2;
    const r = minR + Math.random() * (maxR - minR);
    return {
        x: p.location.x + Math.cos(hoek) * r,
        y: p.location.y + 1,
        z: p.location.z + Math.sin(hoek) * r
    };
}

function spawnMijnwerker(speler, naam, melden) {
    for (let poging = 0; poging < 8; poging++) {
        try {
            const m = speler.dimension.spawnEntity(MIJNWERKER, veiligePlek(speler, 8, 14));
            m.nameTag = naam + " de Mijnwerker";
            if (melden) {
                world.sendMessage("§8[Mijn]§r " + naam + " klimt uit de mijn omhoog... en hij ziet je!");
            }
            return m;
        } catch (e) { /* zat in een blok, nog een keer proberen */ }
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

    const nv = niveau();
    try {
        m.addEffect("fire_resistance", 400, { showParticles: false });
        if (nv >= 1) m.addEffect("speed", 400, { amplifier: nv > 2 ? 2 : nv, showParticles: false });
        if (nv >= 3) m.addEffect("strength", 400, { amplifier: 0, showParticles: false });
    } catch (e) { /* niet erg */ }

    try {
        const eq = m.getComponent("minecraft:equippable");
        if (eq) {
            const wil = PIKHOUWELEN[nv > 4 ? 4 : nv];
            const nu = eq.getEquipment("Mainhand");
            if (!nu || nu.typeId !== wil) eq.setEquipment("Mainhand", new ItemStack(wil, 1));
        }
    } catch (e) { /* niet erg */ }

    if (best > 80) {
        try { m.teleport(veiligePlek(doelwit, 8, 14)); } catch (e) { /* niet erg */ }
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
//  OPDRACHTEN: nieuwe geven, voortgang bijhouden, afronden
// ============================================================
function nieuweOpdracht() {
    const nv = niveau();
    let keuze = [];
    for (const q of OPDRACHTEN) {
        const min = q.minNiveau ? q.minNiveau : 0;
        if (min <= nv && gedaan.indexOf(q.id) < 0) keuze.push(q);
    }
    if (keuze.length === 0) {
        gedaan = [];
        for (const q of OPDRACHTEN) {
            const min = q.minNiveau ? q.minNiveau : 0;
            if (min <= nv) keuze.push(q);
        }
    }
    const q = keuze[Math.floor(Math.random() * keuze.length)];
    opdrachtId = q.id;
    voortgang = 0;
    world.sendMessage("§6[Steen]§r Nieuwe opdracht: §a" + q.naam);
    world.sendMessage("§7" + q.uitleg);
    for (const p of world.getAllPlayers()) {
        try { p.playSound("random.orb"); } catch (e) { /* niet erg */ }
    }
    opslaan();
}

function groeiFeest(nv) {
    const g = GROOTTES[nv];
    world.sendMessage("§6[Steen]§r Je GROEIT! Je bent nu een §e" + g.naam + "§r.");
    for (const p of world.getAllPlayers()) {
        try {
            p.onScreenDisplay.setTitle("§e" + g.naam + "!", {
                subtitle: "§7je bent gegroeid",
                fadeInDuration: 5,
                stayDuration: 30,
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

function klaarMetOpdracht() {
    const q = huidigeOpdracht();
    if (q && gedaan.indexOf(q.id) < 0) gedaan.push(q.id);
    const oud = niveau();
    punten++;
    laatsteKans = false;
    voortgang = 0;
    opdrachtId = "";
    world.sendMessage("§a[Steen]§r Opdracht gehaald! §e+1 groei §7(" + punten + "/" + MAX_PUNTEN + ")");
    const nu = niveau();
    if (nu !== oud) groeiFeest(nu);
    if (punten >= MAX_PUNTEN) {
        eindfase = true;
        world.sendMessage("§6[Steen]§r Je bent een §eBERG§r! Geen opdrachten meer.");
        world.sendMessage("§c[Steen]§r Nu is het JOUW beurt: sloop alle drie de mijnwerkers en je wint!");
        opslaan();
    } else {
        nieuweOpdracht();
    }
}

function voortAdd(n) {
    if (!actief || eindfase) return;
    const q = huidigeOpdracht();
    if (!q) return;
    voortgang = voortgang + n;
    if (voortgang >= q.doel) klaarMetOpdracht();
}

function checkOpdracht(spelers, mijners) {
    const q = huidigeOpdracht();

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
                if (q && q.soort === "val" && (h - p.location.y) >= 15) voortAdd(q.doel);
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

    if (!q) return;

    if (q.soort === "afstand" && meest > 0.05) voortAdd(meest);

    if (q.soort === "water" || q.soort === "lava") {
        for (const p of spelers) {
            let b = undefined;
            try {
                b = p.dimension.getBlock({
                    x: Math.floor(p.location.x),
                    y: Math.floor(p.location.y),
                    z: Math.floor(p.location.z)
                });
            } catch (e) { /* blok niet geladen */ }
            if (b && b.typeId.indexOf(q.soort) >= 0) {
                voortAdd(1);
                break;
            }
        }
    }

    if (q.soort === "hoog") {
        for (const p of spelers) {
            if (p.location.y >= 100) {
                voortAdd(q.doel);
                break;
            }
        }
    }

    if (q.soort === "diep") {
        for (const p of spelers) {
            if (p.location.y <= -15) {
                voortAdd(q.doel);
                break;
            }
        }
    }

    if (q.soort === "verstop") {
        let veilig = spelers.length > 0;
        for (const p of spelers) {
            for (const m of mijners) {
                if (m.dimension.id !== p.dimension.id) continue;
                if (afstand(p.location, m.location) < 25) veilig = false;
            }
        }
        if (veilig) voortAdd(1);
        else voortgang = 0;
    }
}

function toonBalk(spelers, mijners, g) {
    let tekst;
    if (eindfase) {
        tekst = "§8Grootte: §e" + g.naam + " §8| §cSLOOP DE MIJNWERKERS: §e" + mijners.length + " §cover";
    } else {
        const q = huidigeOpdracht();
        tekst = "§8Grootte: §e" + g.naam + " §7(" + punten + "/" + MAX_PUNTEN + ")";
        if (q) {
            tekst = tekst + " §8| §aOpdracht: §f" + q.naam;
            if (q.teller !== false) {
                tekst = tekst + " §7[" + weergave(q, voortgang) + "/" + weergave(q, q.doel) + "]";
            }
        }
    }
    for (const p of spelers) {
        try { p.onScreenDisplay.setActionBar(tekst); } catch (e) { /* niet erg */ }
    }
}

// ============================================================
//  SPEL STARTEN, STOPPEN, WINNEN EN KRIMPEN
// ============================================================
function startSpel() {
    actief = true;
    punten = 0;
    gedaan = [];
    voortgang = 0;
    eindfase = false;
    laatsteKans = false;
    laatstePos.clear();
    valTop.clear();

    for (const m of alleMijnwerkers()) {
        try { m.remove(); } catch (e) { /* niet erg */ }
    }

    world.sendMessage("§6=== JE BENT EEN STEEN ===");
    world.sendMessage("§7Jij bent een steen. Drie mijnwerkers willen je §ckapot minen§7!");
    world.sendMessage("§7Doe §aopdrachten§7 om §egroter§7 te worden: meer leven en veel hardere klappen.");
    world.sendMessage("§7Vallen, vuur, lava en verdrinken doen je niets. Je bent van steen.");
    world.sendMessage("§7Ga je dood? Dan breekt er een stuk van je af en word je kleiner.");
    world.sendMessage("§7Word een §eBERG§7 en sloop daarna alle drie de mijnwerkers: dan heb JIJ gewonnen.");
    world.sendMessage("§7Opdracht zien: §e/function steen_info§7 - te moeilijk? §e/function steen_overslaan");

    const spelers = world.getAllPlayers();
    for (let i = 0; i < AANTAL_MIJNWERKERS; i++) {
        if (spelers.length === 0) break;
        spawnMijnwerker(spelers[i % spelers.length], VOORNAMEN[i], false);
    }
    for (const p of spelers) {
        geefPerks(p, grootte());
        zetPak(p, grootte().pak);
        try { p.playSound("random.anvil_land"); } catch (e) { /* niet erg */ }
    }
    nieuweOpdracht();
    opslaan();
}

function stopSpel(zegIets) {
    actief = false;
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

// Na een dreun gaan de mijnwerkers eerst een stuk weg, zodat je even op adem
// kunt komen op de plek waar je weer wakker wordt.
function duwMijnwerkersWeg() {
    system.runTimeout(() => {
        const spelers = world.getAllPlayers();
        if (spelers.length === 0) return;
        for (const m of alleMijnwerkers()) {
            const p = spelers[Math.floor(Math.random() * spelers.length)];
            try { m.teleport(veiligePlek(p, 25, 35)); } catch (e) { /* niet erg */ }
        }
    }, 60);
}

function krimp(naam) {
    if (punten <= 0) {
        if (!laatsteKans) {
            laatsteKans = true;
            world.sendMessage("§c[Steen]§r " + naam + " is bijna vergruizeld! Dit was je §claatste kans§r.");
            world.sendMessage("§7De mijnwerkers schrikken ervan en lopen een stuk weg. RENNEN!");
            duwMijnwerkersWeg();
            opslaan();
            return;
        }
        world.sendMessage("§c[Steen]§r " + naam + " is helemaal vergruizeld...");
        world.sendMessage("§c DE MIJNWERKERS HEBBEN GEWONNEN. §7Nog een keer? §e/function steen");
        stopSpel(false);
        return;
    }
    punten = punten - 2;
    if (punten < 0) punten = 0;
    eindfase = false;
    world.sendMessage("§c[Steen]§r " + naam + " is kapot geslagen! Er breekt een stuk van je af.");
    world.sendMessage("§7Je bent nu een §e" + grootte().naam + "§7. Doorgaan maar!");
    duwMijnwerkersWeg();
    nieuweOpdracht();
    opslaan();
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
    const g = grootte();

    perksTeller++;
    if (perksTeller >= 10) {
        perksTeller = 0;
        for (const p of spelers) {
            geefPerks(p, g);
            zetPak(p, g.pak);
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

    checkOpdracht(spelers, mijners);
    toonBalk(spelers, mijners, g);

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
world.afterEvents.entityHurt.subscribe((ev) => {
    if (!actief) return;
    const e = ev.hurtEntity;
    if (!e || e.typeId !== "minecraft:player") return;
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

// Sla jij een mijnwerker? Dan komt jouw grootte er bovenop.
world.afterEvents.entityHitEntity.subscribe((ev) => {
    if (!actief) return;
    const bron = ev.damagingEntity;
    const doel = ev.hitEntity;
    if (!bron || !doel) return;
    if (bron.typeId !== "minecraft:player" || doel.typeId !== MIJNWERKER) return;
    try {
        doel.applyDamage(grootte().klap, { cause: "entityAttack", damagingEntity: bron });
    } catch (e) { /* niet erg */ }
    const q = huidigeOpdracht();
    if (q && q.soort === "slaan") voortAdd(1);
});

world.afterEvents.entityDie.subscribe((ev) => {
    const dood = ev.deadEntity;
    if (!dood || !actief) return;

    if (dood.typeId === MIJNWERKER) {
        const naam = dood.nameTag ? dood.nameTag : "Een mijnwerker";
        world.sendMessage("§a[Steen]§r " + naam + " is verslagen!");
        const q = huidigeOpdracht();
        if (q && q.soort === "versla") voortAdd(q.doel);
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
    const q = huidigeOpdracht();
    if (!q) return;
    let id = "";
    try { id = ev.brokenBlockPermutation.type.id; } catch (e) { return; }
    if (q.soort === "steen" && lijstMatch(id, STEEN_BLOKKEN)) voortAdd(1);
    if (q.soort === "hout" && lijstMatch(id, HOUT_BLOKKEN)) voortAdd(1);
});

world.afterEvents.itemCompleteUse.subscribe((ev) => {
    if (!actief) return;
    const q = huidigeOpdracht();
    if (!q || q.soort !== "eten") return;
    if (ev.source && ev.source.typeId === "minecraft:player") voortAdd(1);
});

// Na doodgaan of inloggen: je schil en je krachten weer terug.
world.afterEvents.playerSpawn.subscribe((ev) => {
    if (!actief) return;
    const p = ev.player;
    system.runTimeout(() => {
        if (!actief) return;
        try {
            geefPerks(p, grootte());
            zetPak(p, grootte().pak);
        } catch (e) { /* niet erg */ }
    }, 20);
});

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
    if (!actief) {
        world.sendMessage("§6[Steen]§r Het spel loopt niet. Starten: §e/function steen");
        return;
    }
    const g = grootte();
    world.sendMessage("§6=== JE BENT EEN STEEN ===");
    world.sendMessage("§7Jouw grootte: §e" + g.naam + " §7(" + punten + "/" + MAX_PUNTEN + " groei)");
    world.sendMessage("§7Extra schade als je slaat: §e+" + g.klap + "§7. Mijnwerkers in de wereld: §e" + alleMijnwerkers().length);
    if (eindfase) {
        world.sendMessage("§cLaatste missie:§r sloop alle drie de mijnwerkers!");
        return;
    }
    const q = huidigeOpdracht();
    if (q) {
        let regel = "§7Opdracht: §a" + q.naam;
        if (q.teller !== false) regel = regel + " §7[" + weergave(q, voortgang) + "/" + weergave(q, q.doel) + "]";
        world.sendMessage(regel);
        world.sendMessage("§7" + q.uitleg);
    }
    world.sendMessage("§7Te moeilijk? §e/function steen_overslaan §7geeft je een andere opdracht.");
}

function verwerkCommandos(obj) {
    if (gevraagd(obj, "start")) startSpel();
    if (gevraagd(obj, "stop")) stopSpel(true);
    if (gevraagd(obj, "info")) toonInfo();
    if (gevraagd(obj, "groter")) {
        if (!actief) world.sendMessage("§6[Steen]§r Start eerst met §e/function steen");
        else if (eindfase) world.sendMessage("§6[Steen]§r Je bent al een BERG! Sloop de mijnwerkers.");
        else klaarMetOpdracht();
    }
    if (gevraagd(obj, "overslaan")) {
        if (!actief) world.sendMessage("§6[Steen]§r Start eerst met §e/function steen");
        else if (eindfase) world.sendMessage("§6[Steen]§r Er zijn geen opdrachten meer: sloop de mijnwerkers!");
        else {
            const q = huidigeOpdracht();
            if (q) gedaan.push(q.id);
            world.sendMessage("§6[Steen]§r Oke, die slaan we over.");
            nieuweOpdracht();
        }
    }
}
