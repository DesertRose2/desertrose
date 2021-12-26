/obj/machinery/autolathe/constructionlathe
	name = "Workshop"
	desc = "Contains an array of custom made and skilled tools for professional craftsmen."
	circuit = /obj/item/circuitboard/machine/autolathe/constructionlathe
	super_advanced_technology = FALSE
	resistance_flags = NONE
	var/constage = 0 //construction stage for upgrading into a regular lathe
	categories = list(
							"Tools",
							"Electronics",
							"Construction",
							"T-Comm",
							//"Security",
							"Machinery",
							"Medical",
							"Misc",
							"Dinnerware",
							)

/obj/machinery/autolathe/ammo
	name = "reloading bench"
	icon = 'icons/obj/machines/reloadingbench.dmi'
	desc = "An ammo bench that utilizes metal and other materials to make ammo and magazines."
	circuit = /obj/item/circuitboard/machine/autolathe/ammo
	stored_research = /datum/techweb/specialized/autounlocking/autolathe/ammo
	categories = list(
					"Simple Ammo",
					"Simple Magazines",
					"Basic Ammo",
					"Basic Magazines",
					"Intermediate Ammo",
					"Intermediate Magazines",
					"Advanced Ammo",
					"Advanced Magazines",
					"Materials"
					)
	allowed_materials = list(
		/datum/material/iron,
		/datum/material/titanium,
		/datum/material/blackpowder)
	var/simple = 0
	var/basic = 0
	var/intermediate = 0
	var/advanced = 0

/obj/machinery/autolathe/ammo/attackby(obj/item/O, mob/user, params)
	..()
	if(!simple && panel_open)
		if(istype(O, /obj/item/book/granter/crafting_recipe/gunsmith_one))
			to_chat(user, SPAN_NOTICE("You upgrade [src] with simple ammunition schematics."))
			simple = 1
			qdel(O)
	if(!basic && panel_open)
		if(istype(O, /obj/item/book/granter/crafting_recipe/gunsmith_two))
			to_chat(user, SPAN_NOTICE("You upgrade [src] with basic ammunition schematics."))
			basic = 1
			qdel(O)
	if(!intermediate && panel_open)
		if(istype(O, /obj/item/book/granter/crafting_recipe/gunsmith_three))
			to_chat(user, SPAN_NOTICE("You upgrade [src] with intermediate ammunition schematics."))
			intermediate = 1
			qdel(O)
	if(!advanced && panel_open)
		if(istype(O, /obj/item/book/granter/crafting_recipe/gunsmith_four))
			to_chat(user, SPAN_NOTICE("You upgrade [src] with advanced ammunition schematics."))
			advanced = 1
			qdel(O)
	else
		attack_hand(user)
		return TRUE

/obj/machinery/autolathe/ammo/can_build(datum/design/D, amount = 1)
	if("Simple Ammo" in D.category)
		if(simple == 0)
			return FALSE
		else
			. = ..()
	else
		. = ..()
	if("Simple Magazines" in D.category)
		if(simple == 0)
			return FALSE
		else
			. = ..()
	else
		. = ..()
	if("Basic Ammo" in D.category)
		if(basic == 0)
			return FALSE
		else
			. = ..()
	else
		. = ..()
	if("Basic Magazines" in D.category)
		if(basic == 0)
			return FALSE
		else
			. = ..()
	else
		. = ..()
	if("Intermediate Ammo" in D.category)
		if(intermediate == 0)
			return FALSE
		else
			. = ..()
	else
		. = ..()
	if("Intermediate Magazines" in D.category)
		if(intermediate == 0)
			return FALSE
		else
			. = ..()
	else
		. = ..()
	if("Advanced Ammo" in D.category)
		if(advanced == 0)
			return FALSE
		else
			. = ..()
	else
		. = ..()
	if("Advanced Magazines" in D.category)
		if(advanced == 0)
			return FALSE
		else
			. = ..()
	else
		. = ..()

/obj/machinery/autolathe/ammo/on_deconstruction()
	..()
	if(simple)
		new /obj/item/book/granter/crafting_recipe/gunsmith_one(src)
	if(basic)
		new /obj/item/book/granter/crafting_recipe/gunsmith_two(src)
	if(intermediate)
		new /obj/item/book/granter/crafting_recipe/gunsmith_three(src)
	if(advanced)
		new /obj/item/book/granter/crafting_recipe/gunsmith_four(src)
	return
	
/obj/machinery/autolathe/ammo/unlocked
	simple = 1
	basic = 1
	intermediate = 1
	advanced = 1

// Circuitboards

/obj/item/circuitboard/machine/autolathe/constructionlathe
	name = "Workshop (Machine Board)"
	build_path = /obj/machinery/autolathe/constructionlathe

/obj/item/circuitboard/machine/autolathe/ammo
	name = "Ammo Bench (Machine Board)"
	build_path = /obj/machinery/autolathe/ammo
	req_components = list(
		/obj/item/stock_parts/matter_bin = 3,
		/obj/item/stock_parts/manipulator = 1,
		/obj/item/stack/sheet/glass = 1)
