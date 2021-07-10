/datum/job/ncr //do NOT use this for anything, it's just to store faction datums
	department_flag = NCR
	selection_color = "#ffeeaa"
	faction = "NCR"
	access = list(ACCESS_NCR)
	minimal_access = list(ACCESS_NCR)
	forbids = "The NCR forbids: Chem and drug use such as jet or alcohol while on duty. Execution of unarmed or otherwise subdued targets without authorisation."
	enforces = "The NCR expects: Obeying the lawful orders of superiors. Proper treatment of prisoners.  Good conduct within the Republic's laws. Wearing the uniform."
	objectivesList = list("Leadership recommends the following goal for this week: Establish an outpost at the radio tower","Leadership recommends the following goal for this week: Neutralize and capture dangerous criminals", "Leadership recommends the following goal for this week: Free slaves and establish good relations with unaligned individuals.")
	exp_type = EXP_TYPE_NCR

/datum/outfit/job/ncr/
	name = "NCRdatums"
	jobtype = /datum/job/ncr/
	backpack = /obj/item/storage/backpack/trekker
	satchel = /obj/item/storage/backpack/satchel/trekker
	ears = /obj/item/radio/headset/headset_ncr
	gloves = /obj/item/clothing/gloves/f13/leather/fingerless
	l_pocket = /obj/item/book/manual/ncr/jobguide

/datum/outfit/job/ncr/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/ncrsalvagedarmorconversion)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/ncrcombatarmor)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/ncrcombathelmet)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/ncrcombatarmormk2)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/ncrcombathelmetmk2)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/servicerifle)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/entrenching_tool)

/*
Colonel
*/
/datum/job/ncr/f13colonel
	title = "NCR Colonel"
	flag = F13COLONEL
	faction = "NCR"
	head_announce = list("Security")
	supervisors = "the general"
	req_admin_notify = 1

	total_positions = 0
	spawn_positions = 0

	outfit = /datum/outfit/job/ncr/f13colonel

/datum/outfit/job/ncr/f13colonel/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	ADD_TRAIT(H, TRAIT_PA_WEAR, src)

/datum/outfit/job/ncr/f13colonel
	name 		= "NCR Colonel"
	jobtype 	= /datum/job/ncr/f13colonel
	id 			= /obj/item/card/id/dogtag/ncrcolonel
	uniform		= /obj/item/clothing/under/f13/ncr/ncr_officer
	shoes 		= /obj/item/clothing/shoes/f13/military/ncr_officer_boots
	accessory 	= /obj/item/clothing/accessory/ncr
	head 		= /obj/item/clothing/head/helmet/f13/power_armor/t45d/sierra
	belt        = /obj/item/storage/belt/military/assault/ncr/crossbelt
	glasses 	= /obj/item/clothing/glasses/sunglasses/big
	suit_store  = /obj/item/gun/ballistic/automatic/marksman
	gloves      = /obj/item/clothing/gloves/f13/leather
	suit 		= /obj/item/clothing/suit/armor/f13/power_armor/t45d/sierra
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m45=3, \
		/obj/item/ammo_box/magazine/m556/rifle=2, \
		/obj/item/kitchen/knife/combat/survival=1, \
		/obj/item/gun/ballistic/automatic/pistol/m1911=1, \
		/obj/item/melee/classic_baton/telescopic=1, \
		/obj/item/storage/bag/money/small/ncr=1, \
		/obj/item/clothing/head/beret/ncr=1)

/*
Captain
*/
/datum/job/ncr/f13captain
	title = "NCR Captain"
	flag = F13CAPTAIN
	head_announce = list("Security")
	total_positions = 0
	spawn_positions = 0
	description = "You are the commanding officer of your company and direct superior to the Veteran Ranger and Lieutenant. Coordinating with your staff, you must ensure that the objectives of High Command are completed to the letter. Working closely with your subordinates on logistics, mission planning and special operations with the Rangers, you are here to establish a strong foothold for the NCR within the region."
	supervisors = "Colonel"
	req_admin_notify = 1
	outfit = /datum/outfit/job/ncr/f13captain

	loadout_options = list(
	/datum/outfit/loadout/captline, //R82, M29
	/datum/outfit/loadout/captscout, //Republic's Pride, M29
	/datum/outfit/loadout/captpistol //Grease Gun, Deagle
	)

/datum/outfit/job/ncr/f13captain/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	ADD_TRAIT(H, TRAIT_SELF_AWARE, src)

/datum/outfit/job/ncr/f13captain
	name = "NCR Captain"
	jobtype 	= /datum/job/ncr/f13captain
	id 			= /obj/item/card/id/dogtag/ncrcaptain
	uniform		= /obj/item/clothing/under/f13/ncr/ncr_officer
	shoes 		= /obj/item/clothing/shoes/f13/military/ncr_officer_boots
	accessory 	= /obj/item/clothing/accessory/ncr/CPT
	suit 		= /obj/item/clothing/suit/armor/f13/ncrarmor/captain
	glasses 	= /obj/item/clothing/glasses/sunglasses/big
	neck 		= /obj/item/storage/belt/holster
	ears = 		/obj/item/radio/headset/headset_ncr_com
	backpack_contents = list(
		/obj/item/kitchen/knife/combat=1, \
		/obj/item/melee/classic_baton/telescopic=1, \
		/obj/item/binoculars=1, \
		/obj/item/storage/bag/money/small/ncr=1, \
		/obj/item/clothing/mask/ncr_facewrap=1)

