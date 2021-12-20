//PARTS
/datum/crafting_recipe/compressedpowder
	name = "Compressed blackpowder"
	result = /obj/item/stack/ore/blackpowder
	time = 5
	reqs = list(/datum/reagent/blackpowder = 50)
	category = CAT_THROWABLE
	subcategory = CAT_EXPLOSIVE

/datum/crafting_recipe/fuze
	name = "Fuze"
	result = /obj/item/crafting/fuze
	time = 5
	reqs = list(/obj/item/stack/sheet/cloth = 5)
	category = CAT_THROWABLE
	subcategory = CAT_EXPLOSIVE

/datum/crafting_recipe/metaltube
	name = "Metal Tube"
	result = /obj/item/crafting/tube
	time = 5
	reqs = list(/obj/item/stack/crafting/goodparts = 5)
	category = CAT_THROWABLE
	subcategory = CAT_EXPLOSIVE

/datum/crafting_recipe/grenadebeaker
	name = "Grenade Beaker"
	result = /obj/item/reagent_containers/glass/beaker/bomb
	time = 5
	reqs = list(/obj/item/reagent_containers/glass/beaker = 2,
				/obj/item/stack/cable_coil = 2
				)
	category = CAT_THROWABLE
	subcategory = CAT_EXPLOSIVE
	blacklist = list(
					/obj/item/reagent_containers/glass/beaker/bomb,
					/obj/item/reagent_containers/glass/beaker/large,
					/obj/item/reagent_containers/glass/beaker/plastic,
					/obj/item/reagent_containers/glass/beaker/meta,
					/obj/item/reagent_containers/glass/beaker/noreact,
					/obj/item/reagent_containers/glass/beaker/bluespace
					)

//REGULAR THROWABLES
/datum/crafting_recipe/throwing_knife
	name = "Throwing Knife"
	result = /obj/item/throwing_star/knife
	time = 30
	reqs = list(/obj/item/stack/sheet/cloth = 3,
				/obj/item/stack/sheet/metal = 5)
	tools = list(TOOL_WORKBENCH)			
	category =  CAT_THROWABLE
	subcategory = CAT_REGULAR

/datum/crafting_recipe/throwing_fork
	name = "Throwing Fork"
	result = /obj/item/kitchen/fork/throwing
	time = 30
	reqs = list(/obj/item/stack/sheet/metal = 10)
	tools = list(TOOL_WORKBENCH)
	category =  CAT_THROWABLE
	subcategory = CAT_REGULAR

/datum/crafting_recipe/tomahawk
	name = "Tomahawk"
	result = /obj/item/throwing_star/tomahawk
	time = 40
	reqs = list(/obj/item/hatchet=1,
				/obj/item/stack/sheet/hay = 3,
				/obj/item/stack/cable_coil = 1,
				/obj/item/stack/sheet/metal = 5)
	tools = list(TOOL_WORKBENCH)			
	category =  CAT_THROWABLE
	subcategory = CAT_REGULAR

/datum/crafting_recipe/bola
	name = "Bola"
	result = /obj/item/restraints/legcuffs/bola
	reqs = list(/obj/item/restraints/handcuffs/cable = 1,
				/obj/item/stack/sheet/metal = 6)
	time = 20//15 faster than crafting them by hand!
	category= CAT_THROWABLE
	subcategory = CAT_REGULAR

/datum/crafting_recipe/spearquiver
	name = "Spear Quiver"
	result = /obj/item/storage/backpack/spearquiver
	time = 60
	reqs = list(/obj/item/stack/sheet/leather = 3,
				/obj/item/stack/sheet/hay = 3,
				/obj/item/stack/cable_coil = 1,
				/obj/item/stack/sheet/metal = 7,
				/obj/item/stack/rods = 7)
	tools = list(TOOL_WORKBENCH)
	category =  CAT_THROWABLE
	subcategory = CAT_REGULAR

//GHETTO

// Can acquire without book
/datum/crafting_recipe/explosive/molotov
	name = "Molotov Cocktail"
	result = /obj/item/reagent_containers/food/drinks/bottle/molotov
	reqs = list(/obj/item/reagent_containers/rag = 1,
				/obj/item/reagent_containers/food/drinks/bottle = 1)
	time = 5 SECONDS
	category = CAT_THROWABLE
	subcategory = CAT_EXPLOSIVE

