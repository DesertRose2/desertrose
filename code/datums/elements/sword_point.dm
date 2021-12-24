/datum/element/sword_point
	element_flags = ELEMENT_DETACH

/datum/element/sword_point/Attach(datum/target)
	. = ..()
	if(. == ELEMENT_INCOMPATIBLE)
		return
	if(!istype(target))
		return ELEMENT_INCOMPATIBLE
	RegisterSignal(target, COMSIG_ITEM_ALT_AFTERATTACK, .proc/point)

/datum/element/sword_point/Detach(datum/source)
	. = ..()
	UnregisterSignal(source, COMSIG_ITEM_ALT_AFTERATTACK)

/datum/element/sword_point/proc/point(datum/source, atom/target, mob/user, proximity_flag, params)
	if(!proximity_flag && ismob(target))
		user.visible_message(SPAN_NOTICE("[user] points the tip of [source] at [target]."), SPAN_NOTICE("You point the tip of [source] at [target]."))