/datum/outfit/loadout/captline
	name = "Line Officer"
	head 		= /obj/item/clothing/head/beret/ncr
	shoes 		= /obj/item/clothing/shoes/f13/military/leather
	gloves 		= /obj/item/clothing/gloves/f13/leather
	belt 		= /obj/item/storage/belt/military/assault/ncr/crossbelt
	l_hand 		= /obj/item/gun/ballistic/automatic/service/r82
	backpack_contents = list(
	/obj/item/ammo_box/magazine/m556/rifle/assault=3,
	/obj/item/gun/ballistic/revolver/m29=1,
	/obj/item/ammo_box/m44=2)

/datum/outfit/loadout/captscout
	name = "Scout Officer"
	head = 		/obj/item/clothing/head/beret/ncr_scout
	belt = 		/obj/item/storage/belt/military/NCR_Bandolier
	l_hand = 	/obj/item/gun/ballistic/automatic/m1garand/republicspride
	backpack_contents = list(
	/obj/item/ammo_box/magazine/garand308=3,
	/obj/item/gun/ballistic/revolver/m29=1,
	/obj/item/ammo_box/m44=2)

/datum/outfit/loadout/captpistol
	name = "Pistoleer Officer"
	head =		/obj/item/clothing/head/f13/ncr_cap
	gloves =	/obj/item/clothing/gloves/f13/leather
	belt = 		/obj/item/storage/belt/military/assault/ncr/crossbelt
	l_hand =	/obj/item/gun/ballistic/automatic/greasegun
	backpack_contents = list(
	/obj/item/ammo_box/magazine/greasegun=3,
	/obj/item/gun/ballistic/automatic/pistol/deagle=1,
	/obj/item/ammo_box/magazine/m44=2
	)
/*
Lieutenant
*/

/datum/job/ncr/f13lieutenant
	title = "NCR Lieutenant"
	flag = F13LIEUTENANT
	total_positions = 1
	spawn_positions = 1
	req_admin_notify = 1
	description = "You are the direct superior to the Sergeant First Class and Enlisted, and under special circumstances, Rangers. You are the CO of Camp Miller. You plan patrols, training and missions, working in some cases with Rangers in accomplishing objectives otherwise beyond the capabilities of ordinary enlisted personnel."
	supervisors = "Captain and above"
	selection_color = "#ffeeaa"
	head_announce = list("Security")
	display_order = JOB_DISPLAY_ORDER_LIEUTENANT
	outfit = /datum/outfit/job/ncr/f13lieutenant

	loadout_options = list(
	/datum/outfit/loadout/ltline, //R82
	/datum/outfit/loadout/ltscout, //Republic's Pride
	/datum/outfit/loadout/ltpistol //Double Deagle
	)

/datum/outfit/job/ncr/f13lieutenant
	name = "NCR Lieutenant"
	jobtype	= /datum/job/ncr/f13lieutenant
	id			= /obj/item/card/id/dogtag/ncrlieutenant
	uniform		= /obj/item/clothing/under/f13/ncr/ncr_officer
	shoes 		= /obj/item/clothing/shoes/f13/military/ncr_officer_boots
	accessory 	= /obj/item/clothing/accessory/ncr/LT1
	head 		= /obj/item/clothing/head/beret/ncr
	neck 		= /obj/item/storage/belt/holster
	glasses 	= /obj/item/clothing/glasses/sunglasses/big
	gloves 		= /obj/item/clothing/gloves/f13/leather
	ears 		= /obj/item/radio/headset/headset_ncr_com
	suit 		= /obj/item/clothing/suit/armor/f13/ncrarmor/lieutenant
	belt		= /obj/item/storage/belt/military/assault/ncr/crossbelt
	backpack_contents = list(
		/obj/item/kitchen/knife/combat=1, \
		/obj/item/gun/ballistic/automatic/pistol/ninemil=1, \
		/obj/item/melee/classic_baton/telescopic=1, \
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1, \
		/obj/item/ammo_box/magazine/m9mm=3, \
		/obj/item/binoculars=1, \
		/obj/item/storage/bag/money/small/ncr=1, \
		/obj/item/storage/survivalkit_aid_adv=1)

/datum/outfit/job/ncr/f13lieutenant/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	ADD_TRAIT(H, TRAIT_SELF_AWARE, src)


/datum/outfit/loadout/ltline
	name = "Line Officer"
	l_hand 		= /obj/item/gun/ballistic/automatic/service/r82
	backpack_contents = list(
	/obj/item/ammo_box/magazine/m556/rifle/assault=3)

/datum/outfit/loadout/ltscout
	name = "Light Infantry Officer"
	l_hand = 	/obj/item/gun/ballistic/automatic/m1garand/republicspride
	backpack_contents = list(
	/obj/item/ammo_box/magazine/garand308=3)

/datum/outfit/loadout/ltpistol
	name = "Pistoleer Officer"
	backpack_contents =list(
	/obj/item/ammo_box/magazine/m44=4,
	/obj/item/gun/ballistic/automatic/pistol/deagle=2)

/*
Medical Officer
*/
/datum/job/ncr/f13medicalofficer
	title = "NCR Medical Officer"
	flag = F13MEDICALOFFICER
	total_positions = 1
	spawn_positions = 1
	description = "You are lead medical professional in Camp Miller, you do not have any command authority unless it is of medical nature. Your duties are to ensure your troopers are in good health and that medical supplies are stocked for troopers."
	supervisors = "Captain and above"
	selection_color = "#fff5cc"
	display_order = JOB_DISPLAY_ORDER_MEDICALOFFICER
	outfit = /datum/outfit/job/ncr/f13medicalofficer

