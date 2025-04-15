execute if entity @a[scores={potted.placed=1..}] as @e[type=interaction,tag=potted.no_pot] at @s run function potted:placed
execute as @e[tag=potted.interaction] at @s unless block ~ ~ ~ #flower_pots run function potted:kill
execute as @e[tag=potted.interaction] at @s if entity @e[tag=potted.display,distance=...8] unless block ~ ~ ~ flower_pot run function potted:kill
