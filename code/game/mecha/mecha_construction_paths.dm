////////////////////////////////
///// Construction datums //////
////////////////////////////////
/datum/component/construction/mecha
	var/base_icon
	var/looky_helpy = TRUE

/datum/component/construction/mecha/examine(datum/source, mob/user, list/examine_list)
	. = ..()
	if(looky_helpy)
		switch(steps[index]["key"])
			if(TOOL_WRENCH)
				examine_list += SPAN_NOTICE("The mech could be <b>wrenched</b> into place.")
			if(TOOL_SCREWDRIVER)
				examine_list += SPAN_NOTICE("The mech could be <b>screwed</b> into place.")
			if(TOOL_WIRECUTTER)
				examine_list += SPAN_NOTICE("The mech wires could be <b>trimmed</b> into place.")
			if(/obj/item/stack/cable_coil)
				examine_list += SPAN_NOTICE("The mech could use some <b>wiring</b>.")
			if(/obj/item/circuitboard)
				examine_list += SPAN_NOTICE("The mech could use a type of<b>circuitboard</b>.")
			if(/obj/item/stock_parts/scanning_module)
				examine_list += SPAN_NOTICE("The mech could use a <b>scanning stock part</b>.")
			if(/obj/item/stock_parts/capacitor)
				examine_list += SPAN_NOTICE("The mech could use a <b>power based stock part</b>.")
			if(/obj/item/stock_parts/cell)
				examine_list += SPAN_NOTICE("The mech could use a <b>power source</b>.")
			if(/obj/item/stack/sheet/metal)
				examine_list += SPAN_NOTICE("The mech could use some <b>sheets of metal</b>.")
			if(/obj/item/stack/sheet/plasteel)
				examine_list += SPAN_NOTICE("The mech could use some <b>sheets of strong steel</b>.")
			if(/obj/item/bikehorn)
				examine_list += SPAN_NOTICE("HONK IT!.")
			if(/obj/item/clothing/mask/gas/clown_hat)
				examine_list += SPAN_NOTICE("GIVE IT CLOWN MAKEUP HONK!.")
			if(/obj/item/clothing/shoes/clown_shoes)
				examine_list += SPAN_NOTICE("GIVE IT GOOFY SHOES HONK HONK!.")
			if(/obj/item/mecha_parts/part)
				examine_list += SPAN_NOTICE("The mech could use a mech <b>part</b>.")
			if(/obj/item/stack/ore/bluespace_crystal)
				examine_list += SPAN_NOTICE("The mech could use a <b>crystal</b> of sorts.")
			if(/obj/item/assembly/signaler/anomaly)
				examine_list += SPAN_NOTICE("The mech could use a <b>anomaly</b> of sorts.")

/datum/component/construction/mecha/spawn_result()
	if(!result)
		return
	// Remove default mech power cell, as we replace it with a new one.
	var/obj/mecha/M = new result(drop_location())
	QDEL_NULL(M.cell)

	var/obj/item/mecha_parts/chassis/parent_chassis = parent
	M.CheckParts(parent_chassis.contents)

	SSblackbox.record_feedback("tally", "mechas_created", 1, M.name)
	QDEL_NULL(parent)

/datum/component/construction/mecha/update_parent(step_index)
	..()
	// By default, each step in mech construction has a single icon_state:
	// "[base_icon][index - 1]"
	// For example, Ripley's step 1 icon_state is "ripley0".
	var/atom/parent_atom = parent
	if(!steps[index]["icon_state"] && base_icon)
		parent_atom.icon_state = "[base_icon][index - 1]"

/datum/component/construction/unordered/mecha_chassis/custom_action(obj/item/I, mob/living/user, typepath)
	. = user.transferItemToLoc(I, parent)
	if(.)
		var/atom/parent_atom = parent
		user.visible_message("[user] has connected [I] to [parent].", SPAN_NOTICE("You connect [I] to [parent]."))
		parent_atom.add_overlay(I.icon_state+"+o")
		qdel(I)

/datum/component/construction/unordered/mecha_chassis/spawn_result()
	var/atom/parent_atom = parent
	parent_atom.icon = 'icons/mecha/mech_construction.dmi'
	parent_atom.density = TRUE
	parent_atom.cut_overlays()
	..()


/datum/component/construction/unordered/mecha_chassis/ripley
	result = /datum/component/construction/mecha/ripley
	steps = list(
		/obj/item/mecha_parts/part/ripley_torso,
		/obj/item/mecha_parts/part/ripley_left_arm,
		/obj/item/mecha_parts/part/ripley_right_arm,
		/obj/item/mecha_parts/part/ripley_left_leg,
		/obj/item/mecha_parts/part/ripley_right_leg
	)

/datum/component/construction/mecha/ripley
	result = /obj/mecha/working/ripley
	base_icon = "ripley"
	steps = list(
		//1
		list(
			"key" = TOOL_WRENCH,
			"desc" = "The hydraulic systems are disconnected."
		),

		//2
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_WRENCH,
			"desc" = "The hydraulic systems are connected."
		),

		//3
		list(
			"key" = /obj/item/stack/cable_coil,
			"amount" = 5,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The hydraulic systems are active."
		),

		//4
		list(
			"key" = TOOL_WIRECUTTER,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The wiring is added."
		),

		//5
		list(
			"key" = /obj/item/circuitboard/mecha/ripley/main,
			"action" = ITEM_DELETE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The wiring is adjusted."
		),

		//6
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Central control module is installed."
		),

		//7
		list(
			"key" = /obj/item/circuitboard/mecha/ripley/peripherals,
			"action" = ITEM_DELETE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Central control module is secured."
		),

		//8
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Peripherals control module is installed."
		),

		//9
		list(
			"key" = /obj/item/stock_parts/scanning_module,
			"action" = ITEM_MOVE_INSIDE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Peripherals control module is secured."
		),

		//10
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "The scanner module is installed."
		),

		//11
		list(
			"key" = /obj/item/stock_parts/capacitor,
			"action" = ITEM_MOVE_INSIDE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Scanner module is secured."
		),

		//12
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Capacitor is installed."
		),

		//13
		list(
			"key" = /obj/item/stock_parts/cell,
			"action" = ITEM_MOVE_INSIDE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Capacitor is secured."
		),

		//14
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "The power cell is installed."
		),

		//15
		list(
			"key" = /obj/item/stack/sheet/metal,
			"amount" = 5,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The power cell is secured."
		),

		//16
		list(
			"key" = TOOL_WRENCH,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Internal armor is installed."
		),

		//17
		list(
			"key" = TOOL_WELDER,
			"back_key" = TOOL_WRENCH,
			"desc" = "Internal armor is wrenched."
		),

		//18
		list(
			"key" = /obj/item/stack/sheet/plasteel,
			"amount" = 5,
			"back_key" = TOOL_WELDER,
			"desc" = "Internal armor is welded."
		),

		//19
		list(
			"key" = TOOL_WRENCH,
			"back_key" = TOOL_CROWBAR,
			"desc" = "External armor is installed."
		),

		//20
		list(
			"key" = TOOL_WELDER,
			"back_key" = TOOL_WRENCH,
			"desc" = "External armor is wrenched."
		),
	)