/datum/outfit/job/ncr/f13medicalofficer
	name = "NCR Medical Officer"
	jobtype		= /datum/job/ncr/f13medicalofficer
	id			= /obj/item/card/id/dogtag/ncrlieutenant
	uniform		= /obj/item/clothing/under/f13/ncr/ncr_officer
	shoes 		= /obj/item/clothing/shoes/f13/military/ncr
	accessory 	= /obj/item/clothing/accessory/ncr/LT2
	head 		= /obj/item/clothing/head/beret/ncr
	neck 		= /obj/item/storage/belt/holster
	glasses 	= /obj/item/clothing/glasses/hud/health/f13
	gloves		= /obj/item/clothing/gloves/color/latex/nitrile
	ears 		= /obj/item/radio/headset/headset_ncr_com
	suit 		= /obj/item/clothing/suit/armor/f13/ncrarmor/labcoat
	belt		= /obj/item/storage/belt/military/assault/ncr/crossbelt
	r_hand 		= /obj/item/storage/backpack/duffelbag/med/surgery
	mask 		= /obj/item/clothing/mask/surgical
	backpack_contents = list(
		/obj/item/kitchen/knife/combat=1, \
		/obj/item/gun/ballistic/revolver/thatgun=1, \
		/obj/item/melee/classic_baton/telescopic=1, \
		/obj/item/storage/survivalkit_aid=2, \
		/obj/item/storage/survivalkit_aid_adv=1, \
		/obj/item/ammo_box/a556/stripper=3, \
		/obj/item/binoculars=1, \
		/obj/item/storage/bag/money/small/ncr=1, \
		/obj/item/storage/firstaid/regular=1)

/datum/outfit/job/ncr/f13medicalofficer/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_CHEMWHIZ, src)
	ADD_TRAIT(H, TRAIT_SURGERY_MID, src)

/*
Sergeant First Class
*/

/datum/job/ncr/f13firstsergeant
	title = "NCR Sergeant First Class"
	flag = F13FIRSTSERGEANT
	total_positions = 1
	spawn_positions = 1
	req_admin_notify = 1
	description = "You are the most senior NCO in Camp Miller. You act as an senior enlisted advisor to the Lieutenant as well as act as in the second in Command. You have the authority to recommend promotions and as well as managing the enlisted personnel"
	supervisors = "Lieutenant and above"
	selection_color = "#fff5cc"
	head_announce = list("Security")
	display_order = JOB_DISPLAY_ORDER_FIRSTSERGEANT
	outfit = /datum/outfit/job/ncr/f13firstsergeant

	loadout_options = list(
	/datum/outfit/loadout/sfcinfantry, //R82
	/datum/outfit/loadout/sfcsniper, //Sniper Rifle
	/datum/outfit/loadout/sfcgarand //Old Glory
	)

/datum/outfit/job/ncr/f13firstsergeant
	name = "NCR Sergeant First Class"
	jobtype = /datum/job/ncr/f13firstsergeant
	id 				= /obj/item/card/id/dogtag/ncrsergeant
	uniform		 	= /obj/item/clothing/under/f13/ncr
	shoes 			= /obj/item/clothing/shoes/f13/military/ncr
	accessory 		= /obj/item/clothing/accessory/ncr/FSGT
	glasses 		= /obj/item/clothing/glasses/sunglasses/big
	neck 			= /obj/item/storage/belt/holster
	ears 			= /obj/item/radio/headset/headset_ncr_com
	suit 			= /obj/item/clothing/suit/armor/f13/ncrarmor/mantle/reinforced
	head 			= /obj/item/clothing/head/f13/ncr
	belt			= /obj/item/storage/belt/military/assault/ncr
	backpack_contents = list(
		/obj/item/kitchen/knife/combat=1, \
		/obj/item/gun/ballistic/automatic/pistol/ninemil=1, \
		/obj/item/ammo_box/magazine/m9mm=3, \
		/obj/item/storage/survivalkit_aid=1, \
		/obj/item/storage/bag/money/small/ncr=1, \
		/obj/item/melee/classic_baton/telescopic=1, \
		/obj/item/binoculars=1)

/datum/outfit/loadout/sfcinfantry
	name = "Infantry"
	l_hand 		= /obj/item/gun/ballistic/automatic/service/r82
	backpack_contents = list(/obj/item/ammo_box/magazine/m556/rifle/assault=3)

/datum/outfit/loadout/sfcsniper
	name = "Sharpshooter"
	l_hand =	/obj/item/gun/ballistic/automatic/marksman/sniper
	backpack_contents = list(/obj/item/ammo_box/magazine/w308 = 3)

/datum/outfit/loadout/sfcgarand
	name = "Assault"
	l_hand = 	/obj/item/gun/ballistic/automatic/m1garand/ncr
	backpack_contents = list(/obj/item/ammo_box/magazine/garand308=3)

/*
Sergeant
*/

/datum/job/ncr/f13sergeant
	title = "NCR Sergeant"
	flag = F13SERGEANT
	total_positions = 2
	spawn_positions = 2
	description = "You are the direct superior to the enlisted troops, working with the chain of command you echo the orders of your superiors and ensure that the enlisted follow them to the letter. Additionally, you are responsible for the wellbeing of the troops and their ongoing training with the NCR."
	supervisors = "Sergeant First Class and above"
	selection_color = "#fff5cc"
	display_order = JOB_DISPLAY_ORDER_SERGEANT
	outfit = /datum/outfit/job/ncr/f13sergeant

	loadout_options = list(
	/datum/outfit/loadout/serreg,
	/datum/outfit/loadout/serlight,
	/datum/outfit/loadout/sercqb
	)

