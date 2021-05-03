/////////////////
//Crafting Equipment//
/////////////////

/datum/crafting_recipe/meatspikeframe
	name = "Meatspike Frame"
	result = /obj/structure/kitchenspike_frame
	reqs = list(/obj/item/stack/sheet/metal = 1)
	time = 25
	subcategory = CAT_MISCELLANEOUS
	category = CAT_MISC

/datum/crafting_recipe/rollingpin
	name = "Rolling Pin"
	result = /obj/item/kitchen/rollingpin
	reqs = list(/obj/item/stack/sheet/mineral/wood = 2)
	time = 30
	subcategory = CAT_MISCELLANEOUS
	category = CAT_MISC

/datum/crafting_recipe/choppingblock
	name = "Chopping Block"
	result = /obj/item/chopping_block
	reqs = list(/obj/item/stack/sheet/mineral/wood = 2)
	time = 30
	subcategory = CAT_MISCELLANEOUS
	category = CAT_MISC

/datum/crafting_recipe/meatspikeframe
	name = "Meatspike Frame"
	result = /obj/structure/kitchenspike_frame
	reqs = list(/obj/item/stack/sheet/metal = 1)
	time = 25
	subcategory = CAT_MISCELLANEOUS
	category = CAT_MISC

/datum/crafting_recipe/growbin
	name = "Grow Bin"
	result = /obj/machinery/smartfridge/bottlerack/grownbin
	reqs = list(/obj/item/stack/sheet/mineral/wood = 20)
	time = 40
	subcategory = CAT_MISCELLANEOUS
	category = CAT_MISC

/datum/crafting_recipe/seedbin
	name = "Seed Bin"
	result = /obj/machinery/smartfridge/bottlerack/seedbin
	reqs = list(/obj/item/stack/sheet/mineral/wood = 20)
	time = 40
	subcategory = CAT_MISCELLANEOUS
	category = CAT_MISC

/datum/crafting_recipe/compost
	name = "Compost Bin"
	result = /obj/structure/reagent_dispensers/compostbin
	reqs = list(/obj/item/stack/sheet/mineral/wood = 25)
	time = 40
	subcategory = CAT_MISCELLANEOUS
	category = CAT_MISC

/datum/crafting_recipe/seedextractor
	name = "Seed Extractor"
	result = /obj/structure/legion_extractor
	reqs = list(/obj/item/stack/sheet/mineral/wood = 25)
	time = 40
	subcategory = CAT_MISCELLANEOUS
	category = CAT_MISC

/datum/crafting_recipe/dogbed
	name = "Dog Bed"
	result = /obj/structure/bed/dogbed
	reqs = 	list(/obj/item/stack/sheet/cloth = 2,
				/obj/item/stack/sheet/mineral/wood = 5)
	time = 10
	subcategory = CAT_MISCELLANEOUS
	category = CAT_MISC

/datum/crafting_recipe/loom
	name = "Weaving Loom"
	result = /obj/structure/loom
	reqs = list(/obj/item/stack/sheet/mineral/wood = 10)
	time = 15
	subcategory = CAT_MISCELLANEOUS
	category = CAT_MISC

/datum/crafting_recipe/honeyapiary
	name = "Apiary"
	result = /obj/structure/beebox
	reqs = list(/obj/item/stack/sheet/mineral/wood = 40)
	time = 50
	subcategory = CAT_MISCELLANEOUS
	category = CAT_MISC

/datum/crafting_recipe/honeyframe
	name = "Honey Frame"
	result = /obj/item/honey_frame
	reqs = list(/obj/item/stack/sheet/mineral/wood = 5)
	time = 10
	subcategory = CAT_MISCELLANEOUS
	category = CAT_MISC

/datum/crafting_recipe/barrel
	name = "Wooden Barrel"
	result = /obj/item/honey_frame
	reqs = 	list(/obj/item/stack/sheet/mineral/wood = 8,
				/obj/item/stack/rods = 1)
	time = 30
	subcategory = CAT_MISCELLANEOUS
	category = CAT_MISC

/datum/crafting_recipe/dryingrack
	name = "Drying Rack"
	result = /obj/machinery/smartfridge/drying_rack
	reqs = 	list(/obj/item/stack/sheet/mineral/wood = 10)
	time = 15
	subcategory = CAT_MISCELLANEOUS
	category = CAT_MISC