/datum/component/construction/mecha/ripley/custom_action(obj/item/I, mob/living/user, diff)
	if(!..())
		return FALSE

	switch(index)
		if(1)
			user.visible_message("[user] connects [parent] hydraulic systems", SPAN_NOTICE("You connect [parent] hydraulic systems."))
		if(2)
			if(diff==FORWARD)
				user.visible_message("[user] activates [parent] hydraulic systems.", SPAN_NOTICE("You activate [parent] hydraulic systems."))
			else
				user.visible_message("[user] disconnects [parent] hydraulic systems", SPAN_NOTICE("You disconnect [parent] hydraulic systems."))
		if(3)
			if(diff==FORWARD)
				user.visible_message("[user] adds the wiring to [parent].", SPAN_NOTICE("You add the wiring to [parent]."))
			else
				user.visible_message("[user] deactivates [parent] hydraulic systems.", SPAN_NOTICE("You deactivate [parent] hydraulic systems."))
		if(4)
			if(diff==FORWARD)
				user.visible_message("[user] adjusts the wiring of [parent].", SPAN_NOTICE("You adjust the wiring of [parent]."))
			else
				user.visible_message("[user] removes the wiring from [parent].", SPAN_NOTICE("You remove the wiring from [parent]."))
		if(5)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] into [parent].", SPAN_NOTICE("You install [I] into [parent]."))
			else
				user.visible_message("[user] disconnects the wiring of [parent].", SPAN_NOTICE("You disconnect the wiring of [parent]."))
		if(6)
			if(diff==FORWARD)
				user.visible_message("[user] secures the mainboard.", SPAN_NOTICE("You secure the mainboard."))
			else
				user.visible_message("[user] removes the central control module from [parent].", SPAN_NOTICE("You remove the central computer mainboard from [parent]."))
		if(7)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] into [parent].", SPAN_NOTICE("You install [I] into [parent]."))
			else
				user.visible_message("[user] unfastens the mainboard.", SPAN_NOTICE("You unfasten the mainboard."))
		if(8)
			if(diff==FORWARD)
				user.visible_message("[user] secures the peripherals control module.", SPAN_NOTICE("You secure the peripherals control module."))
			else
				user.visible_message("[user] removes the peripherals control module from [parent].", SPAN_NOTICE("You remove the peripherals control module from [parent]."))
		if(9)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] into [parent].", SPAN_NOTICE("You install [I] into [parent]."))
			else
				user.visible_message("[user] unfastens the peripherals control module.", SPAN_NOTICE("You unfasten the peripherals control module."))
		if(10)
			if(diff==FORWARD)
				user.visible_message("[user] secures the scanner module.", SPAN_NOTICE("You secure the scanner module."))
			else
				user.visible_message("[user] removes the scanner module from [parent].", SPAN_NOTICE("You remove the scanner module from [parent]."))
		if(11)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] to [parent].", SPAN_NOTICE("You install [I] to [parent]."))
			else
				user.visible_message("[user] unfastens the scanner module.", SPAN_NOTICE("You unfasten the scanner module."))
		if(12)
			if(diff==FORWARD)
				user.visible_message("[user] secures [I].", SPAN_NOTICE("You secure [I]."))
			else
				user.visible_message("[user] removes the capacitor from [parent].", SPAN_NOTICE("You remove the capacitor from [parent]."))
		if(13)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I].", SPAN_NOTICE("You install [I]."))
			else
				user.visible_message("[user] unsecures the capacitor from [parent].", SPAN_NOTICE("You unsecure the capacitor from [parent]."))
		if(14)
			if(diff==FORWARD)
				user.visible_message("[user] secures the power cell.", SPAN_NOTICE("You secure the power cell."))
			else
				user.visible_message("[user] pries the power cell from [parent].", SPAN_NOTICE("You pry the power cell from [parent]."))
		if(15)
			if(diff==FORWARD)
				user.visible_message("[user] installs the internal armor layer to [parent].", SPAN_NOTICE("You install the internal armor layer to [parent]."))
			else
				user.visible_message("[user] unfastens the power cell.", SPAN_NOTICE("You unfasten the power cell."))
		if(16)
			if(diff==FORWARD)
				user.visible_message("[user] secures the internal armor layer.", SPAN_NOTICE("You secure the internal armor layer."))
			else
				user.visible_message("[user] pries internal armor layer from [parent].", SPAN_NOTICE("You pry internal armor layer from [parent]."))
		if(17)
			if(diff==FORWARD)
				user.visible_message("[user] welds the internal armor layer to [parent].", SPAN_NOTICE("You weld the internal armor layer to [parent]."))
			else
				user.visible_message("[user] unfastens the internal armor layer.", SPAN_NOTICE("You unfasten the internal armor layer."))
		if(18)
			if(diff==FORWARD)
				user.visible_message("[user] installs the external reinforced armor layer to [parent].", SPAN_NOTICE("You install the external reinforced armor layer to [parent]."))
			else
				user.visible_message("[user] cuts the internal armor layer from [parent].", SPAN_NOTICE("You cut the internal armor layer from [parent]."))
		if(19)
			if(diff==FORWARD)
				user.visible_message("[user] secures the external armor layer.", SPAN_NOTICE("You secure the external reinforced armor layer."))
			else
				user.visible_message("[user] pries external armor layer from [parent].", SPAN_NOTICE("You pry external armor layer from [parent]."))
		if(20)
			if(diff==FORWARD)
				user.visible_message("[user] welds the external armor layer to [parent].", SPAN_NOTICE("You weld the external armor layer to [parent]."))
			else
				user.visible_message("[user] unfastens the external armor layer.", SPAN_NOTICE("You unfasten the external armor layer."))
	return TRUE

/datum/component/construction/unordered/mecha_chassis/gygax
	result = /datum/component/construction/mecha/gygax
	steps = list(
		/obj/item/mecha_parts/part/gygax_torso,
		/obj/item/mecha_parts/part/gygax_left_arm,
		/obj/item/mecha_parts/part/gygax_right_arm,
		/obj/item/mecha_parts/part/gygax_left_leg,
		/obj/item/mecha_parts/part/gygax_right_leg,
		/obj/item/mecha_parts/part/gygax_head
	)

/datum/component/construction/mecha/gygax
	result = /obj/mecha/combat/gygax
	base_icon = "gygax"
	steps = list(
		//1
		list(
			"key" = TOOL_WRENCH,
			"desc" = "The hydraulic systems are disconnected."
		),

		//2
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_WRENCH,
			"desc" = "The hydraulic systems are connected."
		),

		//3
		list(
			"key" = /obj/item/stack/cable_coil,
			"amount" = 5,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The hydraulic systems are active."
		),

		//4
		list(
			"key" = TOOL_WIRECUTTER,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The wiring is added."
		),

		//5
		list(
			"key" = /obj/item/circuitboard/mecha/gygax/main,
			"action" = ITEM_DELETE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The wiring is adjusted."
		),

		//6
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Central control module is installed."
		),

		//7
		list(
			"key" = /obj/item/circuitboard/mecha/gygax/peripherals,
			"action" = ITEM_DELETE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Central control module is secured."
		),

		//8
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Peripherals control module is installed."
		),

		//9
		list(
			"key" = /obj/item/circuitboard/mecha/gygax/targeting,
			"action" = ITEM_DELETE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Peripherals control module is secured."
		),

		//10
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Weapon control module is installed."
		),

		//11
		list(
			"key" = /obj/item/stock_parts/scanning_module,
			"action" = ITEM_MOVE_INSIDE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Weapon control module is secured."
		),

		//12
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Scanner module is installed."
		),

		//13
		list(
			"key" = /obj/item/stock_parts/capacitor,
			"action" = ITEM_MOVE_INSIDE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Scanner module is secured."
		),

		//14
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Capacitor is installed."
		),

		//15
		list(
			"key" = /obj/item/stock_parts/cell,
			"action" = ITEM_MOVE_INSIDE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Capacitor is secured."
		),

		//16
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "The power cell is installed."
		),

		//17
		list(
			"key" = /obj/item/stack/sheet/metal,
			"amount" = 5,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The power cell is secured."
		),

		//18
		list(
			"key" = TOOL_WRENCH,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Internal armor is installed."
		),

		//19
		list(
			"key" = TOOL_WELDER,
			"back_key" = TOOL_WRENCH,
			"desc" = "Internal armor is wrenched."
		),

		//20
		list(
			"key" = /obj/item/mecha_parts/part/gygax_armor,
			"action" = ITEM_DELETE,
			"back_key" = TOOL_WELDER,
			"desc" = "Internal armor is welded."
		),

		//21
		list(
			"key" = TOOL_WRENCH,
			"back_key" = TOOL_CROWBAR,
			"desc" = "External armor is installed."
		),

		//22
		list(
			"key" = TOOL_WELDER,
			"back_key" = TOOL_WRENCH,
			"desc" = "External armor is wrenched."
		),

	)

/datum/component/construction/mecha/gygax/action(datum/source, atom/used_atom, mob/user)
	return check_step(used_atom,user)

