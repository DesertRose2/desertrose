/datum/job/vtcc //do NOT use this for anything, it's just to store faction datums
	selection_color = "#ADD8E6"
	faction = "VTCC"
	exp_type = EXP_TYPE_VTCC
	objectivesList = list("The Overseer recommends the following goal for this week: Work together to maximize profits","The Overseer recommends the following goal for this week: Establish good relations with two or more major factions","The Overseer recommends the following goal for this week: Stay neutral at all costs")

/datum/outfit/job/vtcc/
	name = "VTCCdatums"
	jobtype = /datum/job/vtcc/
	backpack = /obj/item/storage/backpack/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	uniform = /obj/item/clothing/under/f13/vault/vcity
	ears = /obj/item/radio/headset/headset_vault/cogcity
	id = /obj/item/card/id
	shoes = /obj/item/clothing/shoes/jackboots
	l_pocket = /obj/item/storage/bag/money/small/settler

/* Alderman */

/datum/job/vtcc/f13alderman
	title = "Alderman"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Overseer"
	description = "A subordinate of the Overseer of the Vaults and Cities, you are the primary face of the town. Handling the day to day dealings of the denizens of our fair city falls to you. Those wasters outside the walls are an unknown factor, so it falls to you to maintain relations with the Wastelands many players. Be wary of the Machine down below, as with the trades and treaties in place. Balance the budget, but don't step on the Merchant's toes. Organise defences, but do not encroach on the Marshal's office. Most of all: don't lose your head."
	req_admin_notify = 1

	outfit = /datum/outfit/job/vtcc/f13alderman
	loadout_options = list(
		/datum/outfit/loadout/treasurer,
		/datum/outfit/loadout/baron,
		/datum/outfit/loadout/eldervaultie
		)

	access = list(ACCESS_VTCC, ACCESS_VTCC_COMMAND, ACCESS_VTCC_SEC, ACCESS_VTCC_BAR, ACCESS_VTCC_ROADIE, ACCESS_VTCC_SHOP, ACCESS_VTCC_SEC, ACCESS_VTCC_RESEARCH)
	minimal_access = list(ACCESS_VTCC, ACCESS_VTCC_COMMAND, ACCESS_VTCC_SEC, ACCESS_VTCC_BAR, ACCESS_VTCC_ROADIE, ACCESS_VTCC_SHOP, ACCESS_VTCC_SEC, ACCESS_VTCC_RESEARCH)

/datum/outfit/job/vtcc/f13alderman/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_GENERIC, src)

/datum/outfit/job/vtcc/f13alderman
	name = "Alderman"
	jobtype =		/datum/job/vtcc/f13alderman
	ears = 			/obj/item/radio/headset/headset_vault/cogcity/overseer
	neck = 			/obj/item/storage/belt/holster
	id =            /obj/item/card/id/silver
	r_pocket = 		/obj/item/reagent_containers/hypospray/medipen/f13/stimpak/super
	l_pocket =		/obj/item/storage/bag/money/small/vaultcity
	belt = 			/obj/item/gun/ballistic/automatic/pistol/n99/executive
	backpack_contents = list(
		/obj/item/storage/box/citizenship_permits = 1, \
		/obj/item/ammo_box/magazine/m10mm_adv = 3 )

/datum/outfit/loadout/treasurer
	name = "Treasurer"
	backpack_contents = list(
	/obj/item/pen/fountain/captain=1,
	/obj/item/paper_bin=1,
	/obj/item/stack/f13Cash/caps/fivezerozero=1)

/datum/outfit/loadout/baron
	name = "Baron"
	backpack_contents = list(
	/obj/item/clothing/suit/hooded/cloak/desert/raven_cloak=1,)

/datum/outfit/loadout/eldervaultie
	name = "Elder Vaultie"
	backpack_contents = list(
	/obj/item/clothing/suit/armor/vest=1,
	/obj/item/pda=1,
	/obj/item/melee/baton=1)

/* Merchant */

/datum/job/vtcc/f13merchant
	title = "Merchant"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Alderman and the Overseer"
	description = "Trade deals fall upon your shoulders to negotiate with those around the town, so ensure you never give more than you've got. Of course, selling the town is the worst thing you could do, so it should go without saying that you can't do that. Negotiate with the traders of the wastes, extort them for the shirt on their back, or set them up for life, it's up to you to decide. Just don't lose your head."
	req_admin_notify = 1

	outfit = /datum/outfit/job/vtcc/f13merchant

	loadout_options = list(
		/datum/outfit/loadout/blacksmith,
		/datum/outfit/loadout/armsdealer
		)

	access = list(ACCESS_VTCC, ACCESS_VTCC_COMMAND, ACCESS_VTCC_BAR, ACCESS_VTCC_ROADIE, ACCESS_VTCC_SHOP)
	minimal_access = list(ACCESS_VTCC, ACCESS_VTCC_COMMAND, ACCESS_VTCC_BAR, ACCESS_VTCC_ROADIE, ACCESS_VTCC_SHOP)

