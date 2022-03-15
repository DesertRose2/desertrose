//ARMOR, AND ALL PATREON/CUSTOM/DONOR STUFF (EVEN IF SUIT AND NOT ARMOR) TO GO INTO f13armor.dm
/*FOR REFERENCE
/obj/item/clothing/suit
	icon = 'icons/fallout/clothing/suits.dmi'
	name = "suit"
	block_priority = BLOCK_PRIORITY_WEAR_SUIT
	var/fire_resist = T0C+100
	allowed = null
	armor = list("tier" = 1, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	slot_flags = ITEM_SLOT_OCLOTHING
	body_parts_covered = CHEST|GROIN|LEGS|ARMS //I don't care if some armors only visibly covers the chest, they're going to offer protection to limbs too because game design.
	var/blood_overlay_type = "suit"
	var/togglename = null
	var/suittoggled = FALSE
	limb_integrity = 0 // disabled for most exo-suits
	mutantrace_variation = STYLE_DIGITIGRADE

/obj/item/clothing/suit/Initialize()
	. = ..()
	if(!allowed)
		allowed = GLOB.f13_coat_allowed

/obj/item/clothing/suit/worn_overlays(isinhands = FALSE, icon_file, used_state, style_flags = NONE)
	. = ..()
	if(!isinhands)
		if(damaged_clothes)
			. += mutable_appearance('icons/effects/item_damage.dmi', "damaged[blood_overlay_type]")
		if(blood_DNA)
			var/file2use = (style_flags & STYLE_ALL_TAURIC) ? 'modular_citadel/icons/mob/64x32_effects.dmi' : 'icons/effects/blood.dmi'
			. += mutable_appearance(file2use, "[blood_overlay_type]blood", color = blood_DNA_to_color())
		var/mob/living/carbon/human/M = loc
		if(ishuman(M) && M.w_uniform)
			var/obj/item/clothing/under/U = M.w_uniform
			if(istype(U) && U.attached_accessory)
				var/obj/item/clothing/accessory/A = U.attached_accessory
				if(A.above_suit)
					. += U.accessory_overlay

/obj/item/clothing/suit/update_clothes_damaged_state()
	..()
	if(ismob(loc))
		var/mob/M = loc
		M.update_inv_wear_suit()
*/

/obj/item/clothing/suit/f13
	icon = 'icons/fallout/clothing/suits.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothing/suit.dmi'

/obj/item/clothing/suit/hooded/f13
	icon = 'icons/fallout/clothing/suits.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothing/suit.dmi'

