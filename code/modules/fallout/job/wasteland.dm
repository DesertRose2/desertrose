/datum/job/wasteland

/*
Coven Stuff
*/

/datum/job/wasteland/covenwitch
	title = "Coven Witch"
	faction = "Coven"
	total_positions = 0
	spawn_positions = 0
	description = "You are a Witch of the Iron Coven. As the Witch you answer directly to the Exalted and the Matriarchs. The commanding officer in this region is a Matriarch by the name of The Harbinger. Circumstances may change the identity of the local commanding officer, but you will forevermore answer to the bidding of any and all Matriarchs. You are the equivilent of a Brotherhood Knight in rank, but your role has changed in the century since your people betrayed the Brotherhood of Steel. Witches are the primary military force of your organization. From far away to the east, in Dallas, New Orleans, and the sprawling metropolis that is Miami, you have come to do the bidding of the Grand Matriarch, your holy leader. She orders that the people of this region, like any other, be subjugated to her will. Your job is to organize missions to subvert the power of the local factions, spread scripture, protect and recruit citizens, and disperse technology to the people. The Matriarchs of the Coven have given you the permission to recruit and command your own squad, given that they eventually submit to the Iron Church's FEV treatment. You spread the scripture of the Iron Codex, you distribute technology to the masses and though you are in open war with the people of this area, it is your sworn duty to preserve all life in the name of fulfilling the Prophecy. All lives lost are a tragedy. In the eyes of your superiors, all deserve a chance to bask in the shadow of the Void."
	forbids = ""
	enforces = ""
	supervisors = "Exalted and the Matriarchs."
	selection_color = "#95a5a6"

	outfit = /datum/outfit/job/wasteland/covenwitch

/datum/outfit/job/wasteland/covenwitch
	name = "Coven Witch"
	jobtype = /datum/job/wasteland/covenwitch
	backpack = /obj/item/storage/backpack/satchel/leather
	ears = 			/obj/item/radio/headset/headset_sci
	glasses = 		/obj/item/clothing/glasses/night
	mask = 			/obj/item/clothing/mask/gas/syndicate
	uniform =		/obj/item/clothing/under/syndicate/combat
	suit = 			/obj/item/clothing/suit/hooded/cloak/goliath
	belt = 			/obj/item/storage/belt/military/army
	shoes = 		/obj/item/clothing/shoes/plate/red
	gloves = 		/obj/item/clothing/gloves/plate/red
	id = 			/obj/item/card/id/syndicate/anyone
	l_hand =		/obj/item/nullrod/claymore/darkblade
	suit_store =  	/obj/item/gun/ballistic/automatic/pistol/suppressed

	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/f13/stimpak=2,
		/obj/item/flashlight/flare/culttorch=1,
		/obj/item/grenade/flashbang=1,
		/obj/item/pda=1,
		/obj/item/reagent_containers/glass/bottle/FEV_solution=1
		)
/*
Great Khans
*/
/datum/job/wasteland/f13genghis
	title = "Genghis Khan"
	department_head = list("Captain")
	head_announce = list("Security")
	faction = "Wastelander"
	total_positions = 1
	spawn_positions = 1
	description = "You are the Genghis Khan. One of the Sonoran Khan gang Leaders. You've put your time in and have shown you're not an idiot and can be trusted. You can lead, you understand how things are around here, you're not some run of the mill Khan hustling for pocket change and pussy.. You've earned your strips. You put blood down for the Khans. Your job is to keep your family safe, LEAD them and show them how we roll. Show them what it means to be a fucking Khan."
	supervisors = "Your pride"
	selection_color = "#f86a29"
	req_admin_notify = 1

	outfit = /datum/outfit/job/wasteland/f13genghis

	access = list(ACCESS_KHAN)
	minimal_access = list(ACCESS_KHAN)

	loadout_options = list(
	/datum/outfit/loadout/classic,
	/datum/outfit/loadout/marksman
	)

/datum/outfit/job/wasteland/f13genghis/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_CHEM_USER, src)
	ADD_TRAIT(H, TRAIT_CHEMWHIZ, src)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/khanbatarmor)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/reinforcedkhanbatarmor)

/datum/outfit/job/wasteland/f13genghis
	name = "Genghis Khan"
	jobtype = /datum/job/wasteland/f13genghis
	id = 		/obj/item/card/id/khantattoo
	ears = 		/obj/item/radio/headset/headset_khans
	belt = 		/obj/item/claymore/machete/reinforced
	backpack =	/obj/item/storage/backpack/satchel/explorer
	satchel = 	/obj/item/storage/backpack/satchel/explorer
	uniform = /obj/item/clothing/under/f13/khan

/datum/outfit/job/wasteland/f13genghis/pre_equip(mob/living/carbon/human/H)
	..()
	r_hand = /obj/item/book/granter/trait/selection
	r_pocket = /obj/item/flashlight/flare
	l_pocket = /obj/item/storage/bag/money/small/khan
	backpack_contents = list(
		/obj/item/restraints/handcuffs=1, \
		/obj/item/restraints/legcuffs/bola=1, \
		/obj/item/reagent_containers/pill/patch/f13/jet=2, \
		/obj/item/reagent_containers/hypospray/medipen/f13/medx=1, \
		/obj/item/reagent_containers/hypospray/medipen/f13/stimpak=1)
	suit = /obj/item/clothing/suit/toggle/labcoat/f13/khan/battlecoat
	head = /obj/item/clothing/head/helmet/f13/khan/fullhelm
	shoes = /obj/item/clothing/shoes/f13/military/plated

/datum/outfit/job/wasteland/f13genghis/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	if(!H.gang)
		var/datum/gang/greatkhans/GK = GLOB.greatkhans
		GLOB.all_gangs |= GK
		GK.add_member(H)
		H.gang = GK

/datum/outfit/loadout/classic
	name = "Classic"
	l_hand = /obj/item/gun/ballistic/automatic/pistol/pistol127
	r_hand = /obj/item/gun/ballistic/automatic/smg/greasegun
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m127mm=2,
		/obj/item/ammo_box/magazine/greasegun = 1)

/datum/outfit/loadout/marksman
	name = "Marksman"
	l_hand =	/obj/item/gun/ballistic/automatic/marksman/sniper
	backpack_contents = list(
		/obj/item/ammo_box/magazine/w308=2,
		/obj/item/gun/ballistic/automatic/pistol/n99=1,)

/datum/outfit/loadout/runner
	name = "Runner"
	l_hand =	/obj/item/gun/ballistic/automatic/type93
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m556/rifle=2,
		)

/datum/job/wasteland/f13pusher
	title = "Great Khan"
	department_head = list("Captain")
	head_announce = list("Security")
	faction = "Wastelander"
	total_positions = 5
	spawn_positions = 5
	description = "You are no common raider or tribal settler, for you are a Great Khan. Your ancestry is that of fierce warriors and noble chieftans, whose rites and sagas tell of blood soaked battlefields and great sacrifice for your tribe. At least, this was once the case: after the massacre at Bitter Springs by the NCR, your people have lost much of their strength - now you and many other Khans travel west of Vegas through Red Rock Canyon in the hopes of settling in the region of Yuma."
	supervisors = "your gang leadership"
	selection_color = "#ff915e"
	exp_requirements = 1800
	exp_type = EXP_TYPE_WASTELAND

	outfit = /datum/outfit/job/wasteland/f13pusher

	access = list(ACCESS_KHAN)
	minimal_access = list(ACCESS_KHAN)

	loadout_options = list(
	///datum/outfit/loadout/pusher,
	/datum/outfit/loadout/enforcer,
	/datum/outfit/loadout/brawler)

/datum/outfit/job/wasteland/f13pusher/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_CHEM_USER, src)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/khanbatarmor)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/reinforcedkhanbatarmor)

	if(!H.gang)
		var/datum/gang/greatkhans/GK = GLOB.greatkhans
		GLOB.all_gangs |= GK
		GK.add_member(H)
		H.gang = GK

