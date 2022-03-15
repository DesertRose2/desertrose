//Faction datums of sorts, use the dang hierarchies in the future
//It looks like var/faction controls what becomes visible on setup. Should likely be fixed or something, but I'm not doing it.
/datum/job/CaesarsLegion
	selection_color = "#ffeeee"
	faction = "Legion"

	forbids = "The Legion forbids: Ghouls joining the Legion. Women in armed roles. Chems and drugs such as jet or alcohol. Reliance on technology. Lethally harming any servants of Caesar without proper reason."
	enforces = "The Legion expects: Obeying orders of superiors. A roman style name. Wearing the uniform, unless acting as a nonlethal infiltrator."
	objectivesList = list("The Legate recommends the following goal for this week: Establish an outpost at the radio tower","The Legate recommends the following goal for this week: Establish patrols and fortifications around the main road","The Legate recommends the following goal for this week: Acquire and train slaves")

	exp_type = EXP_TYPE_LEGION

	access = list(ACCESS_LEGION)
	minimal_access = list(ACCESS_LEGION)

/datum/outfit/job/CaesarsLegion
	id = null
	ears = null
	box = null

/datum/outfit/job/CaesarsLegion/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/legioncombatarmor)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/legioncombathelmet)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/legioncombatarmormk2)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/legioncombathelmetmk2)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/legionriotarmor)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/legionriothelmet)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/legionmarinearmor)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/legionmarinehelmet)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/legionsalvagedarmorconversion)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/Legionhelmsalvagedarmorconversion)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/explosive/dynamite)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/cateye)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/hydra)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/zombiepoultice)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/legiongate)


/datum/outfit/job/CaesarsLegion/Legionnaire
	belt = 			/obj/item/storage/belt/military/assault/legion
	backpack = 		/obj/item/storage/backpack/explorer
	satchel = 		/obj/item/storage/backpack/satchel/explorer
	uniform = 		/obj/item/clothing/under/f13/legskirt
	shoes = 		/obj/item/clothing/shoes/f13/military/plated
	gloves =		/obj/item/clothing/gloves/f13/legion
	box = 			/obj/item/storage/survivalkit_tribal

/datum/outfit/job/CaesarsLegion/Legionnaire/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	if(H.gender == FEMALE)
		H.gender = MALE
		H.real_name = random_unique_name(MALE)
		H.name = H.real_name
		if(H.wear_id)
			var/obj/item/card/id/dogtag/L = H.wear_id
			L.registered_name = H.name
			L.update_label()
	if(H.real_name == ("Biggus Dickus" || "Bigus Dickus"))
		H.real_name = "Minimae Coles"
		H.name = "Minimae Coles"

//LM/LC Only Roles/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*
Legate

*/
/datum/job/CaesarsLegion/Legionnaire/f13legate
	title = "Legate"
//	faction = "Legion"
	head_announce = list("Security")
	supervisors = "Caesar"
	selection_color = "#ffdddd"
	total_positions = 0
	spawn_positions = 0

	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13legate

	access = list()
	minimal_access = list()


/datum/outfit/job/CaesarsLegion/Legionnaire/f13legate/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	ADD_TRAIT(H, TRAIT_IRONFIST, src)
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13legate
	name = "Legate"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13legate
	shoes = 		/obj/item/clothing/shoes/f13/military/legate
	suit = 			/obj/item/clothing/suit/armor/f13/legion/legate
	head = 			/obj/item/clothing/head/helmet/f13/legion/legate
	glasses = 		/obj/item/clothing/glasses/sunglasses/big
	ears =			/obj/item/radio/headset/headset_legion
	suit_store = 	/obj/item/gun/ballistic/automatic/marksman
	l_pocket = 		/obj/item/flashlight/lantern
	backpack_contents = list(
		/obj/item/restraints/legcuffs/bola=2,
		/obj/item/melee/powerfist=1,
		/obj/item/ammo_box/magazine/m556/rifle=2,
		/obj/item/reagent_containers/pill/patch/f13/healpoultice=2,
		/obj/item/storage/bag/money/small/legion=1)

/*
Orator
*/

/datum/job/CaesarsLegion/Legionnaire/f13orator
	title = "Legion Orator"
	total_positions = 0
	spawn_positions = 0
	description = "You are the the resonator of Caesar's better wills; a Legionnaire who has, perhaps through injury or advanced age, proven himself unable to fight effectively any longer. Instead of facing \"retirement\" in the Legion, one of your superiors took note of your studies and way with words, and you have been made the face and voice of the Conturbernae."
	supervisors = "the Centurion"
	display_order = JOB_DISPLAY_ORDER_ORATOR
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13orator

/datum/outfit/job/CaesarsLegion/Legionnaire/f13orator
	name = "Legion Orator"
	suit = 	     /obj/item/clothing/suit/armor/f13/legion/vet/orator
	ears =	     /obj/item/radio/headset/headset_legion
	neck =	     /obj/item/storage/belt/holster
	id =         /obj/item/card/id/dogtag/legorator
	belt =       /obj/item/claymore/machete/spatha
	suit_store = /obj/item/gun/ballistic/automatic/pistol/type17
	l_pocket = 	 /obj/item/flashlight/lantern
	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/f13/healpoultice=1,
		/obj/item/ammo_box/magazine/m9mm=3,
		/obj/item/storage/box/ids/legfollower=1,
		/obj/item/storage/bag/money/small/legion=1)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13orator/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_TECHNOPHOBE, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)
/*
Priestess of Mars
*/

/datum/job/CaesarsLegion/f13priestess
	title = "Priestess of Mars"
	total_positions = 0
	spawn_positions = 0
	description = "You are a spiritual and logistics advisor for the Legion forces in the area. Being raised in and from the homeland, you have fully adapted to the Legion's ideals and fully committed yourself to the role as mother and caretaker of the Legion's future. You are an icon to be respected, even by fellow Legion; and although a woman, your status does not allow you to be belittled."
	supervisors = "the Centurion, Mars"
	display_order = JOB_DISPLAY_ORDER_PRIESTESS
	outfit = /datum/outfit/job/CaesarsLegion/f13priestess

/datum/outfit/job/CaesarsLegion/f13priestess
	name = "Priestess of Mars"
	uniform = /obj/item/clothing/under/f13/priestess
	glasses = /obj/item/clothing/glasses/sunglasses/f13/fakeblindfold
	head	= /obj/item/clothing/head/helmet/f13/legion/marsheaddress
	ears	= /obj/item/radio/headset/headset_legion
	gloves	= /obj/item/clothing/gloves/fingerless
	jobtype = /datum/job/CaesarsLegion/f13priestess
	id = /obj/item/card/id/dogtag/legpriest
	r_hand = /obj/item/twohanded/sledgehammer/marsstaff
	shoes = /obj/item/clothing/shoes/roman
	l_pocket = 		/obj/item/flashlight/lantern
	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/f13/healpoultice=2,
		/obj/item/clothing/under/f13/pmarsrobe=1)

