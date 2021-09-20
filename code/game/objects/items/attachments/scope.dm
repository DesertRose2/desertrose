/obj/item/attachment/scope
	name = "scope"
	desc = "A scope designed mostly from old-war materials and pieces of magnifine glasses."
	icon_state = "scope"
	slot = ATTACHMENT_SLOT_SCOPE

/obj/item/attachment/scope/Toggle(obj/item/gun/gun, mob/user)
	. = ..()

	playsound(user, toggled ? 'sound/weapons/magin.ogg' : 'sound/weapons/magout.ogg', 40, TRUE)

	if(toggled)
		gun.zoomable = TRUE
		gun.zoom_amt = 10
		gun.zoom_out_amt = 13
		gun.build_zooming()
		update_overlays()
		update_icon()
		return