/datum/outfit/job/vtcc/f13merchant/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_TRAPPER, src)
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)

/datum/outfit/job/vtcc/f13merchant/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/combat_armor)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/combat_helmet)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/combatrifle)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/sniper)


/datum/outfit/job/vtcc/f13merchant
	name = "Merchant"
	jobtype = 		/datum/job/vtcc/f13merchant
	ears = 			/obj/item/radio/headset/headset_vault/cogcity/merch_lead
	id =            /obj/item/card/id/silver
	l_pocket =		/obj/item/storage/bag/money/small/vaultcity
	r_pocket = 		/obj/item/pda/quartermaster
	shoes = 		/obj/item/clothing/shoes/f13/fancy
	uniform = 		/obj/item/clothing/under/f13/cowboyg
	gloves = 		/obj/item/clothing/gloves/f13/leather/fingerless
	backpack_contents = list(
		/obj/item/stack/f13Cash/caps/fivezerozero=1
		)

/datum/outfit/loadout/blacksmith
	name = "Blacksmith"
	backpack_contents = list(
	/obj/item/clothing/gloves/f13/blacksmith=1,
	/obj/item/melee/smith/hammer/toolbox=1,
	/obj/item/stack/sheet/mineral/sandstone = 50,
	/obj/item/stack/sheet/metal/fifty=2
	)

/datum/outfit/loadout/armsdealer
	name = "Arms Dealer"
	backpack_contents = list(
	/obj/item/attachments/auto_sear=2,
	/obj/item/attachments/burst_improvement=2,
	/obj/item/attachments/bullet_speed=2,
	/obj/item/attachments/recoil_decrease=2,
	/obj/item/attachments/scope=2
	)

/* Chief Researcher */

/*datum/job/vtcc/f13chresearcher
	title = "Chief Researcher"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Alderman and the Overseer"
	description = "Doctor, Scientist, Roboticist, each of you under the Vault's employ stands under the title of Researcher. The Vault's servers are regularly wiped by some glitch in the system, and it's down to the Scientists to restore these data files. To be a Roboticist is to uphold a tradition in the Vault that bears itself a marred reputation, so don't lose your head. The Medical Professionals, even those who handle quarantined patients, are the clinical cornerstone of the town, so long as the price is right. As the Chief of Development, the actions of the Followers are your responsibility."
	req_admin_notify = 1

	outfit = /datum/outfit/job/vtcc/f13chresearcher
	loadout_options = list(
		/datum/outfit/loadout/qadmin,
		/datum/outfit/loadout/neurosurgeon,
		)

	access = list(ACCESS_VTCC, ACCESS_VTCC_COMMAND, ACCESS_VTCC_RESEARCH, ACCESS_ROBOTICS)
	minimal_access = list(ACCESS_VTCC, ACCESS_VTCC_COMMAND, ACCESS_VTCC_RESEARCH, ACCESS_ROBOTICS)


/datum/outfit/job/vtcc/f13chresearcher/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_MEDICALEXPERT, src)
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_CHEMWHIZ, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	ADD_TRAIT(H, TRAIT_SURGERY_HIGH, src)

/datum/outfit/job/vtcc/f13chresearcher
	name = "Chief Researcher"
	jobtype = /datum/job/vtcc/f13chresearcher

	ears = /obj/item/radio/headset/headset_vault/cogcity/sci_lead
	glasses =		/obj/item/clothing/glasses/hud/health
	id =            /obj/item/card/id/silver
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	l_pocket =		/obj/item/storage/bag/money/small/vaultcity
	r_pocket = /obj/item/clipboard
	suit = /obj/item/clothing/suit/toggle/labcoat
	backpack_contents = list(
		/obj/item/pen/fountain=1,
		/obj/item/paper_bin=1,
		/obj/item/gun/ballistic/revolver/needler=1,
		/obj/item/ammo_box/needleap = 2,
		/obj/item/reagent_containers/hypospray/medipen/f13/stimpak/super = 3
		)

/datum/outfit/loadout/qadmin
	name = "Quarantine Admin"
	backpack_contents = list(
	/obj/item/clothing/head/bio_hood=1,
	/obj/item/clothing/suit/bio_suit=1,
	/obj/item/storage/briefcase/medical=1,
	/obj/item/ammo_box/needleap = 2
	)

/datum/outfit/loadout/neurosurgeon
	name = "Neurosurgeon"
	backpack_contents = list(
	/obj/item/autosurgeon/surgery=1,
	/obj/item/mmi=1,
	/obj/item/storage/pill_bottle/mannitol=1,
	/obj/item/storage/firstaid/brute=1
	)*/

/* Marshal */

