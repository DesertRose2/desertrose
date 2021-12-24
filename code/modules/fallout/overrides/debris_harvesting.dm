/obj/effect/decal/remains
	var/list/obj/item/debris_result = list(/obj/item/stack/sheet/bone)
	var/drop_amount = 1

/obj/effect/decal/remains/Initialize()
	if(isemptylist(debris_result))
		return INITIALIZE_HINT_QDEL
	. = ..()

/obj/effect/decal/remains/attack_hand(mob/user)
	visible_message(SPAN_NOTICE("[user] begins to pick through [src]."))
	if(do_after(user, 40, target = src))
		var/atom/find = make_debris()
		if(find)
			to_chat(user, SPAN_NOTICE("You find \a [find] in [src]!"))
			if(drop_amount == 0)
				qdel(src)
				return
		return
	. = ..()

/obj/effect/decal/remains/proc/make_debris()
	drop_amount--
	var/type_to_spawn = pick(debris_result)
	return new type_to_spawn (get_turf(src))

/obj/effect/decal/remains/examine_more()
	. = list(SPAN_NOTICE("<i>You examine [src] closer, and note the following...</i>"))
	if(LAZYLEN(debris_result))
		var/obj/item/show = pick(debris_result)
		. += SPAN_NOTICE("You think you can see some [initial(show.name)] in it.")
	if(drop_amount && (drop_amount < initial(drop_amount)))
		. += SPAN_NOTICE("It looks like it has already been picked through somewhat.")
	return .

/obj/effect/decal/remains/human
	drop_amount = 2

/obj/effect/decal/remains/plasma
	drop_amount = 0

/obj/effect/decal/remains/xeno
	drop_amount = 2

/obj/effect/decal/remains/robot
	debris_result = list(/obj/item/stack/sheet/metal, /obj/item/stack/cable_coil, /obj/item/stack/rods)
	drop_amount = 2
