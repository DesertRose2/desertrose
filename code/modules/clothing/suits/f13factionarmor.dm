//FOR BOTH SUITS AND ARMORS BELONGING TO FACTIONS
//PLEASE PUT CUSTOM ARMORS IN f13armor.dm. All power armors are found in f13armor.dm.

//Raider
/obj/item/clothing/suit/armor/f13/raider
	name = "base raider armor"
	desc = "for testing"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list("tier" = 4, "energy" = 35, "bomb" = 30, "bio" = 0, "rad" = 0, "fire" = 25, "acid" = 25)
	strip_delay = 40

/obj/item/clothing/suit/armor/f13/raider/supafly
	name = "supa-fly raider armor"
	desc = "(IV) Fabulous mutant powers were revealed to me the day I held aloft my bumper sword and said...<br>BY THE POWER OF NUKA-COLA, I AM RAIDER MAN!"
	icon_state = "supafly"
	item_state = "supafly"

/obj/item/clothing/suit/armor/f13/raider/supafly/Initialize() //HQ parts reinforcement
	. = ..()
	AddComponent(/datum/component/armor_plate)

/obj/item/clothing/suit/armor/f13/raider/sadist
	name = "sadist raider armor"
	desc = "(IV) A bunch of metal chaps adorned with severed hands at the waist with a leather plate worn on the left shoulder. Very intimidating."
	icon_state = "sadist"
	item_state = "sadist"

/obj/item/clothing/suit/armor/f13/raider/sadist/Initialize()
	. = ..()
	AddComponent(/datum/component/armor_plate)

/obj/item/clothing/suit/armor/f13/raider/blastmaster
	name = "blastmaster raider armor"
	desc = "(IV) A suit composed largely of blast plating, though there's so many holes it's hard to say if it will protect against much."
	icon_state = "blastmaster"
	item_state = "blastmaster"
	max_heat_protection_temperature = ARMOR_MAX_TEMP_PROTECT
	flash_protect = 2

/obj/item/clothing/suit/armor/f13/raider/blastmaster/Initialize()
	. = ..()
	AddComponent(/datum/component/armor_plate)

/obj/item/clothing/suit/armor/f13/raider/yankee
	name = "yankee raider armor"
	desc = "(IV) A set of armor made from bulky plastic and rubber. A faded sports team logo is printed in various places. Go Desert Rats!"
	icon_state = "yankee"
	item_state = "yankee"

/obj/item/clothing/suit/armor/f13/raider/yankee/Initialize()
	. = ..()
	AddComponent(/datum/component/armor_plate)

/obj/item/clothing/suit/armor/f13/raider/badlands
	name = "badlands raider armor"
	desc = "(IV) A leather top with a bandolier over it and a straps that cover the arms."
	icon_state = "badlands"
	item_state = "badlands"

/obj/item/clothing/suit/armor/f13/raider/badlands/Initialize()
	. = ..()
	AddComponent(/datum/component/armor_plate)

/obj/item/clothing/suit/armor/f13/raider/painspike
	name = "painspike raider armor"
	desc = "(IV) A particularly unhuggable armor, even by raider standards. Extremely spiky."
	icon_state = "painspike"
	item_state = "painspike"

/obj/item/clothing/suit/armor/f13/raider/painspike/Initialize()
	. = ..()
	AddComponent(/datum/component/armor_plate)

/obj/item/clothing/suit/armor/f13/raider/iconoclast
	name = "iconoclast raider armor"
	desc = "(IV) A rigid armor set that appears to be fashioned from a radiation suit, or a mining suit."
	icon_state = "iconoclast"
	item_state = "iconoclast"

/obj/item/clothing/suit/armor/f13/raider/iconoclast/Initialize()
	. = ..()
	AddComponent(/datum/component/armor_plate)

/obj/item/clothing/suit/armor/f13/raider/combatduster
	name = "combat duster"
	desc = "(IV) An old military-grade pre-war combat armor under a weathered duster. It appears to be fitted with metal plates to replace the crumbling ceramic."
	icon_state = "combatduster"
	item_state = "combatduster"

/obj/item/clothing/suit/armor/f13/raider/combatduster/patrolduster
	name = "Patrol Duster"
	desc = "(IV) What appears to be an NCR patrol ranger's armor under a green tinted duster. The armor itself looks much more well kept then the duster itself, said duster looking somewhat faded. On the back of the duster, is a symbol of a skull with an arrow piercing through the eye."
	icon_state = "patrolduster"
	item_state = "patrolduster"

/obj/item/clothing/suit/armor/f13/raider/combatduster/Initialize()
	. = ..()
	AddComponent(/datum/component/armor_plate)

