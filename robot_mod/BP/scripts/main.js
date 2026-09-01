import { world, system, ItemStack } from "@minecraft/server";

// ============================================================
//  ROBOT MOD
//  - Klik met het ROBOT BOUWPAKKET op de grond: je robot wordt gebouwd.
//  - Klik met de AFSTANDSBEDIENING: wissel tussen VOLGEN, VECHTEN
//    en DIAMANT MIJNEN.
//  - Wordt de robot aangevallen? Dan gaat hij KAPOT en staat hij stil.
//    Repareer hem: klik op hem met REDSTONE in je hand (je hebt ook
//    IJZER in je rugzak nodig).
// ============================================================

const ROBOT_ID = "robot:robot";
const KIT_ID = "robot:robot_bouwpakket";
const REMOTE_ID = "robot:afstandsbediening";

const REDSTONE = "minecraft:redstone";
const IJZER = "minecraft:iron_ingot";

const BAAS_PREFIX = "baas:";
const MODUS_PREFIX = "modus:";
const KAPOT_TAG = "kapot";

const DIMENSIE_IDS = ["overworld", "nether", "the_end"];

const MAX_HP = 40;
const KAPOT_GRENS = 16;   // hieronder gaat de robot kapot
const KAPOT_HP = 8;       // zoveel leven houdt hij over als hij kapot is
const REPARATIE_HP = 12;  // zoveel leven krijgt hij per redstone + ijzer
const MAX_ROBOTS = 3;

const MODI = ["volg", "vecht", "mijn"];
const MODUS_NAAM = {
    volg: "§aVOLGEN§r",
    vecht: "§cVECHTEN§r",
    mijn: "§bDIAMANT MIJNEN§r"
};

const DIAMANT_ERTS = new Set([
    "minecraft:diamond_ore",
    "minecraft:deepslate_diamond_ore"
]);

// Blokken die de robot mag weghalen als hij een mijn graaft.
const GRAAFBAAR = new Set([
    "minecraft:stone", "minecraft:cobblestone", "minecraft:deepslate",
    "minecraft:cobbled_deepslate", "minecraft:andesite", "minecraft:diorite",
    "minecraft:granite", "minecraft:tuff", "minecraft:dirt", "minecraft:gravel",
    "minecraft:sand", "minecraft:netherrack", "minecraft:calcite"
]);

const MONSTERS = new Set([
    "minecraft:zombie", "minecraft:husk", "minecraft:drowned", "minecraft:skeleton",
    "minecraft:stray", "minecraft:bogged", "minecraft:creeper", "minecraft:spider",
    "minecraft:cave_spider", "minecraft:witch", "minecraft:slime", "minecraft:phantom",
    "minecraft:pillager", "minecraft:vindicator", "minecraft:evocation_illager",
    "minecraft:ravager", "minecraft:enderman", "minecraft:blaze", "minecraft:magma_cube",
    "minecraft:ghast", "minecraft:hoglin", "minecraft:zoglin", "minecraft:piglin_brute",
    "minecraft:wither_skeleton", "minecraft:breeze", "minecraft:vex", "minecraft:zombie_pigman",
    "minecraft:silverfish", "minecraft:guardian", "minecraft:elder_guardian", "minecraft:shulker"
]);

// Kleine geheugentjes per robot (tellers voor praatjes en mislukte pogingen).
const geheugen = new Map();

function onthoud(robot) {
    let g = geheugen.get(robot.id);
    if (!g) {
        g = { gemijnd: 0, geslagen: 0, mislukt: 0, klaagTik: 0, diamant: 0 };
        geheugen.set(robot.id, g);
    }
    return g;
}

function zegt(tekst) {
    world.sendMessage("§b<Robot>§r " + tekst);
}

function afstand2(a, b) {
    const dx = a.x - b.x, dy = a.y - b.y, dz = a.z - b.z;
    return dx * dx + dy * dy + dz * dz;
}

function commando(dim, cmd) {
    try {
        if (dim.runCommand) dim.runCommand(cmd);
        else dim.runCommandAsync(cmd);
    } catch (e) { /* niks aan de hand */ }
}

function deeltjes(dim, loc, id, aantal) {
    for (let i = 0; i < aantal; i++) {
        const x = (loc.x + Math.random() * 1.4 - 0.7).toFixed(2);
        const y = (loc.y + 0.6 + Math.random() * 1.4).toFixed(2);
        const z = (loc.z + Math.random() * 1.4 - 0.7).toFixed(2);
        commando(dim, `particle ${id} ${x} ${y} ${z}`);
    }
}

