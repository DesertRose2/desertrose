/datum/job/ncr //do NOT use this for anything, it's just to store faction datums
	selection_color = "#ffeeaa"
	faction = "NCR"
	exp_type = EXP_TYPE_NCR


	access = list(ACCESS_NCR)
	minimal_access = list(ACCESS_NCR)
	forbids = "The NCR forbids: Chem and drug use such as jet or alcohol while on duty. Execution of unarmed or otherwise subdued targets without authorisation."
	enforces = "The NCR expects: Obeying the lawful orders of superiors. Proper treatment of prisoners.  Good conduct within the Republic's laws. Wearing the uniform."
	objectivesList = list("High command recommends the following goal for this week: Establish an outpost at the radio tower","High command recommends the following goal for this week: Scout the region for raider activity and detain any individuals breaking NCR law in our territory","High command recommends the following goal for this week: Establish good relations with unaligned individuals and improve the diplomatic standing of the NCR","High command recommends the following goal for this week: Gather funds from the wasteland by providing a service and taxing people")

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
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/entrenching_tool)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/explosive/smoke)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/ncrgate)


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//LM and LC Only Roles

/*
Colonel
*/
/datum/job/ncr/f13colonel
	title = "NCR Colonel"
	faction = "NCR"
	head_announce = list("Security")
	supervisors = "the general"

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
	neck		= /obj/item/storage/belt/holster/ncr_officer
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
	head_announce = list("Security")
	total_positions = 0
	spawn_positions = 0
	description = "You are the commanding officer of your company and direct superior to the Veteran Ranger and Lieutenant. Coordinating with your staff, you must ensure that the objectives of High Command are completed to the letter. Working closely with your subordinates on logistics, mission planning and special operations with the Rangers, you are here to establish a strong foothold for the NCR within the region."
	supervisors = "Colonel"
	outfit = /datum/outfit/job/ncr/f13captain

	loadout_options = list(
	/datum/outfit/loadout/captline, //NCR R91
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
	neck 		= /obj/item/storage/belt/holster/ncr_officer
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
	l_hand 		= /obj/item/gun/ballistic/automatic/assault_rifle/ncr
	backpack_contents = list(
	/obj/item/ammo_box/magazine/m556/rifle/assault=3,
	/obj/item/gun/ballistic/revolver/m29=1,
	/obj/item/ammo_box/m44=2)

/datum/outfit/loadout/captscout
	name = "Scout Officer"
	belt = 		/obj/item/storage/belt/military/NCR_Bandolier
	l_hand = 	/obj/item/gun/ballistic/automatic/m1garand/republicspride
	backpack_contents = list(
	/obj/item/ammo_box/magazine/garand308=3,
	/obj/item/gun/ballistic/revolver/m29=1,
	/obj/item/ammo_box/m44=2)

/datum/outfit/loadout/captpistol
	name = "Pistoleer Officer"
	gloves =	/obj/item/clothing/gloves/f13/leather
	belt = 		/obj/item/storage/belt/military/assault/ncr/crossbelt
	l_hand =	/obj/item/gun/ballistic/automatic/smg/greasegun
	backpack_contents = list(
	/obj/item/ammo_box/magazine/greasegun=3,
	/obj/item/gun/ballistic/automatic/pistol/deagle=1,
	/obj/item/ammo_box/magazine/m44=2
	)
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*
Commanding Officer (Ranges from Lieutenant to Captain)
*/

/datum/job/ncr/f13lieutenant //Keeping the same path because I'm not breaking whitelists for a name change.
	title = "NCR Commanding Officer"
	total_positions = 1
	spawn_positions = 1
	description = "You are the direct superior to the Sergeant First Class and Enlisted, and under special circumstances, Rangers. You are the CO of Camp Miller. You plan patrols, training and missions, working in some cases with Rangers in accomplishing objectives otherwise beyond the capabilities of ordinary enlisted personnel."
	supervisors = "High Command"
	selection_color = "#ffeeaa"
	head_announce = list("Security")
	display_order = JOB_DISPLAY_ORDER_LIEUTENANT
	outfit = /datum/outfit/job/ncr/f13lieutenant
	req_admin_notify = 1

	loadout_options = list(
	/datum/outfit/loadout/ltline,	//NCR R91
	/datum/outfit/loadout/ltscout,	//Republic's Pride
	/datum/outfit/loadout/ltpistol	//.223 Pistol
	)

/datum/outfit/job/ncr/f13lieutenant
	name = "NCR Commanding Officer"
	jobtype	= /datum/job/ncr/f13lieutenant
	id			= /obj/item/card/id/dogtag/ncrlieutenant
	uniform		= /obj/item/clothing/under/f13/ncr/ncr_officer
	shoes 		= /obj/item/clothing/shoes/f13/military/ncr_officer_boots
	accessory 	= /obj/item/clothing/accessory/ncr/LT1
	head 		= /obj/item/clothing/head/beret/ncr_lt
	neck 		= /obj/item/storage/belt/holster/commander10mm
	glasses 	= /obj/item/clothing/glasses/sunglasses/big
	gloves 		= /obj/item/clothing/gloves/f13/leather
	ears 		= /obj/item/radio/headset/headset_ncr_com
	suit 		= /obj/item/clothing/suit/armor/f13/ncrarmor/lieutenant
	belt		= /obj/item/storage/belt/military/assault/ncr/crossbelt
	l_pocket 	= /obj/item/flashlight/seclite
	backpack_contents = list(
		/obj/item/storage/survivalkit_aid_adv=1, \
		/obj/item/storage/bag/money/small/ncr=1,\
		/obj/item/kitchen/knife/combat=1, \
		/obj/item/melee/classic_baton/telescopic=1, \
		/obj/item/reagent_containers/hypospray/medipen/f13/stimpak=1, \
		/obj/item/binoculars=1
		)
/datum/outfit/job/ncr/f13lieutenant/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)


