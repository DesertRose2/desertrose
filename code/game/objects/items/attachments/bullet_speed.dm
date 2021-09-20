/obj/item/attachment/bullet_speed
	name = "extended barrel"
	desc = "A foraged barrel intended to be used on long rifles and carbines to increase a bullets accruacy and travel-speed."
	icon_state = "barrel"
	slot = ATTACHMENT_SLOT_BARREL

/obj/item/attachment/bullet_speed/Toggle(obj/item/gun/gun, mob/user)
	. = ..()

	playsound(user, toggled ? 'sound/weapons/magin.ogg' : 'sound/weapons/magout.ogg', 40, TRUE)

//How does this work? I have no clue, it compiles though!!! (:
	if(toggled)
		gun.extra_speed *= 1.25
		return

	gun.spread = initial(gun.spread)