/datum/component/construction/mecha/gygax/custom_action(obj/item/I, mob/living/user, diff)
	if(!..())
		return FALSE

	switch(index)
		if(1)
			user.visible_message("[user] connects [parent] hydraulic systems", SPAN_NOTICE("You connect [parent] hydraulic systems."))
		if(2)
			if(diff==FORWARD)
				user.visible_message("[user] activates [parent] hydraulic systems.", SPAN_NOTICE("You activate [parent] hydraulic systems."))
			else
				user.visible_message("[user] disconnects [parent] hydraulic systems", SPAN_NOTICE("You disconnect [parent] hydraulic systems."))
		if(3)
			if(diff==FORWARD)
				user.visible_message("[user] adds the wiring to [parent].", SPAN_NOTICE("You add the wiring to [parent]."))
			else
				user.visible_message("[user] deactivates [parent] hydraulic systems.", SPAN_NOTICE("You deactivate [parent] hydraulic systems."))
		if(4)
			if(diff==FORWARD)
				user.visible_message("[user] adjusts the wiring of [parent].", SPAN_NOTICE("You adjust the wiring of [parent]."))
			else
				user.visible_message("[user] removes the wiring from [parent].", SPAN_NOTICE("You remove the wiring from [parent]."))
		if(5)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] into [parent].", SPAN_NOTICE("You install [I] into [parent]."))
			else
				user.visible_message("[user] disconnects the wiring of [parent].", SPAN_NOTICE("You disconnect the wiring of [parent]."))
		if(6)
			if(diff==FORWARD)
				user.visible_message("[user] secures the mainboard.", SPAN_NOTICE("You secure the mainboard."))
			else
				user.visible_message("[user] removes the central control module from [parent].", SPAN_NOTICE("You remove the central computer mainboard from [parent]."))
		if(7)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] into [parent].", SPAN_NOTICE("You install [I] into [parent]."))
			else
				user.visible_message("[user] unfastens the mainboard.", SPAN_NOTICE("You unfasten the mainboard."))
		if(8)
			if(diff==FORWARD)
				user.visible_message("[user] secures the peripherals control module.", SPAN_NOTICE("You secure the peripherals control module."))
			else
				user.visible_message("[user] removes the peripherals control module from [parent].", SPAN_NOTICE("You remove the peripherals control module from [parent]."))
		if(9)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] into [parent].", SPAN_NOTICE("You install [I] into [parent]."))
			else
				user.visible_message("[user] unfastens the peripherals control module.", SPAN_NOTICE("You unfasten the peripherals control module."))
		if(10)
			if(diff==FORWARD)
				user.visible_message("[user] secures the weapon control module.", SPAN_NOTICE("You secure the weapon control module."))
			else
				user.visible_message("[user] removes the weapon control module from [parent].", SPAN_NOTICE("You remove the weapon control module from [parent]."))
		if(11)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] to [parent].", SPAN_NOTICE("You install [I] to [parent]."))
			else
				user.visible_message("[user] unfastens the weapon control module.", SPAN_NOTICE("You unfasten the weapon control module."))
		if(12)
			if(diff==FORWARD)
				user.visible_message("[user] secures the scanner module.", SPAN_NOTICE("You secure the scanner module."))
			else
				user.visible_message("[user] removes the scanner module from [parent].", SPAN_NOTICE("You remove the scanner module from [parent]."))
		if(13)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] to [parent].", SPAN_NOTICE("You install [I] to [parent]."))
			else
				user.visible_message("[user] unfastens the scanner module.", SPAN_NOTICE("You unfasten the scanner module."))
		if(14)
			if(diff==FORWARD)
				user.visible_message("[user] secures the capacitor.", SPAN_NOTICE("You secure the capacitor."))
			else
				user.visible_message("[user] removes the capacitor from [parent].", SPAN_NOTICE("You remove the capacitor from [parent]."))
		if(15)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] into [parent].", SPAN_NOTICE("You install [I] into [parent]."))
			else
				user.visible_message("[user] unfastens the capacitor.", SPAN_NOTICE("You unfasten the capacitor."))
		if(16)
			if(diff==FORWARD)
				user.visible_message("[user] secures the power cell.", SPAN_NOTICE("You secure the power cell."))
			else
				user.visible_message("[user] pries the power cell from [parent].", SPAN_NOTICE("You pry the power cell from [parent]."))
		if(17)
			if(diff==FORWARD)
				user.visible_message("[user] installs the internal armor layer to [parent].", SPAN_NOTICE("You install the internal armor layer to [parent]."))
			else
				user.visible_message("[user] unfastens the power cell.", SPAN_NOTICE("You unfasten the power cell."))
		if(18)
			if(diff==FORWARD)
				user.visible_message("[user] secures the internal armor layer.", SPAN_NOTICE("You secure the internal armor layer."))
			else
				user.visible_message("[user] pries internal armor layer from [parent].", SPAN_NOTICE("You pry internal armor layer from [parent]."))
		if(19)
			if(diff==FORWARD)
				user.visible_message("[user] welds the internal armor layer to [parent].", SPAN_NOTICE("You weld the internal armor layer to [parent]."))
			else
				user.visible_message("[user] unfastens the internal armor layer.", SPAN_NOTICE("You unfasten the internal armor layer."))
		if(20)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] to [parent].", SPAN_NOTICE("You install [I] to [parent]."))
			else
				user.visible_message("[user] cuts the internal armor layer from [parent].", SPAN_NOTICE("You cut the internal armor layer from [parent]."))
		if(21)
			if(diff==FORWARD)
				user.visible_message("[user] secures Gygax Armor Plates.", SPAN_NOTICE("You secure Gygax Armor Plates."))
			else
				user.visible_message("[user] pries Gygax Armor Plates from [parent].", SPAN_NOTICE("You pry Gygax Armor Plates from [parent]."))
		if(22)
			if(diff==FORWARD)
				user.visible_message("[user] welds Gygax Armor Plates to [parent].", SPAN_NOTICE("You weld Gygax Armor Plates to [parent]."))
			else
				user.visible_message("[user] unfastens Gygax Armor Plates.", SPAN_NOTICE("You unfasten Gygax Armor Plates."))
	return TRUE

//Begin Medigax
/datum/component/construction/unordered/mecha_chassis/medigax
	result = /datum/component/construction/mecha/medigax
	steps = list(
		/obj/item/mecha_parts/part/medigax_torso,
		/obj/item/mecha_parts/part/medigax_left_arm,
		/obj/item/mecha_parts/part/medigax_right_arm,
		/obj/item/mecha_parts/part/medigax_left_leg,
		/obj/item/mecha_parts/part/medigax_right_leg,
		/obj/item/mecha_parts/part/medigax_head
	)

/datum/component/construction/mecha/medigax
	result = /obj/mecha/medical/medigax
	base_icon = "medigax"
	steps = list(
		//1
		list(
			"key" = TOOL_WRENCH,
			"desc" = "The hydraulic systems are disconnected."
		),

		//2
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_WRENCH,
			"desc" = "The hydraulic systems are connected."
		),

		//3
		list(
			"key" = /obj/item/stack/cable_coil,
			"amount" = 5,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The hydraulic systems are active."
		),

		//4
		list(
			"key" = TOOL_WIRECUTTER,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The wiring is added."
		),

		//5
		list(
			"key" = /obj/item/circuitboard/mecha/gygax/main,
			"action" = ITEM_DELETE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The wiring is adjusted."
		),

		//6
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Central control module is installed."
		),

		//7
		list(
			"key" = /obj/item/circuitboard/mecha/gygax/peripherals,
			"action" = ITEM_DELETE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Central control module is secured."
		),

		//8
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Peripherals control module is installed."
		),

		//9
		list(
			"key" = /obj/item/circuitboard/mecha/gygax/targeting,
			"action" = ITEM_DELETE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Peripherals control module is secured."
		),

		//10
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Weapon control module is installed."
		),

		//11
		list(
			"key" = /obj/item/stock_parts/scanning_module,
			"action" = ITEM_MOVE_INSIDE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Weapon control module is secured."
		),

		//12
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Scanner module is installed."
		),

		//13
		list(
			"key" = /obj/item/stock_parts/capacitor,
			"action" = ITEM_MOVE_INSIDE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Scanner module is secured."
		),

		//14
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Capacitor is installed."
		),

		//15
		list(
			"key" = /obj/item/stock_parts/cell,
			"action" = ITEM_MOVE_INSIDE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Capacitor is secured."
		),

		//16
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "The power cell is installed."
		),

		//17
		list(
			"key" = /obj/item/stack/sheet/metal,
			"amount" = 5,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The power cell is secured."
		),

		//18
		list(
			"key" = TOOL_WRENCH,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Internal armor is installed."
		),

		//19
		list(
			"key" = TOOL_WELDER,
			"back_key" = TOOL_WRENCH,
			"desc" = "Internal armor is wrenched."
		),

		//20
		list(
			"key" = /obj/item/mecha_parts/part/medigax_armor,
			"action" = ITEM_DELETE,
			"back_key" = TOOL_WELDER,
			"desc" = "Internal armor is welded."
		),

		//21
		list(
			"key" = TOOL_WRENCH,
			"back_key" = TOOL_CROWBAR,
			"desc" = "External armor is installed."
		),

		//22
		list(
			"key" = TOOL_WELDER,
			"back_key" = TOOL_WRENCH,
			"desc" = "External armor is wrenched."
		),

	)

/datum/component/construction/mecha/medigax/action(datum/source, atom/used_atom, mob/user)
	return check_step(used_atom,user)

