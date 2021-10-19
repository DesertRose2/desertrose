/obj/item/ammo_box/magazine/amr
	name = "anti-materiel rifle magazine (.50MG)"
	icon = 'icons/fallout/objects/guns/ammo.dmi'
	icon_state = "50mag"
	max_ammo = 8
	ammo_type = /obj/item/ammo_casing/a50MG
	caliber = "a50MG"
	multiple_sprites = 2

/obj/item/ammo_box/magazine/amr/empty
	start_empty = TRUE

/obj/item/ammo_box/magazine/amr/incindiary
	name = "anti-materiel magazine (.50MG incendiary)"
	ammo_type = /obj/item/ammo_casing/a50MG/incendiary


obj/item/ammo_box/magazine/sniper_rounds/soporific
	name = "sniper rounds (Zzzzz)"
	desc = "Soporific sniper rounds, designed for happy days and dead quiet nights..."
	icon_state = "soporific"
	max_ammo = 3
	caliber = ".50"

/obj/item/ammo_box/magazine/sniper_rounds/penetrator
	name = "sniper rounds (penetrator)"
	desc = "An extremely powerful round capable of passing straight through cover and anyone unfortunate enough to be behind it."
	max_ammo = 5
