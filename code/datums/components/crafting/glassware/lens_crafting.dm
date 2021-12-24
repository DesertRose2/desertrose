//This file is for crafting using a lens!

/obj/item/glasswork/glass_base/lens
	name = "optical lens"
	desc = "Good for selling or crafting, by itself it's useless"
	icon = 'icons/obj/glass_ware.dmi'
	icon_state = "glass_optics"

//Laser pointers - 2600
/obj/item/glasswork/glass_base/laserpointer_shell
	name = "laser pointer assembly"
	desc = "Good for selling or crafting, by itself it's useless. Needs a power capactor."
	icon_state = "laser_case"
	icon = 'icons/obj/glass_ware.dmi'
	next_step = /obj/item/glasswork/glass_base/laserpointer_shell_1

/obj/item/glasswork/glass_base/laserpointer_shell/attackby(obj/item/I, mob/user, params)
	..()
	if(istype(I, /obj/item/stock_parts/capacitor))
		new next_step(user.loc, 1)
		qdel(src)

/obj/item/glasswork/glass_base/laserpointer_shell_1
	name = "laser pointer assembly"
	desc = "Good for selling or crafting, by itself it's useless. Needs a glass lens."
	icon_state = "laser_wire"
	icon_state = "laser_case"
	next_step = /obj/item/glasswork/glass_base/laserpointer_shell_2

/obj/item/glasswork/glass_base/laserpointer_shell_1/attackby(obj/item/I, mob/user, params)
	..()
	if(istype(I, /obj/item/glasswork/glass_base/lens))
		new next_step(user.loc, 1)
		qdel(src)

/obj/item/glasswork/glass_base/laserpointer_shell_2
	name = "laser pointer assembly"
	desc = "Good for selling or crafting, by itself it's useless. Needs to be screwed together."
	icon_state = "laser_wire"
	icon_state = "laser_case"
	next_step = /obj/item/laser_pointer/blue/handmade

/obj/item/glasswork/glass_base/laserpointer_shell_2/attackby(obj/item/I, mob/user, params)
	..()
	if(I.tool_behaviour == TOOL_SCREWDRIVER)
		if(do_after(user,260, target = src))
			new next_step(user.loc, 1)
			qdel(src)

//NERD SHIT - 5000

/obj/item/glasswork/glass_base/glasses_frame
	name = "glasses frame"
	desc = "Good for crafting a pare of glasses, by itself it's useless. Just add a pare of lens."
	icon = 'icons/obj/glass_ware.dmi'
	icon_state = "frames"
	next_step = /obj/item/glasswork/glass_base/glasses_frame_1

/obj/item/glasswork/glass_base/glasses_frame/attackby(obj/item/I, mob/user, params)
	..()
	if(istype(I, /obj/item/glasswork/glass_base/lens))
		if(do_after(user,60, target = src))
			new next_step(user.loc, 1)
			qdel(src)

/obj/item/glasswork/glass_base/glasses_frame_1
	name = "glasses frame"
	desc = "Good for crafting a pare of glasses, by itself it's useless. Just add a the other lens."
	icon = 'icons/obj/glass_ware.dmi'
	icon_state = "frames_1"
	next_step = /obj/item/glasswork/glass_base/glasses_frame_2

/obj/item/glasswork/glass_base/glasses_frame_1/attackby(obj/item/I, mob/user, params)
	..()
	if(istype(I, /obj/item/glasswork/glass_base/lens))
		if(do_after(user,60, target = src))
			new next_step(user.loc, 1)
			qdel(src)

/obj/item/glasswork/glass_base/glasses_frame_2
	name = "glasses frame"
	desc = "Good for crafting a pare of glasses, by itself it's useless. Just adjust the pices into the frame with a screwdriver."
	icon = 'icons/obj/glass_ware.dmi'
	icon_state = "frames_2"
	next_step = /obj/item/glasswork/glasses

/obj/item/glasswork/glass_base/glasses_frame_2/attackby(obj/item/I, mob/user, params)
	..()
	if(I.tool_behaviour == TOOL_SCREWDRIVER)
		if(do_after(user,180, target = src))
			new next_step(user.loc, 1)
			qdel(src)

/obj/item/glasswork/glasses
	name = "handmade glasses"
	desc = "Handmade glasses that have not been polished at all making them useless. Selling them could still be worth a few credits."
	icon = 'icons/obj/glass_ware.dmi'
	icon_state = "frames_2"
