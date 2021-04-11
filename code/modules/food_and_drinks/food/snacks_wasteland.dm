/obj/item/reagent_containers/food/snacks/pemmican
	name = "pemmican"
	desc = "A well-known food in survivalist circles, pemmican is a mixture of fat and protein from the meat of an animal."
	icon_state = "phelmbiscuit"
	list_reagents = list("nutriment" = 2, "vitamin" = 4)
	tastes = list("dried meat" = 8, "Sawdust" = 4, "Corn" = 1)
	foodtype = MEAT

/obj/item/reagent_containers/food/snacks/tallow
	name = "Tallow"
	desc = "A block of pale waxy fat."
	icon_state = "butter"
	list_reagents = list("cooking_oil" = 20)
	filling_color = "#FFD700"
	tastes = list("sickly fat" = 1)
	foodtype = MEAT | JUNKFOOD | GROSS

/obj/item/reagent_containers/food/snacks/crunchymutfruit
	name = "Crunchy Mutfruit"
	desc = "A juicy mutfruit with a crispy exterior layer."
	icon_state = "scotchegg"
	list_reagents = list("nutriment" = 4, "vitamin" = 2)
	filling_color = "#FFD700"
	tastes = list("crunchy sweetness" = 1, "warm butter"=1)
	foodtype = FRUIT

/obj/item/reagent_containers/food/snacks/tatofries
	name = "tao fries"
	desc = "Tato fries are served hot, either soft or crispy, and are generally eaten through out the wasteland as part of lunch or dinner or by themselves as a snack."
	icon_state = "fries"
	list_reagents = list("nutriment" = 4)
	filling_color = "#FFD700"
	tastes = list("fries" = 1, "salt" = 1, "spoiled ketchup"=2)
	foodtype = VEGETABLES | GRAIN | FRIED

/obj/item/reagent_containers/food/snacks/friedbrahminskin
	name = "Brahmin cracklings"
	desc = "Cracklings are the solid material which remains after rendering animal fat and skin to produce lard, tallow, or schmaltz. It is often eaten as a snack food or made into animal feed. It is also used in cooking."
	icon_state = "Fried Brahmin Skin"
	filling_color = "#CD5C5C"
	bonus_reagents = list("nutriment" = 1, "vitamin" = 1)
	list_reagents = list("nutriment" = 6, "vitamin" = 1)
	tastes = list("crispy skin" = 1)
	foodtype = MEAT

/obj/item/reagent_containers/food/snacks/brahminwellington
	name = "Brahmin wellington"
	desc = "A pie made of fillet steak coated with pâté and duxelles, which is then wrapped in molerat ham and puff pastry"
	icon_state = "Brahmin Wellington"
	bonus_reagents = list("nutriment" = 1, "vitamin" = 2)
	bitesize = 4
	filling_color = "#FFA07A"
	list_reagents = list("nutriment" = 8)
	tastes = list("smokey meat" = 3, "cheese" = 1, "sour cream" = 1, "flaky crust" = 2)
	foodtype = MEAT | GRAIN

/obj/item/reagent_containers/food/snacks/deathclawwellington
	name = "Deathclaw wellington"
	desc = "A pie made of top grade steak coated with pâté and duxelles, which is then wrapped in molerat ham and buttery puff pastry"
	icon_state = "Deathclaw Wellington"
	bonus_reagents = list("nutriment" = 1, "vitamin" = 2)
	bitesize = 4
	filling_color = "#FFA07A"
	list_reagents = list("nutriment" = 8)
	tastes = list("high grade meat" = 2, "smokey meat" = 3, "cheese" = 1, "sour cream" = 1, "flaky crust" = 2)
	foodtype = MEAT | GRAIN