//Fallout 50s
/obj/item/clothing/suit/f13/vest
	name = "tan vest"
	desc = "(I) It's a vest made of tanned leather."
	icon_state = "tanleather"
	item_state = "tanleather"
	body_parts_covered = CHEST|GROIN|LEGS
	armor = list("tier" = 1, "energy" = 0, "bomb" = 16, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/suit/f13/battlecruiser //Do we have Star Craft here as well?!
	name = "captain's coat"
	desc = "(II) Battlecruiser operational!"
	icon_state = "battlecruiser"
	item_state = "hostrench"
	armor = list("tier" = 2, "energy" = 10, "bomb" = 20, "bio" = 0, "rad" = 0, "fire" = 20, "acid" = 0)

/obj/item/clothing/suit/f13/cowboybvest //Originally cowboy stuff by Nienhaus
	name = "brown vest"
	desc = "(I) A brown vest, typically worn by wannabe cowboys and prospectors. It has a few pockets for tiny items."
	icon_state = "cowboybvest"
	item_state = "lb_suit"
	armor = list("tier" = 1, "energy" = 0, "bomb" = 16, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = CHEST|GROIN|LEGS

/obj/item/clothing/suit/f13/westender
	name = "bartenders vest"
	desc = "(I) A grey vest, adorned with bartenders arm cuffs, a classic western look."
	icon_state = "westender"
	item_state = "lb_suit"
	armor = list("tier" = 1, "energy" = 0, "bomb" = 16, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/suit/f13/cowboygvest
	name = "grey vest"
	desc = "(I) A grey vest, typically worn by wannabe cowboys and prospectors. It has a few pockets for tiny items."
	icon_state = "cowboygvest"
	item_state = "gy_suit"
	body_parts_covered = CHEST|GROIN|LEGS
	armor = list("tier" = 1, "energy" = 0, "bomb" = 16, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/suit/ghost_sheet
	name = "ghost sheet"
	desc = "The hands float by themselves, so it's extra spooky."
	icon_state = "ghost_sheet"
	item_state = "ghost_sheet"
	throwforce = 0
	throw_speed = 1
	throw_range = 2
	w_class = WEIGHT_CLASS_TINY
	flags_inv = HIDEGLOVES|HIDEEARS|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR

//Fallout 13 various suits directory
/obj/item/clothing/suit/f13/robe_liz
	name = "tan robe"
	desc = "(I) Only a monk would find this robe nice and comfortable."
	icon_state = "robe_liz"
	item_state = "robe_liz"
	armor = list("tier" = 1)

/obj/item/clothing/suit/f13/mfp //Mad Max 1 1979 babe!
	name = "MFP jacket"
	desc = "(II) A Main Force Patrol leather jacket.<br>Offbeat."
	icon_state = "mfp"
	item_state = "hostrench"
	armor = list("tier" = 2, "energy" = 0, "bomb" = 10, "bio" = 0, "rad" = 0, "fire" = 20, "acid" = 0)

/obj/item/clothing/suit/f13/mfp/raider
	name = "offbeat jacket"
	desc = "(II) A black leather jacket with a single metal shoulder pad on the right side.<br>The right sleeve was obviously ripped or cut away.<br>It looks like it was originally a piece of a Main Force Patrol uniform."
	icon_state = "mfp_raider"

/obj/item/clothing/suit/f13/lonesome
	name = "lonesome duster"
	desc = "(II) A blue leather coat with the number 21 on the back.<br><i>If war doesn't change, men must change, and so must their symbols.</i><br><i>Even if there is nothing at all, know what you follow.</i>"
	icon_state = "courier"
	item_state = "suit-command"
	armor = list("tier" = 2, "energy" = 10, "bomb" = 20, "bio" = 0, "rad" = 0, "fire" = 10, "acid" = 0)

/obj/item/clothing/suit/f13/veteran
	name = "merc veteran coat"
	desc = "(II) A blue leather coat adorned with war medals.<br>This type of outfit is common for professional mercenaries and bounty hunters."
	icon_state = "veteran"
	item_state = "suit-command"
	armor = list("tier" = 2, "energy" = 10, "bomb" = 20, "bio" = 0, "rad" = 0, "fire" = 10, "acid" = 0)

/obj/item/clothing/suit/f13/duster
	name = "duster"
	desc = "(II) A long brown leather overcoat.<br>A powerful accessory of fearsome bounty hunter."
	icon_state = "duster"
	item_state = "det_suit"
	armor = list("tier" = 2, "energy" = 0, "bomb" = 20, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS

/obj/item/clothing/suit/f13/sheriff
	name = "sheriff duster"
	desc = "(III) A long brown leather overcoat.<br>A powerful accessory of a respectful sheriff, bringer of justice."
	icon_state = "sheriff"
	item_state = "det_suit"
	armor = list("tier" = 3, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 10, "acid" = 0)
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS

/obj/item/clothing/suit/f13/banker
	name = "bankers tailcoat"
	desc = "(I) A long black jacket, finely crafted black leather and smooth finishings make this an extremely fancy piece of rich-mans apparel."
	icon_state = "banker"
	item_state = "banker"
	armor = list("tier" = 1, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS

/obj/item/clothing/suit/f13/autumn //Based of Colonel Autumn's uniform.
	name = "tan trenchcoat"
	desc = "(III) A heavy-duty tan trenchcoat typically worn by pre-War generals."
	icon_state = "autumn"
	item_state = "autumn"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS
	armor = list("tier" = 3, "energy" = 20, "bomb" = 20, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/suit/f13/hubologist
	name = "hubologist robe"
	desc = "(I) A black robe worn by Adepts of Hubology Studies.<br>Beware - the spirits of the dead are all around us!"
	icon_state = "hubologist"
	item_state = "wcoat"
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEHAIR|HIDEFACIALHAIR
	armor = list("tier" = 1)

/obj/item/clothing/suit/f13/sexymaid
	name = "sexy maid outfit"
	desc = "A maid outfit that shows just a little more skin than needed for cleaning duties."
	icon_state = "sexymaid_s"
	item_state = "sexymaid_s"
	body_parts_covered = CHEST

//Special Biosuit

/obj/item/clothing/suit/bio_suit/f13/hazmat
	name = "hazmat suit"
	desc = "(II) Yellow Level A , hazmat protective suit.<br>You can see some numbers on the tag: 35 56."
	icon = 'icons/fallout/clothing/suits.dmi'
	icon_state = "hazmat"
	item_state = "hazmat_suit"

/obj/item/clothing/head/bio_hood/f13/hazmat
	name = "hazmat hood"
	desc = "(II) My star, my perfect silence."
	icon = 'icons/fallout/clothing/hats.dmi'
	icon_state = "hazmat"
	item_state = "hazmat_helmet"
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR

//Fallout 13 toggle apparel directory
/obj/item/clothing/suit/toggle/labcoat/f13 // why labcoat? idk, TODO: see if this needs a repath
	icon = 'icons/fallout/clothing/suits.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothing/suit.dmi'

/obj/item/clothing/suit/toggle/labcoat/f13/emergency
	name = "first responder jacket"
	desc = "(I) A high-visibility jacket worn by medical first responders."
	icon_state = "fr_jacket"
	item_state = "fr_jacket"

/obj/item/clothing/suit/toggle/labcoat/f13/warriors
	name = "warriors jacket"
	desc = "(II) A red leather jacket, with the word \"Warriors\" sewn above the white wings on the back."
	icon_state = "warriors"
	item_state = "owl"
	armor = list("tier" = 2, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/suit/toggle/labcoat/f13/wanderer
	name = "wanderer jacket"
	desc = "A zipped-up hoodie made of tanned leather."
	icon_state = "wanderer"
	item_state = "owl"
	armor = list("tier" = 2, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/suit/toggle/labcoat/f13/khan_jacket
	name = "Great Khan jacket"
	desc = "(IV) A black leather jacket. <br>There is an illustration on the back - an aggressive, red-eyed skull wearing a fur hat with horns.<br>The skull has a mongoloid moustache - it's obviously a Great Khans emblem."
	icon_state = "khan_jacket"
	item_state = "jensencoat"
	armor = list("tier" = 4, "energy" = 25, "bomb" = 30, "bio" = 0, "rad" = 0, "fire" = 25, "acid" = 25)
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS

/obj/item/clothing/suit/toggle/labcoat/f13/chinese_khan
	name = "modified Great Khan combat armour"
	desc = "(IV) A suit of simple yet uncommon chinese combat armour with an extra plate at the back and flame decals painted on the front, essentially some plates strapped together with a neck guard. <br>There is an illustration on the back - an aggressive, red-eyed skull wearing a fur hat with horns.<br>The skull has a mongoloid moustache - it's obviously a Great Khans emblem."
	icon_state = "chicom_armor_khan"
	item_state = "chicom_armor_khan"
	armor = list("tier" = 4, "energy" = 25, "bomb" = 30, "bio" = 0, "rad" = 0, "fire" = 25, "acid" = 25)
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS

/obj/item/clothing/suit/toggle/labcoat/f13/khan_jacket_armored
	name = "Great Khan armored jacket"
	desc = "(V) A black leather jacket. <br>There is an illustration on the back - an aggressive, red-eyed skull wearing a fur hat with horns.<br>The skull has a mongoloid moustache - it's obviously a Great Khans emblem.<br>Protective plates have been sewn into the jacket."
	icon_state = "khan_jacket"
	item_state = "jensencoat"
	armor = list("tier" = 5, "energy" = 35, "bomb" = 30, "bio" = 0, "rad" = 0, "fire" = 25, "acid" = 25)
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS

/obj/item/clothing/suit/toggle/labcoat/f13/khan/battlecoat
	name = "Great Khan battle coat"
	desc = "(VI) A dark red leather coat lined with a patchwork of metal plates and padding on the inside. The back is dominated by a burning skull adorned with a horned helmet; the symbol of the Khans."
	icon_state = "khan_battlecoat"
	item_state = "khan_battlecoat"
	armor = list("tier" = 6, "energy" = 35, "bomb" = 30, "bio" = 0, "rad" = 0, "fire" = 25, "acid" = 25)
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS

/obj/item/clothing/suit/toggle/labcoat/f13/followers
	name = "followers lab coat"
	desc = "(II) A worn-down white labcoat with some wiring hanging from the right side.<br>Upon closer inspection, you can see an ancient bloodstains that could tell an entire story about thrilling adventures of a previous owner."
	icon_state = "followers"
	item_state = "labcoat"
	armor = list("tier" = 2, "energy" = 10, "bomb" = 0, "bio" = 10, "rad" = 10, "fire" = 10, "acid" = 10)

//Sprite by Pisshole
/obj/item/clothing/suit/toggle/labcoat/f13/ncrbomber
	name = "NCR bomber"
	desc = "(II) Often given to and worn by NCR Air Force pilots. With the imagery of the flag on the back, and a tiny NCR flag patch on the shoulder, it's pretty on the nose indicative of its country of origin."
	icon_state = "ncrbomber"
	item_state = "ncrbomber"
	cold_protection = CHEST|GROIN|ARMS
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	armor = list("tier" = 2, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 10, "fire" = 10, "acid" = 10)

/obj/item/clothing/suit/hooded/f13/cloak/desert
	name = "desert cloak"
	icon_state = "desertcloak"
	desc = "(II) A practical cloak made out of animal hide."
	hoodtype = /obj/item/clothing/head/hooded/f13/cloakhood/desert
	armor = list("tier" = 2, "energy" = 15, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 10, "acid" = 0)
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS

/obj/item/clothing/head/hooded/f13/cloakhood/desert
	name = "desert cloak hood"
	icon_state = "desertcloak"
	desc = "(II) A protective and concealing hood."
	flags_inv = HIDEEARS|HIDEEYES|HIDEHAIR|HIDEFACIALHAIR
	armor = list("tier" = 2, "energy" = 15, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 10, "acid" = 0)

/obj/item/clothing/suit/hooded/f13/cloak/desert/raven_cloak
	name = "Raven cloak"
	desc = "(II) A huge cloak made out of hundreds of knife-like black bird feathers. It glitters in the light, ranging from blue to dark green and purple."
	icon_state = "raven_cloak"
	item_state = "raven_cloak"
	hoodtype = /obj/item/clothing/head/hooded/f13/cloakhood/desert/raven_hood

/obj/item/clothing/head/hooded/f13/cloakhood/desert/raven_hood
	name = "Raven cloak hood"
	desc = "(II) A hood fashioned out of patchwork and feathers."
	icon_state = "raven_hood"
	item_state = "raven_hood"

/obj/item/clothing/suit/hooded/f13/cloak/goliath
	name = "deathclaw cloak"
	icon_state = "clawsuitcloak"
	desc = "(V) A staunch, practical cloak made out of sinew and skin from the fearsome deathclaw."
	armor = list("tier" = 5, "energy" = 20, "bomb" = 40, "bio" = 30, "rad" = 10, "fire" = 60, "acid" = 20)
	hoodtype = /obj/item/clothing/head/hooded/f13/cloakhood/goliath
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS

/obj/item/clothing/head/hooded/f13/cloakhood/goliath
	name = "deathclaw cloak hood"
	icon_state = "clawheadcloak"
	desc = "(V) A protective & concealing hood."
	armor = list("tier" = 5, "energy" = 15, "bomb" = 25, "bio" = 0, "rad" = 10, "fire" = 60, "acid" = 20)
	flags_inv = HIDEEARS|HIDEEYES|HIDEHAIR|HIDEFACIALHAIR

/obj/item/clothing/suit/hooded/f13/parka/medical
	name = "armored medical parka"
	icon_state = "armormedical"
	desc = "(III) A staunch, practical parka made out of a wind-breaking jacket, reinforced with metal plates."
	armor = list("tier" = 3, "energy" = 10, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 60, "acid" = 60)
	hoodtype = /obj/item/clothing/head/hooded/f13/parkahood/medical

/obj/item/clothing/head/hooded/f13/parkahood/medical
	name = "armored medical parka hood"
	icon_state = "armorhoodmedical"
	desc = "(III) A protective & concealing parka hood."
	armor = list("tier" = 3, "energy" = 10, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 60, "acid" = 60)
	flags_inv = HIDEEARS|HIDEEYES|HIDEHAIR|HIDEFACIALHAIR

/obj/item/clothing/suit/hooded/f13/parka/grey
	name = "grey armored parka"
	icon_state = "armorgrey"
	desc = "(III) A staunch, practical parka made out of a wind-breaking jacket, reinforced with metal plates."
	armor = list("tier" = 3, "energy" = 10, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 60, "acid" = 60)
	hoodtype = /obj/item/clothing/head/hooded/f13/parkahood/grey

/obj/item/clothing/head/hooded/f13/parkahood/grey
	name = "armored grey parka hood"
	icon_state = "armorhoodgrey"
	desc = "(III) A protective & concealing parka hood."
	armor = list("tier" = 3, "energy" = 10, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 60, "acid" = 60)
	flags_inv = HIDEEARS|HIDEEYES|HIDEHAIR|HIDEFACIALHAIR

/obj/item/clothing/suit/hooded/f13/cloak/goliath/tatteredred
	name = "tattered red cloak"
	icon_state = "goliath_cloak"
	desc = "(II) An old ragged, tattered red cloak that is covered in burns and bullet holes."
	armor = list("tier" = 2, "energy" = 20, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 30, "acid" = 30)
	hoodtype = /obj/item/clothing/head/hooded/f13/cloakhood/goliath/tattered
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS


/obj/item/clothing/head/hooded/f13/cloakhood/goliath/tattered
	name = "tattered red cloak hood"
	icon_state = "golhood"
	desc = "(II) A tattered hood, better than nothing in the waste."
	armor = list("tier" = 2, "energy" = 20, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 30, "acid" = 30)

/obj/item/clothing/suit/f13/jamrock
	name = "disco-ass blazer"
	desc = "(I) Looks like someone skinned this blazer off some long extinct disco-animal. It has an enigmatic white rectangle on the back and the right sleeve."
	icon_state = "jamrock_blazer"
	item_state = "jamrock_blazer"
	armor = list("tier" = 1, "energy" = 0, "bomb" = 20, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/suit/hooded/f13/cloak/birdarmor
	name = "salvaged claw cloak"
	icon_state = "birdarmor"
	item_state = "birdarmor"
	desc = "(V) An old cloak of Razorclaw armour, modified with a NCR armguard and a heavy looking shoulder piece, it looks like it has a lot of history."
	armor = list("tier" = 5, "energy" = 20, "bomb" = 50, "bio" = 30, "rad" = 20, "fire" = 60, "acid" = 0)
	hoodtype = /obj/item/clothing/head/hooded/f13/cloakhood/birdhood
	heat_protection = CHEST|GROIN|LEGS|ARMS|HANDS
	body_parts_covered = CHEST|GROIN|LEGS|ARMS|HANDS
	resistance_flags = FIRE_PROOF | ACID_PROOF

/obj/item/clothing/head/hooded/f13/cloakhood/birdhood
	name = "salvaged claw hood"
	icon_state = "birdhood"
	item_state = "birdhood"
	desc = "(V) A hood made of deathclaw skins, the leather is rather thick but looks tattered."
	armor = list("tier" = 5, "energy" = 20, "bomb" = 50, "bio" = 30, "rad" = 20, "fire" = 60, "acid" = 0)
	heat_protection = HEAD
	resistance_flags = FIRE_PROOF | ACID_PROOF

/obj/item/clothing/suit/hooded/f13/surgical
	name = "surgical scrubs"
	desc = "A bundle with all the sterile clothing needed to perform safe surgery accoring to the standards set in the Followers' pamphlet on safe surgery. The shoe covers have grip surfaces to prevent slipping in the blood."
	icon = 'icons/fallout/clothing/scrubs.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothing/scrub.dmi'
	icon_state = "surgical_scrubs"
	w_class = WEIGHT_CLASS_BULKY
	strip_delay = 60
	equip_delay_other = 60
	hoodtype = /obj/item/clothing/head/hooded/f13/surgical
	clothing_flags = NOSLIP
	permeability_coefficient = 0.6
	body_parts_covered = CHEST|GROIN|LEGS|FEET
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/medical
	armor = list("tier" = 0, "energy" = 0, "bomb" = 0, "bio" = 40, "rad" = 10, "fire" = 0, "acid" = 10)

/obj/item/clothing/head/hooded/f13/surgical
	name = "hair net"
	desc = "It's not a good idea to risk hair falling into open wounds."
	icon = 'icons/fallout/clothing/scrubs.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothing/scrub.dmi'
	icon_state = "hood_surgical_scrubs"
	item_state = "hood_surgical_scrubs"
	flags_inv = HIDEHAIR
	armor = list("tier" = 0, "energy" = 0, "bomb" = 0, "bio" = 40, "rad" = 10, "fire" = 0, "acid" = 10)

/obj/item/clothing/suit/hooded/f13/mutie/poncho
	name = "hooded mutant poncho"
	desc = "(IV) An oversized poncho with a hood of some description, made to fit the frame of a super mutant. Maybe he's the big ranger with an iron on his hip?"
	icon_state = "mutie_weathered_poncho"
	item_state = "mutie_weathered_poncho"
	hoodtype = /obj/item/clothing/head/hooded/f13/mutie/poncho

/obj/item/clothing/head/hooded/f13/mutie/poncho
	name = "mutant poncho hood"
	icon_state = "mutie_weathered_poncho_hood"
	desc = "(IV) A protective & concealing hood, stitched onto a poncho."
	armor = list("tier" = 4, "energy" = 40, "bomb" = 50, "bio" = 60, "rad" = 10, "fire" = 60, "acid" = 20)
	flags_inv = HIDEEYES

/obj/item/clothing/under/suit/turtle/skirt
	name = "turtleneck skirt"
	desc = "A turtleneck sweater paired with a skirt."
	icon_state = "blackturt_white_skirt"
	item_state = "blackturt_white_skirt"
	can_adjust = FALSE

/obj/item/clothing/under/suit/turtle/skirt/pink
	name = "pink turtleneck skirt"
	icon_state = "blackturt_pink_skirt"
	item_state = "blackturt_pink_skirt"

/obj/item/clothing/under/suit/turtle/skirt/pink/stripe
	name = "turtleneck skirt"
	icon_state = "blackturt_white_skirt_pink_stripe"
	item_state = "blackturt_white_skirt_pink_stripe"

/obj/item/clothing/under/suit/turtle/skirt/pencil
	name = "turtleneck pencil skirt"
	icon_state = "black_turt_alt_white_skirt"
	item_state = "black_turt_alt_white_skirt"

/obj/item/clothing/under/suit/turtle/skirt/grey
	name = "grey turtleneck skirt"
	icon_state = "greyturt_white_skirt"
	item_state = "greyturt_white_skirt"

/obj/item/clothing/under/suit/mutie
	name = "oversized suit"
	desc = "A decidedly oversized suit, one fit for a big green bastard."
	icon_state = "mutie_suit"
	item_state = "mutie_suit"
	can_adjust = FALSE

/obj/item/clothing/under/suit/mutie/burgundy
	icon_state = "mutie_burgundy_suit"
	item_state = "mutie_burgundy_suit"

/obj/item/clothing/under/suit/mutie/purple
	icon_state = "mutie_purple_suit"
	item_state = "mutie_purple_suit"

/obj/item/clothing/under/suit/mutie/purple/pinstripe
	desc = "A decidedly oversized suit, one fit for a big green bastard. This one has a tag that says 'Made in Texas'."
	icon_state = "mutie_purple_suit"
	item_state = "mutie_purple_suit"
	can_adjust = TRUE
