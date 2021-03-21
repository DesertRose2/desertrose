/datum/design/ammolathe
	build_type = AMMOLATHE

/* --- Documentation ---
	FMJ = Full Metal Jacket, standard bullets
	AP = Armor Piercing, these should always cost titanium
	JHP = Jacketed Hollow Point, should cost less than FMJ
*/

/* --Tier 1 Ammo and Magazines-- */
//Tier 1 Magazines
/datum/design/ammolathe/m45
	name = "empty handgun magazine (.45)"
	id = "m45"
	materials = list(/datum/material/iron = 2000)
	build_path = /obj/item/ammo_box/magazine/m45/empty
	category = list("initial", "Simple Magazines")

/datum/design/ammolathe/m45
	name = "empty 10mm pistol magazine (10mm)"
	id = "m10mm_adv"
	materials = list(/datum/material/iron = 2000)
	build_path = /obj/item/ammo_box/magazine/m10mm_adv/empty
	category = list("initial", "Simple Magazines")

/datum/design/ammolathe/m9mm
	name = "empty 9mm pistol magazine (9mm)"
	id = "m9mm"
	materials = list(/datum/material/iron = 2000)
	build_path = /obj/item/ammo_box/magazine/m9mm/empty
	category = list("initial", "Simple Magazines")

/datum/design/ammolathe/speedloader44
	name = "empty speed loader (.44)"
	id = "speedloader44"
	materials = list(/datum/material/iron = 2000)
	build_path = /obj/item/ammo_box/m44/empty
	category = list("initial", "Simple Magazines")

/datum/design/ammolathe/rifle556
	name = "empty 20rd rifle magazine (5.56mm)"
	id = "rifle556"
	materials = list(/datum/material/iron = 4000)
	build_path = /obj/item/ammo_box/magazine/m556/rifle/empty
	category = list("initial", "Simple Magazines")

/datum/design/ammolathe/m9mmds
	name = "empty doublestack magazine (9mm)"
	id = "m9mmds"
	materials = list(/datum/material/iron = 4000)
	build_path = /obj/item/ammo_box/magazine/m9mmds/empty
	category = list("initial", "Simple Magazines")

/datum/design/ammolathe/m556_rifle_small
	name = "empty small rifle magazine (5.56mm)"
	id = "m556_rifle_small"
	materials = list(/datum/material/iron = 4000)
	build_path = /obj/item/ammo_box/magazine/m556/rifle/small/empty
	category = list("initial", "Simple Magazines")

//Tier 1 Ammo
/datum/design/ammolathe/beanbag
	name = "beanbag shotgun box"
	id = "beanbag"
	materials = list(/datum/material/iron = 8000)
	build_path = /obj/item/storage/fancy/ammobox/beanbag
	category = list("initial", "Simple Ammo")

/datum/design/ammolathe/rubbershot
	name = "rubbershot shotgun box"
	id = "rubbershot"
	materials = list(/datum/material/iron = 8000)
	build_path = /obj/item/storage/fancy/ammobox
	category = list("initial", "Simple Ammo")

/datum/design/ammolathe/c10mm
	name = "10mm FMJ ammo box"
	id = "c10mm_lathe"
	materials = list(/datum/material/iron = 10000)
	build_path = /obj/item/ammo_box/c10mm
	category = list("initial", "Simple Ammo")

/datum/design/ammolathe/lethalshot
	name = "buckshot shotgun box"
	id = "lethalshot"
	materials = list(/datum/material/iron = 8000)
	build_path = /obj/item/storage/fancy/ammobox/lethalshot
	category = list("initial", "Simple Ammo")

/datum/design/ammolathe/a308
	name = ".308 ammo box"
	id = "a308"
	materials = list(/datum/material/iron = 14000)
	build_path = /obj/item/ammo_box/a308box
	category = list("initial", "Simple Ammo")

/datum/design/ammolathe/a22plink
	name = ".22lr plinking ammo box"
	id = "a22plink"
	build_path = /obj/item/ammo_box/m22/plinking
	materials = list(/datum/material/iron = 3000)
	category = list("initial", "Simple Ammo")

