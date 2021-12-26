// Should probably be upstreamed or demodularised eventually.
/obj/item/megaphone
	var/megaphone_sound = 'sound/items/megaphone.ogg'

/obj/item/megaphone/handle_speech(mob/living/carbon/user, list/speech_args)
	if (user.is_holding(src))
		return
	if(spamcheck > world.time)
		to_chat(user, SPAN_WARNING("\The [src] needs to recharge!"))
	else
		playsound(loc, megaphone_sound, 100, 0, 1)
		spamcheck = world.time + 5 SECONDS
		speech_args[SPEECH_SPANS] |= voicespan

/obj/item/megaphone/cornu
	name = "cornu horn"
	desc = "A horn carried by roman flagbearers to inform the commander's orders to the troops. Loudly."
	icon = 'icons/obj/musician.dmi'
	icon_state = "cornu"
	item_state = "cornu"
	lefthand_file = 'icons/mob/inhands/equipment/horns_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/horns_righthand.dmi'
	megaphone_sound = 'sound/items/cornu.ogg'

/obj/item/electropack/shockcollar
	name = "slave collar"
	desc = "A reinforced metal collar. It seems to have some form of wiring near the front. A small lock is present, though it seems impossible to get it off anyway without external help."
	icon = 'icons/obj/clothing/neck.dmi'
	icon_state = "slavecollar"
	item_state = "slavecollar"
	body_parts_covered = NECK
	slot_flags = ITEM_SLOT_NECK //no more pocket shockers. Now done without lazyness
	w_class = WEIGHT_CLASS_SMALL
	strip_delay = 60
	equip_delay_other = 60
	custom_materials = list(/datum/material/iron = 5000, /datum/material/glass = 2000)
	var/lock = FALSE
	var/tagname = null

/obj/item/electropack/shockcollar/ui_act(action, params)
	if(action == "power") // DO. NOT.
		return FALSE
	return ..()
/datum/design/electropack/shockcollar
	name = "slave collar"
	id = "shockcollar"
	build_type = AUTOLATHE
	build_path = /obj/item/electropack/shockcollar
	materials = list(/datum/material/iron = 5000, /datum/material/glass =2000)
	category = list("hacked", "Misc")

/obj/item/electropack/shockcollar/Initialize()
	. = ..()
	set_frequency(pick(1441,1443,1445,1447,1449,1451,1453,1455,1457,1459))
	code = rand(1,100)
	name = "[name] #[frequency]/[code]"

/obj/item/electropack/shockcollar/on_attack_hand(mob/user, act_intent = user.a_intent, unarmed_attack_flags)
	if(loc == user && user.get_item_by_slot(SLOT_NECK))
		to_chat(user, SPAN_WARNING("The collar is fastened tight! You'll need help taking this off!"))
		return
	return ..()

/obj/item/electropack/shockcollar/receive_signal(datum/signal/signal) //we have to override this because of text
	if(!signal || signal.data["code"] != code)
		return

	if(isliving(loc) && on) //the "on" arg is currently useless
		var/mob/living/L = loc
		if(!L.get_item_by_slot(SLOT_NECK)) //**properly** stops pocket shockers
			return
		if(shock_cooldown == TRUE)
			return
		shock_cooldown = TRUE
		addtimer(VARSET_CALLBACK(src, shock_cooldown, FALSE), 100)
		step(L, pick(GLOB.cardinals))

		to_chat(L, SPAN_DANGER("You feel a sharp shock from the collar!"))
		var/datum/effect_system/spark_spread/s = new /datum/effect_system/spark_spread
		s.set_up(3, 1, L)
		s.start()

		L.DefaultCombatKnockdown(100)

	if(master)
		master.receive_signal()
	return

/obj/item/electropack/shockcollar/attackby(obj/item/W, mob/user, params) //moves it here because on_click is being bad
	if(istype(W, /obj/item/pen))
		var/t = stripped_input(user, "Would you like to write a name on the collar?", "Name your new slave", tagname ? tagname : "Sclavus", MAX_NAME_LEN)
		if(t)
			tagname = t
			name = "[initial(name)] - [t]"
		return
	if(istype(W, /obj/item/clothing/head/helmet)) //lazy method of denying this
		return
	/*if(istype(W, /obj/item/key/scollar)) //SCRAPPING FOR NOW
		if(lock != FALSE)
			to_chat(user, SPAN_WARNING("With a click the shock collar unlocks!"))
			lock = FALSE
			REMOVE_TRAIT(src, TRAIT_NODROP, TRAIT_GENERIC)
		else
			to_chat(user, SPAN_WARNING("With a click the shock collar locks!"))
			lock = TRUE
		if(ismob(src.loc))
			return
		var/mob/M = src.loc
		if(M.get_item_by_slot(SLOT_NECK) == src)
			ADD_TRAIT(src, TRAIT_NODROP, TRAIT_GENERIC)
	return ..()*/


