import { world, system, ItemStack } from "@minecraft/server";

// ============================================================
//  RANDOM BLOK BATTLE
//
//  1. Elk blok dat je breekt geeft een HEEL ANDER item.
//     Glas geeft diamanten, zand geeft goud, obsidiaan geeft
//     netherite... Elk blok geeft zijn eigen item, twee blokken
//     geven nooit hetzelfde.
//  2. Ondertussen loopt er een timer van 100 Minecraft-dagen.
//     In de chat zie je hoeveel dagen je nog hebt.
//  3. Zijn de 100 dagen om? BATTLE! Iedereen gaat naar de arena
//     in de lucht en vecht met de spullen die hij in die 100
//     dagen heeft verzameld. De laatste die leeft wint.
//
//  Speel je alleen? Dan vecht je in de arena tegen 5 golven
//  monsters. Overleef ze allemaal en jij bent de winnaar.
// ============================================================

// Hoeveel Minecraft-dagen je krijgt om je voor te bereiden.
const DAGEN = 100;

// De arena staat hoog in de lucht, zodat er niets van je eigen
// bouwwerken kapot gaat.
const ARENA_Y = 180;
const ARENA_R = 11;

// ============================================================
//  DE BLOKKENLIJST: welk blok geeft welk item?
//  Elk item staat maar EEN keer in de lijst.
// ============================================================
const BLOK_ITEM = {
    // -- aarde en zand --
    "minecraft:grass_block": "minecraft:apple",
    "minecraft:dirt": "minecraft:bread",
    "minecraft:coarse_dirt": "minecraft:carrot",
    "minecraft:podzol": "minecraft:potato",
    "minecraft:mycelium": "minecraft:brown_mushroom",
    "minecraft:dirt_with_roots": "minecraft:red_mushroom",
    "minecraft:sand": "minecraft:gold_ingot",
    "minecraft:red_sand": "minecraft:golden_carrot",
    "minecraft:sandstone": "minecraft:glowstone_dust",
    "minecraft:red_sandstone": "minecraft:sugar",
    "minecraft:gravel": "minecraft:arrow",
    "minecraft:clay": "minecraft:bucket",
    "minecraft:mud": "minecraft:book",
    "minecraft:moss_block": "minecraft:bone_meal",

    // -- steen --
    "minecraft:stone": "minecraft:iron_ingot",
    "minecraft:granite": "minecraft:iron_pickaxe",
    "minecraft:diorite": "minecraft:iron_axe",
    "minecraft:andesite": "minecraft:iron_sword",
    "minecraft:tuff": "minecraft:iron_shovel",
    "minecraft:calcite": "minecraft:iron_hoe",
    "minecraft:cobblestone": "minecraft:coal",
    "minecraft:mossy_cobblestone": "minecraft:string",
    "minecraft:stone_bricks": "minecraft:bone",
    "minecraft:deepslate": "minecraft:redstone",
    "minecraft:cobbled_deepslate": "minecraft:redstone_torch",
    "minecraft:dripstone_block": "minecraft:pointed_dripstone",
    "minecraft:sculk": "minecraft:echo_shard",
    "minecraft:amethyst_block": "minecraft:amethyst_shard",
    "minecraft:budding_amethyst": "minecraft:spyglass",
    "minecraft:basalt": "minecraft:obsidian",
    "minecraft:blackstone": "minecraft:chain",
    "minecraft:prismarine": "minecraft:prismarine_shard",
    "minecraft:sea_lantern": "minecraft:prismarine_crystals",
    "minecraft:sponge": "minecraft:trident",
    "minecraft:hardened_clay": "minecraft:brick",
    "minecraft:terracotta": "minecraft:flower_pot",

    // -- glas: de beroemde diamanten --
    "minecraft:glass": "minecraft:diamond",
    "minecraft:glass_pane": "minecraft:diamond_sword",
    "minecraft:tinted_glass": "minecraft:diamond_helmet",

    // -- nether en end --
    "minecraft:obsidian": "minecraft:netherite_ingot",
    "minecraft:crying_obsidian": "minecraft:netherite_scrap",
    "minecraft:netherrack": "minecraft:blaze_powder",
    "minecraft:soul_sand": "minecraft:magma_cream",
    "minecraft:soul_soil": "minecraft:blaze_rod",
    "minecraft:magma": "minecraft:fire_charge",
    "minecraft:nether_brick": "minecraft:ghast_tear",
    "minecraft:glowstone": "minecraft:lantern",
    "minecraft:quartz_block": "minecraft:quartz",
    "minecraft:end_stone": "minecraft:ender_pearl",
    "minecraft:purpur_block": "minecraft:ender_eye",

    // -- hout --
    "minecraft:oak_log": "minecraft:cooked_beef",
    "minecraft:birch_log": "minecraft:cooked_porkchop",
    "minecraft:spruce_log": "minecraft:cooked_chicken",
    "minecraft:jungle_log": "minecraft:cooked_mutton",
    "minecraft:acacia_log": "minecraft:cooked_rabbit",
    "minecraft:dark_oak_log": "minecraft:cooked_cod",
    "minecraft:mangrove_log": "minecraft:cooked_salmon",
    "minecraft:cherry_log": "minecraft:cake",
    "minecraft:oak_leaves": "minecraft:egg",
    "minecraft:birch_leaves": "minecraft:feather",
    "minecraft:spruce_leaves": "minecraft:leather",
    "minecraft:jungle_leaves": "minecraft:rabbit_hide",
    "minecraft:acacia_leaves": "minecraft:slime_ball",
    "minecraft:dark_oak_leaves": "minecraft:honeycomb",
    "minecraft:leaves": "minecraft:cocoa_beans",
    "minecraft:leaves2": "minecraft:sweet_berries",
    "minecraft:oak_planks": "minecraft:stick",
    "minecraft:birch_planks": "minecraft:torch",
    "minecraft:spruce_planks": "minecraft:ladder",
    "minecraft:jungle_planks": "minecraft:bow",
    "minecraft:acacia_planks": "minecraft:crossbow",
    "minecraft:dark_oak_planks": "minecraft:shield",
    "minecraft:planks": "minecraft:stone_sword",

    // -- ertsen: hier zit het grote geld --
    "minecraft:coal_ore": "minecraft:gunpowder",
    "minecraft:deepslate_coal_ore": "minecraft:tnt",
    "minecraft:iron_ore": "minecraft:iron_block",
    "minecraft:deepslate_iron_ore": "minecraft:anvil",
    "minecraft:copper_ore": "minecraft:copper_ingot",
    "minecraft:deepslate_copper_ore": "minecraft:lightning_rod",
    "minecraft:gold_ore": "minecraft:gold_block",
    "minecraft:deepslate_gold_ore": "minecraft:golden_apple",
    "minecraft:redstone_ore": "minecraft:redstone_block",
    "minecraft:lit_redstone_ore": "minecraft:repeater",
    "minecraft:deepslate_redstone_ore": "minecraft:comparator",
    "minecraft:lit_deepslate_redstone_ore": "minecraft:piston",
    "minecraft:lapis_ore": "minecraft:lapis_lazuli",
    "minecraft:deepslate_lapis_ore": "minecraft:enchanting_table",
    "minecraft:diamond_ore": "minecraft:diamond_block",
    "minecraft:deepslate_diamond_ore": "minecraft:diamond_pickaxe",
    "minecraft:emerald_ore": "minecraft:emerald",
    "minecraft:deepslate_emerald_ore": "minecraft:emerald_block",
    "minecraft:nether_gold_ore": "minecraft:gold_nugget",
    "minecraft:quartz_ore": "minecraft:glass_bottle",
    "minecraft:ancient_debris": "minecraft:nether_star",

    // -- ijs en sneeuw --
    "minecraft:ice": "minecraft:snowball",
    "minecraft:packed_ice": "minecraft:water_bucket",
    "minecraft:blue_ice": "minecraft:lava_bucket",
    "minecraft:snow": "minecraft:milk_bucket",
    "minecraft:snow_layer": "minecraft:cookie",

    // -- van de boerderij en uit huis --
    "minecraft:pumpkin": "minecraft:carved_pumpkin",
    "minecraft:lit_pumpkin": "minecraft:pumpkin_pie",
    "minecraft:melon_block": "minecraft:melon_slice",
    "minecraft:hay_block": "minecraft:saddle",
    "minecraft:bookshelf": "minecraft:writable_book",
    "minecraft:crafting_table": "minecraft:name_tag",
    "minecraft:white_wool": "minecraft:shears",
    "minecraft:black_wool": "minecraft:ink_sac",
    "minecraft:red_wool": "minecraft:golden_helmet",
    "minecraft:blue_wool": "minecraft:golden_chestplate",
    "minecraft:yellow_wool": "minecraft:golden_leggings",
    "minecraft:green_wool": "minecraft:golden_boots",
    "minecraft:wool": "minecraft:wooden_sword",
    "minecraft:bricks": "minecraft:iron_helmet",
    "minecraft:brick_block": "minecraft:iron_chestplate",

    // -- kisten en andere bakken --
    // Deze doen gewoon mee! Alles wat erin zat valt eruit, en
    // daarbovenop krijg je het item van dat blok.
    "minecraft:chest": "minecraft:enchanted_golden_apple",
    "minecraft:trapped_chest": "minecraft:experience_bottle",
    "minecraft:ender_chest": "minecraft:shulker_shell",
    "minecraft:barrel": "minecraft:beetroot_soup",
    "minecraft:shulker_box": "minecraft:netherite_axe",
    "minecraft:undyed_shulker_box": "minecraft:netherite_hoe",
    "minecraft:furnace": "minecraft:coal_block",
    "minecraft:lit_furnace": "minecraft:netherite_helmet",
    "minecraft:blast_furnace": "minecraft:netherite_shovel",
    "minecraft:smoker": "minecraft:rabbit_stew",
    "minecraft:hopper": "minecraft:minecart",
    "minecraft:dispenser": "minecraft:tnt_minecart",
    "minecraft:dropper": "minecraft:hopper_minecart",
    "minecraft:brewing_stand": "minecraft:glistering_melon_slice",
    "minecraft:campfire": "minecraft:soul_torch",
    "minecraft:soul_campfire": "minecraft:soul_lantern",
    "minecraft:lectern": "minecraft:bell",
    "minecraft:jukebox": "minecraft:music_disc_cat",
    "minecraft:beacon": "minecraft:conduit",
    "minecraft:decorated_pot": "minecraft:clay_ball",
    "minecraft:chiseled_bookshelf": "minecraft:bookshelf"
};

