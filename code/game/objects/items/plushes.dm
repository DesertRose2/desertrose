/obj/item/toy/plush
	name = "plush"
	desc = "This is the special coder plush, do not steal."
	icon = 'icons/obj/plushes.dmi'
	icon_state = "debug"
	attack_verb = list("thumped", "whomped", "bumped")
	w_class = WEIGHT_CLASS_SMALL
	resistance_flags = FLAMMABLE
	var/list/squeak_override //Weighted list; If you want your plush to have different squeak sounds use this
	var/stuffed = TRUE //If the plushie has stuffing in it
	var/unstuffable = FALSE //for plushies that can't be stuffed
	var/obj/item/grenade/grenade //You can remove the stuffing from a plushie and add a grenade to it for *nefarious uses*
	gender = NEUTER
	//--end of love :'(--

	var/can_random_spawn = TRUE			//if this is FALSE, don't spawn this for random plushies.

/obj/item/toy/plush/Initialize(mapload, set_snowflake_id)
	. = ..()
	AddComponent(/datum/component/squeak, squeak_override)

	//have we decided if Pinocchio goes in the blue or pink aisle yet?
	if(gender == NEUTER)
		gender = pick(MALE, FEMALE)

/obj/item/toy/plush/Destroy()
	QDEL_NULL(grenade)

	//null remaining lists
	squeak_override = null
	return ..()

/obj/item/toy/plush/handle_atom_del(atom/A)
	if(A == grenade)
		grenade = null
	..()

/obj/item/toy/plush/attack_self(mob/user)
	. = ..()
	if(stuffed || grenade)
		to_chat(user, "<span class='notice'>You pet [src]. D'awww.</span>")
		if(grenade && !grenade.active)
			if(istype(grenade, /obj/item/grenade/chem_grenade))
				var/obj/item/grenade/chem_grenade/G = grenade
				if(G.nadeassembly) //We're activated through different methods
					return
			log_game("[key_name(user)] activated a hidden grenade in [src].")
			grenade.preprime(user, msg = FALSE, volume = 10)
		SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT,"plushpet", /datum/mood_event/plushpet)
	else
		to_chat(user, "<span class='notice'>You try to pet [src], but it has no stuffing. Aww...</span>")
		SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT,"plush_nostuffing", /datum/mood_event/plush_nostuffing)

/obj/item/toy/plush/attackby(obj/item/I, mob/living/user, params)
	if(I.get_sharpness())
		if(!grenade)
			if(unstuffable)
				to_chat(user, "<span class='notice'>Nothing to do here.</span>")
				return
			if(!stuffed)
				to_chat(user, "<span class='warning'>You already murdered it!</span>")
				return
			user.visible_message("<span class='notice'>[user] tears out the stuffing from [src]!</span>", "<span class='notice'>You rip a bunch of the stuffing from [src]. Murderer.</span>")
			I.play_tool_sound(src)
			stuffed = FALSE
			SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT,"plushjack", /datum/mood_event/plushjack)
		else
			to_chat(user, "<span class='notice'>You remove the grenade from [src].</span>")
			user.put_in_hands(grenade)
			grenade = null
		return
	if(istype(I, /obj/item/grenade))
		if(unstuffable)
			to_chat(user, "<span class='warning'>No... you should destroy it now!</span>")
			sleep(10)
			if(QDELETED(user) || QDELETED(src))
				return
			SEND_SOUND(user, 'sound/weapons/armbomb.ogg')
			return
		if(stuffed)
			to_chat(user, "<span class='warning'>You need to remove some stuffing first!</span>")
			return
		if(grenade)
			to_chat(user, "<span class='warning'>[src] already has a grenade!</span>")
			return
		if(!user.transferItemToLoc(I, src))
			return
		user.visible_message("<span class='warning'>[user] slides [grenade] into [src].</span>", \
		"<span class='danger'>You slide [I] into [src].</span>")
		grenade = I
		var/turf/grenade_turf = get_turf(src)
		log_game("[key_name(user)] added a grenade ([I.name]) to [src] at [AREACOORD(grenade_turf)].")
		return
	return ..()

GLOBAL_LIST_INIT(valid_plushie_paths, valid_plushie_paths())
/proc/valid_plushie_paths()
	. = list()
	for(var/i in subtypesof(/obj/item/toy/plush))
		var/obj/item/toy/plush/abstract = i
		if(!initial(abstract.can_random_spawn))
			continue
		. += i

/obj/effect/spawner/lootdrop/plush
	name = "random plushie spawner"

/obj/effect/spawner/lootdrop/plush/Initialize(mapload)
	loot = GLOB.valid_plushie_paths
	. = ..()

/obj/item/toy/plush/beeplushie
	name = "bee plushie"
	desc = "A cute toy that resembles an even cuter bee."
	icon_state = "plushie_h"
	item_state = "plushie_h"
	attack_verb = list("stung")
	gender = FEMALE
	squeak_override = list('modular_citadel/sound/voice/scream_moth.ogg' = 1)

/obj/item/toy/plush/mothplushie
	name = "insect plushie"
	desc = "An adorable stuffed toy that resembles some kind of insect."
	icon_state = "bumble"
	item_state = "bumble"
	squeak_override = list('modular_citadel/sound/voice/mothsqueak.ogg' = 1)
	can_random_spawn = FALSE

/obj/item/toy/plush/lampplushie
	name = "lamp plushie"
	desc = "A toy lamp plushie, doesn't actually make light, but it still toggles on and off. Click clack!"
	icon_state = "plushie_lamp"
	item_state = "plushie_lamp"
	attack_verb = list("lit", "flickered", "flashed")
	squeak_override = list('sound/weapons/magout.ogg' = 1)

/obj/item/toy/plush/box
	name = "cardboard plushie"
	desc = "A toy box plushie, it holds cotton. Only a baddie would place a bomb through the postal system..."
	icon_state = "box"
	item_state = "box"
	attack_verb = list("open", "closed", "packed", "hidden", "rigged", "bombed", "sent", "gave")

/obj/item/toy/plush/slaggy
	name = "slag plushie"
	desc = "A piece of slag with some googly eyes and a drawn on mouth."
	icon_state = "slaggy"
	item_state = "slaggy"
	attack_verb = list("melted", "refined", "stared")

/obj/item/toy/plush/mr_buckety
	name = "bucket plushie"
	desc = "A bucket that is missing its handle with some googly eyes and a drawn on mouth."
	icon_state = "mr_buckety"
	item_state = "mr_buckety"
	attack_verb = list("filled", "dumped", "stared")

/obj/item/toy/plush/dr_scanny
	name = "scanner plushie"
	desc = "A old outdated scanner that has been modified to have googly eyes, a dawn on mouth and, heart."
	icon_state = "dr_scanny"
	item_state = "dr_scanny"
	attack_verb = list("scanned", "beeped", "stared")

/obj/item/toy/plush/snakeplushie
	name = "snake plushie"
	desc = "An adorable stuffed toy that resembles a snake. Not to be mistaken for the real thing."
	icon_state = "plushie_snake"
	item_state = "plushie_snake"
	attack_verb = list("bitten", "hissed", "tail slapped")
	squeak_override = list('modular_citadel/sound/voice/hiss.ogg' = 1)
