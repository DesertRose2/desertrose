//The ammo/gun is stored in a back slot item
/obj/item/bowquiver
	name = "Quiver"
	desc = "A quiver that contains arrows for the bow."
	icon = 'icons/obj/clothing/belts.dmi'
	icon_state = "tribal_quiver"
	item_state = "tribal_quiver"
	lefthand_file = 'icons/mob/inhands/equipment/backpack_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/backpack_righthand.dmi'
	slot_flags = ITEM_SLOT_BELT
	w_class = WEIGHT_CLASS_HUGE
	var/obj/item/gun/ballistic/quiver/bow/gun
	var/armed = 0 //whether the gun is attached, 0 is attached, 1 is the gun is wielded.
	var/overheat = 0
	var/overheat_max = 40
	var/heat_diffusion = 1

/obj/item/bowquiver/Initialize()
	. = ..()
	gun = new(src)
	START_PROCESSING(SSobj, src)

/obj/item/bowquiver/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/bowquiver/process()
	overheat = max(0, overheat - heat_diffusion)

/obj/item/bowquiver/on_attack_hand(mob/living/carbon/user)
	if(src.loc == user)
		if(!armed)
			if(user.get_item_by_slot(SLOT_BELT) == src)
				armed = 1
				if(!user.put_in_hands(gun))
					armed = 0
					to_chat(user, "<span class='warning'>You need a free hand to hold the bow!</span>")
					return
				update_icon()
				user.update_inv_back()
		else
			to_chat(user, "<span class='warning'>You are already holding the bow!</span>")
	else
		..()

/obj/item/bowquiver/attackby(obj/item/W, mob/user, params)
	if(W == gun) //Don't need armed check, because if you have the gun assume its armed.
		user.dropItemToGround(gun, TRUE)
	else
		..()

/obj/item/bowquiver/dropped(mob/user)
	. = ..()
	if(armed)
		user.dropItemToGround(gun, TRUE)

/obj/item/bowquiver/MouseDrop(atom/over_object)
	. = ..()
	if(armed)
		return
	if(iscarbon(usr))
		var/mob/M = usr

		if(!over_object)
			return

		if(!M.incapacitated())

			if(istype(over_object, /obj/screen/inventory/hand))
				var/obj/screen/inventory/hand/H = over_object
				M.putItemFromInventoryInHandIfPossible(src, H.held_index)

/obj/item/bowquiver/proc/attach_gun(mob/user)
	if(!gun)
		gun = new(src)
	gun.forceMove(src)
	armed = 0
	if(user)
		to_chat(user, "<span class='notice'>You attach the [gun.name] to the [name].</span>")
	else
		src.visible_message("<span class='warning'>The [gun.name] snaps back onto the [name]!</span>")
	update_icon()
	user.update_inv_back()


/obj/item/gun/ballistic/quiver/bow
	name = "Bow"
	desc = "A bow. With a quiver."
	//icon = 'icons/obj/guns/minigun.dmi'
	icon_state = "tribalbow"
	item_state = "tribalbow"
	flags_1 = CONDUCT_1
	slowdown = 1
	slot_flags = null
	w_class = WEIGHT_CLASS_HUGE
	custom_materials = null
	burst_size = 1
	//automatic = 0
	fire_delay = 13
	weapon_weight = WEAPON_HEAVY
	fire_sound = 'sound/weapons/grenadelaunch.ogg'
	mag_type = /obj/item/ammo_box/magazine/internal/tribalbow
	casing_ejector = FALSE
	//item_flags = NEEDS_PERMIT | SLOWS_WHILE_IN_HAND
	var/obj/item/bowquiver/quiver

/obj/item/gun/ballistic/quiver/bow/Initialize()
	if(istype(loc, /obj/item/bowquiver)) //We should spawn inside an ammo pack so let's use that one.
		quiver = loc
	else
		return INITIALIZE_HINT_QDEL //No pack, no gun

	return ..()

/obj/item/gun/ballistic/quiver/bow/attack_self(mob/living/user)
	return

/obj/item/gun/ballistic/quiver/bow/dropped(mob/user)
	. = ..()
	if(quiver)
		quiver.attach_gun(user)
	else
		qdel(src)

/obj/item/gun/ballistic/quiver/bow/process_fire(atom/target, mob/living/user, message = TRUE, params = null, zone_override = "", bonus_spread = 0, stam_cost = 0)
	if(quiver)
		if(quiver.overheat < quiver.overheat_max)
			quiver.overheat += burst_size
			..()
		else
			to_chat(user, "You are too tired to uset the bow!")

/obj/item/gun/ballistic/quiver/bow/afterattack(atom/target, mob/living/user, flag, params)
	if(!quiver || quiver.loc != user)
		to_chat(user, "You need the quiver to fire the bow.!")
	. = ..()

/obj/item/gun/ballistic/quiver/bow/dropped(mob/living/user)
	. = ..()
	quiver.attach_gun(user)
