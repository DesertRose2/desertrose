/datum/job/vtcc //do NOT use this for anything, it's just to store faction datums
	department_flag = VTCC
	selection_color = "#ADD8E6"
	faction = "VTCC"
	exp_type = EXP_TYPE_VTCC
	access = list(ACCESS_BAR, ACCESS_GATEWAY, ACCESS_VAULT_F13)
	minimal_access = list(ACCESS_BAR, ACCESS_GATEWAY, ACCESS_VAULT_F13)

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
	flag = F13ALDERMAN
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Overseer"
	description = "A subordinate of the Overseer of the Vaults and Cities, you are the primary face of the town. Handling the day to day dealings of the denizens of our fair city falls to you. Those wasters outside the walls are an unknown factor, so it falls to you to maintain relations with the Wastelands many players. Be wary of the Machine down below, as with the trades and treaties in place. Balance the budget, but don't step on the Merchant's toes. Organise defences, but do not encroach on the Marshal's office. Most of all: don't lose your head."

	outfit = /datum/outfit/job/vtcc/f13alderman
	loadout_options = list(
		/datum/outfit/loadout/treasurer,
		/datum/outfit/loadout/baron,
		/datum/outfit/loadout/eldervaultie
		)

	access = list(ACCESS_BAR, ACCESS_CLONING, ACCESS_VAULT_F13, ACCESS_GATEWAY, ACCESS_CARGO_BOT, ACCESS_MINT_VAULT, ACCESS_CLINIC, ACCESS_KITCHEN, ACCESS_MINING, ACCESS_FORENSICS_LOCKERS)
	minimal_access = list(ACCESS_BAR, ACCESS_CLONING, ACCESS_GATEWAY, ACCESS_VAULT_F13, ACCESS_CARGO_BOT, ACCESS_MINT_VAULT, ACCESS_KITCHEN, ACCESS_CLINIC, ACCESS_MINING, ACCESS_FORENSICS_LOCKERS)

/datum/outfit/job/vtcc/f13alderman/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_GENERIC, src)

/datum/outfit/job/vtcc/f13alderman
	name = "Alderman"
	jobtype = /datum/job/vtcc/f13alderman
	ears = /obj/item/radio/headset/headset_vault/cogcity/overseer
	id =            /obj/item/card/id/silver
	r_pocket = /obj/item/reagent_containers/hypospray/medipen/stimpak/super
	belt = /obj/item/gun/ballistic/automatic/pistol/n99/executive
	backpack_contents = list(
		/obj/item/storage/box/citizenship_permits = 1, \
		/obj/item/ammo_box/magazine/m10mm/ap = 2)

/datum/outfit/loadout/treasurer
	name = "Treasurer"
	backpack_contents = list(
	/obj/item/pen/fountain/captain=1,
	/obj/item/paper_bin=1,
	/obj/item/stack/f13Cash/caps/fivezerozero=1)

/datum/outfit/loadout/baron
	name = "Baron"
	backpack_contents = list(
	/obj/item/gun/ballistic/shotgun/lasmusket=1,
	/obj/item/clothing/suit/hooded/cloak/desert/raven_cloak=1,
	/obj/item/ammo_box/lasmusket = 2)

/datum/outfit/loadout/eldervaultie
	name = "Elder Vaultie"
	backpack_contents = list(
	/obj/item/clothing/suit/armor/vest=1,
	/obj/item/pda=1,
	/obj/item/melee/baton=1)

/* Marshal */