/datum/job/vtcc/f13marshal
	title = "Marshal"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Aldermen, Marshals and the Overseer"
	description = "As the head of the security forces, you are the face of justice in the town. Uphold the law, or bend it to suit your needs, you set the precedent for how justice is doled out in the town, so bear that in mind when you sentence that pickpocket to death. Maintain the armoury and keep that watchful eye on the elevator to the Vault below. Whatever you do, don't lose your head."
	req_admin_notify = 1

	outfit = /datum/outfit/job/vtcc/f13marshal
	loadout_options = list(
		/datum/outfit/loadout/secchief,
		/datum/outfit/loadout/peacekeeper,
		/datum/outfit/loadout/fireteamlead
		)

	access = list(ACCESS_VTCC, ACCESS_VTCC_COMMAND, ACCESS_VTCC_SEC, ACCESS_VTCC_BAR, ACCESS_VTCC_SHOP, ACCESS_VTCC_SEC, ACCESS_VTCC_RESEARCH)
	minimal_access = list(ACCESS_VTCC, ACCESS_VTCC_COMMAND, ACCESS_VTCC_SEC, ACCESS_VTCC_BAR, ACCESS_VTCC_SHOP, ACCESS_VTCC_SEC, ACCESS_VTCC_RESEARCH)

/datum/outfit/job/vtcc/f13marshal/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_PA_WEAR, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)

/datum/outfit/job/vtcc/f13marshal
	name = "Marshal"
	jobtype = 		/datum/job/vtcc/f13marshal
	id =            /obj/item/card/id/silver
	ears = 			/obj/item/radio/headset/headset_vault/cogcity/sec_lead
	r_pocket = 		/obj/item/reagent_containers/hypospray/medipen/f13/stimpak/super
	l_pocket =		/obj/item/storage/bag/money/small/vaultcity
	glasses = 		/obj/item/clothing/glasses/sunglasses/big
	belt = 			/obj/item/storage/belt/military/assault
	neck = 			/obj/item/storage/belt/holster
	r_hand =		/obj/item/gun/ballistic/automatic/pistol/n99
	backpack_contents = list(
		/obj/item/restraints/handcuffs=1,
		/obj/item/melee/classic_baton=1,
		/obj/item/kitchen/knife/combat=1,
		/obj/item/pda/warden=1,
		/obj/item/ammo_box/magazine/m10mm_adv=3
		)

/datum/outfit/loadout/secchief
	name = "Commander"
	suit_store = /obj/item/gun/energy/laser/wattz2k
	backpack_contents = list(
	/obj/item/stock_parts/cell/ammo/mfc=3,
	/obj/item/clothing/head/helmet/f13/power_armor/vaulttec=1,
	/obj/item/clothing/suit/armor/f13/power_armor/vaulttec=1
	)

/datum/outfit/loadout/peacekeeper
	name = "Sheriff"
	suit_store = /obj/item/gun/ballistic/rifle/automatic/hunting/brush
	backpack_contents = list(
	/obj/item/ammo_box/tube/c4570=3,
	/obj/item/gun/ballistic/revolver/m29/peacekeeper=1,
	/obj/item/ammo_box/m44=3,
	/obj/item/clothing/head/helmet/riot/vaultsec/vc/marshal/provost=1,
	/obj/item/clothing/suit/armor/f13/battlecoat/vault/marshal=1
	)

/datum/outfit/loadout/fireteamlead
	name = "Fireteam Leader"
	suit_store = /obj/item/gun/ballistic/automatic/m72
	backpack_contents = list(
	/obj/item/ammo_box/magazine/m2mm=2,
	/obj/item/clothing/suit/armor/f13/riot/vault/provost/marshal=1,
	/obj/item/clothing/head/helmet/riot/vaultsec/vc/marshal/provost/helmet=1
	)

/datum/outfit/job/vtcc/f13provostmarshal/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/vaultheavyarmor)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/vaultheavyhelm)

/* Sheriff */
/datum/job/vtcc/f13provost
	title = "Sheriff"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Aldermen and the Marshal."
	description = "Participating in strike squads against raider encampments and performing surgical strikes against enemies of the Coalition, you and the rest of the elite Provosts don't so much as charge into battle as you do prevent the battle from happening; enforcing the law is still the order of the day, but destabilising real threats and taking out bands of raiders is a priority."
	exp_requirements = 1500
	exp_type = EXP_TYPE_VTCCSEC

	outfit = /datum/outfit/job/vtcc/f13provost

	loadout_options = list(
		/datum/outfit/loadout/specops,
		/datum/outfit/loadout/espionage,
		/datum/outfit/loadout/enforcer
	)

	access = list(ACCESS_VTCC, ACCESS_VTCC_SEC)
	minimal_access = list(ACCESS_VTCC, ACCESS_VTCC_SEC)

/datum/outfit/job/vtcc/f13provost/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_GENERIC, src)

