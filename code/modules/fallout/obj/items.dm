/obj/item/traumapack
	name = "trauma pack"
	desc = "A backpack filled with a blend of healing chemicals that inject automatically upon the wearer being hurt."
	icon = 'icons/obj/storage.dmi'
	icon_state = "welderpack"
	item_state = "welderpack"
	lefthand_file = 'icons/mob/inhands/equipment/backpack_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/backpack_righthand.dmi'
	throwforce = 0
	hitsound = null
	w_class = WEIGHT_CLASS_BULKY
	throw_speed = 2
	throw_range = 5
	slot_flags = ITEM_SLOT_BACK

/obj/item/traumapack/New()
	..()
	START_PROCESSING(SSobj, src)

/obj/item/traumapack/Destroy()
	STOP_PROCESSING(SSobj,src)
	. = ..()

/obj/item/traumapack/process()
	if(iscarbon(loc))
		var/mob/living/carbon/M = loc
		if(src == M.back)
			if(M.health < M.maxHealth)
				M.adjustBruteLoss(-2) //Heal that poor bastard
				M.adjustFireLoss(-2)
				M.adjustToxLoss(-2)
				M.adjustOxyLoss(-2)


/obj/item/guncase
	name = "firearm case"
	desc = "A briefcase containing a Ranger's perferred firearm."
	icon = 'icons/obj/storage.dmi'
	icon_state = "secure"

/obj/item/guncase/attack_self(mob/living/user)
	var/list/weapons = list()
	weapons["M4 Scout Carbine"] = list(/obj/item/storage/backpack/duffelbag/scoutcarbine)
	weapons["M1 Carbine"]=	list(/obj/item/storage/backpack/duffelbag/m1carbine)
	weapons["Browning Auto-5 Shotgun"] = list(/obj/item/storage/backpack/duffelbag/auto5)
	var/choice = input(user,"Select your stored weapon.") as null|anything in weapons
	if(src && choice)
		var/list/chosen = weapons[choice]
		for(var/new_type in chosen)
			var/atom/movable/gun = new new_type(get_turf(src))
			if(istype(gun, /obj/item/gun/))
				to_chat(user, "You take [gun] out of the case.")
		qdel(src)

/obj/item/storage/backpack/duffelbag/scoutcarbine

/obj/item/storage/backpack/duffelbag/scoutcarbine/PopulateContents()
	new /obj/item/gun/ballistic/automatic/service/carbine(src)
	new /obj/item/ammo_box/magazine/m556/rifle/assault(src)
	new /obj/item/ammo_box/magazine/m556/rifle/assault(src)
	new /obj/item/ammo_box/magazine/m556/rifle/assault(src)

/obj/item/storage/backpack/duffelbag/m1carbine

/obj/item/storage/backpack/duffelbag/m1carbine/PopulateContents()
	new /obj/item/gun/ballistic/automatic/m1carbine/ncr(src)
	new /obj/item/ammo_box/magazine/m10mm_adv/ext(src)
	new /obj/item/ammo_box/magazine/m10mm_adv/ext(src)
	new /obj/item/ammo_box/magazine/m10mm_adv/ext(src)

/obj/item/storage/backpack/duffelbag/auto5

/obj/item/storage/backpack/duffelbag/auto5/PopulateContents()
	new /obj/item/gun/ballistic/shotgun/automatic/combat/auto5(src)
	new /obj/item/ammo_box/shotgun/buck(src)
	new /obj/item/ammo_box/shotgun/buck(src)
	new /obj/item/ammo_box/shotgun/slug(src)
