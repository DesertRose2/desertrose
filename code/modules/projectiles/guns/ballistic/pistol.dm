//IN THIS DOCUMENT: Pistol template, Light pistols, Heavy pistols
// See gun.dm for keywords and the system used for gun balance



///////////////////
//PISTOL TEMPLATE//
///////////////////


/obj/item/gun/ballistic/automatic/pistol
	slowdown = 0.1
	name = "pistol template"
	desc = "should not be here. Bugreport."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	lefthand_file = 'icons/fallout/onmob/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/weapons/guns_righthand.dmi'
	item_state = "gun"
	w_class = WEIGHT_CLASS_NORMAL //How much space it takes in a bag
	weapon_weight = WEAPON_LIGHT //Nakes dual wield possible
	slot_flags = ITEM_SLOT_BELT
	force = 12 //Pistol whip
	mag_type = /obj/item/ammo_box/magazine/m10mm_adv/simple
	spread = 2
	burst_size = 1
	fire_delay = 4
	select = FALSE
	automatic_burst_overlay = FALSE
	can_automatic = FALSE
	semi_auto = TRUE
	can_suppress = TRUE
	equipsound = 'sound/f13weapons/equipsounds/pistolequip.ogg'

/obj/item/gun/ballistic/automatic/pistol/no_mag
	spawnwithmagazine = FALSE

/obj/item/gun/ballistic/automatic/pistol/update_icon_state()
	icon_state = "[initial(icon_state)][chambered ? "" : "-e"]"

/obj/item/gun/ballistic/automatic/pistol/suppressed/Initialize(mapload)
	. = ..()
	var/obj/item/suppressor/S = new(src)
	install_suppressor(S)


//Reskin Template Example for Weapons!!!!!!
/obj/item/gun/ballistic/automatic/pistol/modular
	name = "modular pistol"
	desc = "A small, easily concealable 10mm handgun. Has a threaded barrel for suppressors."
	icon = 'modular_citadel/icons/obj/guns/cit_guns.dmi'
	icon_state = "cde"
	can_unsuppress = TRUE
	automatic_burst_overlay = FALSE
	obj_flags = UNIQUE_RENAME
	unique_reskin = list("Default" = "cde",
						"N-99" = "n99",
						"Stealth" = "stealthpistol",
						"HKVP-78" = "vp78",
						"Luger" = "p08b",
						"Mk.58" = "secguncomp",
						"PX4 Storm" = "px4"
						)

/obj/item/gun/ballistic/automatic/pistol/modular/update_icon_state()
	if(current_skin)
		icon_state = "[unique_reskin[current_skin]][chambered ? "" : "-e"][suppressed ? "-suppressed" : ""]"
	else
		icon_state = "[initial(icon_state)][chambered ? "" : "-e"][suppressed ? "-suppressed" : ""]"

/obj/item/gun/ballistic/automatic/pistol/modular/update_overlays()
	. = ..()
	if(magazine && suppressed)
		. += "[unique_reskin[current_skin]]-magazine-sup"	//Yes, this means the default iconstate can't have a magazine overlay
	else if (magazine)
		. += "[unique_reskin[current_skin]]-magazine"


/////////////////
//LIGHT PISTOLS//
/////////////////

//.22 Sport							Keywords: .22, Semi-auto, 16 round mags, Suppressed.
/obj/item/gun/ballistic/automatic/pistol/pistol22
	name = ".22 pistol"
	desc = "The silenced .22 pistol is a .22LR round handgun with an integrated silencer."
	icon_state = "silenced22"
	mag_type = /obj/item/ammo_box/magazine/m22
	w_class = WEIGHT_CLASS_SMALL
	fire_delay = 1
	can_suppress = FALSE
	can_unsuppress = FALSE
	suppressed = 1
	fire_sound = 'sound/f13weapons/22pistol.ogg'
	can_attachments = TRUE