/datum/outfit/job/CaesarsLegion/f13priestess/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	if(H.gender == MALE)
		H.gender = FEMALE
		H.real_name = random_unique_name(MALE)
		H.name = H.real_name
		if(H.wear_id)
			var/obj/item/card/id/dogtag/L = H.wear_id
			L.registered_name = H.name
			L.update_label()
	ADD_TRAIT(H, TRAIT_SPIRITUAL, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	ADD_TRAIT(H, TRAIT_SURGERY_MID, src)
	ADD_TRAIT(H, TRAIT_MARS_TEACH, src)
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*
Centurion
*/
/datum/job/CaesarsLegion/Legionnaire/f13centurion
	title = "Legion Centurion"
	head_announce = list("Security")
	total_positions = 1
	spawn_positions = 1
	description = "You are the commander of the Centuria and the direct superior to the Decanii, working with them and your soldiers to establish a strong foothold within the region for Caesar's glory. You oversee all Legion operations in the area, and lead the charge against Caesar's foes."
	supervisors = "the Legate"
	selection_color = "#ffdddd"
	display_order = JOB_DISPLAY_ORDER_CENTURION
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13centurion
	req_admin_notify = 1

	loadout_options = list(
	/datum/outfit/loadout/centstandard,	//Ripper, .223 pistol, most balanced out armor
	/datum/outfit/loadout/centpaladin,	//Goliath, AER12, 10mm pistol, heaviest armor
	/datum/outfit/loadout/centranger	//Bowie, Republic's Demise (Republic's Pride but legion), Hunting Revolver, fastest armor
	)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13centurion/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_TECHNOPHOBE, src)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13centurion
	name = "Legion Centurion"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13centurion
	id =			/obj/item/card/id/dogtag/legcenturion
	mask =			/obj/item/clothing/mask/bandana/f13/legcenturion
	neck =			/obj/item/storage/belt/holster
	glasses = 		/obj/item/clothing/glasses/f13/legionpolarizing
	ears = 			/obj/item/radio/headset/headset_legion
	r_pocket =		/obj/item/restraints/handcuffs
	l_pocket = 		/obj/item/flashlight/lantern
	backpack_contents = list(
		/obj/item/restraints/legcuffs/bola=1,
		/obj/item/key/scollar=1,
		/obj/item/key/bcollar=1,
		/obj/item/reagent_containers/pill/patch/f13/healpoultice=1,
		/obj/item/electropack/shockcollar=1,
		/obj/item/electropack/shockcollar/explosive=2,
		/obj/item/storage/bag/money/small/legion=1)

/datum/outfit/loadout/centstandard
	name = "Standard Centurion"
	suit = 			/obj/item/clothing/suit/armor/f13/legion/centurion
	head = 			/obj/item/clothing/head/helmet/f13/legion/centurion
	l_hand = 		/obj/item/gun/ballistic/revolver/thatgun
	r_hand =		/obj/item/twohanded/sledgehammer/supersledge
	backpack_contents = list(/obj/item/ammo_box/magazine/m556/rifle/assault=1)

/datum/outfit/loadout/centpaladin
	name = "Paladin-Slayer Centurion"
	suit = 			/obj/item/clothing/suit/armor/f13/legion/palacent
	head = 			/obj/item/clothing/head/helmet/f13/legion/palacent
	l_hand = 		/obj/item/gun/energy/laser/aer12
	backpack_contents = list(
		/obj/item/stock_parts/cell/ammo/mfc=2,
		/obj/item/gun/ballistic/automatic/pistol/n99=1,
		/obj/item/ammo_box/magazine/m10mm_adv=2,
		/obj/item/melee/powerfist/moleminer/goliath=1
	)

/datum/outfit/loadout/centranger
	name = "Ranger-Hunter Centurion"
	suit = 			/obj/item/clothing/suit/armor/f13/legion/rangercent
	head = 			/obj/item/clothing/head/helmet/f13/legion/rangercent
	l_hand = 		/obj/item/gun/ballistic/automatic/m1garand/republicsdemise
	backpack_contents = list(
		/obj/item/ammo_box/magazine/garand308=3,
		/obj/item/gun/ballistic/revolver/hunting=1,
		/obj/item/ammo_box/c4570=2,
		/obj/item/kitchen/knife/bowie=1
	)

/*
Vexillarius
*/

/datum/job/CaesarsLegion/Legionnaire/f13vexillarius
	title = "Legion Vexillarius"
	total_positions = 1
	spawn_positions = 1
	selection_color = "#ffdddd"
	description = "You answer directly to the Decani and the Centurion, acting as a standard bearer for your squad. You raise troop morale, relay orders from the Decanii and the Centurion, and rally men when ordered, however, you hold no actual authority over the troops and should instead only relay orders from your superiors."
	supervisors = "the Decani and Centurion"
	display_order = JOB_DISPLAY_ORDER_VEXILLARIUS
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13vexillarius
	loadout_options = list(
		/datum/outfit/loadout/vexvulp, //Marksman Carbine, Shotgun Revolver, Fox Helmet
		/datum/outfit/loadout/vexursa, //Hunting Revolver, Shield, Ripper, Bear Helmet
		/datum/outfit/loadout/vexcanis //Brush Gun, Shotgun Revolver, Dog (Nightstalker) Helmet
		)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13vexillarius/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_TECHNOPHOBE, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13vexillarius
	name = "Legion Vexillarius"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13vexillarius
	id = 			/obj/item/card/id/dogtag/legveteran
	neck =			/obj/item/storage/belt/holster
	suit = 			/obj/item/clothing/suit/armor/f13/legion/vet/vexil
	glasses = 		/obj/item/clothing/glasses/f13/legionpolarizing
	ears = 			/obj/item/radio/headset/headset_legion
	r_pocket =		/obj/item/restraints/handcuffs
	l_pocket = 		/obj/item/flashlight/lantern
	backpack_contents = list(
		/obj/item/claymore/machete/spatha=1,
		/obj/item/reagent_containers/pill/patch/f13/healingpowder=1,
		/obj/item/megaphone/cornu=1,
		/obj/item/storage/bag/money/small/legofficers=1)

/datum/outfit/loadout/vexvulp
	name = "Vulpes (Fox)"
	head = 		/obj/item/clothing/head/helmet/f13/legion/vet/vexil
	l_hand =	/obj/item/gun/ballistic/automatic/type93
	backpack_contents = list(
		/obj/item/gun/ballistic/revolver/shotgunrevolver=1,
		/obj/item/ammo_box/magazine/m556/rifle/assault=2
		)