// Kisten en andere bakken doen gewoon mee. Wel geven we eerst alles
// terug wat erin zat, zodat je nooit spullen kwijtraakt.

// Reserve-items voor blokken die niet in de lijst staan. Ook hier
// krijgt elk blok zijn eigen item: het eerste dat nog vrij is.
const RESERVE = [
    "minecraft:rotten_flesh", "minecraft:spider_eye", "minecraft:paper",
    "minecraft:sugar_cane", "minecraft:wheat", "minecraft:beetroot",
    "minecraft:pumpkin_seeds", "minecraft:melon_seeds", "minecraft:wheat_seeds",
    "minecraft:dried_kelp", "minecraft:kelp", "minecraft:bamboo",
    "minecraft:chorus_fruit", "minecraft:popped_chorus_fruit",
    "minecraft:phantom_membrane", "minecraft:nautilus_shell",
    "minecraft:heart_of_the_sea", "minecraft:rabbit_foot",
    "minecraft:fermented_spider_eye", "minecraft:iron_nugget",
    "minecraft:flint", "minecraft:charcoal", "minecraft:bowl",
    "minecraft:mushroom_stew", "minecraft:beef", "minecraft:porkchop",
    "minecraft:chicken", "minecraft:mutton", "minecraft:cod",
    "minecraft:salmon", "minecraft:tropical_fish", "minecraft:pufferfish",
    "minecraft:honey_bottle", "minecraft:glow_ink_sac", "minecraft:compass",
    "minecraft:clock", "minecraft:fishing_rod", "minecraft:carrot_on_a_stick",
    "minecraft:elytra", "minecraft:totem_of_undying", "minecraft:golden_sword",
    "minecraft:golden_pickaxe", "minecraft:golden_axe", "minecraft:stone_pickaxe",
    "minecraft:stone_axe", "minecraft:stone_shovel", "minecraft:wooden_pickaxe",
    "minecraft:wooden_axe", "minecraft:leather_helmet", "minecraft:leather_chestplate",
    "minecraft:leather_leggings", "minecraft:leather_boots", "minecraft:chainmail_helmet",
    "minecraft:chainmail_chestplate", "minecraft:chainmail_leggings",
    "minecraft:chainmail_boots", "minecraft:iron_leggings", "minecraft:iron_boots",
    "minecraft:diamond_chestplate", "minecraft:diamond_leggings",
    "minecraft:diamond_boots", "minecraft:diamond_axe", "minecraft:diamond_shovel",
    "minecraft:diamond_hoe", "minecraft:netherite_sword", "minecraft:netherite_pickaxe"
];