/datum/design/ammolathe/a223
	name = ".223 ammo box"
	id = "a223"
	build_path = /obj/item/ammo_box/a556/sport
	materials = list(/datum/material/iron = 16000)
	category = list("initial", "Simple Ammo")

/datum/design/ammolathe/a9mmjhp
	name = "9mm JHP ammo box"
	id = "a9mmjhp"
	build_path = /obj/item/ammo_box/c9mm/jhp
	materials = list(/datum/material/iron = 11000)
	category = list("initial", "Simple Ammo")

/datum/design/ammolathe/a45jhp
	name = ".45 ACP JHP ammo box"
	id = "a45jhp"
	build_path = /obj/item/ammo_box/c45/jhp
	materials = list(/datum/material/iron = 6000)
	category = list("initial", "Simple Ammo")

/* --Tier 2 Ammo And Magazines-- */
//Tier 2 Magazines
/datum/design/ammolathe/tube44
	name = "empty speed loader tube (.44)"
	id = "tube44"
	materials = list(/datum/material/iron = 6000)
	build_path = /obj/item/ammo_box/tube/m44/empty
	category = list("initial", "Basic Magazines")

/datum/design/ammolathe/tube357
	name = "empty speed loader tube (.357)"
	id = "tube357"
	materials = list(/datum/material/iron = 6000)
	build_path = /obj/item/ammo_box/tube/a357/empty
	category = list("initial", "Basic Magazines")

/datum/design/ammolathe/m10mm_adv_ext
	name = "empty 10mm pistol extended magazine (10mm)"
	id = "m10mm_adv_ext"
	materials = list(/datum/material/iron = 4000)
	build_path = /obj/item/ammo_box/magazine/m10mm_adv/ext/empty
	category = list("initial", "Basic Magazines")

/datum/design/ammolathe/greasegunmag
	name = "empty grease submachine gun magazine (.45)"
	id = "greasegunmag"
	materials = list(/datum/material/iron = 4000)
	build_path = /obj/item/ammo_box/magazine/greasegun/empty
	category = list("initial", "Basic Magazines")

/datum/design/ammolathe/mini_uzimag
	name = "empty mini uzi magazine (9mm)"
	id = "mini_uzimag"
	materials = list(/datum/material/iron = 4000)
	build_path = /obj/item/ammo_box/magazine/uzim9mm/empty
	category = list("initial", "Basic Magazines")

/datum/design/ammolathe/rifleassault556
	name = "empty 30rd rifle magazine (5.56mm)"
	id = "rifleassault556"
	materials = list(/datum/material/iron = 8000)
	build_path = /obj/item/ammo_box/magazine/m556/rifle/assault/empty
	category = list("initial", "Basic Magazines")

/datum/design/ammolathe/pistol22mag
	name = "empty pistol magazine (.22lr)"
	id = "pistol22mag"
	materials = list(/datum/material/iron = 4000)
	build_path = /obj/item/ammo_box/magazine/m22/empty
	category = list("initial", "Basic Magazines")

//Tier 2 Ammo
/datum/design/ammolathe/c10mmjhp
	name = "10mm JHP ammo box"
	id = "c10mmjhp"
	materials = list(/datum/material/iron = 6000)
	build_path = /obj/item/ammo_box/c10mm/jhp
	category = list("initial", "Basic Ammo")

/datum/design/ammolathe/c10mmap
	name = "10mm AP ammo box"
	id = "c10mmap"
	materials = list(/datum/material/iron = 14000, /datum/material/titanium = 3500)
	build_path = /obj/item/ammo_box/c10mm/ap
	category = list("initial", "Basic Ammo")

/datum/design/ammolathe/m44
	name = ".44 Magnum FMJ ammo box"
	id = "m44"
	materials = list(/datum/material/iron = 14000)
	build_path = /obj/item/ammo_box/m44box
	category = list("initial", "Basic Ammo")

/datum/design/ammolathe/m44jhp
	name = ".44 Magnum JHP ammo box"
	id = "m44jhp"
	materials = list(/datum/material/iron = 10000)
	build_path = /obj/item/ammo_box/m44box/jhp
	category = list("initial", "Basic Ammo")