/datum/outfit/job/vtcc/f13provost
	name = "Sheriff"
	jobtype = 		/datum/job/vtcc/f13provost
	ears = 			/obj/item/radio/headset/headset_vault/cogcity/sec
	id =            /obj/item/card/id
	glasses = 		/obj/item/clothing/glasses/sunglasses/big
	belt = 			/obj/item/storage/belt/military/assault
	suit =			/obj/item/clothing/suit/armor/f13/riot/vault/provost
	head =			/obj/item/clothing/head/helmet/riot/vaultsec/vc/provost
	neck = 			/obj/item/storage/belt/holster
	shoes = 		/obj/item/clothing/shoes/jackboots
	l_pocket =		/obj/item/storage/bag/money/small/vaultcity
	backpack_contents = list(
		/obj/item/restraints/handcuffs = 1,
		/obj/item/kitchen/knife/combat=1,
		/obj/item/pda/security=1,
		/obj/item/storage/survivalkit_aid=1,
		/obj/item/clothing/mask/gas/sechailer=1,
		/obj/item/gun/ballistic/automatic/pistol/n99=1,
		/obj/item/ammo_box/magazine/m10mm_adv=2
	)

/datum/outfit/job/vtcc/f13provost/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/vaultheavyarmor)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/vaultheavyhelm)

/datum/outfit/loadout/specops
	name = "Spec Ops"
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/combat=1,
		/obj/item/ammo_box/magazine/greasegun=2,
		/obj/item/suppressor = 1,
		/obj/item/storage/bag/ammo=1
	)

/datum/outfit/loadout/espionage
	name = "Espionage"
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/smg/smg10mm=1,
		/obj/item/ammo_box/magazine/m10mm_adv/ext=3,
		/obj/item/suppressor = 1,
		/obj/item/camera=1,
		/obj/item/book/granter/trait/demolitions=1
	)

/datum/outfit/loadout/enforcer
	name = "Enforcer"
	backpack_contents = list(
		/obj/item/clothing/glasses/hud/health=1,
		/obj/item/gun/ballistic/automatic/assault_rifle/vtcc=1,
		/obj/item/ammo_box/magazine/m556/rifle=2,
		/obj/item/grenade/smokebomb=2
	)

/datum/outfit/job/vtcc/f13provostsgt/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/vaultheavyarmor)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/vaultheavyhelm)


/* Deputy */

/datum/job/vtcc/f13citysecscout
	title = "Deputy"
	total_positions = 2
	spawn_positions = 1
	supervisors = "the Sheriffs."
	description = "Day or night, you watch the walls with diligence. The wastes outside are lawless, but that's not your problem until they drag it in with them, inside the outer ring. It's there that you will learn to dispense justice with an iron fist, dragging those that would break laws penned by the Overseers to serve their sentences by any means necessary. The citizens of the inner ring are rarely a concern and should get off lighter than their counterparts in the outer ring."

	outfit = /datum/outfit/job/vtcc/f13citysecscout
	exp_requirements = 600
	exp_type = EXP_TYPE_VTCC

	loadout_options = list(
		/datum/outfit/loadout/newblood,
		/datum/outfit/loadout/deepend,
		//datum/outfit/loadout/vcfmedic
		)

	access = list(ACCESS_VTCC, ACCESS_VTCC_SEC)
	minimal_access = list(ACCESS_VTCC, ACCESS_VTCC_SEC)

/datum/outfit/job/vtcc/f13citysecscout/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_GENERIC, src)

/datum/outfit/job/vtcc/f13citysecscout
	name = "Deputy"
	jobtype = /datum/job/vtcc/f13citysecscout
	ears = 			/obj/item/radio/headset/headset_vault/cogcity/sec
	id =            /obj/item/card/id
	shoes = 		/obj/item/clothing/shoes/jackboots
	head = 			/obj/item/clothing/head/helmet/riot/vaultsec/vc/scout
	suit = 			/obj/item/clothing/suit/armor/f13/riot/vault/scout
	l_pocket =		/obj/item/storage/bag/money/small/vaultcity
	backpack_contents = list(
		/obj/item/restraints/handcuffs = 1,
		/obj/item/kitchen/knife/combat=1,
		/obj/item/pda/security=1
		)

/datum/outfit/loadout/newblood
	name = "Shock Cadet"
	backpack_contents = list(
	/obj/item/gun/ballistic/automatic/m1carbine=1,
	/obj/item/ammo_box/magazine/m10mm_adv=2
	)

/datum/outfit/loadout/deepend
	name = "Riot Cadet"
	backpack_contents = list(
	/obj/item/gun/energy/laser/wattz/magneto=1,
	/obj/item/stock_parts/cell/ammo/ec = 3,
	/obj/item/clothing/mask/gas/sechailer=1,
	/obj/item/grenade/smokebomb=1,
	/obj/item/shield/riot/tele=1
	)