/datum/outfit/job/wasteland/f13pusher
	name = "Great Khan"
	jobtype = /datum/job/wasteland/f13pusher
	id = 		/obj/item/card/id/khantattoo
	ears = 		/obj/item/radio/headset/headset_khans
	belt = 		/obj/item/claymore/machete
	backpack =	/obj/item/storage/backpack/satchel/explorer
	satchel = 	/obj/item/storage/backpack/satchel/explorer
	uniform = /obj/item/clothing/under/f13/khan


/datum/outfit/job/wasteland/f13pusher/pre_equip(mob/living/carbon/human/H)
	..()
	r_hand = /obj/item/book/granter/trait/selection
	r_pocket = /obj/item/flashlight/flare
	l_pocket = /obj/item/storage/bag/money/small/khan
	backpack_contents = list(
		/obj/item/restraints/handcuffs=1, \
		/obj/item/reagent_containers/pill/patch/f13/jet=2, \
		/obj/item/reagent_containers/hypospray/medipen/f13/medx=1, \
		/obj/item/reagent_containers/hypospray/medipen/f13/stimpak=1)
	suit = /obj/item/clothing/suit/toggle/labcoat/f13/khan_jacket
	head = /obj/item/clothing/head/helmet/f13/khan
	shoes = /obj/item/clothing/shoes/f13/military/plated



/datum/outfit/loadout/pusher
	name = "Chemist"
	backpack_contents = list(
		/obj/item/reagent_containers/glass/beaker/plastic=2,
		/obj/item/book/granter/trait/chemistry=1,
		/obj/item/clothing/mask/gas/glass=1,
		/obj/item/gun/ballistic/automatic/pistol/n99 = 1,
		/obj/item/ammo_box/magazine/m10mm_adv = 1)

/datum/outfit/loadout/enforcer
	name = "Enforcer"
	l_hand = /obj/item/gun/ballistic/shotgun/lever
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/buck=2,
		/obj/item/ammo_box/shotgun/slug=1,
		/obj/item/restraints/handcuffs=2,
		/obj/item/restraints/legcuffs/bola=2)

/datum/outfit/loadout/brawler
	name = "Brawler"
	l_hand = /obj/item/claymore/machete/reinforced
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/pistol/autoloader = 1,
		/obj/item/ammo_box/magazine/m45 = 1,
		/obj/item/reagent_containers/hypospray/medipen/f13/stimpak=2,
		/obj/item/restraints/legcuffs/bola/tactical=1,
		/obj/item/book/granter/trait/big_leagues=1)
/*
Bandit
*/

/datum/job/wasteland/f13bandit
	title = "Bandit"
	department_head = list("Captain")
	head_announce = list("Security")
	faction = "Wastelander"
	social_faction = "Raiders"
	total_positions = 15
	spawn_positions = 15
	description = "You are a low-level delinquent with a proclivity for malice, scrounging by for more caps, food and other necessities in the cruel wasteland.  You haven’t quite gained the reputation, contacts and skills to call yourself an Outlaw, so it would be in your best interest to follow their lead to create a superior force – there is a reason they made it so far, and they can help you move up the food chain. You are responsible for causing conflict and strife, you are a simple criminal who engages in nefarious shenanigans which make the wasteland more dangerous; however, you still have a responsibility to make your time here interesting, fun, and engaging for others - this means that whatever path you pursue should be more nuanced and flavorful than simple killing for the sake of it. You are expected to have a high level of roleplay, be OK with losing, and to not take things personally or you may lose the privilege to play this occupation. Treat this role as a first stepping stone to Antagonism, don’t be afraid to try things out, as long as you try to generate fun conflict while minding the rules you are doing everything right. Performing well as a Bandit is a great way to show you're capable of stepping up to the next level... And remember, losing is fun!"
	supervisors = "Your desire to make things interesting and fun"
	selection_color = "#ff4747"
	exp_requirements = 1800
	exp_type = EXP_TYPE_WASTELAND

	outfit = /datum/outfit/job/wasteland/f13bandit

	access = list()
	minimal_access = list()

	loadout_options = list(
	/datum/outfit/loadout/banfiend,
	/datum/outfit/loadout/bansadist,
	/datum/outfit/loadout/bansupafly,
	/datum/outfit/loadout/banblastmaster,
	/datum/outfit/loadout/banyankee
	)

/datum/outfit/job/wasteland/f13bandit/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_CHEM_USER, src)
	ADD_TRAIT(H, TRAIT_LONGPORKLOVER, src)

/datum/outfit/job/wasteland/f13bandit
	name = "Bandit"
	jobtype = /datum/job/wasteland/f13bandit

	id = /obj/item/card/id/bandittattoo
	ears = null
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	r_hand = null

/datum/outfit/job/wasteland/f13bandit/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = pick(
		/obj/item/clothing/under/f13/merca, \
		/obj/item/clothing/under/f13/mercc, \
		/obj/item/clothing/under/f13/cowboyb, \
		/obj/item/clothing/under/f13/cowboyg, \
		/obj/item/clothing/under/f13/raider_leather, \
		/obj/item/clothing/under/f13/raiderrags, \
		/obj/item/clothing/under/pants/f13/ghoul, \
		/obj/item/clothing/under/jabroni)
	r_pocket = /obj/item/flashlight/flare
	shoes = pick(
			/obj/item/clothing/shoes/jackboots,\
			/obj/item/clothing/shoes/f13/raidertreads)
	gloves = /obj/item/clothing/gloves/f13/handwraps
	backpack_contents = list(
		/obj/item/claymore/machete/pipe=1, \
		/obj/item/reagent_containers/hypospray/medipen/f13/stimpak=1, \
		/obj/item/reagent_containers/pill/patch/f13/healingpowder=1, \
		/obj/item/storage/bag/money/small/raider=1, \
		/obj/item/ammo_box/magazine/m9mm = 2
		)
	belt = pick(/obj/item/gun/ballistic/automatic/pistol/ninemil)

/datum/outfit/job/wasteland/f13bandit/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	H.social_faction = "Raiders"
	H.verbs |= /mob/living/proc/creategang

/datum/outfit/loadout/banfiend
	name = "Fiend"
	head = /obj/item/clothing/head/helmet/f13/fiend
	suit = /obj/item/clothing/suit/armor/f13/raider/badlands

/datum/outfit/loadout/bansadist
	name = "Sadist"
	head = /obj/item/clothing/head/helmet/f13/raider/arclight
	suit = /obj/item/clothing/suit/armor/f13/raider/sadist

/datum/outfit/loadout/bansupafly
	name = "Supafly"
	head = /obj/item/clothing/head/helmet/f13/raider/supafly
	suit = /obj/item/clothing/suit/armor/f13/raider/supafly

/datum/outfit/loadout/banblastmaster
	name = "Blastmaster"
	head = /obj/item/clothing/head/helmet/f13/raider/blastmaster
	suit = /obj/item/clothing/suit/armor/f13/raider/blastmaster

/datum/outfit/loadout/banyankee
	name = "Yankee"
	head = /obj/item/clothing/head/helmet/f13/raider/yankee
	suit = /obj/item/clothing/suit/armor/f13/raider/yankee

/*
Outlaw
*/

