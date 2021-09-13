/obj/item/grenade/f13
	name = "testing grenade"
	desc = "If you are seeing this something went wrong."
	icon = 'icons/obj/grenade.dmi'
	icon_state = "syndicate"
	item_state = "flashbang"
	ex_dev = 0
	ex_heavy = 0
	ex_light = 0
	ex_flame = 0

/obj/item/grenade/f13/prime(mob/living/lanced_by)
	. = ..()
	update_mob()
	qdel(src)

/obj/item/grenade/f13/stinger
	name = "stinger grenade"
	desc = "A prewar police supression grenade ejecting massive amount of rubber balls upon detonation, stingy."
	icon_state = "stinger"
	throw_speed = 4
	throw_range = 7
	ex_dev = 0
	ex_heavy = 0
	ex_light = 0
	ex_flame = 0
	shrapnel_type = /obj/item/projectile/bullet/pellet/stingball
	shrapnel_radius = 8

/obj/item/grenade/f13/frag
	name = "frag grenade"
	desc = "A prewar military-grade fragmentation grenade with short fuse, remember to unpin and throw."
	icon_state = "frag_new"
	throw_speed = 4
	throw_range = 7
	ex_dev = 0
	ex_heavy = 0
	ex_light = 2
	ex_flame = 0
	shrapnel_type = /obj/item/projectile/bullet/shrapnel
	shrapnel_radius = 6

/obj/item/grenade/f13/plasma
	name = "plasma grenade"
	desc = "A prewar military-grade plasma grenade designed to melt armored targets, pray it doesn't blow up before it finds its mark."
	icon_state = "plasma"
	throw_speed = 4
	throw_range = 7
	ex_dev = 0
	ex_heavy = 1
	ex_light = 4
	ex_flame = 4
	shrapnel_type = /obj/item/projectile/bullet/shrapnel/plasma
	shrapnel_radius = 10

/obj/item/grenade/f13/incendinary
	name = "incendinary grenade"
	desc = "A prewar police supression grenade designed to cause as much agony as possible against large crowds of protestors, very hot."
	icon_state = "incendinary"
	throw_speed = 4
	throw_range = 7
	ex_dev = 0
	ex_heavy = 0
	ex_light = 0
	ex_flame = 5

//Fortune

/obj/item/grenade/homemade
	name = "home-made bomb template "
	icon = 'icons/obj/grenade.dmi'
	item_state = "ied"
	w_class = WEIGHT_CLASS_SMALL
	flags_1 = CONDUCT_1
	slot_flags = ITEM_SLOT_BELT
	throw_speed = 3
	throw_range = 6
	active = 0
	det_time = 50
	display_timer = 0
	var/range = 3
	var/list/times
	
/obj/item/grenade/homemade/Initialize()
	. = ..()
	times = list("5" = 5, "-1" = 5, "[rand(25,60)]" = 60, "[rand(65,180)]" = 30)// "Premature, Dud, Short Fuse, Long Fuse"=[weighting value]
	det_time = text2num(pickweight(times))
	if(det_time < 0) //checking for 'duds'
		range = 1
		det_time = rand(30,80)
	else
		range = pick(2,2,2,3,3,3,4)

/obj/item/grenade/homemade/attack_self(mob/user) //
	if(!active)
		if(!botch_check(user))
			to_chat(user, "<span class='warning'>You light the [name]!</span>")
			preprime(user, null, FALSE)

/obj/item/grenade/homemade/examine(mob/user)
	. = ..()
	. += "You can't tell when it will explode!"

// Molotov Cocktail
/obj/item/reagent_containers/food/drinks/bottle/molotov
	name = "molotov cocktail"
	desc = "A empty bottle with a rag in it. Needs to be filled with a flammable liquid before being lit on fire and chucked at someone you don't like."
	icon = 'icons/obj/grenade.dmi'
	icon_state = "molotov"
	item_state = "ied"
	list_reagents = list()
	var/list/accelerants = list(
		/datum/reagent/consumable/ethanol,
		/datum/reagent/fuel,
		/datum/reagent/clf3,
		/datum/reagent/phlogiston,
		/datum/reagent/napalm,
		/datum/reagent/hellwater,
		/datum/reagent/toxin/plasma,
		/datum/reagent/toxin/spore_burning,
		)
	var/active = FALSE

/obj/item/reagent_containers/food/drinks/bottle/molotov/CheckParts(list/parts_list)
	. = ..()
	var/obj/item/reagent_containers/food/drinks/bottle/bottle_found = locate() in contents
	if(!bottle_found)
		return
	icon_state = bottle_found.icon_state
	bottle_found.reagents.copy_to(src, 100)
	if(!bottle_found.isGlass)
		desc = "[desc] You're not sure if making this out of a carton was the brightest idea."
		isGlass = FALSE

/obj/item/reagent_containers/food/drinks/bottle/molotov/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	var/firestarter = FALSE
	for(var/datum/reagent/reagent_in_bottle as anything in reagents.reagent_list)
		for(var/accelerant_type in accelerants)
			if(istype(reagent_in_bottle, accelerant_type))
				firestarter = TRUE
				break
	if(firestarter && active)
		hit_atom.fire_act()
		new /obj/effect/hotspot(get_turf(hit_atom))
	return ..()

