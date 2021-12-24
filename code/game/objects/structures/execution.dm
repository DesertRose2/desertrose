#define VIABLE_MOB_CHECK(X) (isliving(X) && !issilicon(X) && !isbot(X))

/obj/structure/cross
	name = "cross"
	icon = 'icons/obj/cross.dmi'
	icon_state = "cross"
	desc = "Degenerates like you belong on one of these."
	density = TRUE
	anchored = TRUE
	buckle_lying = 0
	can_buckle = 1
	max_integrity = 250
	bound_height = 64

/obj/structure/cross/crowbar_act(mob/living/user, obj/item/I)
	if(has_buckled_mobs())
		to_chat(user, SPAN_NOTICE("You can't do that while something's on the cross!"))
		return FALSE
	if(I.use_tool(src, user, 20, volume=100))
		deconstruct(TRUE)
	return TRUE

/obj/structure/cross/deconstruct()
	new /obj/item/stack/sheet/mineral/wood(src.loc, 10)
	qdel(src)

/obj/structure/cross/on_attack_hand(mob/user, act_intent = user.a_intent, unarmed_attack_flags)
	if(VIABLE_MOB_CHECK(user.pulling) && user.a_intent == INTENT_GRAB && !has_buckled_mobs())
		var/mob/living/L = user.pulling
		if(HAS_TRAIT(user, TRAIT_PACIFISM) && L.stat != DEAD)
			to_chat(user, SPAN_WARNING("You don't want to hurt a living creature!"))
			return
		if(do_mob(user, src, 120))
			if(has_buckled_mobs()) //                to prevent spam/queing up attacks
				return
			if(L.buckled)
				return
			if(user.pulling != L)
				return
			playsound(src.loc, "sound/effects/crossed.ogg", 20, 1) // thanks hippie
			L.visible_message(SPAN_DANGER("[user] ties [L] to the cross!"), "<span class='userdanger'>[user] ties you to the cross!</span>")
			L.forceMove(drop_location())
			L.emote("scream")
			if(iscarbon(L))
				var/mob/living/carbon/C = L
				C.bleed(30)
			else
				L.add_splatter_floor()
			L.adjustBruteLoss(30)
			L.setDir(2)
			buckle_mob(L, force=1)
			L.pixel_y = 26
			L.overlays += image('icons/obj/cross.dmi', "lashing")
		to_chat(user, SPAN_DANGER("You can't use that on the cross!"))
	else if (has_buckled_mobs())
		for(var/mob/living/L in buckled_mobs)
			user_unbuckle_mob(L, user)
	else
		..()

/obj/structure/cross/user_buckle_mob(mob/living/M, mob/living/user)
	return
	
/obj/structure/cross/user_unbuckle_mob(mob/living/buckled_mob, mob/living/carbon/human/user)
	if(buckled_mob && buckled_mob.buckled == src)
		var/mob/living/M = buckled_mob
		if(M != user)
			M.visible_message(\
				"[user] tries to pull [M] free of the [src]!",\
				SPAN_NOTICE("[user.name] is trying to pull you off the [src], opening up fresh wounds!"),\
				"<span class='italics'>You hear rope being unraveled.</span>")
			if(!do_after(user, 300, target = src))
				if(M && M.buckled)
					M.visible_message(\
					"[user] fails to free [M]!",\
					SPAN_NOTICE("[user] fails to pull you off of the [src]."))
				return

		else
			M.visible_message(\
			SPAN_WARNING("[M] struggles to break free from the [src]!"),\
			SPAN_NOTICE("You struggle to break free from the [src], exacerbating your wounds! (Stay still for two minutes.)"),\
			"<span class='italics'>You hear violent scraping and struggling.</span>")
			M.adjustBruteLoss(20)
			if(!do_after(M, 1200, target = src))
				if(M && M.buckled)
					to_chat(M, SPAN_WARNING("You fail to free yourself!"))
				return
		if(!M.buckled)
			return
		untie_mob(M)

/obj/structure/cross/proc/untie_mob(mob/living/M)
	M.pixel_y = M.get_standard_pixel_y_offset()
	M.adjustBruteLoss(15)
	M.visible_message(SPAN_DANGER("[M] falls free of [src]!"), SPAN_DANGER("You fall free of [src]!"))
	unbuckle_mob(M,force=1)
	M.emote("collapse")
	M.overlays -= image('icons/obj/cross.dmi', "lashing")