/datum/job/wasteland/f13raider
	title = "Outlaw"
	department_head = list("Captain")
	head_announce = list("Security")
	faction = "Wastelander"
	social_faction = "Raiders"
	total_positions = 15
	spawn_positions = 15
	description = "You are an undesirable figure of some kind- perhaps a corrupt official, or a cannibalistic bartender, or a devious conman, to name a few examples. You have more freedom than anyone else in the wastes, and are not bound by the same moral code as others, but though you may only be interested in self-gain, you still have a responsibility to make your time here interesting, fun, and engaging for others- this means that whatever path you pursue should be more nuanced and flavorful than simple highway robbery or slavery. (Adminhelp if you require help setting up your character for the round.)"
	supervisors = "Your desire to make things interesting and fun"
	selection_color = "#ff4747"

	outfit = /datum/outfit/job/wasteland/f13raider

	access = list()
	minimal_access = list()
	loadout_options = list(
	/datum/outfit/loadout/mercenary,
	/datum/outfit/loadout/raider_boss,
	/datum/outfit/loadout/conartist,
	/datum/outfit/loadout/quack_doctor,
	/datum/outfit/loadout/fiend,
	/datum/outfit/loadout/highway,
	/datum/outfit/loadout/desperado,
	/datum/outfit/loadout/jabroni,
	/datum/outfit/loadout/ronin,
	/datum/outfit/loadout/knight,
	/datum/outfit/loadout/raider_bos,
	/datum/outfit/loadout/raider_ncr,
	/datum/outfit/loadout/raider_legion,
	/datum/outfit/loadout/raider_vault
	)

/datum/outfit/job/wasteland/f13raider/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_CHEM_USER, src)
	ADD_TRAIT(H, TRAIT_LONGPORKLOVER, src)

/datum/outfit/job/wasteland/f13raider
	name = "Outlaw"
	jobtype = /datum/job/wasteland/f13raider

	id = null
	ears = null
	belt = null
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	r_hand = /obj/item/book/granter/trait/selection

/datum/outfit/job/wasteland/f13raider/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = pick(
		/obj/item/clothing/under/f13/merca, \
		/obj/item/clothing/under/f13/mercc, \
		/obj/item/clothing/under/f13/cowboyb, \
		/obj/item/clothing/under/f13/cowboyg, \
		/obj/item/clothing/under/f13/raider_leather, \
		/obj/item/clothing/under/f13/raiderrags, \
		/obj/item/clothing/under/pants/f13/ghoul, \
		/obj/item/clothing/under/jabroni)
	suit = pick(
		/obj/item/clothing/suit/armor/f13/raider/supafly,\
		/obj/item/clothing/suit/armor/f13/raider/yankee, \
		/obj/item/clothing/suit/armor/f13/raider/sadist, \
		/obj/item/clothing/suit/armor/f13/raider/blastmaster, \
		/obj/item/clothing/suit/armor/f13/raider/badlands, \
		/obj/item/clothing/suit/armor/f13/raider/painspike)
	if(prob(10))
		mask = pick(
			/obj/item/clothing/mask/bandana/red,\
			/obj/item/clothing/mask/bandana/blue,\
			/obj/item/clothing/mask/bandana/green,\
			/obj/item/clothing/mask/bandana/gold,\
			/obj/item/clothing/mask/bandana/black,\
			/obj/item/clothing/mask/bandana/skull)
	head = pick(
		/obj/item/clothing/head/sombrero,\
		/obj/item/clothing/head/helmet/f13/raider/supafly,\
		/obj/item/clothing/head/helmet/f13/raider/eyebot,\
		/obj/item/clothing/head/helmet/f13/raider/arclight,\
		/obj/item/clothing/head/helmet/f13/raider/blastmaster,\
		/obj/item/clothing/head/helmet/f13/raider/yankee,\
		/obj/item/clothing/head/helmet/f13/raider/psychotic,\
		/obj/item/clothing/head/helmet/f13/fiend)
	r_pocket = /obj/item/flashlight/flare
	shoes = pick(
			/obj/item/clothing/shoes/jackboots,\
			/obj/item/clothing/shoes/f13/raidertreads)
	gloves = /obj/item/clothing/gloves/f13/handwraps
	backpack_contents = list(
		/obj/item/restraints/handcuffs=2, \
		/obj/item/claymore/machete/pipe=1, \
		/obj/item/reagent_containers/hypospray/medipen/f13/stimpak=1, \
		/obj/item/reagent_containers/pill/patch/f13/healingpowder=2, \
		/obj/item/storage/bag/money/small/raider=1)

	suit_store = pick(
		/obj/item/gun/ballistic/revolver/colt357, \
		/obj/item/gun/ballistic/rifle/remington, \
		/obj/item/gun/ballistic/revolver/pipe_rifle, \
		/obj/item/gun/ballistic/revolver/caravan_shotgun)

/datum/outfit/job/wasteland/f13raider/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	H.social_faction = "Raiders"
	H.verbs |= /mob/living/proc/creategang

/datum/outfit/loadout/mercenary
	name = "Mercenary"
	suit = /obj/item/clothing/suit/armor/f13/combat/swat
	l_hand = /obj/item/gun/ballistic/automatic/smg/mini_uzi
	backpack_contents = list(
		/obj/item/ammo_box/magazine/uzim9mm=3,
		/obj/item/kitchen/knife/trench=1,
		/obj/item/grenade/plastic=1
		)

/datum/outfit/loadout/raider_boss
	name = "Raider Boss"
	suit = /obj/item/clothing/suit/armor/f13/power_armor/raiderpa
	head = /obj/item/clothing/head/helmet/f13/power_armor/raiderpa_helm
	l_hand = /obj/item/gun/ballistic/revolver/thatgun
	backpack_contents = list(
		/obj/item/kitchen/knife/combat=1,
		/obj/item/ammo_box/magazine/m556/rifle/assault=2
		)

/datum/outfit/loadout/conartist
	name = "Con Artist"
	suit = /obj/item/clothing/under/f13/bennys
	l_hand = /obj/item/gun/ballistic/automatic/pistol/autoloader
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m45/extended=2,
		/obj/item/switchblade=1,
		/obj/item/card/id/syndicate=1,
		/obj/item/stack/f13Cash/caps/twofivezero=1,
		/obj/item/stack/tile/carpet/black/fifty=1,
		/obj/item/storage/box/dice=1,
		/obj/item/storage/fancy/cigarettes/cigars=1,
		/obj/item/toy/cards/deck=1,
		/obj/item/lighter=1
		)

/datum/outfit/loadout/quack_doctor
	name = "Quack Doctor"
	suit = /obj/item/clothing/suit/toggle/labcoat/f13/followers
	l_hand 		= /obj/item/storage/backpack/duffelbag/med/surgery
	suit_store = /obj/item/gun/energy/laser/wattz
	backpack_contents = list(
		/obj/item/stock_parts/cell/ammo/ec=3,
		/obj/item/switchblade=1,
		/obj/item/book/granter/trait/midsurgery=1,
		/obj/item/reagent_containers/hypospray/medipen/f13/stimpak = 4,
		/obj/item/reagent_containers/medspray/synthflesh = 2
		)

/datum/outfit/loadout/fiend
	name = "Fiend"
	suit = /obj/item/clothing/suit/armor/f13/raider/badlands
	head = /obj/item/clothing/head/helmet/f13/fiend
	l_hand = /obj/item/gun/ballistic/rifle/automatic/hunting/cowboy
	backpack_contents = list(
		/obj/item/restraints/legcuffs/bola/tactical=1,
		/obj/item/claymore/machete/pipe/pan = 1,
		/obj/item/ammo_box/tube/a357=3,
		/obj/item/reagent_containers/pill/patch/f13/jet=1,
		/obj/item/reagent_containers/hypospray/medipen/f13/psycho=1,
		/obj/item/reagent_containers/pill/patch/f13/turbo=1,
		/obj/item/reagent_containers/pill/f13/buffout=1
		)

/datum/outfit/loadout/highway
	name = "Highwayman"
	suit = /obj/item/clothing/suit/armor/f13/raider/painspike
	head = /obj/item/clothing/head/helmet/f13/raider/psychotic
	l_hand = /obj/item/gun/ballistic/shotgun/lever
	backpack_contents = list(
		/obj/item/clothing/mask/gas=1,
		/obj/item/twohanded/spear=1,
		/obj/item/ammo_box/shotgun/buck=1,
		/obj/item/ammo_box/shotgun/slug=1
		)

