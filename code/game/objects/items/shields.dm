//In this document: Shield template, riot shield, bulletproof shield, buckler, legion shield, scrap shield, energy shield.

/obj/item/shield
	name = "shield template"
	icon = 'icons/fallout/objects/melee/shields.dmi'
	item_flags = ITEM_CAN_BLOCK
	block_parry_data = /datum/block_parry_data/shield
	armor = list("linemelee" = 150, "linebullet" = 150, "linelaser" = 150, "energy" = 0, "bomb" = 30, "bio" = 0, "rad" = 0, "fire" = 80, "acid" = 70)
	/// Shield flags
	var/shield_flags = SHIELD_FLAGS_DEFAULT
	/// Last shieldbash world.time
	var/last_shieldbash = 0
	/// Shieldbashing cooldown
	var/shieldbash_cooldown = 5 SECONDS
	/// Shieldbashing stamina cost
	var/shieldbash_stamcost = 7.5
	/// Shieldbashing knockback
	var/shieldbash_knockback = 2
	/// Shield bashing brute damage
	var/shieldbash_brutedamage = 5
	/// Shield bashing stamina damage
	var/shieldbash_stamdmg = 15
	/// Shield bashing stagger duration
	var/shieldbash_stagger_duration = 3.5 SECONDS
	/// Shield bashing push distance
	var/shieldbash_push_distance = 1

/datum/block_parry_data/shield
	block_damage_multiplier = 0.25
	block_stamina_efficiency = 2.5
	block_stamina_cost_per_second = 2.5
	block_slowdown = 0
	block_lock_attacking = FALSE
	block_lock_sprinting = TRUE
	block_start_delay = 1.5
	block_damage_absorption = 5
	block_resting_stamina_penalty_multiplier = 2
	block_projectile_mitigation = 75

/obj/item/shield/examine(mob/user)
	. = ..()
	if(shield_flags & SHIELD_CAN_BASH)
		. += SPAN_NOTICE("Right click on combat mode attack with [src] to shield bash!")
		if(shield_flags & SHIELD_BASH_GROUND_SLAM)
			. += SPAN_NOTICE("Directly rightclicking on a downed target with [src] will slam them instead of bashing.")

/obj/item/shield/proc/on_shield_block(mob/living/owner, atom/object, damage, attack_text, attack_type, armour_penetration, mob/attacker, def_zone, final_block_chance)
	return TRUE

/obj/item/shield/alt_pre_attack(atom/A, mob/living/user, params)
	user_shieldbash(user, A, user.a_intent == INTENT_HARM)
	return TRUE

/obj/item/shield/altafterattack(atom/target, mob/user, proximity_flag, click_parameters)
	user_shieldbash(user, target, user.a_intent == INTENT_HARM)
	return TRUE

/obj/item/shield/proc/do_shieldbash_effect(mob/living/user, dir, harmful)
	var/px = 0
	var/py = 0
	switch(dir)
		if(NORTH)
			py = 12
		if(SOUTH)
			py = -12
		if(EAST)
			px = 12
		if(WEST)
			px = -12
	var/obj/effect/temp_visual/dir_setting/shield_bash/effect = new(user.loc, dir)
	effect.pixel_x = user.pixel_x - 32		//96x96 effect, -32.
	effect.pixel_y = user.pixel_y - 32
	user.visible_message("<span class='warning'>[user] [harmful? "charges forwards with" : "sweeps"] [src]!</span>")
	animate(user, pixel_x = px, pixel_y = py, time = 3, easing = SINE_EASING | EASE_OUT, flags = ANIMATION_PARALLEL | ANIMATION_RELATIVE)
	animate(user, pixel_x = -px, pixel_y = -py, time = 3, flags = ANIMATION_RELATIVE)
	animate(effect, alpha = 0, pixel_x = px * 1.5, pixel_y = py * 1.5, time = 3, flags = ANIMATION_PARALLEL | ANIMATION_RELATIVE)

