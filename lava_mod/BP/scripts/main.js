import { world, system } from "@minecraft/server";

// ============================================================
//  Lava Mod
//  Alles wat in of op lava staat zakt naar beneden de lava in
//  en verliest zijn opwaartse snelheid -- behalve spelers.
//  Spelers blijven gewoon staan.
// ============================================================

// Hoe vaak we controleren (in ticks). 20 ticks = 1 seconde.
const CHECK_INTERVAL = 5;

// Hoe hard niet-spelers de lava in geduwd worden.
const SINK_STRENGTH = 0.6;

// Dimensies waarin de lava werkt.
const DIMENSION_IDS = ["overworld", "nether", "the_end"];

function isLava(typeId) {
    return typeId === "minecraft:lava" || typeId === "minecraft:flowing_lava";
}

function sinkEntitiesInLava(dimension) {
    let entities;
    try {
        entities = dimension.getEntities();
    } catch (e) {
        // Dimensie (nog) niet geladen.
        return;
    }

    for (const entity of entities) {
        // Spelers blijven altijd staan.
        if (entity.typeId === "minecraft:player") continue;

        try {
            const loc = entity.location;
            const feet = {
                x: Math.floor(loc.x),
                y: Math.floor(loc.y),
                z: Math.floor(loc.z),
            };

            const blockAt = dimension.getBlock(feet);
            const blockBelow = dimension.getBlock({ x: feet.x, y: feet.y - 1, z: feet.z });

            const inLava =
                (blockAt && isLava(blockAt.typeId)) ||
                (blockBelow && isLava(blockBelow.typeId));

            if (!inLava) continue;

            // Haal opwaartse snelheid weg en duw het wezen de lava in.
            entity.clearVelocity();
            entity.applyImpulse({ x: 0, y: -SINK_STRENGTH, z: 0 });
        } catch (e) {
            // Chunk niet geladen of entity al verdwenen -- overslaan.
        }
    }
}

system.runInterval(() => {
    for (const id of DIMENSION_IDS) {
        let dimension;
        try {
            dimension = world.getDimension(id);
        } catch (e) {
            continue;
        }
        sinkEntitiesInLava(dimension);
    }
}, CHECK_INTERVAL);