/obj/structure/cross/Destroy()
	if(has_buckled_mobs())
		for(var/mob/living/L in buckled_mobs)
			untie_mob(L)
	return ..()

/obj/structure/gallow
	name = "gallow"
	icon = 'icons/obj/gallows.dmi'
	icon_state = "gallow"
	desc = "A post made to make a statement."
	density = TRUE
	anchored = TRUE
	buckle_lying = 0
	can_buckle = 1
	max_integrity = 250
	bound_height = 64

/obj/structure/gallow/crowbar_act(mob/living/user, obj/item/I)
	if(has_buckled_mobs())
		to_chat(user, SPAN_NOTICE("You can't do that while something's on the gallow!"))
		return FALSE
	if(I.use_tool(src, user, 20, volume=100))
		deconstruct()
	return TRUE

/obj/structure/gallow/deconstruct()
	new /obj/item/stack/sheet/mineral/wood(src.loc, 10)
	qdel(src)

/obj/structure/gallow/attack_hand(mob/user)
	if(VIABLE_MOB_CHECK(user.pulling) && user.a_intent == INTENT_GRAB && !has_buckled_mobs())
		var/mob/living/L = user.pulling
		if(HAS_TRAIT(user, TRAIT_PACIFISM) && L.stat != DEAD)
			to_chat(user, SPAN_WARNING("You don't want to hurt a living creature!"))
			return
		if(do_mob(user, src, 120))
			if(has_buckled_mobs()) //to prevent spam/queing up attacks
				return
			if(L.buckled)
				return
			if(user.pulling != L)
				return
			playsound(src.loc, "sound/effects/crossed.ogg", 20, 1) // thanks hippie
			L.visible_message(SPAN_DANGER("[user] hangs [L] on the gallow!"), "<span class='userdanger'>[user] hangs you on the gallow!</span>")
			L.forceMove(drop_location())
			L.setDir(2)
			buckle_mob(L, force=1)
			L.pixel_y = 19
			L.pixel_x = 6
			L.overlays += image('icons/obj/gallows.dmi', "noose")
			L.adjustOxyLoss(80)
			L.losebreath = 200 //there's a noose around your neck, goodluck breathing
		to_chat(user, SPAN_DANGER("You can't use that on the gallow!"))
	else if (has_buckled_mobs())
		for(var/mob/living/L in buckled_mobs)
			user_unbuckle_mob(L, user)
	else
		..()

/obj/structure/gallow/user_unbuckle_mob(mob/living/buckled_mob, mob/living/carbon/human/user)
	if(buckled_mob && buckled_mob.buckled == src)
		var/mob/living/M = buckled_mob
		if(M != user)
			M.visible_message(\
				"[user] tries to unhang [M] from the [src]!",\
				SPAN_NOTICE("[user.name] is trying to unhang you off the [src]!"),\
				"<span class='italics'>You hear rope being unraveled.</span>")
			if(!do_after(user, 300, target = src))
				if(M && M.buckled)
					M.visible_message(\
					"[user] fails to free [M]!",\
					SPAN_NOTICE("[user] fails to unhang you off of the [src]."))
				return

		else
			M.visible_message(\
			SPAN_WARNING("[M] struggles to break free from the [src]!"),\
			SPAN_NOTICE("You struggle to break free from the [src], tightening the rope around your neck! (Stay still for two minutes.)"),\
			"<span class='italics'>You hear violent choking and struggling.</span>")
			M.adjustOxyLoss(40)
			if(!do_after(M, 1200, target = src))
				if(M && M.buckled)
					to_chat(M, SPAN_WARNING("You fail to free yourself!"))
				return
		if(!M.buckled)
			return
		untie_mob(M)

/obj/structure/gallow/proc/untie_mob(mob/living/M)
	M.pixel_y = M.get_standard_pixel_y_offset()
	M.visible_message(SPAN_DANGER("[M] falls free of [src]!"), SPAN_DANGER("You fall free of [src]!"))
	unbuckle_mob(M,force=1)
	M.losebreath = 0
	M.emote("collapse")
	M.overlays -= image('icons/obj/gallows.dmi', "noose")

/obj/structure/gallow/Destroy()
	if(has_buckled_mobs())
		for(var/mob/living/L in buckled_mobs)
			untie_mob(L)
	return ..()

#undef VIABLE_MOB_CHECK