/datum/outfit/loadout/ltline
	name = "Line Officer"
	l_hand = /obj/item/gun/ballistic/automatic/assault_rifle/ncr
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m556/rifle/assault=3,
		/obj/item/kitchen/knife/combat/bayonet=1)

/datum/outfit/loadout/ltscout
	name = "Light Infantry Officer"
	l_hand = /obj/item/gun/ballistic/automatic/m1garand/republicspride
	backpack_contents = list(/obj/item/ammo_box/magazine/garand308=3)

/datum/outfit/loadout/ltpistol
	name = "Pistoleer Officer"
	l_hand = /obj/item/gun/ballistic/revolver/thatgun
	backpack_contents =list(/obj/item/ammo_box/magazine/m556/rifle/assault=1)

/*
OSI Officer, renamed from Medical Officer
*/
/datum/job/ncr/f13medicalofficer
	title = "OSI Representative"
	total_positions = 1
	spawn_positions = 1
	description = "You are a representative of the OSI in Camp Miller as part of a joint operation with the army. You do not have any command authority unless it relates to supply, science, or medical purpose. You are not a soldier, though you have been granted clearance and pins granting you roughly officer rank. Your duties are to ensure supplies are in order, that the troopers are in good health and that every member of the supply branch are fulfilling their obligations."
	supervisors = "Acting Army CO and High Command"
	selection_color = "#fff5cc"
	display_order = JOB_DISPLAY_ORDER_MEDICALOFFICER
	outfit = /datum/outfit/job/ncr/f13medicalofficer

	loadout_options = list(
	/datum/outfit/loadout/osimed,	//Old Medical Officer
	/datum/outfit/loadout/osifarm,	//Farming Mojave Kit
	/datum/outfit/loadout/ositech	//Engie Analyst
	)

/datum/outfit/job/ncr/f13medicalofficer
	name = "OSI Representative"
	jobtype		= /datum/job/ncr/f13medicalofficer
	id			= /obj/item/card/id/dogtag/ncrlieutenant
	uniform		= /obj/item/clothing/under/lawyer/blacksuit
	shoes 		= /obj/item/clothing/shoes/f13/military/ncr_officer_boots
	accessory 	= /obj/item/clothing/accessory/ncr/LT2
	head 		= /obj/item/clothing/head/beret/medical
	neck 		= /obj/item/storage/belt/holster/med_lt
	gloves		= /obj/item/clothing/gloves/color/latex/nitrile
	ears 		= /obj/item/radio/headset/headset_ncr_com
	suit 		= /obj/item/clothing/suit/armor/f13/ncrarmor/labcoat
	belt		= /obj/item/storage/belt/military/assault/ncr
	l_pocket	= /obj/item/flashlight/seclite
	backpack_contents = list(
		/obj/item/storage/survivalkit_aid=2, \
		/obj/item/storage/survivalkit_aid_adv=1, \
		/obj/item/storage/bag/money/small/ncr=1, \
		/obj/item/kitchen/knife/combat=1, \
		/obj/item/melee/classic_baton/telescopic=1, \
		/obj/item/binoculars=1
	)

/datum/outfit/job/ncr/f13medicalofficer/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_CHEMWHIZ, src)
	ADD_TRAIT(H, TRAIT_SURGERY_LOW, src)

/datum/outfit/loadout/osimed
	name = "Medical Professional"
	backpack_contents = list(
		/obj/item/clothing/mask/surgical=1,
		/obj/item/storage/backpack/duffelbag/med/surgery=1,
		/obj/item/book/granter/trait/midsurgery=1,
		/obj/item/storage/firstaid/regular=1,
		/obj/item/clothing/glasses/hud/health/f13=1)

/datum/outfit/loadout/osifarm
	name = "Mojave Sharecropper Kit"
	backpack_contents = list(
		/obj/item/seeds/watermelon=2,
		/obj/item/seeds/fungus=2,
		/obj/item/seeds/ambrosia=2,
		/obj/item/seeds/punga=2,
		/obj/item/seeds/corn=2,
		/obj/item/seeds/feracactus=2,
		/obj/item/circuitboard/machine/hydroponics=1)

/datum/outfit/loadout/ositech
	name = "Tech Analyst"
	backpack_contents =list(
		/obj/item/stock_parts/manipulator/pico=2,
		/obj/item/stock_parts/matter_bin/adv=2,
		/obj/item/screwdriver=1,
		/obj/item/construction/rcd/loaded/upgraded=1,
		/obj/item/rcd_ammo/large=1,
		/obj/item/storage/part_replacer=1,
		/obj/item/clothing/glasses/meson/engine/prescription=1)

/*
First Sergeant
*/

/datum/job/ncr/f13firstsergeant
	title = "NCR First Sergeant"
	total_positions = 1
	spawn_positions = 1
	description = "You are the most senior NCO in Camp Miller. You act as an senior enlisted advisor to the Commanding Officer as well as act as in the second in Command. You have the authority to recommend promotions and as well as managing the enlisted personnel"
	supervisors = "Lieutenant and above"
	selection_color = "#fff5cc"
	head_announce = list("Security")
	display_order = JOB_DISPLAY_ORDER_FIRSTSERGEANT
	outfit = /datum/outfit/job/ncr/f13firstsergeant
	req_admin_notify = 1

	loadout_options = list(
	/datum/outfit/loadout/sfcinfantry, 	//NCR R91
	/datum/outfit/loadout/sfcsniper,	//Sniper Rifle
	/datum/outfit/loadout/sfcgarand 	//Old Glory
	)

