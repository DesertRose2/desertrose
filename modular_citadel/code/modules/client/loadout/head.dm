/datum/gear/head
	category = LOADOUT_CATEGORY_HEAD
	subcategory = LOADOUT_SUBCATEGORY_HEAD_GENERAL
	slot = SLOT_HEAD

/datum/gear/head/baseball
	name = "Ballcap"
	path = /obj/item/clothing/head/soft/mime

/datum/gear/head/beanie
	name = "Beanie"
	path = /obj/item/clothing/head/beanie

/datum/gear/head/flatcap
	name = "Flat cap"
	path = /obj/item/clothing/head/flatcap

/datum/gear/head/maidband
	name = "Maid headband"
	path= /obj/item/clothing/head/maid

/datum/gear/head/bunnyears
	name = "Bunny Ears"
	path = /obj/item/clothing/head/rabbitears


/*Commenting out Until next Christmas or made automatic
/datum/gear/santahatr
	name = "Red Santa Hat"
	category = SLOT_HEAD
	path = /obj/item/clothing/head/christmashat

/datum/gear/santahatg
	name = "Green Santa Hat"
	category = SLOT_HEAD
	path = /obj/item/clothing/head/christmashatg
*/

/datum/gear/head/wkepi
	name = "white kepi"
	path = /obj/item/clothing/head/kepi

//Hats
/datum/gear/head/cowboy
	name = "brahmin leather cowboy hat"
	subcategory = LOADOUT_SUBCATEGORY_HEAD_HATS
	path = /obj/item/clothing/head/helmet/f13/brahmincowboyhat

/datum/gear/head/cowboy_alt
	name = "Rusted Cowboy Hat"
	subcategory = LOADOUT_SUBCATEGORY_HEAD_HATS
	path = /obj/item/clothing/head/helmet/f13/rustedcowboyhat

/datum/gear/head/mailmanhat
	name = "Mailman's Hat"
	subcategory = LOADOUT_SUBCATEGORY_HEAD_HATS
	path = /obj/item/clothing/head/mailman

/datum/gear/head/pirate
	name = "Pirate hat"
	subcategory = LOADOUT_SUBCATEGORY_HEAD_HATS
	path = /obj/item/clothing/head/pirate

/datum/gear/head/rice_hat
	name = "Rice hat"
	subcategory = LOADOUT_SUBCATEGORY_HEAD_HATS
	path = /obj/item/clothing/head/rice_hat

/datum/gear/head/ushanka
	name = "Ushanka"
	subcategory = LOADOUT_SUBCATEGORY_HEAD_HATS
	path = /obj/item/clothing/head/ushanka

/datum/gear/head/fedora
	name = "Fedora"
	subcategory = LOADOUT_SUBCATEGORY_HEAD_HATS
	path = /obj/item/clothing/head/fedora

/datum/gear/head/that
	name = "Top Hat"
	subcategory = LOADOUT_SUBCATEGORY_HEAD_HATS
	path = /obj/item/clothing/head/that

/datum/gear/head/widered
	name = "Wide red hat"
	subcategory = LOADOUT_SUBCATEGORY_HEAD_HATS
	path = /obj/item/clothing/head/widered

/datum/gear/head/ncr_cap
	name = "NCR garrison cap"
	subcategory = LOADOUT_SUBCATEGORY_HEAD_HATS
	path = /obj/item/clothing/head/f13/ncr_cap
	restricted_desc = "NCR"
	restricted_roles = list(
							"NCR Lieutenant",
							"NCR Medical Officer",
							"NCR Sergeant First Class",
							"NCR Sergeant",
							"NCR Corporal",
							"NCR Combat Engineer",
							"NCR Combat Medic",
							"NCR Trooper",
							"NCR Rear Echelon",
							"NCR Recruit",
							"NCR Off-Duty"
						)

/datum/gear/head/ncr_campaign
	name = "NCR campaign hat"
	subcategory = LOADOUT_SUBCATEGORY_HEAD_HATS
	path = /obj/item/clothing/head/f13/ncr_campaign
	restricted_desc = "NCR"
	restricted_roles = list(
							"NCR Sergeant First Class",
							"NCR Off-Duty"
							)