/datum/outfit/loadout/vexursa
	name = "Ursa (Bear)"
	head = 		/obj/item/clothing/head/helmet/f13/legion/vet/combvexil
	l_hand = 	/obj/item/gun/ballistic/automatic/shotgun/riot
	r_hand =	/obj/item/shield/riot/legion
	backpack_contents = list(
		/obj/item/ammo_box/magazine/d12g=2
		)

/datum/outfit/loadout/vexcanis
	name = "Canis (Dog)"
	head = 		/obj/item/clothing/head/helmet/f13/legion/vet/nightvexil
	l_hand =  	/obj/item/gun/ballistic/rifle/automatic/hunting/brush
	backpack_contents = list(
		/obj/item/ammo_box/tube/c4570=3,
		/obj/item/gun/ballistic/revolver/shotgunrevolver=1,
		)

/*
Decanii
*/


//Veteran Decanus
/datum/job/CaesarsLegion/Legionnaire/f13decanvet
	title = "Legion Veteran Decanus"
	total_positions = 1
	spawn_positions = 1
	description = "You answer directly to the Centurion, working with them to organize the Legionaries. You lead the Veteran Legionaries on patrols, raids and scouting missions on behalf of your Centurion."
	supervisors = "the Centurion"
	display_order = JOB_DISPLAY_ORDER_DECANVET
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13decanvet
	loadout_options = list(
	/datum/outfit/loadout/vetdecanline,		//Garand, .45 Revolver
	/datum/outfit/loadout/vetdecanshock,	//Pilum
	/datum/outfit/loadout/vetdecanmelee		//Hunting Revolver, Shield, Ripper, Spear Quiver
	)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13decanvet/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_TECHNOPHOBE, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13decanvet
	name = "Legion Veteran Decanus"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13decanvet
	id = 			/obj/item/card/id/dogtag/legveteran
	suit = 			/obj/item/clothing/suit/armor/f13/legion/vet/decan
	head = 			/obj/item/clothing/head/helmet/f13/legion/vet/decan
	mask =			/obj/item/clothing/mask/bandana/f13/legvet/decan
	neck =			/obj/item/storage/belt/holster/ranger45
	glasses = 		/obj/item/clothing/glasses/f13/legionpolarizing
	ears = 			/obj/item/radio/headset/headset_legion
	l_pocket = 		/obj/item/flashlight/lantern
	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/f13/healingpowder=2,
		/obj/item/reagent_containers/pill/patch/f13/healpoultice=1,
		/obj/item/restraints/handcuffs=2,
		/obj/item/claymore/machete/spatha=1,
		/obj/item/storage/bag/money/small/legion=1)

/datum/outfit/loadout/vetdecanline
	name = "Bellator (Line) Officer"
	l_hand =  /obj/item/gun/ballistic/automatic/m1garand
	backpack_contents = list(
		/obj/item/gun/ballistic/revolver/revolver45=1,
		/obj/item/ammo_box/magazine/garand308=3,
		/obj/item/attachments/scope=1,
		/obj/item/ammo_box/c45rev=3)

/datum/outfit/loadout/vetdecanshock
	name = "Assassin (Scout) Officer"
	l_hand =  /obj/item/gun/ballistic/automatic/assault_rifle/legion
	backpack_contents = list(/obj/item/ammo_box/magazine/m556/rifle/assault=2)

/datum/outfit/loadout/vetdecanmelee
	name = "Triarius (Melee) Officer"
	l_hand =	/obj/item/gun/ballistic/revolver/hunting
	r_hand =	/obj/item/shield/riot/legion
	backpack_contents = list(
		/obj/item/storage/backpack/spearquiver=1,
		/obj/item/nullrod/claymore/chainsaw_sword=1,
		/obj/item/ammo_box/c4570=1)

//Prime Decanus
/datum/job/CaesarsLegion/Legionnaire/f13decan
	title = "Legion Prime Decanus"
	total_positions = 1
	spawn_positions = 1
	description = "You answer directly to the Centurion, working with them to organize the Legionaries. You lead the Prime Legionaries on patrols, raids and scouting missions on behalf of your Centurion."
	supervisors = "the Veteran Decanus and the Centurion"
	display_order = JOB_DISPLAY_ORDER_DECAN
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13decan
	exp_requirements = 3000
	exp_type = EXP_TYPE_DECANUS

	loadout_options = list(
	/datum/outfit/loadout/primedecline,		//Trail Carbine, .45 Revolver
	/datum/outfit/loadout/primedecshock,	//Trench Shotgun, Shield, .357 Revolver
	/datum/outfit/loadout/primedecmelee		//Legion Lance, .44 Revolver, Shield, Spear Quiver
	)


/datum/outfit/job/CaesarsLegion/Legionnaire/f13decan/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_TECHNOPHOBE, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13decan
	name = "Legion Prime Decanus"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13decan
	id = 			/obj/item/card/id/dogtag/legveteran
	suit =			/obj/item/clothing/suit/armor/f13/legion/prime/decan
	head =			/obj/item/clothing/head/helmet/f13/legion/prime/decan
	mask =			/obj/item/clothing/mask/bandana/f13/legprime/decan
	neck =			/obj/item/storage/belt/holster
	glasses = 		/obj/item/clothing/glasses/f13/legiongoggles/shielded
	ears = 			/obj/item/radio/headset/headset_legion
	l_pocket = 		/obj/item/flashlight/lantern
	backpack_contents = list(
		/obj/item/claymore/machete/gladius=1,
		/obj/item/reagent_containers/pill/patch/f13/healingpowder=2,
		/obj/item/reagent_containers/pill/patch/f13/healpoultice=1,
		/obj/item/restraints/handcuffs=2,
		/obj/item/storage/bag/money/small/legofficers=1)

/datum/outfit/loadout/primedecline
	name = "Bellator (Line) Officer"
	l_hand = /obj/item/gun/ballistic/rifle/automatic/hunting/trail
	backpack_contents = list(
		/obj/item/ammo_box/tube/m44=3,
		/obj/item/gun/ballistic/revolver/revolver45=1,
		/obj/item/ammo_box/c45rev=3
	)

/datum/outfit/loadout/primedecshock
	name = "Testudo (Shock) Officer"
	l_hand = /obj/item/gun/ballistic/shotgun/trench
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/buck=2,
		/obj/item/ammo_box/shotgun/slug=1,
		/obj/item/shield/riot/legion=1,
		/obj/item/gun/ballistic/revolver/colt357=1,
		/obj/item/ammo_box/a357=3
	)

/datum/outfit/loadout/primedecmelee
	name = "Triarius (Melee) Officer"
	l_hand =	/obj/item/gun/ballistic/revolver/m29
	r_hand =	/obj/item/shield/riot/legion
	backpack_contents = list(
		/obj/item/twohanded/spear/lance=1,
		/obj/item/storage/backpack/spearquiver=1,
		/obj/item/ammo_box/m44=3
	)