/datum/outfit/loadout/desperado
	name = "Desperado"
	suit = /obj/item/clothing/suit/armor/f13/raider/desperado
	mask = /obj/item/clothing/mask/bandana/skull
	backpack_contents = list(
		/obj/item/gun/ballistic/revolver/m29=2,
		/obj/item/ammo_box/m44=4,
		/obj/item/kitchen/knife/bowie=1
		)

/datum/outfit/loadout/jabroni
	name = "Jabroni"
	suit = /obj/item/clothing/suit/armor/f13/raider/leather_jacket
	head = /obj/item/clothing/head/helmet/skull
	shoes = /obj/item/clothing/shoes/jackboots
	uniform = /obj/item/clothing/under/jabroni
	l_hand = /obj/item/gun/ballistic/automatic/smg/greasegun
	backpack_contents = list(
		/obj/item/ammo_box/magazine/greasegun=3,
		/obj/item/megaphone=1,
		/obj/item/grenade/homemade/firebomb=2,
		/obj/item/kitchen/knife/combat/survival=1
		)

/datum/outfit/loadout/ronin
	name = "Junkyard Ronin"
	suit = /obj/item/clothing/suit/armor/f13/raider/raider_duster
	l_hand = /obj/item/katana
	backpack_contents = list(
		/obj/item/throwing_star=3,
		/obj/item/grenade/smokebomb=1
		)

/datum/outfit/loadout/knight
	name = "Junkyard Knight"
	suit = /obj/item/clothing/suit/armor/f13/raider/templar
	head = /obj/item/clothing/head/helmet/f13/raider/templar
	l_hand = /obj/item/claymore/machete/spatha/knight
	backpack_contents = list(
		/obj/item/shield/makeshift=1,
		/obj/item/megaphone=1,
		/obj/item/reagent_containers/pill/patch/f13/healingpowder=3
	)

/datum/outfit/loadout/raider_bos
	name = "Brotherhood Exile"
	suit = /obj/item/clothing/suit/armor/f13/exile/bosexile
	uniform = /obj/item/clothing/under/f13/bos/fatigues
	l_hand = /obj/item/gun/energy/laser/aer9
	id = /obj/item/card/id/rusted/brokenholodog
	backpack_contents = list(
		/obj/item/stock_parts/cell/ammo/mfc=3,
		/obj/item/kitchen/knife/combat=1,
		/obj/item/reagent_containers/hypospray/medipen/f13/stimpak/super=1
		)

/datum/outfit/loadout/raider_ncr
	name = "NCR Deserter"
	suit = /obj/item/clothing/suit/armor/f13/exile/ncrexile
	uniform = /obj/item/clothing/under/f13/exile
	l_hand = /obj/item/gun/ballistic/automatic/service
	id = /obj/item/card/id/rusted
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m556/rifle/assault=1,
		/obj/item/ammo_box/magazine/m556/rifle=2,
		/obj/item/kitchen/knife/bowie=1
		)

/datum/outfit/loadout/raider_legion
	name = "Disgraced Legionnaire"
	suit = /obj/item/clothing/suit/armor/f13/exile/legexile
	uniform = /obj/item/clothing/under/f13/exile/legion
	belt = /obj/item/storage/backpack/spearquiver
	l_hand = /obj/item/claymore/machete/spatha
	id = /obj/item/card/id/rusted/rustedmedallion
	backpack_contents = list(
		/obj/item/restraints/legcuffs/bola=2,
		/obj/item/reagent_containers/pill/patch/f13/healingpowder=3)

/datum/outfit/loadout/raider_vault
	name = "Dishelved Vaultie"
	suit = /obj/item/clothing/suit/armor/vest
	uniform = /obj/item/clothing/under/f13/exile/vault
	l_hand = /obj/item/gun/ballistic/automatic/pistol/n99
	id = /obj/item/card/id/rusted/fadedvaultid
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m10mm_adv/simple=4,
		/obj/item/switchblade=1,
		/obj/item/assembly/flash/handheld=1,
		/obj/item/melee/classic_baton/telescopic=1
		)

/datum/job/wasteland/f13wastelander
	title = "Wastelander"
	faction = "Wastelander"
	total_positions = -1
	spawn_positions = -1
	description = "You may have come from near or far to reach the Arizona border region once known as Yuma, and the Sonoran Desert may have burnt your skin. With Cog City to the southeast in between the NCR and Legion border, and Brotherhood and raider presence, your trials may be many more still. Though your past might be set in stone, the future is in your hands."
	supervisors = "no one"
	selection_color = "#dddddd"

	outfit = /datum/outfit/job/wasteland/f13wastelander

	access = list()		//we can expand on this and make alterations as people suggest different loadouts
	minimal_access = list()
	loadout_options = list(
	/datum/outfit/loadout/vaultie,
	/datum/outfit/loadout/scav,
	/datum/outfit/loadout/sawbones,
	/datum/outfit/loadout/trader,
	/datum/outfit/loadout/legcit,
	/datum/outfit/loadout/ncrcit,
	/datum/outfit/loadout/gambler,
	/datum/outfit/loadout/vaquero,
	/datum/outfit/loadout/fieldhand,
	/datum/outfit/loadout/hobo,
	/datum/outfit/loadout/hombre,
	/datum/outfit/loadout/exmil,
	/datum/outfit/loadout/eidolon,
	/datum/outfit/loadout/aviator,
	/datum/outfit/loadout/trapper,
	/datum/outfit/loadout/trouper,
	/datum/outfit/loadout/architect)

/datum/outfit/job/wasteland/f13wastelander
	name = "Wastelander"
	jobtype = /datum/job/wasteland/f13wastelander

	id = null
	ears = null
	belt = null
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer

/datum/outfit/job/wasteland/f13wastelander/pre_equip(mob/living/carbon/human/H)
	..()
	r_hand = /obj/item/book/granter/trait/selection/waster
	uniform = pick(
		/obj/item/clothing/under/f13/settler, \
		/obj/item/clothing/under/f13/brahminm, \
		/obj/item/clothing/under/f13/machinist, \
		/obj/item/clothing/under/f13/lumberjack, \
		/obj/item/clothing/under/f13/roving)
	suit = pick(
		/obj/item/clothing/suit/armor/f13/kit, \
		/obj/item/clothing/suit/f13/veteran, \
		/obj/item/clothing/suit/toggle/labcoat/f13/wanderer, \
		/obj/item/clothing/suit/armor/f13/leatherarmor)
	l_pocket = 	/obj/item/reagent_containers/food/drinks/flask
	r_pocket = /obj/item/flashlight/flare
	belt = 	/obj/item/kitchen/knife/combat/survival
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/f13/stimpak=2, \
		/obj/item/reagent_containers/pill/f13/radx=1, \
		/obj/item/storage/bag/money/small/wastelander, \
		/obj/item/kitchen/knife)
	suit_store = pick(
	/obj/item/gun/ballistic/rifle/remington, \
	/obj/item/gun/ballistic/revolver/zipgun, \
	/obj/item/gun/ballistic/revolver/pipe_rifle)

/datum/outfit/loadout/vaultie
	name = "Vaultie"
	uniform = /obj/item/clothing/under/f13/vault
	shoes = /obj/item/clothing/shoes/jackboots
	gloves = /obj/item/clothing/gloves/fingerless
	l_hand = /obj/item/gun/ballistic/automatic/pistol/n99
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m10mm_adv/simple=2,
		/obj/item/card/id/selfassign=1,
		/obj/item/pda=1,
		/obj/item/flashlight/seclite=1)

