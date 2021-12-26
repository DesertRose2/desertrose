#define CANDLE_LUMINOSITY	2
/obj/item/candle
	name = "red candle"
	desc = "In Greek myth, Prometheus stole fire from the Gods and gave it to \
		humankind. The jewelry he kept for himself."
	icon = 'icons/obj/candle.dmi'
	icon_state = "candle1"
	item_state = "candle1"
	w_class = WEIGHT_CLASS_TINY
	light_color = LIGHT_COLOR_FIRE
	heat = 1000
	var/wax = 1000
	var/lit = FALSE
	var/infinite = FALSE
	var/start_lit = FALSE
	var/heats_space = TRUE
	var/light_level = CANDLE_LUMINOSITY

/obj/item/candle/Initialize()
	. = ..()
	if(start_lit)
		light()

/obj/item/candle/update_icon_state()
	icon_state = "candle[(wax > 400) ? ((wax > 750) ? 1 : 2) : 3][lit ? "_lit" : ""]"

/obj/item/candle/attackby(obj/item/W, mob/user, params)
	var/msg = W.ignition_effect(src, user)
	if(msg)
		light(msg)
	else
		return ..()

/obj/item/candle/fire_act(exposed_temperature, exposed_volume)
	if(!lit)
		light() //honk
	return ..()

/obj/item/candle/get_temperature()
	return lit * heat * heats_space

/obj/item/candle/proc/light(show_message)
	if(!lit)
		lit = TRUE
		if(show_message)
			usr.visible_message(show_message)
		set_light(light_level)
		START_PROCESSING(SSobj, src)
		update_icon()

/obj/item/candle/proc/put_out_candle()
	if(!lit)
		return
	lit = FALSE
	update_icon()
	set_light(0)
	return TRUE

/obj/item/candle/extinguish()
	put_out_candle()
	return ..()

/obj/item/candle/process()
	if(!lit)
		return PROCESS_KILL
	if(!infinite)
		wax--
	if(!wax)
		new /obj/item/trash/candle(loc)
		qdel(src)
	update_icon()
	if(heats_space)
		open_flame()

/obj/item/candle/attack_self(mob/user)
	if(put_out_candle())
		user.visible_message("<span class='notice'>[user] snuffs [src].</span>")

/obj/item/candle/infinite
	infinite = TRUE
	start_lit = TRUE

/obj/item/candle/infinite/hugbox
	heats_space = FALSE

//FL13 - Right now this functions basically as a candle. Could change it later, but for now this will do.
/obj/item/candle/tribal_torch
	name = "tribal torch"
	desc = "A standing torch, used to provide light in dark environments."
	icon = 'icons/obj/candle.dmi'
	icon_state = "torch_unlit"
	item_state = "torch"
	w_class = WEIGHT_CLASS_BULKY
	light_color = LIGHT_COLOR_FIRE
	infinite = TRUE
	heat = T0C + 400
	light_level = 7
	var/flicker_chance = 1
	var/flickering = FALSE

/obj/item/candle/tribal_torch/attackby(obj/item/W, mob/user, params)
	..()
	var/msg = W.ignition_effect(src, user)
	if(msg)
		light(msg)

/obj/item/candle/tribal_torch/fire_act(exposed_temperature, exposed_volume)
	if(!src.lit)
		light() //honk
	..()

/obj/item/candle/tribal_torch/process()
	. = ..()
	if(!flickering && prob(flicker_chance))
		flicker(rand(1, 4)) // 0.1 to 0.4 seconds

/obj/item/candle/tribal_torch/proc/flicker(duration)
	flickering = TRUE
	addtimer(CALLBACK(src, .proc/unflicker, light_range), duration)
	set_light(light_range - rand(1, 2))

/obj/item/candle/tribal_torch/proc/unflicker(new_range)
	set_light(new_range)
	flickering = FALSE

/obj/item/candle/attack_self(mob/user)
	if(!src.lit)
		to_chat(user, "<span class='notice'>You start pushing [src] into the ground...</span>")
		if (do_after(user, 20, target=src))
			qdel(src)
			new /obj/structure/destructible/tribal_torch(get_turf(user))
			light_color = LIGHT_COLOR_ORANGE
			user.visible_message("<span class='notice'>[user] plants [src] firmly in the ground.</span>", "<span class='notice'>You plant [src] firmly in the ground.</span>")
			return
	else if(lit)
		user.visible_message(
			"<span class='notice'>[user] snuffs [src] out.</span>")
		lit = FALSE
		update_icon()
		set_light(0)


/obj/item/candle/tribal_torch/update_icon()
	icon_state = "torch_[lit ? null : "un"]lit"
	item_state = "torch[lit ? "-on" : null]"

/obj/item/candle/tribal_torch/proc/do_wallmount(turf/T, mob/user)
	var/ndir = turn(get_dir(T, user), 180)
	if(!(ndir in GLOB.cardinals))
		return
	var/turf/user_turf = get_turf(user)
	if(gotwallitem(user_turf, ndir, 2))
		to_chat(user, SPAN_WARNING("There's already an item on this wall!"))
		return
	playsound(src.loc, 'sound/machines/click.ogg', 75, 1)
	user.visible_message("[user.name] attaches [src] to the wall.",
		SPAN_NOTICE("You attach [src] to the wall."),
		"<span class='italics'>You hear clicking.</span>")
	var/type_to_make = lit ? /obj/structure/destructible/tribal_torch/wall/lit : /obj/structure/destructible/tribal_torch/wall
	var/obj/structure/destructible/tribal_torch/wall/wall_torch = new type_to_make (user_turf)
	wall_torch.dir = ndir
	wall_torch.update_icon()
	qdel(src)
	return

#undef CANDLE_LUMINOSITY