/obj/item/shield/proc/bash_target(mob/living/user, mob/living/target, bashdir, harmful)
	if(!(target.status_flags & CANKNOCKDOWN) || HAS_TRAIT(src, TRAIT_STUNIMMUNE))	// should probably add stun absorption check at some point I guess..
		// unified stun absorption system when lol
		target.visible_message(SPAN_WARNING("[user] slams [target] with [src], but [target] doesn't falter!"), "<span class='userdanger'>[user] slams you with [src], but it barely fazes you!</span>")
		return FALSE
	var/target_downed = !CHECK_MOBILITY(target, MOBILITY_STAND)
	var/wallhit = FALSE
	var/turf/target_current_turf = get_turf(target)
	if(harmful)
		target.visible_message("<span class='warning'>[target_downed? "[user] slams [src] into [target]" : "[user] bashes [target] with [src]"]!</span>",
		"<span class='warning'>[target_downed? "[user] slams [src] into you" : "[user] bashes you with [src]"]!</span>")
	else
		target.visible_message(SPAN_WARNING("[user] shoves [target] with [src]!"),
		SPAN_WARNING("[user] shoves you with [src]!"))
	for(var/i in 1 to harmful? shieldbash_knockback : shieldbash_push_distance)
		var/turf/new_turf = get_step(target, bashdir)
		var/mob/living/carbon/human/H = locate() in (new_turf.contents - target)
		if(H && harmful)
			H.visible_message(SPAN_WARNING("[target] is sent crashing into [H]!"),
			"<span class='userdanger'>[target] is sent crashing into you!</span>")
			H.KnockToFloor()
			wallhit = TRUE
			break
		else
			step(target, bashdir)
			if(get_turf(target) == target_current_turf)
				wallhit = TRUE
				break
			else
				target_current_turf = get_turf(target)
	var/disarming = (target_downed && (shield_flags & SHIELD_BASH_GROUND_SLAM_DISARM)) || (shield_flags & SHIELD_BASH_ALWAYS_DISARM) || (wallhit && (shield_flags & SHIELD_BASH_WALL_DISARM))
	var/knockdown = !target_downed && ((shield_flags & SHIELD_BASH_ALWAYS_KNOCKDOWN) || (wallhit && (shield_flags & SHIELD_BASH_WALL_KNOCKDOWN)))
	if(shieldbash_stagger_duration || knockdown)
		target.visible_message("<span class='warning'>[target] is knocked [knockdown? "to the floor" : "off balance"]!</span>",
		"<span class='userdanger'>You are knocked [knockdown? "to the floor" : "off balance"]!</span>")
	if(knockdown)
		target.KnockToFloor(disarming)
	else if(disarming)
		target.drop_all_held_items()

	if(harmful)
		target.apply_damage(shieldbash_stamdmg, STAMINA, BODY_ZONE_CHEST)
		target.apply_damage(shieldbash_brutedamage, BRUTE, BODY_ZONE_CHEST)
	target.Stagger(shieldbash_stagger_duration)
	return TRUE