/datum/component/construction/mecha/medigax/custom_action(obj/item/I, mob/living/user, diff)
	if(!..())
		return FALSE

	switch(index)
		if(1)
			user.visible_message("[user] connects [parent] hydraulic systems", SPAN_NOTICE("You connect [parent] hydraulic systems."))
		if(2)
			if(diff==FORWARD)
				user.visible_message("[user] activates [parent] hydraulic systems.", SPAN_NOTICE("You activate [parent] hydraulic systems."))
			else
				user.visible_message("[user] disconnects [parent] hydraulic systems", SPAN_NOTICE("You disconnect [parent] hydraulic systems."))
		if(3)
			if(diff==FORWARD)
				user.visible_message("[user] adds the wiring to [parent].", SPAN_NOTICE("You add the wiring to [parent]."))
			else
				user.visible_message("[user] deactivates [parent] hydraulic systems.", SPAN_NOTICE("You deactivate [parent] hydraulic systems."))
		if(4)
			if(diff==FORWARD)
				user.visible_message("[user] adjusts the wiring of [parent].", SPAN_NOTICE("You adjust the wiring of [parent]."))
			else
				user.visible_message("[user] removes the wiring from [parent].", SPAN_NOTICE("You remove the wiring from [parent]."))
		if(5)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] into [parent].", SPAN_NOTICE("You install [I] into [parent]."))
			else
				user.visible_message("[user] disconnects the wiring of [parent].", SPAN_NOTICE("You disconnect the wiring of [parent]."))
		if(6)
			if(diff==FORWARD)
				user.visible_message("[user] secures the mainboard.", SPAN_NOTICE("You secure the mainboard."))
			else
				user.visible_message("[user] removes the central control module from [parent].", SPAN_NOTICE("You remove the central computer mainboard from [parent]."))
		if(7)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] into [parent].", SPAN_NOTICE("You install [I] into [parent]."))
			else
				user.visible_message("[user] unfastens the mainboard.", SPAN_NOTICE("You unfasten the mainboard."))
		if(8)
			if(diff==FORWARD)
				user.visible_message("[user] secures the peripherals control module.", SPAN_NOTICE("You secure the peripherals control module."))
			else
				user.visible_message("[user] removes the peripherals control module from [parent].", SPAN_NOTICE("You remove the peripherals control module from [parent]."))
		if(9)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] into [parent].", SPAN_NOTICE("You install [I] into [parent]."))
			else
				user.visible_message("[user] unfastens the peripherals control module.", SPAN_NOTICE("You unfasten the peripherals control module."))
		if(10)
			if(diff==FORWARD)
				user.visible_message("[user] secures the weapon control module.", SPAN_NOTICE("You secure the weapon control module."))
			else
				user.visible_message("[user] removes the weapon control module from [parent].", SPAN_NOTICE("You remove the weapon control module from [parent]."))
		if(11)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] to [parent].", SPAN_NOTICE("You install [I] to [parent]."))
			else
				user.visible_message("[user] unfastens the weapon control module.", SPAN_NOTICE("You unfasten the weapon control module."))
		if(12)
			if(diff==FORWARD)
				user.visible_message("[user] secures the scanner module.", SPAN_NOTICE("You secure the scanner module."))
			else
				user.visible_message("[user] removes the scanner module from [parent].", SPAN_NOTICE("You remove the scanner module from [parent]."))
		if(13)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] to [parent].", SPAN_NOTICE("You install [I] to [parent]."))
			else
				user.visible_message("[user] unfastens the scanner module.", SPAN_NOTICE("You unfasten the scanner module."))
		if(14)
			if(diff==FORWARD)
				user.visible_message("[user] secures the capacitor.", SPAN_NOTICE("You secure the capacitor."))
			else
				user.visible_message("[user] removes the capacitor from [parent].", SPAN_NOTICE("You remove the capacitor from [parent]."))
		if(15)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] into [parent].", SPAN_NOTICE("You install [I] into [parent]."))
			else
				user.visible_message("[user] unfastens the capacitor.", SPAN_NOTICE("You unfasten the capacitor."))
		if(16)
			if(diff==FORWARD)
				user.visible_message("[user] secures the power cell.", SPAN_NOTICE("You secure the power cell."))
			else
				user.visible_message("[user] pries the power cell from [parent].", SPAN_NOTICE("You pry the power cell from [parent]."))
		if(17)
			if(diff==FORWARD)
				user.visible_message("[user] installs the internal armor layer to [parent].", SPAN_NOTICE("You install the internal armor layer to [parent]."))
			else
				user.visible_message("[user] unfastens the power cell.", SPAN_NOTICE("You unfasten the power cell."))
		if(18)
			if(diff==FORWARD)
				user.visible_message("[user] secures the internal armor layer.", SPAN_NOTICE("You secure the internal armor layer."))
			else
				user.visible_message("[user] pries internal armor layer from [parent].", SPAN_NOTICE("You pry internal armor layer from [parent]."))
		if(19)
			if(diff==FORWARD)
				user.visible_message("[user] welds the internal armor layer to [parent].", SPAN_NOTICE("You weld the internal armor layer to [parent]."))
			else
				user.visible_message("[user] unfastens the internal armor layer.", SPAN_NOTICE("You unfasten the internal armor layer."))
		if(20)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] to [parent].", SPAN_NOTICE("You install [I] to [parent]."))
			else
				user.visible_message("[user] cuts the internal armor layer from [parent].", SPAN_NOTICE("You cut the internal armor layer from [parent]."))
		if(21)
			if(diff==FORWARD)
				user.visible_message("[user] secures Gygax Armor Plates.", SPAN_NOTICE("You secure Medical Gygax Armor Plates."))
			else
				user.visible_message("[user] pries Gygax Armor Plates from [parent].", SPAN_NOTICE("You pry Medical Gygax Armor Plates from [parent]."))
		if(22)
			if(diff==FORWARD)
				user.visible_message("[user] welds Gygax Armor Plates to [parent].", SPAN_NOTICE("You weld Medical Gygax Armor Plates to [parent]."))
			else
				user.visible_message("[user] unfastens Gygax Armor Plates.", SPAN_NOTICE("You unfasten  Medical Gygax Armor Plates."))
	return TRUE
// End Medigax

/datum/component/construction/unordered/mecha_chassis/firefighter
	result = /datum/component/construction/mecha/firefighter
	steps = list(
		/obj/item/mecha_parts/part/ripley_torso,
		/obj/item/mecha_parts/part/ripley_left_arm,
		/obj/item/mecha_parts/part/ripley_right_arm,
		/obj/item/mecha_parts/part/ripley_left_leg,
		/obj/item/mecha_parts/part/ripley_right_leg,
		/obj/item/clothing/suit/fire
	)

/datum/component/construction/mecha/firefighter
	result = /obj/mecha/working/ripley/firefighter
	base_icon = "fireripley"
	steps = list(
		//1
		list(
			"key" = TOOL_WRENCH,
			"desc" = "The hydraulic systems are disconnected."
		),

		//2
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_WRENCH,
			"desc" = "The hydraulic systems are connected."
		),

		//3
		list(
			"key" = /obj/item/stack/cable_coil,
			"amount" = 5,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The hydraulic systems are active."
		),

		//4
		list(
			"key" = TOOL_WIRECUTTER,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The wiring is added."
		),

		//5
		list(
			"key" = /obj/item/circuitboard/mecha/ripley/main,
			"action" = ITEM_DELETE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The wiring is adjusted."
		),

		//6
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Central control module is installed."
		),

		//7
		list(
			"key" = /obj/item/circuitboard/mecha/ripley/peripherals,
			"action" = ITEM_DELETE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Central control module is secured."
		),

		//8
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Peripherals control module is installed."
		),

		//9
		list(
			"key" = /obj/item/stock_parts/scanning_module,
			"action" = ITEM_MOVE_INSIDE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Peripherals control module is secured."
		),

		//10
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "The scanner module is installed."
		),

		//11
		list(
			"key" = /obj/item/stock_parts/capacitor,
			"action" = ITEM_MOVE_INSIDE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The scanner module is secured."
		),

		//12
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "The capacitor is installed."
		),

		//13
		list(
			"key" = /obj/item/stock_parts/cell,
			"action" = ITEM_MOVE_INSIDE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The capacitor is secured."
		),

		//14
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "The power cell is installed."
		),

		//15
		list(
			"key" = /obj/item/stack/sheet/plasteel,
			"amount" = 5,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The power cell is secured."
		),

		//16
		list(
			"key" = TOOL_WRENCH,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Internal armor is installed."
		),

		//17
		list(
			"key" = TOOL_WELDER,
			"back_key" = TOOL_WRENCH,
			"desc" = "Internal armor is wrenched."
		),

		//18
		list(
			"key" = /obj/item/stack/sheet/plasteel,
			"amount" = 5,
			"back_key" = TOOL_WELDER,
			"desc" = "Internal armor is welded."
		),

		//19
		list(
			"key" = /obj/item/stack/sheet/plasteel,
			"amount" = 5,
			"back_key" = TOOL_CROWBAR,
			"desc" = "External armor is being installed."
		),

		//20
		list(
			"key" = TOOL_WRENCH,
			"back_key" = TOOL_CROWBAR,
			"desc" = "External armor is installed."
		),

		//21
		list(
			"key" = TOOL_WELDER,
			"back_key" = TOOL_WRENCH,
			"desc" = "External armor is wrenched."
		),
	)

