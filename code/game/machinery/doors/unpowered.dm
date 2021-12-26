// ID locked Fallout doors, unpowered being as the name says, simple mechanical doors. The doors in this file can be ID locked, but no padlocked, so reverse of simple doors.

/obj/machinery/door/unpowered
	icon = 'icons/fallout/structures/doors.dmi'
	armor = list("melee" = 25, "bullet" = 25, "laser" = 25, "energy" = 25, "bomb" = 25, "bio" = 100, "rad" = 100, "fire" = 80, "acid" = 70)
	autoclose = TRUE
	density = TRUE
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
	explosion_block = TRUE

/obj/machinery/door/unpowered/secure_steeldoor/update_icon()
	if(density)
		icon_state = "secure_steel"
	else
		icon_state = "secure_steel_open"

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


//  NCR secure door - intended to replace the darned airlocks people build. Same function.
/obj/machinery/door/unpowered/secure_NCR
	name = "reinforced door"
	desc = "Solid oak and metal reinforcements make this style of door a favoured method to secure Republic buildings. Has a built in lock."
	icon_state = "secure_NCR"
	assemblytype = /obj/item/stack/sheet/metal/ten
	max_integrity = 700
	obj_integrity = 700
	explosion_block = TRUE
	req_access_txt = "121"

/obj/machinery/door/unpowered/secure_NCR/update_icon()
	if(density)
		icon_state = "secure_NCR"
	else
		icon_state = "secure_NCR_open"

/obj/machinery/door/unpowered/secure_NCR/do_animate(animation)
	switch(animation)
		if("opening")
			playsound(src,'sound/machines/door_open.ogg',40,1)
			flick("secure_NCR_opening", src)
		if("closing")
			playsound(src,'sound/machines/door_close.ogg',40,1)
			flick("secure_NCR_closing", src)


// ID lock it, so guards etc can access, but those outside faction cannot.
/obj/machinery/door/unpowered/celldoor
	name = "cell door"
	desc = "Celldoor with a built-in lock. Can't be padlocked."
	icon_state = "cell" 
	max_integrity = 600
	obj_integrity = 600
	assemblytype = /obj/item/stack/rods
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


// Legion iron gate. Intended for the outer door of Legion bases, instead of airlocks.
/obj/machinery/door/unpowered/secure_legion
	name = "iron gate"
	desc = "Thick iron rods with sharp tips make for a fitting gate for the Legion castrum."
	icon_state = "secure_legion" 
	max_integrity = 700
	obj_integrity = 700
	assemblytype = /obj/item/stack/rods
	visible = FALSE
	explosion_block = FALSE
	proj_pass_rate = 95
	req_access_txt = "123"

/obj/machinery/door/unpowered/secure_legion/update_icon()
	if(density)
		icon_state = "secure_legion"
	else
		icon_state = "secure_legion_open"

/obj/machinery/door/unpowered/secure_legion/do_animate(animation)
	switch(animation)
		if("opening")
			playsound(src,'sound/f13machines/doorchainlink_open.ogg',40,1)
			flick("secure_legion_opening", src)
		if("closing")
			playsound(src,'sound/f13machines/doorchainlink_close.ogg',40,1)
			flick("secure_legion_closing", src)


// Intended for the outer door of BoS bases, instead of airlocks. Toughest but costs most metal.
/obj/machinery/door/unpowered/secure_bos
	name = "steel security door"
	desc = "Hard steel makes a statement. The statement in this case is stay out."
	icon_state = "secure_bos" 
	max_integrity = 800
	obj_integrity = 800
	assemblytype = /obj/item/stack/sheet/metal/ten
	req_access_txt = "120"

/obj/machinery/door/unpowered/secure_bos/update_icon()
	if(density)
		icon_state = "secure_bos"
	else
		icon_state = "secure_bos_open"

/obj/machinery/door/unpowered/secure_bos/do_animate(animation)
	switch(animation)
		if("opening")
			playsound(src,'sound/machines/door_open.ogg',40,1)
			flick("secure_bos_opening", src)
		if("closing")
			playsound(src,'sound/machines/door_close.ogg',40,1)
			flick("secure_bos_closing", src)