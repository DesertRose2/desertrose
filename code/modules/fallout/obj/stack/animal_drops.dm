// In this document: Hides, Sinew, Bone, Eggs, Tanning pelts. Stuff related to Fallout animal drops.
// Principle: If theres unique clothing made from specific resources its inhand crafting.
// Bighorner and Nightstalker pelt needs tanning in a drying rack before being made into clothing.


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
	merge_type = /obj/item/stack/sheet/animalhide/f13

/obj/item/stack/sheet/animalhide/f13/generic
	merge_type = /obj/item/stack/sheet/animalhide/f13/generic


/obj/item/stack/sheet/animalhide/f13/gecko
	name = "gecko hide"
	desc = "The perfect material for crafting clothing and armor."
	singular_name = "gecko hide piece"
	icon_state = "hide_gecko"
	merge_type = /obj/item/stack/sheet/animalhide/f13/gecko

/obj/item/stack/sheet/animalhide/f13/gecko/get_main_recipes()
	. = ..()
	. += GLOB.gecko_recipes

GLOBAL_LIST_INIT(gecko_recipes, list( \
	new/datum/stack_recipe("gecko mantle", /obj/item/clothing/neck/mantle/gecko, 2), \
	))


/obj/item/stack/sheet/animalhide/f13/dog
	name = "dog hide"
	desc = "Once upon a time, there lived a dog.<br>It was not a usual dog, because it lived out in the wild wasteland, where little kids are not allowed to play.<br>One day, the dog got mad and got into a fight with an adventurer.<br>The adventurer was stronger, and the dog was no more.<br>But some say a little part of this dog lives on to this day, still roaming the wild wasteland..."
	singular_name = "dog skin piece"
	icon_state = "hide_dog"
	merge_type = /obj/item/stack/sheet/animalhide/f13/dog

// No associated clothing so no tanning mechanism yet
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

// Can be ground for powder to mutate crops, insects soaks up a lot of radiation
/obj/item/stack/sheet/animalhide/f13/chitin
	name = "insect chitin"
	desc = "Thick insect chitin, tough but light."
	singular_name = "piece of insect chitin"
	icon_state = "chitin"
	grind_results = list(/datum/reagent/radium = 3)
	merge_type = /obj/item/stack/sheet/animalhide/f13/chitin

/obj/item/stack/sheet/animalhide/f13/deathclaw
	name = "deathclaw hide"
	desc = "A glorious hunting trophy."
	singular_name = "deathclaw hide piece"
	icon_state = "hide_deathclaw"
	merge_type = /obj/item/stack/sheet/animalhide/f13/deathclaw


// Bighorner 
/obj/item/stack/sheet/animalhide/f13/bighorner
	name = "raw bighorner pelt"
	desc = "A smelly pelt that needs tanning to make clothing from."
	singular_name = "bighorner pelt"
	icon_state = "pelt_bighorner"
	merge_type = /obj/item/stack/sheet/animalhide/f13/bighorner
	var/drying_threshold_temperature = 400
	var/wetness = 30
	color = "#b89b9a"

/obj/item/stack/sheet/animalhide/f13/pelt_horner
	name = "bighorner pelt"
	desc = "A wooly pelt taken from a bighorner."
	merge_type = /obj/item/stack/sheet/animalhide/f13/pelt_horner
	icon_state = "pelt_bighorner"

/obj/item/stack/sheet/animalhide/f13/pelt_horner/get_main_recipes()
	. = ..()
	. += GLOB.bighorner_recipes

GLOBAL_LIST_INIT(bighorner_recipes, list( \
	new/datum/stack_recipe("bighorner fur mantle", /obj/item/clothing/neck/mantle/peltfur, 1), \
	))


// Nightstalker
/obj/item/stack/sheet/animalhide/f13/nightstalker
	name = "raw nightstalker pelt"
	desc = "A raw pelt that needs tanning to make clothing from."
	singular_name = "nightstalker pelt"
	icon_state = "pelt_nightstalker"
	merge_type = /obj/item/stack/sheet/animalhide/f13/nightstalker
	var/drying_threshold_temperature = 400
	var/wetness = 30
	color = "#b89b9a"

