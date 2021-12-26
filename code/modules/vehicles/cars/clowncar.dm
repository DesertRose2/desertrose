/obj/vehicle/sealed/car/clowncar
	name = "clown car"
	desc = "How someone could even fit in there is beyond me."
	icon_state = "clowncar"
	max_integrity = 150
	armor = list("melee" = 70, "bullet" = 40, "laser" = 40, "energy" = 0, "bomb" = 30, "bio" = 0, "rad" = 0, "fire" = 80, "acid" = 80)
	enter_delay = 20
	max_occupants = 50
	movedelay = 0.6
	car_traits = CAN_KIDNAP
	key_type = /obj/item/bikehorn
	key_type_exact = FALSE
	var/droppingoil = FALSE
	var/RTDcooldown = 150
	var/lastRTDtime = 0

/obj/vehicle/sealed/car/clowncar/generate_actions()
	. = ..()
	initialize_controller_action_type(/datum/action/vehicle/sealed/horn/clowncar, VEHICLE_CONTROL_DRIVE)

/obj/vehicle/sealed/car/clowncar/auto_assign_occupant_flags(mob/M)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(H.mind && HAS_TRAIT(H.mind, TRAIT_CLOWN_MENTALITY)) //Ensures only clowns can drive the car. (Including more at once)
			add_control_flags(M, VEHICLE_CONTROL_DRIVE|VEHICLE_CONTROL_PERMISSION)
			return
	add_control_flags(M, VEHICLE_CONTROL_KIDNAPPED)

/obj/vehicle/sealed/car/clowncar/mob_forced_enter(mob/M, silent = FALSE)
	. = ..()
	playsound(src, pick('sound/vehicles/clowncar_load1.ogg', 'sound/vehicles/clowncar_load2.ogg'), 75)

/obj/vehicle/sealed/car/clowncar/take_damage(damage_amount, damage_type = BRUTE, damage_flag = 0, sound_effect = 1, attack_dir)
	. = ..()
	if(prob(33))
		visible_message(SPAN_DANGER("[src] spews out a ton of space lube!"))
		new /obj/effect/particle_effect/foam(loc) //YEET

/obj/vehicle/sealed/car/clowncar/attacked_by(obj/item/I, mob/living/user, attackchain_flags = NONE, damage_multiplier = 1)
	. = ..()
	if(istype(I, /obj/item/reagent_containers/food/snacks/grown/banana))
		var/obj/item/reagent_containers/food/snacks/grown/banana/banana = I
		obj_integrity += min(banana.seed.potency, max_integrity-obj_integrity)
		to_chat(user, SPAN_DANGER("You use the [banana] to repair the [src]!"))
		qdel(banana)

/obj/vehicle/sealed/car/clowncar/Bump(atom/movable/M)
	. = ..()
	if(isliving(M))
		if(ismegafauna(M))
			return
		var/mob/living/L = M
		if(iscarbon(L))
			var/mob/living/carbon/C = L
			C.DefaultCombatKnockdown(40) //I play to make sprites go horizontal
		L.visible_message(SPAN_WARNING("[src] rams into [L] and sucks him up!")) //fuck off shezza this isn't ERP.
		mob_forced_enter(L)
		playsound(src, pick('sound/vehicles/clowncar_ram1.ogg', 'sound/vehicles/clowncar_ram2.ogg', 'sound/vehicles/clowncar_ram3.ogg'), 75)
	else if(istype(M, /turf/closed))
		visible_message(SPAN_WARNING("[src] rams into [M] and crashes!"))
		playsound(src, pick('sound/vehicles/clowncar_crash1.ogg', 'sound/vehicles/clowncar_crash2.ogg'), 75)
		playsound(src, 'sound/vehicles/clowncar_crashpins.ogg', 75)
		DumpMobs(TRUE)

/obj/vehicle/sealed/car/clowncar/emag_act(mob/user)
	. = ..()
	if(obj_flags & EMAGGED)
		return
	obj_flags |= EMAGGED
	to_chat(user, SPAN_DANGER("You scramble the clowncar child safety lock and a panel with 6 colorful buttons appears!"))
	initialize_controller_action_type(/datum/action/vehicle/sealed/RollTheDice, VEHICLE_CONTROL_DRIVE)
	return TRUE

/obj/vehicle/sealed/car/clowncar/Destroy()
	playsound(src, 'sound/vehicles/clowncar_fart.ogg', 100)
	return ..()

/obj/vehicle/sealed/car/clowncar/after_move(direction)
	. = ..()
	if(droppingoil)
		new /obj/effect/decal/cleanable/oil/slippery(loc)

/obj/vehicle/sealed/car/clowncar/proc/RollTheDice(mob/user)
	if(world.time - lastRTDtime < RTDcooldown)
		to_chat(user, SPAN_NOTICE("The button panel is currently recharging."))
		return
	lastRTDtime = world.time
	var/randomnum = rand(1,6)
	switch(randomnum)
		if(1)
			visible_message(SPAN_DANGER("[user] has pressed one of the colorful buttons on [src] and a special banana peel drops out of it."))
			new /obj/item/grown/bananapeel/specialpeel(loc)
		if(2)
			visible_message(SPAN_DANGER("[user] has pressed one of the colorful buttons on [src] and unknown chemicals flood out of it."))
			var/datum/reagents/R = new/datum/reagents(300)
			R.my_atom = src
			R.add_reagent(get_random_reagent_id(), 100)
			var/datum/effect_system/foam_spread/foam = new
			foam.set_up(200, loc, R)
			foam.start()
		if(3)
			visible_message(SPAN_DANGER("[user] has pressed one of the colorful buttons on [src] and the clown car turns on its singularity disguise system."))
			icon = 'icons/obj/singularity.dmi'
			icon_state = "singularity_s1"
			addtimer(CALLBACK(src, .proc/ResetIcon), 100)
		if(4)
			visible_message(SPAN_DANGER("[user] has pressed one of the colorful buttons on [src] and the clown car spews out a cloud of laughing gas."))
			var/datum/reagents/R = new/datum/reagents(300)
			R.my_atom = src
			R.add_reagent(/datum/reagent/consumable/superlaughter, 50)
			var/datum/effect_system/smoke_spread/chem/smoke = new()
			smoke.set_up(R, 4)
			smoke.attach(src)
			smoke.start()
		if(5)
			visible_message(SPAN_DANGER("[user] has pressed one of the colorful buttons on [src] and the clown car starts dropping an oil trail."))
			droppingoil = TRUE
			addtimer(CALLBACK(src, .proc/StopDroppingOil), 30)
		if(6)
			visible_message(SPAN_DANGER("[user] has pressed one of the colorful buttons on [src] and the clown car lets out a comedic toot."))
			playsound(src, 'sound/vehicles/clowncar_fart.ogg', 100)
			for(var/mob/living/L in orange(loc, 6))
				L.emote("laughs")
			for(var/mob/living/L in occupants)
				L.emote("laughs")

/obj/vehicle/sealed/car/clowncar/proc/ResetIcon()
	icon = initial(icon)
	icon_state = initial(icon_state)

/obj/vehicle/sealed/car/clowncar/proc/StopDroppingOil()
	droppingoil = FALSE