function geluid(dim, loc, naam) {
    commando(dim, `playsound ${naam} @a ${loc.x.toFixed(1)} ${loc.y.toFixed(1)} ${loc.z.toFixed(1)} 1 1`);
}

// ============================================================
//  Rugzak: tellen en verbruiken
// ============================================================

function bak(speler) {
    try {
        const inv = speler.getComponent("minecraft:inventory");
        return inv ? inv.container : null;
    } catch (e) {
        return null;
    }
}

function telItem(speler, typeId) {
    const container = bak(speler);
    if (!container) return 0;
    let totaal = 0;
    for (let i = 0; i < container.size; i++) {
        const stapel = container.getItem(i);
        if (stapel && stapel.typeId === typeId) totaal += stapel.amount;
    }
    return totaal;
}

function verbruik(speler, typeId, aantal) {
    const container = bak(speler);
    if (!container) return false;
    if (telItem(speler, typeId) < aantal) return false;
    let over = aantal;
    for (let i = 0; i < container.size && over > 0; i++) {
        const stapel = container.getItem(i);
        if (!stapel || stapel.typeId !== typeId) continue;
        if (stapel.amount > over) {
            stapel.amount -= over;
            container.setItem(i, stapel);
            over = 0;
        } else {
            over -= stapel.amount;
            container.setItem(i, undefined);
        }
    }
    return over === 0;
}

function itemInHand(speler) {
    try {
        const uitrusting = speler.getComponent("minecraft:equippable");
        const item = uitrusting ? uitrusting.getEquipment("Mainhand") : undefined;
        return item ? item.typeId : "";
    } catch (e) {
        return "";
    }
}

// ============================================================
//  Robots zoeken, modus zetten, naambordje bijwerken
// ============================================================

function alleRobots(dim) {
    try {
        return dim.getEntities({ type: ROBOT_ID });
    } catch (e) {
        return [];
    }
}

function robotsVan(spelerNaam) {
    const gevonden = [];
    for (const dimId of DIMENSIE_IDS) {
        let dim;
        try { dim = world.getDimension(dimId); } catch (e) { continue; }
        for (const robot of alleRobots(dim)) {
            if (robot.hasTag(BAAS_PREFIX + spelerNaam)) gevonden.push(robot);
        }
    }
    return gevonden;
}

function baasVan(robot) {
    for (const t of robot.getTags()) {
        if (t.startsWith(BAAS_PREFIX)) return t.slice(BAAS_PREFIX.length);
    }
    return null;
}

function getModus(robot) {
    for (const t of robot.getTags()) {
        if (t.startsWith(MODUS_PREFIX)) return t.slice(MODUS_PREFIX.length);
    }
    return "volg";
}

function zetModus(robot, modus) {
    for (const t of robot.getTags()) {
        if (t.startsWith(MODUS_PREFIX)) robot.removeTag(t);
    }
    robot.addTag(MODUS_PREFIX + modus);
    const g = onthoud(robot);
    g.mislukt = 0;
}

function leven(robot) {
    try {
        return robot.getComponent("minecraft:health");
    } catch (e) {
        return null;
    }
}

function naamBord(robot) {
    const hp = leven(robot);
    const nu = hp ? Math.max(0, Math.round(hp.currentValue)) : 0;
    const baas = baasVan(robot);
    const vanWie = baas ? " van " + baas : "";
    if (robot.hasTag(KAPOT_TAG)) {
        robot.nameTag = "§4KAPOTTE ROBOT§r" + vanWie + " §7(" + nu + "/" + MAX_HP + ") §credstone + ijzer nodig!";
    } else {
        robot.nameTag = "§bRobot§r" + vanWie + " §7[" + MODUS_NAAM[getModus(robot)] + "§7] §c" + nu + "/" + MAX_HP;
    }
}

// De robot mag niet verbranden of verdrinken tijdens het werk.
function bescherm(robot) {
    try {
        robot.addEffect("minecraft:fire_resistance", 600, { amplifier: 0, showParticles: false });
        robot.addEffect("minecraft:resistance", 600, { amplifier: 1, showParticles: false });
    } catch (e) { /* geen effect mogelijk */ }
}

// ============================================================
//  KAPOT GAAN en REPAREREN
// ============================================================