//Recruit Decanus
/datum/job/CaesarsLegion/Legionnaire/f13decanrec
	title = "Legion Recruit Decanus"
	total_positions = 2
	spawn_positions = 2
	description = "You answer directly to the Centurion, working with them to organize the Legionaries. You lead the Recruit Legionaries on patrols, raids and scouting missions on behalf of your Centurion."
	supervisors = "the Prime Decanus and the Centurion"
	display_order = JOB_DISPLAY_ORDER_DECANREC
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13decanrec
	exp_requirements = 1200
	exp_type = EXP_TYPE_PRIME

	loadout_options = list(
	/datum/outfit/loadout/recdecline,	//Trail Carbine
	/datum/outfit/loadout/recdecshock,	//Lever Shotgun, Shield
	/datum/outfit/loadout/recdecmelee	//Legion Lance, .45 Revolver, Shield, Spear Quiver
	)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13decanrec/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_TECHNOPHOBE, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13decanrec
	name = "Legion Recruit Decanus"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13decanrec
	id = 			/obj/item/card/id/dogtag/legveteran
	suit = 			/obj/item/clothing/suit/armor/f13/legion/recruit/decan
	head = 			/obj/item/clothing/head/helmet/f13/legion/recruit/decan
	mask =			/obj/item/clothing/mask/bandana/f13/legrecruit/decan
	neck =			/obj/item/storage/belt/holster
	glasses = 		/obj/item/clothing/glasses/f13/legiongoggles
	ears = 			/obj/item/radio/headset/headset_legion
	shoes = 		/obj/item/clothing/shoes/f13/military/leather
	l_pocket = 		/obj/item/flashlight/lantern
	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/f13/healingpowder=2,
		/obj/item/reagent_containers/pill/patch/f13/healpoultice=1,
		/obj/item/restraints/handcuffs=2,
		/obj/item/claymore/machete/gladius=1,
		/obj/item/storage/bag/money/small/legofficers=1)


/datum/outfit/loadout/recdecline
	name = "Libratus (Line) Officer"
	l_hand = /obj/item/gun/ballistic/rifle/automatic/hunting/trail
	backpack_contents = list(
		/obj/item/ammo_box/tube/m44=3
	)

/datum/outfit/loadout/recdecshock
	name = "Testudo (Shock) Officer"
	l_hand =	/obj/item/gun/ballistic/shotgun/lever
	r_hand =	/obj/item/shield/riot/legion
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/buck=2,
		/obj/item/ammo_box/shotgun/slug=1
	)

/datum/outfit/loadout/recdecmelee
	name = "Phalanxi (Melee) Officer"
	l_hand =	/obj/item/gun/ballistic/revolver/revolver45
	r_hand =	/obj/item/shield/riot/legion
	backpack_contents = list(
		/obj/item/twohanded/spear/lance=1,
		/obj/item/storage/backpack/spearquiver=1,
		/obj/item/ammo_box/c45rev=1
	)

/*
Camp Prefect (formerly slave master)
*/

/datum/job/CaesarsLegion/Legionnaire/f13campprefect
	title = "Camp Prefect"
	total_positions = 2
	spawn_positions = 2
	description = "You are a Praefectus, a member of the feared and respected disciplinary corp of the Legion. Acting as both the master of the slave-pens and the executor of the Centurion's iron will within his ranks, you are a man that understands the absolute necessity of discipline and cohesion within the camp. By means both subtle and bloody, you are to maintain order in the castrorum and make examples of those whom would defy the will of your Centurion and Mars. Act always to ensure cooperation and discipline within the ranks to ensure the camp is not bogged down by internal strife. Additionally your duties include managing camp defenses and resources as both castellan and master of the armory so the legionaries are able to pursue their tasks with more focus. You are not to leave your faction base unless given an explicit order from the office of the Legatus"
	supervisors = "The Veteran Decanus, Venator and the Centurion"
	display_order = JOB_DISPLAY_ORDER_SLAVEMASTER
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13campprefect
	exp_requirements = 1200
	exp_type = EXP_TYPE_PRIME

/datum/outfit/job/CaesarsLegion/Legionnaire/f13campprefect/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_TECHNOPHOBE, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13campprefect
	name = "Camp Prefect"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13campprefect
	id =			/obj/item/card/id/dogtag/legslavemaster
	head = 			/obj/item/clothing/head/helmet/f13/legion/prime/slavemaster
	suit = 			/obj/item/clothing/suit/armor/f13/legion/prime/slavemaster
	suit_store = 	/obj/item/gun/ballistic/shotgun/automatic/combat/auto5
	glasses = 		/obj/item/clothing/glasses/f13/legiongoggles/shielded
	ears =			/obj/item/radio/headset/headset_legion
	r_pocket =		/obj/item/restraints/handcuffs
	l_pocket = 		/obj/item/flashlight/lantern
	backpack_contents = list(
		/obj/item/claymore/machete/gladius=1,
		/obj/item/reagent_containers/pill/patch/f13/healingpowder=1,
		/obj/item/melee/curator_whip=1,
		/obj/item/ammo_box/shotgun/rubber=1,
		/obj/item/storage/box/handcuffs=1,
		/obj/item/razor=1,
		/obj/item/binoculars=1,
		/obj/item/restraints/legcuffs/bola=2,
		/obj/item/stack/medical/gauze/improvised = 1)

/*
Libritor
*/

/datum/job/CaesarsLegion/Legionnaire/f13libritor
	title = "Legion Libritor"
	total_positions = 1
	spawn_positions = 1
	description = "You answer to the Decani and the Centurion. Acting as a loyal soldier of the Centuria, you have the great honour of serving under Caesar in his quest to unite the scattered tribes of The Sonora. You are entrusted with suit of power armor and heavy weapons, and have been waging war with the Legion for many years."
	supervisors = "the Decani and Centurion"
	display_order = JOB_DISPLAY_ORDER_LIBRITOR
	exp_requirements = 1200
	exp_type = EXP_TYPE_PRIME
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13libritor

/datum/outfit/job/CaesarsLegion/Legionnaire/f13legionary/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_TECHNOPHOBE, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13libritor
	name = "Legion Libritor"
	jobtype = 		/datum/job/CaesarsLegion/Legionnaire/f13libritor
	id =			/obj/item/card/id/dogtag/leglibritor
	head =			/obj/item/clothing/head/helmet/f13/power_armor/legion
	suit =			/obj/item/clothing/suit/armor/f13/power_armor/legion
	suit_store = 	/obj/item/gun/ballistic/automatic/bar
	neck			= /obj/item/storage/belt/holster
	glasses			= /obj/item/clothing/glasses/f13/legiongoggles
	ears			= /obj/item/radio/headset/headset_legion
	r_pocket =		/obj/item/restraints/handcuffs
	l_pocket = 		/obj/item/flashlight/lantern
	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/f13/healingpowder=2,
		/obj/item/claymore/machete/reinforced=1,
		/obj/item/ammo_box/magazine/m762=2,
		/obj/item/storage/bag/money/small/legofficers=1,
		/obj/item/clothing/accessory/f13/legion/prime=1
	)

