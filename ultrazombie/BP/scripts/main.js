import { world, system } from "@minecraft/server";

// ============================================================
//  ULTRAZOMBIE
//  Tem een zombie met ROT VLEES (sla of klik hem ermee).
//  Praat daarna gewoon in de chat:
//    - zeg een mobnaam ("blaze") en hij verandert erin
//    - "ga hout hakken", "ga mijnen", "vecht", "dans"
//    - "kom hier", "stop", "help"
//  Alles gaat met echte Minecraft chat-tekst!
// ============================================================

const DIMENSIE_IDS = ["overworld", "nether", "the_end"];
const TAG = "ultrazombie";
const BAAS_PREFIX = "baas:";
const JOB_PREFIX = "job:";

// Nederlandse (en Engelse) namen -> echte Bedrock mob-ids
const MOBS = {
    zombie: "minecraft:zombie",
    blaze: "minecraft:blaze",
    blaas: "minecraft:blaze",
    creeper: "minecraft:creeper",
    skelet: "minecraft:skeleton",
    skeleton: "minecraft:skeleton",
    spin: "minecraft:spider",
    spider: "minecraft:spider",
    wolf: "minecraft:wolf",
    hond: "minecraft:wolf",
    kat: "minecraft:cat",
    poes: "minecraft:cat",
    cat: "minecraft:cat",
    varken: "minecraft:pig",
    pig: "minecraft:pig",
    koe: "minecraft:cow",
    cow: "minecraft:cow",
    schaap: "minecraft:sheep",
    sheep: "minecraft:sheep",
    kip: "minecraft:chicken",
    chicken: "minecraft:chicken",
    paard: "minecraft:horse",
    horse: "minecraft:horse",
    ezel: "minecraft:donkey",
    muilezel: "minecraft:mule",
    dolfijn: "minecraft:dolphin",
    dolphin: "minecraft:dolphin",
    golem: "minecraft:iron_golem",
    ijzergolem: "minecraft:iron_golem",
    sneeuwman: "minecraft:snow_golem",
    sneeuwgolem: "minecraft:snow_golem",
    heks: "minecraft:witch",
    witch: "minecraft:witch",
    slijm: "minecraft:slime",
    slime: "minecraft:slime",
    magma: "minecraft:magma_cube",
    magmakubus: "minecraft:magma_cube",
    vos: "minecraft:fox",
    fox: "minecraft:fox",
    panda: "minecraft:panda",
    bij: "minecraft:bee",
    bee: "minecraft:bee",
    axolotl: "minecraft:axolotl",
    allay: "minecraft:allay",
    warden: "minecraft:warden",
    enderman: "minecraft:enderman",
    ender: "minecraft:enderman",
    piglin: "minecraft:piglin",
    zombiepiglin: "minecraft:zombie_pigman",
    hoglin: "minecraft:hoglin",
    vleermuis: "minecraft:bat",
    bat: "minecraft:bat",
    papegaai: "minecraft:parrot",
    parrot: "minecraft:parrot",
    konijn: "minecraft:rabbit",
    rabbit: "minecraft:rabbit",
    kikker: "minecraft:frog",
    frog: "minecraft:frog",
    geit: "minecraft:goat",
    goat: "minecraft:goat",
    kameel: "minecraft:camel",
    camel: "minecraft:camel",
    sniffer: "minecraft:sniffer",
    schildpad: "minecraft:turtle",
    turtle: "minecraft:turtle",
    ijsbeer: "minecraft:polar_bear",
    inktvis: "minecraft:squid",
    squid: "minecraft:squid",
    lama: "minecraft:llama",
    llama: "minecraft:llama",
    ocelot: "minecraft:ocelot",
    gordeldier: "minecraft:armadillo",
    armadillo: "minecraft:armadillo",
    breeze: "minecraft:breeze",
    ravager: "minecraft:ravager",
    pillager: "minecraft:pillager",
    vindicator: "minecraft:vindicator",
    evoker: "minecraft:evocation_illager",
    shulker: "minecraft:shulker",
    zilvervisje: "minecraft:silverfish",
    silverfish: "minecraft:silverfish",
    guardian: "minecraft:guardian",
    zalm: "minecraft:salmon",
    kogelvis: "minecraft:pufferfish",
    mooshroom: "minecraft:mooshroom",
    paddenstoelkoe: "minecraft:mooshroom",
    handelaar: "minecraft:wandering_trader",
    drowned: "minecraft:drowned",
    husk: "minecraft:husk",
    stray: "minecraft:stray",
    bogged: "minecraft:bogged"
};