/datum/outfit/loadout/scav
	name = "Scav"
	neck = /obj/item/clothing/neck/apron/labor
	shoes = /obj/item/clothing/shoes/workboots
	gloves = /obj/item/clothing/gloves/f13/blacksmith
	head = /obj/item/clothing/head/hardhat/dblue
	belt = /obj/item/storage/belt/utility/full/engi
	l_hand = /obj/item/gun/ballistic/automatic/pistol/ninemil
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m9mm=1,
		/obj/item/clothing/head/welding/weldingfire=1,
		/obj/item/mining_scanner=1,
		/obj/item/pickaxe/mini)

/datum/outfit/loadout/sawbones
	name = "Sawbones"
	uniform = /obj/item/clothing/under/f13/doctor
	suit = /obj/item/clothing/suit/toggle/labcoat
	shoes = /obj/item/clothing/shoes/f13/explorer
	gloves = /obj/item/clothing/gloves/color/latex
	head = /obj/item/clothing/head/fedora/curator
	l_hand = /obj/item/gun/ballistic/revolver/colt6520
	backpack_contents =  list(
		/obj/item/ammo_box/l10mm=1,
		/obj/item/healthanalyzer=1,
		/obj/item/reagent_containers/glass/beaker/plastic=1,
		/obj/item/storage/medical/ancientfirstaid=1)

/datum/outfit/loadout/trader
	name = "Trader"
	uniform = /obj/item/clothing/under/f13/merchant
	shoes = /obj/item/clothing/shoes/f13/brownie
	head = /obj/item/clothing/head/f13/stormchaser
	gloves = /obj/item/clothing/gloves/color/brown
	neck = /obj/item/clothing/neck/mantle/brown
	glasses = /obj/item/clothing/glasses/f13/biker
	l_hand = /obj/item/gun/ballistic/automatic/pistol/m1911
	backpack_contents =  list(
		/obj/item/storage/box/vendingmachine=1,
		/obj/item/stack/f13Cash/caps/threefivezero=1)

/datum/outfit/loadout/legcit
	name = "Legion Citizen"
	suit = /obj/item/clothing/suit/curator
	uniform = /obj/item/clothing/under/f13/brahmin
	shoes = /obj/item/clothing/shoes/roman
	head = /obj/item/clothing/head/scarecrow_hat
	gloves = /obj/item/clothing/gloves/legion
	l_hand = /obj/item/claymore/machete/gladius
	backpack_contents = list(
		/obj/item/shield/legion/buckler=1,
		/obj/item/shovel/spade=1,
		/obj/item/cultivator=1,
		/obj/item/storage/bag/plants=1,
		/obj/item/flashlight/lantern=1,
		/obj/item/reagent_containers/glass/bucket/wood=1)

/datum/outfit/loadout/ncrcit
	name = "NCR Citizen"
	uniform = /obj/item/clothing/under/f13/caravaneer
	shoes = /obj/item/clothing/shoes/f13/tan
	head = /obj/item/clothing/head/f13/cowboy
	gloves = /obj/item/clothing/gloves/color/brown
	glasses = /obj/item/clothing/glasses/orange
	l_hand = /obj/item/gun/ballistic/rifle/mag/varmint
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m556/rifle=1,
		/obj/item/flashlight=1)

/datum/outfit/loadout/gambler
	name = "Gambler"
	uniform = /obj/item/clothing/under/f13/bennys
	shoes = /obj/item/clothing/shoes/lucky
	head = /obj/item/clothing/head/fedora
	l_hand = /obj/item/gun/ballistic/revolver/m29/snub
	backpack_contents = list(
		/obj/item/storage/fancy/cigarettes/cigars/cohiba=1,
		/obj/item/coin/gold=1,
		/obj/item/lighter/gold=1,
		/obj/item/toy/cards/deck=1,
		/obj/item/storage/box/dice=1,
		/obj/item/stack/tile/carpet/blackred/fifty=1,
		/obj/item/ammo_box/m44=1)

/datum/outfit/loadout/vaquero
	name = "Vaquero"
	suit = /obj/item/clothing/suit/armor/f13/vaquero
	uniform = /obj/item/clothing/under/f13/petrochico
	shoes = /obj/item/clothing/shoes/f13/fancy
	gloves = /obj/item/clothing/gloves/f13/leather/fingerless
	head = /obj/item/clothing/head/helmet/f13/vaquerohat
	l_hand = /obj/item/ammo_box/a357
	backpack_contents = list(
		/obj/item/gun/ballistic/revolver/colt357=1,
		/obj/item/claymore/machete/pipe/tireiron=1,
		/obj/item/storage/wallet=1,
		/obj/item/reagent_containers/food/snacks/grown/cannabis=1,
		/obj/item/clothing/mask/cigarette/pipe/cobpipe=1)

/datum/outfit/loadout/fieldhand
	name = "Field Hand"
	neck = /obj/item/clothing/neck/apron/labor
	uniform = /obj/item/clothing/under/f13/brahmin
	gloves = /obj/item/clothing/gloves/botanic_leather
	mask = /obj/item/clothing/mask/bandana
	l_hand = /obj/item/claymore/machete
	backpack_contents = list(
		/obj/item/reagent_containers/glass/bucket/wood=1,
		/obj/item/shovel=1,
		/obj/item/cultivator=1,
		/obj/item/storage/bag/plants=1,
		/obj/item/seeds/corn=1,
		/obj/item/seeds/tomato=1,
		/obj/item/seeds/wheat=1,
		/obj/item/pitchfork=1)

/datum/outfit/loadout/hobo
	name = "Hobo"
	neck = /obj/item/clothing/neck/mantle/poncho
	uniform = /obj/item/clothing/under/pants/f13/ghoul
	shoes = /obj/item/clothing/shoes/sandal
	mask = /obj/item/clothing/mask/facewrap
	head = /obj/item/clothing/head/rice_hat
	gloves = /obj/item/clothing/gloves/f13/handwraps
	l_hand = /obj/item/claymore/machete/pipe/pan
	backpack_contents = list(
		/obj/item/reagent_containers/food/drinks/bottle/whiskey=1,
		/obj/item/storage/bag/trash=1,
		/obj/item/picket_sign=1)

/datum/outfit/loadout/hombre
	name = "Hombre"
	suit = /obj/item/clothing/suit/f13/vest
	uniform = /obj/item/clothing/under/f13/cowboyb
	gloves = /obj/item/clothing/gloves/f13/leather
	l_hand = /obj/item/gun/ballistic/revolver/m29
	backpack_contents = list(
		/obj/item/kitchen/knife/combat=1,
		/obj/item/lighter=1,
		/obj/item/storage/fancy/rollingpapers=1,
		/obj/item/ammo_box/m44=1)

/datum/outfit/loadout/exmil
	name = "Ex-Military"
	suit = /obj/item/clothing/suit/flakjack
	uniform = /obj/item/clothing/under/f13/bdu
	shoes = /obj/item/clothing/shoes/f13/military/oldcombat
	head = /obj/item/clothing/head/flakhelm
	glasses = /obj/item/clothing/glasses/sunglasses/big
	gloves = /obj/item/clothing/gloves/combat
	l_hand = /obj/item/gun/ballistic/automatic/pistol/ninemil
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m9mm=1,
		/obj/item/storage/fancy/cigarettes/dromedaryco=1,
		/obj/item/kitchen/knife/combat/survival =1)

/datum/outfit/loadout/eidolon
	name = "Eidolon"
	suit = /obj/item/clothing/suit/hooded/wintercoat
	uniform = /obj/item/clothing/under/color/black
	shoes = /obj/item/clothing/shoes/combat
	head = /obj/item/clothing/head/beret/black
	gloves = /obj/item/clothing/gloves/f13/military
	glasses = /obj/item/clothing/glasses/orange
	neck = /obj/item/clothing/neck/mantle/gray
	mask = /obj/item/clothing/mask/balaclava
	l_hand = /obj/item/gun/ballistic/revolver/doublebarrel
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/slug=1,
		/obj/item/reagent_containers/food/drinks/flask/russian=1,
		/obj/item/reagent_containers/food/drinks/bottle/vodka/badminka=1)

