/obj/item/attachment/bullet_speed
	name = "extended barrel"
	desc = "A foraged barrel intended to be used on long rifles and carbines to increase a bullets accruacy and travel-speed."
	icon_state = "barrel"
	slot = ATTACHMENT_SLOT_BARREL

//How does this work? I have no clue, it compiles though!!! (:
/obj/item/attachment/bullet_speed/Attach(obj/item/gun/gun, mob/user)
	. = ..()
	gun.spread *= 1.25
	gun.extra_speed *= 1.25

/obj/item/attachment/bullet_speed/Detach(obj/item/gun/gun, mob/user)
	. = ..()
	gun.spread /= 1.25
	gun.extra_speed /= 1.25