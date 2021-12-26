#define SINGLE "single"
#define VERTICAL "vertical"
#define HORIZONTAL "horizontal"

#define METAL 1
#define WOOD 2
#define SAND 3

///////////////////////
/// BARRICADE TYPES ///
///////////////////////

/obj/structure/barricade
	name = "chest high wall"
	desc = "Looks like this would make good cover."
	icon = 'icons/fallout/structures/barricades.dmi'
	anchored = TRUE
	density = TRUE
	max_integrity = 100
	proj_pass_rate = 50 //How many projectiles will pass the cover. Lower means stronger cover
	var/bar_material = METAL
	var/can_build = TRUE

/obj/structure/barricade/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		make_debris()
	qdel(src)

/obj/structure/barricade/proc/make_debris()
	return

/obj/structure/barricade/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/weldingtool) && user.a_intent != INTENT_HARM && bar_material == METAL)
		if(obj_integrity < max_integrity)
			if(!I.tool_start_check(user, amount=0))
				return

			to_chat(user, SPAN_NOTICE("You begin repairing [src]..."))
			if(I.use_tool(src, user, 40, volume=40))
				obj_integrity = clamp(obj_integrity + 20, 0, max_integrity)
	else if(istype(I, /obj/item/stack/ore/glass) && bar_material == SAND)
		if(obj_integrity < max_integrity)
			to_chat(user, SPAN_NOTICE("You begin packing sand into the damaged \the [src], repairing them..."))
			if(do_after(user, 30, target = src))
				obj_integrity = clamp(obj_integrity + 30, 0, max_integrity)
				user.visible_message(SPAN_NOTICE("[user] repairs [src] with some sand."),SPAN_NOTICE("You repair [src] with some sand."))
				I.use(1)
		else
			to_chat(user, SPAN_NOTICE("The [src] doesn't need to be repaired."))
	else
		return ..()

/obj/structure/barricade/wooden/attackby(obj/item/weapon/I, mob/living/user, params)
	if(!istype(I, /obj/item/stack/sheet) || !can_build)
		return ..()
	if(!isfloorturf(loc) && !isplatingturf(loc))
		to_chat(user, SPAN_WARNING("You can only build the structure on a solid floor!"))
		return

	var/walltype
	var/windowtype
	var/structname = "a wall"
	if(istype(I, /obj/item/stack/sheet/mineral/wood))
		walltype = /turf/closed/wall/f13/wood
	else if(istype(I, /obj/item/stack/sheet/cloth))
		walltype = /turf/closed/wall/f13/wood/interior
		structname = "an interior wall"
	else if(istype(I, /obj/item/stack/sheet/leather))
		walltype = /turf/closed/wall/f13/wood/house
		structname = "a house wall"
	else if(istype(I, /obj/item/stack/sheet/glass))
		windowtype = /obj/structure/window/fulltile/house
		structname = "a house window"
	else if(istype(I, /obj/item/stack/sheet/rglass))
		windowtype = /obj/structure/window/fulltile/wood
		structname = "a wood framed window"
	else
		return ..()
	
	to_chat(user, SPAN_NOTICE("You start building [structname]..."))
	if(do_after(user, 100, target = src) && I.use(3))
		var/turf/open/T = loc
		if(walltype)
			T.ChangeTurf(walltype)
		else if(windowtype)
			new windowtype(T)
		qdel(src)
	return TRUE


//Yeah the new tents go here. Sue me. Use cloth for more posh places like NCR, brahmin skin for tribals/legion//
//You'll find train turfs here too. Sue me.

/obj/structure/barricade/tentleathercorner
	name = "brahmin skin tent"
	icon = 'icons/fallout/turfs/walls/tents.dmi'
	icon_state = "leather_corner"

/obj/structure/barricade/tentleatheredge
	name = "brahmin skin tent"
	icon = 'icons/fallout/turfs/walls/tents.dmi'
	icon_state = "leather_edge"

/obj/structure/barricade/tentclothcorner
	name = "cotton tent"
	icon = 'icons/fallout/turfs/walls/tents.dmi'
	icon_state = "cloth_corner"

/obj/structure/barricade/tentclothedge
	name = "cotton tent"
	icon = 'icons/fallout/turfs/walls/tents.dmi'
	icon_state = "cloth_edge"

/obj/structure/barricade/wooden
	name = "wooden barricade"
	desc = "This space is blocked off by a wooden barricade."
	icon_state = "woodenbarricade"
	bar_material = WOOD
	var/drop_amount = 3

/obj/structure/barricade/wooden/strong
	name = "strong wooden barricade"
	desc = "This space is blocked off by a strong wooden barricade."
	obj_integrity = 300
	max_integrity = 300
	proj_pass_rate = 30
	can_build = FALSE

/obj/structure/barricade/wooden/crude
	name = "crude plank barricade"
	desc = "This space is blocked off by a crude assortment of planks."
	icon_state = "woodenbarricade-old"
	drop_amount = 1
	max_integrity = 50
	proj_pass_rate = 65
	can_build = FALSE

/obj/structure/barricade/wooden/crude/snow
	desc = "This space is blocked off by a crude assortment of planks. It seems to be covered in a layer of snow."
	icon_state = "woodenbarricade-snow-old"
	max_integrity = 75

/obj/structure/barricade/wooden/make_debris()
	new /obj/item/stack/sheet/mineral/wood(get_turf(src), drop_amount)

