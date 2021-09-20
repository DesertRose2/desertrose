/obj/item/attachment/bayonet
	name = "bayonet"
	desc = "Stabby-Stabby"
	icon_state = "bayonet"
	force = 2
	slot = ATTACHMENT_SLOT_MUZZLE

	var/force_on = 20
	var/extended = FALSE
	var/reach_extended = 2
	var/force_extended = 10

/obj/item/attachment/bayonet/Toggle(obj/item/gun/gun, mob/user)
	. = ..()

	reach = toggled ? reach : initial(reach)
	force = toggled ? force : initial(force)

	playsound(gun, 'sound/weapons/batonextend.ogg')
	user.visible_message("[user] [toggled ? "expands" : "retracts"] [user.p_their()] [src].", "You [toggled ? "expand" : "retract"] \the [src].")

/obj/item/attachment/bayonet/PreAttack(obj/item/gun/gun, atom/target, mob/living/user, list/params)
	// Call our melee chain if they are are trying to melee attack something they can reach
	if(user.a_intent == INTENT_HARM && user.CanReach(target, src, TRUE))
		if(target == user && toggled)
			extended = !extended
			reach = extended ? reach_extended : initial(reach)
			gun.reach = reach // Even if your gun has a longer reach you default to the bayonets because STAB STAB STAB
			force = extended ? force_extended : force_on
			// Hey, I just met you
			if(extended) // And this is crazy
				icon_state += "-long" // But heres my number
			else // Call me never
				icon_state = replacetext(icon_state, "-long", "") // Because why is this so ugly
			user.visible_message("[user] [extended ? "increased" : "decreased"] the length of [src].")
			return COMPONENT_NO_ATTACK
		melee_attack_chain(user, target, params)
		return COMPONENT_NO_ATTACK