/datum/outfit/job/ncr/f13sergeant
	name = "NCR Sergeant"
	jobtype = /datum/job/ncr/f13sergeant
	id 				= /obj/item/card/id/dogtag/ncrsergeant
	uniform 		= /obj/item/clothing/under/f13/ncr
	shoes 			= /obj/item/clothing/shoes/f13/military/ncr
	accessory		= /obj/item/clothing/accessory/ncr/SGT
	head 			= /obj/item/clothing/head/f13/ncr
	glasses			= /obj/item/clothing/glasses/sunglasses/big
	neck 			= /obj/item/storage/belt/holster
	backpack_contents = list(
		/obj/item/kitchen/knife/combat=1, \
		/obj/item/gun/ballistic/automatic/pistol/ninemil=1, \
		/obj/item/storage/survivalkit_aid=1, \
		/obj/item/ammo_box/magazine/m9mm=3, \
		/obj/item/storage/bag/money/small/ncrofficers=1, \
		/obj/item/binoculars=1)

//Supply and base management
/datum/outfit/loadout/serreg
	name = "Infantry"
	l_hand = /obj/item/gun/ballistic/automatic/service
	suit = /obj/item/clothing/suit/armor/f13/ncrarmor/mantle/reinforced
	belt = /obj/item/storage/belt/military/assault/ncr
	backpack_contents = list(/obj/item/ammo_box/magazine/m556/rifle/assault=3)

//Scout successors
/datum/outfit/loadout/serlight
	name = "Sharpshooter"
	l_hand = /obj/item/gun/ballistic/automatic/service/carbine
	suit = /obj/item/clothing/suit/armor/f13/ncrarmor/scout/veteran
	belt = /obj/item/storage/belt/military/reconbandolier
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m556/rifle/assault=3,
		/obj/item/attachments/scope=1
	)

//Assault
/datum/outfit/loadout/sercqb
	name = "Assault"
	l_hand = /obj/item/gun/ballistic/shotgun/automatic/combat/auto5
	suit = /obj/item/clothing/suit/armor/f13/ncrarmor/mantle/reinforced
	belt = 	/obj/item/storage/belt/military/NCR_Bandolier
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/buck=2,
		/obj/item/ammo_box/shotgun/slug=1)

/*
Corporal
*/
/datum/job/ncr/f13corporal
	title = "NCR Corporal"
	flag = F13CORPORAL
	total_positions = 2
	spawn_positions = 2
	description = "You are a junior NCO. You are tasked with organizing the enlisted ranks into fireteams and answer directly to a Sergeant and/or the Sergeant First Class."
	supervisors = "Sergeant and above"
	selection_color = "#fff5cc"
	display_order = JOB_DISPLAY_ORDER_CORPORAL
	outfit = /datum/outfit/job/ncr/f13corporal

	loadout_options = list(
	/datum/outfit/loadout/corpreg,
	/datum/outfit/loadout/corplight,
	/datum/outfit/loadout/corpcqb
	)

/datum/outfit/job/ncr/f13corporal
	name = "NCR Corporal"
	jobtype 		= /datum/job/ncr/f13corporal
	uniform 		= /obj/item/clothing/under/f13/ncr
	shoes 			= /obj/item/clothing/shoes/f13/military/ncr
	id 				= /obj/item/card/id/dogtag/ncrtrooper
	neck 			= /obj/item/storage/belt/holster
	accessory 		= /obj/item/clothing/accessory/ncr/CPL
	head 			= /obj/item/clothing/head/f13/ncr
	glasses			= /obj/item/clothing/glasses/sunglasses
	suit_store		= /obj/item/gun/ballistic/automatic/service
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/pistol/ninemil=1, \
		/obj/item/ammo_box/magazine/m9mm=3, \
		/obj/item/kitchen/knife/combat=1, \
		/obj/item/storage/survivalkit_aid=1, \
		/obj/item/storage/bag/money/small/ncrenlisted=1
		)

//Supply and base management
/datum/outfit/loadout/corpreg
	name = "Infantry"
	l_hand = /obj/item/gun/ballistic/automatic/service
	suit = /obj/item/clothing/suit/armor/f13/ncrarmor/mantle
	belt = /obj/item/storage/belt/military/assault/ncr
	backpack_contents = list(/obj/item/ammo_box/magazine/m556/rifle/assault=3)

//Scout successors
/datum/outfit/loadout/corplight
	name = "Sharpshooter"
	l_hand = /obj/item/gun/ballistic/automatic/service/carbine
	suit = /obj/item/clothing/suit/armor/f13/ncrarmor/scout
	belt = /obj/item/storage/belt/military/reconbandolier
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m556/rifle/assault=3,
		/obj/item/attachments/scope=1)

//Assault
/datum/outfit/loadout/corpcqb
	name = "Assault"
	l_hand = /obj/item/gun/ballistic/shotgun/automatic/combat/auto5
	suit = /obj/item/clothing/suit/armor/f13/ncrarmor/mantle
	belt = /obj/item/storage/belt/military/NCR_Bandolier
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/buck=2,
		/obj/item/ammo_box/shotgun/slug=1)

/*
Combat Engineer
*/

