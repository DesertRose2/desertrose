/obj/effect/proc_holder/spell/pointed/barnyardcurse
	name = "Curse of the Barnyard"
	desc = "This spell dooms an unlucky soul to possess the speech and facial attributes of a barnyard animal."
	school = "transmutation"
	charge_type = "recharge"
	charge_max	= 150
	charge_counter = 0
	clothes_req = FALSE
	stat_allowed = FALSE
	invocation = "KN'A FTAGHU, PUCK 'BTHNK!"
	invocation_type = "shout"
	range = 7
	cooldown_min = 30
	ranged_mousepointer = 'icons/effects/mouse_pointers/barn_target.dmi'
	action_icon_state = "barn"
	active_msg = "You prepare to curse a target..."
	deactive_msg = "You dispel the curse..."
	/// List of mobs which are allowed to be a target of the spell
	var/static/list/compatible_mobs_typecache = typecacheof(list(/mob/living/carbon/human, /mob/living/carbon/monkey))

/obj/effect/proc_holder/spell/pointed/barnyardcurse/cast(list/targets, mob/user)
	if(!targets.len)
		to_chat(user, SPAN_WARNING("No target found in range!"))
		return FALSE
	if(!can_target(targets[1], user))
		return FALSE

	var/mob/living/carbon/target = targets[1]
	if(target.anti_magic_check())
		to_chat(user, SPAN_WARNING("The spell had no effect!"))
		target.visible_message(SPAN_DANGER("[target]'s face bursts into flames, which instantly burst outward, leaving [target] unharmed!"), \
						SPAN_DANGER("Your face starts burning up, but the flames are repulsed by your anti-magic protection!"))
		return FALSE

	var/list/masks = list(/obj/item/clothing/mask/pig/cursed, /obj/item/clothing/mask/cowmask/cursed, /obj/item/clothing/mask/horsehead/cursed)
	var/choice = pick(masks)
	var/obj/item/clothing/mask/magichead = new choice(get_turf(target))

	target.visible_message(SPAN_DANGER("[target]'s face bursts into flames, and a barnyard animal's head takes its place!"), \
						   SPAN_DANGER("Your face burns up, and shortly after the fire you realise you have the face of a barnyard animal!"))
	if(!target.dropItemToGround(target.wear_mask))
		qdel(target.wear_mask)
	target.equip_to_slot_if_possible(magichead, ITEM_SLOT_MASK, 1, 1)
	target.flash_act()

/obj/effect/proc_holder/spell/pointed/barnyardcurse/can_target(atom/target, mob/user, silent)
	. = ..()
	if(!.)
		return FALSE
	if(!is_type_in_typecache(target, compatible_mobs_typecache))
		if(!silent)
			to_chat(user, SPAN_WARNING("You are unable to curse [target]!"))
		return FALSE
	return TRUE