/obj/item/stack/sheet/animalhide/f13/pelt_stalker
	name = "nightstalker pelt"
	desc = "A pelt with traits from both a rattlesnake and a coyote."
	merge_type = /obj/item/stack/sheet/animalhide/f13/pelt_stalker
	icon_state = "pelt_nightstalker"

/obj/item/stack/sheet/animalhide/f13/pelt_stalker/get_main_recipes()
	. = ..()
	. += GLOB.nightstalker_recipes

GLOBAL_LIST_INIT(nightstalker_recipes, list( \
	new/datum/stack_recipe("nighstalker fur hat", /obj/item/clothing/head/f13/hat_nightstalker, 1), \
	))

// Human skin
/obj/item/stack/sheet/animalhide/f13/human
	name = "human skin"
	desc = "hopefully it was cut from a feral ghoul."
	singular_name = "human skin piece"
	icon_state = "skin_human"
	merge_type = /obj/item/stack/sheet/animalhide/f13/human

/obj/item/stack/sheet/animalhide/f13/human/get_main_recipes()
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

// Can be ground for good crop fertilizer
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
	new /datum/stack_recipe("Bone Armor", /obj/item/clothing/suit/armor/f13/bone, 6, time = 30)))

// Deathclaw claw
/obj/item/stack/sheet/bone/claw
	name = "claw"
	desc = "The claw of a deathclaw."
	icon_state = "bone_claw"
	item_state = "sheet-bone"
	singular_name = "claw"
	w_class = WEIGHT_CLASS_TINY

//////////////////
// PELT TANNING //
/////////////////

/obj/item/stack/sheet/animalhide/f13/bighorner/temperature_expose(datum/gas_mixture/air, exposed_temperature, exposed_volume)
	..()
	if(exposed_temperature >= drying_threshold_temperature)
		wetness--
		if(wetness == 0)
			new /obj/item/stack/sheet/animalhide/f13/pelt_horner(drop_location(), 1)
			wetness = initial(wetness)
			use(1)

/obj/item/stack/sheet/animalhide/f13/nightstalker/temperature_expose(datum/gas_mixture/air, exposed_temperature, exposed_volume)
	..()
	if(exposed_temperature >= drying_threshold_temperature)
		wetness--
		if(wetness == 0)
			new /obj/item/stack/sheet/animalhide/f13/pelt_stalker(drop_location(), 1)
			wetness = initial(wetness)
			use(1)


//////////
// EGGS //
//////////

/obj/item/reagent_containers/food/snacks/f13/egg
	name = "egg"
	icon = 'icons/fallout/mobs/mob_drops.dmi'

// OBSOLETE replace with below
/obj/item/reagent_containers/food/snacks/f13/deathclawegg

/obj/item/reagent_containers/food/snacks/f13/egg/deathclaw
	name = "deathclaw egg"
	desc = "A deathclaw egg. It has a brownish-red shell. Look at this thing, it's as big as your torso!"
	icon_state = "egg_deathclaw"
	bonus_reagents = list(/datum/reagent/toxin = 30)
	list_reagents = list(/datum/reagent/consumable/eggyolk = 40)
	filling_color = "#F0E68C"

/obj/item/reagent_containers/food/snacks/f13/egg/nightstalker
	name = "nightstalker egg"
	desc = "A shiny, leathery egg."
	icon_state = "egg_nightstalker"
	bonus_reagents = list(/datum/reagent/toxin = 5)
	list_reagents = list(/datum/reagent/consumable/eggyolk = 20)
	filling_color = "#FFDF00"

/obj/item/reagent_containers/food/snacks/f13/egg/mirelurk
	name = "mirelurk egg"
	desc = "A bluish egg with very hard shell."
	icon_state = "egg_mirelurk"
	list_reagents = list(/datum/reagent/consumable/eggyolk = 30)
	filling_color = "#E6E6FA"
