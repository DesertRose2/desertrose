//For custom items.

/obj/item/toy/plush/carrot
	name = "carrot plushie"
	desc = "While a normal carrot would be good for your eyes, this one seems a bit more for hugging then eating."
	icon = 'icons/obj/hydroponics/harvest.dmi'
	icon_state = "carrot"
	item_state = "carrot"
	w_class = WEIGHT_CLASS_SMALL
	attack_verb = list("slapped")
	resistance_flags = FLAMMABLE
	squeak_override = list('sound/items/bikehorn.ogg'= 1)

/obj/item/clothing/under/costume/singer/yellow/custom
	name = "bluish performer's outfit"
	desc = "Just looking at this makes you want to sing."
	icon = 'icons/obj/custom.dmi'
	icon_state = "singer"
	mob_overlay_icon = 'icons/mob/clothing/custom_w.dmi'
	item_state = "singer"
	fitted = NO_FEMALE_UNIFORM
	alternate_worn_layer = ABOVE_SHOES_LAYER
	can_adjust = 0
	mutantrace_variation = NONE

/obj/item/clothing/suit/puffydress
	name = "Puffy Dress"
	desc = "A formal puffy black and red Victorian dress."
	icon = 'icons/obj/custom.dmi'
	mob_overlay_icon = 'icons/mob/clothing/custom_w.dmi'
	icon_state = "puffydress"
	item_state = "puffydress"
	body_parts_covered = CHEST|GROIN|LEGS
	mutantrace_variation = NONE

/obj/item/clothing/shoes/lucky
	name = "Lucky Jackboots"
	icon = 'icons/obj/custom.dmi'
	mob_overlay_icon = 'icons/mob/clothing/custom_w.dmi'
	desc = "Comfy Lucky Jackboots with the word Luck on them."
	item_state = "luckyjack"
	icon_state = "luckyjack"
	mutantrace_variation = NONE

/obj/item/clothing/under/custom/leoskimpy
	name = "Leon's Skimpy Outfit"
	icon = 'icons/obj/custom.dmi'
	mob_overlay_icon = 'icons/mob/clothing/custom_w.dmi'
	desc =  "A rather skimpy outfit."
	item_state = "shark_cloth"
	icon_state = "shark_cloth"
	mutantrace_variation = NONE

/obj/item/clothing/under/custom/trendy_fit
	name = "Trendy Fitting Clothing"
	desc = "An outfit straight from the boredom of space, its the type of thing only someone trying to entertain themselves on the way to their next destination would wear."
	icon_state = "trendy_fit"
	item_state = "trendy_fit"
	icon = 'icons/obj/custom.dmi'
	mob_overlay_icon = 'icons/mob/clothing/custom_w.dmi'
	mutantrace_variation = NONE

/obj/item/clothing/head/flight
	name = "flight goggles"
	desc = "Old style flight goggles with a leather cap attached."
	icon_state = "flight-g"
	item_state = "flight-g"
	icon = 'icons/obj/custom.dmi'
	mob_overlay_icon = 'icons/mob/clothing/custom_w.dmi'

/obj/item/clothing/head/mikuhair
	name = "starlight singer hair"
	desc = " "
	icon_state = "mikuhair"
	item_state = "mikuhair"
	icon = 'icons/obj/custom.dmi'
	mob_overlay_icon = 'icons/mob/clothing/custom_w.dmi'
	mutantrace_variation = NONE
	flags_inv = HIDEHAIR

/obj/item/clothing/gloves/mikugloves
	name = "starlight singer gloves"
	desc = " "
	icon_state = "mikugloves"
	item_state = "mikugloves"
	icon = 'icons/obj/custom.dmi'
	mob_overlay_icon = 'icons/mob/clothing/custom_w.dmi'
	mutantrace_variation = NONE

/obj/item/clothing/shoes/sneakers/mikuleggings
	name = "starlight singer leggings"
	desc = " "
	icon_state = "mikuleggings"
	item_state = "mikuleggings"
	icon = 'icons/obj/custom.dmi'
	mob_overlay_icon = 'icons/mob/clothing/custom_w.dmi'
	mutantrace_variation = NONE