// De dorpeling heet in sommige versies anders, dus we proberen er twee.
const DORPELING_IDS = ["minecraft:villager_v2", "minecraft:villager"];
const DORPELING_WOORDEN = new Set(["dorpeling", "villager"]);

// Te gevaarlijk of te eng -- hier zegt de Ultrazombie nee tegen.
// Geesten mogen niet (dat heeft de baas zo besloten).
const VERBODEN_WOORDEN = new Set([
    "wither", "draak", "dragon", "enderdraak", "ender_dragon",
    "geest", "spook", "ghast", "phantom", "fantoom", "vex"
]);

// Dit zijn geen echte mobs (of je maatje zou erdoor verdwijnen),
// dus die slaan we over bij het gokken van mobnamen.
const GEEN_MOB_IDS = new Set([
    "minecraft:tnt", "minecraft:lightning_bolt", "minecraft:fireball",
    "minecraft:small_fireball", "minecraft:dragon_fireball", "minecraft:wither_skull",
    "minecraft:wither_skull_dangerous", "minecraft:ender_crystal", "minecraft:falling_block",
    "minecraft:arrow", "minecraft:snowball", "minecraft:egg", "minecraft:splash_potion",
    "minecraft:lingering_potion", "minecraft:thrown_trident", "minecraft:fishing_hook",
    "minecraft:xp_orb", "minecraft:xp_bottle", "minecraft:eye_of_ender_signal",
    "minecraft:area_effect_cloud", "minecraft:leash_knot", "minecraft:painting",
    "minecraft:item", "minecraft:tripod_camera", "minecraft:agent", "minecraft:npc",
    "minecraft:evocation_fang", "minecraft:wither", "minecraft:ender_dragon",
    "minecraft:shulker_bullet", "minecraft:llama_spit", "minecraft:boat",
    "minecraft:chest_boat", "minecraft:minecart", "minecraft:player"
]);

// Vijanden die de Ultrazombie aanvalt als je "vecht" zegt.
const MONSTERS = new Set([
    "minecraft:zombie", "minecraft:husk", "minecraft:drowned", "minecraft:skeleton",
    "minecraft:stray", "minecraft:bogged", "minecraft:creeper", "minecraft:spider",
    "minecraft:cave_spider", "minecraft:witch", "minecraft:slime", "minecraft:phantom",
    "minecraft:pillager", "minecraft:vindicator", "minecraft:evocation_illager",
    "minecraft:ravager", "minecraft:enderman", "minecraft:blaze", "minecraft:magma_cube",
    "minecraft:ghast", "minecraft:hoglin", "minecraft:zoglin", "minecraft:piglin_brute",
    "minecraft:wither_skeleton", "minecraft:breeze", "minecraft:vex", "minecraft:zombie_pigman"
]);

const GRAPJES = [
    'Hmm... "%s"? Dat snap ik nog niet, baas!',
    "BRAINSSS... eh sorry, ik bedoel: wat bedoel je, baas?",
    "Zeg 'help' dan vertel ik wat ik allemaal kan!",
    "Grrr... goed idee baas, maar dat kan ik nog niet!",
    'Ik dacht heel hard na over "%s"... maar mijn zombiebrein snapt het niet.',
    "Zeg een mobnaam en ik verander! Bijvoorbeeld: blaze!"
];

// Losse geheugentjes per maatje (tellers voor hakken, dansen, enz.)
const geheugen = new Map();

