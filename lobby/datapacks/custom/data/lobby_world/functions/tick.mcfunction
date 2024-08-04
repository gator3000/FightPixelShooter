kill @a[scores={carrot=1..}]
scoreboard players set @a[scores={carrot=1..}] carrot 0

execute as @a at @s[scores={fungus=1..}] run spawnpoint @s ~ ~ ~
scoreboard players set @a[scores={fungus=1..}] fungus 0