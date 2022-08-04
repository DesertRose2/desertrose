//Custom items - Pisshole / Valentina Vega - Sprite edit by Pisshole
/obj/item/clothing/head/beret/tina_beret
	name = "Harebell Scout Beret"
	desc = "(IV) A worn beret darkened by use, it appears to be the old symbol of Scout Corporals in the 1st Battalion, 3rd Infantry Regiment of the NCRA. The petals of a harebell appear to be threaded around the flash. Someone likes flowers."
	icon_state = "tina_beret"
	item_state = "tina_beret"
	armor = list("tier" = 4, "energy" = 30, "bomb" = 25, "bio" = 40, "rad" = 40, "fire" = 80, "acid" = 0)

//Custom item - Muhsollini / Viatoris
/obj/item/clothing/head/helmet/f13/legion/vet/pal
	name = "legion veteran paladin-hunter helmet"
	desc = "(V) A reforged T45d power armor helmet. It had its plating around mouth removed as well as its light from top of it. Sports a red vertical plume to denote a veteran."
	icon_state = "legvetpal"
	item_state = "legvetpal"

//Custom item - KayZach
/obj/item/clothing/head/helmet/f13/legion/recruit/decan/houndmaster
	name = "Houndmasters Headdress"
	desc = "(III) A small hand crafted headdress made from the head of a dog that is caked with some sort of blood in certain places."
	icon_state = "houndmaster"
	item_state = "houndmaster"

//Custom item - Rebel0 / Hazard
/obj/item/clothing/head/beret/mets
	name = "Genuine Blue Swatters Cap"
	desc = "A strange swatters hat with an interconnecting orange 'N' and 'Y' on the front. Someone's reinforced the inside by the looks of it based on the non-maluable brim. The left side appears to have some worn logo on it.."
	icon_state = "mets"
	item_state = "mets"
	armor = list("tier" = 4, "energy" = 30, "bomb" = 25, "bio" = 40, "rad" = 40, "fire" = 80, "acid" = 0)

//Custom item - annoyingincantation / Ptolemos Gloriosus
/obj/item/clothing/head/helmet/f13/legion/rangercent/ptolemy
	name = "Ptolemaic combat helm"
	desc = "(V) A salvaged helmet of pre-war U.S.M.C. armor found in rare and limited quantities in the wasteland. This one sports a flagrant waste of golden and red paint, an excess of luxurious plumage, and a pair of polarized lenses. The word PTOLEMY is carelessly inscribed against the interior."
	icon_state = "ptolemaic_helm"
	item_state = "ptolemaic_helm"

//Custom item - Pisshole / Montana - Sprite by Pisshole
/obj/item/clothing/head/f13/ranger/montana
	name = "reclaimed Ranger helmet"
	desc = "(VI) A mishmash of, most recognizably, a ranger patrol helmet and a ranger veteran's helmet once repurposed by the Centurion that killed them. It's got signs of wear and rust; its respirator has been gutted, its eyepieces are dull and cracked, and it's got pieces from a few different sources - hard to place sources. The top of the helmet, above the eyes, is emblazoned with a few words - De Oppresso Liber."
	icon_state = "rangermontana"
	item_state = "rangermontana"
	armor = list("tier" = 6, "energy" = 50, "bomb" = 39, "bio" = 60, "rad" = 60, "fire" = 90, "acid" = 0)
	actions_types = list(/datum/action/item_action/toggle)

//Custom item - Pisshole / Bangles - Sprite by Pisshole
/obj/item/clothing/head/f13/trailranger/trailbandana
	name = "NCR ranger bandana"
	desc = "(IV) A thin piece of cloth that keeps sweat out of your face - or maybe just completes your fashion sense."
	icon_state = "trailbandana"
	item_state = "trailbandana"
	armor = list("tier" = 4, "energy" = 30, "bomb" = 25, "bio" = 40, "rad" = 40, "fire" = 80, "acid" = 0)

//Custom item - Yeehawguvnah / Trinity Kemble - Sprite adapted from existing armour, creator unknown
/obj/item/clothing/head/f13/ranger/sergeant/light_riot
	name = "ranger slouch hat"
	desc = "(VI) An NCR slouch hat, reinforced with ballistic fibres. There's a pair of goggles attached, seemingly salvaged from old riot gear. Despite the faint glow to the lenses, they no longer function."
	icon_state = "rangerkemble"
	item_state = "rangerkemble"
	actions_types = list(/datum/action/item_action/toggle)

/obj/item/clothing/head/f13/ranger/sergeant/light_riot/attack_self(mob/user)
	weldingvisortoggle(user)
	icon_state = "rangerkembleup"
	item_state = "rangerkembleup"
	armor = list("tier" = 6, "energy" = 50, "bomb" = 39, "bio" = 60, "rad" = 60, "fire" = 90, "acid" = 0)

//Custom item - Gomezash / Wormwood - sprite adapted from NCR slouch
/obj/item/clothing/head/helmet/f13/raider/wormhat
	name = "brahmin slouch hat"
	desc = "(IV) An older looking brahmin skin cowboy hat, that somebody unbent the brim of. This one's got a silver eagle pinned to the front."
	icon_state = "brahmin_slouch"
	item_state = "brahmin_slouch"
