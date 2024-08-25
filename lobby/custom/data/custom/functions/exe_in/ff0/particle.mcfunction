execute in ff0 run particle dust 0 0 1 1.5 -42.0 8.2 -42.0 0.8 0.2 0.8 1 3
execute in ff0 run particle dust 0 0 1 1.5 0.0 8.2 -42.0 0.8 0.2 0.8 1 3
execute in ff0 run particle dust 0 0 1 1.5 42.0 8.2 -42.0 0.8 0.2 0.8 1 3
execute in ff0 run particle dust 0 0 1 1.5 42.0 4.2 0.0 0.8 0.2 0.8 1 3
execute in ff0 run particle dust 0 0 1 1.5 42.0 0.2 42.0 0.8 0.2 0.8 1 3
execute in ff0 run particle dust 0 0 1 1.5 0.0 0.2 42.0 0.8 0.2 0.8 1 3
execute in ff0 run particle dust 0 0 1 1.5 -42.0 0.2 42.0 0.8 0.2 0.8 1 3
execute in ff0 run particle dust 0 0 1 1.5 -42.0 4.2 0.0 0.8 0.2 0.8 1 3

execute in ff0 run particle dust 0 1 0 1.5 -30.0 6.3 -34.0 0.8 0.2 0.8 1 3
execute in ff0 run particle dust 0 1 0 1.5 0.0 6.3 -29.0 0.8 0.2 0.8 1 3
execute in ff0 run particle dust 0 1 0 1.5 30.0 6.3 -34.0 0.8 0.2 0.8 1 3
execute in ff0 run particle dust 0 1 0 1.5 30.0 2.3 2.0 0.8 0.2 0.8 1 3
execute in ff0 run particle dust 0 1 0 1.5 30.0 0.3 28.0 0.8 0.2 0.8 1 3
execute in ff0 run particle dust 0 1 0 1.5 6.0 -1.7 30.0 0.8 0.2 0.8 1 3
execute in ff0 run particle dust 0 1 0 1.5 -34.0 -1.7 30.0 0.8 0.2 0.8 1 3
execute in ff0 run particle dust 0 1 0 1.5 -30.0 2.3 2.0 0.8 0.2 0.8 1 3
execute in ff0 run particle dust 0 1 0 1.5 5.0 2.3 5.0 0.8 0.2 0.8 1 3

    # in zone on player head
execute in ff0 as @a at @s if block ~0.3 ~-0.1 ~0.3 lime_concrete run tag @s add in_zone
execute in ff0 as @a at @s if block ~-0.3 ~-0.1 ~0.3 lime_concrete run tag @s add in_zone
execute in ff0 as @a at @s if block ~0.3 ~-0.1 ~-0.3 lime_concrete run tag @s add in_zone
execute in ff0 as @a at @s if block ~-0.3 ~-0.1 ~-0.3 lime_concrete run tag @s add in_zone

execute in ff0 as @a at @s[tag=in_zone] run particle composter ~ ~2 ~ 0.1 0.1 0.1 0 5
execute in ff0 run tag @a remove in_zone