/datum/job/ncr/f13combatmedic
	title = "NCR Combat Medic"
	flag = F13COMBATMEDIC
	total_positions = 1
	spawn_positions = 1
	description = "You are a veteran enlisted with a medical skill set. You work closely with your squad, taking orders from your officers. You have the authority to command troopers if there are none present."
	supervisors = "Corporals and above"
	selection_color = "#fff5cc"
	display_order = JOB_DISPLAY_ORDER_COMBATMEDIC
	outfit = /datum/outfit/job/ncr/f13combatmedic

/datum/outfit/job/ncr/f13combatmedic
	name = "NCR Combat Medic"
	jobtype 		= /datum/job/ncr/f13combatmedic
	uniform 		= /obj/item/clothing/under/f13/ncr
	shoes 			= /obj/item/clothing/shoes/f13/military/ncr
	id 				= /obj/item/card/id/dogtag/ncrtrooper
	neck 			= /obj/item/storage/belt/holster
	suit 			= /obj/item/clothing/suit/armor/f13/ncrarmor/mantle
	belt 			= /obj/item/storage/belt/military/assault/ncr
	head			= /obj/item/clothing/head/f13/ncr/steelpot_med
	gloves			= /obj/item/clothing/gloves/color/latex/nitrile
	accessory		= /obj/item/clothing/accessory/armband/med/ncr
	suit_store		= /obj/item/gun/ballistic/automatic/service
	mask 			= /obj/item/clothing/mask/surgical
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/pistol/ninemil=1, \
		/obj/item/ammo_box/magazine/m9mm=3, \
		/obj/item/kitchen/knife/combat=1, \
		/obj/item/storage/survivalkit_aid_adv=1, \
		/obj/item/storage/bag/money/small/ncrenlisted=1, \
		/obj/item/ammo_box/magazine/m556/rifle=3, \
		/obj/item/storage/firstaid/regular=1
		)

/datum/outfit/job/ncr/f13combatmedic/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_CHEMWHIZ, src)
	ADD_TRAIT(H, TRAIT_SURGERY_LOW, src)

/*
Combat Engineer
*/

/datum/job/ncr/f13combatengineer
	title = "NCR Combat Engineer"
	flag = F13COMBATENGINEER
	total_positions = 1
	spawn_positions = 1
	description = "You are a veteran enlisted with an engineering skill set. You work closely with your squad, taking orders from your officers. You have the authority to command troopers if there are none present."
	supervisors = "Corporals and above"
	selection_color = "#fff5cc"
	display_order = JOB_DISPLAY_ORDER_COMBATENGINEER
	outfit = /datum/outfit/job/ncr/f13combatengineer

/datum/outfit/job/ncr/f13combatengineer
	name = "NCR Combat Engineer"
	jobtype 		= /datum/job/ncr/f13combatengineer
	uniform 		= /obj/item/clothing/under/f13/ncr
	shoes 			= /obj/item/clothing/shoes/f13/military/ncr
	id 				= /obj/item/card/id/dogtag/ncrtrooper
	neck 			= /obj/item/storage/belt/holster
	head			= /obj/item/clothing/head/f13/ncr
	suit 			= /obj/item/clothing/suit/armor/f13/ncrarmor/mantle
	glasses			= /obj/item/clothing/glasses/welding
	belt 			= /obj/item/storage/belt/military/assault/ncr/engineer
	gloves			= /obj/item/clothing/gloves/color/yellow
	accessory		= /obj/item/clothing/accessory/armband/engine/ncr
	suit_store		= /obj/item/gun/ballistic/automatic/service
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/pistol/ninemil=1, \
		/obj/item/ammo_box/magazine/m9mm=3, \
		/obj/item/kitchen/knife/combat=1, \
		/obj/item/storage/survivalkit_aid=1, \
		/obj/item/storage/bag/money/small/ncrenlisted=1, \
		/obj/item/ammo_box/magazine/m556/rifle=3, \
		/obj/item/grenade/plastic=1, \
		/obj/item/stack/sheet/metal/fifty=1, \
		/obj/item/stack/sheet/glass/fifty=1
		)

/datum/outfit/job/ncr/f13combatengineer/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/R82)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/marksmancarbine)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/lmg)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/scoutcarbine)
	ADD_TRAIT(H, TRAIT_MASTER_GUNSMITH, src)

/*
Trooper
*/

/datum/job/ncr/f13trooper
	title = "NCR Trooper"
	flag = F13TROOPER
	total_positions = 6
	spawn_positions = 6
	description = "You are considered the backbone and workforce strength of the NCR Army. You answer to everyone above you in the chain of command, taking orders from your Sergeant directly and obeying all commands given by the Lieutenant."
	supervisors = "Corporals and above"
	selection_color = "#fff5cc"
	exp_requirements = 1200
	display_order = JOB_DISPLAY_ORDER_TROOPER
	outfit = /datum/outfit/job/ncr/f13trooper
	loadout_options = list(
	/datum/outfit/loadout/troopreg,
	/datum/outfit/loadout/trooplight,
	/datum/outfit/loadout/troopcqb
	)

/datum/outfit/job/ncr/f13trooper
	name = "NCR Trooper"
	jobtype = /datum/job/ncr/f13trooper
	id = 			/obj/item/card/id/dogtag/ncrtrooper
	uniform =  		/obj/item/clothing/under/f13/ncr
	shoes = 		/obj/item/clothing/shoes/f13/military/ncr
	accessory =     /obj/item/clothing/accessory/ncr/TPR
	head = 			/obj/item/clothing/head/f13/ncr
	neck 			= /obj/item/storage/belt/holster
	glasses = 		/obj/item/clothing/glasses/f13/biker
	backpack_contents = list(
		/obj/item/kitchen/knife/combat=1, \
		/obj/item/storage/survivalkit_aid=1, \
		/obj/item/storage/bag/money/small/ncrenlisted=1)