/datum/design/ammolathe/a357
	name = ".357 Magnum FMJ ammo box"
	id = "a357_lathe"
	materials = list(/datum/material/iron = 16000)
	build_path = /obj/item/ammo_box/a357box
	category = list("initial", "Basic Ammo")

/datum/design/ammolathe/a357jhp
	name = ".357 Magnum JHP ammo box"
	id = "a357jhp"
	materials = list(/datum/material/iron = 12000)
	build_path = /obj/item/ammo_box/a357box/jhp
	category = list("initial", "Basic Ammo")

/datum/design/ammolathe/a556
	name = "5.56mm FMJ ammo box"
	id = "a556"
	materials = list(/datum/material/iron = 20000)
	build_path = /obj/item/ammo_box/a556
	category = list("initial", "Basic Ammo")

/datum/design/ammolathe/a556jhp
	name = "5.56 JHP ammo box"
	id = "a556jhp"
	materials = list(/datum/material/iron = 16000)
	build_path = /obj/item/ammo_box/a556/jhp
	category = list("initial", "Basic Ammo")

/datum/design/ammolathe/magnumshot
	name = "magnum buckshot shotgun box"
	id = "magnumshot"
	materials = list(/datum/material/iron = 10000)
	build_path = /obj/item/storage/fancy/ammobox/magnumshot
	category = list("initial", "Basic Ammo")

/datum/design/ammolathe/slugshot
	name = "slug shotgun box"
	id = "slugshot"
	materials = list(/datum/material/iron = 8000)
	build_path = /obj/item/storage/fancy/ammobox/slugshot
	category = list("initial", "Basic Ammo")

/datum/design/ammolathe/a556ap
	name = "5.56 AP ammo box"
	id = "a556ap"
	materials = list(/datum/material/iron = 24000, /datum/material/titanium = 6000)
	build_path = /obj/item/ammo_box/a556/ap
	category = list("initial", "Basic Ammo")

/datum/design/ammolathe/a762
	name = "7.62 FMJ ammo box"
	id = "a762_lathe"
	materials = list(/datum/material/iron = 16000)
	build_path = /obj/item/ammo_box/a762box
	category = list("initial", "Basic Ammo")

/datum/design/ammolathe/a762jhp
	name = "7.62 JHP ammo box"
	id = "a762jhp"
	materials = list(/datum/material/iron = 12000)
	build_path = /obj/item/ammo_box/a762box/jhp
	category = list("initial", "Basic Ammo")

/datum/design/ammolathe/a22
	name = ".22lr ammo box"
	id = "a22"
	build_path = /obj/item/ammo_box/m22
	materials = list(/datum/material/iron = 6000)
	category = list("initial", "Basic Ammo")

/datum/design/ammolathe/a9mmfmj
	name = "9mm FMJ ammo box"
	id = "a9mmfmj"
	build_path = /obj/item/ammo_box/c9mm
	materials = list(/datum/material/iron = 15000)
	category = list("initial", "Basic Ammo")

/datum/design/ammolathe/a127mmjhp
	name = "12.7mm JHP ammo box"
	id = "a127mmjhp"
	build_path = /obj/item/ammo_box/m127mm/jhp
	materials = list(/datum/material/iron = 11000)
	category = list("initial", "Basic Ammo")

/datum/design/ammolathe/a45fmj
	name = ".45 ACP FMJ ammo box"
	id = "a45fmj"
	build_path = /obj/item/ammo_box/c45
	materials = list(/datum/material/iron = 10000)
	category = list("initial", "Basic Ammo")

/* --Tier 3 Ammo and Magazines -- */
//Tier 3 Magazines

/datum/design/ammolathe/speedloader4570
	name = "empty speed loader (.45-70)"
	id = "speedloader4570"
	materials = list(/datum/material/iron = 4000)
	build_path = /obj/item/ammo_box/c4570/empty
	category = list("initial", "Intermediate Magazines")

/datum/design/ammolathe/tube4570
	name = "empty speed loader tube (.45-70)"
	id = "tube4570"
	materials = list(/datum/material/iron = 6000)
	build_path = /obj/item/ammo_box/tube/c4570/empty
	category = list("initial", "Intermediate Magazines")