function gaKapot(robot) {
    if (robot.hasTag(KAPOT_TAG)) return;
    robot.addTag(KAPOT_TAG);
    try { robot.triggerEvent("robot:ga_kapot"); } catch (e) { /* groep bestaat niet */ }
    const hp = leven(robot);
    if (hp) {
        try { hp.setCurrentValue(KAPOT_HP); } catch (e) { /* stil verder */ }
    }
    deeltjes(robot.dimension, robot.location, "minecraft:basic_smoke_particle", 10);
    geluid(robot.dimension, robot.location, "random.fizz");
    naamBord(robot);
    zegt("PIEP... PIIIEP... IK BEN KAPOT! Repareer me met §credstone§r en §fijzer§r: klik op mij met redstone in je hand.");
}

function isHeel(robot) {
    robot.removeTag(KAPOT_TAG);
    try { robot.triggerEvent("robot:gerepareerd"); } catch (e) { /* groep bestaat niet */ }
    deeltjes(robot.dimension, robot.location, "minecraft:villager_happy", 10);
    geluid(robot.dimension, robot.location, "random.levelup");
    naamBord(robot);
    zegt("PIEP! Helemaal gemaakt, dank je wel baas! Systemen weer aan!");
}

function repareer(speler, robot) {
    const hp = leven(robot);
    if (!hp) return;

    if (hp.currentValue >= MAX_HP && !robot.hasTag(KAPOT_TAG)) {
        zegt("Ik ben al helemaal heel, baas! Alles PIEP-PIEP in orde.");
        return;
    }

    const heeftRedstone = telItem(speler, REDSTONE) >= 1;
    const heeftIjzer = telItem(speler, IJZER) >= 1;
    if (!heeftRedstone || !heeftIjzer) {
        let mist = "";
        if (!heeftRedstone && !heeftIjzer) mist = "§credstone§r EN §fijzer§r";
        else if (!heeftRedstone) mist = "§credstone§r";
        else mist = "§fijzer§r";
        zegt("Ik heb " + mist + " nodig om mezelf te repareren, baas!");
        return;
    }

    if (!verbruik(speler, REDSTONE, 1) || !verbruik(speler, IJZER, 1)) return;

    const nieuw = Math.min(MAX_HP, hp.currentValue + REPARATIE_HP);
    try { hp.setCurrentValue(nieuw); } catch (e) { /* stil verder */ }
    deeltjes(robot.dimension, robot.location, "minecraft:electric_spark_particle", 8);
    geluid(robot.dimension, robot.location, "random.anvil_use");

    if (nieuw >= MAX_HP) {
        if (robot.hasTag(KAPOT_TAG)) isHeel(robot);
        else zegt("Helemaal opgeladen! " + MAX_HP + "/" + MAX_HP + " PIEP!");
    } else {
        const nodig = Math.ceil((MAX_HP - nieuw) / REPARATIE_HP);
        zegt("Zzzt... gerepareerd tot " + Math.round(nieuw) + "/" + MAX_HP +
            ". Nog " + nodig + "x redstone + ijzer en ik ben klaar!");
    }
    naamBord(robot);
}

// ============================================================
//  ROBOT BOUWEN met het bouwpakket
// ============================================================

function bouwRobot(speler, locatie) {
    const mijne = robotsVan(speler.name);
    if (mijne.length >= MAX_ROBOTS) {
        zegt("Je hebt al " + MAX_ROBOTS + " robots, baas! Meer past niet in mijn fabriek.");
        return false;
    }

    let robot;
    try {
        robot = speler.dimension.spawnEntity(ROBOT_ID, locatie);
    } catch (e) {
        zegt("Hier kan ik niet gebouwd worden, baas. Probeer een plek met wat ruimte!");
        return false;
    }

    robot.addTag(BAAS_PREFIX + speler.name);
    zetModus(robot, "volg");
    bescherm(robot);
    naamBord(robot);
    deeltjes(speler.dimension, locatie, "minecraft:electric_spark_particle", 12);
    geluid(speler.dimension, locatie, "beacon.activate");
    zegt("PIEP PIEP! Robot in elkaar gezet! Hallo " + speler.name + ", ik ben jouw robot!");
    zegt("Klik met de §7afstandsbediening§r om te wisselen: " +
        MODUS_NAAM.volg + ", " + MODUS_NAAM.vecht + " of " + MODUS_NAAM.mijn + ".");
    return true;
}

// Een klik op een blok kan twee events geven (itemUse EN playerInteractWithBlock).
// Deze kleine pauze zorgt dat er dan maar EEN robot gebouwd wordt.
const laatsteBouw = new Map();

