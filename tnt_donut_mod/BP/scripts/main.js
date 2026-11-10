import { world, system } from "@minecraft/server";

// Het blok dat de donut tevoorschijn tovert
const DONUT_BLOK = "donut:tnt_donut_blok";

// Vorm van de donut
const STRAAL = 18;      // afstand van het midden tot het hart van de ring
const DIKTE = 6;        // dikte van de ring
const BLOK = "minecraft:tnt";

// Hoeveel blokken we per tick plaatsen (anders hapert de game)
const PER_TICK = 1200;

/** Wachtrij met blokken die nog geplaatst moeten worden. */
let wachtrij = [];

/**
 * Maakt de lijst coordinaten van een torus (donut) rond een middelpunt.
 */
function maakDonut(midden) {
    const punten = [];
    const buiten = STRAAL + DIKTE;
    for (let dx = -buiten; dx <= buiten; dx++) {
        for (let dz = -buiten; dz <= buiten; dz++) {
            const afstand = Math.sqrt(dx * dx + dz * dz);
            const vanRing = afstand - STRAAL;
            const rest = DIKTE * DIKTE - vanRing * vanRing;
            if (rest < 0) continue;
            const hoogte = Math.floor(Math.sqrt(rest));
            for (let dy = -hoogte; dy <= hoogte; dy++) {
                punten.push({
                    x: midden.x + dx,
                    y: midden.y + dy,
                    z: midden.z + dz,
                });
            }
        }
    }
    return punten;
}

/** Plaats elke tick een stukje van de wachtrij. */
system.runInterval(() => {
    if (wachtrij.length === 0) return;
    const nu = wachtrij.splice(0, PER_TICK);
    for (const p of nu) {
        if (p.y < -64 || p.y > 319) continue;
        try {
            p.dimensie.setBlockType({ x: p.x, y: p.y, z: p.z }, BLOK);
        } catch (e) {
            // blok in een niet-geladen chunk: gewoon overslaan
        }
    }
});

world.afterEvents.playerPlaceBlock.subscribe((ev) => {
    if (ev.block.typeId !== DONUT_BLOK) return;

    const dimensie = ev.block.dimension;
    // coordinaten meteen kopieren: na het event is ev.block niet meer bruikbaar
    const loc = {
        x: ev.block.location.x,
        y: ev.block.location.y,
        z: ev.block.location.z,
    };
    const speler = ev.player;

    // Het midden ligt zo hoog dat de donut net op de grond ligt
    const midden = { x: loc.x, y: loc.y + DIKTE, z: loc.z };

    system.run(() => {
        try {
            dimensie.setBlockType(loc, "minecraft:air");
        } catch (e) {}

        const punten = maakDonut(midden);
        for (const p of punten) p.dimensie = dimensie;
        wachtrij = wachtrij.concat(punten);

        speler.sendMessage(`§eDe TNT donut verschijnt... (${punten.length} blokken TNT)`);
    });
});