/obj/item/clothing/suit/armor/f13/raider/desperado
	name = "desperado duster"
	desc = "(IV) Lightly armored leather overcoat reeking of gunpowder and cigarretes."
	icon_state = "leathercoat-sec"
	item_state = "hostrench"
	body_parts_covered = CHEST|GROIN|ARMS|LEGS
	cold_protection = CHEST|GROIN|LEGS|ARMS
	heat_protection = CHEST|GROIN|LEGS|ARMS
	dog_fashion = null

/obj/item/clothing/suit/armor/f13/raider/desperado/Initialize()
	. = ..()
	AddComponent(/datum/component/armor_plate)

/obj/item/clothing/suit/armor/f13/raider/leather_jacket
	name = "raider combat leather jacket"
	icon_state = "combat_jacket"
	item_state = "combat_jacket"
	desc = "(IV) This heavily padded leather jacket is unusual in that it has two sleeves. You'll definitely make a fashion statement whenever, and wherever, you rumble."
	armor = list("tier" = 4, "energy" = 20, "bomb" = 30, "bio" = 0, "rad" = 0, "fire" = 25, "acid" = 25)

/obj/item/clothing/suit/armor/f13/raider/leather_jacket/Initialize()
	. = ..()
	AddComponent(/datum/component/armor_plate)

/obj/item/clothing/suit/armor/f13/raider/raider_duster
	name = "raider desert combat armor"
	desc = "(IV) An old military-grade pre-war combat armor under a weathered duster. It appears to be fitted with metal plates to replace the crumbling ceramic."
	icon_state = "reptiliatenebris"
	item_state = "reptiliatenebris"
	armor = list("tier" = 4, "energy" = 20, "bomb" = 30, "bio" = 0, "rad" = 0, "fire" = 25, "acid" = 25)

/obj/item/clothing/suit/armor/f13/raider/raider_duster/Initialize()
	. = ..()
	AddComponent(/datum/component/armor_plate)

/obj/item/clothing/suit/armor/f13/raider/templar
	name = "raider knight armor"
	desc = "(IV) A set of old rusty armor with black and red tabard strapped to it."
	icon_state = "templar"
	item_state = "templar"
	armor = list("tier" = 4, "energy" = 20, "bomb" = 30, "bio" = 0, "rad" = 0, "fire" = 25, "acid" = 25)

/obj/item/clothing/suit/armor/f13/raider/templar/Initialize()
	. = ..()
	AddComponent(/datum/component/armor_plate)

/obj/item/clothing/suit/armor/f13/exile
	name = "base faction exile armor"
	desc = "this is for testing."
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS
	armor = list("tier" = 4, "energy" = 20, "bomb" = 40, "bio" = 40, "rad" = 20, "fire" = 60, "acid" = 20)
	strip_delay = 30
	icon = 'icons/fallout/clothing/suits.dmi'

/obj/item/clothing/suit/armor/f13/exile/ncrexile
	name = "modified NCR armor"
	desc = "(IV) A modified detoriated armor kit consisting of NCR gear and scrap metal."
	icon_state = "ncrexile"
	item_state = "ncrexile"

/obj/item/clothing/suit/armor/f13/exile/ncrexile/Initialize()
	. = ..()
	AddComponent(/datum/component/armor_plate)

/obj/item/clothing/suit/armor/f13/exile/legexile
	name = "modified Legion armor"
	desc = "(IV) A modified detoriated armor kit consisting of Legion gear and scrap metal."
	icon_state = "legexile"
	item_state = "legexile"

/obj/item/clothing/suit/armor/f13/exile/legexile/Initialize()
	. = ..()
	AddComponent(/datum/component/armor_plate)

/obj/item/clothing/suit/armor/f13/exile/bosexile
	name = "modified Brotherhood armor"
	desc = "(IV) A modified detoriated armor kit consisting of brotherhood combat armor and scrap metal."
	icon_state = "brotherhood_armor_outcast"
	item_state = "brotherhood_armor_outcast"

/obj/item/clothing/suit/armor/f13/exile/bosexile/Initialize()
	. = ..()
	AddComponent(/datum/component/armor_plate)

/obj/item/clothing/suit/armor/f13/raider/raidercombat
	name = "raider combat armor"
	desc = "(V) An old military-grade pre-war combat armor. It appears to be fitted with metal plates to replace the crumbling ceramic."
	icon_state = "raider_combat"
	item_state = "raider_combat"
	armor = list("tier" = 5, "energy" = 30, "bomb" = 50, "bio" = 50, "rad" = 10, "fire" = 60, "acid" = 10)

/obj/item/clothing/suit/armor/f13/raider/raidermetal
	name = "raider metal armor"
	desc = "(V) A suit of welded, fused metal plates. Looks bulky, with great protection."
	icon_state = "raider_metal"
	item_state = "raider_metal"
	armor = list("tier" = 5, "energy" = 35, "bomb" = 50, "bio" = 50, "rad" = 10, "fire" = 60, "acid" = 10)
	resistance_flags = FIRE_PROOF

