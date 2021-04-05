/obj/machinery/mineral/wasteland_trader
	name = "Trading point"
	desc = "Trading point at which you can sell select goods for caps"
	icon = 'icons/WVM/machines.dmi'
	icon_state = "weapon_idle"

	density = TRUE
	use_power = FALSE
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	can_be_unanchored = FALSE
	layer = 2.9

/obj/machinery/mineral/wasteland_trader/general
	name = "Trading point"
	icon_state = "generic_idle"

/obj/machinery/mineral/wasteland_trader/ui_interact(mob/user)
	return

/obj/machinery/mineral/wasteland_trader/Topic(href, href_list)
	return

/obj/machinery/mineral/wasteland_trader/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/stack/f13Cash/caps))
		to_chat(usr, "<span class='warning'>You can't sell caps for caps.</span>")
		return
	if(!I.Value)
		to_chat(usr, "<span class='warning'>[I] has no value.</span>")
		playsound(src, 'sound/machines/buzz-sigh.ogg', 50, 0)
		return
	if(I.Value < 1)
		to_chat(usr, "<span class='warning'>The value of [I] is worth less than one cap. Aborting.</span>")
		playsound(src, 'sound/machines/buzz-sigh.ogg', 50, 0)
		return
	var/M = 0
	if(istype(I, /obj/item/stack))
		var/obj/item/stack/S = I
		M = round(S.amount * S.Value)
	else
		M = I.Value
	to_chat(usr, "<span class='notice'>[I] was sold for; [M] caps.</span>")
	playsound(src, 'sound/items/coinflip.ogg', 60, 1)
	var/obj/item/stack/f13Cash/caps/C = new /obj/item/stack/f13Cash/caps (src.loc)
	C.amount = M
	C.update_icon()
	qdel(I)
	return