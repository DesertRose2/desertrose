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

/obj/item/clothing/suit/armor/f13/raider/sadist
	name = "sadist raider armor"
	desc = "(IV) A bunch of metal chaps adorned with severed hands at the waist with a leather plate worn on the left shoulder. Very intimidating."
	icon_state = "sadist"
	item_state = "sadist"

/obj/item/clothing/suit/armor/f13/raider/blastmaster
	name = "blastmaster raider armor"
	desc = "(IV) A suit composed largely of blast plating, though there's so many holes it's hard to say if it will protect against much."
	icon_state = "blastmaster"
	item_state = "blastmaster"
	max_heat_protection_temperature = ARMOR_MAX_TEMP_PROTECT
	flash_protect = 2

/obj/item/clothing/suit/armor/f13/raider/yankee
	name = "yankee raider armor"
	desc = "(IV) A set of armor made from bulky plastic and rubber. A faded sports team logo is printed in various places. Go Desert Rats!"
	icon_state = "yankee"
	item_state = "yankee"

/obj/item/clothing/suit/armor/f13/raider/badlands
	name = "badlands raider armor"
	desc = "(IV) A leather top with a bandolier over it and a straps that cover the arms."
	icon_state = "badlands"
	item_state = "badlands"

/obj/item/clothing/suit/armor/f13/raider/painspike
	name = "painspike raider armor"
	desc = "(IV) A particularly unhuggable armor, even by raider standards. Extremely spiky."
	icon_state = "painspike"
	item_state = "painspike"

/obj/item/clothing/suit/armor/f13/raider/iconoclast
	name = "iconoclast raider armor"
	desc = "(IV) A rigid armor set that appears to be fashioned from a radiation suit, or a mining suit."
	icon_state = "iconoclast"
	item_state = "iconoclast"

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

/obj/item/clothing/suit/armor/f13/raider/desperado
	name = "desperado duster"
	desc = "(IV) Lightly armored leather overcoat reeking of gunpowder and cigarretes."
	icon_state = "leathercoat-sec"
	item_state = "hostrench"
	body_parts_covered = CHEST|GROIN|ARMS|LEGS
	cold_protection = CHEST|GROIN|LEGS|ARMS
	heat_protection = CHEST|GROIN|LEGS|ARMS
	dog_fashion = null

/obj/item/clothing/suit/armor/f13/raider/leather_jacket
	name = "raider combat leather jacket"
	icon_state = "combat_jacket"
	item_state = "combat_jacket"
	desc = "(IV) This heavily padded leather jacket is unusual in that it has two sleeves. You'll definitely make a fashion statement whenever, and wherever, you rumble."
	armor = list("tier" = 4, "energy" = 20, "bomb" = 30, "bio" = 0, "rad" = 0, "fire" = 25, "acid" = 25)

/obj/item/clothing/suit/armor/f13/raider/raider_duster
	name = "raider desert combat armor"
	desc = "(IV) An old military-grade pre-war combat armor under a weathered duster. It appears to be fitted with metal plates to replace the crumbling ceramic."
	icon_state = "reptiliatenebris"
	item_state = "reptiliatenebris"
	armor = list("tier" = 4, "energy" = 20, "bomb" = 30, "bio" = 0, "rad" = 0, "fire" = 25, "acid" = 25)

/obj/item/clothing/suit/armor/f13/raider/templar
	name = "raider knight armor"
	desc = "(IV) A set of old rusty armor with black and red tabard strapped to it."
	icon_state = "templar"
	item_state = "templar"
	armor = list("tier" = 4, "energy" = 20, "bomb" = 30, "bio" = 0, "rad" = 0, "fire" = 25, "acid" = 25)

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

/obj/item/clothing/suit/armor/f13/exile/legexile
	name = "modified Legion armor"
	desc = "(IV) A modified detoriated armor kit consisting of Legion gear and scrap metal."
	icon_state = "legexile"
	item_state = "legexile"

