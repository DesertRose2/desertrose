/datum/crafting_recipe/salvage_stimpak
	name = "Salvage injector"
	result = /obj/item/reagent_containers/syringe
	reqs = list(/obj/item/reagent_containers/hypospray/medipen/f13/stimpak = 1)
	time = 20
	tools = list(TOOL_WORKBENCH)
	category = CAT_MEDICAL

/datum/crafting_recipe/upgraded_gauze
	name = "Improved Gauze"
	result = /obj/item/stack/medical/gauze/adv/one
	time = 50
	reqs = list(/obj/item/stack/medical/gauze = 1,
				/datum/reagent/space_cleaner/sterilizine = 10)
	category = CAT_MEDICAL
	blacklist = list(/obj/item/stack/medical/gauze/improvised)

/datum/crafting_recipe/brute_pack
	name = "Suture Pack"
	result = /obj/item/stack/medical/suture/five
	time = 50
	reqs = list(/obj/item/stack/medical/gauze = 1,
				/datum/reagent/medicine/styptic_powder = 10)
	category = CAT_MEDICAL

/datum/crafting_recipe/suture
	name = "Improvised Suture"
	result = /obj/item/stack/medical/suture/emergency/five
	time = 30
	reqs = list(/obj/item/stack/medical/gauze/improvised = 1,
				/datum/reagent/consumable/ethanol = 10)
	category = CAT_MEDICAL

/datum/crafting_recipe/ointment
	name = "Improvised Ointment"
	result = /obj/item/stack/medical/ointment/five
	time = 30
	reqs = list(/obj/item/stack/medical/gauze/improvised = 1,
				/obj/item/reagent_containers/food/snacks/grown/agave = 1)
	category = CAT_MEDICAL

/datum/crafting_recipe/burn_pack
	name = "Regenerative Mesh"
	result = /obj/item/stack/medical/mesh/five
	time = 50
	reqs = list(/obj/item/stack/medical/gauze = 1,
				/datum/reagent/medicine/silver_sulfadiazine = 10)
	category = CAT_MEDICAL

//Powders/Stimpaks
/datum/crafting_recipe/bitter
	name = "Bitter Drink"
	result = /obj/item/reagent_containers/pill/patch/f13/bitterdrink
	time = 30
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/broc = 1,
				/obj/item/reagent_containers/food/snacks/grown/xander = 1,
				/obj/item/reagent_containers/food/drinks/bottle = 1
				)
	category = CAT_MEDICAL

/datum/crafting_recipe/healpowder
	name = "Healing powder"
	result = /obj/item/reagent_containers/pill/patch/f13/healingpowder
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/broc = 2,
				/obj/item/reagent_containers/food/snacks/grown/xander = 2)
	time = 25
	category = CAT_MEDICAL

/datum/crafting_recipe/healpowder5
	name = "Healing powder x5"
	result = /obj/item/storage/box/medicine/powder5
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/broc = 10,
				/obj/item/reagent_containers/food/snacks/grown/xander = 10)
	time = 50
	category = CAT_MEDICAL

/datum/crafting_recipe/healpowder10
	name = "Healing powder x10"
	result = /obj/item/storage/box/medicine/powder10
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/broc = 20,
				/obj/item/reagent_containers/food/snacks/grown/xander = 20)
	time = 50
	category = CAT_MEDICAL

/datum/crafting_recipe/healpoultice
	name = "Healing poultice"
	result = /obj/item/reagent_containers/pill/patch/f13/healpoultice
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/broc = 1,
				/obj/item/reagent_containers/food/snacks/grown/xander = 1,
				/obj/item/reagent_containers/food/snacks/grown/feracactus = 1,
				/obj/item/reagent_containers/food/snacks/grown/fungus = 1,
				/obj/item/reagent_containers/food/snacks/grown/pungafruit = 1)
	time = 40
	category = CAT_MEDICAL

/datum/crafting_recipe/healpoultice5
	name = "Healing poultice x5"
	result = /obj/item/storage/box/medicine/poultice5
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/broc = 5,
				/obj/item/reagent_containers/food/snacks/grown/xander = 5,
				/obj/item/reagent_containers/food/snacks/grown/feracactus = 5,
				/obj/item/reagent_containers/food/snacks/grown/fungus = 5,
				/obj/item/reagent_containers/food/snacks/grown/pungafruit = 5)
	time = 60
	category = CAT_MEDICAL