/obj/item/shield/proc/user_shieldbash(mob/living/user, atom/target, harmful)
	if(!SEND_SIGNAL(user, COMSIG_COMBAT_MODE_CHECK, COMBAT_MODE_ACTIVE)) //Combat mode has to be enabled for shield bashing
		return FALSE
	if(!(shield_flags & SHIELD_CAN_BASH))
		to_chat(user, SPAN_WARNING("[src] can't be used to shield bash!"))
		return FALSE
	if(!CHECK_MOBILITY(user, MOBILITY_STAND))
		to_chat(user, SPAN_WARNING("You can't bash with [src] while on the ground!"))
		return FALSE
	if(world.time < last_shieldbash + shieldbash_cooldown)
		to_chat(user, SPAN_WARNING("You can't bash with [src] again so soon!"))
		return FALSE
	var/mob/living/livingtarget = target		//only access after an isliving check!
	if(isliving(target) && !CHECK_MOBILITY(livingtarget, MOBILITY_STAND))		//GROUND SLAAAM
		if(!(shield_flags & SHIELD_BASH_GROUND_SLAM))
			to_chat(user, SPAN_WARNING("You can't ground slam with [src]!"))
			return FALSE
		bash_target(user, target, NONE, harmful)
		user.do_attack_animation(target, used_item = src)
		playsound(src, harmful? "swing_hit" : 'sound/weapons/thudswoosh.ogg', 75, 1)
		last_shieldbash = world.time
		user.adjustStaminaLossBuffered(shieldbash_stamcost)
		return TRUE
	// Directional sweep!
	last_shieldbash = world.time
	user.adjustStaminaLossBuffered(shieldbash_stamcost)
	// Since we are in combat mode, we can probably safely use the user's dir instead of getting their mouse pointing cardinal dir.
	var/bashdir = user.dir
	do_shieldbash_effect(user, bashdir, harmful)
	var/list/checking = list(get_step(user, user.dir), get_step(user, turn(user.dir, 45)), get_step(user, turn(user.dir, -45)))
	var/list/victims = list()
	for(var/i in checking)
		var/turf/T = i
		for(var/mob/living/L in T.contents)
			victims += L
	if(length(victims))
		for(var/i in victims)
			bash_target(user, i, bashdir, harmful)
		playsound(src, harmful? "swing_hit" : 'sound/weapons/thudswoosh.ogg', 75, 1)
	else
		playsound(src, 'sound/weapons/punchmiss.ogg', 75, 1)
	return length(victims)

/obj/effect/temp_visual/dir_setting/shield_bash
	icon = 'icons/effects/96x96_attack_sweep.dmi'
	icon_state = "shield_bash"
	duration = 3

/obj/item/shield/run_block(mob/living/owner, atom/object, damage, attack_text, attack_type, armour_penetration, mob/attacker, def_zone, final_block_chance, list/block_return)
	if(ismovable(object))
		var/atom/movable/AM = object
		if(CHECK_BITFIELD(shield_flags, SHIELD_TRANSPARENT) && (AM.pass_flags & PASSGLASS))
			return BLOCK_NONE
	if(attack_type & ATTACK_TYPE_THROWN)
		final_block_chance += 30
	if(attack_type & ATTACK_TYPE_TACKLE)
		final_block_chance = 100
	. = ..()
	if(. & BLOCK_SUCCESS)
		on_shield_block(owner, object, damage, attack_text, attack_type, armour_penetration, attacker, def_zone, final_block_chance, block_return)

/obj/item/shield/on_active_block(mob/living/owner, atom/object, damage, damage_blocked, attack_text, attack_type, armour_penetration, mob/attacker, def_zone, final_block_chance, list/block_return, override_direction)
	on_shield_block(owner, object, damage, attack_text, attack_type, armour_penetration, attacker, def_zone, final_block_chance)

//Basic riotshield, meant to protect from melee and thrown weapons.
/obj/item/shield/riot
	name = "riot shield"
	desc = "A shield adept at blocking blunt objects from connecting with the torso of the shield wielder."
	icon_state = "riot"
	lefthand_file = 'icons/mob/inhands/equipment/shields_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/shields_righthand.dmi'
	slot_flags = ITEM_SLOT_BACK
	force = 10
	throwforce = 5
	throw_speed = 2
	throw_range = 3
	w_class = WEIGHT_CLASS_BULKY
	custom_materials = list(/datum/material/glass=7500, /datum/material/iron=1000)
	attack_verb = list("shoved", "bashed")
	var/cooldown = 0 //shield bash cooldown. based on world.time
	var/repair_material = /obj/item/stack/sheet/mineral/titanium
	var/can_shatter = FALSE
	shield_flags = SHIELD_FLAGS_DEFAULT | SHIELD_TRANSPARENT
	max_integrity = 450

/obj/item/shield/riot/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/melee/baton))
		if(cooldown < world.time - 25)
			user.visible_message(SPAN_WARNING("[user] bashes [src] with [W]!"))
			playsound(user.loc, 'sound/effects/shieldbash.ogg', 50, 1)
			cooldown = world.time
	else if(istype(W, repair_material))
		if(obj_integrity >= max_integrity)
			to_chat(user, SPAN_WARNING("[src] is already in perfect condition."))
		else
			var/obj/item/stack/S = W
			S.use(1)
			obj_integrity = max_integrity
			to_chat(user, SPAN_NOTICE("You repair [src] with [S]."))
	else
		return ..()

