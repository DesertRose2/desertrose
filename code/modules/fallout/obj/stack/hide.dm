// In this document: Animal drops from butchery

///////////
// HIDES //
///////////

/obj/item/stack/sheet/animalhide/f13
	name = "hide"
	desc = "skin from a beast."
	icon = 'icons/fallout/mobs/mob_drops.dmi'
	icon_state = "hide_generic"
	item_state = "sheet-hide"
	singular_name = "animal skin piece"
	novariants = TRUE

/obj/item/stack/sheet/animalhide/f13/generic
	merge_type = /obj/item/stack/sheet/animalhide/f13/generic

/obj/item/stack/sheet/animalhide/f13/gecko
	name = "gecko hide"
	desc = "The perfect material for crafting clothing and armor."
	singular_name = "gecko hide piece"
	icon_state = "hide_gecko"
	merge_type = /obj/item/stack/sheet/animalhide/f13/gecko

/obj/item/stack/sheet/animalhide/f13/dog
	name = "dog hide"
	desc = "Once upon a time, there lived a dog.<br>It was not a usual dog, because it lived out in the wild wasteland, where little kids are not allowed to play.<br>One day, the dog got mad and got into a fight with an adventurer.<br>The adventurer was stronger, and the dog was no more.<br>But some say a little part of this dog lives on to this day, still roaming the wild wasteland..."
	singular_name = "dog skin piece"
	icon_state = "hide_dog"
	merge_type = /obj/item/stack/sheet/animalhide/f13/dog

/obj/item/stack/sheet/animalhide/f13/radstag
	name = "radstag pelt"
	desc = "A raw pelt taken from a radstag."
	singular_name = "radstag pelt"
	icon_state = "pelt_bighorner"
	merge_type = /obj/item/stack/sheet/animalhide/f13/radstag

/obj/item/stack/sheet/animalhide/f13/brahmin
	name = "brahmin hide"
	desc = "The by-product of brahmin farming."
	singular_name = "brahmin hide piece"
	icon_state = "hide_brahmin"
	merge_type = /obj/item/stack/sheet/animalhide/f13/brahmin

/obj/item/stack/sheet/animalhide/f13/chitin
	name = "insect chitin"
	desc = "Thick insect chitin, tough but light."
	singular_name = "piece of insect chitin"
	icon_state = "chitin"
	grind_results = list(/datum/reagent/sodium = 3, /datum/reagent/chlorine = 3)
	merge_type = /obj/item/stack/sheet/animalhide/f13/chitin

/obj/item/stack/sheet/animalhide/f13/deathclaw
	name = "deathclaw hide"
	desc = "A glorious hunting trophy."
	singular_name = "deathclaw hide piece"
	icon_state = "hide_deathclaw"
	merge_type = /obj/item/stack/sheet/animalhide/f13/deathclaw

// Bighorner
/obj/item/stack/sheet/animalhide/f13/bighorner
	name = "bighorner pelt"
	desc = "A raw pelt taken from a bighorner."
	singular_name = "bighorner pelt"
	icon_state = "pelt_bighorner"
	merge_type = /obj/item/stack/sheet/animalhide/f13/bighorner

/obj/item/stack/sheet/animalhide/f13/bighorner/get_main_recipes()
	. = ..()
	. += GLOB.bighorner_recipes

GLOBAL_LIST_INIT(bighorner_recipes, list( \
	new/datum/stack_recipe("bighorner fur mantle", /obj/item/clothing/neck/mantle/peltfur, 1), \
	))

// Nightstalker
/obj/item/stack/sheet/animalhide/f13/nightstalker
	name = "nightstalker pelt"
	desc = "A pelt with traits from both a rattlesnake and a coyote."
	singular_name = "nightstalker pelt"
	icon_state = "pelt_nightstalker"
	merge_type = /obj/item/stack/sheet/animalhide/f13/nightstalker

/obj/item/stack/sheet/animalhide/f13/nightstalker/get_main_recipes()
	. = ..()
	. += GLOB.nightstalker_recipes

GLOBAL_LIST_INIT(nightstalker_recipes, list( \
	new/datum/stack_recipe("nighstalker hat", /obj/item/clothing/head/f13/hat_nightstalker, 1), \
	))

// Human skin
/obj/item/stack/sheet/animalhide/f13/human
	name = "human skin"
	desc = "hopefully it was cut from a feral ghoul."
	singular_name = "human skin piece"
	icon_state = "skin_human"
	merge_type = /obj/item/stack/sheet/animalhide/f13/human

/obj/item/stack/sheet/animalhide/human/get_main_recipes()
	. = ..()
	. += GLOB.human_recipes

GLOBAL_LIST_INIT(human_recipes, list( \
	new/datum/stack_recipe("bloated human costume", /obj/item/clothing/suit/hooded/bloated_human, 5), \
	))


///////////
// SINEW //
///////////

/obj/item/stack/sheet/sinew
	name = "sinew"
	icon = 'icons/fallout/mobs/mob_drops.dmi'
	desc = "Long stringy filaments, presumably from some kind of animal."
	singular_name = "sinew"
	icon_state = "sinew"
	novariants = TRUE
	merge_type = /obj/item/stack/sheet/sinew

GLOBAL_LIST_INIT(sinew_recipes, list ( \
	new/datum/stack_recipe("sinew restraints", /obj/item/restraints/handcuffs/sinew, 1), \
))

/obj/item/stack/sheet/sinew/get_main_recipes()
	. = ..()
	. += GLOB.sinew_recipes


///////////
// BONES //
///////////

/obj/item/stack/sheet/bone
	name = "bones"
	icon = 'icons/fallout/mobs/mob_drops.dmi'
	icon_state = "bone"
	item_state = "sheet-bone"
	custom_materials = list(/datum/material/bone = MINERAL_MATERIAL_AMOUNT)
	singular_name = "bone"
	desc = "Someone's been drinking their milk."
	force = 7
	throwforce = 5
	max_amount = 12
	w_class = WEIGHT_CLASS_NORMAL
	throw_speed = 1
	throw_range = 3
	grind_results = list(/datum/reagent/plantnutriment/robustharvestnutriment = 10)
	merge_type = /obj/item/stack/sheet/bone
	material_type = /datum/material/bone

/obj/item/stack/sheet/bone/get_main_recipes()
	. = ..()
	. += GLOB.bone_recipes

GLOBAL_LIST_INIT(bone_recipes, list(
	new /datum/stack_recipe("Bone Dagger", /obj/item/kitchen/knife/combat/bone, 2, time = 20), \
	new /datum/stack_recipe("Skull Helmet", /obj/item/clothing/head/helmet/skull, 4, time = 30), \
	new /datum/stack_recipe("Bone Armor", /obj/item/clothing/suit/armor/bone, 6, time = 30)))

// Deathclaw claw
/obj/item/stack/sheet/bone/claw
	name = "claw"
	desc = "The claw of a deathclaw."
	icon_state = "bone_claw"
	item_state = "sheet-bone"
	singular_name = "claw"
	merge_type = /obj/item/stack/sheet/bone/claw