/obj/item/clothing/suit/armor/f13/raider/junker
	name = "Junker body armor"
	desc = "(IV) A heavier armor consisting purely of ramshackle plating clearly made from old robots tack welded together."
	icon_state = "junker_armor"
	item_state = "junker_armor"
	slowdown = 0.2
	resistance_flags = FIRE_PROOF

/obj/item/clothing/suit/armor/f13/raider/junker/boss
	desc = "(VII) A heavy armor of pre-war riot gear reinforced with ramshackle plating."
	icon_state = "junker_duster"
	item_state = "junker_duster"
	slowdown = 0.3
	armor = list("tier" = 7, "energy" = 25, "bomb" = 30, "bio" = 0, "rad" = 0, "fire" = 5, "acid" = 35)

//Legion

/obj/item/clothing/suit/armor/f13/medicus
	name = "medicus apron"
	desc = "The waxed cotton apron of a Medicus, marked with a red bull insignia."
	icon_state = "legmedicus"
	armor = list("energy" = 0, "bomb" = 0, "bio" = 20, "rad" = 0, "fire" = 0, "acid" = 0)
	allowed = list(/obj/item/scalpel, /obj/item/surgical_drapes, /obj/item/cautery, /obj/item/hemostat, /obj/item/retractor)

/obj/item/clothing/suit/armor/f13/opifex
	name = "opifex apron"
	desc = "A heavy leather apron designed for protecting the user when metalforging. The bull insignia marks the wearer as an Opifex."
	icon_state = "opifex_apron"
	item_state = "opifex_apron"
	blood_overlay_type = "armor"
	armor = list("melee" = 5,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 10, "acid" = 5)
	allowed = list(/obj/item/crowbar,
		/obj/item/screwdriver,
		/obj/item/weldingtool,
		/obj/item/wirecutters,
		/obj/item/wrench,
		/obj/item/stack/cable_coil,
		/obj/item/clothing/gloves)

/obj/item/clothing/suit/armor/f13/slavelabor
	name = "old leather strips"
	desc = "Worn leather strips, used as makeshift protection from chafing and sharp stones by labor slaves."
	icon_state = "legslaveleather"
	item_state = "legslaveleather"

/obj/item/clothing/neck/cloak/treasurer
	name = "treasurers cloak"
	desc = "The grey and black cloak with gold thread trimming shows the wearer is entrusted with matters of money and records."
	icon = 'icons/obj/clothing/cloaks.dmi'
	icon_state = "legtrescloak"
	item_state = "legtrescloak"
	w_class = WEIGHT_CLASS_SMALL
	body_parts_covered = CHEST|GROIN|LEGS|ARMS

/obj/item/clothing/suit/armor/f13/legion
	name = "legion armor"
	desc = "Unadorned Legion armor."
	icon_state = "legrecruit"
	item_state = "legarmor"
	lefthand_file = 'icons/mob/inhands/clothing_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/clothing_righthand.dmi'
	body_parts_covered = CHEST|GROIN|ARMS|LEGS
	allowed = list(/obj/item/gun, /obj/item/claymore, /obj/item/throwing_star/spear, /obj/item/restraints/legcuffs/bola, /obj/item/twohanded, /obj/item/melee/smith, /obj/item/melee/smith/twohand, /obj/item/nullrod/claymore/chainsaw_sword)
	armor = list("tier" = 4, "energy" = 10, "bomb" = 16, "bio" = 30, "rad" = 20, "fire" = 50, "acid" = 0)

/obj/item/clothing/suit/armor/f13/legion/recruit
	name = "legion recruit armor"
	desc = "(IV) Legion recruit armor is a common light armor, supplied to recruit legionaries and to recruit decanus units. Like most Legion armor, it is made from repurposed sports equipment, consisting of a football player's protective shoulder and chest pads reinforced with additional leather padding and worn over a baseball catcher's vest."
	icon_state = "legrecruit"

/obj/item/clothing/suit/armor/f13/legion/recruit/scout
	name = "legion scout armor"
	desc = "(III) A modified set of recruit armor with the chestplate removed to provide greater agility and reduce weight."
	icon_state = "legscout"
	slowdown = -0.15
	armor = list("tier" = 3, "energy" = 10, "bomb" = 16, "bio" = 30, "rad" = 20, "fire" = 50, "acid" = 0)

/obj/item/clothing/suit/armor/f13/legion/prime
	name = "legion prime armor"
	desc = "(IV) It's a legion prime armor, supplied to recruits who have survived several skirmishes, and are more worthy of sturdier equipment."
	icon_state = "legprime"
	slowdown = -0.13
	armor = list("tier" = 4, "energy" = 15, "bomb" = 25, "bio" = 40, "rad" = 20, "fire" = 60, "acid" = 0)