/datum/job/vtcc/f13marshal
	title = "Marshal"
	flag = F13MARSHAL
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Alderman, High Marshals and Overseer"
	description = "As the head of the security forces, you are the face of justice in the town. Uphold the law, or bend it to suit your needs, you set the precedent for how justice is doled out in the town, so bear that in mind when you sentence that pickpocket to death. Maintain the armoury and keep that watchful eye on the elevator to the Vault below. Whatever you do, don't lose your head."

	outfit = /datum/outfit/job/vtcc/f13marshal
	loadout_options = list(
		/datum/outfit/loadout/secchief,
		/datum/outfit/loadout/gunslinger,
		/datum/outfit/loadout/peacekeeper
		)

	access = list(ACCESS_BAR, ACCESS_CLONING, ACCESS_GATEWAY, ACCESS_VAULT_F13, ACCESS_CARGO_BOT, ACCESS_MINT_VAULT, ACCESS_CLINIC, ACCESS_KITCHEN, ACCESS_MINING, ACCESS_FORENSICS_LOCKERS)
	minimal_access = list(ACCESS_BAR, ACCESS_CLONING, ACCESS_GATEWAY, ACCESS_VAULT_F13, ACCESS_CARGO_BOT, ACCESS_MINT_VAULT, ACCESS_KITCHEN, ACCESS_CLINIC, ACCESS_MINING, ACCESS_FORENSICS_LOCKERS)

/datum/outfit/job/vtcc/f13marshal/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_PA_WEAR, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)

/datum/outfit/job/vtcc/f13marshal
	name = "Marshal"
	jobtype = /datum/job/vtcc/f13marshal

	ears = /obj/item/radio/headset/headset_vault/cogcity/sec
	id =            /obj/item/card/id/silver
	backpack = /obj/item/storage/backpack/satchel/explorer
	ears = /obj/item/radio/headset/headset_vault/cogcity/sec_lead
	satchel = /obj/item/storage/backpack/satchel/explorer
	r_pocket = /obj/item/reagent_containers/hypospray/medipen/stimpak/super
	belt = /obj/item/gun/ballistic/revolver/lucky37
	suit = /obj/item/clothing/suit/armor/f13/riot/vault
	head = /obj/item/clothing/head/helmet/riot/vaultsec/vc
	backpack_contents = list(
		/obj/item/restraints/handcuffs = 1,
		/obj/item/ammo_box/a357/ap = 2,
		/obj/item/pda/warden=1
		)

/datum/outfit/loadout/secchief
	name = "Chief of Security"
	backpack_contents = list(
	/obj/item/clothing/under/rank/security/officer=1,
	/obj/item/storage/belt/security/full=1,
	/obj/item/stack/f13Cash/caps/fivezerozero=1)

/datum/outfit/loadout/gunslinger
	name = "Gunslinger"
	backpack_contents = list(
	/obj/item/gun/ballistic/revolver/m29=1,
	/obj/item/ammo_box/m44 = 2,
	/obj/item/clothing/suit/armor/f13/battlecoat/vault/marshal=1,
	/obj/item/clothing/head/f13/cowboy=1)

/datum/outfit/loadout/peacekeeper
	name = "Peacekeeper"
	backpack_contents = list(
	/obj/item/clothing/suit/armor/f13/power_armor/vaulttec=1,
	/obj/item/pda=1,
	/obj/item/clothing/head/helmet/f13/power_armor/vaulttec=1)

/* Merchant */

/datum/job/vtcc/f13merchant
	title = "Merchant"
	flag = F13MERCHANT
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Alderman and the Overseer"
	description = "Trade deals fall upon your shoulders to negotiate with those around the town, so ensure you never give more than you've got. Of course, selling the town is the worst thing you could do, so it should go without saying that you can't do that. Negotiate with the traders of the wastes, extort them for the shirt on their back, or set them up for life, it's up to you to decide. Just don't lose your head."
	exp_requirements = 1500
	exp_type = EXP_TYPE_OUTER
	outfit = /datum/outfit/job/vtcc/f13merchant
	loadout_options = list(
		/datum/outfit/loadout/blacksmith,
		/datum/outfit/loadout/armsdealer,
		/datum/outfit/loadout/sommelier,
		)

	access = list(ACCESS_BAR, ACCESS_CARGO_BOT, ACCESS_MINT_VAULT, ACCESS_VAULT_F13)
	minimal_access = list(ACCESS_BAR, ACCESS_CARGO_BOT, ACCESS_MINT_VAULT, ACCESS_VAULT_F13)

/datum/outfit/job/vtcc/f13merchant/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_GENERIC, src)

