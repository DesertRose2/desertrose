/obj/machinery/vending/faction
	name = "\improper Faction Vendor"
	desc = "A testing vendor."
	icon_state = "sec"
	icon_deny = "sec-deny"
	products = list()
	contraband = list()
	premium = list()
	armor = list("melee" = 100, "bullet" = 100, "laser" = 100, "energy" = 100, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 50)
	resistance_flags = FIRE_PROOF
	refill_canister = /obj/item/vending_refill/faction
	default_price = PRICE_ALMOST_EXPENSIVE
	extra_price = PRICE_REALLY_EXPENSIVE
	payment_department = ACCOUNT_SEC
	cost_multiplier_per_dept = list(ACCOUNT_SEC = 0)

/obj/machinery/vending/faction/pre_throw(obj/item/I)
	if(istype(I, /obj/item/grenade))
		var/obj/item/grenade/G = I
		G.preprime()
	else if(istype(I, /obj/item/flashlight))
		var/obj/item/flashlight/F = I
		F.on = TRUE
		F.update_brightness()

/obj/item/vending_refill/faction
	icon_state = "refill_games"

/obj/machinery/vending/faction/ncr
	name = "\improper NCR Vendor"
	desc = "A NCR uniform vendor."
	icon_state = "sec"
	icon_deny = "sec-deny"
	products = list(/obj/item/clothing/under/f13/ncr = 10,
					/obj/item/clothing/under/f13/ncr/ncr_officer = 10,
					/obj/item/clothing/under/f13/ranger = 10,
					/obj/item/clothing/shoes/f13/military/ncr = 10,
					/obj/item/clothing/shoes/f13/military/leather = 10)

/obj/machinery/vending/faction/leg
	name = "\improper Legion Vendor"
	desc = "A legion uniform vendor."
	icon_state = "sec"
	icon_deny = "sec-deny"
	products = list(/obj/item/clothing/under/f13/legskirt = 10,
					/obj/item/clothing/under/f13/campfollowermale = 10,
					/obj/item/clothing/under/f13/campfollowerfemale = 10,
					/obj/item/clothing/under/f13/legauxilia = 10,
					/obj/item/clothing/under/f13/legauxiliaf = 10,
					/obj/item/clothing/shoes/f13/military/leather = 10,
					/obj/item/clothing/shoes/f13/military/plated = 10)

/obj/machinery/vending/faction/bos
	name = "\improper Brotherhood Vendor"
	desc = "A brotherhood uniform vendor."
	icon_state = "sec"
	icon_deny = "sec-deny"
	products = list(/obj/item/clothing/under/f13/recon = 10,
					/obj/item/clothing/under/f13/bos/fatigues = 10,
					/obj/item/clothing/shoes/f13/military = 10)

/obj/machinery/vending/faction/vtcc
	name = "\improper VTCC Vendor"
	desc = "A vtcc uniform vendor."
	icon_state = "sec"
	icon_deny = "sec-deny"
	products = list(/obj/item/clothing/under/f13/vault/vcity = 10,
					/obj/item/clothing/shoes/jackboots = 10)