/obj/item/clothing/suit/armor/f13/legion/prime/explorer
	name = "legion explorer armor"
	desc = "(IV) A modified set of prime armor with much of the metal replaced by layered strips of laminated linen and leather."
	icon_state = "legexplorer"
	slowdown = -0.13
	armor = list("tier" = 4, "energy" = 15, "bomb" = 25, "bio" = 40, "rad" = 20, "fire" = 60, "acid" = 0)

/obj/item/clothing/suit/armor/f13/legion/prime/slavemaster
	name = "legion prefect armor"
	desc = "(IV) A light armor issued to disciplinary corps of the Caesar's Legion."
	icon_state = "legslavemaster"
	slowdown = -0.13
	armor = list("tier" = 4, "energy" = 20, "bomb" = 25, "bio" = 40, "rad" = 20, "fire" = 60, "acid" = 0)

/obj/item/clothing/suit/armor/f13/legion/vet
	name = "legion veteran armor"
	desc = "(V) Armor worn by veteran legionaries who have proven their combat prowess in many battles, its hardened leather is sturdier than that of previous ranks."
	icon_state = "legvet"
	slowdown = -0.1
	armor = list("tier" = 5, "energy" = 15, "bomb" = 25, "bio" = 50, "rad" = 20, "fire" = 70, "acid" = 0)

/obj/item/clothing/suit/armor/f13/legion/heavy
	name = "legion veteran decan armor"
	desc = "(V) Heavy metal armor worn by the Veteran Decanii retinue of the region."
	icon_state = "legmetal"
	item_state = "legmetal"
	slowdown = -0.1
	armor = list("tier" = 5, "energy" = 15, "bomb" = 25, "bio" = 50, "rad" = 20, "fire" = 70, "acid" = 0)

/obj/item/clothing/suit/armor/f13/legion/vet/vexil
	name = "legion vexillarius armor"
	slowdown = -0.12
	desc = "(V) The armor appears to be based off of a suit of Legion veteran armor, with the addition of circular metal plates attached to the torso, as well as a banner displaying the flag of the Legion worn on the back."
	icon_state = "legvexil"

/obj/item/clothing/suit/armor/f13/legion/venator
	name = "legion venator armor"
	desc = "(VI) The armor appears to be based off of a suit of Legion veteran armor, with the addition of bracers and a chainmail skirt."
	icon_state = "legvenator"
	armor = list("tier" = 6, "energy" = 15, "bomb" = 25, "bio" = 50, "rad" = 20, "fire" = 70, "acid" = 0)

//Custom venator armor for Luti
/obj/item/clothing/suit/armor/f13/legion/venator/ursus
	name = "Ursus Homicida"
	desc = "(VI) A set of modified veteran armor complete with multiple parts of weathered NCR ranger gear. Reinforced with ceramic carriers and knee protection the armor appears to have been recycled, engrabed with a small golden bull and the initials 'F.L' engrabed in a gold inlay."
	icon_state = "ursus_homicida"
	item_state = "ursus_homicida"

/obj/item/clothing/suit/armor/f13/legion/vet/orator
	name = "legion orator armor"
	desc = "(VI) The armor appears to be based off of a suit of Legion veteran armor, with the addition of bracers, a chainmail skirt, and large pauldrons.  A tabard emblazoned with the bull is loosely draped over the torso."
	icon_state = "legheavy"
	armor = list("tier" = 6, "energy" = 15, "bomb" = 25, "bio" = 50, "rad" = 20, "fire" = 70, "acid" = 0)

/obj/item/clothing/suit/armor/f13/legion/centurion
	name = "legion centurion armor"
	desc = "(VII) The Legion centurion armor is by far the strongest suit of armor available to Caesar's Legion. The armor is composed from other pieces of armor taken from that of the wearer's defeated opponents in combat."
	icon_state = "legcenturion"
	slowdown = -0.13
	armor = list("tier" = 7, "energy" = 35, "bomb" = 39, "bio" = 60, "rad" = 20, "fire" = 80, "acid" = 0)

/obj/item/clothing/suit/armor/f13/legion/palacent
	name = "paladin-slayer centurion armor"
	desc = "(VIII) The armor of a Centurion who has bested one or more Brotherhood Paladins, adding pieces of his prizes to his own defense. The symbol of the Legion is crudely painted on this once-marvelous suit of armor."
	icon_state = "palacent"
	slowdown = 0
	armor = list("tier" = 8, "energy" = 40, "bomb" = 39, "bio" = 60, "rad" = 30, "fire" = 80, "acid" = 10)

/obj/item/clothing/suit/armor/f13/legion/palacent/custom_excess
	name = "Champion of Kanab's Armor"
	desc = "(VII) The armor of the Champion and Conqueror of the city in Utah named Kanab. The armor is made up of pieces of Power Armor and pre-war Riot Gear, the shin guards are spraypainted a dark crimson and the Power Armour pauldron has a red trim. The symbol of a Pheonix is carefully engraved and painted upon the chest piece... I wonder what it means.."
	icon_state = "palacent_excess"
	item_state = "palacent_excess"