//Supply and base management
/datum/outfit/loadout/troopreg
	name = "Infantry"
	l_hand = /obj/item/gun/ballistic/automatic/service
	suit = /obj/item/clothing/suit/armor/f13/ncrarmor/reinforced
	belt = /obj/item/storage/belt/military/assault/ncr
	backpack_contents = list(/obj/item/ammo_box/magazine/m556/rifle=3)

//Scout successors
/datum/outfit/loadout/trooplight
	name = "Sharpshooter"
	l_hand = /obj/item/gun/ballistic/automatic/service/carbine
	suit = /obj/item/clothing/suit/armor/f13/ncrarmor/scout
	belt = /obj/item/storage/belt/military/reconbandolier
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m556/rifle=3,
		/obj/item/attachments/scope=1)

//Assault
/datum/outfit/loadout/troopcqb
	name = "Assault"
	l_hand = /obj/item/gun/ballistic/shotgun/automatic/combat/auto5
	suit = /obj/item/clothing/suit/armor/f13/ncrarmor/reinforced
	belt = /obj/item/storage/belt/military/NCR_Bandolier
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/buck=2,
		/obj/item/ammo_box/shotgun/slug=1)
/*
Rear Echelon
*/

/datum/job/ncr/f13rearechelon
	title = "NCR Rear Echelon"
	flag = F13REARECHELON
	total_positions = 4
	spawn_positions = 4
	description = "You are the support element sent to assist the Camp Miller garrison. You are essential specialized support staff assigned to help sustain the base via supply or your specialized skills. You are not allowed to leave base unless given an explicit order by the CO or the current acting CO."
	supervisors = "Corporals and above"
	selection_color = "#fff5cc"
	exp_requirements = 1200
	display_order = JOB_DISPLAY_ORDER_REAR_ECHELON
	outfit = /datum/outfit/job/ncr/f13rearechelon

	loadout_options = list(
	/datum/outfit/loadout/reartech,
	/datum/outfit/loadout/rearcorps
	)

/datum/outfit/job/ncr/f13rearechelon
	name = "NCR Rear Echelon"
	jobtype = /datum/job/ncr/f13rearechelon
	id = 			/obj/item/card/id/dogtag/ncrtrooper
	uniform =  		/obj/item/clothing/under/f13/ncr
	shoes = 		/obj/item/clothing/shoes/f13/military/ncr
	accessory =     /obj/item/clothing/accessory/ncr/TPR
	head = 			/obj/item/clothing/head/f13/ncr
	neck 			= /obj/item/storage/belt/holster
	suit = 			/obj/item/clothing/suit/armor/f13/ncrarmor
	suit_store = 	/obj/item/gun/ballistic/automatic/m1carbine
	glasses = 		null
	belt = 			/obj/item/storage/belt/military/NCR_Bandolier
	backpack_contents = list(
		/obj/item/kitchen/knife/combat=1, \
		/obj/item/storage/survivalkit_aid=1, \
		/obj/item/storage/bag/money/small/ncrenlisted=1, \
		/obj/item/ammo_box/magazine/m10mm_adv/simple=3
		)

//Technical repairs and engineering
/datum/outfit/loadout/reartech
	name = "Technician"
	belt = /obj/item/storage/belt/utility/full
	gloves = /obj/item/clothing/gloves/color/yellow
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/pistol/ninemil=1, \
		/obj/item/ammo_box/magazine/m9mm=3 )

//Medical
/datum/outfit/loadout/rearcorps
	name = "Corpsman"
	belt = /obj/item/storage/belt/medical
	gloves = /obj/item/clothing/gloves/color/latex/nitrile
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/pistol/ninemil=1, \
		/obj/item/ammo_box/magazine/m9mm=3, \
		/obj/item/book/granter/trait/chemistry = 1)

/datum/job/ncr/f13ncrrecruit
	title = "NCR Recruit"
	flag = F13NCRRECRUIT
	total_positions = 4
	spawn_positions = 4
	description = "You are a detachment of partially trained troops sent to bolster the Yuma Garrison. You have the same duties as a Trooper but act as a reserve force. Follow are legal and valid orders from everyone that outranks you."
	supervisors = "Troopers and above"
	selection_color = "#fff5cc"
	display_order = JOB_DISPLAY_ORDER_NCR_RECRUIT
	outfit = /datum/outfit/job/ncr/f13ncrrecruit

/datum/outfit/job/ncr/f13ncrrecruit
	name = "NCR Recruit"
	jobtype = /datum/job/ncr/f13ncrrecruit
	id = 			/obj/item/card/id/dogtag/ncrtrooper
	uniform =  		/obj/item/clothing/under/f13/ncr
	shoes = 		/obj/item/clothing/shoes/f13/military/ncr
	accessory =     /obj/item/clothing/accessory/ncr/REC
	head = 			/obj/item/clothing/head/f13/ncr
	suit = 			/obj/item/clothing/suit/armor/f13/ncrarmor
	suit_store = 	/obj/item/gun/ballistic/automatic/varmint
	glasses = 		null
	belt = 			/obj/item/storage/belt/military/NCR_Bandolier
	backpack_contents = list(
		/obj/item/kitchen/knife/combat=1, \
		/obj/item/storage/survivalkit_aid=1, \
		/obj/item/storage/bag/money/small/ncrenlisted=1, \
		/obj/item/ammo_box/magazine/m556/rifle=1
		)

