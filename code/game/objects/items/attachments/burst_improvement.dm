/obj/item/attachment/burst_improvement
	name = "burst cam"
	desc = "A mechanism allowing for certain automatic rifles to fire faster via manipulation of the gun's bolt. For more dakka."
	icon_state = "burstcam"
	slot = ATTACHMENT_SLOT_BARREL

/obj/item/attachment/auto_sear/Attach(obj/item/gun/gun, mob/user)
	. = ..()
	gun.burst_size +=1
	gun.spread += 4
	gun.recoil += 0.15
	gun.spread = initial(gun.spread)