//Browning Hi-power						Keywords: 9mm, Semi-auto, 10 round magazine
/obj/item/gun/ballistic/automatic/pistol/ninemil
	name = "Browning Hi-Power"
	desc = "A mass produced pre-war Browning Hi-power 9mm pistol."
	icon_state = "ninemil"
	mag_type = /obj/item/ammo_box/magazine/m9mm
	w_class = WEIGHT_CLASS_NORMAL
	fire_delay = 2
	can_suppress = TRUE
	fire_sound = 'sound/f13weapons/ninemil.ogg'
	can_attachments = TRUE
	suppressor_state = "pistol_suppressor"
	suppressor_x_offset = 30
	suppressor_y_offset = 19

//Maria									Keywords: UNIQUE, 9mm, Semi-auto, 10 round magazine
/obj/item/gun/ballistic/automatic/pistol/ninemil/maria
	name = "Maria"
	desc = "An ornately-decorated pre-war Browning Hi-power 9mm pistol with pearl grips and a polished nickel finish. The firing mechanism has been upgraded, so for anyone on the receiving end, it must seem like an eighteen-karat run of bad luck."
	icon_state = "maria"
	w_class = WEIGHT_CLASS_SMALL
	fire_delay = 0
	extra_damage = 8
	extra_penetration = 0.3

//Beretta M9FS							Keywords: 9mm, Semi-auto, 15 round magazine.
/obj/item/gun/ballistic/automatic/pistol/beretta
	name = "Beretta M9FS"
	desc = "One of the more common 9mm pistols, the Beretta is popular due to its reliability, 15 round magazine and good looks."
	icon_state = "beretta"
	mag_type = /obj/item/ammo_box/magazine/m9mmds
	w_class = WEIGHT_CLASS_NORMAL
	fire_delay = 3
	extra_damage = 2
	spread = 1
	can_suppress = FALSE
	fire_sound = 'sound/f13weapons/9mm.ogg'
	can_attachments = TRUE
	can_suppress = "pistol_suppressor"
	suppressor_x_offset = 30
	suppressor_y_offset = 20

//Beretta M93R							Keywords: 9mm, Automatic, 15 round magazine
/obj/item/gun/ballistic/automatic/pistol/beretta/automatic
	name = "Beretta M93R"
	desc = "A rare select fire variant of the M93R."
	icon_state = "m93r"
	burst_size = 3
	spread = 2
	actions_types = list(/datum/action/item_action/toggle_firemode)
	automatic_burst_overlay = TRUE
	can_attachments = FALSE
	semi_auto = FALSE

//Sig Sauer P220						Keywords: 9mm, Semi-auto, 10 round magazine
/obj/item/gun/ballistic/automatic/pistol/sig
	name = "Sig P220"
	desc = "The P220 Sig Sauer. A Swiss designed pistol, the Sig Sauer benefits from compact and lightweight construction."
	icon_state = "sig"
	mag_type = /obj/item/ammo_box/magazine/m9mm
	w_class = WEIGHT_CLASS_SMALL
	fire_delay = 1
	can_suppress = TRUE
	fire_sound = 'sound/f13weapons/ninemil.ogg'
	can_attachments = TRUE
	extra_damage = 2
	suppressor_state = "pistol_suppressor"
	suppressor_x_offset = 30
	suppressor_y_offset = 20

//Type 17								Keywords: 9mm, Semi-auto, 10 round magazine. Special modifiers: damage +2, spread +3
/obj/item/gun/ballistic/automatic/pistol/type17
	name = "Type 17"
	desc = "A reproduction of the WW2 weapon and issued to the Chinese military at the time of the Great War. Most samples seen are surplus finds from the time of the Great War. Chambered in 9mm."
	icon_state = "c96"
	mag_type = /obj/item/ammo_box/magazine/m9mm
	extra_damage = 2
	spread = 3
	fire_delay = 1
	can_suppress = FALSE
	fire_sound = 'sound/f13weapons/ninemil.ogg'