/datum/outfit/job/vtcc/f13merchant
	name = "Merchant"
	jobtype = /datum/job/vtcc/f13merchant
	ears = /obj/item/radio/headset/headset_vault/cogcity/merch_lead
	id =            /obj/item/card/id/silver
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	l_pocket = /obj/item/storage/bag/money/small/settler
	r_pocket = /obj/item/pda/quartermaster
	shoes = 		/obj/item/clothing/shoes/f13/fancy
	uniform = /obj/item/clothing/under/f13/cowboyg
	gloves = /obj/item/clothing/gloves/f13/leather/fingerless
	backpack_contents = list(
		/obj/item/stack/f13Cash/caps/fivezerozero=1
		)

/datum/outfit/loadout/blacksmith
	name = "Blacksmith"
	backpack_contents = list(
	/obj/item/clothing/gloves/f13/blacksmith=1,
	/obj/item/melee/smith/hammer/toolbox=1,
	/obj/item/stack/sheet/mineral/sandstone = 37,
	/obj/item/stack/sheet/metal/twenty=1
	)

/datum/outfit/loadout/armsdealer
	name = "Arms Dealer"
	backpack_contents = list(
	/obj/item/gun/ballistic/automatic/pistol/ninemil = 7,
	/obj/item/gun/ballistic/automatic/pistol/n99 = 4,
	/obj/item/gun/ballistic/revolver/police =4
	)

/datum/outfit/loadout/sommelier
	name = "Sommelier"
	backpack_contents = list(
	/obj/item/reagent_containers/food/drinks/bottle/wine = 2,
	/obj/item/reagent_containers/food/drinks/bottle/lizardwine = 2,
	/obj/item/export/bottle/wine = 5,
	/obj/item/export/bottle/blooddrop = 2,
	/obj/item/reagent_containers/food/drinks/bottle/champagne = 2,
	/obj/item/reagent_containers/food/drinks/bottle/trappist = 2
	)

/* Chief Researcher */

/datum/job/vtcc/f13chresearcher
	title = "Chief Researcher"
	flag = F13CHRESEARCHER
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Alderman and the Overseer"
	description = "Doctor, Scientist, Roboticist, each of you under the Vault's employ stands under the title of Researcher. The Vault's servers are regularly wiped by some glitch in the system, and it's down to the Scientists to restore these data files. To be a Roboticist is to uphold a tradition in the Vault that bears itself a marred reputation, so don't lose your head. The Medical Professionals, even those who handle quarantined patients, are the clinical cornerstone of the town, so long as the price is right."

	outfit = /datum/outfit/job/vtcc/f13chresearcher
	loadout_options = list(
		/datum/outfit/loadout/qadmin,
		/datum/outfit/loadout/neurosurgeon,
		)

	access = list(ACCESS_MEDICAL, ACCESS_MORGUE, ACCESS_VAULT_F13, ACCESS_SURGERY, ACCESS_CHEMISTRY, ACCESS_MINERAL_STOREROOM, ACCESS_ROBOTICS, ACCESS_RESEARCH, ACCESS_MINERAL_STOREROOM, ACCESS_TECH_STORAGE)
	minimal_access = list(ACCESS_MEDICAL, ACCESS_MORGUE, ACCESS_VAULT_F13, ACCESS_SURGERY, ACCESS_CHEMISTRY, ACCESS_MINERAL_STOREROOM, ACCESS_ROBOTICS, ACCESS_RESEARCH, ACCESS_MINERAL_STOREROOM, ACCESS_TECH_STORAGE)


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
	r_pocket = /obj/item/clipboard
	suit = /obj/item/clothing/suit/toggle/labcoat
	backpack_contents = list(
		/obj/item/pen/fountain=1,
		/obj/item/paper_bin=1,
		/obj/item/gun/ballistic/revolver/needler=1,
		/obj/item/ammo_box/needleap = 2,
		/obj/item/reagent_containers/hypospray/medipen/stimpak/super = 3
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
	)

/* Town Sec */

