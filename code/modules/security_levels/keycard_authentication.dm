GLOBAL_DATUM_INIT(keycard_events, /datum/events, new)

#define KEYCARD_RED_ALERT "Red Alert"
#define KEYCARD_EMERGENCY_MAINTENANCE_ACCESS "Emergency Maintenance Access"

/obj/machinery/keycard_auth
	name = "Keycard Authentication Device"
	desc = "This device is used to trigger station functions, which require more than one ID card to authenticate."
	icon = 'icons/obj/monitors.dmi'
	icon_state = "auth_off"
	plane = ABOVE_WALL_PLANE
	use_power = IDLE_POWER_USE
	idle_power_usage = 2
	active_power_usage = 6
	power_channel = ENVIRON
	req_access = list(ACCESS_KEYCARD_AUTH)
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	ui_x = 375
	ui_y = 125

	var/datum/callback/ev
	var/event = ""
	var/obj/machinery/keycard_auth/event_source
	var/mob/triggerer = null
	var/obj/item/card/id/first_id = null
	var/waiting = 0

/obj/machinery/keycard_auth/Initialize()
	. = ..()
	ev = GLOB.keycard_events.addEvent("triggerEvent", CALLBACK(src, .proc/triggerEvent))

/obj/machinery/keycard_auth/Destroy()
	GLOB.keycard_events.clearEvent("triggerEvent", ev)
	QDEL_NULL(ev)
	return ..()

/obj/machinery/keycard_auth/ui_state(mob/user)
	return GLOB.physical_state

/obj/machinery/keycard_auth/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "KeycardAuth", name)
		ui.open()

/obj/machinery/keycard_auth/ui_data()
	var/list/data = list()
	data["waiting"] = waiting
	data["auth_required"] = event_source ? event_source.event : 0
	data["red_alert"] = (SECLEVEL2NUM(NUM2SECLEVEL(GLOB.security_level)) >= SEC_LEVEL_RED) ? 1 : 0
	data["emergency_maint"] = GLOB.emergency_access
	return data

/obj/machinery/keycard_auth/ui_status(mob/user)
	if(isanimal(user))
		var/mob/living/simple_animal/A = user
		if(!A.dextrous)
			to_chat(user, SPAN_WARNING("You are too primitive to use this device!"))
			return UI_CLOSE
	return ..()

/obj/machinery/keycard_auth/ui_act(action, params)
	if(..() || waiting)
		return
	var/obj/item/card/id/ID = usr.get_idcard(TRUE)
	if(!ID || !istype(ID))
		return
	if(!check_access(ID))
		return
	switch(action)
		if("red_alert")
			if(!event_source)
				sendEvent(KEYCARD_RED_ALERT, ID)
				. = TRUE
		if("emergency_maint")
			if(!event_source)
				sendEvent(KEYCARD_EMERGENCY_MAINTENANCE_ACCESS, ID)
				. = TRUE
		if("auth_swipe")
			if(event_source && ID != first_id && first_id)
				event_source.trigger_event(usr)
				event_source = null
				. = TRUE

/obj/machinery/keycard_auth/proc/sendEvent(event_type, trigger_id)
	triggerer = usr
	event = event_type
	waiting = 1
	GLOB.keycard_events.fireEvent("triggerEvent", src, trigger_id)
	addtimer(CALLBACK(src, .proc/eventSent), 20)

/obj/machinery/keycard_auth/proc/eventSent()
	triggerer = null
	event = ""
	waiting = 0

/obj/machinery/keycard_auth/proc/triggerEvent(source, trigger_id)
	icon_state = "auth_on"
	first_id = trigger_id
	event_source = source
	addtimer(CALLBACK(src, .proc/eventTriggered), 20)

/obj/machinery/keycard_auth/proc/eventTriggered()
	icon_state = "auth_off"
	event_source = null
	first_id = null

/obj/machinery/keycard_auth/proc/trigger_event(confirmer)
	log_game("[key_name(triggerer)] triggered and [key_name(confirmer)] confirmed event [event]")
	message_admins("[ADMIN_LOOKUPFLW(triggerer)] triggered and [ADMIN_LOOKUPFLW(confirmer)] confirmed event [event]")

	var/area/A1 = get_area(triggerer)
	deadchat_broadcast(" triggered [event] at <span class='name'>[A1.name]</span>.", "<span class='name'>[triggerer]</span>", triggerer)

	var/area/A2 = get_area(confirmer)
	deadchat_broadcast(" confirmed [event] at <span class='name'>[A2.name]</span>.", "<span class='name'>[confirmer]</span>", confirmer)
	switch(event)
		if(KEYCARD_RED_ALERT)
			set_security_level(SEC_LEVEL_RED)
		if(KEYCARD_EMERGENCY_MAINTENANCE_ACCESS)
			make_maint_all_access()

GLOBAL_VAR_INIT(emergency_access, FALSE)
/proc/make_maint_all_access()
	for(var/area/maintenance/A in world)
		for(var/obj/machinery/door/airlock/D in A)
			D.emergency = TRUE
			D.update_icon(0)
	minor_announce("Access restrictions on maintenance and external airlocks have been lifted.", "Attention! Station-wide emergency declared!",1)
	GLOB.emergency_access = TRUE
	SSblackbox.record_feedback("nested tally", "keycard_auths", 1, list("emergency maintenance access", "enabled"))

/proc/revoke_maint_all_access()
	for(var/area/maintenance/A in world)
		for(var/obj/machinery/door/airlock/D in A)
			D.emergency = FALSE
			D.update_icon(0)
	minor_announce("Access restrictions in maintenance areas have been restored.", "Attention! Station-wide emergency rescinded:")
	GLOB.emergency_access = FALSE
	SSblackbox.record_feedback("nested tally", "keycard_auths", 1, list("emergency maintenance access", "disabled"))

#undef KEYCARD_RED_ALERT
#undef KEYCARD_EMERGENCY_MAINTENANCE_ACCESS