/datum/outfit/job/ncr/f13firstsergeant
	name = "NCR First Sergeant"
	jobtype			= /datum/job/ncr/f13firstsergeant
	id 				= /obj/item/card/id/dogtag/ncrsergeant
	uniform		 	= /obj/item/clothing/under/f13/ncr
	shoes 			= /obj/item/clothing/shoes/f13/military/ncr
	accessory 		= /obj/item/clothing/accessory/ncr/FSGT
	glasses 		= /obj/item/clothing/glasses/sunglasses/big
	neck 			= /obj/item/storage/belt/holster/ncr_officer
	ears 			= /obj/item/radio/headset/headset_ncr_com
	suit 			= /obj/item/clothing/suit/armor/f13/ncrarmor/mantle/reinforced
	head 			= /obj/item/clothing/head/f13/ncr/goggles
	belt			= /obj/item/storage/belt/military/assault/ncr
	l_pocket 		= /obj/item/flashlight/seclite
	backpack_contents = list(
		/obj/item/storage/survivalkit_aid=1, \
		/obj/item/storage/bag/money/small/ncr=1, \
		/obj/item/kitchen/knife/combat=1, \
		/obj/item/melee/classic_baton/telescopic=1, \
		/obj/item/binoculars=1)

/datum/outfit/loadout/sfcinfantry
	name = "Infantry"
	l_hand 		= /obj/item/gun/ballistic/automatic/assault_rifle/ncr
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m556/rifle/assault=3,
		/obj/item/kitchen/knife/combat/bayonet=1)

/datum/outfit/loadout/sfcsniper
	name = "Sharpshooter"
	l_hand =	/obj/item/gun/ballistic/automatic/marksman/sniper
	backpack_contents = list(/obj/item/ammo_box/magazine/w308 = 3)

/datum/outfit/loadout/sfcgarand
	name = "Assault"
	l_hand = 	/obj/item/gun/ballistic/automatic/m1garand/ncr
	backpack_contents = list(
		/obj/item/ammo_box/magazine/garand308=3,
		/obj/item/attachments/scope=1,
		/obj/item/kitchen/knife/combat/bayonet=1)

/datum/outfit/job/ncr/f13firstsergeant/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)
/*
Sergeant
*/

/datum/job/ncr/f13sergeant
	title = "NCR Sergeant"
	total_positions = 2
	spawn_positions = 2
	description = "You are the direct superior to the enlisted troops, working with the chain of command you echo the orders of your superiors and ensure that the enlisted follow them to the letter. Additionally, you are responsible for the wellbeing of the troops and their ongoing training with the NCR."
	supervisors = "Sergeant First Class and above"
	selection_color = "#fff5cc"
	display_order = JOB_DISPLAY_ORDER_SERGEANT
	outfit = /datum/outfit/job/ncr/f13sergeant
	exp_requirements = 3000
	exp_type = EXP_TYPE_NCRNCO

	loadout_options = list(
	/datum/outfit/loadout/serreg,	//Service
	/datum/outfit/loadout/serlight,	//M1 Carbine
	/datum/outfit/loadout/sercqb,	//Lever
	/datum/outfit/loadout/sersct	//Hunting Rifle
	)

/datum/outfit/job/ncr/f13sergeant
	name = "NCR Sergeant"
	jobtype = /datum/job/ncr/f13sergeant
	id 				= /obj/item/card/id/dogtag/ncrsergeant
	suit			= /obj/item/clothing/suit/armor/f13/ncrarmor/mantle/reinforced
	uniform 		= /obj/item/clothing/under/f13/ncr
	shoes 			= /obj/item/clothing/shoes/f13/military/ncr
	accessory		= /obj/item/clothing/accessory/ncr/SGT
	head 			= /obj/item/clothing/head/f13/ncr/goggles
	glasses			= /obj/item/clothing/glasses/sunglasses/big
	neck 			= /obj/item/storage/belt/holster/ncr
	l_pocket 		= /obj/item/flashlight
	backpack_contents = list(
		/obj/item/storage/survivalkit_aid=1, \
		/obj/item/storage/bag/money/small/ncrofficers=1, \
		/obj/item/kitchen/knife/combat=1, \
		/obj/item/binoculars=1)

//Base Infantry
/datum/outfit/loadout/serreg
	name = "Infantry"
	l_hand = /obj/item/gun/ballistic/automatic/service
	belt = /obj/item/storage/belt/military/assault/ncr
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m556/rifle/assault=3,
		/obj/item/kitchen/knife/combat/bayonet=1)

//Base Infantry with M1 Carbine
/datum/outfit/loadout/serlight
	name = "Sharpshooter"
	l_hand = /obj/item/gun/ballistic/automatic/m1carbine/ncr
	belt = /obj/item/storage/belt/military/reconbandolier
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m10mm_adv/ext=3,
		/obj/item/attachments/scope=1
	)

//Scout with a Lever Action Shotgun
/datum/outfit/loadout/sercqb
	name = "Assault"
	l_hand = /obj/item/gun/ballistic/shotgun/lever
	belt = 	/obj/item/storage/belt/military/NCR_Bandolier
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/buck=2,
		/obj/item/ammo_box/shotgun/slug=1)

//Scout with a Hunting Rifle
/datum/outfit/loadout/sersct
	name = "Marksman"
	l_hand = /obj/item/gun/ballistic/rifle/remington
	belt = /obj/item/storage/belt/military/NCR_Bandolier
	backpack_contents = list(
		/obj/item/ammo_box/a762/doublestacked=3,
		/obj/item/attachments/scope=1
		)

/datum/outfit/job/ncr/f13sergeant/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)