/obj/item/clothing/suit/armor/f13/legion/rangercent
	name = "ranger-hunter centurion armor"
	desc = "(VI) A suit of armor collected over the years by the deaths of countless NCR rangers. It forfeits protection for added speed."
	icon_state = "rangercent"
	item_state = "rangercent"
	slowdown = -0.20
	armor = list("tier" = 5, "energy" = 25, "bomb" = 39, "bio" = 60, "rad" = 20, "fire" = 80, "acid" = 0)

/obj/item/clothing/suit/armor/f13/legion/legate
	name = "legion legate armor"
	desc = "(VII) The armor appears to be a full suit of heavy gauge steel and offers full body protection. It also has a cloak in excellent condition, but the armor itself bears numerous battle scars and the helmet is missing half of the left horn. The Legate's suit appears originally crafted, in contrast to other Legion armor which consists of repurposed pre-War sports equipment."
	icon_state = "leglegat"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS
	armor = list("tier" = 8, "energy" = 40, "bomb" = 45, "bio" = 60, "rad" = 20, "fire" = 80, "acid" = 0)

/obj/item/clothing/suit/armor/f13/combat/legion
	name = "Legion combat armor"
	desc = "(V) An old military grade pre war combat armor and, repainted to the colour scheme of Caesar's Legion."
	icon_state = "legion_armor"
	item_state = "legion_armor"

/obj/item/clothing/suit/armor/f13/combat/mk2/legion
	name = "reinforced Legion combat armor"
	desc = "(VI) A reinforced set of bracers, greaves, and torso plating of prewar design. This one is kitted with additional plates and, repainted to the colour scheme of Caesar's Legion."
	icon_state = "legion_armor_mk2"
	item_state = "legion_armor_mk2"

//NCR

/obj/item/clothing/suit/armor/f13/ncrarmor/lieutenant/ncr_officer_coat
	name = "NCR officer vest"
	desc = "(VI) A special issue NCR officer's armour with an added thick overcoat for protection from the elements."
	icon_state = "ncr_officer_coat"
	item_state = "ncr_officer_coat"


//NCR Ranger

/obj/item/clothing/suit/armor/f13/rangerrig
	name = "chest gear harness"
	desc = "(V) A handmade tactical rig. The actual rig is made of a black, fiberous cloth, being attached to a dusty desert-colored belt. A flask and two ammo pouches hang from the belt."
	icon_state = "r_gear_rig"
	item_state = "r_gear_rig"
	armor = list("tier" = 5, "energy" = 20, "bomb" = 25, "bio" = 30, "rad" = 20, "fire" = 60, "acid" = 0)
	slowdown = -0.1

/obj/item/clothing/suit/armor/f13/ncr_trenchcloak
	name = "ranger trenchcloak"
	desc = "(V) A cloak worn by Rangers of the New California Republic. Often seen on trail rangers or scouts, this cloak provides ample protection from the deserts harsh sunlight during the hours spent in the field and from the elements."
	icon_state = "ncr_trenchcloak"
	item_state = "ncr_trenchcloak"
	armor = list("tier" = 5, "energy" = 20, "bomb" = 25, "bio" = 30, "rad" = 20, "fire" = 60, "acid" = 0)
	slowdown = -0.1

/obj/item/clothing/suit/armor/f13/rangerrecon_jacket
	name = "ranger jacket"
	desc = "(V) A thick leather jacket, its colors already bleached from all the days it spent under the sun. It features a two headed standing bear on its back."
	icon_state = "rangerjacket"
	item_state = "rangerjacket"
	armor = list("tier" = 5, "energy" = 20, "bomb" = 25, "bio" = 30, "rad" = 20, "fire" = 60, "acid" = 0)
	slowdown = -0.1

/obj/item/clothing/suit/armor/f13/modif_r_vest
	name = "subdued ranger vest"
	desc = "(IV) A quaint little jacket and scarf worn by NCR trail rangers. This one has the leather bleached and the scarf dyed black."
	icon_state = "modif_r_vest"
	item_state = "modif_r_vest"
	armor = list("tier" = 4, "energy" = 45, "bomb" = 55, "bio" = 60, "rad" = 15, "fire" = 60, "acid" = 30)

/obj/item/clothing/suit/armor/f13/combat/ncr_patrol/scout
	name = "ranger scout armor"
	desc = "(VI) A refurbished set of NCRA 3rd Scouts armor, now with heavier plating together with arm and leg guards. A two-headed bear has been painted on its chest."
	icon_state = "refurb_scout"
	item_state = "refurb_scout"
	armor = list("tier" = 6, "energy" = 45, "bomb" = 55, "bio" = 60, "rad" = 15, "fire" = 60, "acid" = 30)