/////////////////
//Large Objects//
/////////////////
/datum/crafting_recipe/plant
	name = "Potted plant"
	result = /obj/item/kirbyplants/random
	reqs = list(/obj/item/stack/sheet/mineral/sandstone=5,
				/obj/item/seeds=1)
	time = 20
	subcategory = CAT_MISCELLANEOUS
	category = CAT_MISC

/datum/crafting_recipe/rags
	name = "Cut clothing into rags"
	result = /obj/item/stack/sheet/cloth/three
	reqs = list(/obj/item/clothing/under = 1)
	time = 20
	subcategory = CAT_MISCELLANEOUS
	category = CAT_MISC

/datum/crafting_recipe/showercurtain
	name = "Shower Curtains"
	reqs = 	list(/obj/item/stack/sheet/cloth = 2,
				/obj/item/stack/sheet/plastic = 2,
				/obj/item/stack/rods = 1)
	result = /obj/structure/curtain
	subcategory = CAT_FURNITURE
	category = CAT_MISC

///////////////////////////
//Salvaging and Tinkering//
///////////////////////////
/datum/crafting_recipe/scavengerod
	name = "Scavenge For Rods"
	result = /obj/item/stack/rods
	time = 600
	category = CAT_ROBOT

/datum/crafting_recipe/scavengemetal
	name = "Scavenge For Plating"
	result = /obj/item/stack/sheet/metal
	time = 600
	category = CAT_ROBOT

/datum/crafting_recipe/USAeyebot
	name = "Propaganda eyebot"
	result = /mob/living/simple_animal/pet/dog/eyebot
	reqs = list(/obj/item/stack/crafting/electronicparts = 5,
				/obj/item/stack/crafting/metalparts = 3,
				/obj/item/stack/crafting/goodparts = 2)
	tools = list(TOOL_WORKBENCH)
	time = 40
	category = CAT_ROBOT

//////////////////////
//Burial & Execution//
//////////////////////

/datum/crafting_recipe/rip
	subcategory = CAT_FURNITURE
	category = CAT_MISC

/datum/crafting_recipe/rip/gravemarker
	name = "Gravemarker"
	result = /obj/structure/statue/wood/headstonewood
	reqs = list(/obj/item/stack/sheet/mineral/wood = 3)
	time = 10

/datum/crafting_recipe/rip/coffin
	name = "Coffin"
	result = /obj/structure/closet/crate/coffin
	reqs = list(/obj/item/stack/sheet/mineral/wood = 5)
	time = 20

/datum/crafting_recipe/rip/blackcoffin
	name = "Black Coffin"
	result = /obj/structure/closet/crate/coffin/blackcoffin
	tools = list(/obj/item/weldingtool,
				/obj/item/screwdriver)
	reqs = list(/obj/item/stack/sheet/cloth = 1,
				/obj/item/stack/sheet/mineral/wood = 5,
				/obj/item/stack/sheet/metal = 1)
	time = 20

/datum/crafting_recipe/rip/metalcoffin
	name = "Metal Coffin"
	result =/obj/structure/closet/crate/coffin/metalcoffin
	tools = list(/obj/item/weldingtool,
				/obj/item/screwdriver)
	reqs = list(/obj/item/stack/sheet/metal = 5)
	time = 20

/datum/crafting_recipe/rip/crossexecution
	name = "Legion Cross"
	result = /obj/structure/cross
	time = 15
	reqs = list(/obj/item/stack/sheet/mineral/wood = 10)

/datum/crafting_recipe/rip/gallows
	name = "Gallows"
	result = /obj/structure/gallow
	time = 15
	reqs = list(/obj/item/stack/sheet/mineral/wood = 10)

/datum/crafting_recipe/rip/guillotine
	name = "Guillotine"
	result = /obj/structure/guillotine
	time = 150 // Building a functioning guillotine takes time
	reqs = list(/obj/item/stack/sheet/plasteel = 3,
				/obj/item/stack/sheet/mineral/wood = 20,
				/obj/item/stack/cable_coil = 10)
	tools = list(TOOL_SCREWDRIVER, TOOL_WRENCH, TOOL_WELDER)

/*
/datum/crafting_recipe/femur_breaker
	name = "Femur Breaker"
	result = /obj/structure/femur_breaker
	time = 150
	reqs = list(/obj/item/stack/sheet/metal = 20,
				/obj/item/stack/cable_coil = 30)
	tools = list(TOOL_SCREWDRIVER, TOOL_WRENCH, TOOL_WELDER)
	subcategory = CAT_MISCELLANEOUS
	category = CAT_MISC
*/

