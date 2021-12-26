/obj/item/kitchen/fork
	force = 5

/obj/item/kitchen/fork/throwing
	embedding = list("pain_mult" = 2, "embed_chance" = 80, "fall_chance" = 0, "embed_chance_turf_mod" = 15)

/obj/item/kitchen/knife
	icon_state = "knife_kitchen"
	desc = "A general purpose Chef's Knife made by VaultCook Incorporated. Guaranteed to stay sharp for years to come."
	force = 10
	throwforce = 10

/obj/item/kitchen/knife/butcher
	icon_state = "butch"
	desc = "A huge thing used for chopping and chopping up meat. This includes clowns and clown by-products."
	force = 25
	throwforce = 20

/obj/item/kitchen/knife/combat
	name = "hunting knife"
	desc = "A dependable hunting knife."
	icon_state = "knife_hunting"
	force = 30
	throwforce = 25
	bayonet = FALSE

/obj/item/kitchen/knife/combat/survival
	icon_state = "knife_survival"
	desc = "A multi-purpose knife with blackened steel."
	force = 25
	throwforce = 25
	bayonet = FALSE

/obj/item/kitchen/knife/combat/bayonet
	name = "bayonet knife"
	icon_state = "knife_bayonet"
	item_state = "knife"
	desc = "This weapon is made for stabbing, not much use for other things."
	force = 10
	throwforce = 5
	armour_penetration = 0.2
	bayonet = TRUE

/obj/item/kitchen/knife/bowie
	name = "bowie knife"
	icon_state = "knife_bowie"
	item_state = "knife_bowie"
	desc = "A large clip point fighting knife."
	force = 33
	throwforce = 25
	attack_verb = list("slashed", "stabbed", "sliced", "shanked", "ripped", "lacerated")

/obj/item/kitchen/knife/trench
	name = "trench knife"
	icon_state = "knife_trench"
	item_state = "knife_trench"
	desc = "This blade is designed for brutal close quarters combat."
	force = 37
	throwforce = 25
	attack_verb = list("slashed", "stabbed", "sliced", "shanked", "ripped", "lacerated")

/obj/item/kitchen/knife/combat/bone
	icon_state = "knife_bone"
	lefthand_file = 'icons/mob/inhands/equipment/kitchen_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/kitchen_righthand.dmi'
	force = 20
	throwforce = 20

/obj/item/kitchen/knife/cosmicdirty
	name = "dirty cosmic knife"
	desc = "A high-quality kitchen knife made from Saturnite alloy."
	icon_state = "cosmic_knife_dirty"
	item_state = "knife"
	force = 15
	throwforce = 10
	armour_penetration = 0.2

/obj/item/kitchen/knife/cosmic
	name = "cosmic knife"
	desc = "A high-quality kitchen knife made from Saturnite alloy, this one seems to be in better condition."
	icon_state = "cosmic_knife"
	item_state = "knife"
	force = 25
	throwforce = 15
	armour_penetration = 0.2

/obj/item/kitchen/knife/cosmicheated
	name = "superheated cosmic knife"
	desc = "A high-quality kitchen knife made from Saturnite alloy, this one looks like it has been heated to high temperatures."
	icon_state = "cosmic_knife_heated"
	item_state = "knife"
	damtype = BURN
	force = 35
	throwforce = 20
	armour_penetration = 0.4

/obj/item/kitchen/knife/ritualdagger
	name = "ritual dagger"
	desc = "An ancient blade used to carry out the spiritual rituals of the Wayfarer people."
	icon_state = "ritualdagger"
	item_state = "knife_ritual"
	force = 25
	throwforce = 20
	armour_penetration = 0.2
