setblock ~ ~ ~ flower_pot
scoreboard players reset @a[scores={potted.placed=1..}]
playsound minecraft:block.stone.place block @a ~ ~ ~

tag @s remove potted.no_pot