/datum/outfit/loadout/aviator
	name = "Aviator"
	suit = /obj/item/clothing/suit/bomber
	uniform = /obj/item/clothing/under/color/grey/glorf
	shoes = /obj/item/clothing/shoes/f13/tan
	head = /obj/item/clothing/head/flight
	neck = /obj/item/storage/belt/holster/full
	gloves = /obj/item/clothing/gloves/rifleman
	backpack_contents = list(
		/obj/item/lighter/fusion=1,
		/obj/item/storage/fancy/cigarettes/cigpack_carp=1)

/datum/outfit/loadout/trapper
	name = "Trapper"
	suit = /obj/item/clothing/suit/armor/f13/brahmin_leather_duster
	uniform = /obj/item/clothing/under/f13/worn
	shoes = /obj/item/clothing/shoes/f13/military/leather
	head = /obj/item/clothing/head/helmet/f13/brahmincowboyhat
	gloves = /obj/item/clothing/gloves/f13/leather/fingerless
	glasses = /obj/item/clothing/glasses/orange
	l_hand = /obj/item/shovel/trench
	backpack_contents = list(
		/obj/item/throwing_star/spear=3,
		/obj/item/storage/box/mousetraps=1)

/datum/outfit/loadout/trouper
	name = "Trouper"
	neck = /obj/item/clothing/neck/mantle/poncho/red
	uniform = /obj/item/clothing/under/redeveninggown
	shoes = /obj/item/clothing/shoes/laceup
	head = /obj/item/clothing/head/widered
	l_hand = /obj/item/gun/ballistic/automatic/pistol/pistol22
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m22=1,
		/obj/item/reagent_containers/food/drinks/shaker=1,
		/obj/item/restraints/handcuffs/fake/kinky=1,
		/obj/item/melee/curator_whip=1,
		/obj/item/storage/fancy/cigarettes/cigpack_cannabis=1,
		/obj/item/reagent_containers/food/drinks/bottle/trappist=1,
		/obj/item/reagent_containers/food/drinks/bottle/applejack=1,
		/obj/item/reagent_containers/food/drinks/bottle/goldschlager=1,
		/obj/item/clothing/accessory/pocketprotector/cosmetology=1)


/datum/outfit/loadout/architect //Donator loadout - Vincieyork
	name = "Wasteland Architect"
	uniform = /obj/item/clothing/under/pants/jeans
	suit = /obj/item/clothing/suit/jacket/flannel/brown
	shoes = /obj/item/clothing/shoes/jackboots
	head = /obj/item/clothing/head/welding/f13
	belt = /obj/item/storage/belt/utility/full
	l_hand = /obj/item/gun/ballistic/revolver/widowmaker
	backpack_contents = list(
		/obj/item/stack/sheet/metal/ten=2,
		/obj/item/stack/sheet/glass/ten=2,
		/obj/item/stack/sheet/mineral/wood/twenty=2,
		/obj/item/circuitboard/machine/autolathe=1,
		/obj/item/storage/backpack/duffelbag/engineering=1)

//Note: Recipes will be gone and into a book as soon as I figure out how to do that much
/datum/job/wasteland/f13tribal
	title = "Tribal"
	faction = "Wastelander"
	total_positions = -1
	spawn_positions = -1
	description = "You come from far away land and or even you are from here from one of the local tribes."
	supervisors = "no one or the stars above"
	selection_color = "#dddddd"
	outfit = /datum/outfit/job/wasteland/f13tribal

	access = list()
	minimal_access = list()

	loadout_options = list(
	/datum/outfit/loadout/tbrawler,
	/datum/outfit/loadout/spearman,
	/datum/outfit/loadout/shaman,
	/datum/outfit/loadout/whitelegsmelee,
	/datum/outfit/loadout/whitelegsranged,
	/datum/outfit/loadout/whitelegsshaman,
	/datum/outfit/loadout/deadhorsesmelee,
	/datum/outfit/loadout/deadhorsesranged,
	/datum/outfit/loadout/deadhorsesshaman,
	/datum/outfit/loadout/sorrowshunter,
	/datum/outfit/loadout/sorrowsshaman,
	/datum/outfit/loadout/eightiesmelee,
	/datum/outfit/loadout/eightiesranged,
	/datum/outfit/loadout/eightiesshaman,
	/datum/outfit/loadout/rustwalkersscipher,
	/datum/outfit/loadout/rustwalkersscrapper,
	/datum/outfit/loadout/rustwalkersshaman,
	/datum/outfit/loadout/bonedancerexile
	)

//Generic Tribals
/datum/outfit/loadout/tbrawler
	name = "Tribal Brawler"
	suit = /obj/item/clothing/suit/armor/f13/tribal
	head = /obj/item/clothing/head/helmet/f13/deathskull
	backpack_contents = list(
		/obj/item/twohanded/fireaxe/bmprsword = 1,
		/obj/item/restraints/legcuffs/bola = 2,
		/obj/item/reagent_containers/pill/patch/f13/healpoultice = 2,
		/obj/item/stack/medical/gauze = 1,
		)

/datum/outfit/loadout/spearman
	name = "Tribal Spearman"
	suit = /obj/item/clothing/suit/armor/bone
	head = /obj/item/clothing/head/helmet/f13/fiend
	mask = /obj/item/clothing/mask/facewrap
	neck = /obj/item/clothing/neck/mantle/gray
	backpack_contents = list(
		/obj/item/twohanded/spear = 1,
		/obj/item/reagent_containers/pill/patch/f13/healpoultice = 2
		)

/datum/outfit/loadout/shaman
	name = "Tribal Shaman"
	suit = /obj/item/clothing/suit/hooded/cloak/desert
	backpack_contents = list(
		/obj/item/storage/bag/plants=1,
		/obj/item/cultivator=1,
		/obj/item/reagent_containers/glass/bucket/wood=1,
		/obj/item/twohanded/sledgehammer/warmace = 1,
		/obj/item/kitchen/knife/ritual = 1,
		/obj/item/stack/medical/gauze/improvised = 1,
		/obj/item/reagent_containers/pill/patch/f13/healpoultice = 1
	)

//White Legs
/datum/outfit/loadout/whitelegsmelee
	name = "White Legs Bone-Breaker"
	suit = /obj/item/clothing/suit/f13/tribal/light/whitelegs
	backpack_contents = list(
		/obj/item/clothing/under/f13/whitelegs = 1,
		/obj/item/clothing/under/f13/female/whitelegs = 1,
		/obj/item/melee/unarmed/maceglove = 1,
		/obj/item/gun/ballistic/automatic/pistol/ninemil = 1,
		/obj/item/reagent_containers/pill/patch/f13/healpoultice = 1
	)

/datum/outfit/loadout/whitelegsranged
	name = "White Legs Storm-Drummer"
	suit = /obj/item/clothing/suit/f13/tribal/whitelegs
	backpack_contents = list(
		/obj/item/clothing/under/f13/whitelegs = 1,
		/obj/item/clothing/under/f13/female/whitelegs = 1,
		/obj/item/gun/ballistic/automatic/smg/tommygun = 1,
		/obj/item/gun/ballistic/automatic/pistol/ninemil = 1,
		/obj/item/reagent_containers/pill/patch/f13/healpoultice = 1,
		/obj/item/ammo_box/magazine/tommygunm45 = 2
	)

/datum/outfit/loadout/whitelegsshaman
	name = "White Legs Arm-Makers"
	backpack_contents = list(
		/obj/item/clothing/under/f13/whitelegs = 1,
		/obj/item/clothing/under/f13/female/whitelegs = 1,
		/obj/item/twohanded/fireaxe = 1,
		/obj/item/gun/ballistic/automatic/pistol/ninemil = 1,
	)