/datum/crafting_recipe/bloodsucker/vassalrack
	name = "Persuasion Rack"
	//desc = "For converting crewmembers into loyal Vassals."
	result = /obj/structure/bloodsucker/vassalrack
	tools = list(/obj/item/weldingtool,
					//obj/item/screwdriver,
					/obj/item/wrench
					)
	reqs = list(/obj/item/stack/sheet/mineral/wood = 3,
				/obj/item/stack/sheet/metal = 2,
				/obj/item/restraints/handcuffs/cable = 2,
				//obj/item/storage/belt = 1,
				//obj/item/stack/sheet/animalhide = 1,
				//obj/item/stack/sheet/leather = 1,
				//obj/item/stack/sheet/plasteel = 5
				)
		//parts = list(/obj/item/storage/belt = 1
		//			 )
	time = 150
	subcategory = CAT_MISCELLANEOUS
	category = CAT_MISC
	always_availible = FALSE	// Disabled until learned


// /datum/crafting_recipe/bloodsucker/candelabrum
// 	name = "Candelabrum"
// 	//desc = "For converting crewmembers into loyal Vassals."
// 	result = /obj/structure/bloodsucker/candelabrum
// 	tools = list(/obj/item/weldingtool,
// 				/obj/item/wrench
// 				)
// 	reqs = list(/obj/item/stack/sheet/metal = 3,
// 				/obj/item/stack/rods = 1,
// 				/obj/item/candle = 1
// 				)
// 	time = 100
// 	subcategory = CAT_MISCELLANEOUS
// 	category = CAT_MISC
// 	always_availible = FALSE	// Disabled til learned

///////////////////
//Tools & Storage//
///////////////////

/datum/crafting_recipe/papersack
	name = "Paper Sack"
	result = /obj/item/storage/box/papersack
	time = 10
	reqs = list(/obj/item/paper = 5)
	subcategory = CAT_TOOL
	category = CAT_MISC

/datum/crafting_recipe/smallcarton
	name = "Small Carton"
	result = /obj/item/reagent_containers/food/drinks/sillycup/smallcarton
	time = 10
	reqs = list(/obj/item/stack/sheet/cardboard = 1)
	subcategory = CAT_TOOL
	category = CAT_MISC

/datum/crafting_recipe/picket_sign
	name = "Picket Sign"
	result = /obj/item/picket_sign
	reqs = list(/obj/item/stack/rods = 1,
				/obj/item/stack/sheet/cardboard = 2)
	time = 80
	subcategory = CAT_TOOL
	category = CAT_MISC

/*
/datum/crafting_recipe/electrochromatic_kit
	name = "Electrochromatic Kit"
	result = /obj/item/electronics/electrochromatic_kit
	reqs = list(/obj/item/stack/sheet/metal = 1,
				/obj/item/stack/cable_coil = 1)
	time = 5
	subcategory = CAT_TOOL
	category = CAT_MISC
	always_availible = FALSE

/datum/crafting_recipe/heretic/codex
	name = "Codex Cicatrix"
	result = /obj/item/forbidden_book
	tools = list(/obj/item/pen)
	reqs = list(/obj/item/paper = 5,
				/obj/item/organ/eyes = 1,
				/obj/item/organ/heart = 1,
				/obj/item/stack/sheet/animalhide/human = 1)
	time = 150
	subcategory = CAT_MISCELLANEOUS
	category = CAT_MISC
	always_availible = FALSE
	always_availible = FALSE
*/

////////////
//Vehicles//
////////////

/datum/crafting_recipe/wheelchair
	name = "Wheelchair"
	result = /obj/vehicle/ridden/wheelchair
	reqs = list(/obj/item/stack/sheet/plasteel = 2,
				/obj/item/stack/rods = 8)
	time = 100
	subcategory = CAT_MISCELLANEOUS
	category = CAT_MISC


////////////
//Unsorted//
////////////



/datum/crafting_recipe/blackcarpet
	name = "Black Carpet"
	reqs = list(/obj/item/stack/tile/carpet = 50, /obj/item/toy/crayon/black = 1)
	result = /obj/item/stack/tile/carpet/black/fifty
	subcategory = CAT_MISCELLANEOUS
	category = CAT_MISC

/datum/crafting_recipe/paperframes
	name = "Paper Frames"
	result = /obj/item/stack/sheet/paperframes/five
	time = 10
	reqs = list(/obj/item/stack/sheet/mineral/wood = 5, /obj/item/paper = 20)
	subcategory = CAT_MISCELLANEOUS
	category = CAT_MISC