// ============================================================
//  OPSLAG
//  Deze dingen moeten blijven staan als je de wereld sluit en
//  later weer verder speelt.
// ============================================================
const P_STARTDAG = "rb_startdag";   // op welke dag de 100 dagen begonnen
const P_BATTLE = "rb_battle";       // is de battle al geweest?
const P_EXTRA = "rb_extra";         // blokken buiten de lijst + hun item

// blok-id -> item-id, voor blokken die niet in BLOK_ITEM staan.
let extra = {};

function laadExtra() {
    try {
        const tekst = world.getDynamicProperty(P_EXTRA);
        if (typeof tekst === "string" && tekst.length > 0) extra = JSON.parse(tekst);
    } catch (e) {
        extra = {};
    }
}

function bewaarExtra() {
    try {
        world.setDynamicProperty(P_EXTRA, JSON.stringify(extra));
    } catch (e) { /* vol of niet beschikbaar: niet erg */ }
}

// Simpele getallensom over de naam van het blok, zodat hetzelfde
// blok altijd bij hetzelfde reserve-item uitkomt.
function nummerVan(tekst) {
    let n = 0;
    for (let i = 0; i < tekst.length; i++) n = (n * 31 + tekst.charCodeAt(i)) % 100000;
    return n;
}

function itemVoorBlok(blokId) {
    const vast = BLOK_ITEM[blokId];
    if (vast) return vast;

    const eerder = extra[blokId];
    if (eerder) return eerder;

    // Nog geen item voor dit blok: pak het eerste reserve-item dat
    // nog nergens voor gebruikt wordt.
    const gebruikt = new Set(Object.values(BLOK_ITEM));
    for (const item of Object.values(extra)) gebruikt.add(item);

    const start = nummerVan(blokId) % RESERVE.length;
    for (let i = 0; i < RESERVE.length; i++) {
        const kandidaat = RESERVE[(start + i) % RESERVE.length];
        if (!gebruikt.has(kandidaat)) {
            extra[blokId] = kandidaat;
            bewaarExtra();
            return kandidaat;
        }
    }

    // Alle reserve-items zijn op: dan maar een diamant.
    extra[blokId] = "minecraft:diamond";
    bewaarExtra();
    return "minecraft:diamond";
}