/*
Corporal
*/
/datum/job/ncr/f13corporal
	title = "NCR Corporal"
	total_positions = 2
	spawn_positions = 2
	description = "You are a junior NCO. You are tasked with organizing the enlisted ranks into fireteams and answer directly to a Sergeant and/or the Sergeant First Class."
	supervisors = "Sergeant and above"
	selection_color = "#fff5cc"
	display_order = JOB_DISPLAY_ORDER_CORPORAL
	outfit = /datum/outfit/job/ncr/f13corporal
	exp_requirements = 1200
	exp_type = EXP_TYPE_NCRTPR

	loadout_options = list(
	/datum/outfit/loadout/corpreg,		//Service
	/datum/outfit/loadout/corplight,	//M1 Carbine
	/datum/outfit/loadout/corpcqb,		//Hunting Shotgun
	/datum/outfit/loadout/corpsct		//Hunting Rifle
	)

/datum/outfit/job/ncr/f13corporal
	name = "NCR Corporal"
	jobtype 		= /datum/job/ncr/f13corporal
	suit			= /obj/item/clothing/suit/armor/f13/ncrarmor/mantle
	uniform 		= /obj/item/clothing/under/f13/ncr
	shoes 			= /obj/item/clothing/shoes/f13/military/ncr
	id 				= /obj/item/card/id/dogtag/ncrtrooper
	neck 			= /obj/item/storage/belt/holster/ncr
	accessory 		= /obj/item/clothing/accessory/ncr/CPL
	head 			= /obj/item/clothing/head/f13/ncr/goggles
	glasses			= /obj/item/clothing/glasses/sunglasses
	l_pocket 		= /obj/item/flashlight
	backpack_contents = list(
		/obj/item/storage/survivalkit_aid=1, \
		/obj/item/storage/bag/money/small/ncrenlisted=1, \
		/obj/item/kitchen/knife/combat=1, \
		/obj/item/binoculars=1
		)

//Base Infantry
/datum/outfit/loadout/corpreg
	name = "Infantry"
	l_hand = /obj/item/gun/ballistic/automatic/service
	belt = /obj/item/storage/belt/military/assault/ncr
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m556/rifle/assault=3,
		/obj/item/kitchen/knife/combat/bayonet=1)

//Base Infantry with M1 Carbine
/datum/outfit/loadout/corplight
	name = "Light Infantry"
	l_hand = /obj/item/gun/ballistic/automatic/m1carbine/ncr
	belt = /obj/item/storage/belt/military/reconbandolier
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m10mm_adv/ext=3,
		/obj/item/attachments/scope=1)

//Scout with a Hunting Shotgun
/datum/outfit/loadout/corpcqb
	name = "Assault"
	l_hand = /obj/item/gun/ballistic/shotgun/hunting
	belt = /obj/item/storage/belt/military/NCR_Bandolier
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/buck=2,
		/obj/item/ammo_box/shotgun/slug=1)

//Scout with a Hunting Rifle
/datum/outfit/loadout/corpsct
	name = "Marksman"
	l_hand = /obj/item/gun/ballistic/rifle/remington
	belt = /obj/item/storage/belt/military/NCR_Bandolier
	backpack_contents = list(
		/obj/item/ammo_box/a762/doublestacked=3,
		/obj/item/attachments/scope=1
		)

/datum/outfit/job/ncr/f13corporal/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)

/*
Combat Medic (to be reworked into Supply)
*/

/datum/job/ncr/f13combatmedic
	title = "NCR Combat Medic"
	total_positions = 0
	spawn_positions = 0
	description = "You are a veteran enlisted with a medical skill set. You work closely with your squad, taking orders from your officers. You have the authority to command troopers if there are none present."
	supervisors = "Corporals and above"
	selection_color = "#fff5cc"
	display_order = JOB_DISPLAY_ORDER_COMBATMEDIC
	outfit = /datum/outfit/job/ncr/f13combatmedic
	exp_requirements = 900
	exp_type = EXP_TYPE_NCRTPR

/datum/outfit/job/ncr/f13combatmedic
	name = "NCR Combat Medic"
	jobtype 		= /datum/job/ncr/f13combatmedic
	uniform 		= /obj/item/clothing/under/f13/ncr
	shoes 			= /obj/item/clothing/shoes/f13/military/ncr
	id 				= /obj/item/card/id/dogtag/ncrtrooper
	neck 			= /obj/item/storage/belt/holster/ncr
	suit 			= /obj/item/clothing/suit/armor/f13/ncrarmor/reinforced
	belt 			= /obj/item/storage/belt/military/assault/ncr
	head			= /obj/item/clothing/head/f13/ncr/steelpot_med
	gloves			= /obj/item/clothing/gloves/color/latex/nitrile
	accessory		= /obj/item/clothing/accessory/armband/med/ncr
	suit_store		= /obj/item/gun/ballistic/automatic/service
	l_hand			= /obj/item/storage/firstaid/regular
	mask 			= /obj/item/clothing/mask/surgical
	l_pocket		= /obj/item/flashlight
	backpack_contents = list(
		/obj/item/storage/survivalkit_aid_adv=1, \
		/obj/item/storage/bag/money/small/ncrenlisted=1, \
		/obj/item/kitchen/knife/combat=1, \
		/obj/item/ammo_box/magazine/m556/rifle=3
		)

/datum/outfit/job/ncr/f13combatmedic/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_CHEMWHIZ, src)
	ADD_TRAIT(H, TRAIT_SURGERY_LOW, src)

/*
NCR Specialist (formerly only Combat Engineer)
*/

