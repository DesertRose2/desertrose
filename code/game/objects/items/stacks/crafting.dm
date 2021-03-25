/obj/item/stack/crafting
	name = "crafting part"
	icon = 'icons/fallout/objects/items.dmi'
	amount = 1
	max_amount = 50
	throw_speed = 3
	throw_range = 7
	w_class = WEIGHT_CLASS_TINY
	novariants = TRUE

/obj/item/stack/crafting/metalparts
	name = "metal parts"
	icon_state = "sheet-metalparts"
	singular_name = "metal part"
	custom_materials = list(/datum/material/iron = 20000)
	flags_1 = CONDUCT_1
	merge_type = /obj/item/stack/crafting/metalparts

/obj/item/stack/crafting/metalparts/three
	amount = 3

/obj/item/stack/crafting/metalparts/five
	amount = 5

/obj/item/stack/crafting/goodparts
	name = "high quality metal parts"
	icon_state = "sheet-goodparts"
	singular_name = "high quality metal part"
	custom_materials = list(/datum/material/iron = 20000)
	flags_1 = CONDUCT_1
	merge_type = /obj/item/stack/crafting/goodparts

/obj/item/stack/crafting/goodparts/three
	amount = 3

/obj/item/stack/crafting/goodparts/five
	amount = 5

/obj/item/stack/crafting/electronicparts
	name = "electronic parts"
	icon_state = "sheet-electronicparts"
	singular_name = "electronic part"
	custom_materials = list(/datum/material/glass = 20000)
	flags_1 = CONDUCT_1
	merge_type = /obj/item/stack/crafting/electronicparts

/obj/item/stack/crafting/electronicparts/three
	amount = 3

/obj/item/stack/crafting/electronicparts/five
	amount = 5

/obj/item/stack/crafting/powder
	name = "bullet remnants"
	desc = "A pouch containing some scoops of blackpowder and empty shell casings."
	icon_state = "sheet-powder"
	singular_name = "bullet remnant"
	max_amount = 100
	full_w_class = WEIGHT_CLASS_SMALL
	merge_type = /obj/item/stack/crafting/powder

GLOBAL_LIST_INIT(powder_recipes, list ( \
	new/datum/stack_recipe("Scavenge blackpowder", /obj/item/reagent_containers/glass/bottle/blackpowder, 1, 1, 60),\
))

/obj/item/stack/crafting/powder/Initialize(mapload, new_amount, merge = TRUE)
	recipes = GLOB.powder_recipes
	return ..()