/datum/crafting_recipe/explosive/firebomb
	name = "Firebomb"
	result = /obj/item/grenade/homemade/firebomb
	reqs = list(/datum/reagent/fuel = 50,
				/obj/item/stack/cable_coil = 1,
				/obj/item/assembly/igniter = 1,
				/obj/item/reagent_containers/food/drinks/flask = 1)
	time = 10 SECONDS
	tools = list(TOOL_WORKBENCH)
	category = CAT_THROWABLE
	subcategory = CAT_EXPLOSIVE

/datum/crafting_recipe/explosive/coffeepotbomb
	name = "Coffeepot Bomb"
	result = /obj/item/grenade/homemade/coffeepotbomb
	reqs = list(/datum/reagent/blackpowder = 50,
				/obj/item/crafting/coffee_pot = 1,
				/obj/item/stack/cable_coil = 1,
				/obj/item/assembly/timer = 1)
	time = 15 SECONDS
	tools = list(TOOL_WORKBENCH)
	category = CAT_THROWABLE
	subcategory = CAT_EXPLOSIVE

/datum/crafting_recipe/explosive/pipebomb
	name = "Pipebomb"
	result = /obj/item/grenade/homemade/pipebomb
	reqs = list(/datum/reagent/blackpowder = 40,
				/obj/item/stack/sheet/metal = 15,
				/obj/item/stack/crafting/metalparts = 3,
				/obj/item/crafting/tube = 1,
				/obj/item/crafting/fuze = 1)
	time = 20 SECONDS
	tools = list(TOOL_WORKBENCH)
	category = CAT_THROWABLE
	subcategory = CAT_EXPLOSIVE

// Require book

/datum/crafting_recipe/explosive/dynamite
	name = "Dynamite Stick"
	result = /obj/item/grenade/homemade/dynamite
	reqs = list(/datum/reagent/blackpowder = 70,
				/obj/item/stack/sheet/metal = 10,
				/obj/item/stack/cable_coil = 1,
				/obj/item/crafting/tube = 1,
				/obj/item/crafting/fuze = 1)
	time = 20 SECONDS
	tools = list(TOOL_WORKBENCH)
	category = CAT_THROWABLE
	subcategory = CAT_EXPLOSIVE
	always_availible = FALSE

/datum/crafting_recipe/explosive/chemical
	name = "Chemical Grenade"
	result = /obj/item/grenade/chem_grenade
	reqs = list(/obj/item/stack/sheet/metal = 5,
				/obj/item/stack/crafting/goodparts = 6,
				/obj/item/crafting/grenade_casing = 1,
				/obj/item/crafting/abraxo = 1)
	time = 30 SECONDS
	tools = list(TOOL_WORKBENCH)
	category = CAT_THROWABLE
	subcategory = CAT_EXPLOSIVE
	always_availible = FALSE

/datum/crafting_recipe/explosive/frag
	name = "Fragmentation Grenade"
	result = /obj/item/grenade/f13/frag
	reqs = list(/datum/reagent/blackpowder = 50,
				/obj/item/stack/sheet/metal = 10,
				/obj/item/stack/crafting/goodparts = 3,
				/obj/item/stack/cable_coil = 1,
				/obj/item/crafting/grenade_casing = 1,
				/obj/item/assembly/igniter = 1,
				/obj/item/assembly/timer = 1)
	time = 30 SECONDS
	tools = list(TOOL_WORKBENCH)
	category = CAT_THROWABLE
	subcategory = CAT_EXPLOSIVE
	always_availible = FALSE

/datum/crafting_recipe/explosive/explosive
	name = "High-Explosive Grenade (Gunpowder)"
	result = /obj/item/grenade/f13/explosive
	reqs = list(/datum/reagent/blackpowder = 160,
				/obj/item/stack/sheet/metal = 10,
				/obj/item/stack/cable_coil = 1,
				/obj/item/crafting/grenade_casing = 1,
				/obj/item/assembly/igniter = 1,
				/obj/item/assembly/timer = 1)
	time = 30 SECONDS
	tools = list(TOOL_WORKBENCH)
	category = CAT_THROWABLE
	subcategory = CAT_EXPLOSIVE
	always_availible = FALSE

