/obj/item/storage/belt/holster
	name = "holster"
	desc = "A holster to carry a handgun and ammo."
	icon_state = "holster"
	item_state = "holster"
	alternate_worn_layer = UNDER_SUIT_LAYER
	slot_flags = ITEM_SLOT_BELT | ITEM_SLOT_NECK
	always_reskinnable = TRUE
	unique_reskin = list(
						"Shoulder" = "holster",
						"Thigh" = "holster_leg",
						"Hip" = "holster_hip"
						)

/obj/item/storage/belt/holster/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 4
	STR.max_w_class = WEIGHT_CLASS_NORMAL
	STR.can_hold = typecacheof(list(
		/obj/item/gun/ballistic/automatic/pistol,
		/obj/item/gun/ballistic/revolver,
		/obj/item/ammo_box/magazine,
		/obj/item/ammo_box/tube,
		/obj/item/ammo_box/a357,
		/obj/item/ammo_box/l10mm,
		/obj/item/ammo_box/a762,
		/obj/item/ammo_box/shotgun,
		/obj/item/ammo_box/m44,
		/obj/item/ammo_box/a762,
		/obj/item/ammo_box/a556/stripper,
		/obj/item/ammo_box/needle,
		/obj/item/ammo_box/needleap,
		/obj/item/ammo_box/needleultra,
		/obj/item/ammo_box/a308,
		/obj/item/ammo_box/c4570,
		/obj/item/ammo_box/a50MG,
		/obj/item/ammo_box/c45rev,
		/obj/item/gun/energy/laser/solar,
		/obj/item/gun/energy/laser/pistol,
		/obj/item/gun/energy/laser/crusader,
		/obj/item/gun/energy/laser/plasma/pistol,
		/obj/item/gun/energy/plasma/crusader,
		/obj/item/gun/energy/laser/plasma/glock,
		/obj/item/gun/energy/laser/plasma/glock/extended,
		/obj/item/gun/energy/laser/wattz,
		/obj/item/gun/energy/laser/wattz/magneto,
		/obj/item/gun/energy/laser/plasma/alien,
		/obj/item/stock_parts/cell/ammo/ec
		))

/obj/item/storage/belt/holster/full/PopulateContents()
	new /obj/item/gun/ballistic/revolver/police(src)

/obj/item/storage/belt/holster/ranger44/PopulateContents()
	new /obj/item/gun/ballistic/revolver/m29/ranger(src)
	new /obj/item/ammo_box/m44(src)
	new /obj/item/ammo_box/m44(src)
	new /obj/item/ammo_box/m44(src)

/obj/item/storage/belt/holster/ranger357/PopulateContents()
	new /obj/item/gun/ballistic/revolver/colt357/ranger(src)
	new /obj/item/ammo_box/a357(src)
	new /obj/item/ammo_box/a357(src)
	new /obj/item/ammo_box/a357(src)

/obj/item/storage/belt/holster/ranger45/PopulateContents()
	new /obj/item/gun/ballistic/revolver/revolver45/ranger(src)
	new /obj/item/ammo_box/c45rev(src)
	new /obj/item/ammo_box/c45rev(src)
	new /obj/item/ammo_box/c45rev(src)

/obj/item/storage/belt/holster/ranger4570/PopulateContents()
	new /obj/item/gun/ballistic/revolver/sequoia(src)
	new /obj/item/ammo_box/c4570(src)
	new /obj/item/ammo_box/c4570(src)
	new /obj/item/ammo_box/c4570(src)

/obj/item/storage/belt/holster/ranger4570bayonet/PopulateContents()
	new /obj/item/gun/ballistic/revolver/sequoia/bayonet(src)
	new /obj/item/ammo_box/c4570(src)
	new /obj/item/ammo_box/c4570(src)
	new /obj/item/ammo_box/c4570(src)

/obj/item/storage/belt/holster/ranger10mm/PopulateContents()
	new /obj/item/gun/ballistic/revolver/colt6520/ranger(src)
	new /obj/item/ammo_box/l10mm(src)
	new /obj/item/ammo_box/l10mm(src)
	new /obj/item/ammo_box/l10mm(src)

/obj/item/storage/belt/holster/ncr/PopulateContents()
	new /obj/item/gun/ballistic/automatic/pistol/ninemil(src)
	new /obj/item/ammo_box/magazine/m9mm(src)
	new /obj/item/ammo_box/magazine/m9mm(src)
	new /obj/item/ammo_box/magazine/m9mm(src)

/obj/item/storage/belt/holster/ncr_officer/PopulateContents()
	new /obj/item/gun/ballistic/automatic/pistol/m1911(src)
	new /obj/item/ammo_box/magazine/m45(src)
	new /obj/item/ammo_box/magazine/m45(src)
	new /obj/item/ammo_box/magazine/m45(src)

/obj/item/storage/belt/holster/med_lt/PopulateContents()
	new /obj/item/gun/ballistic/revolver/thatgun(src)
	new /obj/item/ammo_box/a556/stripper(src)
	new /obj/item/ammo_box/a556/stripper(src)
	new /obj/item/ammo_box/a556/stripper(src)

/obj/item/storage/belt/holster/hip
	name = "hip holster"
	desc = "A low hanging holster to carry a handgun and ammo."
	icon_state = "holster_hip"
	item_state = "holster_hip"

//Sprite by Pisshole
/obj/item/storage/belt/holster/ncrcf_w
	name = "Worn NCRCF Women's Jacket"
	desc = "A worn, torn women's NCRCF jacket with 'pockets' slit into the inside, letting you hide some things in the seam. Somehow, it fills you with vague feelings of rebellion and mommy and daddy issues. You kind of wish you could fit drugs in this..."
	icon_state = "ncrcf_w"
	item_state = "ncrcf_w"