function gebruikBouwpakket(speler, locatie) {
    const vorige = laatsteBouw.get(speler.name);
    if (vorige !== undefined && system.currentTick - vorige < 10) return;
    laatsteBouw.set(speler.name, system.currentTick);
    if (bouwRobot(speler, locatie)) verbruik(speler, KIT_ID, 1);
}

function gebruikAfstandsbediening(speler) {
    const mijne = robotsVan(speler.name);
    if (mijne.length === 0) {
        zegt("Je hebt nog geen robot, baas! Maak er een met het §7Robot Bouwpakket§r (8x ijzer + 1x redstone).");
        return;
    }
    const nu = getModus(mijne[0]);
    const volgende = MODI[(MODI.indexOf(nu) + 1) % MODI.length];
    for (const robot of mijne) {
        zetModus(robot, volgende);
        naamBord(robot);
        deeltjes(robot.dimension, robot.location, "minecraft:electric_spark_particle", 5);
    }
    geluid(speler.dimension, speler.location, "random.click");
    if (volgende === "volg") zegt("Modus: " + MODUS_NAAM.volg + " — ik blijf lekker bij jou, baas!");
    else if (volgende === "vecht") zegt("Modus: " + MODUS_NAAM.vecht + " — ik val alle monsters aan!");
    else zegt("Modus: " + MODUS_NAAM.mijn + " — ik ga diamanten voor je zoeken!");
}

// ============================================================
//  EVENTS
// ============================================================

try {
    world.afterEvents.itemUse.subscribe((ev) => {
        const speler = ev.source;
        const item = ev.itemStack;
        if (!speler || !item) return;
        system.run(() => {
            try {
                if (item.typeId === KIT_ID) {
                    const kijk = speler.getViewDirection();
                    const loc = {
                        x: speler.location.x + kijk.x * 2,
                        y: speler.location.y,
                        z: speler.location.z + kijk.z * 2
                    };
                    gebruikBouwpakket(speler, loc);
                } else if (item.typeId === REMOTE_ID) {
                    gebruikAfstandsbediening(speler);
                }
            } catch (e) { /* stil verder */ }
        });
    });
} catch (e) { /* event bestaat niet in deze versie */ }

try {
    world.afterEvents.playerInteractWithBlock.subscribe((ev) => {
        const speler = ev.player;
        const item = ev.itemStack;
        if (!speler || !item || item.typeId !== KIT_ID) return;
        const blok = ev.block;
        system.run(() => {
            try {
                const loc = blok
                    ? { x: blok.location.x + 0.5, y: blok.location.y + 1, z: blok.location.z + 0.5 }
                    : speler.location;
                gebruikBouwpakket(speler, loc);
            } catch (e) { /* stil verder */ }
        });
    });
} catch (e) { /* event bestaat niet in deze versie */ }

// Klik op de robot met redstone/ijzer in je hand = repareren.
try {
    world.afterEvents.playerInteractWithEntity.subscribe((ev) => {
        const speler = ev.player;
        const doel = ev.target;
        if (!speler || !doel || doel.typeId !== ROBOT_ID) return;
        const itemId = ev.itemStack ? ev.itemStack.typeId : "";
        system.run(() => {
            try {
                if (itemId === REDSTONE || itemId === IJZER) repareer(speler, doel);
                else vertelStatus(doel);
            } catch (e) { /* stil verder */ }
        });
    });
} catch (e) { /* event bestaat niet in deze versie */ }

// Sla je hem per ongeluk met redstone in je hand? Dan repareer je hem ook.
try {
    world.afterEvents.entityHitEntity.subscribe((ev) => {
        const dader = ev.damagingEntity;
        const geraakt = ev.hitEntity;
        if (!dader || !geraakt) return;
        if (dader.typeId !== "minecraft:player" || geraakt.typeId !== ROBOT_ID) return;
        const itemId = itemInHand(dader);
        if (itemId !== REDSTONE && itemId !== IJZER) return;
        system.run(() => {
            try { repareer(dader, geraakt); } catch (e) { /* stil verder */ }
        });
    });
} catch (e) { /* event bestaat niet in deze versie */ }

