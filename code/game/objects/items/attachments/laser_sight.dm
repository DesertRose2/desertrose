/obj/item/attachment/laser_sight
	name = "laser sight"
	desc = "This laser sight is designed to be rail-mounted on a compatible firearm to provide increased accuracy."
	icon_state = "laserpointer"
	slot = ATTACHMENT_SLOT_RAIL

/obj/item/attachment/laser_sight/Toggle(obj/item/gun/gun, mob/user)
	. = ..()

	playsound(user, toggled ? 'sound/weapons/magin.ogg' : 'sound/weapons/magout.ogg', 40, TRUE)

	if(toggled)
		gun.spread *= 0.4
		return

	gun.spread = initial(gun.spread)