function onthoud(entity) {
    let g = geheugen.get(entity.id);
    if (!g) {
        g = { geteld: 0, mislukt: 0, hoek: 0, dansTikken: 0 };
        geheugen.set(entity.id, g);
    }
    return g;
}

function zegt(tekst) {
    world.sendMessage("§a<Ultrazombie>§r " + tekst);
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
        const x = (loc.x + Math.random() * 1.6 - 0.8).toFixed(2);
        const y = (loc.y + 0.5 + Math.random() * 1.5).toFixed(2);
        const z = (loc.z + Math.random() * 1.6 - 0.8).toFixed(2);
        commando(dim, `particle ${id} ${x} ${y} ${z}`);
    }
}

// Zorgt dat het maatje niemand pijn doet en zelf bijna niks voelt.
function bescherm(entity) {
    try {
        entity.addEffect("minecraft:weakness", 600, { amplifier: 255, showParticles: false });
        entity.addEffect("minecraft:resistance", 600, { amplifier: 4, showParticles: false });
        entity.addEffect("minecraft:fire_resistance", 600, { amplifier: 0, showParticles: false });
    } catch (e) { /* sommige mobs kunnen geen effecten krijgen */ }
}

function getJob(entity) {
    for (const t of entity.getTags()) {
        if (t.startsWith(JOB_PREFIX)) return t.slice(JOB_PREFIX.length);
    }
    return null;
}

function setJob(entity, job) {
    for (const t of entity.getTags()) {
        if (t.startsWith(JOB_PREFIX)) entity.removeTag(t);
    }
    if (job) entity.addTag(JOB_PREFIX + job);
    const g = onthoud(entity);
    g.geteld = 0;
    g.mislukt = 0;
    g.dansTikken = 0;
}

function vindMaatje(spelerNaam) {
    for (const dimId of DIMENSIE_IDS) {
        try {
            const dim = world.getDimension(dimId);
            const gevonden = dim.getEntities({ tags: [TAG, BAAS_PREFIX + spelerNaam] });
            if (gevonden.length > 0) return gevonden[0];
        } catch (e) { /* dimensie niet geladen */ }
    }
    return null;
}

// ============================================================
//  TEMMEN: sla of klik een zombie terwijl je rot vlees vasthoudt
// ============================================================

function probeerTemmen(speler, doel, itemId) {
    if (!speler || !doel) return;
    if (doel.typeId !== "minecraft:zombie") return;
    if (itemId !== "minecraft:rotten_flesh") return;
    if (doel.hasTag(TAG)) return;

    if (vindMaatje(speler.name)) {
        zegt("Je hebt al een Ultrazombie, baas! Meer dan een gaat niet.");
        return;
    }

    doel.addTag(TAG);
    doel.addTag(BAAS_PREFIX + speler.name);
    doel.nameTag = "§aUltrazombie§r van " + speler.name;
    bescherm(doel);
    deeltjes(doel.dimension, doel.location, "minecraft:heart_particle", 8);

    zegt("MMM, rot vlees! Ik ben nu jouw Ultrazombie, " + speler.name + "!");
    zegt("Zeg een mobnaam (zoals §eblaze§r) en ik verander erin!");
    zegt("Of zeg: §ega hout hakken§r, §ega mijnen§r, §evecht§r, §edans§r, §ekom hier§r, §estop§r of §ehelp§r.");
}

try {
    world.afterEvents.playerInteractWithEntity.subscribe((ev) => {
        const itemId = ev.itemStack ? ev.itemStack.typeId : "";
        probeerTemmen(ev.player, ev.target, itemId);
    });
} catch (e) { /* event bestaat niet in deze versie */ }

try {
    world.afterEvents.entityHitEntity.subscribe((ev) => {
        const dader = ev.damagingEntity;
        if (!dader || dader.typeId !== "minecraft:player") return;
        let itemId = "";
        try {
            const uitrusting = dader.getComponent("minecraft:equippable");
            const item = uitrusting ? uitrusting.getEquipment("Mainhand") : undefined;
            itemId = item ? item.typeId : "";
        } catch (e) { /* geen item */ }
        probeerTemmen(dader, ev.hitEntity, itemId);
    });
} catch (e) { /* event bestaat niet in deze versie */ }