// Wordt de robot aangevallen? Dan gaat hij bij te weinig leven KAPOT.
try {
    world.afterEvents.entityHurt.subscribe((ev) => {
        const robot = ev.hurtEntity;
        if (!robot || robot.typeId !== ROBOT_ID) return;
        system.run(() => {
            try {
                const hp = leven(robot);
                if (!hp) return;
                if (robot.hasTag(KAPOT_TAG)) {
                    // Een kapotte robot kan niet nog kapotter (en gaat nooit dood).
                    if (hp.currentValue < KAPOT_HP) hp.setCurrentValue(KAPOT_HP);
                    return;
                }
                if (hp.currentValue <= KAPOT_GRENS) gaKapot(robot);
                else {
                    deeltjes(robot.dimension, robot.location, "minecraft:basic_smoke_particle", 3);
                    const g = onthoud(robot);
                    g.geslagen++;
                    if (g.geslagen % 5 === 1) zegt("AU! PIEP! Dat doet zeer aan mijn schroefjes!");
                }
            } catch (e) { /* stil verder */ }
        });
    });
} catch (e) { /* event bestaat niet in deze versie */ }

function vertelStatus(robot) {
    const hp = leven(robot);
    const nu = hp ? Math.round(hp.currentValue) : 0;
    if (robot.hasTag(KAPOT_TAG)) {
        zegt("Ik ben KAPOT (" + nu + "/" + MAX_HP + "). Klik op mij met §credstone§r in je hand (en ijzer in je rugzak).");
    } else {
        zegt("Alles PIEP in orde! Leven: " + nu + "/" + MAX_HP + ", modus: " + MODUS_NAAM[getModus(robot)] + ".");
    }
}

// ============================================================
//  WERK: volgen, vechten en diamant mijnen
// ============================================================

function zoekBlok(dim, midden, straal, yMin, yMax, testFn) {
    const mx = Math.floor(midden.x), my = Math.floor(midden.y), mz = Math.floor(midden.z);
    let beste = null;
    let besteAfstand = Infinity;
    for (let dx = -straal; dx <= straal; dx++) {
        for (let dy = yMin; dy <= yMax; dy++) {
            for (let dz = -straal; dz <= straal; dz++) {
                const pos = { x: mx + dx, y: my + dy, z: mz + dz };
                let blok;
                try { blok = dim.getBlock(pos); } catch (e) { continue; }
                if (!blok || !testFn(blok.typeId, dy)) continue;
                const d = dx * dx + dy * dy + dz * dz;
                if (d < besteAfstand) {
                    besteAfstand = d;
                    beste = pos;
                }
            }
        }
    }
    return beste;
}

function loopNaar(robot, doel) {
    const midden = { x: doel.x + 0.5, y: doel.y, z: doel.z + 0.5 };
    if (afstand2(robot.location, midden) <= 9) return true;
    try {
        robot.teleport({ x: doel.x + 0.5, y: doel.y + 1, z: doel.z + 0.5 });
    } catch (e) { /* volgende keer beter */ }
    return false;
}

function geefAanBaas(robot, baas, itemId, aantal) {
    const stapel = new ItemStack(itemId, aantal);
    const waar = baas && baas.dimension.id === robot.dimension.id ? baas : robot;
    try {
        waar.dimension.spawnItem(stapel, waar.location);
    } catch (e) {
        try { robot.dimension.spawnItem(stapel, robot.location); } catch (e2) { /* jammer */ }
    }
}

function doeMijn(robot, dim, baas) {
    const g = onthoud(robot);

    // 1. Eerst kijken of er DIAMANT in de buurt zit.
    const diamant = zoekBlok(dim, robot.location, 7, -5, 4, (id) => DIAMANT_ERTS.has(id));
    if (diamant) {
        if (!loopNaar(robot, diamant)) return;
        commando(dim, `setblock ${diamant.x} ${diamant.y} ${diamant.z} air`);
        deeltjes(dim, { x: diamant.x + 0.5, y: diamant.y, z: diamant.z + 0.5 }, "minecraft:electric_spark_particle", 6);
        geluid(dim, robot.location, "random.levelup");
        geefAanBaas(robot, baas, "minecraft:diamond", 1);
        g.diamant++;
        g.mislukt = 0;
        zegt("PIEP PIEP!! DIAMANT GEVONDEN! Dat is er al " + g.diamant + "! Hij ligt bij jou, baas!");
        return;
    }

    // 2. Geen diamant? Dan graaft de robot een mijn naar beneden.
    if (robot.location.y <= -55) {
        g.mislukt++;
        if (g.mislukt >= 5) {
            zetModus(robot, "volg");
            zegt("Hier is alleen nog bedrock, baas! Ik stop met graven.");
        }
        return;
    }

    let doel = zoekBlok(dim, robot.location, 5, -4, 2, (id) => id.endsWith("_ore"));
    if (!doel) {
        doel = zoekBlok(dim, robot.location, 3, -4, 0, (id, dy) => GRAAFBAAR.has(id) && dy <= 0);
    }
    if (!doel) {
        g.mislukt++;
        if (g.mislukt >= 8) {
            zetModus(robot, "volg");
            zegt("Ik kan hier niets graven, baas! Neem me mee naar een grot of berg.");
        }
        return;
    }

    g.mislukt = 0;
    if (!loopNaar(robot, doel)) return;
    commando(dim, `setblock ${doel.x} ${doel.y} ${doel.z} air destroy`);
    deeltjes(dim, { x: doel.x + 0.5, y: doel.y, z: doel.z + 0.5 }, "minecraft:basic_smoke_particle", 2);
    g.gemijnd++;
    if (g.gemijnd % 40 === 0) {
        zegt("Zzzt... al " + g.gemijnd + " blokken weggegraven. Ik zoek door naar diamant!");
    }
}