/obj/item/shield/riot/examine(mob/user)
	. = ..()
	var/healthpercent = round((obj_integrity/max_integrity) * 100, 1)
	switch(healthpercent)
		if(50 to 99)
			. += "<span class='info'>It looks slightly damaged.</span>"
		if(25 to 50)
			. += "<span class='info'>It appears heavily damaged.</span>"
		if(0 to 25)
			. += SPAN_WARNING("It's falling apart!")

/obj/item/shield/riot/proc/shatter(mob/living/carbon/human/owner)
	playsound(owner, 'sound/effects/glassbr3.ogg', 100)
	new /obj/item/shard((get_turf(src)))

/obj/item/shield/riot/on_shield_block(mob/living/owner, atom/object, damage, attack_text, attack_type, armour_penetration, mob/attacker, def_zone, final_block_chance, list/block_return)
	if(can_shatter && (obj_integrity <= damage))
		var/turf/T = get_turf(owner)
		T.visible_message(SPAN_WARNING("[attack_text] destroys [src]!"))
		shatter(owner)
		qdel(src)
		return FALSE
	take_damage(damage)
	return ..()

//Laserproof riot shield 				- Basically unused. Maybe one day or for events. Has a decent sprite too.
/obj/item/shield/riot/laser_proof
	name = "laser resistant shield"
	desc = "A far more frail shield made of dark glass meant to block lasers but suffers from being being weak to ballistic projectiles."
	armor = list("linemelee" = 80, "linebullet" = -20, "linelaser" = 400, "energy" = 80, "bomb" = -40, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 50)
	icon_state = "riot_laser"
	item_state = "riot_laser"
	lefthand_file = 'icons/mob/inhands/equipment/shields_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/shields_righthand.dmi'
	shield_flags = SHIELD_FLAGS_DEFAULT
	max_integrity = 300

//Bulletproof riot shield
/obj/item/shield/riot/bullet_proof
	name = "bullet resistant shield"
	desc = "A far more frail shield made of resistant plastics and kevlar meant to block ballistics."
	armor = list("linemelee" = 80, "linebullet" = 400, "laser" = 0, "energy" = 0, "bomb" = -40, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 50)
	icon_state = "riot_bulletproof"
	item_state = "riot_bulletproof"
	shield_flags = SHIELD_FLAGS_DEFAULT
	max_integrity = 300

//Telescopic Riot Shield				- Printed at protolathes. Keep weak due to its compact nature.
/obj/item/shield/riot/tele
	name = "telescopic shield"
	desc = "An advanced riot shield made of lightweight materials that collapses for easy storage."
	icon_state = "teleriot0"
	lefthand_file = 'icons/mob/inhands/equipment/shields_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/shields_righthand.dmi'
	armor = list("linemelee" = 60, "linebullet" = -40, "laser" = 200, "energy" = 40, "bomb" = -60, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 50)
	slot_flags = null
	force = 3
	throwforce = 3
	throw_speed = 3
	throw_range = 4
	max_integrity = 270
	w_class = WEIGHT_CLASS_NORMAL
	var/active = FALSE

/obj/item/shield/riot/tele/run_block(mob/living/owner, atom/object, damage, attack_text, attack_type, armour_penetration, mob/attacker, def_zone, final_block_chance, list/block_return)
	if(!active)
		return BLOCK_NONE
	return ..()

/obj/item/shield/riot/tele/can_active_block()
	return ..() && active

/obj/item/shield/riot/tele/attack_self(mob/living/user)
	active = !active
	icon_state = "teleriot[active]"
	playsound(src.loc, 'sound/weapons/batonextend.ogg', 50, TRUE)

	if(active)
		force = 8
		throwforce = 5
		throw_speed = 2
		w_class = WEIGHT_CLASS_BULKY
		slot_flags = ITEM_SLOT_BACK
		to_chat(user, SPAN_NOTICE("You extend \the [src]."))
	else
		force = 3
		throwforce = 3
		throw_speed = 3
		w_class = WEIGHT_CLASS_NORMAL
		slot_flags = null
		to_chat(user, SPAN_NOTICE("[src] can now be concealed."))
	add_fingerprint(user)