/datum/crafting_recipe/healpoultice10
	name = "Healing poultice x10"
	result = /obj/item/storage/box/medicine/poultice10
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/broc = 10,
				/obj/item/reagent_containers/food/snacks/grown/xander = 10,
				/obj/item/reagent_containers/food/snacks/grown/feracactus = 10,
				/obj/item/reagent_containers/food/snacks/grown/fungus = 10,
				/obj/item/reagent_containers/food/snacks/grown/pungafruit = 10)
	time = 60
	category = CAT_MEDICAL

/datum/crafting_recipe/zombiepoultice
	name = "Zombie poultice"
	result = /obj/item/reagent_containers/pill/patch/f13/poultice_zombie
	reqs = list(/obj/item/reagent_containers/pill/patch/f13/healpoultice = 2,
				/datum/reagent/medicine/bicaridine = 20,
				/datum/reagent/medicine/salglu_solution = 15,
				/obj/item/stack/medical/bone_gel/hydra = 2)
	time = 50
	category = CAT_MEDICAL
	always_availible = FALSE
	blacklist = list(
					/obj/item/reagent_containers/pill/patch/f13/healingpowder,
					/obj/item/reagent_containers/pill/patch/f13/healingpowder/custom,
					/obj/item/reagent_containers/pill/patch/f13/poultice_zombie
					)

/datum/crafting_recipe/stimpak
	name = "Stimpak"
	result = /obj/item/reagent_containers/hypospray/medipen/f13/stimpak
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/broc = 2,
				/obj/item/reagent_containers/food/snacks/grown/xander = 2,
				/obj/item/reagent_containers/food/snacks/grown/mutfruit = 2,
				/obj/item/reagent_containers/syringe = 1)
	tools = list(TOOL_WORKBENCH)
	time = 40
	category = CAT_MEDICAL

/datum/crafting_recipe/stimpak5
	name = "Stimpak x5"
	result = /obj/item/storage/box/medicine/stimpak5
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/broc = 10,
				/obj/item/reagent_containers/food/snacks/grown/xander = 10,
				/obj/item/reagent_containers/food/snacks/grown/mutfruit = 10,
				/obj/item/reagent_containers/syringe = 5)
	tools = list(TOOL_WORKBENCH)
	time = 40
	category = CAT_MEDICAL

/datum/crafting_recipe/stimpak10
	name = "Stimpak x10"
	result = /obj/item/storage/box/medicine/stimpak10
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/broc = 20,
				/obj/item/reagent_containers/food/snacks/grown/xander = 20,
				/obj/item/reagent_containers/food/snacks/grown/mutfruit = 20,
				/obj/item/reagent_containers/syringe = 10)
	tools = list(TOOL_WORKBENCH)
	time = 40
	category = CAT_MEDICAL

/datum/crafting_recipe/superstimpak
	name = "Super Stimpak"
	result = /obj/item/reagent_containers/hypospray/medipen/f13/stimpak/super
	reqs = list(/obj/item/reagent_containers/hypospray/medipen/f13/stimpak = 1,
				/obj/item/stack/sheet/leather = 2,
				/obj/item/reagent_containers/food/snacks/grown/mutfruit = 2)
	tools = list(TOOL_WORKBENCH)
	time = 50
	category = CAT_MEDICAL
	blacklist = list(/obj/item/reagent_containers/hypospray/medipen/f13/stimpak/super,
					/obj/item/reagent_containers/hypospray/medipen/f13/stimpak/custom)

/datum/crafting_recipe/superstimpak5
	name = "Super Stimpak x5"
	result = /obj/item/storage/box/medicine/superstimpak5
	reqs = list(/obj/item/reagent_containers/hypospray/medipen/f13/stimpak = 5,
				/obj/item/stack/sheet/leather = 10,
				/obj/item/reagent_containers/food/snacks/grown/mutfruit = 10)
	tools = list(TOOL_WORKBENCH)
	time = 50
	category = CAT_MEDICAL
	blacklist = list(/obj/item/reagent_containers/hypospray/medipen/f13/stimpak/super,
					/obj/item/reagent_containers/hypospray/medipen/f13/stimpak/custom)

/datum/crafting_recipe/superstimpak10
	name = "Super Stimpak x10"
	result = /obj/item/storage/box/medicine/superstimpak10
	reqs = list(/obj/item/reagent_containers/hypospray/medipen/f13/stimpak = 10,
				/obj/item/stack/sheet/leather = 20,
				/obj/item/reagent_containers/food/snacks/grown/mutfruit = 20)
	tools = list(TOOL_WORKBENCH)
	time = 50
	category = CAT_MEDICAL
	blacklist = list(/obj/item/reagent_containers/hypospray/medipen/f13/stimpak/super,
					/obj/item/reagent_containers/hypospray/medipen/f13/stimpak/custom)