/obj/item/clothing/suit/armor/f13/exile/bosexile
	name = "modified Brotherhood armor"
	desc = "(IV) A modified detoriated armor kit consisting of brotherhood combat armor and scrap metal."
	icon_state = "brotherhood_armor_outcast"
	item_state = "brotherhood_armor_outcast"

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
	name = "heavy Junker body armor"
	desc = "(VII) A heavy armor of pre-war riot gear reinforced with ramshackle plating."
	icon_state = "junker_duster"
	item_state = "junker_duster"
	slowdown = 0.3
	armor = list("tier" = 7, "energy" = 25, "bomb" = 30, "bio" = 0, "rad" = 0, "fire" = 5, "acid" = 35)

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
	name = "salvaged tribal armor"
	desc = "(IV) A set of scrap and banded metal armor forged by the Wayfarer tribe, due to it's lightweight and unrestrictive nature,  it's used by scouts and agile hunters. A torn cloak hangs around its neck, protecting the user from the harsh desert sands."
	icon_state = "tribal_armor"
	item_state = "tribal_armor"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS|HANDS
	armor = list("tier" = 4, "energy" = 25, "bomb" = 25, "bio" = 70, "rad" = 65, "fire" = 80, "acid" = 100)
	always_reskinnable = TRUE
	unique_reskin = list("Old School" = "tribal_armor",
						"New School" = "tribal_armor_old"
						)
	allowed = list(/obj/item/gun, /obj/item/kitchen, /obj/item/twohanded, /obj/item/claymore, /obj/item/twohanded/spear, /obj/item/melee/smith, /obj/item/melee/smith/twohand
)


/obj/item/clothing/suit/armor/f13/tribe_heavy_armor
	name = "heavy tribal armor"
	desc = "(V) A Suit of armor crafted by Tribals using pieces of scrap metals and the armor of fallen foes, a bighorner's skull sits on the right pauldron along with bighorner fur lining the collar of the leather bound chest. Along the leather straps adoring it are multiple bone charms with odd markings on them."
	icon_state = "heavy_tribal_armor"
	item_state = "heavy_tribal_armor"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS|HANDS
	armor = list("tier" = 5, "energy" = 45, "bomb" = 55, "bio" = 60, "rad" = 15, "fire" = 60, "acid" = 30)
	allowed = list(/obj/item/gun, /obj/item/kitchen, /obj/item/twohanded, /obj/item/claymore, /obj/item/twohanded/spear, /obj/item/melee/smith, /obj/item/melee/smith/twohand
)

/obj/item/clothing/suit/hooded/cloak/hhunter
	name = "Razorclaw armour"
	icon_state = "rcarmour"
	desc = "(VI) A suit of armour fashioned out of the remains of a legendary deathclaw."
	armor = list("tier" = 6, "energy" = 20, "bomb" = 50, "bio" = 30, "rad" = 20, "fire" = 60, "acid" = 0)
	hoodtype = /obj/item/clothing/head/hooded/cloakhood/hhunter
	heat_protection = CHEST|GROIN|LEGS|ARMS|HANDS
	body_parts_covered = CHEST|GROIN|LEGS|ARMS|HANDS
	resistance_flags = FIRE_PROOF | ACID_PROOF

/obj/item/clothing/suit/armor/f13/nightstalkerheavyarmor
	name = "Nightstalker Heavy Armor"
	icon_state = "nightstalker_tribal_armor"
	desc = "(VI) A heavily repurposed set of combat armor now intermixed with both scavenged metal-lined pauldrons and stripped Nightstalker skin draped beneath. This armor smells slightly like rainwater."
	armor = list("tier" = 6, "energy" = 20, "bomb" = 50, "bio" = 30, "rad" = 20, "fire" = 60, "acid" = 0)
	body_parts_covered = CHEST|GROIN|LEGS|ARMS|HANDS

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

/obj/item/clothing/suit/armor/f13/riot/vault/provost
	name = "VTCC provost riot armor"
	desc = "(VI) A suit of heavy riot armour adapted from the design of the pre-war U.S.M.C. armour; this model appears to have been reinforced."
	icon_state = "vtcc_provost_riot_gear"
	item_state = "vtcc_provost_riot_gear"
	armor = list("tier" = 6, "energy" = 20, "bomb" = 60, "bio" = 30, "rad" = 15, "fire" = 65, "acid" = 30)

/obj/item/clothing/suit/armor/f13/riot/vault/provost/sgt
	name = "VTCC provost riot armor"
	desc = "(VI) A suit of heavy riot armour adapted from the design of the pre-war U.S.M.C. armour; this model appears to have been reinforced and bares a red upper arm."
	icon_state = "vtcc_provost_sgt_riot_gear"
	item_state = "vtcc_provost_sgt_riot_gear"

