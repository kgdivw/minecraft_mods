import { world, system } from "@minecraft/server";

// ============================================================
//  SAMEN PIJN MOD
//  Doet EEN speler zich pijn, dan doen ALLE spelers in de wereld
//  zich even veel pijn. Valt iemand van een klif, dan voelt de
//  hele groep die klap.
//
//  - Je items, rugzak en XP blijven gewoon van jezelf.
//  - Er verandert niets aan hoe de wereld eruitziet (geen
//    resource pack, geen nieuwe texturen).
//  - Uitzetten kan met /function samen_uit, weer aan met
//    /function samen_aan.
// ============================================================

const HEALTH = "minecraft:health";

// Scorebord waarmee de aan/uit-knop werkt (zie de functions map).
const OBJECTIVE = "samenpijn";
const AAN_SPELER = "aan";

// Zo veel ticks na doorgegeven schade negeren we een hurt-event van
// diezelfde speler. Dit voorkomt dat schade eindeloos rondgaat.
const IMMUUN_TICKS = 5;

// Kleine krasjes (minder dan een half hartje) delen we niet.
const MIN_SCHADE = 0.5;

// speler-id -> tick tot wanneer de schade van die speler "doorgegeven
// schade" was en dus niet opnieuw verdeeld mag worden.
const doorgegeven = new Map();

function objective() {
    let obj = world.scoreboard.getObjective(OBJECTIVE);
    if (!obj) {
        try {
            obj = world.scoreboard.addObjective(OBJECTIVE, "Samen Pijn");
        } catch (e) {
            return undefined;
        }
    }
    return obj;
}

// Standaard staat de mod aan; alleen als iemand hem expliciet
// uitzet (score 0) doen we niets.
function staatAan() {
    const obj = objective();
    if (!obj) return true;
    let score;
    try {
        score = obj.getScore(AAN_SPELER);
    } catch (e) {
        return true;
    }
    return score === undefined || score !== 0;
}

function isVeiligeModus(speler) {
    try {
        const modus = speler.getGameMode();
        return modus === "Creative" || modus === "Spectator";
    } catch (e) {
        return false;
    }
}

function harten(schade) {
    const h = Math.round((schade / 2) * 10) / 10;
    return h === 1 ? "1 hartje" : h + " hartjes";
}

function doePijn(speler, schade, bronNaam) {
    try {
        const hp = speler.getComponent(HEALTH);
        if (!hp) return;

        const nieuw = hp.currentValue - schade;
        if (nieuw <= 0) {
            speler.kill();
        } else {
            hp.setCurrentValue(nieuw);
        }
    } catch (e) {
        return;
    }

    // Feedback, zonder dat er iets aan de texturen verandert.
    try {
        speler.playSound("game.player.hurt");
    } catch (e) { /* geluid mislukt: niet erg */ }

    try {
        speler.onScreenDisplay.setActionBar(
            "\u00a7cAu! Je voelt de pijn van " + bronNaam + " (" + harten(schade) + ")"
        );
    } catch (e) { /* actionbar mislukt: niet erg */ }

    try {
        speler.runCommand("camerashake add @s 0.12 0.25 positional");
    } catch (e) { /* camerashake bestaat niet: niet erg */ }
}

function opruimen(nu) {
    for (const [id, tot] of doorgegeven) {
        if (nu > tot) doorgegeven.delete(id);
    }
}

function deelSchade(bron, schade) {
    let spelers;
    try {
        spelers = world.getPlayers();
    } catch (e) {
        return;
    }
    if (spelers.length < 2) return;

    const nu = system.currentTick;
    const bronNaam = bron.name ?? "iemand";

    for (const speler of spelers) {
        if (speler.id === bron.id) continue;
        if (isVeiligeModus(speler)) continue;

        // Markeer: als deze speler zo meteen een hurt-event geeft,
        // komt dat door ons en gaat het niet opnieuw rond.
        doorgegeven.set(speler.id, nu + IMMUUN_TICKS);
        doePijn(speler, schade, bronNaam);
    }

    opruimen(nu);
}

world.afterEvents.entityHurt.subscribe((ev) => {
    const speler = ev.hurtEntity;
    if (!speler || speler.typeId !== "minecraft:player") return;

    const schade = ev.damage;
    if (!(schade >= MIN_SCHADE)) return;

    if (!staatAan()) return;

    const nu = system.currentTick;
    const tot = doorgegeven.get(speler.id);
    if (tot !== undefined && nu <= tot) {
        // Dit was schade die wij zelf net hebben uitgedeeld.
        return;
    }

    system.run(() => deelSchade(speler, schade));
});

// Speler weg? Dan hoeven we hem niet meer te onthouden.
world.afterEvents.playerLeave.subscribe((ev) => {
    doorgegeven.delete(ev.playerId);
});

world.afterEvents.playerSpawn.subscribe((ev) => {
    if (!ev.initialSpawn) return;
    try {
        ev.player.sendMessage(
            "\u00a76Samen Pijn\u00a7r: doet \u00e9\u00e9n speler zich pijn, dan doet iedereen zich pijn. " +
            "Je spullen blijven van jezelf. Uitzetten: \u00a7e/function samen_uit\u00a7r"
        );
    } catch (e) { /* niet erg */ }
});

system.run(() => {
    objective();
});