/datum/crafting_recipe/naturalpaper
	name = "Hand-Pressed Paper"
	time = 30
	reqs = list(/datum/reagent/water = 50, /obj/item/stack/sheet/mineral/wood = 1)
	tools = list(/obj/item/hatchet)
	result = /obj/item/paper_bin/bundlenatural
	subcategory = CAT_MISCELLANEOUS
	category = CAT_MISC

/datum/crafting_recipe/mousetrap
	name = "Mouse Trap"
	result = /obj/item/assembly/mousetrap
	time = 10
	reqs = list(/obj/item/stack/sheet/cardboard = 1,
				/obj/item/stack/rods = 1)
	subcategory = CAT_MISCELLANEOUS
	category = CAT_MISC

/datum/crafting_recipe/pressureplate
	name = "Pressure Plate"
	result = /obj/item/pressure_plate
	time = 5
	reqs = list(/obj/item/stack/sheet/metal = 1,
				  /obj/item/stack/tile/plasteel = 1,
				  /obj/item/stack/cable_coil = 2,
				  /obj/item/assembly/igniter = 1)
	subcategory = CAT_MISCELLANEOUS
	category = CAT_MISC

/datum/crafting_recipe/compressedpowder
	name = "Compressed Blackpowder"
	result = /obj/item/stack/ore/blackpowder
	time = 5
	reqs = list(/datum/reagent/blackpowder = 50)
	subcategory = CAT_MISCELLANEOUS
	category = CAT_MISC

/datum/crafting_recipe/coconut_bong
	name = "Coconut Bong"
	result = /obj/item/bong/coconut
	reqs = list(/obj/item/stack/sheet/mineral/bamboo = 2,
				/obj/item/reagent_containers/food/snacks/grown/coconut = 1)
	time = 70
	subcategory = CAT_MISCELLANEOUS
	category = CAT_MISC

/datum/crafting_recipe/binoculars
	name = "Binoculars"
	result = /obj/item/binoculars
	time = 60
	reqs = list(/obj/item/stack/sheet/metal = 10,
				/obj/item/stack/sheet/glass = 5)
	tools = list(TOOL_SCREWDRIVER,TOOL_WORKBENCH)
	subcategory = CAT_MISCELLANEOUS
	category = CAT_MISC

/datum/crafting_recipe/experimental
	name = "Tinker"
	result = /obj/item/experimental
	time = 30
	reqs = list(/obj/item/crafting = 5)
	tools = list(TOOL_SCREWDRIVER, TOOL_MULTITOOL, TOOL_WORKBENCH)
	subcategory = CAT_MISCELLANEOUS
	category = CAT_MISC

/datum/crafting_recipe/experimentalinvent
	name = "Invent"
	result = /obj/item/invention
	time = 30
	reqs = list(/obj/item/crafting = 5)
	tools = list(TOOL_SCREWDRIVER, TOOL_MULTITOOL, TOOL_WORKBENCH)
	subcategory = CAT_MISCELLANEOUS
	category = CAT_MISC

//Unknown use

/datum/crafting_recipe/bronze_driver
	name = "Bronze Plated Screwdriver"
	tools = list(/obj/item/stock_parts/cell/high)
	result = /obj/item/screwdriver/bronze
	reqs = list(/obj/item/screwdriver = 1,
				/obj/item/stack/cable_coil = 10,
				/obj/item/stack/sheet/bronze = 1,
				/datum/reagent/water  = 15)
	time = 40
	subcategory = CAT_TOOL
	category = CAT_MISC
	always_availible = FALSE

/datum/crafting_recipe/bronze_welder
	name = "Bronze Plated Welding Tool"
	tools = list(/obj/item/stock_parts/cell/high)
	result = /obj/item/weldingtool/bronze
	reqs = list(/obj/item/weldingtool = 1,
				/obj/item/stack/cable_coil = 10,
				/obj/item/stack/sheet/bronze = 1,
				/datum/reagent/water  = 15)
	time = 40
	subcategory = CAT_TOOL
	category = CAT_MISC
	always_availible = FALSE

/datum/crafting_recipe/bronze_wirecutters
	name = "Bronze Plated Wirecutters"
	tools = list(/obj/item/stock_parts/cell/high)
	result = /obj/item/wirecutters/bronze
	reqs = list(/obj/item/wirecutters = 1,
				/obj/item/stack/cable_coil = 10,
				/obj/item/stack/sheet/bronze = 1,
				/datum/reagent/water  = 15)
	time = 40
	subcategory = CAT_TOOL
	category = CAT_MISC
	always_availible = FALSE

