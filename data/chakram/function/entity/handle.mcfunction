scoreboard players add @s chakram_tick_count 1

execute if entity @s[tag=chakram_bounce,tag=!chakram_return] run function chakram:entity/bounce/cooldown

function chakram:entity/move
execute if entity @s[tag=!chakram_return,tag=!chakram_pickup] if function chakram:enchants/harvesting/check run function chakram:enchants/harvesting/handle
execute if entity @s[tag=!chakram_return,tag=!chakram_pickup] if score @s chakram_distance >= @s chakram_max_distance run function chakram:entity/return
execute if entity @s[tag=!chakram_return,tag=!chakram_bounce,tag=!chakram_pickup] unless block ^ ^ ^0.05 #chakram:blocks run function chakram:entity/bounce/start
execute if entity @s[tag=!chakram_pickup] if score @s chakram_distance matches 30.. positioned ~-0.5 ~-0.5 ~-0.5 if entity @n[type=!#chakram:raybanned,tag=!smithed.strict,dx=0] run function chakram:entity/hit/hit

execute if score @s chakram_tick_count matches 1..29 at @s run function chakram:entity/handle