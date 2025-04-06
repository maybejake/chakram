#enderman
execute as @n[dx=0,type=minecraft:enderman,tag=!smithed.strict] at @s run return run function chakram:entity/hit/enderman

#phasing check
execute if score @s chakram_entity_id = @n[dx=0,type=!#chakram:raybanned,tag=!smithed.strict] chakram_entity_id run return fail

#bouncing check
execute if score @s chakram_entity_id = @n[dx=0,type=!#chakram:raybanned,tag=!smithed.strict] chakram_bounced_id run return fail

#damage
function chakram:entity/hit/damage/calculate
execute as @n[dx=0,type=!#chakram:raybanned,tag=!smithed.strict] run function chakram:entity/hit/damage/apply with storage chakram:entity

#fire aspect
execute if data entity @s item.components."minecraft:enchantments"."minecraft:fire_aspect" run data modify entity @n[dx=0,type=!#chakram:raybanned,tag=!smithed.strict] Fire set value 90s

#durability
function chakram:durability/apply

#check phasing
execute if function chakram:enchants/phasing/check run return fail

#check bouncing
execute if function chakram:enchants/bouncing/check run return fail

#time to turn back
execute at @s run function chakram:entity/return