/datum/design/ammolathe/pps_mag
	name = "empty ppsh magazine (9mm)"
	id = "pps_mag"
	materials = list(/datum/material/iron = 6000)
	build_path = /obj/item/ammo_box/magazine/pps9mm/empty
	category = list("initial", "Intermediate Magazines")

/datum/design/ammolathe/d12g
	name = "empty shotgun drum magazine (12g)"
	id = "d12g"
	materials = list(/datum/material/iron = 4000)
	build_path = /obj/item/ammo_box/magazine/d12g/empty
	category = list("initial", "Intermediate Magazines")

/datum/design/ammolathe/m44m
	name = "empty handgun magazine (.44 magnum)"
	id = "m44m"
	materials = list(/datum/material/iron = 6000)
	build_path = /obj/item/ammo_box/magazine/m44/empty
	category = list("initial", "Intermediate Magazines")

/datum/design/ammolathe/m127mm
	name = "empty handgun magazine (12.7)"
	id = "m127mm"
	materials = list(/datum/material/iron = 6000)
	build_path = /obj/item/ammo_box/magazine/m127mm/empty
	category = list("initial", "Intermediate Magazines")

/datum/design/ammolathe/m22smg
	name = "empty toploader magazine (.22lr)"
	id = "m22smg"
	materials = list(/datum/material/iron = 6000)
	build_path = /obj/item/ammo_box/magazine/m22smg/empty
	category = list("initial", "Intermediate Magazines")

/datum/design/ammolathe/m762
	name = "empty rifle magazine (7.62x51)"
	id = "m762"
	materials = list(/datum/material/iron = 6000)
	build_path = /obj/item/ammo_box/magazine/m762/empty
	category = list("initial", "Intermediate Magazines")

/datum/design/ammolathe/w308
	name = "empty sniper rifle magazine (7.62x51)"
	id = "w308"
	materials = list(/datum/material/iron = 6000)
	build_path = /obj/item/ammo_box/magazine/w308/empty
	category = list("initial", "Intermediate Magazines")

//Tier 3 Ammo
/datum/design/ammolathe/c4570
	name = ".45-70 FMJ ammo box"
	id = "c4570"
	materials = list(/datum/material/iron = 16000)
	build_path = /obj/item/ammo_box/c4570box
	category = list("initial", "Intermediate Ammo")

/datum/design/ammolathe/c4570jhp
	name = ".45-70 JHP ammo box"
	id = "c4570jhp"
	materials = list(/datum/material/iron = 12000)
	build_path = /obj/item/ammo_box/c4570box/jhp
	category = list("initial", "Intermediate Ammo")

/datum/design/ammolathe/a50mg
	name = ".50 MG (rifle) ammo box"
	id = "a50mg"
	materials = list(/datum/material/iron = 20000)
	build_path = /obj/item/ammo_box/a50MGbox
	category = list("initial", "Intermediate Ammo")

/datum/design/ammolathe/a22hp
	name = ".22lr HP ammo box"
	id = "a22hp"
	build_path = /obj/item/ammo_box/m22/hp
	materials = list(/datum/material/iron = 8000)
	category = list("initial", "Intermediate Ammo")

/datum/design/ammolathe/a9mmap
	name = "9mm AP ammo box"
	id = "a9mmap"
	build_path = /obj/item/ammo_box/c9mm/ap
	materials = list(/datum/material/iron = 15000, /datum/material/titanium = 3750)
	category = list("initial", "Intermediate Ammo")

/datum/design/ammolathe/a127mm
	name = "12.7mm FMJ ammo box"
	id = "a127mm"
	build_path = /obj/item/ammo_box/m127mm
	materials = list(/datum/material/iron = 15000)
	category = list("initial", "Intermediate Ammo")

/datum/design/ammolathe/a357jfp
	name = ".357 Magnum JFP ammo box"
	id = "a357jfp"
	build_path = /obj/item/ammo_box/a357box/jfp
	materials = list(/datum/material/iron = 19000)
	category = list("initial", "Intermediate Ammo")

