/datum/surgery/implant_removal
	name = "implant removal"
	steps = list(/datum/surgery_step/incise, /datum/surgery_step/clamp_bleeders, /datum/surgery_step/retract_skin, /datum/surgery_step/extract_implant, /datum/surgery_step/close)
	target_mobtypes = list(/mob/living/carbon/human, /mob/living/carbon/monkey)
	possible_locs = list(BODY_ZONE_CHEST)
	requires_trait = 1

/datum/surgery/cavity_implant/can_start(mob/user, mob/living/carbon/target, obj/item/tool)
	if(HAS_TRAIT(user,TRAIT_SURGERY_LOW))
		return TRUE
	if(HAS_TRAIT(user,TRAIT_SURGERY_MID))
		return TRUE
	if(HAS_TRAIT(user,TRAIT_SURGERY_HIGH))
		return TRUE
	else
		return FALSE

//extract implant
/datum/surgery_step/extract_implant
	name = "extract implant"
	implements = list(TOOL_HEMOSTAT = 100, TOOL_CROWBAR = 65)
	time = 64
	var/obj/item/implant/I = null
/datum/surgery_step/extract_implant/preop(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	for(var/obj/item/O in target.implants)
		I = O
		break
	if(I)
		display_results(user, target, SPAN_NOTICE("You begin to extract [I] from [target]'s [target_zone]..."),
			"[user] begins to extract [I] from [target]'s [target_zone].",
			"[user] begins to extract something from [target]'s [target_zone].")
	else
		display_results(user, target, SPAN_NOTICE("You look for an implant in [target]'s [target_zone]..."),
			"[user] looks for an implant in [target]'s [target_zone].",
			"[user] looks for something in [target]'s [target_zone].")

/datum/surgery_step/extract_implant/success(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	if(I)
		display_results(user, target, SPAN_NOTICE("You successfully remove [I] from [target]'s [target_zone]."),
			"[user] successfully removes [I] from [target]'s [target_zone]!",
			"[user] successfully removes something from [target]'s [target_zone]!")
		I.removed(target)

		var/obj/item/implantcase/case
		for(var/obj/item/implantcase/ic in user.held_items)
			case = ic
			break
		if(!case)
			case = locate(/obj/item/implantcase) in get_turf(target)
		if(case && !case.imp)
			case.imp = I
			I.forceMove(case)
			case.update_icon()
			display_results(user, target, SPAN_NOTICE("You place [I] into [case]."),
				"[user] places [I] into [case]!",
				"[user] places it into [case]!")
		else
			qdel(I)

	else
		to_chat(user, SPAN_WARNING("You can't find anything in [target]'s [target_zone]!"))
	return 1
/datum/surgery/implant_removal/mechanic
	name = "implant removal"
	requires_bodypart_type = BODYPART_ROBOTIC
	steps = list(
		/datum/surgery_step/mechanic_open,
		/datum/surgery_step/open_hatch,
		/datum/surgery_step/mechanic_unwrench,
		/datum/surgery_step/extract_implant,
		/datum/surgery_step/mechanic_wrench,
		/datum/surgery_step/mechanic_close)
