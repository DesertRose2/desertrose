/////////////////////
//LASER ATTACHMENTS//
/////////////////////

//Attachments for laser weapons. Don't let these go on ballistics. EVER.

/obj/item/attachment/focused_lens
	name = "focused laser lens"
	desc = "A lens for the end of a laser gun that increases the intensity of the outgoing beam!"
	icon_state = "focused lens"
	slot = ATTACHMENT_SLOT_LASER_LENS

/obj/item/attachment/focused_lens/Attach(obj/item/gun/gun, mob/user)
	. = ..()
	gun.extra_damage += 8
	gun.fire_delay += 1.5
	gun.recoil += 0.1
	gun.spread = initial(gun.spread)

/obj/item/attachment/focused_lens/Detach(obj/item/gun/gun, mob/user)
	. = ..()
	gun.extra_damage -= 8
	gun.fire_delay -= 1.5
	gun.recoil -= 0.1
	gun.spread = initial(gun.spread)



/obj/item/attachment/splitter_lens
	name = "splitter laser lens"
	desc = "A lens with precise cuts made into the focused lens. While crudely done it appears to have a level of craft to it; allowing beams to be shot with a spread akin to a shotgun."
	icon_state = "splitter lens"

/obj/item/attachment/splitter_lens/Attach(obj/item/gun/gun, mob/user)
	. = ..()
	gun.burst_size +=1
	gun.extra_damage -= 6
	gun.fire_delay += 1
	gun.spread += 12
	gun.spread = initial(gun.spread)

/obj/item/attachment/splitter_lens/Detach(obj/item/gun/gun, mob/user)
	. = ..()
	gun.burst_size -=1
	gun.extra_damage += 6
	gun.fire_delay -= 1
	gun.spread -= 12
	gun.spread = initial(gun.spread)



/obj/item/attachment/automatic_receiver
	name = "automatic laser receiver"
	desc = "A custom-made laser receiver with a two-part spinning laser lens."
	icon_state = "laser auto"
	slot = ATTACHMENT_SLOT_LASER_RECEIVER

/obj/item/attachment/automatic_receiver/Attach(obj/item/gun/gun, mob/user)
	. = ..()
	if(!gun.can_automatic)
		to_chat(user, "<span class='warning'>You cannot attach [src] to [gun]!</span>")
		return FALSE
	gun.burst_size +=1
	gun.spread += 6
	gun.recoil += 0.1
	gun.spread = initial(gun.spread)

/obj/item/attachment/automatic_receiver/Detach(obj/item/gun/gun, mob/user)
	. = ..()
	gun.burst_size -=1
	gun.spread -= 6
	gun.recoil -= 0.1
	gun.spread = initial(gun.spread)



/obj/item/attachment/focused_receiver
	name = "focused laser receiver"
	desc = "A bulky laser receiver that uses one projector. However it seems to amplify its intensity before leaving the gun itself."
	icon_state = "laser focus"
	slot = ATTACHMENT_SLOT_LASER_RECEIVER

/obj/item/attachment/focused_receiver/Attach(obj/item/gun/gun, mob/user)
	. = ..()
	gun.extra_damage += 6
	gun.extra_penetration += 0.1
	gun.fire_delay += 1.5
	gun.recoil += 0.15

/obj/item/attachment/focused_receiver/Detach(obj/item/gun/gun, mob/user)
	. = ..()
	gun.extra_damage -= 6
	gun.extra_penetration -= 0.1
	gun.fire_delay -= 1.5
	gun.recoil -= 0.15