/*datum/outfit/loadout/vcfmedic
	name = "Field Medic"
	backpack_contents = list(
	/obj/item/gun/ballistic/automatic/pistol/n99=1,
	/obj/item/ammo_box/magazine/m10mm=2,
	/obj/item/storage/bag/chemistry=1,
	/obj/item/storage/survivalkit_aid=1,
	/obj/item/storage/box/medicine/stimpak5=3,
	/obj/item/defibrillator/compact/loaded=1,
	/obj/item/clothing/glasses/hud/health=1
	)*/

/datum/outfit/job/vtcc/f13citycadet/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/vaultheavyarmor)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/vaultheavyhelm)

/* Broker */

/datum/job/vtcc/f13shopkeep
	title = "Broker"
	total_positions = 2
	spawn_positions = 1
	supervisors = "the Merchant"
	description = "Operate the shop for the Merchant and push your products on anyone in town you can. Sell to everyone; sell as much as you can - it's a firesale!"

	outfit = /datum/outfit/job/vtcc/f13shopkeep
	exp_requirements = 900
	exp_type = EXP_TYPE_ROADIE

	access = list(ACCESS_VTCC, ACCESS_VTCC_ROADIE, ACCESS_VTCC_SHOP)
	minimal_access = list(ACCESS_VTCC, ACCESS_VTCC_ROADIE, ACCESS_VTCC_SHOP)

/datum/outfit/job/vtcc/f13shopkeep
	name = "Broker"
	jobtype = 	/datum/job/vtcc/f13shopkeep
	id =		/obj/item/card/id
	ears = 		/obj/item/radio/headset/headset_vault/cogcity/merch
	shoes = 	/obj/item/clothing/shoes/jackboots
	uniform = 	/obj/item/clothing/under/f13/merca
	neck =		/obj/item/storage/belt/holster
	l_pocket =	/obj/item/storage/bag/money/small/vaultcity
	suit_store = /obj/item/gun/ballistic/automatic/pistol/autoloader
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m45=2,
		/obj/item/advanced_crafting_components/assembly = 2,
		/obj/item/advanced_crafting_components/alloys = 2,
		/obj/item/book/granter/crafting_recipe/gunsmith_one = 1,
		/obj/item/book/granter/crafting_recipe/gunsmith_two = 2
		)

/datum/outfit/job/vtcc/f13shopkeep/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/combat_coat)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/lever_action)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/trail_carbine)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/autoloader)

/* Roadie */

/datum/job/vtcc/f13roadie
	title = "Roadie"
	total_positions = 2
	spawn_positions = 1
	supervisors = "the Merchant & the Shopkeeper."
	description = "Operate the shop when the Merchant's asleep or just isn't there, push and pull those crates to and fro like your life depends on it (and when your paycheck is based on performance, well, it certainly does). If there are no crates to pick up, head out into the wastes and start scavenging for anything you could sell at an extortionate price."
	forbids = "Using the stock to go bunker busting. The stock is to be sold, not to be taken and used by personnel."

	outfit = /datum/outfit/job/vtcc/f13roadie
	exp_requirements = 600
	exp_type = EXP_TYPE_VTCC

	loadout_options = list(
		/datum/outfit/loadout/scavver,
		/datum/outfit/loadout/courier,
		/datum/outfit/loadout/caravaner
		)

	access = list(ACCESS_VTCC, ACCESS_VTCC_ROADIE)
	minimal_access = list(ACCESS_VTCC, ACCESS_VTCC_ROADIE)

/datum/outfit/job/vtcc/f13roadie/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_TRAPPER, src)
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)

/datum/outfit/job/vtcc/f13roadie
	name = "Roadie"
	jobtype = 	/datum/job/vtcc/f13roadie
	ears = 		/obj/item/radio/headset/headset_vault/cogcity/merch
	shoes = 	/obj/item/clothing/shoes/jackboots
	uniform = 	/obj/item/clothing/under/f13/merca
	l_hand =	/obj/item/gun/ballistic/automatic/pistol/beretta
	r_pocket = /obj/item/card/data/wpermit
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m9mmds = 2
		)


/datum/outfit/loadout/scavver
	name = "Scavver"
	backpack_contents = list(
	/obj/item/clothing/suit/armor/f13/battlecoat/vault/armoured/roadie=1,
	/obj/item/autosurgeon/toolset=1,
	/obj/item/clothing/glasses/welding=1,
	/obj/item/twohanded/fireaxe=1
	)

/datum/outfit/loadout/courier
	name = "Courier"
	backpack_contents = list(
	/obj/item/clothing/glasses/f13/biker=1,
	/obj/item/clothing/suit/armor/f13/battlecoat/vault/armoured/roadie/fast=1,
	/obj/item/clothing/shoes/jackboots=1,
	/obj/item/gun/ballistic/rifle/mag/commando=1,
	/obj/item/stack/sheet/cardboard/twenty=1,
	/obj/item/ammo_box/magazine/m45/extended = 2
	)

/datum/outfit/loadout/caravaner
	name = "Caravan Guard"
	backpack_contents = list(
	/obj/item/clothing/suit/armor/f13/battlecoat/vault/armoured/roadie=1,
	/obj/item/gun/ballistic/shotgun/lever=1,
	/obj/item/ammo_box/shotgun/slug = 2,
	/obj/item/claymore/machete/pipe/tireiron=1
	)