/datum/job/vtcc/f13townsec
	title = "Town Security Officer"
	flag = F13TOWNSEC
	total_positions = 5
	spawn_positions = 1
	supervisors = "the Alderman and Marshal."
	description = "Day or night, you watch the walls with diligence. The wastes outside are lawless, but that's not your problem until they drag it with them, inside the outer ring. There, you dispense justice with an iron fist, dragging those that would break laws penned by the Overseers to serve their sentences by any means necessary. The citizens of the inner ring are rarely a concern and should get off lighter than their counterparts in the outer ring."
	exp_requirements = 1500
	exp_type = EXP_TYPE_INNER
	outfit = /datum/outfit/job/vtcc/f13townsec
	loadout_options = list(
		/datum/outfit/loadout/musketeer,
		/datum/outfit/loadout/oldguard,
		/datum/outfit/loadout/riotpolice
		)
	access = list(ACCESS_BAR, ACCESS_GATEWAY, ACCESS_VAULT_F13)
	minimal_access = list(ACCESS_BAR, ACCESS_GATEWAY, ACCESS_VAULT_F13)

/datum/outfit/job/vtcc/f13townsec/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_GENERIC, src)

/datum/outfit/job/vtcc/f13townsec
	name = "Town Security Officer"
	jobtype = /datum/job/vtcc/f13townsec
	ears = /obj/item/radio/headset/headset_vault/cogcity/sec
	id =            /obj/item/card/id
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	l_hand =	/obj/item/gun/ballistic/automatic/pistol/beretta
	shoes = 		/obj/item/clothing/shoes/jackboots
	suit = /obj/item/clothing/suit/armor/f13/riot/vault
	head = /obj/item/clothing/head/helmet/riot/vaultsec/vc
	backpack_contents = list(
		/obj/item/restraints/handcuffs = 1,
		/obj/item/geiger_counter=1,
		/obj/item/stock_parts/cell/ammo/ec = 1
		)

/datum/outfit/loadout/musketeer
	name = "Musketeer"
	backpack_contents = list(
	/obj/item/gun/energy/laser/aer9=1,
	/obj/item/clothing/head/f13/cowboy=1,
	/obj/item/stock_parts/cell/ammo/mfc=2,
	/obj/item/clothing/suit/armor/f13/brahmin_leather_duster=1
	)

/datum/outfit/loadout/oldguard
	name = "Old Guard"
	backpack_contents = list(
	/obj/item/clothing/under/f13/vault/vcity=1,
	/obj/item/gun/ballistic/automatic/smg10mm=1,
	/obj/item/pda/security=1,
	/obj/item/ammo_box/magazine/m10mm_adv/ext = 2
	)

/datum/outfit/loadout/riotpolice
	name = "Riot Cop"
	backpack_contents = list(
	/obj/item/gun/ballistic/shotgun/automatic/combat/neostead=1,
	/obj/item/ammo_box/shotgun/bean = 2,
	/obj/item/ammo_box/shotgun/magnum = 2,
	/obj/item/shield/riot/tele=1
	)

/* Roadie */

/datum/job/vtcc/f13roadie
	title = "Roadie"
	flag = F13ROADIE
	total_positions = 4
	spawn_positions = 1
	supervisors = "the Merchant."
	description = "Operate the shop when the Merchant's asleep or just isn't there, push and pull those crates to and fro like your life depends on it (and when your paycheck is based on performance, well, it certainly does). If there are no crates to pick up, head out into the wastes and start scavenging for anything you could sell at an extortionate price."
	exp_requirements = 900
	exp_type = EXP_TYPE_INNER
	outfit = /datum/outfit/job/vtcc/f13roadie
	loadout_options = list(
		/datum/outfit/loadout/scavver,
		/datum/outfit/loadout/courier,
		/datum/outfit/loadout/caravaner
		)

	access = list(ACCESS_BAR, ACCESS_KITCHEN, ACCESS_VAULT_F13, ACCESS_CARGO)
	minimal_access = list(ACCESS_BAR, ACCESS_KITCHEN, ACCESS_VAULT_F13, ACCESS_CARGO, ACCESS_MINING)

/datum/outfit/job/vtcc/f13roadie/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_TRAPPER, src)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)

