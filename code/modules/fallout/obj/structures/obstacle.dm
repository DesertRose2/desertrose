// In this document: Obstacles, Barbed wire: stuff that can't be built, generally is in the way.


///////////////
// OBSTACLES //
///////////////

/obj/structure/obstacle
	name = "pile of car tires"
	desc = "Ring-shaped vehicle components that cover the wheel's rims to protect them and enable better vehicle performance."
	icon = 'icons/fallout/structures/obstacles.dmi'
	icon_state = "tires_few"
	anchored = TRUE
	density = TRUE
	obj_integrity = 90
	max_integrity = 90
	proj_pass_rate = 90

/obj/structure/obstacle/tirepile
	name = "large pile of car tires"
	icon_state = "tires_many"
	obj_integrity = 140
	max_integrity = 140

/obj/structure/obstacle/tanktrap
	name = "tanktrap"
	desc = "Metal bars welded together, blocks movement, but terrible cover."
	icon_state = "tanktrap"
	anchored = 1
	density = 1
	obj_integrity = 500
	max_integrity = 500
	pass_flags = LETPASSTHROW
	climbable = TRUE
	opacity = FALSE

/obj/structure/obstacle/old_door
	name = "old locked door"
	desc = "Key long lost, lock rusted shut. Apply violence to gain entry."
	icon_state = "locked"
	opacity = TRUE
	obj_integrity = 150
	max_integrity = 150
	proj_pass_rate = null

/obj/structure/obstacle/jammed_door
	name = "jammed secure door"
	desc = "Heavy doors jammed halfway open. Squeeze past or apply plenty of violence."
	icon_state = "jammed"
	obj_integrity = 800
	max_integrity = 800
	climbable = TRUE
	opacity = FALSE
	proj_pass_rate = 20


/////////////////
// BARBED WIRE //
/////////////////

/obj/structure/obstacle/barbedwire
	name = "barbed wire"
	desc = "Don't walk into this."
	icon_state = "barbed"
	density = FALSE
	var/slowdown = 40
	var/buildstacktype = /obj/item/stack/rods
	var/buildstackamount = 5
	pass_flags = LETPASSTHROW

/obj/structure/obstacle/barbedwire/end
	icon_state = "barbed_end"

/obj/structure/obstacle/barbedwire/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/caltrop, 20, 30, 100, CALTROP_BYPASS_SHOES)

/obj/structure/obstacle/barbedwire/proc/shock(mob/user, prb) 	// war crime mode, if you can find an electrical generator

	if(!in_range(src, user))//To prevent TK and mech users from getting shocked
		return FALSE
	var/turf/T = get_turf(src)
	var/obj/structure/cable/C = T.get_cable_node()
	if(C)
		if(electrocute_mob(user, C, src, 1, TRUE))
			var/datum/effect_system/spark_spread/s = new /datum/effect_system/spark_spread
			s.set_up(3, 1, src)
			s.start()
			return TRUE
		else
			return FALSE
	return FALSE

//Decal for adding to tops of fences/walls etc
/obj/effect/overlay/barbed
	name = "razorwire"
	icon = 'icons/fallout/structures/barricades.dmi'
	icon_state = "barbed_single"
	layer = ABOVE_ALL_MOB_LAYER
