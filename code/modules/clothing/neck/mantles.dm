//Mantles

/obj/item/clothing/neck/mantle
	name = "mantle template"
	desc = " worn in accessory slot, no concealing hood, decorative."
	icon = 'icons/obj/clothing/mantles.dmi'
	mob_overlay_icon = 'icons/mob/clothing/mantle.dmi'
	w_class = WEIGHT_CLASS_SMALL
	slot_flags = ITEM_SLOT_NECK
	body_parts_covered = CHEST|ARMS
	max_heat_protection_temperature = ARMOR_MAX_TEMP_PROTECT
	min_cold_protection_temperature = ARMOR_MIN_TEMP_PROTECT
	heat_protection = null
	cold_protection = null
	permeability_coefficient = 0.9

/obj/item/clothing/neck/mantle/gecko
	name = "gecko skin mantle"
	desc = "Made from tanned young gecko hides, too thin to be useful for armor. The small claws are still attached."
	icon_state = "gecko"

/obj/item/clothing/neck/mantle/gray
	name = "plain gray mantle"
	desc = "A simple mantle to cover your shoulders with."
	icon_state = "gray"

/obj/item/clothing/neck/mantle/brown
	name = "plain brown mantle"
	desc = "A simple mantle to cover your shoulders with."
	icon_state = "brown"

/obj/item/clothing/neck/mantle/overseer
	name = "vault-tec overseer's mantle"
	desc = "This is the overseer's mantle.  Issued by the Vault-tec corporation to easily identify the overseer. This mantle has been passed down from overseer to overseer."
	icon_state = "overseer"

/obj/item/clothing/neck/mantle/bos
	name = "Brotherhood of Steel shoulder cape"
	desc = "Issued to the Elders of the Brotherhood. Style over substance is important. This one is designed to be worn over the shoulder."
	icon_state = "bosshouldercape_l"

/obj/item/clothing/neck/mantle/bos/left
	name = "Brotherhood of Steel shoulder cape"
	desc = "Issued to the Elders of the Brotherhood. Style over substance is important. This one is designed to be worn over the shoulder."
	icon_state = "bosshouldercape_l"

/obj/item/clothing/neck/mantle/bos/right
	name = "Brotherhood of Steel shoulder cape"
	desc = "Issued to the Elders of the Brotherhood. Style over substance is important. This one is designed to be worn over the shoulder."
	icon_state = "bosshouldercape_r"

/obj/item/clothing/neck/mantle/bos/paladin
	name = "Paladin cloak"
	desc = "This stylish dark navy cloak that is made to be worn below a power armor pauldron, a shoulder holster is added for utility."
	icon_state = "paladin"
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/bos/paladin
	alternate_worn_layer = UNDER_HAIR_LAYER

/obj/item/clothing/neck/mantle/bos/knight
	name = "Knight mantle"
	desc = "A Navy blue shoulder covering worn by Brotherhood Knights, a shoulder holster is added for utility."
	icon_state = "knight"
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/bos/paladin

/obj/item/clothing/neck/mantle/ranger
	name = "NCR ranger cape"
	desc = "Ranger cape made from what looks like old poncho fitted with star, stripes and a bear. Most likely has a holster hidden underneath."
	icon_state = "rangercape"
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/bos/paladin

/obj/item/clothing/neck/mantle/chief
	name = "chieftains mantle"
	desc = "A symbol of the authority of the Wayfarer Chief."
	icon_state = "tribechief"

/obj/item/clothing/neck/mantle/jay
	name = "blue silk mantle"
	desc = "A finely woven and blue dyed mantle, with the emblem of a bird on its back."
	icon_state = "jaymantle"

/obj/item/clothing/neck/mantle/commander
	name = "commanders mantle"
	desc = "A fine mantle marking the wearer as a Commander of some long lost nation."
	icon_state = "commander"

/obj/item/clothing/neck/mantle/treasurer
	name = "treasurers mantle"
	desc = "The grey and black mantle with gold thread trimming shows the wearer is entrusted with matters of money and records. Hidden inner pockets can store money, keys and documents safely, and a discrete sheath for a knife for self defence is also attached."
	icon_state = "treasurer"
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/treasurer

