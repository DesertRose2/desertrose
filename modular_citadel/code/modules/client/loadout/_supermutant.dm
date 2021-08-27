/datum/gear/supermutant
	category = LOADOUT_CATEGORY_SMUTANT
	subcategory = LOADOUT_SUBCATEGORY_SMUTANT_GENERAL
	slot = SLOT_IN_BACKPACK
	ckeywhitelist = list("honto335", "pisshole", "goldrobo", "prawn04", "jkjudgex", "theburningflame", "theeternalflame",
					"clearedobject", "magentaformula0", "ollieoxen", "fayettefrost", "allakai", "alanparkermasters",
					"marrone", 	"melodicdeity", "alasania", "mirkoloio", "novaskelly", "usotsukihime", "cythisia",
					"asterixcodix", "zestyspy", "psychoticcone", "julwalters", "thegreatcoward", "gurking", "whobeder04"
					)

// Shoes

/datum/gear/supermutant/shoes
	name = "Sandals"
	path = /obj/item/clothing/shoes/f13/mutie
	subcategory = LOADOUT_SUBCATEGORY_SMUTANT_SHOES

/datum/gear/supermutant/shoes/boots
	name = "Boots"
	path = /obj/item/clothing/shoes/f13/mutie/boots

/datum/gear/supermutant/shoes/boots/dark
	name = "Dark Boots"
	path = /obj/item/clothing/shoes/f13/mutie/boots/dark

/datum/gear/supermutant/shoes/ncr
	name = "NCR Boots"
	path = /obj/item/clothing/shoes/f13/mutie/boots/ncr
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
							"NCR Heavy Trooper",
							"NCR Rear Echelon",
							"NCR Recruit",
							"NCR Off-Duty"
						)

/datum/gear/supermutant/shoes/ncr/ranger
	name = "Ranger Boots"
	path = /obj/item/clothing/shoes/f13/mutie/boots/ncr/ranger
	restricted_desc = "Rangers"
	restricted_roles = list(
							"NCR Ranger",
							"NCR Veteran Ranger"
						)

// Suits

/datum/gear/supermutant/suit
	name = "Poncho"
	path = /obj/item/clothing/suit/armor/f13/mutie/poncho
	subcategory = LOADOUT_SUBCATEGORY_SMUTANT_SUIT
	cost = 3

/datum/gear/supermutant/suit/armour
	name = "Armour"
	path = /obj/item/clothing/suit/armor/f13/mutie/metal
	cost = 5

/datum/gear/supermutant/suit/armour/reinforced
	name = "Reinforced Armour"
	path = /obj/item/clothing/suit/armor/f13/mutie/metal/reinforced
	cost = 7

/datum/gear/supermutant/suit/ncr
	name = "NCR Armour"
	path = /obj/item/clothing/suit/armor/f13/combat/ncr/mutie
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
							"NCR Heavy Trooper",
							"NCR Rear Echelon",
							"NCR Recruit",
							"NCR Off-Duty"
						)

/datum/gear/supermutant/suit/armour/ncr/ranger
	name = "Ranger Armour"
	path = /obj/item/clothing/suit/armor/f13/combat/ncr_patrol/mutie
	restricted_desc = "Rangers"
	restricted_roles = list("NCR Ranger",
							"NCR Veteran Ranger"
							)

/datum/gear/supermutant/suit/armour/ncr/ranger/vet
	name = "Veteran Ranger Armour"
	path = /obj/item/storage/box/large/custom_kit/mutievet
	restricted_desc = "Veteran Ranger"
	restricted_roles = "NCR Veteran Ranger"
	cost = 8

//Mutant Veteran Ranger kit
/obj/item/storage/box/large/custom_kit/mutievet/PopulateContents()
	new /obj/item/modkit/riotgear/mutievet
	new /obj/item/modkit/riotgear_helmet/mutievet


// Uniforms

/datum/gear/supermutant/uniform
	name = "Shorts"
	path = /obj/item/clothing/under/f13/mutieshorts
	subcategory = LOADOUT_SUBCATEGORY_SMUTANT_UNIFORM

/datum/gear/supermutant/uniform/santa
	name = "Santa Suit"
	path = /obj/item/clothing/under/f13/mutiesanta

/datum/gear/supermutant/uniform/vault
	name = "Torn Vault suit"
	path = /obj/item/clothing/under/f13/vaultmutie

/datum/gear/supermutant/uniform/ranger
	name = "NCR Uniform"
	path = /obj/item/clothing/under/f13/ncrmutie
	restricted_desc = "NCR"
	restricted_roles = list("NCR Veteran Ranger",
							"NCR Ranger",
							"NCR Lieutenant",
							"NCR Medical Officer",
							"NCR Sergeant First Class",
							"NCR Sergeant",
							"NCR Corporal",
							"NCR Combat Engineer",
							"NCR Combat Medic",
							"NCR Trooper",
							"NCR Heavy Trooper",
							"NCR Rear Echelon",
							"NCR Recruit",
							"NCR Off-Duty"
						)

// Gloves and Bracers

/datum/gear/supermutant/gloves
	name = "Mutant Bracer"
	path = /obj/item/clothing/gloves/f13/mutie
	subcategory = LOADOUT_SUBCATEGORY_SMUTANT_GLOVES
	cost = 1

/datum/gear/supermutant/gloves/mk2
	name = "Reinforced Mutant Bracers"
	path = /obj/item/clothing/gloves/f13/mutie/mk2

/datum/gear/supermutant/gloves/sign
	name = "Mutant Signs"
	path = /obj/item/clothing/gloves/f13/mutie/sign

// Generally iconic items

datum/gear/supermutant/weapon
	name = "Sledgehammer"
	path = /obj/item/twohanded/sledgehammer
	cost = 4
	subcategory = LOADOUT_SUBCATEGORY_SMUTANT_GENERAL

/datum/gear/supermutant/weapon/ranged
	name = "Hunting Rifle"
	path = /obj/item/gun/ballistic/rifle/remington

