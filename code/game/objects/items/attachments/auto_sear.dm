/obj/item/attachment/auto_sear
	name = "auto sear"
	desc = "A receiver modification able to fit onto certain compatible trigger mechanisms. Allows for burst-fire on otherwise civilian-grade rifles; frowned upon by the old American Goverment."
	icon_state = "auto_sear"
	slot = ATTACHMENT_SLOT_GRIP

/obj/item/attachment/auto_sear/Toggle(obj/item/gun/gun, mob/user)
	. = ..()

	playsound(user, toggled ? 'sound/weapons/magin.ogg' : 'sound/weapons/magout.ogg', 40, TRUE)

	if(toggled)
		gun.burst_size +=1
		gun.spread += 6
		gun.recoil += 0.1
		return

	gun.spread = initial(gun.spread)