//Legion shield					- Superior version of the Legion shield.
/obj/item/shield/riot/legion
	name = "Legion shield"
	desc = "Heavy shield with metal pieces bolted to a wood backing, with a painted yellow bull insignia in the centre. Bears an inscription on the inside: <i>\"Legio, Aeterna! Aeterna, Victrix! \"</i>."
	icon_state = "legion_shield"
	item_state = "legion_shield"
	lefthand_file = 'icons/mob/inhands/equipment/shields_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/shields_righthand.dmi'
	slot_flags = ITEM_SLOT_BACK
	force = 13
	max_integrity = 300
	custom_materials = list(/datum/material/wood = 16000, /datum/material/iron= 16000)
	repair_material = /obj/item/stack/sheet/mineral/wood
	w_class = WEIGHT_CLASS_BULKY
	attack_verb = list("shoved", "bashed")

/obj/item/shield/riot/legion/shatter(mob/living/carbon/human/owner)
	playsound(owner, 'sound/effects/grillehit.ogg', 100)
	new /obj/item/stack/sheet/metal(get_turf(src))

//Legion buckler shield			- Inferior version of the Legion shield.
/obj/item/shield/legion/buckler
	name = "legion buckler"
	desc = "A lightweight well balanced shield made out of a hard oak and lashed together with solid iron bands. It has a legion emblem charred onto the inside."
	icon_state = "buckler"
	item_state = "buckler"
	lefthand_file = 'icons/mob/inhands/equipment/shields_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/shields_righthand.dmi'
	custom_materials = list()
	resistance_flags = FLAMMABLE
	max_integrity = 200
	force = 15
	throwforce = 15
	throw_speed = 4
	throw_range = 7
	block_chance = 25
	armor = list("linemelee" = 80, "linebullet" = 80, "linelaser" = 80, "energy" = 0, "bomb" = 30, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 70)


//Buckler Wooden Shield			- Cheapest, shittiest shield there is. Found on raider corpses from time to time as well as trash.
/obj/item/shield/riot/buckler
	name = "wooden buckler"
	desc = "A medieval wooden buckler."
	icon_state = "buckler"
	item_state = "buckler"
	lefthand_file = 'icons/mob/inhands/equipment/shields_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/shields_righthand.dmi'
	custom_materials = list(/datum/material/wood = MINERAL_MATERIAL_AMOUNT * 10)
	resistance_flags = FLAMMABLE
	repair_material = /obj/item/stack/sheet/mineral/wood
	block_chance = 30
	shield_flags = SHIELD_FLAGS_DEFAULT
	max_integrity = 150

/obj/item/shield/riot/buckler/shatter(mob/living/carbon/human/owner)
	playsound(owner, 'sound/effects/bang.ogg', 50)
	new /obj/item/stack/sheet/mineral/wood(get_turf(src))

//Improvised metal shield				- Not exactly a bad shield but it's made of literal scrap.
/obj/item/shield/makeshift
	name = "scrap shield"
	desc = "A shield made of welded, riveted and glued metal sheets. Crude yet reliant for its cost, having cloth protecting the user from the sharp edges and a leather strap for the wearer to grip it by."
	armor = list("linemelee" = 70, "linebullet" = 70, "linelaser" = 70, "energy" = 0, "bomb" = 30, "bio" = 0, "rad" = 0, "fire" = 70, "acid" = 80)
	lefthand_file = 'icons/mob/inhands/equipment/shields_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/shields_righthand.dmi'
	item_state = "metal"
	icon_state = "makeshift_shield"
	custom_materials = list(/datum/material/iron = 18000)
	slot_flags = null
	max_integrity = 250 //Made of metal welded together its strong but not unkillable
	force = 10
	throwforce = 7
	w_class = WEIGHT_CLASS_BULKY