/datum/job/ncr/f13combatengineer
	title = "NCR Specialist"
	total_positions = 2
	spawn_positions = 2
	description = "You are an enlisted trooper with a unique set of skills. You work closely with your squad, taking orders from your officers. You have the authority to command troopers if there are no Corporals or above present."
	supervisors = "Corporals and above"
	selection_color = "#fff5cc"
	display_order = JOB_DISPLAY_ORDER_COMBATENGINEER
	outfit = /datum/outfit/job/ncr/f13combatengineer
	exp_requirements = 900
	exp_type = EXP_TYPE_NCRTPR

	loadout_options = list(
	/datum/outfit/loadout/ncrcombatengi,	//Combat Engineer
	/datum/outfit/loadout/ncrcombatmedic	//Combat Medic
	)

/datum/outfit/job/ncr/f13combatengineer
	name = "NCR Specialist"
	jobtype 	= /datum/job/ncr/f13combatengineer
	uniform 	= /obj/item/clothing/under/f13/ncr
	shoes 		= /obj/item/clothing/shoes/f13/military/ncr
	id 			= /obj/item/card/id/dogtag/ncrtrooper
	neck 		= /obj/item/storage/belt/holster/ncr
	suit	 	= /obj/item/clothing/suit/armor/f13/ncrarmor/reinforced
	suit_store 	= /obj/item/gun/ballistic/automatic/service
	l_pocket 	= /obj/item/flashlight
	backpack_contents = list(
	/obj/item/storage/survivalkit_aid=1, \
	/obj/item/storage/bag/money/small/ncrenlisted=1, \
	/obj/item/ammo_box/magazine/m556/rifle=3, \
	)

/datum/outfit/job/ncr/f13combatengineer/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/servicerifle)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/scoutcarbine)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/m1garand)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/explosive/frag)
	ADD_TRAIT(H, TRAIT_CHEMWHIZ, src)
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)

/datum/outfit/loadout/ncrcombatengi
	name = "Combat Engineer"
	head 		= 	/obj/item/clothing/head/f13/ncr
	mask 		= 	/obj/item/clothing/mask/ncr_facewrap
	glasses 	= /obj/item/clothing/glasses/welding
	belt 		= /obj/item/storage/belt/military/assault/ncr/engineer
	gloves 		= /obj/item/clothing/gloves/color/yellow
	accessory 	= /obj/item/clothing/accessory/armband/engine/ncr
	backpack_contents = list(
	/obj/item/grenade/plastic=1, \
	/obj/item/stack/sheet/metal/fifty=1, \
	/obj/item/stack/sheet/glass/fifty=1, \
	/obj/item/stack/sheet/plasteel/five=2, \
	/obj/item/stack/sheet/mineral/concrete/ten=1, \
	/obj/item/stack/sheet/mineral/sandbags=10, \
	/obj/item/shovel/trench=1
	)

/datum/outfit/loadout/ncrcombatmedic
	name = "Combat Medic"
	belt 		= /obj/item/storage/belt/military/assault/ncr
	head 		= /obj/item/clothing/head/f13/ncr/steelpot_med
	gloves 		= /obj/item/clothing/gloves/color/latex/nitrile
	accessory 	= /obj/item/clothing/accessory/armband/med/ncr
	l_hand 		= /obj/item/storage/firstaid/regular
	mask 		= /obj/item/clothing/mask/surgical
	backpack_contents = list(
	/obj/item/storage/survivalkit_aid_adv=1, \
	/obj/item/scalpel=1, \
	/obj/item/defibrillator/compact=1, \
	/obj/item/reagent_containers/glass/beaker/plastic=1, \
	/obj/item/storage/bag/chemistry=1, \
	/obj/item/reagent_containers/glass/beaker/large=6
	)

/*
Mp
*/

/datum/job/ncr/f13militarypolice
	title = "NCR Military Police"
	total_positions = 2
	spawn_positions = 2
	description = "You are the disciplining arm of the NCRA, You protect peoples' lives and property at NCR installations by enforcing military laws and regulations. You are not allowed to leave base unless given an explicit order by High Command"
	supervisors = "Lieutenants and the Sergeant First Class"
	selection_color = "#fff5cc"
	display_order = JOB_DISPLAY_ORDER_MILITARY_POLICE
	outfit = /datum/outfit/job/ncr/f13militarypolice
	exp_requirements = 3000
	exp_type = EXP_TYPE_NCRNCO

/datum/outfit/job/ncr/f13militarypolice
	name = "NCR Military Police"
	jobtype = /datum/job/ncr/f13militarypolice
	id = 			/obj/item/card/id/dogtag/ncrsergeant
	uniform =  		/obj/item/clothing/under/f13/ncr
	shoes = 		/obj/item/clothing/shoes/f13/military/ncr
	accessory =     /obj/item/clothing/accessory/armband/black
	head = 			/obj/item/clothing/head/f13/ncr/steelpot_mp
	neck = 			/obj/item/storage/belt/holster/ncr_officer
	suit = 			/obj/item/clothing/suit/armor/f13/ncrarmor/mantle/reinforced
	suit_store = 	/obj/item/gun/ballistic/shotgun/automatic/combat/auto5
	glasses = 		/obj/item/clothing/glasses/sunglasses/big
	belt = 			/obj/item/storage/belt/military/assault/ncr
	gloves	= 		/obj/item/clothing/gloves/f13/leather/fingerless
	ears 		= 	/obj/item/radio/headset/headset_ncr_com
	l_pocket =		/obj/item/flashlight
	backpack_contents = list(
		/obj/item/storage/survivalkit=1, \
		/obj/item/storage/survivalkit_aid=1, \
		/obj/item/storage/bag/money/small/ncrenlisted=1, \
		/obj/item/kitchen/knife/combat=1, \
		/obj/item/binoculars=1, \
		/obj/item/ammo_box/shotgun/rubber=1, \
		/obj/item/storage/box/handcuffs=1, \
		/obj/item/grenade/flashbang=2, \
		/obj/item/melee/classic_baton/telescopic=1, \
		/obj/item/razor=1
		)