/datum/component/construction/mecha/firefighter/custom_action(obj/item/I, mob/living/user, diff)
	if(!..())
		return FALSE

	//TODO: better messages.
	switch(index)
		if(1)
			user.visible_message("[user] connects [parent] hydraulic systems", SPAN_NOTICE("You connect [parent] hydraulic systems."))
		if(2)
			if(diff==FORWARD)
				user.visible_message("[user] activates [parent] hydraulic systems.", SPAN_NOTICE("You activate [parent] hydraulic systems."))
			else
				user.visible_message("[user] disconnects [parent] hydraulic systems", SPAN_NOTICE("You disconnect [parent] hydraulic systems."))
		if(3)
			if(diff==FORWARD)
				user.visible_message("[user] adds the wiring to [parent].", SPAN_NOTICE("You add the wiring to [parent]."))
			else
				user.visible_message("[user] deactivates [parent] hydraulic systems.", SPAN_NOTICE("You deactivate [parent] hydraulic systems."))
		if(4)
			if(diff==FORWARD)
				user.visible_message("[user] adjusts the wiring of [parent].", SPAN_NOTICE("You adjust the wiring of [parent]."))
			else
				user.visible_message("[user] removes the wiring from [parent].", SPAN_NOTICE("You remove the wiring from [parent]."))
		if(5)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] into [parent].", SPAN_NOTICE("You install [I] into [parent]."))
			else
				user.visible_message("[user] disconnects the wiring of [parent].", SPAN_NOTICE("You disconnect the wiring of [parent]."))
		if(6)
			if(diff==FORWARD)
				user.visible_message("[user] secures the mainboard.", SPAN_NOTICE("You secure the mainboard."))
			else
				user.visible_message("[user] removes the central control module from [parent].", SPAN_NOTICE("You remove the central computer mainboard from [parent]."))
		if(7)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I]into [parent].", SPAN_NOTICE("You install [I]into [parent]."))
			else
				user.visible_message("[user] unfastens the mainboard.", SPAN_NOTICE("You unfasten the mainboard."))
		if(8)
			if(diff==FORWARD)
				user.visible_message("[user] secures the peripherals control module.", SPAN_NOTICE("You secure the peripherals control module."))
			else
				user.visible_message("[user] removes the peripherals control module from [parent].", SPAN_NOTICE("You remove the peripherals control module from [parent]."))
		if(9)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] into [parent].", SPAN_NOTICE("You install [I] into [parent]."))
			else
				user.visible_message("[user] unfastens the peripherals control module.", SPAN_NOTICE("You unfasten the peripherals control module."))
		if(10)
			if(diff==FORWARD)
				user.visible_message("[user] secures the scanner module.", SPAN_NOTICE("You secure the scanner module."))
			else
				user.visible_message("[user] removes the scanner module from [parent].", SPAN_NOTICE("You remove the scanner module from [parent]."))
		if(12)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] to [parent].", SPAN_NOTICE("You install [I] to [parent]."))
			else
				user.visible_message("[user] unfastens the scanner module.", SPAN_NOTICE("You unfasten the scanner module."))
		if(13)
			if(diff==FORWARD)
				user.visible_message("[user] secures the capacitor.", SPAN_NOTICE("You secure the capacitor."))
			else
				user.visible_message("[user] removes the capacitor from [parent].", SPAN_NOTICE("You remove the capacitor from [parent]."))
		if(14)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] into [parent].", SPAN_NOTICE("You install [I] into [parent]."))
			else
				user.visible_message("[user] unfastens the capacitor.", SPAN_NOTICE("You unfasten the capacitor."))
		if(15)
			if(diff==FORWARD)
				user.visible_message("[user] secures the power cell.", SPAN_NOTICE("You secure the power cell."))
			else
				user.visible_message("[user] pries the power cell from [parent].", SPAN_NOTICE("You pry the power cell from [parent]."))
		if(16)
			if(diff==FORWARD)
				user.visible_message("[user] installs the internal armor layer to [parent].", SPAN_NOTICE("You install the internal armor layer to [parent]."))
			else
				user.visible_message("[user] unfastens the power cell.", SPAN_NOTICE("You unfasten the power cell."))
		if(17)
			if(diff==FORWARD)
				user.visible_message("[user] secures the internal armor layer.", SPAN_NOTICE("You secure the internal armor layer."))
			else
				user.visible_message("[user] pries internal armor layer from [parent].", SPAN_NOTICE("You pry internal armor layer from [parent]."))
		if(18)
			if(diff==FORWARD)
				user.visible_message("[user] welds the internal armor layer to [parent].", SPAN_NOTICE("You weld the internal armor layer to [parent]."))
			else
				user.visible_message("[user] unfastens the internal armor layer.", SPAN_NOTICE("You unfasten the internal armor layer."))
		if(19)
			if(diff==FORWARD)
				user.visible_message("[user] starts to install the external armor layer to [parent].", SPAN_NOTICE("You install the external armor layer to [parent]."))
			else
				user.visible_message("[user] cuts the internal armor layer from [parent].", SPAN_NOTICE("You cut the internal armor layer from [parent]."))
		if(20)
			if(diff==FORWARD)
				user.visible_message("[user] installs the external reinforced armor layer to [parent].", SPAN_NOTICE("You install the external reinforced armor layer to [parent]."))
			else
				user.visible_message("[user] removes the external armor from [parent].", SPAN_NOTICE("You remove the external armor from [parent]."))
		if(21)
			if(diff==FORWARD)
				user.visible_message("[user] secures the external armor layer.", SPAN_NOTICE("You secure the external reinforced armor layer."))
			else
				user.visible_message("[user] pries external armor layer from [parent].", SPAN_NOTICE("You pry external armor layer from [parent]."))
		if(22)
			if(diff==FORWARD)
				user.visible_message("[user] welds the external armor layer to [parent].", SPAN_NOTICE("You weld the external armor layer to [parent]."))
			else
				user.visible_message("[user] unfastens the external armor layer.", SPAN_NOTICE("You unfasten the external armor layer."))
	return TRUE

/datum/component/construction/unordered/mecha_chassis/honker
	result = /datum/component/construction/mecha/honker
	steps = list(
		/obj/item/mecha_parts/part/honker_torso,
		/obj/item/mecha_parts/part/honker_left_arm,
		/obj/item/mecha_parts/part/honker_right_arm,
		/obj/item/mecha_parts/part/honker_left_leg,
		/obj/item/mecha_parts/part/honker_right_leg,
		/obj/item/mecha_parts/part/honker_head
	)


/datum/component/construction/mecha/honker
	result = /obj/mecha/combat/honker
	steps = list(
		//1
		list(
			"key" = /obj/item/bikehorn
		),

		//2
		list(
			"key" = /obj/item/circuitboard/mecha/honker/main,
			"action" = ITEM_DELETE
		),

		//3
		list(
			"key" = /obj/item/bikehorn
		),

		//4
		list(
			"key" = /obj/item/circuitboard/mecha/honker/peripherals,
			"action" = ITEM_DELETE
		),

		//5
		list(
			"key" = /obj/item/bikehorn
		),

		//6
		list(
			"key" = /obj/item/circuitboard/mecha/honker/targeting,
			"action" = ITEM_DELETE
		),

		//7
		list(
			"key" = /obj/item/bikehorn
		),

		//6
		list(
			"key" = /obj/item/stock_parts/scanning_module,
			"action" = ITEM_MOVE_INSIDE
		),

		//8
		list(
			"key" = /obj/item/bikehorn
		),

		//9
		list(
			"key" = /obj/item/stock_parts/capacitor,
			"action" = ITEM_MOVE_INSIDE
		),

		//10
		list(
			"key" = /obj/item/bikehorn
		),

		//11
		list(
			"key" = /obj/item/stock_parts/cell,
			"action" = ITEM_MOVE_INSIDE
		),

		//12
		list(
			"key" = /obj/item/bikehorn
		),

		//13
		list(
			"key" = /obj/item/clothing/mask/gas/clown_hat,
			"action" = ITEM_DELETE
		),

		//14
		list(
			"key" = /obj/item/bikehorn
		),

		//15
		list(
			"key" = /obj/item/clothing/shoes/clown_shoes,
			"action" = ITEM_DELETE
		),

		//16
		list(
			"key" = /obj/item/bikehorn
		),
	)

// HONK doesn't have any construction step icons, so we just set an icon once.
/datum/component/construction/mecha/honker/update_parent(step_index)
	if(step_index == 1)
		var/atom/parent_atom = parent
		parent_atom.icon = 'icons/mecha/mech_construct.dmi'
		parent_atom.icon_state = "honker_chassis"
	..()
// HONK doesn't have any construction step icons, so we just set an icon once.
/datum/component/construction/mecha/honker/update_parent(step_index)
	if(step_index == 1)
		var/atom/parent_atom = parent
		parent_atom.icon = 'icons/mecha/mech_construct.dmi'
		parent_atom.icon_state = "honker_chassis"
	..()

/datum/component/construction/mecha/honker/custom_action(obj/item/I, mob/living/user, diff)
	if(!..())
		return FALSE

	if(istype(I, /obj/item/bikehorn))
		playsound(parent, 'sound/items/bikehorn.ogg', 50, 1)
		user.visible_message("HONK!")

	//TODO: better messages.
	switch(index)
		if(2)
			user.visible_message("[user] installs [I] into [parent].", SPAN_NOTICE("You install [I] into [parent]."))
		if(4)
			user.visible_message("[user] installs [I] into [parent].", SPAN_NOTICE("You install [I] into [parent]."))
		if(6)
			user.visible_message("[user] installs [I] into [parent].", SPAN_NOTICE("You install [I] into [parent]."))
		if(8)
			user.visible_message("[user] installs [I] into [parent].", SPAN_NOTICE("You install [I] into [parent]."))
		if(10)
			user.visible_message("[user] installs [I] into [parent].", SPAN_NOTICE("You install [I] into [parent]."))
		if(12)
			user.visible_message("[user] installs [I] into [parent].", SPAN_NOTICE("You install [I] into [parent]."))
		if(14)
			user.visible_message("[user] puts [I] on [parent].", SPAN_NOTICE("You put [I] on [parent]."))
		if(16)
			user.visible_message("[user] puts [I] on [parent].", SPAN_NOTICE("You put [I] on [parent]."))
	return TRUE

/datum/component/construction/unordered/mecha_chassis/durand
	result = /datum/component/construction/mecha/durand
	steps = list(
		/obj/item/mecha_parts/part/durand_torso,
		/obj/item/mecha_parts/part/durand_left_arm,
		/obj/item/mecha_parts/part/durand_right_arm,
		/obj/item/mecha_parts/part/durand_left_leg,
		/obj/item/mecha_parts/part/durand_right_leg,
		/obj/item/mecha_parts/part/durand_head
	)