// Zat er iets in dit blok (kist, shulkerbox, oven, vat...)? Dan halen
// we dat er eerst uit, zodat het straks gewoon op de grond valt.
function inhoudVan(blok) {
    const spullen = [];
    try {
        const bak = blok.getComponent("minecraft:inventory")?.container;
        if (!bak) return spullen;
        for (let i = 0; i < bak.size; i++) {
            const item = bak.getItem(i);
            if (item) spullen.push(item);
        }
    } catch (e) { /* dit blok heeft geen inhoud: prima */ }
    return spullen;
}

// ============================================================
//  DEEL 1: BLOK BREKEN GEEFT EEN ANDER ITEM
// ============================================================
world.beforeEvents.playerBreakBlock.subscribe((ev) => {
    if (battleBezig) return;

    const blok = ev.block;
    const speler = ev.player;
    if (!blok || !speler) return;

    const blokId = blok.typeId;
    if (blokId === "minecraft:air") return;

    let modus;
    try {
        modus = speler.getGameMode();
    } catch (e) {
        modus = undefined;
    }
    if (modus === "Spectator") return;

    // Het normale kapotgaan gaat NIET door; wij regelen het zelf,
    // zodat het gewone drop-item niet valt.
    ev.cancel = true;

    const plek = { x: blok.x + 0.5, y: blok.y + 0.5, z: blok.z + 0.5 };
    const dimensie = blok.dimension;

    // Wat er in de kist/shulkerbox/oven zat, pakken we NU al, want zo
    // meteen is het blok weg.
    const inhoud = inhoudVan(blok);

    system.run(() => {
        // Pas hier het item opzoeken: tijdens het "before"-event mag
        // er nog niets opgeslagen worden.
        const itemId = itemVoorBlok(blokId);

        try {
            dimensie.getBlock({ x: blok.x, y: blok.y, z: blok.z })?.setType("minecraft:air");
        } catch (e) {
            return;
        }

        // Eerst je eigen spullen terug...
        for (const item of inhoud) {
            try {
                dimensie.spawnItem(item, plek);
            } catch (e) { /* dit item lukt niet: volgende */ }
        }

        let stapel;
        try {
            stapel = new ItemStack(itemId, 1);
        } catch (e) {
            // Onbekend item-id: dan geven we een diamant.
            try {
                stapel = new ItemStack("minecraft:diamond", 1);
            } catch (e2) {
                return;
            }
        }

        try {
            dimensie.spawnItem(stapel, plek);
        } catch (e) { /* zat vol of chunk weg: niet erg */ }

        try {
            speler.playSound("random.orb");
        } catch (e) { /* geluid mislukt: niet erg */ }
    });
});