/datum/outfit/job/ncr/f13militarypolice/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)

/*
Heavy Trooper
*/
/datum/job/ncr/f13heavytrooper
	title = "NCR Heavy Trooper"
	total_positions = 1
	spawn_positions = 1
	description = "You are a veteran enlisted with power armor training. You work closely with your squad, taking orders from your officers. You have the authority to command troopers if there are none present."
	supervisors = "Corporals and above"
	selection_color = "#fff5cc"
	display_order = JOB_DISPLAY_ORDER_HEAVYTROOPER
	exp_requirements = 1200
	exp_type = EXP_TYPE_NCRTPR
	outfit = /datum/outfit/job/ncr/f13heavytrooper

/datum/outfit/job/ncr/f13heavytrooper/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)

/datum/outfit/job/ncr/f13heavytrooper
	name = "NCR Heavy Trooper"
	jobtype = /datum/job/ncr/f13heavytrooper
	id = 			/obj/item/card/id/dogtag/ncrtrooper
	uniform =  		/obj/item/clothing/under/f13/ncr
	suit =			/obj/item/clothing/suit/armor/f13/power_armor/ncr
	suit_store =	/obj/item/gun/ballistic/automatic/r84
	shoes = 		/obj/item/clothing/shoes/f13/military/ncr
	accessory =     /obj/item/clothing/accessory/ncr/SPC
	head = 			/obj/item/clothing/head/helmet/f13/power_armor/t45b
	neck =			/obj/item/storage/belt/holster/ncr
	belt = 			/obj/item/storage/belt/military/reconbandolier
	l_pocket =		/obj/item/flashlight
	backpack_contents = list(
		/obj/item/storage/survivalkit_aid=1, \
		/obj/item/ammo_box/magazine/lmg=2, \
		/obj/item/storage/bag/money/small/ncrenlisted=1, \
		/obj/item/kitchen/knife/combat=1
		)

/*
Trooper
*/

/datum/job/ncr/f13trooper
	title = "NCR Trooper"
	total_positions = 4
	spawn_positions = 6
	description = "You are considered the backbone and workforce strength of the NCR Army. You answer to everyone above you in the chain of command, taking orders from NCOs directly and obeying all commands given by the Commanding Officer."
	supervisors = "Corporals and above"
	selection_color = "#fff5cc"
	display_order = JOB_DISPLAY_ORDER_TROOPER
	outfit = /datum/outfit/job/ncr/f13trooper
	exp_requirements = 600

	loadout_options = list(
	/datum/outfit/loadout/troopreg,		//Service
	/datum/outfit/loadout/trooplight,	//M1 Carbine
	/datum/outfit/loadout/troopcqb,		//Hunting Shotgun
	/datum/outfit/loadout/troopsct		//Hunting Rifle
	)

/datum/outfit/job/ncr/f13trooper
	name = "NCR Trooper"
	jobtype = /datum/job/ncr/f13trooper
	id = 			/obj/item/card/id/dogtag/ncrtrooper
	head = 			/obj/item/clothing/head/f13/ncr/goggles
	mask =			/obj/item/clothing/mask/ncr_facewrap
	suit =			/obj/item/clothing/suit/armor/f13/ncrarmor
	uniform =  		/obj/item/clothing/under/f13/ncr
	shoes = 		/obj/item/clothing/shoes/f13/military/ncr
	accessory =     /obj/item/clothing/accessory/ncr/TPR
	neck = 			/obj/item/storage/belt/holster
	l_pocket =		/obj/item/flashlight
	backpack_contents = list(
		/obj/item/storage/survivalkit_aid=1, \
		/obj/item/storage/bag/money/small/ncrenlisted=1, \
		/obj/item/kitchen/knife/combat=1
		)

//Base Infantry
/datum/outfit/loadout/troopreg
	name = "Infantry"
	l_hand = /obj/item/gun/ballistic/automatic/service
	belt = /obj/item/storage/belt/military/assault/ncr
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m556/rifle=3,
		/obj/item/kitchen/knife/combat/bayonet=1)

//Base Infantry with M1 Carbine
/datum/outfit/loadout/trooplight
	name = "Light Infantry"
	l_hand = /obj/item/gun/ballistic/automatic/m1carbine/ncr
	belt = /obj/item/storage/belt/military/reconbandolier
	backpack_contents = list(/obj/item/ammo_box/magazine/m10mm_adv/simple=3)

//Scout with a Hunting Shotgun
/datum/outfit/loadout/troopcqb
	name = "Assault"
	l_hand = /obj/item/gun/ballistic/shotgun/hunting
	belt = /obj/item/storage/belt/military/NCR_Bandolier
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/buck=2,
		/obj/item/ammo_box/shotgun/slug=1)

//Scout with a Hunting Rifle
/datum/outfit/loadout/troopsct
	name = "Marksman"
	l_hand = /obj/item/gun/ballistic/rifle/remington
	belt = /obj/item/storage/belt/military/NCR_Bandolier
	backpack_contents = list(/obj/item/ammo_box/a762/doublestacked=2)

/datum/outfit/job/ncr/f13trooper/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)

/*
Recruit
*/
/datum/job/ncr/f13ncrrecruit
	title = "NCR Recruit"
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
	suit_store = 	/obj/item/gun/ballistic/rifle/mag/varmint
	belt = 			/obj/item/storage/belt/military/assault/ncr
	l_pocket =		/obj/item/flashlight
	backpack_contents = list(
		/obj/item/storage/survivalkit_aid=1, \
		/obj/item/storage/bag/money/small/ncrenlisted=1, \
		/obj/item/kitchen/knife/combat=1, \
		/obj/item/ammo_box/magazine/m556/rifle=1
		)