/datum/design/ammolathe/a44swc
	name = ".44 Magnum SWC ammo box"
	id = "a44swc"
	build_path = /obj/item/ammo_box/m44box/swc
	materials = list(/datum/material/iron = 19000)
	category = list("initial", "Intermediate Ammo")

/datum/design/ammolathe/a762ap
	name = "7.62mm AP ammo box"
	id = "a762ap"
	materials = list(/datum/material/iron = 20000, /datum/material/titanium = 5000)
	build_path = /obj/item/ammo_box/a762box/ap
	category = list("initial", "Intermediate Ammo")

/datum/design/ammolathe/a45op
	name = ".45 ACP +P ammo box"
	id = "a45op"
	materials = list(/datum/material/iron = 14000)
	build_path = /obj/item/ammo_box/c45/op
	category = list("initial", "Intermediate Ammo")

/* --Tier 4 Ammo and Magazines-- */
//Tier 4 Magazines
/datum/design/ammolathe/mg34mag
	name = "empty machine gun magazine (7.62)"
	id = "mg34mag"
	materials = list(/datum/material/iron = 8000)
	build_path = /obj/item/ammo_box/magazine/mg34/empty
	category = list("initial", "Advanced Magazines")

/datum/design/ammolathe/m10mm_p90
	name = "empty toploader magazine (10mm)"
	id = "m10mm_p90"
	materials = list(/datum/material/iron = 6000)
	build_path = /obj/item/ammo_box/magazine/m10mm_p90/empty
	category = list("initial", "Advanced Magazines")

/datum/design/ammolathe/m556_rifle_extended
	name = "empty extended rifle magazine (5.56mm)"
	id = "m556_rifle_extended"
	materials = list(/datum/material/iron = 8000)
	build_path = /obj/item/ammo_box/magazine/m556/rifle/extended/empty
	category = list("initial", "Advanced Magazines")

/datum/design/ammolathe/m473
	name = "empty g11 magazine (4.73mm)"
	id = "m473"
	materials = list(/datum/material/iron = 6000)
	build_path = /obj/item/ammo_box/magazine/m473/empty
	category = list("initial", "Advanced Magazines")

/datum/design/ammolathe/m762ext
	name = "empty extended rifle magazine (7.62x51)"
	id = "m762ext"
	materials = list(/datum/material/iron = 6000)
	build_path = /obj/item/ammo_box/magazine/m762/ext/empty
	category = list("initial", "Advanced Magazines")

//Tier 4 Ammo
/datum/design/ammolathe/m2mm
	name = "2mm Electromagnetic Magazine"
	id = "2mm"
	materials = list(/datum/material/iron = 25000, /datum/material/titanium = 25000)
	build_path = /obj/item/ammo_box/magazine/m2mm
	category = list("initial", "Advanced Ammo")

/datum/design/ammolathe/a9mmop
	name = "9mm +P ammo box"
	id = "a9mmop"
	materials = list(/datum/material/iron = 19000)
	build_path = /obj/item/ammo_box/c9mm/op
	category = list("initial", "Advanced Ammo")

/datum/design/ammolathe/a4570swc
	name = ".45-70 SWC ammo box"
	id = "a4570swc"
	materials = list(/datum/material/iron = 20000)
	build_path = /obj/item/ammo_box/c4570box/swc
	category = list("initial", "Advanced Ammo")

/datum/design/ammolathe/a762jsp
	name = "7.62mm JSP ammo box"
	id = "a762jsp"
	materials = list(/datum/material/iron = 24000)
	build_path = /obj/item/ammo_box/a762box/jsp
	category = list("initial", "Advanced Ammo")

/datum/design/ammolathe/a762match
	name = "7.62mm Match ammo box"
	id = "a762match"
	materials = list(/datum/material/iron = 28000)
	build_path = /obj/item/ammo_box/a762box/match
	category = list("initial", "Advanced Ammo")

/datum/design/ammolathe/a556match
	name = "5.56 Match ammo box"
	id = "a556match"
	materials = list(/datum/material/iron = 28000)
	build_path = /obj/item/ammo_box/a556/match
	category = list("initial", "Advanced Ammo")