/obj/item/clothing/suit/armor/f13/ncrcfjacket
	name = "NCRCF jacket"
	icon_state = "ncrcfjacket"
	item_state = "ncrcfjacket"
	desc = "(I) A cheap, standard issue teal canvas jacket issued to poor suckers who find themselves at the butt-end of the NCR's judiciary system."
	armor = list("tier" = 1, "energy" = 0, "bomb" = 15, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

//Oasis/Town
/obj/item/clothing/suit/armor/f13/town
	name = "town trenchcoat"
	desc = "(III) A non-descript black trenchcoat."
	icon_state = "towntrench"
	item_state = "hostrench"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list("tier" = 3, "energy" = 40, "bomb" = 25, "bio" = 40, "rad" = 30, "fire" = 80, "acid" = 0)

/obj/item/clothing/suit/armor/f13/town/mayor
	name = "mayor trenchcoat"
	desc = "(IV) A symbol of the mayor's authority (or lack thereof)."
	armor = list("tier" = 4, "energy" = 40, "bomb" = 25, "bio" = 40, "rad" = 35, "fire" = 80, "acid" = 0)

/obj/item/clothing/suit/armor/f13/town/sheriff
	name = "sheriff trenchcoat"
	desc = "(V) A trenchcoat which does not attempt to hide the full-body combat armor beneath it."
	icon_state = "towntrench_heavy"
	armor = list("tier" = 5, "energy" = 40, "bomb" = 25, "bio" = 40, "rad" = 40, "fire" = 80, "acid" = 0)

/obj/item/clothing/suit/armor/f13/town/deputy
	name = "deputy trenchcoat"
	desc = "(IV) An armored trench coat with added shoulderpads, a chestplate, and legguards."
	icon_state = "towntrench_medium"
	armor = list("tier" = 4, "energy" = 40, "bomb" = 25, "bio" = 40, "rad" = 35, "fire" = 80, "acid" = 0)

//Great Khan
/obj/item/clothing/suit/armor/khan_jacket
	name = "khan armored jacket"
	desc = "(IV) The symbol of the greatest pushers."
	icon_state = "khan_jacket"
	item_state = "khan_jacket"
	armor = list("tier" = 4, "energy" = 20, "bomb" = 10, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

//Wayfarer
/obj/item/clothing/suit/armor/f13/tribe_armor
	name = "light tribal armor"
	desc = "(IV) Light armor made of leather stips and a large, flat piece of turquoise.Armor commonplace among the Wayfinders."
	icon_state = "tribal_armor"
	item_state = "tribal_armor"
	body_parts_covered = CHEST|GROIN|ARMS
	armor = list("tier" = 4, "energy" = 25, "bomb" = 25, "bio" = 70, "rad" = 65, "fire" = 80, "acid" = 100)
	allowed = list(/obj/item/gun, /obj/item/kitchen, /obj/item/twohanded, /obj/item/claymore, /obj/item/twohanded/spear, /obj/item/melee/smith, /obj/item/melee/smith/twohand
)

/obj/item/clothing/suit/armor/f13/tribe_heavy_armor
	name = "heavy tribal armor"
	desc = "(V) Heavy armor make of sturdy leather and pieces of bone. Worn by seasoned veterans within the Wayfinder tribe."
	icon_state = "heavy_tribal_armor"
	item_state = "heavy_tribal_armor"
	body_parts_covered = CHEST|GROIN|ARMS
	armor = list("tier" = 5, "energy" = 45, "bomb" = 55, "bio" = 60, "rad" = 15, "fire" = 60, "acid" = 30)
	flags_inv = HIDEJUMPSUIT
	allowed = list(/obj/item/gun, /obj/item/kitchen, /obj/item/twohanded, /obj/item/claymore, /obj/item/twohanded/spear, /obj/item/melee/smith, /obj/item/melee/smith/twohand
)

//Followers

//Vault

/obj/item/clothing/suit/armor/f13/riot/vault
	name = "VTCC riot armour"
	desc = "(V) A suit of riot armour adapted from the design of the pre-war U.S.M.C. armour, painted blue and white."
	icon_state = "vtcc_riot_gear"
	item_state = "vtcc_riot_gear"
	armor = list("tier" = 5, "energy" = 35, "bomb" = 35, "bio" = 40, "rad" = 10, "fire" = 60, "acid" = 10)
	slowdown = -0.1

/obj/item/clothing/suit/armor/f13/riot/vault/scout
	name = "VTCC scout armour"
	desc = "(IV) A suit of stripped back riot armour, adapted from the pre-war U.S.M.C armours and stripped back."
	icon_state = "vtcc_scout_gear"
	item_state = "vtcc_scout_gear"
	armor = list("tier" = 4, "energy" = 30, "bomb" = 25, "bio" = 30, "rad" = 10, "fire" = 50, "acid" = 10)
	slowdown = -0.13

/obj/item/clothing/suit/armor/f13/riot/vault/heavy
	name = "VTCC riot supression armor"
	desc = "(VI) A suit of heavy riot armour adapted from the design of the pre-war U.S.M.C. armour, this model appears to have bits of combat armor strapped to it to reinforce it."
	icon_state = "vtcc_heavy_riot_gear"
	item_state = "vtcc_heavy_riot_gear"
	armor = list("tier" = 6, "energy" = 40, "bomb" = 40, "bio" = 30, "rad" = 15, "fire" = 65, "acid" = 30)

//THE GRAVEYARD
//UNUSED or LEGACY - RETAINED IN CASE DESIRED FOR ADMIN SPAWN OR REIMPLEMENATION. MAY NOT BE EVERYTHING THAT'S UNUSED. TEST BEFORE USING
//IF PUT BACK INTO USE, PLEASE FILE IT BACK SOMEWHERE ABOVE

/obj/item/clothing/suit/armor/f13/gunnerplates
	name = "gunner armor"
	desc = "(V) An old military grade pre war combat armor. This armor has a skull painted on the back to symbolize the gunners."
	icon_state = "GunnerPlates"
	item_state = "GunnerPlates"
	slowdown = 0
	flags_inv = HIDEJUMPSUIT|HIDENECK
	icon = 'icons/fallout/clothing/suits.dmi'
	armor = list("tier" = 5, "energy" = 45, "bomb" = 55, "bio" = 65, "rad" = 10, "fire" = 60, "acid" = 20)

/obj/item/clothing/suit/armor/f13/caeserpelt
	name = "Caesars' Pelt"
	desc = "(VIII) A pelt fit for Caeser himself. Ave!"
	icon = 'icons/fallout/clothing/suits.dmi'
	icon_state = "caesar_pelt"
	item_state = "caeser_pelt"
	armor = list("tier" = 8, "energy" = 45, "bomb" = 55, "bio" = 65, "rad" = 10, "fire" = 60, "acid" = 20)

/obj/item/clothing/suit/armor/f13/town/embroidered
	name = "embroidered trenchcoat"
	desc = "(V) A custom armored trench coat with extra-length and a raised collar. There's a flower embroidered onto the back, although the color is a little faded."
	icon_state = "towntrench_special"
	item_state = "towntrench_special"
	armor = list("tier" = 5, "energy" = 40, "bomb" = 25, "bio" = 40, "rad" = 35, "fire" = 80, "acid" = 0)



/obj/item/clothing/suit/armor/f13/rangercombat/old
	name = "worn veteran ranger combat armor"
	desc = "A unique armor, that has been in countless battles and caused much bloodshed."
	icon_state = "oldranger"
	item_state = "oldranger"
	armor = list("tier" = 4, "energy" = 20, "bomb" = 20, "bio" = 0, "rad" = 30, "fire" = 20, "acid" = 20)
	icon = 'icons/fallout/clothing/suits.dmi'

/obj/item/clothing/suit/armor/f13/rangercombat/eliteriot
	name = "elite riot gear"
	desc = "(VIII) A heavily reinforced set of military grade armor, commonly seen in the Divide now repurposed and reissued to Chief Rangers."
	icon_state = "elite_riot"
	item_state = "elite_riot"
	armor = list("tier" = 8, "energy" = 60, "bomb" = 70, "bio" = 60, "rad" = 60, "fire" = 90, "acid" = 50)
	icon = 'icons/fallout/clothing/suits.dmi'

/obj/item/clothing/suit/armor/f13/rangercombat/eliteriot/reclaimed
	name = "reclaimed desert ranger armor"
	desc = "(IV) A refurbished and personalized set of pre-unification desert ranger gear."
	icon_state = "reclaimed_desert_ranger"
	item_state = "reclaimed_desert_ranger"
	armor = list("tier" = 4, "energy" = 30, "bomb" = 30, "bio" = 30, "rad" = 30, "fire" = 30, "acid" = 30)
	icon = 'icons/fallout/clothing/suits.dmi'

/obj/item/clothing/suit/armor/f13/rangercombat/desert
	name = "desert ranger combat armor"
	desc = "(VII) This is the original armor the NCR Ranger Combat armor was based off of. An awe inspiring suit of armor used by the legendary Desert Rangers."
	icon_state = "desert_ranger"
	item_state = "desert_ranger"

/obj/item/clothing/suit/armor/f13/rangercombat/marine
	name = "marine riot gear"
	desc = "(VII) A pre-war suit of U.S.M.C. issue riot gear. The armor looks to be in impeccable condition, the duster however is not."
	icon_state = "usmc_riot_gear"
	item_state = "usmc_riot_gear"

/obj/item/clothing/suit/armor/f13/ncrarmor/soldier
	name = "standard issue trooper armor"
	desc = "A set of NCR armor that consists of an armored breastplate, metal pauldrons, and gauntlets, worn by NCR soldiers in combat environments.<br>This one has had its breastplate emblazoned with the emblem of the NCR, that has slightly faded over time."
	icon_state = "ncr_armor2"
	item_state = "ncr_armor2"
	icon = 'icons/fallout/clothing/suits.dmi'

/obj/item/clothing/suit/armor/f13/ncrarmor/patriot
	name = "trooper armor of \"Patriot\" battalion"
	desc = "A set of NCR armor that consists of an armored breastplate, metal pauldrons and gauntlets, worn by NCR patriots in combat environments.<br>This one has a five-pointed star painted over the chestplate with white paint - it must be a battalion insignia."
	icon_state = "ncr_armor3"
	item_state = "ncr_armor3"
	icon = 'icons/fallout/clothing/suits.dmi'

/obj/item/clothing/suit/armor/f13/ncrarmor/commie
	name = "trooper armor of \"Commie\" battalion"
	desc = "A set of NCR armor that consists of an armored breastplate, metal pauldrons and gauntlets, worn by NCR comrades in combat environments.<br>This one has a five-pointed star painted over the chestplate with red paint - it must be a battalion insignia."
	icon_state = "ncr_armor4"
	item_state = "ncr_armor4"
	icon = 'icons/fallout/clothing/suits.dmi'

/obj/item/clothing/suit/armor/f13/ncrarmor/preacher
	name = "trooper armor of \"Preacher\" battalion"
	desc = "A set of NCR armor that consists of an armored breastplate, metal pauldrons and gauntlets, worn by NCR zealots in combat environments.<br>This one has a holy cross painted over the chestplate with yellow paint - it must be a battalion insignia."
	icon_state = "ncr_armor5"
	item_state = "ncr_armor5"

/obj/item/clothing/suit/armor/f13/ncrarmor/lover
	name = "trooper armor of \"Lover\" battalion"
	desc = "A set of NCR armor that consists of an armored breastplate, metal pauldrons and gauntlets, worn by NCR lovers in combat environments.<br>This one has a heart symbol painted over the chestplate with pink paint - it must be a battalion insignia."
	icon_state = "ncr_armor6"
	item_state = "ncr_armor6"
	icon = 'icons/fallout/clothing/suits.dmi'

/obj/item/clothing/suit/armor/f13/ncrarmor/stalker //Cheeki breeki i v damke !!!
	name = "trooper armor of \"Stalker\" battalion"
	desc = "A set of NCR armor that consists of an armored breastplate, metal pauldrons and gauntlets, worn by NCR explorers in combat environments.<br>This one has a radiation symbol painted over the chestplate with yellow paint - it must be a battalion insignia."
	icon_state = "ncr_armor7"
	item_state = "ncr_armor7"
	icon = 'icons/fallout/clothing/suits.dmi'

/obj/item/clothing/suit/armor/f13/ncrarmor/punisher
	name = "trooper armor of \"Punisher\" battalion"
	desc = "A set of NCR armor that consists of an armored breastplate, metal pauldrons and gauntlets, worn by NCR heroes and villains in combat environments.<br>This one has a skull symbol painted over the chestplate with white paint - it must be a battalion insignia."
	icon_state = "ncr_armor8"
	item_state = "ncr_armor8"
	icon = 'icons/fallout/clothing/suits.dmi'

/obj/item/clothing/suit/armor/f13/ncrarmor/facewrap
	name = "face wrap armor"
	desc = "(IV) A set of NCR armor that consists of an armored breastplate, metal pauldrons and gauntlets, worn by NCR scouts in combat environments.<br>This one has the facewrap, designed to be pulled over the user's face to protect oneself from dust particles and other mainly radioactive elements."
	icon_state = "ncr_armor9"
	item_state = "ncr_armor9"
	armor = list("tier" = 4, "energy" = 10, "bomb" = 20, "bio" = 0, "rad" = 30, "fire" = 10, "acid" = 10) //Better radiation protection, thank the facewrap bro!
	icon = 'icons/fallout/clothing/suits.dmi'

//Enclave/Remnants

/obj/item/clothing/suit/armor/f13/combat/enclave
	name = "enclave combat armor"
	desc = "(VI) An old set of pre-war combat armor, painted black."
	icon_state = "enclave_armor"
	item_state = "enclave_armor"
	armor = list("tier" = 6, "energy" = 75, "bomb" = 70, "bio" = 80, "rad" = 80, "fire" = 80, "acid" = 50)

/obj/item/clothing/suit/armor/f13/combat/remnant
	name = "remnant combat armor"
	desc = "(VI) A dark armor, used commonly in espionage or shadow ops."
	icon_state = "remnant"
	item_state = "remnant"
	armor = list("tier" = 6, "energy" = 75, "bomb" = 70, "bio" = 80, "rad" = 80, "fire" = 80, "acid" = 50)