/*
Veteran Legionary
*/

/datum/job/CaesarsLegion/Legionnaire/f13vetlegionary
	title = "Veteran Legionary"
	total_positions = 3
	spawn_positions = 3
	description = "You answer to the Decani and the Centurion. Acting as a loyal soldier of the Centuria, you have the great honour of serving under Caesar in his quest to unite the scattered tribes of The Sonora. You are a hardened warrior, and have been waging war with the Legion for many years."
	supervisors = "the Decani and Centurion"
	display_order = JOB_DISPLAY_ORDER_VETLEGIONARY
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13vetlegionary
	loadout_options = list(
		/datum/outfit/loadout/vetline,	//Garand, .45 Revolver
		/datum/outfit/loadout/vetscout,	//Commando DMR, .44 Single Action Revolver
		/datum/outfit/loadout/vetshock,	//Browning Auto-5, .44 Revolver
		/datum/outfit/loadout/vetmelee	//Hunting Revolver, Shield, Bumper Sword, Spear Quiver
	)


/datum/outfit/job/CaesarsLegion/Legionnaire/f13vetlegionary/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_TECHNOPHOBE, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13vetlegionary
	name = "Veteran Legionary"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13vetlegionary
	id = 			/obj/item/card/id/dogtag/legveteran
	mask =			/obj/item/clothing/mask/bandana/f13/legvet
	head = 			/obj/item/clothing/head/helmet/f13/legion/vet
	neck = 			/obj/item/storage/belt/holster
	suit = 			/obj/item/clothing/suit/armor/f13/legion/vet
	glasses = 		/obj/item/clothing/glasses/f13/legiongoggles/shielded
	ears	=		/obj/item/radio/headset/headset_legion
	r_pocket =		/obj/item/restraints/handcuffs
	l_pocket = 		/obj/item/flashlight/lantern
	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/f13/healpoultice=1,
		/obj/item/reagent_containers/pill/patch/f13/healingpowder=2,
		/obj/item/claymore/machete/gladius=1,
		/obj/item/binoculars=1,
		/obj/item/storage/bag/money/small/legofficers=1)

/datum/outfit/loadout/vetline
	name = "Bellator (Line)"
	l_hand = /obj/item/gun/ballistic/automatic/m1garand
	backpack_contents = list(
		/obj/item/gun/ballistic/revolver/revolver45=1,
		/obj/item/ammo_box/magazine/garand308=3,
		/obj/item/attachments/scope=1,
		/obj/item/ammo_box/c45rev=3)

/datum/outfit/loadout/vetscout
	name = "Assassin (Scout)"
	l_hand = /obj/item/gun/ballistic/rifle/mag/commando/dmr
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m45/extended=2,
		/obj/item/attachments/scope=1,
		/obj/item/gun/ballistic/revolver/m29=1,
		/obj/item/ammo_box/m44=2)

/datum/outfit/loadout/vetshock
	name = "Cataegis (Shock)"
	l_hand = /obj/item/gun/ballistic/shotgun/automatic/combat/auto5
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/buck=2,
		/obj/item/ammo_box/shotgun/slug=1,
		/obj/item/gun/ballistic/revolver/m29=1,
		/obj/item/ammo_box/m44=3,
		/obj/item/attachments/scope=1
	)

/datum/outfit/loadout/vetmelee
	name = "Triarius (Melee)"
	l_hand = 	/obj/item/gun/ballistic/revolver/hunting
	r_hand = 	/obj/item/shield/riot/legion
	backpack_contents = list(
		/obj/item/storage/backpack/spearquiver=1,
		/obj/item/twohanded/fireaxe/bmprsword=1,
		/obj/item/ammo_box/c4570=1
	)

/*
Prime Legionairy
*/

/datum/job/CaesarsLegion/Legionnaire/f13legionary
	title = "Prime Legionary"
	total_positions = 4
	spawn_positions = 4
	description = "You answer to the Decani and the Centurion, as well as Veterans above you. Acting as a loyal soldier of the Centuria, you have the great honour of serving under Caesar in his quest to unite the scattered tribes of The Sonora. You have been through enough battles to call yourself a prime, but you are by no means yet a Veteran."
	supervisors = "the Decani and Centurion"
	display_order = JOB_DISPLAY_ORDER_LEGIONARY
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13legionary
	exp_requirements = 600

	loadout_options = list(
		/datum/outfit/loadout/primeline,	//Trail Carbine
		/datum/outfit/loadout/primeshock,	//Lever Shotgun
		/datum/outfit/loadout/primemelee	//Legion Lance, .44 Revolver, Shield, Spear Quiver
	)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13legionary/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_TECHNOPHOBE, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13legionary
	name = "Prime Legionary"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13legionary
	id				= /obj/item/card/id/dogtag/legprime
	mask			= /obj/item/clothing/mask/bandana/f13/legprime
	head			= /obj/item/clothing/head/helmet/f13/legion/prime
	neck			= /obj/item/storage/belt/holster
	suit			= /obj/item/clothing/suit/armor/f13/legion/prime
	glasses			= /obj/item/clothing/glasses/f13/legiongoggles
	ears			= /obj/item/radio/headset/headset_legion
	r_pocket 		=/obj/item/restraints/handcuffs
	l_pocket		= /obj/item/flashlight/lantern
	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/f13/healingpowder=2,
		/obj/item/claymore/machete/reinforced=1,
		/obj/item/storage/bag/money/small/legofficers=1
	)

/datum/outfit/loadout/primeline
	name = "Milites (Line)"
	l_hand =	/obj/item/gun/ballistic/rifle/automatic/hunting/trail
	backpack_contents = list(
		/obj/item/ammo_box/tube/m44=3)

/datum/outfit/loadout/primeshock
	name = "Percutio (Shock)"
	l_hand =	/obj/item/gun/ballistic/shotgun/lever
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/buck=2,
		/obj/item/ammo_box/shotgun/slug=1)

/datum/outfit/loadout/primemelee
	name = "Principes (Melee)"
	l_hand =	/obj/item/gun/ballistic/revolver/m29
	r_hand =	/obj/item/shield/riot/legion
	backpack_contents = list(
		/obj/item/twohanded/spear/lance=1,
		/obj/item/storage/backpack/spearquiver=1,
		/obj/item/ammo_box/m44=3
	)

/*
Recruit Legionary
*/

