//MASTER FILE FOR BALLISTICS ATTACHMENTS!!! - I also shoved the scope attachment in here as well as rail lights. They are 'universal' attachments. See bottom.
//How does this work? I have no clue, it compiles though!!! (:

//////////////////////////
//BALLISTICS ATTACHMENTS//
//////////////////////////

//For ballistic weapons ONLY. Don't let lasers take these or it'll be hell.

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
	update_icon()

/obj/item/attachment/auto_sear/Detach(obj/item/gun/gun, mob/user)
	. = ..()
	gun.burst_size -=1
	gun.spread -= 6
	gun.recoil -= 0.1
	update_icon()



/obj/item/attachment/bullet_speed
	name = "foraged barrel"
	desc = "A foraged barrel intended to be used on long rifles and carbines to increase a bullets accruacy and travel-speed."
	icon_state = "barrel"
	slot = ATTACHMENT_SLOT_BARREL

/obj/item/attachment/bullet_speed/Attach(obj/item/gun/gun, mob/user)
	. = ..()
	gun.spread *= 1.25
	gun.extra_speed *= 1.25

/obj/item/attachment/bullet_speed/Detach(obj/item/gun/gun, mob/user)
	. = ..()
	gun.spread /= 1.25
	gun.extra_speed /= 1.25



/obj/item/attachment/bayonet
	name = "bayonet"
	desc = "A bayonet. Think about what you're doing. You're making your gun - into a /spear/. Stone-age."
	icon_state = "attach_bayonet"
	force = 20
	slot = ATTACHMENT_SLOT_MUZZLE

/obj/item/attachment/bayonet/Attach(obj/item/gun/gun, mob/user)
	. = ..()
	if(!gun.can_bayonet)
		to_chat(user, "<span class='warning'>You cannot attach [src] to [gun]!</span>")
		return FALSE
	gun.force +=20

/obj/item/attachment/bayonet/Detach(obj/item/gun/gun, mob/user)
	. = ..()
	gun.force -=20

//Burst cam won't work and it just acts like the damn autosear anyway due to the code change. So screw it. For now it's removed till I can figure out how to make it ONLY fit on guns that already have a burst size of +2
/*
/obj/item/attachment/burst_improvement
	name = "burst cam"
	desc = "A mechanism allowing the user to "
	icon_state = "burstcam"
	slot = ATTACHMENT_SLOT_GRIP //Yeah, it's a grip for balance reasons. Honestly should be a stock. Muh bumpfire.

/obj/item/attachment/burst_improvement/Attach(obj/item/gun/gun, mob/user)
	. = ..()
	if(!gun.can_attachments)
		to_chat(user, "<span class='warning'>You cannot attach [src] to [gun]!</span>")
		return FALSE
	gun.burst_size +=1
	gun.spread += 4
	gun.recoil += 0.15

/obj/item/attachment/burst_improvement/Detach(obj/item/gun/gun, mob/user)
	. = ..()
	gun.burst_size -=1
	gun.spread -= 4
	gun.recoil -= 0.15
*/


/obj/item/attachment/recoil_decrease
	name = "recoil compensator"
	desc = "This attachment mounts to the barrel of a gun, allowing for better control of the weapon through the addition of a better gas operating system. Caution: Keep hand off; hot!"
	icon_state = "recoilcomp"
	slot = ATTACHMENT_SLOT_BARREL

/obj/item/attachment/recoil_decrease/Attach(obj/item/gun/gun, mob/user)
	. = ..()
	gun.spread *= 0.25
	gun.fire_delay += 0.5

/obj/item/attachment/recoil_decrease/Detach(obj/item/gun/gun, mob/user)
	. = ..()
	gun.spread /= 0.25
	gun.fire_delay -= 0.5



/obj/item/attachment/silencer
	name = "silencer"
	desc = "For when you need to kill someone but not be seen killing someone!"
	icon_state = "silencer"
	slot = ATTACHMENT_SLOT_MUZZLE

/obj/item/attachment/silencer/Attach(obj/item/gun/gun, mob/user)
	. = ..()
	if(!gun.can_suppress)
		to_chat(user, "<span class='warning'>You cannot attach [src] to [gun]!</span>")
		return FALSE
	gun.suppressed = TRUE

/obj/item/attachment/silencer/Toggle(obj/item/gun/gun, mob/user)
	. = ..()
	// TODO: Consider making attachments that dont toggle a custom subtype
	if(toggled)
		Toggle(gun, user)

/obj/item/attachment/silencer/Detach(obj/item/gun/gun, mob/user)
	. = ..()
	if(!gun.can_unsuppress)
		to_chat(user, "<span class='warning'>You cannot detach [src] from [gun]!</span>")
		return FALSE
	gun.suppressed = FALSE
	return TRUE



///////////////////////
//GENERAL ATTACHMENTS//
///////////////////////

//These are the universal attachments for all guns. Laser, plasma, snowflake or ballistic. Not every gun should take these per-say but it is an option for all weapons instead of only ballistics.

/obj/item/attachment/laser_sight
	name = "laser sight"
	desc = "This laser sight is designed to be rail-mounted on a compatible firearm to provide increased accuracy."
	icon_state = "laserpointer"
	slot = ATTACHMENT_SLOT_RAIL

/obj/item/attachment/laser_sight/Attach(obj/item/gun/gun, mob/user)
	. = ..()
	gun.spread *= 0.4

/obj/item/attachment/laser_sight/Detach(obj/item/gun/gun, mob/user)
	. = ..()
	gun.spread /= 0.4



/obj/item/attachment/scope
	name = "scope"
	desc = "A scope designed mostly from old-war materials and pieces of magnifine glasses."
	icon_state = "scope"
	slot = ATTACHMENT_SLOT_SCOPE

/obj/item/attachment/scope/Attach(obj/item/gun/gun, mob/user)
	. = ..()
	gun.zoomable = TRUE
	gun.zoom_amt = 10
	gun.zoom_out_amt = 13
	gun.build_zooming()
	update_overlays()
	update_icon()
	return

/obj/item/attachment/scope/Detach(obj/item/gun/gun, mob/user)
	. = ..()
	gun.zoomable = FALSE
	update_overlays()
	update_icon()
	return



/obj/item/attachment/rail_light
	name = "rail light"
	desc = "Rail mounted gun light for better visibility down range."
	icon_state = "raillight"
	slot = ATTACHMENT_SLOT_RAIL

	light_color = "#FFCC66"
	var/active = FALSE
	var/light_beam_distance = 4
	var/light_object_range = 1
	var/light_object_power = 2
	var/mutable_appearance/flashlight_overlay
	var/datum/action/item_action/toggle_gunlight/alight

/obj/item/attachment/rail_light/proc/activate(silent = FALSE)
	active = TRUE
	if(!silent)
		to_chat("<span class='warning'>Your [src] clicks on before shooting out a beam of light.</span>")
	update_icon()

/obj/item/attachment/rail_light/proc/deactivate(silent = FALSE)
	active = FALSE
	if(!silent)
		to_chat("<span class='warning'>Your [src] clicks off.</span>")
	update_icon()