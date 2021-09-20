/obj/item/attachment/bullet_speed
	name = "extended barrel"
	desc = "A foraged barrel intended to be used on long rifles and carbines to increase a bullets accruacy and travel-speed."
	icon_state = "barrel"
	slot = ATTACHMENT_SLOT_BARREL
	var/extra_speed = TILES_TO_PIXELS(0)

/obj/item/attachment/bullet_speed/Toggle(obj/item/gun/gun, mob/user)
	. = ..()

	playsound(user, toggled ? 'sound/weapons/magin.ogg' : 'sound/weapons/magout.ogg', 40, TRUE)

	if(toggled)
		var/pixels_per_second = TILES_TO_PIXELS(17.5)
		return

	gun.spread = initial(gun.spread)