//N99  10mm								Keywords: 10mm, Semi-auto, 12/24 round magazine
/obj/item/gun/ballistic/automatic/pistol/n99
	name = "N99 pistol"
	desc = "A pre-war large-framed, gas-operated advanced 10mm pistol."
	icon_state = "n99"
	mag_type = /obj/item/ammo_box/magazine/m10mm_adv
	fire_sound = 'sound/f13weapons/10mm_fire_02.ogg'
	w_class = WEIGHT_CLASS_NORMAL
	can_attachments = TRUE
	fire_delay = 2
	can_suppress = TRUE
	can_automatic = TRUE
	suppressor_state = "n99_suppressor"
	suppressor_x_offset = 29
	suppressor_y_offset = 15

//'The Executive'						Keywords: UNIQUE, Cog City, 10mm, Semi-auto, 12/24 round magazine
/obj/item/gun/ballistic/automatic/pistol/n99/executive
	name = "Executive N99"
	desc = "A gas-operated N99 pistol chambered in 10mm rounds. It has an accurate two-round-burst and a blue Vault-Tec finish, for only the most robust overseers."
	icon_state = "executive"
	can_suppress = TRUE
	burst_size = 2
	can_automatic = FALSE
	extra_penetration = 0.2 //2x 35 damage, 10 AP- hits like a 2rd burst 5.56, but more accurate
	semi_auto = FALSE

//Desert Eagle							Keywords: .44 Magnum, Semi-auto, Long barrel, 8 round magazine.
/obj/item/gun/ballistic/automatic/pistol/deagle
	name = "Desert Eagle"
	desc = "A robust .44 magnum semi-automatic handgun."
	icon_state = "deagle"
	item_state = "deagle"
	mag_type = /obj/item/ammo_box/magazine/m44
	weapon_weight = WEAPON_MEDIUM
	force = 15
	extra_damage = 4
	recoil = 0.1
	can_suppress = FALSE
	automatic_burst_overlay = FALSE
	fire_sound = 'sound/f13weapons/44mag.ogg'

/obj/item/gun/ballistic/automatic/pistol/deagle/update_overlays()
	. = ..()
	if(magazine)
		. += "deagle_magazine"

/obj/item/gun/ballistic/automatic/pistol/deagle/update_icon_state()
	icon_state = "[initial(icon_state)][chambered ? "" : "-e"]"

//Colt M1911						Keywords: 45 APC, Semi-auto, 8 round mags.
/obj/item/gun/ballistic/automatic/pistol/m1911
	name = "M1911"
	desc = "A classic .45 handgun with a small magazine capacity."
	icon_state = "m1911"
	w_class = WEIGHT_CLASS_NORMAL
	mag_type = /obj/item/ammo_box/magazine/m45
	can_suppress = TRUE
	extra_damage = 2
	fire_delay = 2
	can_attachments = TRUE
	suppressor_state = "pistol_suppressor"
	suppressor_x_offset = 30
	suppressor_y_offset = 21

//Colt M1911 - Custom				Keywords: NCR, 45 APC, Semi-Auto, 8 round mags.
/obj/item/gun/ballistic/automatic/pistol/m1911/custom
	name = "M1911 Custom"
	desc = "A well-maintained stainless-steel frame 1911, with genuine wooden grips."
	icon_state = "m1911_custom"
	fire_delay = 1
	extra_damage = 3

//Colt M1911 - Compact				Keywords: 45 APC, Semi-Auto, 8 round mags. Note: Small, fits in pocket. Stoopid.
/obj/item/gun/ballistic/automatic/pistol/m1911/compact
	name = "M1911 compact"
	desc = "The compact version of the classic .45 handgun."
	icon_state = "c1911"
	w_class = WEIGHT_CLASS_SMALL
	extra_damage = 2
	suppressor_x_offset = 29
	suppressor_y_offset = 21

/obj/item/gun/ballistic/automatic/pistol/m1911/no_mag
	spawnwithmagazine = FALSE