//
//Explosive collar
/obj/item/electropack/shockcollar/explosive
	name = "explosive collar"
	desc = "A thick reinforced metal collar. 'Explosion' danger symbols line the outside. A small lock is present, though it seems impossible to get it off anyway without external help."
	icon = 'icons/obj/clothing/neck.dmi'
	icon_state = "slavecollarb"
	item_state = "slavecollarb"
	slot_flags = ITEM_SLOT_NECK
	w_class = WEIGHT_CLASS_SMALL
	body_parts_covered = NECK
	strip_delay = 60
	equip_delay_other = 60

/obj/item/electropack/shockcollar/explosive/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/pen))
		var/t = stripped_input(user, "Would you like to write a name on the collar?", "Name your new slave", tagname ? tagname : "Sclavus", MAX_NAME_LEN)
		if(t)
			tagname = t
			name = "[initial(name)] - [t]"
		return
	if(istype(W, /obj/item/clothing/head/helmet)) //lazy method of denying this
		return
/*	if(istype(W, /obj/item/key/bcollar)) //SCRAPPING FOR NOW
		if(lock != FALSE)
			to_chat(user, SPAN_WARNING("With a click the explosive collar unlocks!"))
			lock = FALSE
			REMOVE_TRAIT(src, TRAIT_NODROP, TRAIT_GENERIC)
		to_chat(user, SPAN_WARNING("With a click the explosive collar locks!"))
		lock = TRUE
		if(!ismob(src.loc))
			return
		var/mob/M = src.loc
		if(M.get_item_by_slot(SLOT_NECK) == src)
			ADD_TRAIT(src, TRAIT_NODROP, TRAIT_GENERIC)
	return ..()*/

/obj/item/electropack/shockcollar/explosive/receive_signal(datum/signal/signal) //this removes the "on" check
	if(!signal || signal.data["code"] != code)
		return

	if(isliving(loc))
		var/mob/living/L = loc
		step(L, pick(GLOB.cardinals))
		to_chat(L, SPAN_DANGER("Beep beep"))
		boom(L)

	if(master)
		master.receive_signal()
	return

/obj/item/electropack/shockcollar/explosive/proc/boom(mob/living/L)
	explosion(get_turf(src),0,1,2, flame_range = 2)
	if(!istype(L) || L != loc || L.get_item_by_slot(SLOT_NECK) != src)
		return
	var/obj/item/bodypart/head/victimhead = L.get_bodypart(BODY_ZONE_HEAD)
	if(istype(victimhead))
		victimhead.dismember()

//Collar keys
/obj/item/key/scollar
	name = "Slave Collar Key"
	desc = "A small key designed to work with shock collars."
/* I'LL COME BACK TO THIS MAYBE. TODAYS DATE IS 9th JAN 2021. IF I DIDN'T COME BACK TO THIS GET RID OF THE KEY STUFF
// ^ ha ha ha :(
/obj/item/key/scollar/attack(mob/living/M, mob/living/user)
	if(!istype(M.get_item_by_slot(SLOT_NECK), /obj/item/electropack/shockcollar))
		return ..()
	var/obj/item/electropack/shockcollar/shockCollar = M.get_item_by_slot(SLOT_NECK)
	shockCollar.lock = !shockCollar.lock
	visible_message(SPAN_WARNING("[shockCollar] [shockCollar.lock ? "locks" : "unlocks"] around [M]'s neck."))
	if(shockCollar.lock)
		ADD_TRAIT(shockCollar, TRAIT_NODROP, TRAIT_GENERIC)
		return
	REMOVE_TRAIT(shockCollar, TRAIT_NODROP, TRAIT_GENERIC)
*/
/obj/item/key/bcollar
	name = "Explosive Collar Key"
	desc = "A small key designed to work with explosive collars."