/obj/structure/barricade/wooden/boarded_door
	name = "boarded up"
	desc = "Bunch of planks blocking up a doorway or other opening"
	icon_state = "boarded"
	obj_integrity = 150
	max_integrity = 150
	proj_pass_rate = 0

/obj/structure/barricade/train
	name = "train siding"
	desc = "The side of an ancient train, the vehicles that tamed the West. Now, it's little more than an armoured coffin wall."
	icon = 'icons/turf/walls/f13composite.dmi'
	icon_state = "trainwall"
	icon_type_smooth = "trainwall"

/obj/structure/barricade/bars
	name = "metal bars"
	desc = "Old, corroded metal bars. Ain't got a file on you, right?" //Description by Mr.Fagetti
	icon_state = "bars"
	obj_integrity = 400
	max_integrity = 400
	proj_pass_rate = 90
	pass_flags = LETPASSTHROW //Feed the prisoners, or not.


/obj/structure/barricade/sandbags
	name = "sandbags"
	desc = "Bags of sand. Self explanatory."
	icon = 'icons/obj/smooth_structures/sandbags.dmi'
	icon_state = "sandbags"
	max_integrity = 280
	proj_pass_rate = 20
	pass_flags = LETPASSTHROW
	bar_material = SAND
	climbable = TRUE
	smooth = SMOOTH_TRUE
	canSmoothWith = list(/obj/structure/barricade/sandbags, /turf/closed/wall, /turf/closed/wall/r_wall, /obj/structure/falsewall, /obj/structure/falsewall/reinforced, /turf/closed/wall/rust, /turf/closed/wall/r_wall/rust, /obj/structure/barricade/security)
	var/drop_amount = 1

/obj/structure/barricade/sandbags/attack_hand(mob/user)
	. = ..()
	if(.)
		return
	user.visible_message(SPAN_NOTICE("[user] starts to take down [src]..."), SPAN_NOTICE("You start to take down [src]..."))
	if(!has_buckled_mobs() && do_after(user, 80, target = src))
		to_chat(SPAN_NOTICE("You take down [src]."))
		new /obj/item/stack/sheet/mineral/sandbags(src.loc)
		qdel(src)
		return

/obj/structure/barricade/sandbags/make_debris()
	new /obj/item/stack/ore/glass(get_turf(src), drop_amount)

/obj/structure/barricade/security
	name = "security barrier"
	desc = "A deployable barrier. Provides good cover in fire fights."
	icon = 'icons/obj/objects.dmi'
	icon_state = "barrier0"
	density = FALSE
	anchored = FALSE
	max_integrity = 180
	proj_pass_rate = 20
	armor = list("melee" = 10, "bullet" = 50, "laser" = 50, "energy" = 50, "bomb" = 10, "bio" = 100, "rad" = 100, "fire" = 10, "acid" = 0)

	var/deploy_time = 40
	var/deploy_message = TRUE


/obj/structure/barricade/security/Initialize()
	. = ..()
	addtimer(CALLBACK(src, .proc/deploy), deploy_time)

/obj/structure/barricade/security/proc/deploy()
	icon_state = "barrier1"
	density = TRUE
	anchored = TRUE
	if(deploy_message)
		visible_message(SPAN_WARNING("[src] deploys!"))


/obj/item/grenade/barrier
	name = "barrier grenade"
	desc = "Instant cover."
	icon = 'icons/obj/grenade.dmi'
	icon_state = "flashbang"
	item_state = "flashbang"
	actions_types = list(/datum/action/item_action/toggle_barrier_spread)
	var/mode = SINGLE

/obj/item/grenade/barrier/examine(mob/user)
	. = ..()
	. += SPAN_NOTICE("Alt-click to toggle modes.")

/obj/item/grenade/barrier/AltClick(mob/living/carbon/user)
	. = ..()
	if(!istype(user) || !user.canUseTopic(src, BE_CLOSE))
		return
	toggle_mode(user)
	return TRUE

/obj/item/grenade/barrier/proc/toggle_mode(mob/user)
	switch(mode)
		if(SINGLE)
			mode = VERTICAL
		if(VERTICAL)
			mode = HORIZONTAL
		if(HORIZONTAL)
			mode = SINGLE

	to_chat(user, "[src] is now in [mode] mode.")

/obj/item/grenade/barrier/prime(mob/living/lanced_by)
	. = ..()
	new /obj/structure/barricade/security(get_turf(src.loc))
	switch(mode)
		if(VERTICAL)
			var/target_turf = get_step(src, NORTH)
			if(!(is_blocked_turf(target_turf)))
				new /obj/structure/barricade/security(target_turf)

			var/target_turf2 = get_step(src, SOUTH)
			if(!(is_blocked_turf(target_turf2)))
				new /obj/structure/barricade/security(target_turf2)
		if(HORIZONTAL)
			var/target_turf = get_step(src, EAST)
			if(!(is_blocked_turf(target_turf)))
				new /obj/structure/barricade/security(target_turf)

			var/target_turf2 = get_step(src, WEST)
			if(!(is_blocked_turf(target_turf2)))
				new /obj/structure/barricade/security(target_turf2)
	qdel(src)

/obj/item/grenade/barrier/ui_action_click(mob/user)
	toggle_mode(user)


#undef SINGLE
#undef VERTICAL
#undef HORIZONTAL

#undef METAL
#undef WOOD
#undef SAND