/*
Off-Duty
*/
/datum/job/ncr/f13ncroffduty
	title = "NCR Off-Duty"
	flag = F13NCROFFDUTY
	total_positions = 8
	spawn_positions = 8
	description = "You are off-duty NCR-A personnel in the Yuma Region. Despite being out of uniform and off-duty you are still expected to follow NCR COMJ and represent the uniform properly. Failure to abide by this will result in disciplinary action."
	supervisors = "All NCOs and COs"
	selection_color = "#fff5cc"
	exp_requirements = 2100
	display_order = JOB_DISPLAY_ORDER_NCR_OFF_DUTY
	outfit = /datum/outfit/job/ncr/f13ncroffduty

/datum/outfit/job/ncr/f13ncroffduty
	name = "NCR Off-Duty"
	jobtype = /datum/job/ncr/f13ncroffduty
	id = 			/obj/item/card/id/dogtag/ncrtrooper
	uniform =  		/obj/item/clothing/under/f13/ncr
	shoes =			/obj/item/clothing/shoes/f13/military/ncr
	backpack_contents = list(
		/obj/item/kitchen/knife/combat=1, \
		/obj/item/storage/survivalkit_aid=1, \
		/obj/item/storage/bag/money/small/ncrenlisted=1, \
		/obj/item/clothing/mask/ncr_facewrap=1)

/*
Veteran Ranger
*/

/datum/job/ncr/f13vetranger
	title = "NCR Veteran Ranger"
	flag = F13VETRANGER
	total_positions = 1
	spawn_positions = 1
	description = "You answer directly to the Captain, working either independently or in a team to complete your mission objectives however required, operating either alone, in a squad or with the NCR Army. Your primary mission is to improve general opinion of the Republic and to neutralize slavers and raiders operating in the area."
	supervisors = "Captain and above"
	selection_color = "#ffeeaa"
	display_order = JOB_DISPLAY_ORDER_VETRANGE
	outfit = /datum/outfit/job/ncr/f13vetranger

	loadout_options = list(
	/datum/outfit/loadout/vrclassic, //AMR and Sequoia,
	/datum/outfit/loadout/vrlite, //Rangemaster and Sequoia,
	/datum/outfit/loadout/vrbrush, //Scoped Brushgun and Sequoia
	/datum/outfit/loadout/vrassault
	)

/datum/outfit/job/ncr/f13vetranger/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	ADD_TRAIT(H, TRAIT_IRONFIST, src)
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_LIGHT_STEP, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	var/datum/martial_art/rangertakedown/RT = new
	RT.teach(H)

/datum/outfit/job/ncr/f13vetranger
	name = "NCR Veteran Ranger"
	jobtype = /datum/job/ncr/f13vetranger
	id = 			/obj/item/card/id/dogtag/ncrvetranger
	uniform =  		/obj/item/clothing/under/f13/ranger/vet
	suit = 			/obj/item/clothing/suit/armor/f13/rangercombat
	belt =			/obj/item/storage/belt/military/assault/ncr
	head = 			/obj/item/clothing/head/helmet/f13/ncr/rangercombat
	gloves =		/obj/item/clothing/gloves/rifleman
	shoes =			/obj/item/clothing/shoes/f13/military/leather
	glasses = 		/obj/item/clothing/glasses/sunglasses
	ears = 			/obj/item/radio/headset/headset_ranger
	r_pocket = 		/obj/item/binoculars
	backpack_contents = list(
		/obj/item/kitchen/knife/bowie=1, \
		/obj/item/storage/survivalkit_aid_adv=1, \
		/obj/item/storage/bag/money/small/ncr=1)

/datum/outfit/loadout/vrclassic
	name = "Classic Veteran Ranger"
	suit_store = /obj/item/gun/ballistic/shotgun/antimateriel
	backpack_contents = list(
		/obj/item/ammo_box/a50MG=3)

/datum/outfit/loadout/vrlite
	name = "Light Veteran Ranger"
	suit_store = /obj/item/gun/ballistic/automatic/rangemaster
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m762/ext=2)

/datum/outfit/loadout/vrbrush
	name = "Brush Veteran Ranger"
	suit_store = /obj/item/gun/ballistic/shotgun/automatic/hunting/brush
	backpack_contents = list(
		/obj/item/ammo_box/tube/c4570=3)

/datum/outfit/loadout/vrassault
	name = "Assault Veteran Ranger"
	suit_store = /obj/item/gun/ballistic/automatic/service/r82
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m556/rifle/assault=3)

//NCR Ranger
/datum/job/ncr/f13ranger
	title = "NCR Ranger"
	flag = F13RANGER
	total_positions = 4
	spawn_positions = 5
	description = "As an NCR Ranger, you are the premier special forces unit of the NCR. You are the forward observations and support the Army in it's campaigns, as well as continuing the tradition of stopping slavery in it's tracks."
	supervisors = "Veteran Ranger"
	selection_color = "#fff5cc"
	display_order = JOB_DISPLAY_ORDER_RANGER
	outfit = /datum/outfit/job/ncr/f13ranger

	loadout_options = list(
	/datum/outfit/loadout/rangerrecon,
	/datum/outfit/loadout/rangertrail,
	/datum/outfit/loadout/rangerpatrol,
	/datum/outfit/loadout/rangerpatrolcqb,
	/datum/outfit/loadout/rangermedic,
	/datum/outfit/loadout/rangerengineer
	)

/datum/outfit/job/ncr/f13ranger/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_LIGHT_STEP, src)
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	var/datum/martial_art/rangertakedown/RT = new
	RT.teach(H)