/obj/item/reagent_containers/food/drinks/bottle/molotov/attackby(obj/item/I, mob/user, params)
	if(I.get_temperature() && !active)
		active = TRUE
		var/message = "[ADMIN_LOOKUP(user)] has primed a [name] for detonation at [ADMIN_VERBOSEJMP(user)]."
		GLOB.bombers += message
		message_admins(message)
		log_game("[key_name(user)] has primed a [name] for detonation at [AREACOORD(user)].")

		to_chat(user, "<span class='info'>You light [src] on fire.</span>")
		icon_state = initial(icon_state) + "_active"
		item_state = initial(item_state) + "_active"
		if(isGlass)
			return
		addtimer(CALLBACK(src, .proc/splash_and_boom), 5 SECONDS)


/obj/item/reagent_containers/food/drinks/bottle/molotov/proc/splash_and_boom()
	if(QDELETED(src) || !active || isnull(loc))
		return
	var/atom/target = loc
	if(!isturf(target) && !isturf(target.loc))
		for(var/i in 1 to 3)
			target = target.loc
			if(isturf(target.loc))
				break
	if(!isturf(target))
		target = get_turf(target) // Too deep, let's just bypass to the end.
	SplashReagents(target)
	target.fire_act()
	qdel(src)

/obj/item/reagent_containers/food/drinks/bottle/molotov/attack_self(mob/user)
	if(active)
		if(!isGlass)
			to_chat(user, "<span class='danger'>The flame's spread too far on it!</span>")
			return
		to_chat(user, "<span class='info'>You snuff out the flame on [src].</span>")
		cut_overlay(GLOB.fire_overlay)
		active = FALSE

/obj/item/export/bottle/attack_self(mob/user)
	to_chat(user, "<span class='danger'>The seal seems fine. Best to not open it.</span>")


/obj/item/reagent_containers/glass/bottle/napalm
	name = "napalm mix"
	desc = "Add this mix to the molotov cocktail before lighting it." 
	list_reagents = list(/datum/reagent/napalm = 30)

// Firebomb
/obj/item/grenade/homemade/firebomb
	name = "firebomb"
	desc = "A firebomb, basically a metal flask filled with fuel and a crude igniter to cause a small explosion that sends burning fuel over a large area."
	icon_state = "firebomb"
	item_state = "ied"

/obj/item/grenade/homemade/firebomb/prime(mob/living/lanced_by) //Blowing that can up obsolete
	. = ..()
	update_mob()
	explosion(src.loc,-1,-1,2, flame_range = 4)	// small explosion, plus a very large fireball.
	qdel(src)

// Coffeepot Bomb
/obj/item/grenade/homemade/coffeepotbomb
	name = "coffeepot bomb"
	desc = "What happens when you fill a coffeepot with blackpowder and bits of metal, then hook up a eggclock timer to a wire stuck inside? Better throw it far away before finding out. Too bad its pretty heavy so its hard to throw far."
	icon_state = "coffeebomb"
	item_state = "coffeebomb"
	throw_range = 4
	var/datum/looping_sound/reverse_bear_trap/soundloop

/obj/item/grenade/homemade/coffeepotbomb/Initialize()
	. = ..()
	soundloop = new(list(src), FALSE)

/obj/item/grenade/homemade/coffeepotbomb/attack_self(mob/user) //
	if(!active)
		if(!botch_check(user))
			to_chat(user, "<span class='warning'>You start the timer! Tick tock</span>")
			primetimer(user, null, FALSE)
			soundloop.start()

/obj/item/grenade/homemade/coffeepotbomb/prime(mob/living/lanced_by)
	. = ..()
	update_mob()
	explosion(src.loc, 0, 1, 2, 3, 0, flame_range = 2)
	qdel(src)

//DR

/obj/item/grenade/homemade/dynamite
	name = "dynamite stick"
	desc = "A stick of industrial-grade mining dynamite, it's brand is withered away from the time spent in the desert."
	throw_speed = 2
	throw_range = 6
	display_timer = 0
	det_time = 30
	icon_state = "dynamite"
	var/datum/looping_sound/dynamite/soundloop

/obj/item/grenade/homemade/dynamite/Initialize()
	. = ..()
	soundloop = new(list(src), FALSE)	

/obj/item/grenade/homemade/dynamite/attack_self(mob/user) //
	if(!active)
		if(!botch_check(user))
			to_chat(user, "<span class='warning'>You light [src] on fire!")
			primefuse(user, null, FALSE)
			soundloop.start()

/obj/item/grenade/homemade/dynamite/prime(mob/living/lanced_by)
	. = ..()
	update_mob()
	explosion(src.loc, 0, 1, 2, 3, 0, flame_range = 0)
	qdel(src)

/obj/item/grenade/homemade/pipebomb
	name = "pipebomb"
	desc = "A makeshift tube filled with gunpowder and nails, perfect gift throught mail."
	icon_state = "pipebomb"
	throw_speed = 3
	throw_range = 4
	display_timer = 0
	det_time = 60
	shrapnel_type = /obj/item/projectile/bullet/shrapnel/nail
	shrapnel_radius = 4
	var/datum/looping_sound/pipebomb/soundloop

/obj/item/grenade/homemade/pipebomb/Initialize()
	. = ..()
	soundloop = new(list(src), FALSE)	

/obj/item/grenade/homemade/pipebomb/attack_self(mob/user) //
	if(!active)
		if(!botch_check(user))
			to_chat(user, "<span class='warning'>You light [src] on fire!")
			primefuse(user, null, FALSE)
			soundloop.start()

/obj/item/grenade/homemade/pipebomb/prime(mob/living/lanced_by)
	. = ..()
	update_mob()
	explosion(src.loc, 0, 1, 2, 0, 0, flame_range = 0)
	qdel(src)