/* Researcher */

/datum/job/vtcc/f13researcher
	title = "Researcher"
	total_positions = 2
	spawn_positions = 1
	supervisors = "the Alderman, Chief of Development and the Overseer"
	description = "Doctor, Scientist, Roboticist, each of you under the Vault's employ stands under the title of Researcher. The Vault's servers are regularly wiped by some glitch in the system, and it's down to the Scientists to restore these data files. To be a Roboticist is to uphold a tradition in the Vault that bears itself a marred reputation, so don't lose your head. The Medical Professionals, even those who handle quarantined patients, are the clinical cornerstone of the town, so long as the price is right."

	outfit = /datum/outfit/job/vtcc/f13researcher
	exp_requirements = 3000
	exp_type = EXP_TYPE_VTCC

	loadout_options = list(
		/datum/outfit/loadout/medprof,
		/datum/outfit/loadout/robotocist,
		)

	access = list(ACCESS_VTCC, ACCESS_VTCC_RESEARCH, ACCESS_ROBOTICS)
	minimal_access = list(ACCESS_VTCC, ACCESS_VTCC_RESEARCH, ACCESS_ROBOTICS)

/datum/outfit/job/vtcc/f13researcher/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_SURGERY_MID, src)
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_CHEMWHIZ, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)

/datum/outfit/job/vtcc/f13researcher
	name = "Researcher"
	jobtype = /datum/job/vtcc/f13researcher

	ears = /obj/item/radio/headset/headset_vault/cogcity/sci
	id =            /obj/item/card/id
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	l_pocket =		/obj/item/storage/bag/money/small/vaultcity
	suit = /obj/item/clothing/suit/toggle/labcoat
	backpack_contents = list(
		/obj/item/gun/ballistic/revolver/needler=1,
		/obj/item/ammo_box/needleap = 2,
		/obj/item/reagent_containers/hypospray/medipen/f13/stimpak = 3,
		/obj/item/pda=1
		)

/datum/outfit/loadout/medprof
	name = "Medical Professional"
	backpack_contents = list(
	/obj/item/autosurgeon/surgery=1,
	/obj/item/clothing/suit/hooded/parka/medical=1,
	/obj/item/storage/firstaid/brute=1,
	/obj/item/ammo_box/needleap = 2
	)

/datum/outfit/loadout/robotocist
	name = "Roboticist"
	backpack_contents = list(
	/obj/item/autosurgeon/toolset=1,
	/obj/item/clothing/glasses/hud/diagnostic=1,
	/obj/item/clothing/under/f13/roboticistalt=1
	)

/* Innkeeper */

/datum/job/vtcc/f13innkeeper
	title = "Innkeeper"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Merchant."
	description = "Yours is a simple life, pouring pints and renting rooms out for the masses. Those hungry mouths are buying food somewhere, and it's your job to fill them with whatever food you can prepare. It's a simple life, but a rewarding one. Ownership means you have the legal rulings over your area of operations, what has been told by you for the visitors. What goes within the walls of the bar is subject to your rulings, so long as it coincides with laws and rulings made by officials and the Security forces."

	outfit = /datum/outfit/job/vtcc/f13innkeeper
	loadout_options = list(
		/datum/outfit/loadout/receptionist,
		/datum/outfit/loadout/bartender,
		//datum/outfit/loadout/chef
		)

	access = list(ACCESS_VTCC, ACCESS_VTCC_BAR)
	minimal_access = list(ACCESS_VTCC, ACCESS_VTCC_BAR)

/datum/outfit/job/vtcc/f13innkeeper/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_GENERIC, src)

/datum/outfit/job/vtcc/f13innkeeper
	name = "Innkeeper"
	jobtype = /datum/job/vtcc/f13innkeeper
	ears = /obj/item/radio/headset/headset_vault/cogcity/merch
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	r_pocket = /obj/item/pda/bar
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/bean=1,
		/obj/item/gun/ballistic/revolver/widowmaker=1,

		)

/datum/outfit/loadout/receptionist
	name = "Receptionist"
	backpack_contents = list(
	/obj/item/clipboard=1,
	/obj/item/paper_bin=1,
	/obj/item/clothing/under/suit/white_on_white/skirt=1,
	/obj/item/clothing/under/suit/white_on_white=1,
	/obj/item/clothing/shoes/f13/fancy=1
	)

/datum/outfit/loadout/bartender
	name = "Bartender"
	backpack_contents = list(
	/obj/item/clothing/under/f13/bartenderalt=1,
	/obj/item/ammo_box/shotgun/bean=1,
	/obj/item/gun/ballistic/revolver/widowmaker=1,
	/obj/item/storage/box/drinkingglasses=1
	)