/obj/item/clothing/suit/armor/f13/riot/vault/provost/marshal
	name = "VTCC marshal riot armor"
	desc = "(VI) A suit of heavy riot armour adapted from the design of the pre-war U.S.M.C. armour; this model appears to have been reinforced and bares a yellow upper arm."
	icon_state = "vtcc_marshal_riot_gear"
	item_state = "vtcc_marshal_riot_gear"
	armor = list("tier" = 7, "energy" = 20, "bomb" = 60, "bio" = 30, "rad" = 15, "fire" = 65, "acid" = 30)

/obj/item/clothing/suit/armor/f13/battlecoat/vault
	name = "command coat"
	desc = "(III) A heavy pre-war bomber coat, dyed blue with the number '113' embroidered on the back. Most often worn by leaders, such as the Overseer."
	icon_state = "vault_commandcoat"
	item_state = "vault_commandcoat"
	armor = list("tier" = 3)

/obj/item/clothing/suit/armor/f13/battlecoat/vault/overseer
	name = "\improper Overseer's battlecoat"
	desc = "(III) A heavy pre-war bomber coat, dyed blue with the insignia of the Vault-Tec embroidered on the back. This one is worn by the Coalition's Overseer."
	icon_state = "overseer_commandcoat"
	item_state = "overseer_commandcoat"

/obj/item/clothing/suit/armor/f13/battlecoat/vault/marshal
	name = "\improper Marhsal's battlecoat"
	desc = "(VII) A heavy pre-war bomber coat, dyed blue with the insignia of the Vault-Tec City Coalition embroidered on the back. This one is worn by the Marshals of the Coalition."
	icon_state = "marshal_commandcoat"
	item_state = "marshal_commandcoat"
	armor = list("tier" = 7, "energy" = 35, "bomb" = 35, "bio" = 40, "rad" = 10, "fire" = 60, "acid" = 10)

/obj/item/clothing/suit/armor/f13/battlecoat/vault/armoured
	name = "armoured vault battlecoat"
	desc = "(IV) A heavy pre-war bomber coat, dyed blue with the insignia of the Vault-Tec City Coalition embroidered on the back. This one is worn by the citizens of the Coalition."
	icon_state = "armouredvault_commandcoat"
	item_state = "armouredvault_commandcoat"
	armor = list("tier" = 4, "energy" = 35, "bomb" = 35, "bio" = 40, "rad" = 10, "fire" = 60, "acid" = 10)

/obj/item/clothing/suit/armor/f13/battlecoat/vault/armoured/roadie
	name = "\improper Roadie's battlecoat"
	desc = "(IV) A heavy padded duster with the insignia of the Vault-Tec City Coalition embroidered on the back. This one is often worn by the various employed Roadies in the cities."
	icon_state = "roadie_battlecoat"
	item_state = "roadie_battlecoat"

/obj/item/clothing/suit/armor/f13/battlecoat/vault/armoured/roadie/Initialize()
	. = ..()
	AddComponent(/datum/component/armor_plate)

/obj/item/clothing/suit/armor/f13/battlecoat/vault/armoured/roadie/fast
	name = "\improper Roadie's battlejacket"
	desc = "(III) A sleeveless duster with the insignia of the Vault-Tec City Coalition embroidered on the back. This one is often worn by the various employed Roadies in the cities."
	icon_state = "roadie_battlejacket"
	item_state = "roadie_battlejacket"
	armor = list("tier" = 3, "energy" = 35, "bomb" = 35, "bio" = 40, "rad" = 10, "fire" = 60, "acid" = 10)
	slowdown = -0.10

/obj/item/clothing/suit/armor/f13/battlecoat/vault/armoured/roadie/fast/Initialize()
	. = ..()
	AddComponent(/datum/component/armor_plate)


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

/obj/item/clothing/suit/armor/f13/combat/marine/centurion
	name = "Ptolemaic combat armor"
	desc = "(VII) An excellent suit of pre-war U.S.M.C. armor found in rare and limited quantities in the wasteland. This one is adorned with red robes, a red chest with a golden bull and a red tabard. It has been furthermore lavishly and overindulgently decorated, with gold-leaf plating, crude red paint in the stylized Legion symbols of Painted Rock, and a ludicrous, gilded codpiece."
	icon_state = "ptolemaic_armor"
	item_state = "ptolemaic_armor"
	armor = list("tier" = 7,"energy" = 45, "bomb" = 55, "bio" = 70, "rad" = 60, "fire" = 60, "acid" = 50)
