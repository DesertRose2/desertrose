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

datum/crafting_recipe/tomahawk
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

//GUNPOWDER
/datum/crafting_recipe/compressedpowder
	name = "Compressed blackpowder"
	result = /obj/item/stack/ore/blackpowder
	time = 5
	reqs = list(/datum/reagent/blackpowder = 50)
	category = CAT_THROWABLE
	subcategory = CAT_EXPLOSIVE

//GHETTO

/datum/crafting_recipe/explosive/molotov
	name = "Molotov Cocktail"
	result = /obj/item/reagent_containers/food/drinks/bottle/molotov
	reqs = list(/obj/item/reagent_containers/rag = 1,
		/obj/item/reagent_containers/food/drinks/bottle = 1,
		)
	time = 2 SECONDS
	category = CAT_THROWABLE
	subcategory = CAT_EXPLOSIVE
	always_availible = FALSE

/datum/crafting_recipe/explosive/firebomb
	name = "Firebomb"
	result = /obj/item/grenade/homemade/firebomb
	reqs = list(/datum/reagent/fuel = 50,
				/obj/item/stack/cable_coil = 1,
				/obj/item/assembly/igniter = 1,
				/obj/item/reagent_containers/food/drinks/flask = 1)
	time = 30
	tools = list(TOOL_WORKBENCH)
	category = CAT_THROWABLE
	subcategory = CAT_EXPLOSIVE
	always_availible = FALSE

/datum/crafting_recipe/explosive/coffeepotbomb
	name = "Coffeepot Bomb"
	result = /obj/item/grenade/homemade/coffeepotbomb
	reqs = list(/datum/reagent/blackpowder = 50,
				/obj/item/crafting/coffee_pot = 1,
				/obj/item/stack/cable_coil = 1,
				/obj/item/crafting/timer = 1,)
	time = 30
	tools = list(TOOL_WORKBENCH)
	category = CAT_THROWABLE
	subcategory = CAT_EXPLOSIVE
	always_availible = FALSE

/datum/crafting_recipe/explosive/dynamite
	name = "Dynamite Stick"
	result = /obj/item/grenade/homemade/dynamite
	reqs = list(/datum/reagent/blackpowder = 70,
				/obj/item/stack/sheet/metal = 10,
				/obj/item/stack/cable_coil = 1,
				/obj/item/stack/sheet/cloth = 1)
	time = 30
	tools = list(TOOL_WORKBENCH)
	category = CAT_THROWABLE
	subcategory = CAT_EXPLOSIVE
	always_availible = FALSE

/datum/crafting_recipe/explosive/pipebomb
	name = "Pipebomb"
	result = /obj/item/grenade/homemade/pipebomb
	reqs = list(/datum/reagent/blackpowder = 80,
				/obj/item/stack/sheet/metal = 15,
				/obj/item/stack/crafting/goodparts = 3,
				/obj/item/stack/cable_coil = 1,
				/obj/item/stack/sheet/cloth = 1)
	time = 30
	tools = list(TOOL_WORKBENCH)
	category = CAT_THROWABLE
	subcategory = CAT_EXPLOSIVE
	always_availible = FALSE