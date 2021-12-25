// ID locked Fallout doors, unpowered being as the name says, simple mechanical doors.

/obj/machinery/door/unpowered
	icon = 'icons/fallout/structures/doors.dmi'
	armor = list("melee" = 25, "bullet" = 25, "laser" = 25, "energy" = 25, "bomb" = 25, "bio" = 100, "rad" = 100, "fire" = 80, "acid" = 70)
	autoclose = TRUE
	max_integrity = 300
	obj_integrity = 300
	req_one_access_txt = null // Add the channel for the ID you want to lock this door to, check defines.

/obj/machinery/door/unpowered/Bumped(atom/movable/AM)
	if(src.locked)
		return
	..()
	return

/obj/machinery/door/unpowered/attackby(obj/item/I, mob/user, params)
	if(locked)
		return
	else
		return ..()


//Can be ID locked, but NOT padlocked. Only use if you must use ID lock, a sort of simulated key and lock system for semi-public areas.
/obj/machinery/door/unpowered/securedoor
	name = "secure door"
	desc = "Thick wooden door with a built-in lock. Can't be padlocked."
	icon_state = "secure"
	assemblytype = /obj/item/stack/sheet/mineral/wood/five
	density = TRUE
	explosion_block = TRUE

/obj/machinery/door/unpowered/securedoor/update_icon()
	if(density)
		icon_state = "secure"
	else
		icon_state = "secureopen"

/obj/machinery/door/unpowered/securedoor/do_animate(animation)
	switch(animation)
		if("opening")
			playsound(src,'sound/machines/door_open.ogg',40,1)
			flick("secure_opening", src)
		if("closing")
			playsound(src,'sound/machines/door_close.ogg',40,1)
			flick("secure_closing", src)

//Shop outer door
/obj/machinery/door/unpowered/securedoor/shop
	name = "locked shop door"
	max_integrity = 500
	obj_integrity = 500
	req_access_txt = "141"

//Legion Castrum standard secure door
/obj/machinery/door/unpowered/securedoor/legion
	name = "Legion Castrum"
	req_access_txt = "123"


//Steel version, very durable
/obj/machinery/door/unpowered/secure_steeldoor
	name = "locked steel door"
	desc = "Steel-plated door with a built-in lock. Can't be padlocked."
	icon_state = "secure_steel"
	assemblytype = /obj/item/stack/sheet/metal/ten
	max_integrity = 700
	obj_integrity = 700
	density = TRUE
	explosion_block = TRUE

/obj/machinery/door/unpowered/secure_steeldoor/update_icon()
	if(density)
		icon_state = "secure_steel"
	else
		icon_state = "secure_steelopen"

/obj/machinery/door/unpowered/secure_steeldoor/do_animate(animation)
	switch(animation)
		if("opening")
			playsound(src,'sound/machines/door_open.ogg',40,1)
			flick("secure_steel_opening", src)
		if("closing")
			playsound(src,'sound/machines/door_close.ogg',40,1)
			flick("secure_steel_closing", src)

// Shop inner door
/obj/machinery/door/unpowered/secure_steeldoor/shopstorage
	name = "shop storeroom"
	req_access_txt = "139"
	autoclose = TRUE


// ID lock it, so guards etc can access, but those outside faction cannot.
/obj/machinery/door/unpowered/celldoor
	name = "cell door"
	desc = "Celldoor with a built-in lock. Can't be padlocked."
	icon_state = "cell" 
	max_integrity = 600
	obj_integrity = 600
	assemblytype = /obj/item/stack/rods
	density = TRUE
	visible = FALSE
	explosion_block = FALSE
	pass_flags = LETPASSTHROW 
	proj_pass_rate = 95

/obj/machinery/door/unpowered/celldoor/update_icon()
	if(density)
		icon_state = "cell"
	else
		icon_state = "cellopen"

/obj/machinery/door/unpowered/celldoor/do_animate(animation)
	switch(animation)
		if("opening")
			playsound(src,'sound/f13machines/doorchainlink_open.ogg',40,1)
			flick("cell_opening", src)
		if("closing")
			playsound(src,'sound/f13machines/doorchainlink_close.ogg',40,1)
			flick("cell_closing", src)

// Legion dungeon celldoor
/obj/machinery/door/unpowered/celldoor/legion
	name = "Prison door"
	req_access_txt = "123"