/datum/outfit/loadout/chef
	name = "Chef"
	backpack_contents = list(
	/obj/item/storage/box/ingredients/fiesta=2,
	/obj/item/storage/box/ingredients/italian=2,
	/obj/item/storage/box/ingredients/american=2,
	/obj/item/clothing/neck/apron/chef=1,
	/obj/item/clothing/under/f13/westender=1,
	/obj/item/clothing/head/flatcap=1
	)

/* Inner Wall Citizen */

/datum/job/vtcc/f13innerwall
	title = "Inner Wall Citizen"
	total_positions = 6
	spawn_positions = 3
	supervisors = "the Alderman."
	description = "You may lead any one of many different lifestyles, each one vastly different to the last. As such, you're on the payroll of anyone who hires you. Or, you're striking out on your own in our concrete jungle, making a name for yourself and your business within our walls. Perhaps you're a refugee from some faraway location, on the run from a threat unknown, or a settler from some far off town, setting out for a fresh start."

	outfit = /datum/outfit/job/vtcc/f13innerwall
	loadout_options = list(
		/datum/outfit/loadout/oldsport,
		/datum/outfit/loadout/classy,
		/datum/outfit/loadout/dancer,
		//datum/outfit/loadout/fancygal,
		//datum/outfit/loadout/seamstress,
		/datum/outfit/loadout/tailor,
		/datum/outfit/loadout/secretary,
		//datum/outfit/loadout/cleaner,
		/datum/outfit/loadout/detective,
		//datum/outfit/loadout/dj
		)

	access = list(ACCESS_VTCC)
	minimal_access = list(ACCESS_VTCC)

/datum/outfit/job/vtcc/f13innerwall/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_GENERIC, src)

/datum/outfit/job/vtcc/f13innerwall
	name = "Inner Wall Citizen"
	jobtype = /datum/job/vtcc/f13innerwall

	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	r_pocket = /obj/item/card/data/wpermit
	l_pocket = /obj/item/storage/bag/money/small/vaultcity
	backpack_contents = list(
		/obj/item/pda=1
		)

/datum/outfit/loadout/oldsport
	name = "Old Sport"
	backpack_contents = list(
	/obj/item/gun/ballistic/rifle/remington=1,
	/obj/item/ammo_box/a308box=1,
	/obj/item/kitchen/knife/combat=1,
	/obj/item/clothing/under/f13/gentlesuit=1,
	/obj/item/clothing/shoes/f13/fancy=1,
	/obj/item/clothing/head/f13/trilby=1
	)

/datum/outfit/loadout/classy
	name = "Classy"
	backpack_contents = list(
	/obj/item/clothing/under/f13/spring=1,
	/obj/item/clothing/under/dress/skirt/swept=1,
	/obj/item/stack/f13Cash/caps = 100,
	/obj/item/clothing/shoes/laceup=1,
	/obj/item/gun/ballistic/revolver/police=1
	)

/datum/outfit/loadout/dancer
	name = "Dancer"
	backpack_contents = list(
	/obj/item/stack/f13Cash/caps = 20,
	/obj/item/clothing/under/singery=1,
	/obj/item/clothing/shoes/singery=1,
	/obj/item/gun/ballistic/revolver/colt6520=1
	)

/*/datum/outfit/loadout/fancygal
	name = "Fancy Gal"
	backpack_contents = list(
	/obj/item/clothing/under/dress/skirt/swept,
	/obj/item/clothing/shoes/laceup,
	/obj/item/stack/f13Cash/caps = 100
	)

/datum/outfit/loadout/seamstress
	name = "Seamstress"
	backpack_contents = list(
	/obj/item/stack/sheet/cloth = 10,
	/obj/item/clothing/shoes/sneakers/red,
	/obj/item/clothing/under/dress/westernbustle,
	/obj/item/stack/f13Cash/caps = 100
	)*/

/datum/outfit/loadout/tailor
	name = "Tailor"
	backpack_contents = list(
	/obj/item/stack/sheet/cloth = 10,
	/obj/item/clothing/shoes/sneakers/black=1,
	/obj/item/clothing/under/suit/burgundy=1,
	/obj/item/clothing/shoes/sneakers/red=1,
	/obj/item/clothing/under/dress/westernbustle=1,
	/obj/item/stack/f13Cash/caps = 100
	)

/datum/outfit/loadout/secretary
	name = "Secretary"
	backpack_contents = list(
	/obj/item/clipboard=1,
	/obj/item/paper_bin=1,
	/obj/item/pda=1,
	/obj/item/clothing/under/suit/black=1,
	/obj/item/clothing/shoes/f13/fancy=1
	)

/datum/outfit/loadout/cleaner
	name = "Cleaner"
	backpack_contents = list(
	/obj/item/clothing/shoes/galoshes,
	/obj/item/clothing/gloves/f13/leather,
	/obj/item/mop,
	/obj/item/reagent_containers/glass/bucket,
	/obj/item/stack/f13Cash/caps = 200
	)


