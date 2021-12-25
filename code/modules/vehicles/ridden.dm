/obj/vehicle/ridden
	name = "ridden vehicle"
	can_buckle = TRUE
	max_buckled_mobs = 1
	buckle_lying = FALSE
	default_driver_move = FALSE
	var/legs_required = 1
	var/arms_required = 0	//why not?

/obj/vehicle/ridden/Initialize()
	. = ..()
	LoadComponent(/datum/component/riding)

/obj/vehicle/ridden/examine(mob/user)
	. = ..()
	if(key_type)
		if(!inserted_key)
			. += SPAN_NOTICE("Put a key inside it by clicking it with the key.")
		else
			. += SPAN_NOTICE("Alt-click [src] to remove the key.")

/obj/vehicle/ridden/generate_action_type(actiontype)
	var/datum/action/vehicle/ridden/A = ..()
	. = A
	if(istype(A))
		A.vehicle_ridden_target = src

/obj/vehicle/ridden/post_unbuckle_mob(mob/living/M)
	remove_occupant(M)
	return ..()

/obj/vehicle/ridden/post_buckle_mob(mob/living/M)
	add_occupant(M)
	if(M.get_num_legs() < legs_required)
		to_chat(M, SPAN_WARNING("You don't have enough legs to operate the pedals!"))
		unbuckle_mob(M)
	return ..()

/obj/vehicle/ridden/attackby(obj/item/I, mob/user, params)
	if(key_type && !is_key(inserted_key) && is_key(I))
		if(user.transferItemToLoc(I, src))
			to_chat(user, SPAN_NOTICE("You insert \the [I] into \the [src]."))
			if(inserted_key)	//just in case there's an invalid key
				inserted_key.forceMove(drop_location())
			inserted_key = I
		else
			to_chat(user, SPAN_NOTICE("[I] seems to be stuck to your hand!"))
		return
	return ..()

/obj/vehicle/ridden/AltClick(mob/user)
	. = ..()
	if(inserted_key && user.canUseTopic(src, BE_CLOSE, ismonkey(user)))
		if(!is_occupant(user))
			to_chat(user, SPAN_NOTICE("You must be riding the [src] to remove [src]'s key!"))
			return
		to_chat(user, SPAN_NOTICE("You remove \the [inserted_key] from \the [src]."))
		inserted_key.forceMove(drop_location())
		user.put_in_hands(inserted_key)
		inserted_key = null
		return TRUE

/obj/vehicle/ridden/driver_move(mob/user, direction)
	if(key_type && !is_key(inserted_key))
		to_chat(user, SPAN_WARNING("[src] has no key inserted!"))
		return FALSE
	var/datum/component/riding/R = GetComponent(/datum/component/riding)
	R.handle_ride(user, direction)
	return ..()

/obj/vehicle/ridden/user_buckle_mob(mob/living/M, mob/user, check_loc = TRUE)
	if(!in_range(user, src) || !in_range(M, src))
		return FALSE
	. = ..(M, user, FALSE)

/obj/vehicle/ridden/buckle_mob(mob/living/M, force = FALSE, check_loc = TRUE)
	if(!force && occupant_amount() >= max_occupants)
		return FALSE
	return ..()

/obj/vehicle/ridden/zap_act(zap_str, zap_flags, shocked_targets)
	zap_buckle_check(zap_str)
	. = ..()
