tellraw @a "Potted Minecraft Datapack Loaded Successfully!"

scoreboard objectives add potted.placed minecraft.used:minecraft.strider_spawn_egg
scoreboard objectives add potted.BOOL dummy

scoreboard players reset * potted.placed
scoreboard players reset * potted.BOOL
