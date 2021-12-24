/obj/item/flashlight/flare/torch
	desc = "A self-lighting handheld torch fashioned from some cloth wrapped around a wooden handle. It could probably fit in a backpack while it isn't burning."
	w_class = WEIGHT_CLASS_NORMAL
	brightness_on = 5
	on_damage = 10

/obj/item/flashlight/flare/torch/attack_self(mob/user)
	// Usual checks
	if(!fuel)
		to_chat(user, SPAN_WARNING("[src] is out of fuel!"))
		return
	if(on)
		to_chat(user, SPAN_NOTICE("[src] is already lit."))
		return
	// All good, turn it on.
	user.visible_message(SPAN_NOTICE("[user] lights [src]."), SPAN_NOTICE("You light [src]!"))
	playsound(loc, 'sound/effects/torch_light.ogg', 50, 0)
	force = on_damage
	damtype = BURN
	w_class = WEIGHT_CLASS_BULKY
	desc = "A handheld wooden torch that's slowly burning away."
	START_PROCESSING(SSobj, src)
	on = !on
	update_brightness(user)
	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon()
	return TRUE