/datum/outfit/loadout/detective
	name = "Detective"
	backpack_contents = list(
	/obj/item/storage/briefcase=1,
	/obj/item/taperecorder=1,
	/obj/item/tape=1,
	/obj/item/clothing/under/f13/bodyguard=1,
	/obj/item/clothing/shoes/winterboots=1,
	/obj/item/gun/ballistic/revolver/m29=1,
	/obj/item/lighter=1,
	/obj/item/storage/fancy/cigarettes/cigars/havana=1
	)

/datum/outfit/loadout/dj
	name = "Professional Disc Jockey"
	backpack_contents = list(
	/obj/item/taperecorder,
	/obj/item/tape = 3,
	/obj/item/megaphone
	)

/* Outer Wall Citizen */

/datum/job/vtcc/f13outerwall
	title = "Outer Wall Citizen"
	total_positions = 8
	spawn_positions = 3
	supervisors = "the Alderman."
	description = "You may lead any one of many different lifestyles, each one vastly different to the last. As such, you're on the payroll of anyone who hires you. Or, you're striking out on your own in our concrete jungle, making a name for yourself and your business within our walls. Perhaps you're a refugee from some faraway location, on the run from a threat unknown, or a settler from some far off town, setting out for a fresh start."

	outfit = /datum/outfit/job/vtcc/f13outerwall
	loadout_options = list(
		/datum/outfit/loadout/scavenger,
		/datum/outfit/loadout/refugee,
		/datum/outfit/loadout/addict,
		//datum/outfit/loadout/freezer,
		/datum/outfit/loadout/punk,
		/datum/outfit/loadout/hired,
		//datum/outfit/loadout/prize
		)

	access = list(ACCESS_VTCC)
	minimal_access = list(ACCESS_VTCC)

/datum/outfit/job/vtcc/f13outerwall/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_GENERIC, src)

/datum/outfit/job/vtcc/f13outerwall
	name = "Outer Wall Citizen"
	jobtype = /datum/job/vtcc/f13outerwall

	uniform = /obj/item/clothing/under/f13/brahminm
	shoes = /obj/item/clothing/shoes/workboots
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	r_hand = /obj/item/book/granter/trait/selection/waster

/datum/outfit/loadout/scavenger
	name = "Scavenger"
	backpack_contents = list(
	/obj/item/clothing/suit/armor/f13/leather_jacket=1,
	/obj/item/clothing/neck/mantle/gray=1,
	/obj/item/gun/ballistic/automatic/pistol/n99=1,
	/obj/item/ammo_box/magazine/m10mm=1,
	/obj/item/clothing/glasses/welding=1,
	/obj/item/twohanded/fireaxe=1,
	/obj/item/weldingtool/largetank=1,
	/obj/item/book/granter/trait/techno=1
	)

/datum/outfit/loadout/refugee
	name = "Refugee"
	backpack_contents = list(
	/obj/item/clothing/suit/armor/f13/brahmin_leather_duster=1,
	/obj/item/claymore/machete/pipe/tireiron=1,
	/obj/item/shield/riot/buckler=1,
	/obj/item/gun/ballistic/automatic/pistol/m1911=1,
	/obj/item/ammo_box/magazine/m45=1,
	/obj/item/clothing/shoes/workboots/mining=1,
	/obj/item/clothing/glasses/f13/biker=1,
	/obj/item/clothing/mask/ncr_facewrap=1
	)

/datum/outfit/loadout/addict
	name = "Addict"
	backpack_contents = list(
	/obj/item/reagent_containers/hypospray/medipen/f13/medx=1,
	/obj/item/reagent_containers/pill/f13/buffout = 2,
	/obj/item/reagent_containers/pill/lsd = 2,
	/obj/item/reagent_containers/pill/patch/f13/jet = 2,
	/obj/item/clothing/shoes/f13/raidertreads=1
	)


/datum/outfit/loadout/punk
	name = "Punk"
	backpack_contents = list(
	/obj/item/storage/fancy/cigarettes/cigpack_midori=1,
	/obj/item/clothing/under/pants/denimskirt=1,
	/obj/item/clothing/under/pants/jeanripped=1,
	/obj/item/lighter/greyscale=1,
	/obj/item/clothing/shoes/f13/diesel=1,
	/obj/item/clothing/shoes/f13/diesel/alt=1,
	/obj/item/clothing/suit/vickyblack=1,
	/obj/item/clothing/head/beanie/black=1
	)

/datum/outfit/loadout/hired
	name = "Hired Muscle"
	backpack_contents = list(
	/obj/item/twohanded/baseball/spiked=1,
	/obj/item/clothing/under/pants/blackjeans=1,
	/obj/item/clothing/shoes/f13/military/oldcombat=1,
	/obj/item/clothing/mask/bandana/black=1
	)

/*/datum/outfit/loadout/prize
	name = "Prize Fighter"
	backpack_contents = list(

	)
*/