/datum/gear/head/ncr_stetson
	name = "NCR air cavalry stetson"
	subcategory = LOADOUT_SUBCATEGORY_HEAD_HATS
	path = /obj/item/clothing/head/f13/ncr_stetson
	restricted_desc = "NCR"
	restricted_roles = list("NCR Off-Duty")


//Berets
/datum/gear/head/beret
	name = "Black beret"
	subcategory = LOADOUT_SUBCATEGORY_HEAD_BERET
	path = /obj/item/clothing/head/beret/black

/datum/gear/head/ncr_infantry
	name = "NCR infantry beret"
	subcategory = LOADOUT_SUBCATEGORY_HEAD_BERET
	path = /obj/item/clothing/head/beret/ncr
	restricted_desc = "NCR"
	restricted_roles = list(
							"NCR Sergeant First Class",
							"NCR Sergeant",
							"NCR Corporal",
							"NCR Off-Duty"
						)

/datum/gear/head/ncr_infantry_officer
	name = "NCR infantry officer beret"
	subcategory = LOADOUT_SUBCATEGORY_HEAD_BERET
	path = /obj/item/clothing/head/beret/ncr_lt
	restricted_desc = "NCR"
	restricted_roles = list(		
							"NCR Lieutenant",
							"NCR Off-Duty"
						)

/datum/gear/head/ncr_recon
	name = "NCR recon beret"
	subcategory = LOADOUT_SUBCATEGORY_HEAD_BERET
	path = /obj/item/clothing/head/beret/ncr_recon
	restricted_desc = "NCR"
	restricted_roles = list(		
							"NCR Sergeant First Class",
							"NCR Sergeant",
							"NCR Corporal",
							"NCR Off-Duty",
							"NCR Ranger"
						)

/datum/gear/head/ncr_recon_officer
	name = "NCR recon officer beret"
	subcategory = LOADOUT_SUBCATEGORY_HEAD_BERET
	path = /obj/item/clothing/head/beret/ncr_recon_lt
	restricted_desc = "NCR Officers"
	restricted_roles = list(		
							"NCR Lieutenant",
							"NCR Off-Duty"
						)

/datum/gear/head/ncr_scout
	name = "NCR light infantry beret"
	subcategory = LOADOUT_SUBCATEGORY_HEAD_BERET
	path = /obj/item/clothing/head/beret/ncr_scout
	restricted_desc = "NCR"
	restricted_roles = list(
							"NCR Sergeant First Class",
							"NCR Sergeant",
							"NCR Corporal",
							"NCR Off-Duty"
						)

/datum/gear/head/ncr_scout_officer
	name = "NCR light infantry officer beret"
	subcategory = LOADOUT_SUBCATEGORY_HEAD_BERET
	path = /obj/item/clothing/head/beret/ncr_scout_lt
	restricted_desc = "NCR Officers"
	restricted_roles = list(		
							"NCR Lieutenant",
							"NCR Off-Duty"
						)

/datum/gear/head/ncr_medical
	name = "NCR combat medic beret"
	subcategory = LOADOUT_SUBCATEGORY_HEAD_BERET
	path = /obj/item/clothing/head/beret/ncr_medic
	restricted_desc = "NCR"
	restricted_roles = list(		
							"NCR Combat Medic",
							"NCR Off-Duty"
						)

/datum/gear/head/ncr_medical_officer
	name = "NCR medical officer beret"
	subcategory = LOADOUT_SUBCATEGORY_HEAD_BERET
	path = /obj/item/clothing/head/beret/ncr_medic_lt
	restricted_desc = "NCR Officers"
	restricted_roles = list(		
							"NCR Medical Officer",
							"NCR Off-Duty"
						)

/datum/gear/head/ncr_sapper
	name = "NCR sapper beret"
	subcategory = LOADOUT_SUBCATEGORY_HEAD_BERET
	path = /obj/item/clothing/head/beret/ncr_sapper
	restricted_desc = "NCR"
	restricted_roles = list(
							"NCR Combat Engineer",
							"NCR Off-Duty"
						)

