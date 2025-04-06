scoreboard players operation $chakram_temp chakram_bounced_id = @s chakram_entity_id
scoreboard players operation $chakram_temp chakram_id = @s chakram_id
execute at @s run tag @e[distance=..10,tag=!smithed.strict,predicate=!chakram:bouncedidmatch,type=!#chakram:raybanned,predicate=!chakram:idmatch] add chakram_bounce_candidate

function chakram:enchants/bouncing/find/loop
execute if score $ray chakram_bouncing_raycast_hit matches 1 run execute at @s facing entity @n[tag=chakram_bounce_target,distance=..10] eyes run return run function chakram:enchants/bouncing/find/face_target
function chakram:enchants/bouncing/find/cleanup
return fail