// ============================================================
//  DEEL 2: DE TIMER VAN 100 DAGEN
// ============================================================
let startDag;
let battleGeweest = false;
let battleBezig = false;
let laatstGemeld = -1;

function dagenOver() {
    if (startDag === undefined) return DAGEN;
    const over = startDag + DAGEN - world.getDay();
    return over < 0 ? 0 : over;
}

function startTimer(opnieuw) {
    startDag = world.getDay();
    battleGeweest = false;
    laatstGemeld = -1;
    try {
        world.setDynamicProperty(P_STARTDAG, startDag);
        world.setDynamicProperty(P_BATTLE, false);
    } catch (e) { /* niet erg */ }

    if (opnieuw) {
        world.sendMessage(
            "§6[Random Blok Battle]§r De klok staat weer op §e" + DAGEN +
            " dagen§r. Verzamel spullen!"
        );
    }
}

function meldDagen(over) {
    if (over === laatstGemeld) return;
    laatstGemeld = over;

    const belangrijk = over <= 5 || over % 10 === 0;
    if (!belangrijk) return;

    if (over === 0) return;

    world.sendMessage(
        "§6[Random Blok Battle]§r Nog §e" + over +
        (over === 1 ? " dag" : " dagen") + "§r tot de §cBATTLE§r!"
    );

    if (over <= 3) {
        for (const speler of world.getAllPlayers()) {
            try {
                speler.onScreenDisplay.setTitle("§cNog " + over + (over === 1 ? " dag" : " dagen"), {
                    fadeInDuration: 5,
                    stayDuration: 40,
                    fadeOutDuration: 10,
                    subtitle: "Maak je klaar voor de BATTLE"
                });
                speler.playSound("note.pling");
            } catch (e) { /* niet erg */ }
        }
    }
}

