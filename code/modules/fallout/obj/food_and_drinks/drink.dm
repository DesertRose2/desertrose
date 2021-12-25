/obj/item/reagent_containers/food/drinks/flask
	name = "metal flask"
	desc = "A metal container for liquids. Never leave home without one."
	icon_state = "flask"
	icon = 'icons/fallout/objects/containers.dmi'
	custom_materials = list(/datum/material/iron = 500)
	isGlass = FALSE
	volume = 60

/obj/item/reagent_containers/food/drinks/flask/fancy
	name = "fancy flask"
	desc = "Metal flask with a leather sleeve."
	icon_state = "flask_fancy"
	list_reagents = list(/datum/reagent/consumable/ethanol/whiskey = 30)

/obj/item/reagent_containers/food/drinks/flask/survival
	name = "metal flask"
	desc = "Contains water with a little medicinal powder dissolved in it."
	list_reagents = list(/datum/reagent/water = 40, /datum/reagent/medicine/silver_sulfadiazine = 10)

/obj/item/reagent_containers/food/drinks/flask/vault13
	name = "Vault 13 flask"
	desc = "Take a sip from your trusty Vault 13 canteen."
	icon_state = "flask13"
	list_reagents = list(/datum/reagent/water = 30, /datum/reagent/medicine/silver_sulfadiazine = 10, /datum/reagent/medicine/charcoal = 20)

/obj/item/reagent_containers/food/drinks/flask/vault113
	name = "Vault 113 flask"
	desc = "See this large yellow number? It means it's a Vault 113 canteen. Never forget."
	icon_state = "flask113"
	list_reagents = list(/datum/reagent/water = 30, /datum/reagent/radium = 10, /datum/reagent/medicine/mine_salve = 20)

/obj/item/reagent_containers/food/drinks/flask/russian
	name = "russian flask"
	desc = "Every good russian spaceman knows it's a good idea to bring along a couple of pints of whiskey wherever they go."
	icon = 'icons/obj/custom.dmi'
	icon_state = "russianflask"
	volume = 60

/obj/item/reagent_containers/food/drinks/flask/personalmug
	name = "personal mug"
	desc = "A worn mug that is someone favourite."
	icon_state = "mug"
	volume = 30
	spillable = TRUE
	isGlass = TRUE