/datum/crafting_recipe/bronze_crowbar
	name = "Bronze Plated Crowbar"
	tools = list(/obj/item/stock_parts/cell/high)
	result = /obj/item/crowbar/bronze
	reqs = list(/obj/item/crowbar = 1,
				/obj/item/stack/cable_coil = 10,
				/obj/item/stack/sheet/bronze = 1,
				/datum/reagent/water  = 15)
	time = 40
	subcategory = CAT_TOOL
	category = CAT_MISC
	always_availible = FALSE

/datum/crafting_recipe/bronze_wrench
	name = "Bronze Plated Wrench"
	tools = list(/obj/item/stock_parts/cell/high)
	result = /obj/item/wrench/bronze
	reqs = list(/obj/item/wrench = 1,
				/obj/item/stack/cable_coil = 10,
				/obj/item/stack/sheet/bronze = 1,
				/datum/reagent/water  = 15)
	time = 40
	subcategory = CAT_TOOL
	category = CAT_MISC
	always_availible = FALSE

/*

/datum/crafting_recipe/plunger
	name = "Plunger"
	result = /obj/item/plunger
	time = 1
	reqs = list(/obj/item/stack/sheet/plastic = 1,
				/obj/item/stack/sheet/mineral/wood = 1)
	category = CAT_MISC
	subcategory = CAT_TOOL

/datum/crafting_recipe/rcl
	name = "Makeshift Rapid Cable Layer"
	result = /obj/item/rcl/ghetto
	time = 40
	tools = list(TOOL_WELDER, TOOL_SCREWDRIVER, TOOL_WRENCH)
	reqs = list(/obj/item/stack/sheet/metal = 15)
	subcategory = CAT_TOOL
	category = CAT_MISC

/datum/crafting_recipe/command_banner
	name = "Command Banner"
	result = /obj/item/banner/command/mundane
	time = 40
	reqs = list(/obj/item/stack/rods = 2,
				/obj/item/clothing/under/rank/captain/parade = 1)
	subcategory = CAT_FURNITURE
	category = CAT_MISC

/datum/crafting_recipe/engineering_banner
	name = "Engitopia Banner"
	result = /obj/item/banner/engineering/mundane
	time = 40
	reqs = list(/obj/item/stack/rods = 2,
				/obj/item/clothing/under/rank/engineering/engineer = 1)
	subcategory = CAT_FURNITURE
	category = CAT_MISC

/datum/crafting_recipe/cargo_banner
	name = "Cargonia Banner"
	result = /obj/item/banner/cargo/mundane
	time = 40
	reqs = list(/obj/item/stack/rods = 2,
				/obj/item/clothing/under/rank/cargo/tech = 1)
	subcategory = CAT_FURNITURE
	category = CAT_MISC

/datum/crafting_recipe/science_banner
	name = "Sciencia Banner"
	result = /obj/item/banner/science/mundane
	time = 40
	reqs = list(/obj/item/stack/rods = 2,
				/obj/item/clothing/under/rank/rnd/scientist = 1)
	subcategory = CAT_FURNITURE
	category = CAT_MISC

/datum/crafting_recipe/medical_banner
	name = "Meditopia Banner"
	result = /obj/item/banner/medical/mundane
	time = 40
	reqs = list(/obj/item/stack/rods = 2,
				/obj/item/clothing/under/rank/medical/doctor = 1)
	subcategory = CAT_FURNITURE
	category = CAT_MISC

/datum/crafting_recipe/security_banner
	name = "Securistan Banner"
	result = /obj/item/banner/security/mundane
	time = 40
	reqs = list(/obj/item/stack/rods = 2,
				/obj/item/clothing/under/rank/security/officer = 1)
	subcategory = CAT_FURNITURE
	category = CAT_MISC

/datum/crafting_recipe/goldenbox
	name = "Gold Plated Toolbox"
	result = /obj/item/storage/toolbox/gold_fake
	tools = list(/obj/item/stock_parts/cell/high)
	reqs = list(/obj/item/stack/sheet/cardboard = 1, //so we dont null items in crafting
				/obj/item/stack/cable_coil = 10,
				/obj/item/stack/sheet/mineral/gold = 1,
				/datum/reagent/water  = 15)
	time = 40
	subcategory = CAT_TOOL
	category = CAT_MISC
*/