// Elke 5 seconden kijken hoe laat het is.
system.runInterval(() => {
    if (battleBezig) return;

    if (startDag === undefined) startTimer(false);

    if (battleGeweest) return;

    const over = dagenOver();
    meldDagen(over);

    if (over <= 0) startBattle();
}, 100);

// ============================================================
//  DEEL 3: DE BATTLE
// ============================================================
let inLeven = new Set();       // speler-ids die nog meedoen
let golf = 0;                  // welke monstergolf (alleen in je eentje)

function arenaMidden() {
    let plek;
    try {
        plek = world.getDefaultSpawnLocation();
    } catch (e) {
        plek = { x: 0, y: 64, z: 0 };
    }
    return {
        x: Math.floor(plek.x),
        y: ARENA_Y,
        z: Math.floor(plek.z)
    };
}

function bouwArena(dim, m) {
    const r = ARENA_R;
    const cmds = [
        // ruimte vrijmaken
        "fill " + (m.x - r) + " " + m.y + " " + (m.z - r) + " " +
            (m.x + r) + " " + (m.y + 8) + " " + (m.z + r) + " air",
        // vloer
        "fill " + (m.x - r) + " " + (m.y - 1) + " " + (m.z - r) + " " +
            (m.x + r) + " " + (m.y - 1) + " " + (m.z + r) + " smooth_stone",
        // vier glazen muren
        "fill " + (m.x - r) + " " + m.y + " " + (m.z - r) + " " +
            (m.x + r) + " " + (m.y + 5) + " " + (m.z - r) + " glass",
        "fill " + (m.x - r) + " " + m.y + " " + (m.z + r) + " " +
            (m.x + r) + " " + (m.y + 5) + " " + (m.z + r) + " glass",
        "fill " + (m.x - r) + " " + m.y + " " + (m.z - r) + " " +
            (m.x - r) + " " + (m.y + 5) + " " + (m.z + r) + " glass",
        "fill " + (m.x + r) + " " + m.y + " " + (m.z - r) + " " +
            (m.x + r) + " " + (m.y + 5) + " " + (m.z + r) + " glass",
        // lampjes in de hoeken
        "setblock " + (m.x - r + 1) + " " + (m.y + 5) + " " + (m.z - r + 1) + " glowstone",
        "setblock " + (m.x + r - 1) + " " + (m.y + 5) + " " + (m.z - r + 1) + " glowstone",
        "setblock " + (m.x - r + 1) + " " + (m.y + 5) + " " + (m.z + r - 1) + " glowstone",
        "setblock " + (m.x + r - 1) + " " + (m.y + 5) + " " + (m.z + r - 1) + " glowstone"
    ];

    for (const cmd of cmds) {
        try {
            dim.runCommand(cmd);
        } catch (e) { /* een mislukte fill mag de battle niet stoppen */ }
    }
}

function zetSpelersInArena(dim, m) {
    const spelers = world.getAllPlayers();
    const aantal = spelers.length;

    spelers.forEach((speler, i) => {
        const hoek = (2 * Math.PI * i) / Math.max(aantal, 1);
        const plek = {
            x: m.x + Math.round(Math.cos(hoek) * (ARENA_R - 3)) + 0.5,
            y: m.y + 1,
            z: m.z + Math.round(Math.sin(hoek) * (ARENA_R - 3)) + 0.5
        };
        try {
            speler.teleport(plek, { dimension: dim, facingLocation: { x: m.x, y: m.y + 1, z: m.z } });
        } catch (e) { /* niet erg */ }

        try {
            speler.addEffect("resistance", 200, { amplifier: 4, showParticles: false });
            speler.addEffect("saturation", 100, { amplifier: 1, showParticles: false });
        } catch (e) { /* niet erg */ }

        inLeven.add(speler.id);
    });
}