/datum/crafting_recipe/explosive/nitro
	name = "High-Explosive Grenade (Nitroglyceryn)"
	result = /obj/item/grenade/f13/explosive
	reqs = list(/datum/reagent/nitroglycerin = 80,
				/obj/item/stack/sheet/metal = 10,
				/obj/item/stack/cable_coil = 1,
				/obj/item/crafting/grenade_casing = 1,
				/obj/item/assembly/igniter = 1,
				/obj/item/assembly/timer = 1)
	time = 30 SECONDS
	tools = list(TOOL_WORKBENCH)
	category = CAT_THROWABLE
	subcategory = CAT_EXPLOSIVE
	always_availible = FALSE

/datum/crafting_recipe/explosive/flashbang
	name = "Flashbang"
	result = /obj/item/grenade/flashbang
	reqs = list(/datum/reagent/flash_powder = 60,
				/datum/reagent/sonic_powder = 60,
				/obj/item/stack/sheet/metal = 10,
				/obj/item/stack/cable_coil = 1,
				/obj/item/crafting/grenade_casing = 1,
				/obj/item/assembly/igniter = 1,
				/obj/item/assembly/timer = 1)
	time = 30 SECONDS
	tools = list(TOOL_WORKBENCH)
	category = CAT_THROWABLE
	subcategory = CAT_EXPLOSIVE
	always_availible = FALSE

/datum/crafting_recipe/explosive/smoke
	name = "Smoke Grenade"
	result = /obj/item/grenade/smokebomb
	reqs = list(/datum/reagent/smoke_powder = 100,
				/obj/item/stack/sheet/metal = 10,
				/obj/item/stack/cable_coil = 1,
				/obj/item/crafting/grenade_casing = 1,
				/obj/item/assembly/igniter = 1,
				/obj/item/assembly/timer = 1)
	time = 30 SECONDS
	tools = list(TOOL_WORKBENCH)
	category = CAT_THROWABLE
	subcategory = CAT_EXPLOSIVE
	always_availible = FALSE

/datum/crafting_recipe/explosive/emp
	name = "Pulse Grenade"
	result = /obj/item/grenade/empgrenade
	reqs = list(/datum/reagent/teslium = 120,
				/obj/item/stack/sheet/metal = 10,
				/obj/item/stack/cable_coil = 1,
				/obj/item/crafting/grenade_casing = 1,
				/obj/item/assembly/igniter = 1,
				/obj/item/assembly/timer = 1)
	time = 30 SECONDS
	tools = list(TOOL_WORKBENCH)
	category = CAT_THROWABLE
	subcategory = CAT_EXPLOSIVE
	always_availible = FALSE

/datum/crafting_recipe/explosive/c4
	name = "Plastic Explosive"
	result = /obj/item/grenade/plastic/c4
	reqs = list(/datum/reagent/blackpowder = 90,
				/datum/reagent/nitroglycerin = 30,
				/obj/item/stack/sheet/metal = 10,
				/obj/item/stack/cable_coil = 1,
				/obj/item/stack/sheet/plastic = 5,
				/obj/item/crafting/grenade_casing = 1,
				/obj/item/assembly/igniter = 1,
				/obj/item/assembly/timer = 1)
	time = 30 SECONDS
	tools = list(TOOL_WORKBENCH)
	category = CAT_THROWABLE
	subcategory = CAT_EXPLOSIVE
	always_availible = FALSE

/datum/crafting_recipe/explosive/c4chem
	name = "Plastic Explosive (Chemical Payload)"
	result = /obj/item/bombcore/chemical
	reqs = list(/obj/item/grenade/plastic/c4 = 1,
				/obj/item/stack/sheet/metal = 5,
				/obj/item/stack/sheet/glass = 5,
				/obj/item/crafting/tube = 2,
				/obj/item/crafting/grenade_casing = 1)
	time = 30 SECONDS
	tools = list(TOOL_WORKBENCH)
	category = CAT_THROWABLE
	subcategory = CAT_EXPLOSIVE
	always_availible = FALSE

