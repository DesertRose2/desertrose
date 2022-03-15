/obj/item/clothing/mask/f13
	icon = 'icons/fallout/clothing/masks.dmi'

/obj/item/clothing/mask/gas/f13
	icon = 'icons/fallout/clothing/masks.dmi'

/obj/item/clothing/mask/gas/welding/f13
	icon = 'icons/fallout/clothing/masks.dmi'

/obj/item/clothing/mask/bandana/f13
	icon = 'icons/fallout/clothing/masks.dmi'

//Sprite by Pisshole
/obj/item/clothing/mask/gas/f13/montana
	name = "Worn Scout Scarf"
	desc = "An old covering for a ranger's mouth, the color is dreary and worn, and stains run along it in mostly red or brown. It's thick enough that you wonder if there's something hidden inside of it, but whatever it is must be sewn inside the material. It seems to function well enough as a gas mask, as well. Huh."
	actions_types = list(/datum/action/item_action/adjust)
	icon_state = "montanascarf"
	item_state = "montanascarf"
	clothing_flags = BLOCK_GAS_SMOKE_EFFECT | ALLOWINTERNALS
	flags_inv = HIDEFACIALHAIR|HIDEFACE
	w_class = WEIGHT_CLASS_SMALL
	visor_flags = BLOCK_GAS_SMOKE_EFFECT | ALLOWINTERNALS
	visor_flags_inv = HIDEFACE
	flags_cover = MASKCOVERSMOUTH
	visor_flags_cover = MASKCOVERSMOUTH
	var/aggressiveness = 2
	var/cooldown_special
	var/recent_uses = 0
	var/broken_hailer = 0
	var/safety = TRUE

/obj/item/clothing/mask/f13/redding
	name = "NCR flag mask"
	desc = "A mask made of soft vinyl and latex. It seems to be a clown's face plastered with the flag of the New California Republic."
	icon_state = "redding"
	item_state = "redding"

/obj/item/clothing/mask/f13/flagstaff
	name = "Legion banner mask"
	desc = "A mask made of soft vinyl and latex. It has a ghastly expression and is marked with the banner of Caesar's Legion."
	icon_state = "flagstaff"
	item_state = "flagstaff"

/obj/item/clothing/mask/f13/citadel
	name = "power armor mask"
	desc = "A mask made of soft vinyl and latex. It seems to be patterned after a Brotherhood T-51 helmet, based on the insignia."
	icon_state = "citadel"
	item_state = "citadel"

/obj/item/clothing/mask/f13/vaultboy
	name = "Vault-Boy mask"
	desc = "A mask made of soft vinyl and latex. This one is the cheerful face of Vault-Boy. Prepared for the future!"
	icon_state = "vaultboy"
	item_state = "vaultboy"

//Desert facewrap

/obj/item/clothing/mask/f13/facewrap
	name = "desert headwrap"
	desc = "A headwrap to help shield the face from sand and other dirt."
	icon_state = "facewrap"
	item_state = "facewrap"
	flags_inv = HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	flags_cover = MASKCOVERSMOUTH
	visor_flags_inv = HIDEFACE
	visor_flags_cover = MASKCOVERSMOUTH

/obj/item/clothing/mask/bandana/f13/desert
	name = "tarnished desert facewrap"
	desc = "An worn down NCR facewrap, seemingly seared down judging by its colors."
	icon_state = "ali_cloak"
	item_state = "ali_cloak"
	flags_inv = HIDEFACE
	visor_flags_inv = HIDEFACE
	adjusted_flags = null
	actions_types = list(/datum/action/item_action/adjust)

//Society Mask

/obj/item/clothing/mask/f13/society
	name = "golden facemask"
	desc = "A burlap sack with eyeholes."
	icon_state = "societymask"
	item_state = "societymask"
	flags_inv = HIDEFACE

//Sancti Vindictam

/obj/item/clothing/mask/f13/aculeo
	name = "sancti vindictam"
	desc = "A fearsome, archaic mold of a cruel, sneering face shaped in iron and gilded in the colors of the Legion. Prayers to Mars are carved jaggedly along the interior. It is thick, heavy metal reinforcing some mechanical trophy beneath- the gas mask of a ranger that has been crudely refitted to serve new purpose."
	icon_state = "sancti_vindictam"
	item_state = "sancti_vindictam"
	clothing_flags = BLOCK_GAS_SMOKE_EFFECT | ALLOWINTERNALS
	flags_inv = HIDEFACIALHAIR|HIDEFACE
	w_class = WEIGHT_CLASS_SMALL
	visor_flags = BLOCK_GAS_SMOKE_EFFECT | ALLOWINTERNALS
	visor_flags_inv = HIDEFACE
	flags_cover = MASKCOVERSMOUTH
	visor_flags_cover = MASKCOVERSMOUTH
	var/aggressiveness = 2
	var/cooldown_special
	var/recent_uses = 0
	var/broken_hailer = 0
	var/safety = TRUE


//NCR Facewrap

/obj/item/clothing/mask/f13/ncr_facewrap
	name = "desert facewrap"
	desc = "A facewrap commonly employed by NCR troops in desert environments."
	icon_state = "ncr_facewrap"
	w_class = WEIGHT_CLASS_TINY
	flags_inv = HIDEFACE
	flags_cover = MASKCOVERSMOUTH
	visor_flags_inv = HIDEFACE
	visor_flags_cover = MASKCOVERSMOUTH
	gas_transfer_coefficient = 0.9
	permeability_coefficient = 0.01
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	adjusted_flags = null
	actions_types = list(/datum/action/item_action/adjust)

/obj/item/clothing/mask/f13/ncr_facewrap/attack_self(mob/user)
	adjustmask(user)


//Ranger bandana

/obj/item/clothing/mask/bandana/f13/ranger
	name = "red ranger bandana"
	desc = "An worn down, bright red bandana, looks like one a ranger would wear."
	icon_state = "ranger"
	item_state = "ranger"
	flags_inv = HIDEFACE
	visor_flags_inv = HIDEFACE
	adjusted_flags = null
	actions_types = list(/datum/action/item_action/adjust)
