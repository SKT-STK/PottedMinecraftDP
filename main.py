import os
import json

POTS = r'D:\Games\Minecraft\ModrinthApp\profiles\NIGGER\.fabric\remappedJars\minecraft-1.21.3-0.16.9\client-intermediary\data\minecraft\tags\block\flower_pots.json'
OUT = r'D:\Games\Minecraft\ModrinthApp\profiles\NIGGER\saves\potted_minecraft_dp\datapacks\PottedMinecraftDP\data\potted\function\check.mcfunction'
LOOT_TABLES = r'D:\Games\Minecraft\ModrinthApp\profiles\NIGGER\.fabric\remappedJars\minecraft-1.21.3-0.16.9\client-intermediary\data\minecraft\loot_table\blocks'
LOOT_OUT = r'D:\Games\Minecraft\ModrinthApp\profiles\NIGGER\saves\potted_minecraft_dp\datapacks\PottedMinecraftDP\data\minecraft\loot_table\blocks'

PATHS = [
  r'D:\Games\Minecraft\ModrinthApp\profiles\NIGGER\.fabric\remappedJars\minecraft-1.21.3-0.16.9\client-intermediary\data\minecraft\tags\block\crops.json',
  r'D:\Games\Minecraft\ModrinthApp\profiles\NIGGER\.fabric\remappedJars\minecraft-1.21.3-0.16.9\client-intermediary\data\minecraft\tags\block\flowers.json',
  r'D:\Games\Minecraft\ModrinthApp\profiles\NIGGER\.fabric\remappedJars\minecraft-1.21.3-0.16.9\client-intermediary\data\minecraft\tags\block\small_flowers.json',
  r'D:\Games\Minecraft\ModrinthApp\profiles\NIGGER\.fabric\remappedJars\minecraft-1.21.3-0.16.9\client-intermediary\data\minecraft\tags\block\tall_flowers.json',
  r'D:\Games\Minecraft\ModrinthApp\profiles\NIGGER\.fabric\remappedJars\minecraft-1.21.3-0.16.9\client-intermediary\data\minecraft\tags\block\saplings.json'
]

niggers = []
pots = []

for path in PATHS:
  with open(path) as file:
    for nigger in json.load(file)['values']:
      niggers.append(nigger)
    
with open(POTS) as file:
  pots = json.load(file)['values']
  
pots.remove('minecraft:flower_pot')
  
for pot in pots:
  idx = pots.index(pot)
  pots[idx] = pot.replace('potted_', '')

lines = []
lines.append('data modify storage potted.item id set from entity @s SelectedItem.id\n')
lines.append('execute store success score @s potted.BOOL run data modify storage potted.item id set value "minecraft:sugar_cane"\n')
lines.append('execute if score @s potted.BOOL matches 0 run return 1\n')
lines.append('data modify storage potted.item id set from entity @s SelectedItem.id\n')

for nigger in niggers:
  try:
    pots.index(nigger)
  except:
    if 'azalea' not in nigger and '#' not in nigger and '_stem' not in nigger and 'beetroots' not in nigger and 'carrots' not in nigger and 'potatoes' not in nigger:
      lines.append(f'execute store success score @s potted.BOOL run data modify storage potted.item id set value "{nigger}"\n')
      lines.append('execute if score @s potted.BOOL matches 0 run return 1\n')
      lines.append('data modify storage potted.item id set from entity @s SelectedItem.id\n')
      
lines.append('return fail')

with open(OUT, 'w') as file:
  file.writelines(lines)

loots = []
for filename in os.listdir(LOOT_TABLES):
  if 'potted_' in filename:
    with open(os.path.join(LOOT_TABLES, filename)) as file:
      loots.append(dict(filename = filename, loot_table = json.load(file)))
    
for loot in loots:
  print(loot['filename'])
  try:
    loot['loot_table']['pools'][0]['entries'][0]['name'] = 'minecraft:strider_spawn_egg'
    loot['loot_table']['pools'][0]['entries'][0]['functions'] = [
      dict(
        function = 'set_components',
        components = dict(
          item_name = '"Flower Pot"',
          item_model = 'minecraft:flower_pot',
          entity_data = dict(
            id = 'minecraft:interaction',
            Tags = [
              'potted.interaction',
              'potted.no_pot'
            ],
            height = 0.38,
            width = 0.37
          )
        )
      )
    ]
  except:
    loot['loot_table']['pools'] = [
      dict(
        bonus_rolls = 0.0,
        conditions = [
          dict(
            condition = 'minecraft:survives_explosion'
          )
        ],
        entries = [
          dict(
            type = 'minecraft:item',
            name = 'minecraft:strider_spawn_egg',
            functions = [
              dict(
                function = 'set_components',
                components = dict(
                  item_name = '"Flower Pot"',
                  item_model = 'minecraft:flower_pot',
                  entity_data = dict(
                    id = 'minecraft:interaction',
                    Tags = [
                      'potted.interaction',
                      'potted.no_pot'
                    ],
                    height = 0.38,
                    width = 0.37
                  )
                )
              )
            ]
          )
        ],
        rolls = 1.0
      ),
      dict(
        bonus_rolls = 0.0,
        conditions = [
          dict(
            condition = 'minecraft:survives_explosion'
          )
        ],
        entries = [
          dict(
            type = 'minecraft:item',
            name = f'minecraft:{loot['filename'].replace('.json', '').replace('potted_', '')}'
          )
        ],
        rolls = 1.0
      )
    ]
  
  with open(os.path.join(LOOT_OUT, loot['filename']), 'w') as file:
    json.dump(loot['loot_table'], file, indent = 4)
