/obj/item/attachment/rail_light
	name = "rail light"
	desc = "Rail mounted gun light for better visibility down range."
	icon_state = "raillight"
	slot = ATTACHMENT_SLOT_RAIL

	light_color = "#FFCC66"
	var/active = FALSE
	var/light_beam_distance = 4
	var/light_object_range = 1
	var/light_object_power = 2

/obj/item/attachment/rail_light/proc/activate(silent = FALSE)
	active = TRUE
	if(!silent)
		to_chat("<span class='warning'>Your [src] clicks on before shooting out a beam of light.</span>")
	update_icon()

/obj/item/attachment/rail_light/proc/deactivate(silent = FALSE)
	active = FALSE
	if(!silent)
		to_chat("<span class='warning'>Your [src] clicks off.</span>")
	update_icon()