/datum/component/construction/mecha/durand
	result = /obj/mecha/combat/durand
	base_icon = "durand"
	steps = list(
		//1
		list(
			"key" = TOOL_WRENCH,
			"desc" = "The hydraulic systems are disconnected."
		),

		//2
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_WRENCH,
			"desc" = "The hydraulic systems are connected."
		),

		//3
		list(
			"key" = /obj/item/stack/cable_coil,
			"amount" = 5,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The hydraulic systems are active."
		),

		//4
		list(
			"key" = TOOL_WIRECUTTER,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The wiring is added."
		),

		//5
		list(
			"key" = /obj/item/circuitboard/mecha/durand/main,
			"action" = ITEM_DELETE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The wiring is adjusted."
		),

		//6
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Central control module is installed."
		),

		//7
		list(
			"key" = /obj/item/circuitboard/mecha/durand/peripherals,
			"action" = ITEM_DELETE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Central control module is secured."
		),

		//8
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Peripherals control module is installed."
		),

		//9
		list(
			"key" = /obj/item/circuitboard/mecha/durand/targeting,
			"action" = ITEM_DELETE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Peripherals control module is secured."
		),

		//10
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Weapon control module is installed."
		),

		//11
		list(
			"key" = /obj/item/stock_parts/scanning_module,
			"action" = ITEM_MOVE_INSIDE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Weapon control module is secured."
		),

		//12
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Scanner module is installed."
		),

		//13
		list(
			"key" = /obj/item/stock_parts/capacitor,
			"action" = ITEM_MOVE_INSIDE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Scanner module is secured."
		),

		//14
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Capacitor is installed."
		),

		//15
		list(
			"key" = /obj/item/stock_parts/cell,
			"action" = ITEM_MOVE_INSIDE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Capacitor is secured."
		),

		//16
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "The power cell is installed."
		),

		//17
		list(
			"key" = /obj/item/stack/sheet/metal,
			"amount" = 5,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The power cell is secured."
		),

		//18
		list(
			"key" = TOOL_WRENCH,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Internal armor is installed."
		),

		//19
		list(
			"key" = TOOL_WELDER,
			"back_key" = TOOL_WRENCH,
			"desc" = "Internal armor is wrenched."
		),

		//20
		list(
			"key" = /obj/item/mecha_parts/part/durand_armor,
			"action" = ITEM_DELETE,
			"back_key" = TOOL_WELDER,
			"desc" = "Internal armor is welded."
		),

		//21
		list(
			"key" = TOOL_WRENCH,
			"back_key" = TOOL_CROWBAR,
			"desc" = "External armor is installed."
		),

		//22
		list(
			"key" = TOOL_WELDER,
			"back_key" = TOOL_WRENCH,
			"desc" = "External armor is wrenched."
		),
	)


/datum/component/construction/mecha/durand/custom_action(obj/item/I, mob/living/user, diff)
	if(!..())
		return FALSE

	//TODO: better messages.
	switch(index)
		if(1)
			user.visible_message("[user] connects [parent] hydraulic systems", SPAN_NOTICE("You connect [parent] hydraulic systems."))
		if(2)
			if(diff==FORWARD)
				user.visible_message("[user] activates [parent] hydraulic systems.", SPAN_NOTICE("You activate [parent] hydraulic systems."))
			else
				user.visible_message("[user] disconnects [parent] hydraulic systems", SPAN_NOTICE("You disconnect [parent] hydraulic systems."))
		if(3)
			if(diff==FORWARD)
				user.visible_message("[user] adds the wiring to [parent].", SPAN_NOTICE("You add the wiring to [parent]."))
			else
				user.visible_message("[user] deactivates [parent] hydraulic systems.", SPAN_NOTICE("You deactivate [parent] hydraulic systems."))
		if(4)
			if(diff==FORWARD)
				user.visible_message("[user] adjusts the wiring of [parent].", SPAN_NOTICE("You adjust the wiring of [parent]."))
			else
				user.visible_message("[user] removes the wiring from [parent].", SPAN_NOTICE("You remove the wiring from [parent]."))
		if(5)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] into [parent].", SPAN_NOTICE("You install [I] into [parent]."))
			else
				user.visible_message("[user] disconnects the wiring of [parent].", SPAN_NOTICE("You disconnect the wiring of [parent]."))
		if(6)
			if(diff==FORWARD)
				user.visible_message("[user] secures the mainboard.", SPAN_NOTICE("You secure the mainboard."))
			else
				user.visible_message("[user] removes the central control module from [parent].", SPAN_NOTICE("You remove the central computer mainboard from [parent]."))
		if(7)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] into [parent].", SPAN_NOTICE("You install [I] into [parent]."))
			else
				user.visible_message("[user] unfastens the mainboard.", SPAN_NOTICE("You unfasten the mainboard."))
		if(8)
			if(diff==FORWARD)
				user.visible_message("[user] secures the peripherals control module.", SPAN_NOTICE("You secure the peripherals control module."))
			else
				user.visible_message("[user] removes the peripherals control module from [parent].", SPAN_NOTICE("You remove the peripherals control module from [parent]."))
		if(9)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] into [parent].", SPAN_NOTICE("You install [I] into [parent]."))
			else
				user.visible_message("[user] unfastens the peripherals control module.", SPAN_NOTICE("You unfasten the peripherals control module."))
		if(10)
			if(diff==FORWARD)
				user.visible_message("[user] secures the weapon control module.", SPAN_NOTICE("You secure the weapon control module."))
			else
				user.visible_message("[user] removes the weapon control module from [parent].", SPAN_NOTICE("You remove the weapon control module from [parent]."))
		if(11)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] to [parent].", SPAN_NOTICE("You install [I] to [parent]."))
			else
				user.visible_message("[user] unfastens the weapon control module.", SPAN_NOTICE("You unfasten the weapon control module."))
		if(12)
			if(diff==FORWARD)
				user.visible_message("[user] secures the scanner module.", SPAN_NOTICE("You secure the scanner module."))
			else
				user.visible_message("[user] removes the scanner module from [parent].", SPAN_NOTICE("You remove the scanner module from [parent]."))
		if(13)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] to [parent].", SPAN_NOTICE("You install [I] to [parent]."))
			else
				user.visible_message("[user] unfastens the scanner module.", SPAN_NOTICE("You unfasten the scanner module."))
		if(14)
			if(diff==FORWARD)
				user.visible_message("[user] secures the capacitor.", SPAN_NOTICE("You secure the capacitor."))
			else
				user.visible_message("[user] removes the capacitor from [parent].", SPAN_NOTICE("You remove the capacitor from [parent]."))
		if(15)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] into [parent].", SPAN_NOTICE("You install [I] into [parent]."))
			else
				user.visible_message("[user] unfastens the capacitor.", SPAN_NOTICE("You unfasten the capacitor."))
		if(16)
			if(diff==FORWARD)
				user.visible_message("[user] secures the power cell.", SPAN_NOTICE("You secure the power cell."))
			else
				user.visible_message("[user] pries the power cell from [parent].", SPAN_NOTICE("You pry the power cell from [parent]."))
		if(17)
			if(diff==FORWARD)
				user.visible_message("[user] installs the internal armor layer to [parent].", SPAN_NOTICE("You install the internal armor layer to [parent]."))
			else
				user.visible_message("[user] unfastens the power cell.", SPAN_NOTICE("You unfasten the power cell."))
		if(18)
			if(diff==FORWARD)
				user.visible_message("[user] secures the internal armor layer.", SPAN_NOTICE("You secure the internal armor layer."))
			else
				user.visible_message("[user] pries internal armor layer from [parent].", SPAN_NOTICE("You pry internal armor layer from [parent]."))
		if(19)
			if(diff==FORWARD)
				user.visible_message("[user] welds the internal armor layer to [parent].", SPAN_NOTICE("You weld the internal armor layer to [parent]."))
			else
				user.visible_message("[user] unfastens the internal armor layer.", SPAN_NOTICE("You unfasten the internal armor layer."))
		if(20)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] to [parent].", SPAN_NOTICE("You install [I] to [parent]."))
			else
				user.visible_message("[user] cuts the internal armor layer from [parent].", SPAN_NOTICE("You cut the internal armor layer from [parent]."))
		if(21)
			if(diff==FORWARD)
				user.visible_message("[user] secures Durand Armor Plates.", SPAN_NOTICE("You secure Durand Armor Plates."))
			else
				user.visible_message("[user] pries Durand Armor Plates from [parent].", SPAN_NOTICE("You pry Durand Armor Plates from [parent]."))
		if(22)
			if(diff==FORWARD)
				user.visible_message("[user] welds Durand Armor Plates to [parent].", SPAN_NOTICE("You weld Durand Armor Plates to [parent]."))
			else
				user.visible_message("[user] unfastens Durand Armor Plates.", SPAN_NOTICE("You unfasten Durand Armor Plates."))
	return TRUE

//PHAZON

/datum/component/construction/unordered/mecha_chassis/phazon
	result = /datum/component/construction/mecha/phazon
	steps = list(
		/obj/item/mecha_parts/part/phazon_torso,
		/obj/item/mecha_parts/part/phazon_left_arm,
		/obj/item/mecha_parts/part/phazon_right_arm,
		/obj/item/mecha_parts/part/phazon_left_leg,
		/obj/item/mecha_parts/part/phazon_right_leg,
		/obj/item/mecha_parts/part/phazon_head
	)