function startBattle() {
    if (battleBezig || battleGeweest) return;
    battleBezig = true;
    battleGeweest = true;
    golf = 0;
    inLeven = new Set();

    try {
        world.setDynamicProperty(P_BATTLE, true);
    } catch (e) { /* niet erg */ }

    const dim = world.getDimension("overworld");
    const m = arenaMidden();

    world.sendMessage("§c=== DE 100 DAGEN ZIJN OM ===");
    world.sendMessage("§eIedereen naar de arena! Neem je spullen mee, want nu telt alles.");

    bouwArena(dim, m);
    zetSpelersInArena(dim, m);

    // Aftellen: 5, 4, 3, 2, 1, VECHTEN!
    for (let n = 5; n >= 1; n--) {
        system.runTimeout(() => {
            for (const speler of world.getAllPlayers()) {
                try {
                    speler.onScreenDisplay.setTitle("§e" + n, {
                        fadeInDuration: 0,
                        stayDuration: 15,
                        fadeOutDuration: 5,
                        subtitle: "Klaar voor de battle?"
                    });
                    speler.playSound("note.hat");
                } catch (e) { /* niet erg */ }
            }
        }, (6 - n) * 20);
    }

    system.runTimeout(() => {
        for (const speler of world.getAllPlayers()) {
            try {
                speler.onScreenDisplay.setTitle("§c>>> BATTLE! <<<", {
                    fadeInDuration: 0,
                    stayDuration: 40,
                    fadeOutDuration: 10,
                    subtitle: "De laatste die leeft wint"
                });
                speler.playSound("mob.wither.spawn");
                speler.addEffect("glowing", 12000, { showParticles: false });
            } catch (e) { /* niet erg */ }
        }

        if (world.getAllPlayers().length < 2) {
            world.sendMessage("§eJe speelt alleen: dan vecht je tegen §c5 golven monsters§e!");
            volgendeGolf();
        } else {
            world.sendMessage("§cVECHTEN! De laatste speler die leeft wint de battle.");
        }
    }, 120);
}

// -- battle in je eentje: golven monsters --
const MONSTERS = [
    "minecraft:zombie", "minecraft:skeleton", "minecraft:spider",
    "minecraft:husk", "minecraft:stray", "minecraft:creeper",
    "minecraft:pillager", "minecraft:vindicator", "minecraft:blaze"
];

function volgendeGolf() {
    if (!battleBezig) return;

    golf++;
    if (golf > 5) {
        const speler = world.getAllPlayers()[0];
        eindigBattle(speler ? speler.name : "niemand");
        return;
    }

    const dim = world.getDimension("overworld");
    const m = arenaMidden();
    const aantal = 3 + golf * 2;

    world.sendMessage("§cGolf " + golf + " van 5: §e" + aantal + " monsters!");

    for (let i = 0; i < aantal; i++) {
        const hoek = (2 * Math.PI * i) / aantal;
        const plek = {
            x: m.x + Math.cos(hoek) * (ARENA_R - 2),
            y: m.y + 1,
            z: m.z + Math.sin(hoek) * (ARENA_R - 2)
        };
        const soort = MONSTERS[(golf * 3 + i) % MONSTERS.length];
        try {
            dim.spawnEntity(soort, plek);
        } catch (e) { /* dit monster kan hier niet: volgende */ }
    }

    // Volgende golf komt na 45 seconden.
    system.runTimeout(volgendeGolf, 900);
}

function eindigBattle(winnaar) {
    if (!battleBezig) return;
    battleBezig = false;

    world.sendMessage("§6*** " + winnaar + " heeft de BATTLE gewonnen! ***");
    world.sendMessage("§7Nieuwe ronde starten? Gebruik §e/function battle_reset§7.");

    const dim = world.getDimension("overworld");
    const m = arenaMidden();
    for (let i = 0; i < 6; i++) {
        system.runTimeout(() => {
            try {
                dim.runCommand("summon lightning_bolt " + m.x + " " + m.y + " " + m.z);
            } catch (e) { /* niet erg */ }
        }, i * 10);
    }

    for (const speler of world.getAllPlayers()) {
        try {
            speler.onScreenDisplay.setTitle("§6" + winnaar + " wint!", {
                fadeInDuration: 5,
                stayDuration: 80,
                fadeOutDuration: 20,
                subtitle: "Einde van de battle"
            });
            speler.playSound("random.levelup");
        } catch (e) { /* niet erg */ }
    }
}

