/obj/item/attachment/recoil_decrease
	name = "recoil compensator"
	desc = "This laser sight is designed to be rail-mounted on a compatible firearm to provide increased accuracy."
	icon_state = "laserpointer"
	slot = ATTACHMENT_SLOT_GRIP

/obj/item/attachment/recoil_decrease/Attach(obj/item/gun/gun, mob/user)
	. = ..()
	gun.spread *= 0.25
	gun.spread = initial(gun.spread)
	return