//Tribal shield							- It's literally a scrap stopsign. Weak, but funny and setting appropriate.
/obj/item/shield/tribal
	name = "tribal shield"
	desc = "A hexagonal based shield that bears some strange words of the Old World on it. Or maybe it just says 'stop'.. either-or."
	icon_state = "shield_tribal"
	item_state = "shield_tribal"
	force = 20
	throwforce = 5
	throw_speed = 2
	throw_range = 3
	block_chance = 40
	max_integrity = 200
	lefthand_file = 'icons/mob/inhands/equipment/shields_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/shields_righthand.dmi'
	w_class = WEIGHT_CLASS_NORMAL

//Tribal nightmare stalker lined siheld
/obj/item/shield/riot/tribal/nightstalker
	name = "nightstalker shield"
	desc = "An oval shaped shield made of strong wood and nightstalker skin."
	icon_state = "bnightstalker"
	item_state = "bnightstalker"
	lefthand_file = 'icons/mob/inhands/equipment/shields_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/shields_righthand.dmi'
	max_integrity = 300






//Old legacy snowflake shield for admin events or maybe Enclave garbage. Should possibly be removed but it holds potential for usage.

/obj/item/shield/energy
	name = "energy combat shield"
	desc = "A shield that reflects almost all energy projectiles, but is useless against physical attacks. It can be retracted, expanded, and stored anywhere."
	lefthand_file = 'icons/mob/inhands/equipment/shields_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/shields_righthand.dmi'
	w_class = WEIGHT_CLASS_TINY
	attack_verb = list("shoved", "bashed")
	throw_range = 5
	force = 3
	throwforce = 3
	throw_speed = 3
	var/base_icon_state = "eshield" // [base_icon_state]1 for expanded, [base_icon_state]0 for contracted
	var/on_force = 10
	var/on_throwforce = 8
	var/on_throw_speed = 2
	var/active = 0
	var/clumsy_check = TRUE

/obj/item/shield/energy/Initialize()
	. = ..()
	icon_state = "[base_icon_state]0"

/obj/item/shield/energy/run_block(mob/living/owner, atom/object, damage, attack_text, attack_type, armour_penetration, mob/attacker, def_zone, final_block_chance, list/block_return)
	if((attack_type & ATTACK_TYPE_PROJECTILE) && is_energy_reflectable_projectile(object))
		block_return[BLOCK_RETURN_REDIRECT_METHOD] = REDIRECT_METHOD_DEFLECT
		return BLOCK_SUCCESS | BLOCK_REDIRECTED | BLOCK_SHOULD_REDIRECT
	return ..()

/obj/item/shield/energy/active_block(mob/living/owner, atom/object, damage, attack_text, attack_type, armour_penetration, mob/attacker, def_zone, final_block_chance, list/block_return, override_direction)
	if((attack_type & ATTACK_TYPE_PROJECTILE) && is_energy_reflectable_projectile(object))
		block_return[BLOCK_RETURN_REDIRECT_METHOD] = REDIRECT_METHOD_DEFLECT
		return BLOCK_SUCCESS | BLOCK_REDIRECTED | BLOCK_SHOULD_REDIRECT
	return ..()

/obj/item/shield/energy/attack_self(mob/living/carbon/human/user)
	if(clumsy_check && HAS_TRAIT(user, TRAIT_CLUMSY) && prob(50))
		to_chat(user, "<span class='userdanger'>You beat yourself in the head with [src]!</span>")
		user.take_bodypart_damage(5)
	active = !active
	icon_state = "[base_icon_state][active]"

	if(active)
		force = on_force
		throwforce = on_throwforce
		throw_speed = on_throw_speed
		w_class = WEIGHT_CLASS_BULKY
		playsound(user, 'sound/weapons/saberon.ogg', 35, TRUE)
		to_chat(user, SPAN_NOTICE("[src] is now active."))
	else
		force = initial(force)
		throwforce = initial(throwforce)
		throw_speed = initial(throw_speed)
		w_class = WEIGHT_CLASS_TINY
		playsound(user, 'sound/weapons/saberoff.ogg', 35, TRUE)
		to_chat(user, SPAN_NOTICE("[src] can now be concealed."))
	add_fingerprint(user)