//Dead Horses
/datum/outfit/loadout/deadhorsesmelee
	name = "Dead Horses Stalker"
	suit = /obj/item/clothing/suit/f13/tribal/deadhorses
	backpack_contents = list(
		/obj/item/clothing/under/f13/deadhorses = 1,
		/obj/item/clothing/under/f13/female/deadhorses = 1,
		/obj/item/claymore/machete/warclub = 1,
		/obj/item/storage/backpack/spearquiver = 1,
		/obj/item/reagent_containers/pill/patch/f13/healpoultice = 2
	)

/datum/outfit/loadout/deadhorsesranged
	name = "Dead Horses Disciple"
	suit = /obj/item/clothing/suit/f13/tribal/heavy/deadhorses
	backpack_contents = list(
		/obj/item/clothing/under/f13/deadhorses = 1,
		/obj/item/clothing/under/f13/female/deadhorses = 1,
		/obj/item/gun/ballistic/automatic/pistol/m1911=1,
		/obj/item/ammo_box/magazine/m45 = 2,
		/obj/item/reagent_containers/pill/patch/f13/healpoultice = 2
	)

/datum/outfit/loadout/deadhorsesshaman
	name = "Dead Horses Shaman"
	backpack_contents = list(
		/obj/item/clothing/under/f13/deadhorses = 1,
		/obj/item/clothing/under/f13/female/deadhorses = 1,
		/obj/item/storage/bag/plants=1,
		/obj/item/cultivator=1,
		/obj/item/reagent_containers/glass/bucket/wood=1,
		/obj/item/reagent_containers/pill/patch/f13/healpoultice = 2
	)

//Sorrows
/datum/outfit/loadout/sorrowshunter
	name = "Sorrows Hunter-Guardian"
	suit = /obj/item/clothing/suit/f13/tribal/light/sorrows
	backpack_contents = list(
		/obj/item/clothing/under/f13/sorrows = 1,
		/obj/item/clothing/under/f13/female/sorrows = 1,
		/obj/item/kitchen/knife/combat/survival = 1,
		/obj/item/reagent_containers/pill/patch/f13/healpoultice = 2,
		/obj/item/gun/ballistic/bow = 1,
		/obj/item/storage/belt/tribe_quiver = 1,
	)

/datum/outfit/loadout/sorrowsshaman
	name = "Sorrows Ink-Shaman"
	backpack_contents = list(
		/obj/item/clothing/under/f13/sorrows = 1,
		/obj/item/clothing/under/f13/female/sorrows = 1,
		/obj/item/storage/bag/plants = 1,
		/obj/item/cultivator = 1,
		/obj/item/reagent_containers/glass/bucket/wood = 1,
		/obj/item/reagent_containers/pill/patch/f13/healpoultice = 2,
		/obj/item/warpaint_bowl = 1,
		/obj/item/toy/crayon/spraycan = 2
	)

//Eighties
/datum/outfit/loadout/eightiesmelee
	name = "Eighties Path-Maker"
	suit = /obj/item/clothing/suit/f13/tribal/eighties
	backpack_contents = list(
		/obj/item/clothing/under/f13/eighties = 1,
		/obj/item/clothing/under/f13/female/eighties = 1,
		/obj/item/gun/ballistic/shotgun/trench = 1,
		/obj/item/ammo_box/shotgun/buck = 2,
		/obj/item/reagent_containers/pill/patch/f13/healpoultice = 2,
		/obj/item/reagent_containers/pill/patch/f13/turbo = 2,
		/obj/item/reagent_containers/pill/patch/f13/jet  = 2
	)

/datum/outfit/loadout/eightiesranged
	name = "Eighties Road-Warrior"
	suit = /obj/item/clothing/suit/f13/tribal/heavy/eighties
	backpack_contents = list(
		/obj/item/clothing/under/f13/eighties = 1,
		/obj/item/clothing/under/f13/female/eighties = 1,
		/obj/item/gun/ballistic/revolver/single_shotgun = 1,
		/obj/item/ammo_box/shotgun/buck = 1,
		/obj/item/gun/ballistic/automatic/smg/greasegun = 1,
		/obj/item/ammo_box/magazine/greasegun = 2,
		/obj/item/reagent_containers/pill/patch/f13/healpoultice = 2
	)

/datum/outfit/loadout/eightiesshaman
	name = "Eighties Lay-Mechanic"
	suit = /obj/item/clothing/suit/f13/tribal/light/eighties
	backpack_contents = list(
		/obj/item/clothing/under/f13/eighties = 1,
		/obj/item/clothing/under/f13/female/eighties = 1,
		/obj/item/gun/ballistic/revolver/single_shotgun = 1,
		/obj/item/ammo_box/shotgun/slug = 1,
		/obj/item/reagent_containers/pill/patch/f13/healpoultice = 2,
		/obj/item/storage/belt/utility/full = 1,
	)

//Rustwalkers
/datum/outfit/loadout/rustwalkersscipher
	name = "Rustwalkers Scipher"
	suit = /obj/item/clothing/suit/f13/tribal/rustwalkers
	backpack_contents = list(
		/obj/item/clothing/under/f13/rustwalkers = 1,
		/obj/item/clothing/under/f13/female/rustwalkers = 1,
		/obj/item/gun/ballistic/automatic/autopipe = 1,
		/obj/item/ammo_box/magazine/autopipe = 2,
		/obj/item/reagent_containers/pill/patch/f13/healpoultice = 2,
		/obj/item/circular_saw = 1
	)

/datum/outfit/loadout/rustwalkersscrapper
	name = "Rustwalkers Scrapper"
	suit = /obj/item/clothing/suit/f13/tribal/light/rustwalkers
	backpack_contents = list(
		/obj/item/clothing/under/f13/rustwalkers = 1,
		/obj/item/clothing/under/f13/female/rustwalkers = 1,
		/obj/item/gun/ballistic/revolver/pipe_rifle = 1,
		/obj/item/ammo_box/c10mm = 1,
		/obj/item/circular_saw = 1,
		/obj/item/storage/belt/utility/full = 1,
		/obj/item/reagent_containers/pill/patch/f13/healpoultice = 2
	)

/datum/outfit/loadout/rustwalkersshaman
	name = "Rustwalkers Brain-Jack"
	backpack_contents = list(
		/obj/item/clothing/under/f13/rustwalkers = 1,
		/obj/item/clothing/under/f13/female/rustwalkers = 1,
		/obj/item/melee/unarmed/bladed = 1,
		/obj/item/circular_saw = 1,
		/obj/item/reagent_containers/pill/patch/f13/healpoultice = 2,
		/obj/item/storage/belt/utility/full = 1,

	)
//Bone Dancer
/datum/outfit/loadout/bonedancerexile
	name = "Bone Dancer Exile"
	backpack_contents = list(
		/obj/item/clothing/under/f13/bone = 1,
		/obj/item/clothing/head/helmet/skull = 1,
		/obj/item/twohanded/spear/bonespear = 1,
		/obj/item/warpaint_bowl=1,
		/obj/item/reagent_containers/pill/patch/f13/healpoultice = 2

	)

/datum/outfit/job/wasteland/f13tribal
	name = "Tribal"
	jobtype = /datum/job/wasteland/f13tribal

	id = 		null
	ears = 		null
	belt = 		/obj/item/kitchen/knife/combat/bone
	backpack =	/obj/item/storage/backpack/satchel/explorer
	satchel = 	/obj/item/storage/backpack/satchel/explorer
	uniform = /obj/item/clothing/under/f13/raiderrags
	gloves =    /obj/item/clothing/gloves/f13/handwraps
	shoes =     /obj/item/clothing/shoes/sandal
	l_pocket = /obj/item/flashlight/lantern
	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/f13/healingpowder = 2,
		/obj/item/flashlight/lantern = 1,
		)