/obj/item/clothing/neck/mantle/peltfur
	name = "warm fur pelt"
	desc = "A pelt made from bighorner fur."
	icon_state = "peltfur"
	cold_protection = CHEST|GROIN|ARMS
	armor = list("melee" = 5, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/neck/mantle/peltmountain
	name = "fur pelt"
	desc = "A pelt made from a mountain bear, brought in from Colorado."
	icon_state = "peltmountain"
	cold_protection = CHEST|GROIN|ARMS
	armor = list("melee" = 5, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/neck/mantle/ragged
	name = "ragged mantle"
	desc = "A worn and ripped old primitive mantle, made from sinew and bone."
	icon_state = "ragged"

/obj/item/clothing/neck/mantle/poncho
	name = "poncho"
	desc = "Plain and rugged piece of clothing, put it over your suit and make sure your gear don't get soaked through when it rains."
	icon_state = "poncho"
	body_parts_covered = CHEST|GROIN|ARMS

/obj/item/clothing/neck/mantle/poncho/red
	icon_state = "redponcho"



//SS13 Cloaks
/obj/item/clothing/neck/mantle/hos
	name = "head of security's mantle"
	desc = "Worn by Securistan, ruling the station with an iron fist."
	icon = 'icons/obj/clothing/cloaks.dmi'
	icon_state = "hoscloak"
	unique_reskin = list("cloak" = "hoscloak",
						"alternative" = "hoscloak2"
						)

/obj/item/clothing/neck/mantle/qm
	name = "quartermaster's cloak"
	desc = "Worn by Cargonia, supplying the station with the necessary tools for survival."
	icon = 'icons/obj/clothing/cloaks.dmi'
	icon_state = "qmcloak"
	unique_reskin = list("Coat" = "qmcloak",
						"alternative" = "qmcloak2"
						)

/obj/item/clothing/neck/mantle/cmo
	name = "chief medical officer's cloak"
	desc = "Worn by Meditopia, the valiant men and women keeping pestilence at bay."
	icon = 'icons/obj/clothing/cloaks.dmi'
	icon_state = "cmocloak"
	unique_reskin = list("cloak" = "cmocloak",
						"alternative" = "cmocloak2"
						)

/obj/item/clothing/neck/mantle/ce
	name = "chief engineer's cloak"
	desc = "Worn by Engitopia, wielders of an unlimited power."
	icon = 'icons/obj/clothing/cloaks.dmi'
	icon_state = "cecloak"
	unique_reskin = list("cloak" = "cecloak",
						"alternative" = "cecloak2"
						)

/obj/item/clothing/neck/mantle/rd
	name = "research director's cloak"
	desc = "Worn by Sciencia, thaumaturges and researchers of the universe."
	icon = 'icons/obj/clothing/cloaks.dmi'
	icon_state = "rdcloak"
	unique_reskin = list("cloak" = "rdcloak",
						"alternative " = "rdcloak2"
						)

/obj/item/clothing/neck/mantle/cap
	name = "captain's cloak"
	desc = "Worn by the commander of Space Station 13."
	icon = 'icons/obj/clothing/cloaks.dmi'
	icon_state = "capcloak"
	unique_reskin = list("cloak" = "capcloak",
						"alternative " = "capcloak2"
						)

/obj/item/clothing/neck/mantle/hop
	name = "head of personnel's cloak"
	desc = "Worn by the Head of Personnel. It smells faintly of bureaucracy."
	icon = 'icons/obj/clothing/cloaks.dmi'
	icon_state = "hopcloak"

/obj/item/clothing/neck/mantle/polychromic
	name = "polychromic cloak"
	desc = "For when you want to show off your horrible colour coordination skills."
	icon = 'icons/obj/clothing/cloaks.dmi'
	icon_state = "polyce"
	item_state = "qmcloak"
	var/list/poly_colors = list("#FFFFFF", "#FFFFFF", "#808080")

/obj/item/clothing/neck/mantle/polychromic/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/polychromic, poly_colors, 3)


/obj/item/clothing/neck/mantle/alt
	name = "cloak"
	desc = "A ragged up white cloak. It reminds you of a place not far from here."
	icon = 'icons/obj/clothing/cloaks.dmi'
	icon_state = "cloakc"
	item_state = "cloakc"

/obj/item/clothing/neck/mantle/alt/polychromic
	name = "polychromic cloak"
	desc = "A ragged up cloak. It reminds you of a place not far from here."
	icon = 'icons/obj/clothing/cloaks.dmi'
	icon_state = "cloakc"
	item_state = "cloakc"
	var/list/poly_colors = list("#FFFFFF", "#676767", "#4C4C4C")

/obj/item/clothing/neck/mantle/alt/polychromic/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/polychromic, poly_colors, 3)