//Drugs
/datum/crafting_recipe/jet
	name = "Jet"
	result = /obj/item/reagent_containers/pill/patch/f13/jet
	reqs = list(/obj/item/clothing/mask/cigarette = 2,
				/datum/reagent/consumable/soymilk = 15,
				/obj/item/toy/crayon/spraycan = 1)
	time = 35
	tools = list(TOOL_WORKBENCH)
	category = CAT_MEDICAL
	always_availible = FALSE

/datum/crafting_recipe/turbo
	name = "Turbo"
	result = /obj/item/reagent_containers/pill/patch/f13/turbo
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/feracactus = 2,
				/obj/item/reagent_containers/food/snacks/grown/agave = 2,
				/datum/reagent/consumable/ethanol/whiskey = 15)
	time = 35
	tools = list(TOOL_WORKBENCH)
	category = CAT_MEDICAL
	always_availible = FALSE

/datum/crafting_recipe/psycho
	name = "Psycho"
	result = /obj/item/reagent_containers/hypospray/medipen/f13/psycho
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/feracactus = 3,
				/obj/item/reagent_containers/food/snacks/grown/fungus = 3,
				/datum/reagent/consumable/nuka_cola = 10)
	time = 35
	tools = list(TOOL_WORKBENCH)
	category = CAT_MEDICAL
	always_availible = FALSE

/datum/crafting_recipe/medx
	name = "Med-X"
	result = /obj/item/reagent_containers/hypospray/medipen/f13/medx
	reqs = list(/obj/item/reagent_containers/syringe = 1,
				/obj/item/reagent_containers/food/snacks/grown/pungafruit = 2,
				/obj/item/reagent_containers/food/snacks/grown/datura = 2,
				/obj/item/reagent_containers/food/snacks/grown/coyotetobacco = 2,
				/obj/item/reagent_containers/food/snacks/grown/xander = 2,
				/obj/item/reagent_containers/food/snacks/grown/broc = 2)
	time = 35
	tools = list(TOOL_WORKBENCH, TOOL_WELDER)
	category = CAT_MEDICAL
	always_availible = FALSE

/datum/crafting_recipe/hydra
	name = "Hydra"
	result = /obj/item/stack/medical/bone_gel/hydra
	reqs = list(/datum/reagent/consumable/nuka_cola = 10,
				/obj/item/reagent_containers/food/snacks/grown/fungus = 4,
				/obj/item/reagent_containers/food/snacks/grown/broc = 3,
				/obj/item/reagent_containers/food/snacks/grown/feracactus = 2)
	time = 40
	tools = list(TOOL_WORKBENCH)
	category = CAT_MEDICAL
	always_availible = FALSE

/datum/crafting_recipe/cateye
	name = "Cateye"
	result = /obj/item/storage/pill_bottle/chem_tin/f13/cateye
	reqs = list(/obj/item/storage/pill_bottle = 1,
				/obj/item/reagent_containers/food/snacks/grown/carrot = 2,
				/obj/item/reagent_containers/food/snacks/grown/agave = 2,
				/obj/item/reagent_containers/food/snacks/grown/feracactus = 2)
	time = 20
	tools = list(TOOL_WORKBENCH)
	category = CAT_MEDICAL
	always_availible = FALSE

/datum/crafting_recipe/buffout
	name = "Buffout"
	result = /obj/item/storage/pill_bottle/chem_tin/f13/buffout
	reqs = list(/obj/item/storage/pill_bottle = 1,
				/obj/item/reagent_containers/food/snacks/grown/buffalogourd = 10,
				/obj/item/reagent_containers/food/snacks/grown/yucca = 10,
				/obj/item/reagent_containers/food/snacks/grown/mutfruit = 5,
				/datum/reagent/consumable/nuka_cola = 60)
	time = 50
	tools = list(TOOL_WORKBENCH)
	category = CAT_MEDICAL
	always_availible = FALSE
//
/datum/crafting_recipe/extract_gaia
	name = "Extract gaia"
	result = /obj/item/reagent_containers/glass/bottle/gaia
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/ambrosia/gaia  = 6,
	/datum/reagent/water = 50)
	time = 20
	tools = list(TOOL_WORKBENCH)
	category = CAT_MEDICAL

/datum/crafting_recipe/radshroom
	name = "Mushroom Extract"
	result = /obj/item/reagent_containers/glass/bottle/radshroom
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/fungus = 2,
				/obj/item/reagent_containers/food/snacks/grown/pungafruit = 1)
	time = 20
	tools = list(TOOL_WORKBENCH)
	category = CAT_MEDICAL				