/datum/outfit/job/wasteland/f13tribal/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_TECHNOPHOBE, src)
	ADD_TRAIT(H, TRAIT_MACHINE_SPIRITS, src)
	H.grant_language(/datum/language/tribal)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/heavytribe)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/tribe_armor)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/ritual)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/tribalshield)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/warclub)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/warmace)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/arrowpoison)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/arrowburn)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/deathclawspear)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/tribalwar/sturdybow)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/tribalwar/silverbow)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/tribalwar/bonebow)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/hydra)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/punji_sticks)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/tribalshield)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/nightshield)

/*Wasteland Preacher*/

/datum/job/wasteland/f13preacher
	title = "Preacher"
	department_head = list("Captain")
	head_announce = list("Security")
	faction = "Town"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Your Master(s)."
	description = "You are a beacon of faith in the wasteland. Guide the Town and any others who wish to be led on spiritual matters, and try to build your flock. Remember, the Oasis Oak and the Church are the centre of your religion - protect them at all costs."
	selection_color = "#dcba97"

	exp_requirements = 12
	exp_type = EXP_TYPE_CREW

	outfit = /datum/outfit/job/wasteland/f13preacher

	loadout_options = list(
	/datum/outfit/loadout/standardpreacher, //Robes, Book
	/datum/outfit/loadout/atompreacher, //Atoms Judgement, Followers Robes
	/datum/outfit/loadout/hoistwaypreacher //Borg arms and legs, VTCC clothing
	)

	access = list(ACCESS_BAR)
	minimal_access = list(ACCESS_BAR)

/datum/outfit/loadout/hoistwaypreacher
	name = "Hoistway Preacher"
	backpack_contents = list(
		/obj/item/book/manual/ripley_build_and_repair=1,
		/obj/item/bodypart/l_arm/robot=1,
		/obj/item/bodypart/r_arm/robot=1,
		/obj/item/bodypart/l_leg/robot=1,
		/obj/item/bodypart/r_leg/robot=1,
		/obj/item/clothing/suit/armor/f13/battlecoat/vault/armoured=1,
		/obj/item/lighter/fusion=1

		)

/datum/outfit/loadout/atompreacher
	name = "Atom's Devout"
	l_hand = /obj/item/twohanded/sledgehammer/atomsjudgement
	backpack_contents = list(
		/obj/item/clothing/under/f13/atombeliever=1,
		/obj/item/clothing/under/f13/atomfaithful=3,
		/obj/item/clothing/head/helmet/f13/atombeliever=1
		)

/datum/outfit/loadout/standardpreacher
	name = "Protector of the Faith"
	l_hand = /obj/item/nullrod
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/f13/stimpak=2
		)

/datum/job/wasteland/f13preacher/after_spawn(mob/living/H, mob/M)
	if(H.mind)
		H.mind.isholy = TRUE

	var/obj/item/storage/book/bible/booze/B = new

	if(GLOB.religion)
		B.deity_name = GLOB.deity
		B.name = GLOB.bible_name
		B.icon_state = GLOB.bible_icon_state
		B.item_state = GLOB.bible_item_state
		to_chat(H, "There is already an established religion onboard the station. You are an acolyte of [GLOB.deity]. Defer to the Chaplain.")
		H.equip_to_slot_or_del(B, SLOT_IN_BACKPACK)
		var/nrt = GLOB.holy_weapon_type || /obj/item/nullrod
		var/obj/item/nullrod/N = new nrt(H)
		H.put_in_hands(N)
		return

	var/new_religion = DEFAULT_RELIGION
	if(M.client && M.client.prefs.custom_names["religion"])
		new_religion = M.client.prefs.custom_names["religion"]

	var/new_deity = DEFAULT_DEITY
	if(M.client && M.client.prefs.custom_names["deity"])
		new_deity = M.client.prefs.custom_names["deity"]

	B.deity_name = new_deity


	switch(lowertext(new_religion))
		if("christianity") // DEFAULT_RELIGION
			B.name = pick("The Holy Bible","The Dead Sea Scrolls")
		if("buddhism")
			B.name = "The Sutras"
		if("clownism","honkmother","honk","honkism","comedy")
			B.name = pick("The Holy Joke Book", "Just a Prank", "Hymns to the Honkmother")
		if("chaos")
			B.name = "The Book of Lorgar"
		if("cthulhu")
			B.name = "The Necronomicon"
		if("hinduism")
			B.name = "The Vedas"
		if("homosexuality")
			B.name = pick("Guys Gone Wild","Coming Out of The Closet")
		if("imperium")
			B.name = "Uplifting Primer"
		if("islam")
			B.name = "Quran"
		if("judaism")
			B.name = "The Torah"
		if("lampism")
			B.name = "Fluorescent Incandescence"
		if("lol", "wtf", "gay", "penis", "ass", "poo", "badmin", "shitmin", "deadmin", "cock", "cocks", "meme", "memes")
			B.name = pick("Woodys Got Wood: The Aftermath", "War of the Cocks", "Sweet Bro and Hella Jef: Expanded Edition","F.A.T.A.L. Rulebook")
			H.adjustOrganLoss(ORGAN_SLOT_BRAIN, 100) // starts off dumb as fuck
		if("monkeyism","apism","gorillism","primatism")
			B.name = pick("Going Bananas", "Bananas Out For Harambe")
		if("mormonism")
			B.name = "The Book of Mormon"
		if("pastafarianism")
			B.name = "The Gospel of the Flying Spaghetti Monster"
		if("rastafarianism","rasta")
			B.name = "The Holy Piby"
		if("satanism")
			B.name = "The Unholy Bible"
		if("science")
			B.name = pick("Principle of Relativity", "Quantum Enigma: Physics Encounters Consciousness", "Programming the Universe", "Quantum Physics and Theology", "String Theory for Dummies", "How To: Build Your Own Warp Drive", "The Mysteries of Bluespace", "Playing God: Collector's Edition")
		if("scientology")
			B.name = pick("The Biography of L. Ron Hubbard","Dianetics")
		if("servicianism", "partying")
			B.name = "The Tenets of Servicia"
			B.deity_name = pick("Servicia", "Space Bacchus", "Space Dionysus")
			B.desc = "Happy, Full, Clean. Live it and give it."
		if("subgenius")
			B.name = "Book of the SubGenius"
		if("toolboxia","greytide")
			B.name = pick("Toolbox Manifesto","iGlove Assistants")
		if("weeaboo","kawaii")
			B.name = pick("Fanfiction Compendium","Japanese for Dummies","The Manganomicon","Establishing Your O.T.P")
		else
			B.name = "The Holy Book of [new_religion]"

	GLOB.religion = new_religion
	GLOB.bible_name = B.name
	GLOB.deity = B.deity_name

	H.equip_to_slot_or_del(B, SLOT_IN_BACKPACK)

	SSblackbox.record_feedback("text", "religion_name", 1, "[new_religion]", 1)
	SSblackbox.record_feedback("text", "religion_deity", 1, "[new_deity]", 1)


/datum/outfit/job/wasteland/f13preacher
	name = "Preacher"
	jobtype = /datum/job/wasteland/f13preacher
	ears = /obj/item/radio/headset
	belt = null

	id = /obj/item/card/id/dogtag/town
	uniform = /obj/item/clothing/under/rank/chaplain
	backpack_contents = list(/obj/item/camera/spooky = 1)
	backpack = /obj/item/storage/backpack/cultpack
	satchel = /obj/item/storage/backpack/cultpack
	gloves =		/obj/item/clothing/gloves/fingerless
	shoes = 		/obj/item/clothing/shoes/jackboots
	backpack = 		/obj/item/storage/backpack/cultpack
	satchel = 		/obj/item/storage/backpack/cultpack
	r_hand = 		/obj/item/gun/ballistic/revolver/m29
	r_pocket = /obj/item/flashlight/flare
	backpack_contents = list(
		/obj/item/ammo_box/m44=2, \
		/obj/item/reagent_containers/food/drinks/flask=1, \
		/obj/item/storage/fancy/candle_box, \
		/obj/item/storage/bag/money/small/settler)