/datum/job/CaesarsLegion/Legionnaire/f13recleg
	title = "Recruit Legionary"
	total_positions = 4
	spawn_positions = 4
	description = "You have recently come of age or been inducted into Caesar's Legion. You have absolutely no training, and are expected to follow every whim of the Decanii and your Centurion."
	supervisors = "the Decani and Centurion"
	display_order = JOB_DISPLAY_ORDER_RECRUITLEG
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13recleg

	loadout_options = list(
		/datum/outfit/loadout/recruitlegline,	//Cowboy Repeater, base tier 3 armor
		/datum/outfit/loadout/recruitlegscout,	//Hunting Shotgun, alt tier 2 speed boost armor
		/datum/outfit/loadout/recruitlegmelee	//.357 Revolver, Buckler, Spear Quiver
	)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13recleg/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_TECHNOPHOBE, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13recleg
	name = "Recruit Legionary"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13recleg
	id = 			/obj/item/card/id/dogtag/legrecruit
	shoes = 		/obj/item/clothing/shoes/f13/military/leather
	mask =			/obj/item/clothing/mask/bandana/f13/legrecruit
	glasses = 		/obj/item/clothing/glasses/f13/legiongoggles
	ears	=		/obj/item/radio/headset/headset_legion
	r_pocket =		/obj/item/restraints/handcuffs
	l_pocket = 		/obj/item/flashlight/lantern
	backpack_contents = list(
		/obj/item/claymore/machete=1,
		/obj/item/reagent_containers/pill/patch/f13/healingpowder=2,
		/obj/item/storage/bag/money/small/legenlisted=1)

/datum/outfit/loadout/recruitlegline
	name = "Hastati (Line)"
	head = 		/obj/item/clothing/head/helmet/f13/legion/recruit
	suit = 		/obj/item/clothing/suit/armor/f13/legion/recruit
	l_hand =	/obj/item/gun/ballistic/rifle/automatic/hunting/cowboy
	backpack_contents = list(/obj/item/ammo_box/tube/a357=3)

/datum/outfit/loadout/recruitlegscout
	name = "Speculator (Scout)"
	head =		/obj/item/clothing/head/helmet/f13/legion/recruit/scout
	suit =		/obj/item/clothing/suit/armor/f13/legion/recruit/scout
	l_hand =	/obj/item/gun/ballistic/shotgun/hunting
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/buck=2,
		/obj/item/binoculars=1
	)

/datum/outfit/loadout/recruitlegmelee
	name = "Velites (Melee)"
	head = 		/obj/item/clothing/head/helmet/f13/legion/recruit/velite
	suit = 		/obj/item/clothing/suit/armor/f13/legion/recruit
	l_hand =	/obj/item/gun/ballistic/revolver/colt357
	r_hand =	/obj/item/shield/legion/buckler
	backpack_contents = list(
		/obj/item/storage/backpack/spearquiver=1,
		/obj/item/ammo_box/a357=3
	)

/*
Venator
*/
/datum/job/CaesarsLegion/Legionnaire/f13venator
	title = "Legion Venator"
	total_positions = 1
	spawn_positions = 1
	description = "You are the Venator -- the Hunter. With your powerful rifle and your many years of experience, you are a formidable killing machine, capable of taking down even the most formidable targets. Note that you are not a rank-and-file legionary, and you should not be operating as such -- your job is special operations, not fighting alongside the hordes of the Legion."
	supervisors = "the Centurion"
	selection_color = "#ffdddd"
	head_announce = list("Security")
	display_order = JOB_DISPLAY_ORDER_VENATOR
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13venator
	loadout_options = list(
		/datum/outfit/loadout/venatorstandard,	//Brush Gun, Shotgun Revolver
		/datum/outfit/loadout/venatorranged,	//Sniper Rifle, Shotgun Revolver
		/datum/outfit/loadout/venatorcqb		//Citykiller, Shotgun Revolver, Smokebomb
	)


/datum/outfit/job/CaesarsLegion/Legionnaire/f13venator/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_TECHNOPHOBE, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13venator
	name = "Legion Venator"
	jobtype 	= 	/datum/job/CaesarsLegion/Legionnaire/f13venator
	id 			= 	/obj/item/card/id/dogtag/legvenator
	suit 		= 	/obj/item/clothing/suit/armor/f13/legion/venator
	head 		= 	/obj/item/clothing/head/helmet/f13/legion/venator
	mask 		=	/obj/item/clothing/mask/bandana/f13/legvenator
	neck 		=	/obj/item/storage/belt/holster
	glasses 	= 	/obj/item/clothing/glasses/night
	ears		=	/obj/item/radio/headset/headset_legion
	r_pocket 	= 	/obj/item/binoculars
	l_pocket = 		/obj/item/flashlight/lantern
	backpack_contents = list(
		/obj/item/claymore/machete/gladius=1,
		/obj/item/restraints/handcuffs=2,
		/obj/item/storage/bag/money/small/legofficers=1,
		/obj/item/reagent_containers/pill/patch/f13/healpoultice=1
	)

/datum/outfit/loadout/venatorstandard
	name = "Vexillum (Standard)"
	l_hand =	/obj/item/gun/ballistic/rifle/automatic/hunting/brush
	backpack_contents = list(
		/obj/item/gun/ballistic/revolver/shotgunrevolver=1,
		/obj/item/ammo_box/tube/c4570=3
		)

/datum/outfit/loadout/venatorranged
	name = "Interfector (Ranged)"
	l_hand =	/obj/item/gun/ballistic/automatic/marksman/sniper
	backpack_contents = list(
		/obj/item/ammo_box/magazine/w308 = 3,
		/obj/item/gun/ballistic/revolver/shotgunrevolver=1,
		)

/datum/outfit/loadout/venatorcqb
	name = "Comminus Proelium (Close Quarters)"
	l_hand =	/obj/item/gun/ballistic/shotgun/automatic/combat/citykiller
	backpack_contents = list(
		/obj/item/gun/ballistic/revolver/hunting=1,
		/obj/item/ammo_box/shotgun/buck = 2,
		/obj/item/ammo_box/shotgun/slug = 1,
		/obj/item/grenade/smokebomb=1
	)

/*
Explorer
*/

/datum/job/CaesarsLegion/Legionnaire/f13explorer
	title = "Legion Explorer"
	total_positions = 3
	spawn_positions = 3
	description = "Acting as the eyes and ears of the Legion, you are in the region to scout it out for potential conquest. Make note of your surroundings and above all, survive to report back."
	supervisors = "the Venator and Centurion"
	display_order = JOB_DISPLAY_ORDER_EXPLORER
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13explorer
	exp_requirements = 900
	exp_type = EXP_TYPE_PRIME

	loadout_options = list(
		/datum/outfit/loadout/excursor,	//Commando DMR
		/datum/outfit/loadout/sapper	//Commando Carbine, C4
		)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13explorer
	name = "Legion Explorer"
	jobtype 	= 	/datum/job/CaesarsLegion/Legionnaire/f13explorer
	id			= 	/obj/item/card/id/dogtag/legexplorer
	head		= 	/obj/item/clothing/head/helmet/f13/legion/prime/explorer
	glasses		= 	/obj/item/clothing/glasses/f13/legiongoggles
	mask		= 	/obj/item/clothing/mask/bandana/f13/legexplorer
	suit 		= 	/obj/item/clothing/suit/armor/f13/legion/prime/explorer
	neck 		= 	/obj/item/storage/belt/holster
	ears		=	/obj/item/radio/headset/headset_legion
	shoes = 		/obj/item/clothing/shoes/f13/military/leather
	l_pocket	=	/obj/item/flashlight/lantern
	r_pocket = 		/obj/item/binoculars
	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/f13/healingpowder=2,
		/obj/item/storage/bag/money/small/legenlisted=1,
		/obj/item/restraints/handcuffs=2,
		/obj/item/claymore/machete/reinforced=1
		)