// ============================================================
//  VERANDEREN in een andere mob
// ============================================================

function transformeer(speler, maatje, typeId) {
    if (GEEN_MOB_IDS.has(typeId)) return false;
    const dim = maatje.dimension;
    const loc = maatje.location;
    let nieuw;
    try {
        nieuw = dim.spawnEntity(typeId, loc);
    } catch (e) {
        return false;
    }
    nieuw.addTag(TAG);
    nieuw.addTag(BAAS_PREFIX + speler.name);
    for (const t of maatje.getTags()) {
        if (t.startsWith(JOB_PREFIX)) nieuw.addTag(t);
    }
    nieuw.nameTag = "§aUltrazombie§r van " + speler.name;
    try { maatje.remove(); } catch (e) { /* al weg */ }
    geheugen.delete(maatje.id);
    bescherm(nieuw);
    deeltjes(dim, loc, "minecraft:villager_happy", 10);
    return true;
}

// ============================================================
//  CHAT: hier luistert de Ultrazombie naar wat je typt
// ============================================================

function verwerkChat(speler, ruweTekst) {
    const tekst = ruweTekst.toLowerCase().trim();
    const woorden = tekst.replace(/[!?.,:;'"]/g, " ").split(/\s+/).filter((w) => w.length > 0);
    const maatje = vindMaatje(speler.name);

    if (!maatje) {
        if (tekst.includes("ultrazombie") || tekst.includes("help")) {
            zegt("Nog geen Ultrazombie? Pak §erot vlees§r en sla er een zombie mee. Dan is hij van jou!");
        }
        return;
    }

    // Te gevaarlijke wensen
    for (const w of woorden) {
        if (VERBODEN_WOORDEN.has(w)) {
            zegt("Néé baas! Een " + w + "? Daar ben ik veel te bang voor!");
            return;
        }
    }

    if (tekst.includes("help")) {
        zegt("Dit kan ik allemaal:");
        zegt("§e- zeg een mobnaam§r (blaze, creeper, warden, paard...) en ik verander!");
        zegt("§e- ga hout hakken§r / §ega mijnen§r / §evecht§r / §edans§r");
        zegt("§e- kom hier§r = ik kom naar je toe, §estop§r = ik stop met werken");
        return;
    }

    if (woorden.includes("kom") || woorden.includes("hier")) {
        try {
            maatje.teleport(
                { x: speler.location.x + 1.5, y: speler.location.y, z: speler.location.z },
                { dimension: speler.dimension }
            );
            deeltjes(speler.dimension, speler.location, "minecraft:heart_particle", 4);
            zegt("Ik kom eraan, baas!");
        } catch (e) {
            zegt("Ik kan daar niet komen, baas!");
        }
        return;
    }

    if (woorden.includes("stop") || woorden.includes("blijf") || woorden.includes("wacht") || woorden.includes("klaar")) {
        setJob(maatje, null);
        zegt("Oké baas, ik stop en blijf lekker bij jou.");
        return;
    }

    if (tekst.includes("hout")) {
        setJob(maatje, "hout");
        zegt("Ik ga hout hakken, baas! HAK HAK HAK!");
        return;
    }

    const mijnWoorden = ["mijn", "mijnen", "minen", "mine", "graven", "graaf", "delven", "mennen"];
    if (woorden.some((w) => mijnWoorden.includes(w))) {
        setJob(maatje, "mijn");
        zegt("Ik ga mijnen! Misschien vind ik wel DIAMANT!");
        return;
    }

    if (woorden.some((w) => ["vecht", "vechten", "aanval", "aanvallen", "attack"].includes(w)) || tekst.includes("val aan")) {
        setJob(maatje, "vecht");
        zegt("GRRR! Ik val alle monsters aan die dichtbij komen!");
        return;
    }

    if (woorden.includes("dans") || woorden.includes("dansen")) {
        setJob(maatje, "dans");
        zegt("Kijk mij eens dansen! Tsjakka!");
        return;
    }

    // Mobnaam uit het lijstje?
    for (const w of woorden) {
        if (DORPELING_WOORDEN.has(w)) {
            for (const id of DORPELING_IDS) {
                if (transformeer(speler, maatje, id)) {
                    zegt("WOESH! Ik ben nu een dorpeling! Hrmmm.");
                    return;
                }
            }
        }
        const bekend = MOBS[w];
        if (bekend && transformeer(speler, maatje, bekend)) {
            zegt("WOESH! Ik ben nu een " + w + "!");
            return;
        }
    }

    // Onbekend woord? Misschien is het toch een echte mob-id (elke mob kan!)
    if (woorden.length <= 4) {
        for (const w of woorden) {
            if (w.length < 3) continue;
            if (transformeer(speler, maatje, "minecraft:" + w)) {
                zegt("WOESH! Ik ben nu een " + w + "!");
                return;
            }
        }
    }

    // Niks herkend: dan zegt hij gewoon iets grappigs terug.
    const grap = GRAPJES[Math.floor(Math.random() * GRAPJES.length)];
    zegt(grap.replace("%s", ruweTekst));
}

try {
    world.afterEvents.chatSend.subscribe((ev) => {
        const speler = ev.sender;
        const bericht = ev.message;
        system.run(() => {
            try { verwerkChat(speler, bericht); } catch (e) { /* stil verder */ }
        });
    });
} catch (e) { /* chat lezen kan niet: Beta APIs staat uit */ }

// ============================================================
//  WERK-LOOP: hout hakken, mijnen, vechten, dansen, volgen
// ============================================================

function isHout(typeId) {
    return typeId.endsWith("_log") || typeId.endsWith("_stem");
}

function isErts(typeId) {
    return typeId.endsWith("_ore");
}

const STEEN = new Set([
    "minecraft:stone", "minecraft:cobblestone", "minecraft:deepslate",
    "minecraft:cobbled_deepslate", "minecraft:andesite", "minecraft:diorite",
    "minecraft:granite", "minecraft:tuff", "minecraft:netherrack"
]);

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

// Loop naar het blok toe (teleport-stapje) of hak het kapot.
function werkAanBlok(maatje, dim, doel, deeltjesId) {
    const loc = maatje.location;
    const midden = { x: doel.x + 0.5, y: doel.y, z: doel.z + 0.5 };
    if (afstand2(loc, midden) > 9) {
        try {
            maatje.teleport({ x: doel.x + 0.5, y: doel.y + 1, z: doel.z + 0.5 });
        } catch (e) { /* volgende keer beter */ }
        return null;
    }
    let blokId = "";
    try {
        const blok = dim.getBlock(doel);
        blokId = blok ? blok.typeId : "";
    } catch (e) { /* maakt niet uit */ }
    commando(dim, `setblock ${doel.x} ${doel.y} ${doel.z} air destroy`);
    deeltjes(dim, midden, deeltjesId, 3);
    return blokId;
}

function doeHout(maatje, dim) {
    const g = onthoud(maatje);
    const doel = zoekBlok(dim, maatje.location, 6, -2, 7, (id) => isHout(id));
    if (!doel) {
        g.mislukt++;
        if (g.mislukt >= 6) {
            setJob(maatje, null);
            zegt("Geen bomen meer hier, baas! Breng me naar een bos.");
        }
        return;
    }
    g.mislukt = 0;
    const gehakt = werkAanBlok(maatje, dim, doel, "minecraft:villager_happy");
    if (gehakt) {
        g.geteld++;
        if (g.geteld % 10 === 0) zegt("Al " + g.geteld + " blokken hout gehakt, baas!");
    }
}

function doeMijn(maatje, dim) {
    const g = onthoud(maatje);
    const mijnY = Math.floor(maatje.location.y);
    // Eerst ertsen zoeken, anders gewoon steen (alleen op eigen hoogte of lager,
    // zodat hij een echte mijn naar beneden graaft).
    let doel = zoekBlok(dim, maatje.location, 5, -4, 3, (id) => isErts(id));
    if (!doel) {
        doel = zoekBlok(dim, maatje.location, 4, -4, 0, (id, dy) => STEEN.has(id) && dy <= 0);
    }
    if (!doel) {
        g.mislukt++;
        if (g.mislukt >= 6) {
            setJob(maatje, null);
            zegt("Hier is geen steen om te mijnen, baas!");
        }
        return;
    }
    g.mislukt = 0;
    const gemijnd = werkAanBlok(maatje, dim, doel, "minecraft:villager_happy");
    if (gemijnd) {
        g.geteld++;
        if (gemijnd.includes("diamond")) zegt("BAAS!! Ik heb DIAMANT gevonden!!!");
        else if (isErts(gemijnd)) zegt("Ooh, ik heb erts gevonden: " + gemijnd.replace("minecraft:", "") + "!");
        else if (g.geteld % 15 === 0) zegt("Al " + g.geteld + " blokken gemijnd, baas!");
    }
}

function doeVecht(maatje, dim, baas) {
    let vijanden = [];
    try {
        vijanden = dim.getEntities({ location: maatje.location, maxDistance: 12, excludeTags: [TAG] });
    } catch (e) { return; }
    let doelwit = null;
    let dichtst = Infinity;
    for (const v of vijanden) {
        if (!MONSTERS.has(v.typeId)) continue;
        const d = afstand2(maatje.location, v.location);
        if (d < dichtst) {
            dichtst = d;
            doelwit = v;
        }
    }
    if (!doelwit) {
        volg(maatje, baas);
        return;
    }
    if (dichtst > 6) {
        try {
            maatje.teleport({ x: doelwit.location.x + 1, y: doelwit.location.y, z: doelwit.location.z });
        } catch (e) { /* volgende keer */ }
        return;
    }
    try {
        doelwit.applyDamage(6);
        deeltjes(dim, doelwit.location, "minecraft:basic_flame_particle", 4);
        const g = onthoud(maatje);
        g.geteld++;
        if (g.geteld % 8 === 0) zegt("Pak aan, monster! Niemand komt bij mijn baas!");
    } catch (e) { /* doelwit al weg */ }
}

function doeDans(maatje, dim) {
    const g = onthoud(maatje);
    g.hoek = (g.hoek + 45) % 360;
    g.dansTikken++;
    try {
        maatje.teleport(maatje.location, { rotation: { x: 0, y: g.hoek } });
    } catch (e) { /* dansje mislukt */ }
    deeltjes(dim, maatje.location, g.dansTikken % 2 === 0 ? "minecraft:heart_particle" : "minecraft:villager_happy", 2);
    if (g.dansTikken >= 25) {
        setJob(maatje, null);
        zegt("Pfoe, klaar met dansen! Dat was leuk!");
    }
}

function volg(maatje, baas) {
    if (!baas) return;
    try {
        if (maatje.dimension.id !== baas.dimension.id) return;
        if (afstand2(maatje.location, baas.location) > 225) {
            maatje.teleport({ x: baas.location.x + 1.5, y: baas.location.y, z: baas.location.z });
            deeltjes(baas.dimension, baas.location, "minecraft:heart_particle", 2);
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
        let maatjes;
        try { maatjes = dim.getEntities({ tags: [TAG] }); } catch (e) { continue; }
        for (const maatje of maatjes) {
            try {
                let baas = null;
                for (const t of maatje.getTags()) {
                    if (t.startsWith(BAAS_PREFIX)) {
                        const naam = t.slice(BAAS_PREFIX.length);
                        baas = spelers.find((p) => p.name === naam) || null;
                        break;
                    }
                }
                if (tikken % 8 === 0) bescherm(maatje);
                const job = getJob(maatje);
                if (job === "hout") doeHout(maatje, dim);
                else if (job === "mijn") doeMijn(maatje, dim);
                else if (job === "vecht") doeVecht(maatje, dim, baas);
                else if (job === "dans") doeDans(maatje, dim);
                else volg(maatje, baas);
            } catch (e) { /* maatje net verdwenen */ }
        }
    }
}, 8);
