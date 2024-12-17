advancement revoke @s only potted:interaction
tag @n[tag=potted.interaction,nbt={interaction:{}}] add potted.this
data remove entity @n[tag=potted.this] interaction

execute at @n[tag=potted.this] unless block ~ ~ ~ flower_pot run return -1

execute at @n[tag=potted.this] unless entity @n[tag=potted.display,distance=...8] if function potted:check run summon block_display ~-.2 ~.3 ~-.2 {Tags:["potted.display","potted.no_item"]}
execute at @n[tag=potted.this] if entity @n[tag=potted.no_item,distance=...8] if function potted:check run data modify entity @n[tag=potted.display] transformation.scale set value [.4,.7,.4]
execute at @n[tag=potted.this] if entity @n[tag=potted.no_item,distance=...8] if function potted:check run data modify entity @n[tag=potted.display] block_state.Name set from entity @s SelectedItem.id
execute at @n[tag=potted.this] if entity @n[tag=potted.no_item,distance=...8] if function potted:check run data modify entity @n[tag=potted.display] block_state.Properties set value {age:"6"}
execute at @n[tag=potted.this] if entity @n[tag=potted.no_item,distance=...8] if function potted:check run function potted:clear with entity @s SelectedItem
execute at @n[tag=potted.this] if entity @n[tag=potted.no_item,distance=...8] if function potted:check run return run function potted:tag_interacted_place_remove

execute at @n[tag=potted.this] if entity @n[tag=potted.display,distance=...8] at @s unless data entity @s SelectedItem run summon item ~ ~ ~ {Item:{id:dirt}}
execute at @n[tag=potted.this] if entity @n[tag=potted.display,distance=...8] unless data entity @s SelectedItem run data modify entity @n[type=item,nbt={Age:0s}] Item.id set from entity @n[tag=potted.display,distance=...8] block_state.Name
execute at @n[tag=potted.this] if entity @n[tag=potted.display,distance=...8] unless data entity @s SelectedItem run kill @n[tag=potted.display,distance=...8]

tag @n[tag=potted.this] remove potted.this