/datum/outfit/job/CaesarsLegion/Legionnaire/f13explorer/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_TECHNOPHOBE, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)

/datum/outfit/loadout/excursor
	name = "Excursor (Runner)"
	l_hand = 	/obj/item/gun/ballistic/rifle/mag/commando/dmr
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m45/extended=2,
		/obj/item/attachments/scope=1)

/datum/outfit/loadout/sapper
	name = "Sonspicio Munitor (Saboteur)"
	gloves = 	/obj/item/clothing/gloves/f13/blacksmith
	belt = 		/obj/item/storage/belt/utility/full/engi
	l_hand =	/obj/item/gun/ballistic/rifle/mag/commando
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m45/extended=1,
		/obj/item/grenade/plastic=1)

/*
Auxilia
*/
/datum/job/CaesarsLegion/f13auxilia
	title = "Auxilia"
	head_announce = list("Security")
	total_positions = 3
	spawn_positions = 3
	description = "You are a respected and valued noncombatant for the Legion, commanding the slaves and Camp Followers and providing important surgical or engineering expertise. Though you hold more authority than the Legionaries in camp, you are not a warrior, and should not act as such unless absolutely necessary."
	supervisors = "the Decani and Centurion"
	display_order = JOB_DISPLAY_ORDER_AUXILIA
	outfit = /datum/outfit/job/CaesarsLegion/f13auxilia
	exp_requirements = 1200
	exp_type = EXP_TYPE_CAMP

	loadout_options = list(
	/datum/outfit/loadout/auxengi,
	/datum/outfit/loadout/auxassist,
	/datum/outfit/loadout/auxacolyte
	)

/datum/outfit/job/CaesarsLegion/f13auxilia
	name = "Auxilia"
	jobtype = /datum/job/CaesarsLegion/f13auxilia
	id =			/obj/item/card/id/dogtag/legauxilia
	shoes = 		/obj/item/clothing/shoes/roman
	uniform = 		/obj/item/clothing/under/f13/legauxiliaf
	ears	=		/obj/item/radio/headset/headset_legion
	gloves =		null
	belt =			null
	r_pocket =      /obj/item/flashlight/flare/torch
	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/f13/healingpowder=2)

/datum/outfit/job/CaesarsLegion/f13auxilia/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_SURGERY_MID, src)
	ADD_TRAIT(H, TRAIT_MARS_TEACH, src)

/datum/outfit/loadout/auxengi
	name = "Opifex (Blacksmith)"
	head =		/obj/item/clothing/head/f13/legion/auxilia
	glasses =	/obj/item/clothing/glasses/welding
	belt =		/obj/item/storage/belt/utility/full/engi
	neck =		/obj/item/clothing/neck/apron/labor/forge
	gloves =	/obj/item/clothing/gloves/f13/blacksmith
	r_hand =	/obj/item/clothing/under/f13/legauxilia
	backpack_contents = list(
		/obj/item/stack/sheet/metal/twenty=1,
		/obj/item/stack/sheet/mineral/wood/twenty=1,
		/obj/item/stack/sheet/leather/twenty=1,
		/obj/item/stack/sheet/cloth/thirty=1,
		/obj/item/stack/sheet/prewar=1)

/datum/outfit/loadout/auxassist
	name = "Arcarius (Treasurer)"
	head =		/obj/item/clothing/head/f13/legion/auxilia
	neck =		/obj/item/clothing/neck/mantle/treasurer
	r_hand =	/obj/item/clothing/under/f13/legauxilia
	r_pocket = 	/obj/item/flashlight/lantern
	backpack_contents = list(
		/obj/item/folder/red=1,
		/obj/item/paper_bin/bundlenatural=1,
		/obj/item/pen/fountain=1,
		/obj/item/storage/bag/money/small/legofficers=2,
		/obj/item/taperecorder=1)

/datum/outfit/loadout/auxacolyte
	name = "Sacerdos (Acolyte)"
	head =		/obj/item/clothing/head/f13/legion/auxilia
	neck =		/obj/item/clothing/neck/apron/medicus
	gloves =	/obj/item/clothing/gloves/f13/crudemedical
	backpack_contents = list(
		/obj/item/storage/firstaid/ancient=1,
		/obj/item/scalpel=1,
		/obj/item/hemostat=1,
		/obj/item/retractor=1,
		/obj/item/circular_saw=1,
		/obj/item/cautery=1,
		/obj/item/surgical_drapes=1,
		/obj/item/stack/sticky_tape/surgical=2,
		/obj/item/stack/medical/bone_gel/hydra=2,
		/obj/item/bonesetter=1
	)

/*
Camp Follower
*/

/datum/job/CaesarsLegion/f13campfollower
	title = "Camp Follower"
	total_positions = 4
	spawn_positions = 2
	description = "You answer to any member of the Legion, but take orders directly from the Auxilia around the camp. Working as a Camp Follower for the Centuria, you bear the great honor of supporting Caesar's Army in its conquest of the Mojave in whatever capacity required from those whom you serve. You perform any tasks required of you, for you know how to serve the Legion well."
	supervisors = "the entire legion"
	display_order = JOB_DISPLAY_ORDER_CAMPFOLLOWER
	outfit = /datum/outfit/job/CaesarsLegion/f13campfollower

	loadout_options = list(
		/datum/outfit/loadout/campfollowermatron,
		/datum/outfit/loadout/campfollowerhealer,
		/datum/outfit/loadout/campfolloweroffduty
	)

/datum/outfit/job/CaesarsLegion/f13campfollower
	name = "Camp Follower"
	jobtype = /datum/outfit/job/CaesarsLegion/f13campfollower
	shoes = 	/obj/item/clothing/shoes/roman
	r_hand =	/obj/item/flashlight/lantern
	uniform = 	/obj/item/clothing/under/f13/campfollowermale
	id =		/obj/item/card/id/dogtag/legfollower
	ears = 		/obj/item/radio/headset/headset_legion
	gloves =	/obj/item/clothing/gloves/f13/legion