/datum/component/construction/mecha/phazon
	result = /obj/mecha/combat/phazon
	base_icon = "phazon"
	steps = list(
		//1
		list(
			"key" = TOOL_WRENCH,
			"desc" = "The hydraulic systems are disconnected."
		),

		//2
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_WRENCH,
			"desc" = "The hydraulic systems are connected."
		),

		//3
		list(
			"key" = /obj/item/stack/cable_coil,
			"amount" = 5,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The hydraulic systems are active."
		),

		//4
		list(
			"key" = TOOL_WIRECUTTER,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The wiring is added."
		),

		//5
		list(
			"key" = /obj/item/circuitboard/mecha/phazon/main,
			"action" = ITEM_DELETE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The wiring is adjusted."
		),

		//6
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Central control module is installed."
		),

		//7
		list(
			"key" = /obj/item/circuitboard/mecha/phazon/peripherals,
			"action" = ITEM_DELETE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Central control module is secured."
		),

		//8
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Peripherals control module is installed"
		),

		//9
		list(
			"key" = /obj/item/circuitboard/mecha/phazon/targeting,
			"action" = ITEM_DELETE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Peripherals control module is secured."
		),

		//10
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Weapon control is installed."
		),

		//11
		list(
			"key" = /obj/item/stock_parts/scanning_module,
			"action" = ITEM_MOVE_INSIDE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Weapon control module is secured."
		),

		//12
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Scanner module is installed."
		),

		//13
		list(
			"key" = /obj/item/stock_parts/capacitor,
			"action" = ITEM_MOVE_INSIDE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Scanner module is secured."
		),

		//14
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Capacitor is installed."
		),

		//15
		list(
			"key" = /obj/item/stack/ore/bluespace_crystal,
			"amount" = 1,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Capacitor is secured."
		),

		//16
		list(
			"key" = /obj/item/stack/cable_coil,
			"amount" = 5,
			"back_key" = TOOL_CROWBAR,
			"desc" = "The bluespace crystal is installed."
		),

		//17
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_WIRECUTTER,
			"desc" = "The bluespace crystal is connected."
		),

		//18
		list(
			"key" = /obj/item/stock_parts/cell,
			"action" = ITEM_MOVE_INSIDE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The bluespace crystal is engaged."
		),

		//19
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "The power cell is installed.",
			"icon_state" = "phazon17"
			// This is the point where a step icon is skipped, so "icon_state" had to be set manually starting from here.
		),

		//20
		list(
			"key" = /obj/item/stack/sheet/plasteel,
			"amount" = 5,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The power cell is secured.",
			"icon_state" = "phazon18"
		),

		//21
		list(
			"key" = TOOL_WRENCH,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Phase armor is installed.",
			"icon_state" = "phazon19"
		),

		//22
		list(
			"key" = TOOL_WELDER,
			"back_key" = TOOL_WRENCH,
			"desc" = "Phase armor is wrenched.",
			"icon_state" = "phazon20"
		),

		//23
		list(
			"key" = /obj/item/mecha_parts/part/phazon_armor,
			"action" = ITEM_DELETE,
			"back_key" = TOOL_WELDER,
			"desc" = "Phase armor is welded.",
			"icon_state" = "phazon21"
		),

		//24
		list(
			"key" = TOOL_WRENCH,
			"back_key" = TOOL_CROWBAR,
			"desc" = "External armor is installed.",
			"icon_state" = "phazon22"
		),

		//25
		list(
			"key" = TOOL_WELDER,
			"back_key" = TOOL_WRENCH,
			"desc" = "External armor is wrenched.",
			"icon_state" = "phazon23"
		),

		//26
		list(
			"key" = /obj/item/assembly/signaler/anomaly,
			"action" = ITEM_DELETE,
			"back_key" = TOOL_WELDER,
			"desc" = "Anomaly core socket is open.",
			"icon_state" = "phazon24"
		),
	)


/datum/component/construction/mecha/phazon/custom_action(obj/item/I, mob/living/user, diff)
	if(!..())
		return FALSE

	//TODO: better messages.
	switch(index)
		if(1)
			user.visible_message("[user] connects [parent] hydraulic systems", SPAN_NOTICE("You connect [parent] hydraulic systems."))
		if(2)
			if(diff==FORWARD)
				user.visible_message("[user] activates [parent] hydraulic systems.", SPAN_NOTICE("You activate [parent] hydraulic systems."))
			else
				user.visible_message("[user] disconnects [parent] hydraulic systems", SPAN_NOTICE("You disconnect [parent] hydraulic systems."))
		if(3)
			if(diff==FORWARD)
				user.visible_message("[user] adds the wiring to [parent].", SPAN_NOTICE("You add the wiring to [parent]."))
			else
				user.visible_message("[user] deactivates [parent] hydraulic systems.", SPAN_NOTICE("You deactivate [parent] hydraulic systems."))
		if(4)
			if(diff==FORWARD)
				user.visible_message("[user] adjusts the wiring of [parent].", SPAN_NOTICE("You adjust the wiring of [parent]."))
			else
				user.visible_message("[user] removes the wiring from [parent].", SPAN_NOTICE("You remove the wiring from [parent]."))
		if(5)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] into [parent].", SPAN_NOTICE("You install [I] into [parent]."))
			else
				user.visible_message("[user] disconnects the wiring of [parent].", SPAN_NOTICE("You disconnect the wiring of [parent]."))
		if(6)
			if(diff==FORWARD)
				user.visible_message("[user] secures the mainboard.", SPAN_NOTICE("You secure the mainboard."))
			else
				user.visible_message("[user] removes the central control module from [parent].", SPAN_NOTICE("You remove the central computer mainboard from [parent]."))
		if(7)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] into [parent].", SPAN_NOTICE("You install [I] into [parent]."))
			else
				user.visible_message("[user] unfastens the mainboard.", SPAN_NOTICE("You unfasten the mainboard."))
		if(8)
			if(diff==FORWARD)
				user.visible_message("[user] secures the peripherals control module.", SPAN_NOTICE("You secure the peripherals control module."))
			else
				user.visible_message("[user] removes the peripherals control module from [parent].", SPAN_NOTICE("You remove the peripherals control module from [parent]."))
		if(9)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] into [parent].", SPAN_NOTICE("You install [I] into [parent]."))
			else
				user.visible_message("[user] unfastens the peripherals control module.", SPAN_NOTICE("You unfasten the peripherals control module."))
		if(10)
			if(diff==FORWARD)
				user.visible_message("[user] secures the weapon control module.", SPAN_NOTICE("You secure the weapon control module."))
			else
				user.visible_message("[user] removes the weapon control module from [parent].", SPAN_NOTICE("You remove the weapon control module from [parent]."))
		if(11)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] to [parent].", SPAN_NOTICE("You install [I] to [parent]."))
			else
				user.visible_message("[user] unfastens the weapon control module.", SPAN_NOTICE("You unfasten the weapon control module."))
		if(12)
			if(diff==FORWARD)
				user.visible_message("[user] secures the scanner module.", SPAN_NOTICE("You secure the scanner module."))
			else
				user.visible_message("[user] removes the scanner module from [parent].", SPAN_NOTICE("You remove the scanner module from [parent]."))
		if(13)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] to [parent].", SPAN_NOTICE("You install [I] to [parent]."))
			else
				user.visible_message("[user] unfastens the scanner module.", SPAN_NOTICE("You unfasten the scanner module."))
		if(14)
			if(diff==FORWARD)
				user.visible_message("[user] secures [I].", SPAN_NOTICE("You secure [I]."))
			else
				user.visible_message("[user] removes the capacitor from [parent].", SPAN_NOTICE("You remove the capacitor from [parent]."))
		if(15)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I].", SPAN_NOTICE("You install [I]."))
			else
				user.visible_message("[user] unsecures the capacitor from [parent].", SPAN_NOTICE("You unsecure the capacitor from [parent]."))
		if(16)
			if(diff==FORWARD)
				user.visible_message("[user] connects the bluespace crystal.", SPAN_NOTICE("You connect the bluespace crystal."))
			else
				user.visible_message("[user] removes the bluespace crystal from [parent].", SPAN_NOTICE("You remove the bluespace crystal from [parent]."))
		if(17)
			if(diff==FORWARD)
				user.visible_message("[user] engages the bluespace crystal.", SPAN_NOTICE("You engage the bluespace crystal."))
			else
				user.visible_message("[user] disconnects the bluespace crystal from [parent].", SPAN_NOTICE("You disconnect the bluespace crystal from [parent]."))
		if(18)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] into [parent].", SPAN_NOTICE("You install [I] into [parent]."))
			else
				user.visible_message("[user] disengages the bluespace crystal.", SPAN_NOTICE("You disengage the bluespace crystal."))
		if(19)
			if(diff==FORWARD)
				user.visible_message("[user] secures the power cell.", SPAN_NOTICE("You secure the power cell."))
			else
				user.visible_message("[user] pries the power cell from [parent].", SPAN_NOTICE("You pry the power cell from [parent]."))
		if(20)
			if(diff==FORWARD)
				user.visible_message("[user] installs the phase armor layer to [parent].", SPAN_NOTICE("You install the phase armor layer to [parent]."))
			else
				user.visible_message("[user] unfastens the power cell.", SPAN_NOTICE("You unfasten the power cell."))
		if(21)
			if(diff==FORWARD)
				user.visible_message("[user] secures the phase armor layer.", SPAN_NOTICE("You secure the phase armor layer."))
			else
				user.visible_message("[user] pries the phase armor layer from [parent].", SPAN_NOTICE("You pry the phase armor layer from [parent]."))
		if(22)
			if(diff==FORWARD)
				user.visible_message("[user] welds the phase armor layer to [parent].", SPAN_NOTICE("You weld the phase armor layer to [parent]."))
			else
				user.visible_message("[user] unfastens the phase armor layer.", SPAN_NOTICE("You unfasten the phase armor layer."))
		if(23)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] to [parent].", SPAN_NOTICE("You install [I] to [parent]."))
			else
				user.visible_message("[user] cuts phase armor layer from [parent].", SPAN_NOTICE("You cut the phase armor layer from [parent]."))
		if(24)
			if(diff==FORWARD)
				user.visible_message("[user] secures Phazon Armor Plates.", SPAN_NOTICE("You secure Phazon Armor Plates."))
			else
				user.visible_message("[user] pries Phazon Armor Plates from [parent].", SPAN_NOTICE("You pry Phazon Armor Plates from [parent]."))
		if(25)
			if(diff==FORWARD)
				user.visible_message("[user] welds Phazon Armor Plates to [parent].", SPAN_NOTICE("You weld Phazon Armor Plates to [parent]."))
			else
				user.visible_message("[user] unfastens Phazon Armor Plates.", SPAN_NOTICE("You unfasten Phazon Armor Plates."))
		if(26)
			if(diff==FORWARD)
				user.visible_message("[user] carefully inserts the anomaly core into [parent] and secures it.",
					SPAN_NOTICE("You slowly place the anomaly core into its socket and close its chamber."))
	return TRUE