function doeVecht(robot, dim, baas) {
    let dichtbij = [];
    try {
        dichtbij = dim.getEntities({ location: robot.location, maxDistance: 14 });
    } catch (e) {
        return;
    }
    let doelwit = null;
    let dichtst = Infinity;
    for (const v of dichtbij) {
        if (!MONSTERS.has(v.typeId)) continue;
        const d = afstand2(robot.location, v.location);
        if (d < dichtst) {
            dichtst = d;
            doelwit = v;
        }
    }
    if (!doelwit) {
        volg(robot, baas);
        return;
    }
    if (dichtst > 9) {
        try {
            robot.teleport({ x: doelwit.location.x + 1, y: doelwit.location.y, z: doelwit.location.z });
        } catch (e) { /* volgende keer */ }
        return;
    }
    try {
        doelwit.applyDamage(7, { cause: "entityAttack", damagingEntity: robot });
        deeltjes(dim, doelwit.location, "minecraft:electric_spark_particle", 4);
        geluid(dim, robot.location, "random.anvil_land");
        const g = onthoud(robot);
        g.geslagen++;
        if (g.geslagen % 12 === 0) zegt("ZZZAP! Wegwezen, monster! Mijn baas beschermen is mijn taak!");
    } catch (e) { /* doelwit al weg */ }
}

function volg(robot, baas) {
    if (!baas) return;
    try {
        if (robot.dimension.id !== baas.dimension.id) return;
        if (afstand2(robot.location, baas.location) > 256) {
            robot.teleport({ x: baas.location.x + 1.5, y: baas.location.y, z: baas.location.z });
            deeltjes(baas.dimension, baas.location, "minecraft:electric_spark_particle", 3);
        }
    } catch (e) { /* niet erg */ }
}

let tikken = 0;

system.runInterval(() => {
    tikken++;
    const spelers = world.getAllPlayers();
    for (const dimId of DIMENSIE_IDS) {
        let dim;
        try { dim = world.getDimension(dimId); } catch (e) { continue; }
        for (const robot of alleRobots(dim)) {
            try {
                const baasNaam = baasVan(robot);
                const baas = baasNaam ? spelers.find((p) => p.name === baasNaam) || null : null;

                naamBord(robot);

                const hp = leven(robot);
                if (hp && !robot.hasTag(KAPOT_TAG) && hp.currentValue <= KAPOT_GRENS) {
                    gaKapot(robot);
                }

                if (robot.hasTag(KAPOT_TAG)) {
                    if (hp && hp.currentValue < KAPOT_HP) {
                        try { hp.setCurrentValue(KAPOT_HP); } catch (e) { /* stil verder */ }
                    }
                    if (tikken % 4 === 0) {
                        deeltjes(robot.dimension, robot.location, "minecraft:basic_smoke_particle", 2);
                    }
                    const g = onthoud(robot);
                    g.klaagTik++;
                    if (g.klaagTik >= 40) {
                        g.klaagTik = 0;
                        zegt("Piep... ik lig hier nog steeds kapot. §credstone§r + §fijzer§r graag, baas!");
                    }
                    continue;
                }

                if (tikken % 8 === 0) bescherm(robot);

                const modus = getModus(robot);
                if (modus === "mijn") doeMijn(robot, dim, baas);
                else if (modus === "vecht") doeVecht(robot, dim, baas);
                else volg(robot, baas);
            } catch (e) { /* robot net verdwenen */ }
        }
    }
}, 8);