/datum/outfit/job/vtcc/f13roadie
	name = "Roadie"
	jobtype = /datum/job/vtcc/f13roadie
	neck = /obj/item/radio/headset/headset_vault/cogcity/merch
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	l_hand =	/obj/item/gun/ballistic/automatic/pistol/beretta
	shoes = 		/obj/item/clothing/shoes/jackboots
	uniform = /obj/item/clothing/under/f13/merca
	suit = /obj/item/clothing/suit/armor/f13/battlecoat/vault/armoured/roadie
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m9mmds = 2
		)

/datum/outfit/loadout/scavver
	name = "Scavver"
	backpack_contents = list(
	/obj/item/autosurgeon/toolset=1,
	/obj/item/clothing/glasses/welding=1,
	/obj/item/twohanded/fireaxe=1
	)

/datum/outfit/loadout/courier
	name = "Courier"
	backpack_contents = list(
	/obj/item/clothing/glasses/f13/biker=1,
	/obj/item/clothing/shoes/jackboots/fast=1,
	/obj/item/gun/ballistic/automatic/commando=1,
	/obj/item/stack/sheet/cardboard/twenty=1,
	/obj/item/ammo_box/magazine/greasegun = 2
	)

/datum/outfit/loadout/caravaner
	name = "Caravan Guard"
	backpack_contents = list(
	/obj/item/gun/ballistic/shotgun/lever=1,
	/obj/item/ammo_box/shotgun/slug = 2,
	/obj/item/claymore/machete/pipe/tireiron=1
	)

/* Researcher */

/datum/job/vtcc/f13researcher
	title = "Researcher"
	flag = F13RESEARCHER
	total_positions = 2
	spawn_positions = 1
	supervisors = "the Alderman and the Overseer"
	description = "Doctor, Scientist, Roboticist, each of you under the Vault's employ stands under the title of Researcher. The Vault's servers are regularly wiped by some glitch in the system, and it's down to the Scientists to restore these data files. To be a Roboticist is to uphold a tradition in the Vault that bears itself a marred reputation, so don't lose your head. The Medical Professionals, even those who handle quarantined patients, are the clinical cornerstone of the town, so long as the price is right."
	exp_requirements = 3000
	exp_type = EXP_TYPE_INNER
	outfit = /datum/outfit/job/vtcc/f13researcher
	loadout_options = list(
		/datum/outfit/loadout/medprof,
		/datum/outfit/loadout/robotocist,
		)

	access = list(ACCESS_MEDICAL, ACCESS_MORGUE, ACCESS_VAULT_F13, ACCESS_SURGERY, ACCESS_CHEMISTRY, ACCESS_MINERAL_STOREROOM, ACCESS_ROBOTICS, ACCESS_RESEARCH, ACCESS_MINERAL_STOREROOM, ACCESS_TECH_STORAGE)
	minimal_access = list(ACCESS_MEDICAL, ACCESS_MORGUE, ACCESS_VAULT_F13, ACCESS_SURGERY, ACCESS_CHEMISTRY, ACCESS_MINERAL_STOREROOM, ACCESS_ROBOTICS, ACCESS_RESEARCH, ACCESS_MINERAL_STOREROOM, ACCESS_TECH_STORAGE)

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
	suit = /obj/item/clothing/suit/toggle/labcoat
	backpack_contents = list(
		/obj/item/gun/ballistic/revolver/needler=1,
		/obj/item/ammo_box/needleap = 2,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 3
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

/* Hoistway Preacher */

/datum/job/vtcc/f13hoistway
	title = "Hoistway Preacher"
	flag = F13HOISTWAY
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Alderman and the Deus Ex Machina."
	description = "You hear It's myriad demands and must work to fulfil them, by any means necessary. The more you convert to join the Hoistway, the more who serve Its divine will, the easier these tasks will be. The spiritual health of man, mutant and machine is your priority, for those healthy in mind are those who can greatly serve their betters. And the only one better is It."
	exp_requirements = 1500
	exp_type = EXP_TYPE_INNER
	outfit = /datum/outfit/job/vtcc/f13hoistway
	loadout_options = list(
		/datum/outfit/loadout/techwhisperer,
		/datum/outfit/loadout/engineer
		)

/datum/outfit/job/vtcc/f13hoistway/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)

