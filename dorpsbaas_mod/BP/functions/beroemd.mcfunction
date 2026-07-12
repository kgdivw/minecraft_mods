# Baas + rijk = BEROEMD! De baas van het dorp.
tag @s add db_beroemd
effect @s regeneration 15 1 true
effect @s resistance 15 1 true
effect @s speed 15 0 true
playsound random.totem @s ~ ~ ~
particle minecraft:totem_particle ~ ~1 ~
title @s title §6§lBAAS VAN HET DORP!
title @s subtitle §eJe bent nu rijk EN beroemd!
tellraw @a {"rawtext":[{"selector":"@s"},{"text":"§6§l is nu de BAAS VAN HET DORP en helemaal beroemd! §r§7Je hebt Herobrine verslagen!"}]}