/datum/outfit/job/CaesarsLegion/f13campfollower/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_SURGERY_LOW, src)

/datum/outfit/loadout/campfollowermatron
	name = "Mater (Matron)"
	head =	/obj/item/clothing/head/f13/legion/servant
	neck =	/obj/item/clothing/neck/apron/chef
	backpack_contents = list(
		/obj/item/kitchen/knife/butcher=1,
		/obj/item/reagent_containers/food/snacks/grown/ambrosia/deus=1,
		/obj/item/reagent_containers/food/condiment/flour=2,
		/obj/item/storage/box/bowls=1,
		/obj/item/reagent_containers/glass/beaker/large=1,
		/obj/item/storage/bag/plants=1,
		/obj/item/cultivator=1,
		/obj/item/shovel/spade=1,
		/obj/item/storage/fancy/egg_box=1,
		/obj/item/clothing/under/f13/campfollowerfemale=1
	)

/datum/outfit/loadout/campfollowerhealer
	name = "Medicus (Healer)"
	head =	/obj/item/clothing/head/f13/legion/servant
	neck =	/obj/item/clothing/neck/apron/medicus
	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/f13/healingpowder=2,
		/obj/item/reagent_containers/pill/patch/f13/healpoultice=2,
		/obj/item/smelling_salts/crafted=1,
		/obj/item/clothing/under/f13/campfollowerfemale=1,
		/obj/item/book/granter/trait/mars_teachings=1
	)

/datum/outfit/loadout/campfolloweroffduty
	name = "Retired Legionary"
	uniform =	/obj/item/clothing/under/f13/legskirt
	mask =		/obj/item/clothing/mask/bandana/f13/oldredbandana
	backpack_contents = list(
		/obj/item/claymore/machete=1,
		/obj/item/reagent_containers/pill/patch/f13/healingpowder=1,
		/obj/item/storage/bag/money/small/legion=1
	)

/*
Slave
*/
/datum/job/CaesarsLegion/slave
	title = "Legion Slave"
	total_positions = 0
	spawn_positions = 2
	description = "You answer to any member of the Legion, but take orders directly from the Auxilia around the camp. You are to the point where you have been broken in as a slave and most slaves will no longer consider escaping as an option."
	supervisors = "the entire legion, but mostly the Slavemaster"
	display_order = JOB_DISPLAY_ORDER_LEGIONSLAVE
	outfit = /datum/outfit/job/CaesarsLegion/slave

	loadout_options = list(
	/datum/outfit/loadout/slcook, //Apron Chef, Knife, Frying Pan, radio
	/datum/outfit/loadout/slfarmer //Coveralls, bag plants,radio
)

/datum/outfit/job/CaesarsLegion/slave
	name		= "Legion Slave"
	jobtype		= /datum/job/CaesarsLegion/slave
	id			= /obj/item/card/id/legionbrand
	uniform		= /obj/item/clothing/under/f13/legslave
	neck		= /obj/item/electropack/shockcollar
	shoes		= /obj/item/clothing/shoes/f13/rag
	r_hand = /obj/item/flashlight/flare/torch
	backpack = /obj/item/storage/backpack/satchel/explorer

/datum/outfit/loadout/slcook
	name = "Servant"
	belt =	/obj/item/kitchen/knife
	backpack_contents = list(
		/obj/item/radio=1,
		/obj/item/claymore/machete/pipe/pan=1,
		/obj/item/stack/medical/gauze/improvised=1,
		/obj/item/clothing/under/f13/legslavef=1,
		/obj/item/soap/homemade=1)

/datum/outfit/loadout/slfarmer
	name = "Laborer"
	suit =	/obj/item/clothing/suit/armor/f13/slavelabor
	belt =	/obj/item/hatchet
	backpack_contents = list(
		/obj/item/storage/bag/plants=1,
		/obj/item/clothing/under/f13/legslavef=1,
		/obj/item/radio=1)

/*
Off-Duty Legionary
*/
/datum/job/CaesarsLegion/Legionnaire/offduty
	title = "Off-Duty Legionary"
	total_positions = 8
	spawn_positions = 4
	description = "You answer to any member of the Legion that is currently on-duty and shares or is a higher rank than you, but take orders directly from the Auxilia around the camp. Your dilligence serving the Caesar as one of his Legionaries has earnt you a break. You may perform any tasks required of you, for you know how to serve the Legion well, but you are not expected to do so."
	supervisors = "Those who share your rank or higher that are on duty."
	display_order = JOB_DISPLAY_ORDER_LEGION_OFF_DUTY
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/offduty
	exp_requirements = 600

	loadout_options = list(
		/datum/outfit/loadout/offcent,
		/datum/outfit/loadout/offdecvet,
		/datum/outfit/loadout/offprime,
		/datum/outfit/loadout/offexpven
		)

/datum/outfit/job/CaesarsLegion/Legionnaire/offduty
	name =	"Off-Duty Legionary"
	jobtype =	"Off-Duty Legionary"
	uniform =	/obj/item/clothing/under/f13/legskirt
	ears =		/obj/item/radio/headset/headset_legion
	id =		/obj/item/card/id/dogtag/legrecruit
	r_hand =	/obj/item/flashlight/lantern
	backpack_contents = list(
		/obj/item/claymore/machete=1,
		/obj/item/reagent_containers/pill/patch/f13/healingpowder=1,
		/obj/item/storage/bag/money/small/legion=1,
		)

/datum/outfit/loadout/offcent
	name =	"Centurion"
	neck =	/obj/item/clothing/mask/bandana/f13/legcenturion
	belt =	/obj/item/claymore/machete/spatha
	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/f13/healpoultice=2,
		/obj/item/clothing/accessory/f13/legion/cent=1
		)

/datum/outfit/loadout/offdecvet
	name = 	"Decani or Veteran"
	mask =	/obj/item/clothing/mask/bandana/f13/oldredbandana
	backpack_contents = list(
		/obj/item/claymore/machete/gladius=1,
		/obj/item/reagent_containers/pill/patch/f13/healpoultice=1,
		/obj/item/clothing/accessory/f13/legion/officer=1
		)

/datum/outfit/loadout/offprime
	name =	"Prime"
	mask =	/obj/item/clothing/mask/bandana/f13/legdecan
	backpack_contents = list(
		/obj/item/claymore/machete/reinforced=1,
		/obj/item/reagent_containers/pill/patch/f13/healingpowder=1,
		/obj/item/clothing/accessory/f13/legion/prime=1
		)

/datum/outfit/loadout/offexpven
	name =	"Explorer Corps"
	neck =	/obj/item/clothing/neck/mantle/gray
	backpack_contents = list(
		/obj/item/claymore/machete/gladius=1,
		/obj/item/reagent_containers/pill/patch/f13/healpoultice=1,
		/obj/item/clothing/accessory/f13/legion/explorer=1
		)