/datum/outfit/job/ncr/f13ranger
	name = "NCR Ranger"
	jobtype = /datum/job/ncr/f13ranger
	id = 			/obj/item/card/id/dogtag/ncrranger
	uniform = 		/obj/item/clothing/under/f13/ranger/trail
	head =			/obj/item/clothing/head/f13/trailranger
	shoes =			/obj/item/clothing/shoes/f13/military/leather
	glasses = 		/obj/item/clothing/glasses/sunglasses
	ears = 			/obj/item/radio/headset/headset_ranger
	r_pocket = 		/obj/item/binoculars
	neck = 			/obj/item/storage/belt/holster
	backpack_contents = list(
		/obj/item/restraints/handcuffs=1, \
		/obj/item/kitchen/knife/bowie=1, \
		/obj/item/storage/bag/money/small/ncr = 1,
		/obj/item/clothing/mask/gas/ranger = 1)

/datum/outfit/loadout/rangerrecon
	name = "Recon Ranger"
	suit =	/obj/item/clothing/suit/toggle/armor/f13/rangerrecon
	belt =	/obj/item/storage/belt/military/reconbandolier
	head = /obj/item/clothing/head/helmet/f13/combat/swat
	suit_store = /obj/item/gun/ballistic/automatic/marksman/sniper
	gloves = /obj/item/clothing/gloves/patrol
	backpack_contents = list(
		/obj/item/ammo_box/magazine/w308 = 3,
		/obj/item/storage/survivalkit_aid=1
	)

/datum/outfit/loadout/rangertrail
	name = "Trail Ranger"
	suit =	/obj/item/clothing/suit/armor/f13/trailranger
	belt =	/obj/item/storage/belt/military/NCR_Bandolier
	suit_store = /obj/item/gun/ballistic/automatic/m1garand
	gloves = /obj/item/clothing/gloves/patrol
	backpack_contents = list(
		/obj/item/ammo_box/magazine/garand308=3,
		/obj/item/melee/classic_baton/telescopic=1,
		/obj/item/storage/survivalkit_aid=1,
		/obj/item/attachments/scope=1
	)

/datum/outfit/loadout/rangerpatrol
	name = "Patrol Ranger"
	suit = /obj/item/clothing/suit/armor/f13/combat/ncr_patrol
	head = /obj/item/clothing/head/f13/ranger
	uniform = /obj/item/clothing/under/f13/ranger/patrol
	belt =	/obj/item/storage/belt/military/assault/ncr
	suit_store = /obj/item/gun/ballistic/automatic/marksman
	gloves = /obj/item/clothing/gloves/patrol
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m556/rifle/assault = 3,
		/obj/item/clothing/head/helmet/f13/combat/ncr_patrol = 1,
		/obj/item/storage/survivalkit_aid = 1
	)

/datum/outfit/loadout/rangerpatrolcqb
	name = "CQB Patrol Ranger"
	suit = /obj/item/clothing/suit/armor/f13/combat/ncr_patrol
	head = /obj/item/clothing/head/f13/ranger
	uniform = /obj/item/clothing/under/f13/ranger/patrol
	belt =	/obj/item/storage/belt/military/assault/ncr
	suit_store = /obj/item/gun/ballistic/shotgun/automatic/combat/auto5
	gloves = /obj/item/clothing/gloves/patrol
	backpack_contents = list(
		/obj/item/storage/fancy/ammobox/lethalshot = 2,
		/obj/item/storage/fancy/ammobox/slugshot = 1,
		/obj/item/clothing/head/helmet/f13/combat/ncr_patrol = 1,
		/obj/item/storage/survivalkit_aid = 1
	)

/datum/outfit/loadout/rangermedic
	name = "Medic Ranger"
	suit = /obj/item/clothing/suit/armor/f13/combat/ncr_patrol
	head = /obj/item/clothing/head/f13/ranger
	uniform = /obj/item/clothing/under/f13/ranger/patrol
	belt =	/obj/item/storage/belt/military/assault/ncr
	suit_store = /obj/item/gun/ballistic/automatic/m1carbine/compact
	gloves = /obj/item/clothing/gloves/patrol
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m10mm_adv/simple = 3,
		/obj/item/storage/firstaid/ancient = 1,
		/obj/item/clothing/accessory/armband/med/ncr = 1,
		/obj/item/clothing/head/helmet/f13/combat/ncr_patrol = 1,
		/obj/item/storage/survivalkit_aid_adv = 1,
		/obj/item/book/granter/trait/chemistry = 1
	)

/datum/outfit/loadout/rangerengineer
	name = "Engineer Ranger"
	suit = /obj/item/clothing/suit/armor/f13/combat/ncr_patrol
	head = /obj/item/clothing/head/f13/ranger
	uniform = /obj/item/clothing/under/f13/ranger/patrol
	belt =	/obj/item/storage/belt/military/assault/ncr/engineer
	suit_store = /obj/item/gun/ballistic/automatic/m1carbine/compact
	gloves = /obj/item/clothing/gloves/patrol/insulated
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m10mm_adv/simple = 3,
		/obj/item/storage/survivalkit_aid = 1,
		/obj/item/clothing/accessory/armband/engine/ncr = 1,
		/obj/item/clothing/head/helmet/f13/combat/ncr_patrol = 1,
		/obj/item/grenade/plastic=1,
		/obj/item/stack/sheet/metal/fifty=1,
		/obj/item/stack/sheet/glass/fifty=1
	)
