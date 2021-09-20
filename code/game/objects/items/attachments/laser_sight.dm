/obj/item/attachment/laser_sight
	name = "laser sight"
	desc = "This laser sight is designed to be rail-mounted on a compatible firearm to provide increased accuracy."
	icon_state = "laserpointer"
	slot = ATTACHMENT_SLOT_RAIL

/obj/item/attachment/laser_sight/Attach(obj/item/gun/gun, mob/user)
	. = ..()
	gun.spread *= 0.4
	gun.spread = initial(gun.spread)
	return