//ODYSSEUS

/datum/component/construction/unordered/mecha_chassis/odysseus
	result = /datum/component/construction/mecha/odysseus
	steps = list(
		/obj/item/mecha_parts/part/odysseus_torso,
		/obj/item/mecha_parts/part/odysseus_head,
		/obj/item/mecha_parts/part/odysseus_left_arm,
		/obj/item/mecha_parts/part/odysseus_right_arm,
		/obj/item/mecha_parts/part/odysseus_left_leg,
		/obj/item/mecha_parts/part/odysseus_right_leg
	)

/datum/component/construction/mecha/odysseus
	result = /obj/mecha/medical/odysseus
	base_icon = "odysseus"
	steps = list(
		//1
		list(
			"key" = TOOL_WRENCH,
			"desc" = "The hydraulic systems are disconnected."
		),

		//2
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_WRENCH,
			"desc" = "The hydraulic systems are connected."
		),

		//3
		list(
			"key" = /obj/item/stack/cable_coil,
			"amount" = 5,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The hydraulic systems are active."
		),

		//4
		list(
			"key" = TOOL_WIRECUTTER,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The wiring is added."
		),

		//5
		list(
			"key" = /obj/item/circuitboard/mecha/odysseus/main,
			"action" = ITEM_DELETE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The wiring is adjusted."
		),

		//6
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Central control module is installed."
		),

		//7
		list(
			"key" = /obj/item/circuitboard/mecha/odysseus/peripherals,
			"action" = ITEM_DELETE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Central control module is secured."
		),

		//8
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Peripherals control module is installed."
		),
		//9
		list(
			"key" = /obj/item/stock_parts/scanning_module,
			"action" = ITEM_MOVE_INSIDE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Peripherals control module is secured."
		),

		//10
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Scanner module is installed."
		),

		//11
		list(
			"key" = /obj/item/stock_parts/capacitor,
			"action" = ITEM_MOVE_INSIDE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Scanner module is secured."
		),

		//12
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Capacitor is installed."
		),

		//13
		list(
			"key" = /obj/item/stock_parts/cell,
			"action" = ITEM_MOVE_INSIDE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Capacitor is secured."
		),

		//11
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "The power cell is installed."
		),

		//12
		list(
			"key" = /obj/item/stack/sheet/metal,
			"amount" = 5,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The power cell is secured."
		),

		//13
		list(
			"key" = TOOL_WRENCH,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Internal armor is installed."
		),

		//14
		list(
			"key" = TOOL_WELDER,
			"back_key" = TOOL_WRENCH,
			"desc" = "Internal armor is wrenched."
		),

		//15
		list(
			"key" = /obj/item/stack/sheet/plasteel,
			"amount" = 5,
			"back_key" = TOOL_WELDER,
			"desc" = "Internal armor is welded."
		),

		//16
		list(
			"key" = TOOL_WRENCH,
			"back_key" = TOOL_CROWBAR,
			"desc" = "External armor is installed."
		),

		//17
		list(
			"key" = TOOL_WELDER,
			"back_key" = TOOL_WRENCH,
			"desc" = "External armor is wrenched."
		),
	)

/datum/component/construction/mecha/odysseus/custom_action(obj/item/I, mob/living/user, diff)
	if(!..())
		return FALSE

	//TODO: better messages.
	switch(index)
		if(1)
			user.visible_message("[user] connects [parent] hydraulic systems", SPAN_NOTICE("You connect [parent] hydraulic systems."))
		if(2)
			if(diff==FORWARD)
				user.visible_message("[user] activates [parent] hydraulic systems.", SPAN_NOTICE("You activate [parent] hydraulic systems."))
			else
				user.visible_message("[user] disconnects [parent] hydraulic systems", SPAN_NOTICE("You disconnect [parent] hydraulic systems."))
		if(3)
			if(diff==FORWARD)
				user.visible_message("[user] adds the wiring to [parent].", SPAN_NOTICE("You add the wiring to [parent]."))
			else
				user.visible_message("[user] deactivates [parent] hydraulic systems.", SPAN_NOTICE("You deactivate [parent] hydraulic systems."))
		if(4)
			if(diff==FORWARD)
				user.visible_message("[user] adjusts the wiring of [parent].", SPAN_NOTICE("You adjust the wiring of [parent]."))
			else
				user.visible_message("[user] removes the wiring from [parent].", SPAN_NOTICE("You remove the wiring from [parent]."))
		if(5)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] into [parent].", SPAN_NOTICE("You install [I] into [parent]."))
			else
				user.visible_message("[user] disconnects the wiring of [parent].", SPAN_NOTICE("You disconnect the wiring of [parent]."))
		if(6)
			if(diff==FORWARD)
				user.visible_message("[user] secures the mainboard.", SPAN_NOTICE("You secure the mainboard."))
			else
				user.visible_message("[user] removes the central control module from [parent].", SPAN_NOTICE("You remove the central computer mainboard from [parent]."))
		if(7)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] into [parent].", SPAN_NOTICE("You install [I] into [parent]."))
			else
				user.visible_message("[user] unfastens the mainboard.", SPAN_NOTICE("You unfasten the mainboard."))
		if(8)
			if(diff==FORWARD)
				user.visible_message("[user] secures the peripherals control module.", SPAN_NOTICE("You secure the peripherals control module."))
			else
				user.visible_message("[user] removes the peripherals control module from [parent].", SPAN_NOTICE("You remove the peripherals control module from [parent]."))
		if(9)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] into [parent].", SPAN_NOTICE("You install [I] into [parent]."))
			else
				user.visible_message("[user] unfastens the peripherals control module.", SPAN_NOTICE("You unfasten the peripherals control module."))
		if(10)
			if(diff==FORWARD)
				user.visible_message("[user] secures the scanner module.", SPAN_NOTICE("You secure the scanner module."))
			else
				user.visible_message("[user] removes the scanner module from [parent].", SPAN_NOTICE("You remove the scanner module from [parent]."))
		if(11)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] to [parent].", SPAN_NOTICE("You install [I] to [parent]."))
			else
				user.visible_message("[user] unfastens the scanner module.", SPAN_NOTICE("You unfasten the scanner module."))
		if(12)
			if(diff==FORWARD)
				user.visible_message("[user] secures the capacitor.", SPAN_NOTICE("You secure the capacitor."))
			else
				user.visible_message("[user] removes the capacitor from [parent].", SPAN_NOTICE("You remove the capacitor from [parent]."))
		if(13)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] into [parent].", SPAN_NOTICE("You install [I] into [parent]."))
			else
				user.visible_message("[user] unfastens the capacitor.", SPAN_NOTICE("You unfasten the capacitor."))
		if(14)
			if(diff==FORWARD)
				user.visible_message("[user] secures the power cell.", SPAN_NOTICE("You secure the power cell."))
			else
				user.visible_message("[user] pries the power cell from [parent].", SPAN_NOTICE("You pry the power cell from [parent]."))
		if(15)
			if(diff==FORWARD)
				user.visible_message("[user] installs the internal armor layer to [parent].", SPAN_NOTICE("You install the internal armor layer to [parent]."))
			else
				user.visible_message("[user] unfastens the power cell.", SPAN_NOTICE("You unfasten the power cell."))
		if(16)
			if(diff==FORWARD)
				user.visible_message("[user] secures the internal armor layer.", SPAN_NOTICE("You secure the internal armor layer."))
			else
				user.visible_message("[user] pries internal armor layer from [parent].", SPAN_NOTICE("You pry internal armor layer from [parent]."))
		if(17)
			if(diff==FORWARD)
				user.visible_message("[user] welds the internal armor layer to [parent].", SPAN_NOTICE("You weld the internal armor layer to [parent]."))
			else
				user.visible_message("[user] unfastens the internal armor layer.", SPAN_NOTICE("You unfasten the internal armor layer."))
		if(18)
			if(diff==FORWARD)
				user.visible_message("[user] installs the external armor layer to [parent].", SPAN_NOTICE("You install the external reinforced armor layer to [parent]."))
			else
				user.visible_message("[user] cuts the internal armor layer from [parent].", SPAN_NOTICE("You cut the internal armor layer from [parent]."))
		if(19)
			if(diff==FORWARD)
				user.visible_message("[user] secures the external armor layer.", SPAN_NOTICE("You secure the external reinforced armor layer."))
			else
				user.visible_message("[user] pries the external armor layer from [parent].", SPAN_NOTICE("You pry the external armor layer from [parent]."))
		if(20)
			if(diff==FORWARD)
				user.visible_message("[user] welds the external armor layer to [parent].", SPAN_NOTICE("You weld the external armor layer to [parent]."))
			else
				user.visible_message("[user] unfastens the external armor layer.", SPAN_NOTICE("You unfasten the external armor layer."))
	return TRUE
