/obj/item/attachment/auto_sear
	name = "auto sear"
	desc = "A receiver modification able to fit onto certain compatible trigger mechanisms. Allows for burst-fire on otherwise civilian-grade rifles; frowned upon by the old American Goverment."
	icon_state = "auto_sear"
	slot = ATTACHMENT_SLOT_GRIP

/obj/item/attachment/auto_sear/Attach(obj/item/gun/gun, mob/user)
	. = ..()
	if(!gun.can_automatic)
		to_chat(user, "<span class='warning'>You cannot attach [src] to [gun]!</span>")
		return FALSE
	gun.burst_size +=1
	gun.spread += 6
	gun.recoil += 0.1
	gun.spread = initial(gun.spread)
	return

/obj/item/attachment/auto_sear/Detach(obj/item/gun/gun, mob/user)
	. = ..()
	gun.burst_size -=1
	gun.spread -= 6
	gun.recoil -= 0.1
	gun.spread = initial(gun.spread)
	return