/datum/gear/head/ncr_recon_ranger
	name = "ranger recon beret"
	subcategory = LOADOUT_SUBCATEGORY_HEAD_BERET
	path = /obj/item/clothing/head/beret/ncr_recon_ranger
	restricted_desc = "Rangers"
	restricted_roles = list("NCR Ranger")

/datum/gear/head/bos_beret
	name = "brotherhood beret"
	subcategory = LOADOUT_SUBCATEGORY_HEAD_BERET
	path = /obj/item/clothing/head/f13/boscap/beret
	restricted_desc = "BoS"
	restricted_roles = list(
							"Head Paladin",
							"Head Knight",
							"Head Scribe",
							"Star Paladin",
							"Star Knight",
							"Proctor",
							"Paladin",
							"Knight",
							"Scribe",
							"Initiate",
							"BoS Off-Duty"
	)

//Helmets
/datum/gear/head/steelpot_goggles
	name = "NCR storm helmet"
	subcategory = LOADOUT_SUBCATEGORY_HEAD_HELMET
	path = /obj/item/clothing/head/f13/ncr/steelpot_goggles
	restricted_desc = "NCR"
	restricted_roles = list("NCR Captain",
							"NCR Lieutenant",
							"NCR Medical Officer",
							"NCR Sergeant First Class",
							"NCR Sergeant",
							"NCR Corporal",
							"NCR Combat Engineer",
							"NCR Combat Medic",
							"NCR Trooper",
							"NCR Rear Echelon",
							"NCR Recruit"
						)

/datum/gear/head/steelpot_gambler
	name = "NCR gambler helmet"
	subcategory = LOADOUT_SUBCATEGORY_HEAD_HELMET	
	path = /obj/item/clothing/head/f13/ncr/steelpot_gambler
	restricted_desc = "NCR"
	restricted_roles = list("NCR Captain",
							"NCR Lieutenant",
							"NCR Medical Officer",
							"NCR Sergeant First Class",
							"NCR Sergeant",
							"NCR Corporal",
							"NCR Combat Engineer",
							"NCR Combat Medic",
							"NCR Trooper",
							"NCR Rear Echelon",
							"NCR Recruit"
						)

datum/gear/head/steelpot_bandolier
	name = "NCR bandolier helmet"
	subcategory = LOADOUT_SUBCATEGORY_HEAD_HELMET	
	path = /obj/item/clothing/head/f13/ncr/steelpot_bandolier
	restricted_desc = "NCR"
	restricted_roles = list("NCR Captain",
							"NCR Lieutenant",
							"NCR Medical Officer",
							"NCR Sergeant First Class",
							"NCR Sergeant",
							"NCR Corporal",
							"NCR Combat Engineer",
							"NCR Combat Medic",
							"NCR Trooper",
							"NCR Rear Echelon",
							"NCR Recruit"
						)

datum/gear/head/steelpot_patriot
	name = "NCR patriot helmet"
	subcategory = LOADOUT_SUBCATEGORY_HEAD_HELMET	
	path = /obj/item/clothing/head/f13/ncr/steelpot_patriot
	restricted_desc = "NCR"
	restricted_roles = list("NCR Captain",
							"NCR Lieutenant",
							"NCR Medical Officer",
							"NCR Sergeant First Class",
							"NCR Sergeant",
							"NCR Corporal",
							"NCR Combat Engineer",
							"NCR Combat Medic",
							"NCR Trooper",
							"NCR Rear Echelon",
							"NCR Recruit"
						)

/datum/gear/head/steelpot_mitchell
	name = "NCR mitchell helmet"
	subcategory = LOADOUT_SUBCATEGORY_HEAD_HELMET	
	path = /obj/item/clothing/head/f13/ncr/steelpot_mitchell
	restricted_desc = "NCR"
	restricted_roles = list("NCR Captain",
							"NCR Lieutenant",
							"NCR Medical Officer",
							"NCR Sergeant First Class",
							"NCR Sergeant",
							"NCR Corporal",
							"NCR Combat Engineer",
							"NCR Combat Medic",
							"NCR Trooper",
							"NCR Rear Echelon",
							"NCR Recruit"
						)