//Mk. 23								Keywords: 45 ACP, Semi-Auto, 'Long barrel' (lasersight), 12 round magazine
/obj/item/gun/ballistic/automatic/pistol/mk23
	name = "MK23"
	desc = "A sleek looking handgun chambered in .45 ACP for all your operating needs."
	icon_state = "mk23"
	w_class = WEIGHT_CLASS_NORMAL
	mag_type = /obj/item/ammo_box/magazine/m45exp
	fire_sound = 'sound/f13weapons/45revolver.ogg'
	fire_delay = 3.5
	extra_damage = 4
	extra_penetration = 0.2
	can_suppress = TRUE
	suppressor_state = "pistol_suppressor"
	suppressor_x_offset = 28
	suppressor_y_offset = 20

//12.7mm Pistol		Keywords: 12.7mm, Semi-Auto, 7 round mags
/obj/item/gun/ballistic/automatic/pistol/pistol127
	name = "12.7mm pistol"
	desc = "A Swiss SIG-Sauer 14mm handgun rechambered for 12.7mm ammunition, likely designed for long-range pistol hunting or target shooting."
	icon_state = "pistol127"
	force = 14
	mag_type = /obj/item/ammo_box/magazine/m127mm
	fire_delay = 4
	can_suppress = TRUE
	fire_sound = 'sound/f13weapons/magnum_fire.ogg'
	suppressor_x_offset = 30
	suppressor_y_offset = 19
	suppressor_state = "n99_suppressor"

//12.7mm Pistol		Keywords: 12.7mm, Semi-Auto, 7 round mags, Small pocket edition(tm)
/obj/item/gun/ballistic/automatic/pistol/pistol127/compact
	name = "Compact 12.7mm pistol"
	desc = "A Swiss SIG-Sauer 14mm handgun rechambered for 12.7mm ammunition, likely designed for long-range pistol hunting or target shooting. This one is a compact model for concealed carry."
	icon_state = "pistol127_compact"
	w_class = WEIGHT_CLASS_SMALL
	extra_damage = -3 //Smaller barrel, smaller bullet velocity
	extra_penetration = -0.06 //See above
	spread = 3
	suppressor_x_offset = 28
	suppressor_y_offset = 19


//////////////////
//BOS SNOWFLAKE //
//////////////////

/obj/item/gun/ballistic/automatic/pistol/crusader_pistol
	name = "Crusader pistol (10mm)"
	desc = "A modular pistol of native Brotherhood of Steel design. Currently chambered in 10mm."
	icon_state = "crusader_pistol"
	item_state = "crusader_pistol"
	mag_type = /obj/item/ammo_box/magazine/m10mm_adv/simple
	fire_sound = 'sound/f13weapons/10mm_fire_02.ogg'
	w_class = WEIGHT_CLASS_NORMAL
	can_attachments = FALSE
	fire_delay = 2
	can_suppress = FALSE

/obj/item/gun/ballistic/automatic/pistol/crusader_rifle
	name = "Crusader pistol (4.73mm caseless)"
	desc = "A modular pistol of native Brotherhood of Steel design. Currently chambered in 4.73mm caseless."
	icon_state = "crusader_rifle"
	item_state = "crusader_rifle"
	mag_type = /obj/item/ammo_box/magazine/m473_pistol
	fire_sound = 'sound/f13weapons/magnum_fire.ogg'
	w_class = WEIGHT_CLASS_NORMAL
	can_attachments = FALSE
	fire_delay = 2
	can_suppress = FALSE

/obj/item/gun/ballistic/automatic/pistol/crusader_rifle_ncr
	name = "Crusader pistol (5.56mm)"
	desc = "A modular pistol of native Brotherhood of Steel design. Currently chambered in 5.56mm."
	icon_state = "crusader_rifle"
	icon_state = "crusader_rifle"
	mag_type = /obj/item/ammo_box/magazine/m556/rifle/small
	fire_sound = 'sound/f13weapons/magnum_fire.ogg'
	w_class = WEIGHT_CLASS_NORMAL
	can_attachments = FALSE
	fire_delay = 2
	can_suppress = FALSE