/datum/outfit/job/vtcc/f13hoistway
	name = "Hoistway Preacher"
	jobtype = /datum/job/vtcc/f13hoistway
	ears = /obj/item/radio/headset/headset_vault/cogcity/priest
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	r_pocket = /obj/item/lighter/fusion
	suit = /obj/item/clothing/suit/armor/f13/battlecoat/vault/armoured
	backpack_contents = list(
		/obj/item/book/manual/ripley_build_and_repair=1,
		/obj/item/bodypart/l_arm/robot=1,
		/obj/item/bodypart/r_arm/robot=1,
		/obj/item/bodypart/l_leg/robot=1,
		/obj/item/bodypart/r_leg/robot=1
		)

/datum/outfit/loadout/engineer
	name = "Engineer"
	backpack_contents = list(
	/obj/item/autosurgeon/toolset=1
	)

/datum/outfit/loadout/techwhisperer
	name = "Tech Whisperer"
	backpack_contents = list(
	/obj/item/storage/fancy/candle_box=1
	)

/* Innkeeper */

/datum/job/vtcc/f13innkeeper
	title = "Innkeeper"
	flag = F13INNKEEPER
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

	access = list(ACCESS_BAR, ACCESS_KITCHEN)
	minimal_access = list(ACCESS_BAR, ACCESS_KITCHEN)

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

/* Inner Wall Citizen */

/datum/job/vtcc/f13innerwall
	title = "Inner Wall Citizen"
	flag = F13INNERWALL
	total_positions = 5
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

/datum/outfit/loadout/oldsport
	name = "Old Sport"
	backpack_contents = list(
	/obj/item/gun/ballistic/shotgun/remington=1,
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
	/obj/item/gun/ballistic/revolver/detective=1
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

/*/datum/outfit/loadout/cleaner
	name = "Cleaner"
	backpack_contents = list(
	/obj/item/clothing/shoes/galoshes,
	/obj/item/clothing/gloves/f13/leather,
	/obj/item/mop,
	/obj/item/reagent_containers/glass/bucket,
	/obj/item/stack/f13Cash/caps = 200
	)*/


/datum/outfit/loadout/detective
	name = "Detective"
	backpack_contents = list(
	/obj/item/storage/briefcase=1,
	/obj/item/taperecorder=1,
	/obj/item/tape=1,
	/obj/item/clothing/under/f13/bodyguard=1,
	/obj/item/clothing/shoes/winterboots=1,
	/obj/item/gun/ballistic/revolver/detective=1,
	/obj/item/lighter=1,
	/obj/item/storage/fancy/cigarettes/cigars/havana=1
	)

/*/datum/outfit/loadout/dj
	name = "Professional Disc Jockey"
	backpack_contents = list(
	/obj/item/taperecorder,
	/obj/item/tape = 3,
	/obj/item/megaphone
	)*/

/* Outer Wall Citizen */

/datum/job/vtcc/f13outerwall
	title = "Outer Wall Citizen"
	flag = F13OUTERWALL
	total_positions = 5
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
	r_hand = /obj/item/book/granter/trait/selection

/datum/outfit/loadout/scavenger
	name = "Scavenger"
	backpack_contents = list(
	/obj/item/clothing/suit/armor/f13/leather_jacket=1,
	/obj/item/clothing/neck/cloak/grey=1,
	/obj/item/gun/ballistic/automatic/pistol/n99=1,
	/obj/item/ammo_box/magazine/m10mm=1,
	/obj/item/clothing/glasses/welding=1,
	/obj/item/twohanded/fireaxe=1,
	/obj/item/weldingtool/largetank=1
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
	/obj/item/reagent_containers/pill/patch/medx=1,
	/obj/item/reagent_containers/pill/buffout = 2,
	/obj/item/reagent_containers/pill/lsd = 2,
	/obj/item/reagent_containers/pill/patch/jet = 2,
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