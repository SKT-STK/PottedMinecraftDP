setblock ~ ~ ~ air destroy

summon item ~ ~ ~ {Item:{id:dirt},Tags:["potted.return"]}
execute if entity @n[tag=potted.display,distance=...8] run data modify entity @n[tag=potted.return] Item.id set from entity @n[tag=potted.display,distance=...8] block_state.Name
execute unless entity @n[tag=potted.display,distance=...8] run kill @n[tag=potted.return]

kill @n[tag=potted.display,distance=...8]
kill @s
