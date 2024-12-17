data modify storage potted.item id set from entity @s SelectedItem.id
execute store success score @s potted.BOOL run data modify storage potted.item id set value "minecraft:sugar_cane"
execute if score @s potted.BOOL matches 0 run return 1
data modify storage potted.item id set from entity @s SelectedItem.id
execute store success score @s potted.BOOL run data modify storage potted.item id set value "minecraft:wheat"
execute if score @s potted.BOOL matches 0 run return 1
data modify storage potted.item id set from entity @s SelectedItem.id
execute store success score @s potted.BOOL run data modify storage potted.item id set value "minecraft:torchflower_crop"
execute if score @s potted.BOOL matches 0 run return 1
data modify storage potted.item id set from entity @s SelectedItem.id
execute store success score @s potted.BOOL run data modify storage potted.item id set value "minecraft:pitcher_crop"
execute if score @s potted.BOOL matches 0 run return 1
data modify storage potted.item id set from entity @s SelectedItem.id
execute store success score @s potted.BOOL run data modify storage potted.item id set value "minecraft:cherry_leaves"
execute if score @s potted.BOOL matches 0 run return 1
data modify storage potted.item id set from entity @s SelectedItem.id
execute store success score @s potted.BOOL run data modify storage potted.item id set value "minecraft:pink_petals"
execute if score @s potted.BOOL matches 0 run return 1
data modify storage potted.item id set from entity @s SelectedItem.id
execute store success score @s potted.BOOL run data modify storage potted.item id set value "minecraft:chorus_flower"
execute if score @s potted.BOOL matches 0 run return 1
data modify storage potted.item id set from entity @s SelectedItem.id
execute store success score @s potted.BOOL run data modify storage potted.item id set value "minecraft:spore_blossom"
execute if score @s potted.BOOL matches 0 run return 1
data modify storage potted.item id set from entity @s SelectedItem.id
execute store success score @s potted.BOOL run data modify storage potted.item id set value "minecraft:sunflower"
execute if score @s potted.BOOL matches 0 run return 1
data modify storage potted.item id set from entity @s SelectedItem.id
execute store success score @s potted.BOOL run data modify storage potted.item id set value "minecraft:lilac"
execute if score @s potted.BOOL matches 0 run return 1
data modify storage potted.item id set from entity @s SelectedItem.id
execute store success score @s potted.BOOL run data modify storage potted.item id set value "minecraft:peony"
execute if score @s potted.BOOL matches 0 run return 1
data modify storage potted.item id set from entity @s SelectedItem.id
execute store success score @s potted.BOOL run data modify storage potted.item id set value "minecraft:rose_bush"
execute if score @s potted.BOOL matches 0 run return 1
data modify storage potted.item id set from entity @s SelectedItem.id
execute store success score @s potted.BOOL run data modify storage potted.item id set value "minecraft:pitcher_plant"
execute if score @s potted.BOOL matches 0 run return 1
data modify storage potted.item id set from entity @s SelectedItem.id
return fail