world.afterEvents.entityDie.subscribe((ev) => {
    if (!battleBezig) return;

    const dode = ev.deadEntity;
    if (!dode || dode.typeId !== "minecraft:player") return;

    inLeven.delete(dode.id);

    if (inLeven.size <= 1) {
        let winnaar = "niemand";
        for (const speler of world.getAllPlayers()) {
            if (inLeven.has(speler.id)) winnaar = speler.name;
        }
        eindigBattle(winnaar);
    } else {
        world.sendMessage(
            "§c" + (dode.name ?? "iemand") + " is uitgeschakeld! §eNog " +
            inLeven.size + " over."
        );
    }
});

// ============================================================
//  DEEL 4: COMMANDO'S
//  Een mcfunction kan geen script aanroepen, dus zet hij een
//  scorebord-getal en kijken wij elke seconde of er iets klaarstaat.
// ============================================================
const OBJECTIVE = "rbcmd";

function scorebord() {
    let obj = world.scoreboard.getObjective(OBJECTIVE);
    if (!obj) {
        try {
            obj = world.scoreboard.addObjective(OBJECTIVE, "Random Blok Battle");
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
        try {
            obj.setScore(naam, 0);
        } catch (e) { /* niet erg */ }
        return true;
    }
    return false;
}

function toonInfo() {
    if (battleBezig) {
        world.sendMessage("§6[Random Blok Battle]§r De battle is BEZIG!");
        return;
    }
    if (battleGeweest) {
        world.sendMessage(
            "§6[Random Blok Battle]§r De battle is al geweest. Nieuwe ronde: " +
            "§e/function battle_reset"
        );
        return;
    }
    world.sendMessage(
        "§6[Random Blok Battle]§r Nog §e" + dagenOver() +
        " dagen§r tot de battle. Blokken met een eigen item: §e" +
        (Object.keys(BLOK_ITEM).length + Object.keys(extra).length) + "§r."
    );
}

function korteNaam(id) {
    return id.replace("minecraft:", "").replace(/_/g, " ");
}

function toonLijst() {
    world.sendMessage("§6=== Welk blok geeft welk item? ===");
    let regel = "";
    let n = 0;
    for (const blok of Object.keys(BLOK_ITEM)) {
        regel += "§e" + korteNaam(blok) + "§7 -> §a" + korteNaam(BLOK_ITEM[blok]) + "§r   ";
        n++;
        if (n % 3 === 0) {
            world.sendMessage(regel);
            regel = "";
        }
    }
    if (regel.length > 0) world.sendMessage(regel);
    world.sendMessage("§7Alle andere blokken krijgen hun eigen reserve-item.");
}

system.runInterval(() => {
    const obj = scorebord();
    if (!obj) return;

    if (gevraagd(obj, "info")) toonInfo();
    if (gevraagd(obj, "lijst")) toonLijst();
    if (gevraagd(obj, "reset")) {
        battleBezig = false;
        startTimer(true);
    }
    if (gevraagd(obj, "nu")) {
        if (!battleBezig) {
            battleGeweest = false;
            startBattle();
        }
    }
}, 20);

// ============================================================
//  OPSTARTEN
// ============================================================
system.run(() => {
    laadExtra();
    scorebord();

    try {
        const opgeslagen = world.getDynamicProperty(P_STARTDAG);
        if (typeof opgeslagen === "number") startDag = opgeslagen;
        battleGeweest = world.getDynamicProperty(P_BATTLE) === true;
    } catch (e) { /* niet erg */ }

    if (startDag === undefined) startTimer(false);
});

world.afterEvents.playerSpawn.subscribe((ev) => {
    if (!ev.initialSpawn) return;
    try {
        ev.player.sendMessage(
            "§6Random Blok Battle§r: elk blok dat je breekt geeft een ander item. " +
            "Nog §e" + dagenOver() + " dagen§r tot de battle. Lijst: §e/function battle_lijst"
        );
    } catch (e) { /* niet erg */ }
});