/*
Off-Duty
*/
/datum/job/ncr/f13ncroffduty
	title = "NCR Off-Duty"
	total_positions = 8
	spawn_positions = 8
	description = "You are off-duty NCR-A personnel in the Yuma Region. Despite being out of uniform and off-duty you are still expected to follow NCR COMJ and represent the uniform properly. Failure to abide by this will result in disciplinary action."
	supervisors = "All NCOs and COs"
	selection_color = "#fff5cc"
	exp_requirements = 600
	display_order = JOB_DISPLAY_ORDER_NCR_OFF_DUTY
	outfit = /datum/outfit/job/ncr/f13ncroffduty

/datum/outfit/job/ncr/f13ncroffduty
	name = "NCR Off-Duty"
	jobtype = /datum/job/ncr/f13ncroffduty
	id = 			/obj/item/card/id/dogtag/ncrtrooper
	uniform =  		/obj/item/clothing/under/f13/ncr
	shoes =			/obj/item/clothing/shoes/f13/military/ncr
	backpack_contents = list(
		/obj/item/storage/survivalkit_aid=1, \
		/obj/item/storage/bag/money/small/ncrenlisted=1, \
		/obj/item/kitchen/knife/combat=1)

/*
Veteran Ranger
*/

/datum/job/ncr/f13vetranger
	title = "NCR Veteran Ranger"
	total_positions = 1
	spawn_positions = 1
	description = "You answer directly to the Captain, working either independently or in a team to complete your mission objectives however required, operating either alone, in a squad or with the NCR Army. Your primary mission is to improve general opinion of the Republic and to neutralize slavers and raiders operating in the area."
	supervisors = "Captain and above"
	selection_color = "#ffeeaa"
	display_order = JOB_DISPLAY_ORDER_VETRANGE
	outfit = /datum/outfit/job/ncr/f13vetranger
	req_admin_notify = 1

	loadout_options = list(
	/datum/outfit/loadout/vrclassic,	//AMR
	/datum/outfit/loadout/vrlite, 		//Republic's Pride
	/datum/outfit/loadout/vrbrush, 		//Scoped Brushgun
	/datum/outfit/loadout/vrhunting,	//5.56 Rangemaster
	)

/datum/outfit/job/ncr/f13vetranger/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	//var/datum/martial_art/rangertakedown/RT = new
	//RT.teach(H)

/datum/outfit/job/ncr/f13vetranger
	name = "NCR Veteran Ranger"
	jobtype = /datum/job/ncr/f13vetranger
	id = 			/obj/item/card/id/dogtag/ncrvetranger
	uniform =  		/obj/item/clothing/under/f13/ranger/vet
	suit = 			/obj/item/clothing/suit/armor/f13/rangercombat
	belt =			/obj/item/storage/belt/military/assault/ncr/crossbelt/reverse
	head = 			/obj/item/clothing/head/helmet/f13/ncr/rangercombat
	gloves =		/obj/item/clothing/gloves/rifleman
	shoes =			/obj/item/clothing/shoes/f13/military/leather
	glasses = 		/obj/item/clothing/glasses/sunglasses
	ears = 			/obj/item/radio/headset/headset_ranger
	l_pocket = 		/obj/item/flashlight/seclite
	r_pocket = 		/obj/item/binoculars
	backpack_contents = list(
		/obj/item/storage/survivalkit_aid_adv=1, \
		/obj/item/storage/bag/money/small/ncr=1, \
		/obj/item/kitchen/knife/bowie=1
		)

/datum/outfit/loadout/vrclassic
	name = "Classic Veteran Ranger"
	suit_store = /obj/item/gun/ballistic/rifle/mag/antimateriel
	backpack_contents = list(
		/obj/item/ammo_box/magazine/amr=2)

/datum/outfit/loadout/vrlite
	name = "Light Veteran Ranger"
	suit_store = /obj/item/gun/ballistic/automatic/m1garand/republicspride
	backpack_contents = list(
		/obj/item/ammo_box/magazine/garand308 = 3)

/datum/outfit/loadout/vrbrush
	name = "Brush Veteran Ranger"
	suit_store = /obj/item/gun/ballistic/rifle/automatic/hunting/brush
	backpack_contents = list(
		/obj/item/attachments/scope=1,
		/obj/item/ammo_box/tube/c4570=3)

/datum/outfit/loadout/vrhunting
	name = "Hunting Veteran Ranger"
	suit_store = /obj/item/gun/ballistic/automatic/service/carbine/rangermaster
	backpack_contents = list(
		/obj/item/attachments/scope = 1,
		/obj/item/ammo_box/magazine/m556/rifle=3)

//NCR Ranger-Sergeant
/datum/job/ncr/f13rangersergeant
	title = "NCR Ranger Sergeant"
	total_positions = 1
	spawn_positions = 1
	description = "As an NCR Ranger Sergeant, you are the premier special forces unit of the NCR. You are the forward observations and support the Army in it's campaigns, as well as continuing the tradition of stopping slavery in it's tracks."
	supervisors = "Veteran Ranger"
	selection_color = "#fff5cc"
	display_order = JOB_DISPLAY_ORDER_RANGER_SERGEANT
	outfit = /datum/outfit/job/ncr/f13rangersergeant

	loadout_options = list(
	/datum/outfit/loadout/rsclassic,	//Sniper Rifle
	/datum/outfit/loadout/rslite, 		//Scoped Garand
	/datum/outfit/loadout/rsbrush, 		//Scoped Brushgun
	/datum/outfit/loadout/rshunting		//5.56 Rangemaster
	)

/datum/outfit/job/ncr/f13rangersergeant/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	//var/datum/martial_art/rangertakedown/RT = new
	//RT.teach(H)

/datum/outfit/job/ncr/f13rangersergeant
	name = "NCR Ranger Sergeant"
	jobtype = /datum/job/ncr/f13rangersergeant
	id = 			/obj/item/card/id/dogtag/ncrranger
	uniform = 		/obj/item/clothing/under/f13/ranger
	head =			/obj/item/clothing/head/f13/ranger/sergeant
	mask =			/obj/item/clothing/mask/gas/sechailer
	suit =			/obj/item/clothing/suit/armor/f13/rangercombat/sergeant
	shoes =			/obj/item/clothing/shoes/f13/military/leather
	glasses = 		/obj/item/clothing/glasses/sunglasses
	belt =			/obj/item/storage/belt/military/reconbandolier
	gloves =		/obj/item/clothing/gloves/patrol
	ears = 			/obj/item/radio/headset/headset_ranger
	l_pocket = 		/obj/item/flashlight/seclite
	r_pocket = 		/obj/item/binoculars
	backpack_contents = list(
		/obj/item/storage/survivalkit_aid=1, \
		/obj/item/storage/bag/money/small/ncr = 1, \
		/obj/item/restraints/handcuffs=1, \
		/obj/item/kitchen/knife/bowie=1
		)

/datum/outfit/loadout/rsclassic
	name = "Classic Ranger"
	suit_store = /obj/item/gun/ballistic/automatic/marksman/sniper
	backpack_contents = list(
		/obj/item/ammo_box/magazine/w308 = 3
		)

/datum/outfit/loadout/rslite
	name = "Light Ranger"
	suit_store = /obj/item/gun/ballistic/automatic/m1garand
	backpack_contents = list(
		/obj/item/attachments/scope = 1,
		/obj/item/ammo_box/magazine/garand308 = 3
		)

/datum/outfit/loadout/rsbrush
	name = "Brush Ranger"
	suit_store = /obj/item/gun/ballistic/rifle/automatic/hunting/brush
	backpack_contents = list(
		/obj/item/attachments/scope = 1,
		/obj/item/ammo_box/tube/c4570 = 3
		)

/datum/outfit/loadout/rshunting
	name = "Hunting Ranger"
	suit_store = /obj/item/gun/ballistic/automatic/service/carbine/rangermaster
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m556/rifle=3)

//NCR Ranger
/datum/job/ncr/f13ranger
	title = "NCR Ranger"
	total_positions = 3
	spawn_positions = 3
	description = "As an NCR Ranger, you are the premier special forces unit of the NCR. You are the forward observations and support the Army in it's campaigns, as well as continuing the tradition of stopping slavery in it's tracks."
	supervisors = "Ranger Sergeant and Veteran Ranger"
	selection_color = "#fff5cc"
	display_order = JOB_DISPLAY_ORDER_RANGER
	outfit = /datum/outfit/job/ncr/f13ranger

	loadout_options = list(
	/datum/outfit/loadout/rangerrecon,		//Fast Armor
	/datum/outfit/loadout/rangertrail,		//Fastest Armor
	/datum/outfit/loadout/rangerpatrol		//Heavy Armor
	)

/datum/outfit/job/ncr/f13ranger/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	//var/datum/martial_art/rangertakedown/RT = new
	//RT.teach(H)

/datum/outfit/job/ncr/f13ranger
	name = "NCR Ranger"
	jobtype = /datum/job/ncr/f13ranger
	id = 			/obj/item/card/id/dogtag/ncrranger
	uniform = 		/obj/item/clothing/under/f13/ranger
	shoes =			/obj/item/clothing/shoes/f13/military/leather
	glasses = 		/obj/item/clothing/glasses/sunglasses
	gloves = 		/obj/item/clothing/gloves/patrol
	ears = 			/obj/item/radio/headset/headset_ranger
	l_pocket = 		/obj/item/flashlight/seclite
	r_pocket = 		/obj/item/binoculars
	backpack_contents = list(
		/obj/item/storage/survivalkit_aid = 1,	\
		/obj/item/storage/bag/money/small/ncr = 1, \
		/obj/item/restraints/handcuffs=1, \
		/obj/item/kitchen/knife/bowie=1, \
		/obj/item/clothing/mask/gas/ranger = 1)

/datum/outfit/loadout/rangerrecon
	name = "Recon Ranger"
	suit =	/obj/item/clothing/suit/hooded/f13/hooded_recon
	belt =	/obj/item/storage/belt/military/reconbandolier
	r_hand = /obj/item/gun/ballistic/automatic/marksman/sniper
	backpack_contents = list(/obj/item/ammo_box/magazine/w308 = 3)

/datum/outfit/loadout/rangertrail
	name = "Trail Ranger"
	head =	/obj/item/clothing/head/f13/trailranger
	suit =	/obj/item/clothing/suit/armor/f13/trailranger
	belt =	/obj/item/storage/belt/military/NCR_Bandolier
	r_hand = /obj/item/gun/ballistic/automatic/m1garand
	backpack_contents = list(
		/obj/item/ammo_box/magazine/garand308 = 3,
		/obj/item/attachments/scope = 1
	)

/datum/outfit/loadout/rangerpatrol
	name = "Patrol Ranger"
	head = /obj/item/clothing/head/f13/ranger
	suit = /obj/item/clothing/suit/armor/f13/combat/ncr_patrol
	belt =	/obj/item/storage/belt/military/assault/ncr
	backpack_contents = list(
		/obj/item/guncase = 1,
		/obj/item/clothing/head/helmet/f13/combat/ncr_patrol = 1,
		/obj/item/clothing/shoes/f13/military/leather/patrol = 1
	)
