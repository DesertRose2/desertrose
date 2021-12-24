//WASTELAND MEATS

/obj/item/reagent_containers/food/snacks/meat/slab/gecko
	name = "gecko fillet"
	desc = "A tasty fillet of gecko meat.<br>If you cook it, it tastes like chicken!"
	icon_state = "fishfillet"
	list_reagents = list(/datum/reagent/consumable/nutriment = 6,  /datum/reagent/toxin  = 1, /datum/reagent/consumable/nutriment/vitamin = 2)
	bitesize = 2 //Smaller animal
	filling_color = "#FA8072"
	cooked_type = /obj/item/reagent_containers/food/snacks/meat/steak/gecko
	slice_path = null
	foodtype = MEAT

/obj/item/reagent_containers/food/snacks/meat/slab/molerat
	name = "molerat meat"
	desc = "A slab of smelly molerat meat."
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/toxin = 3)
	bitesize = 3
	filling_color = "#FA8072"
	cooked_type = /obj/item/reagent_containers/food/snacks/meat/steak/molerat
	slice_path = null
	foodtype = MEAT

/obj/item/reagent_containers/food/snacks/meat/slab/wolf
	name = "dog meat"
	desc = "In the wasteland, you do what you have to do to get by.<br>It doesn't taste too bad, actually."
	list_reagents = list(/datum/reagent/consumable/nutriment = 6, /datum/reagent/consumable/nutriment/vitamin = 2)
	bitesize = 4 //Average animal
	filling_color = "#FA8072"
	cooked_type = /obj/item/reagent_containers/food/snacks/meat/steak/wolf
	slice_path = null
	foodtype = MEAT

/obj/item/reagent_containers/food/snacks/meat/slab/deathclaw
	name = "deathclaw meat"
	desc = "A slab of tough but surprisingly delicious deathclaw meat."
	list_reagents = list(/datum/reagent/consumable/nutriment = 9, /datum/reagent/consumable/nutriment/vitamin = 9)
	bitesize = 6 //Big slabs of meat from a massive creature
	filling_color = "#FA8072"
	cooked_type = /obj/item/reagent_containers/food/snacks/meat/steak/deathclaw
	slice_path = null
	foodtype = MEAT

/obj/item/reagent_containers/food/snacks/meat/slab/mirelurk
	name = "mirelurk meat"
	desc = "Meat from a Mirelurk, still inside its shell. You're going to need pliers for this..."
	icon_state = "Mirelurk_meat"
	bitesize = 4 //Big animal, small part of it
	filling_color = "#406618"
	list_reagents = list(/datum/reagent/consumable/nutriment = 7, /datum/reagent/consumable/nutriment/vitamin = 3)
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/consumable/nutriment/vitamin = 1)
	cooked_type = /obj/item/reagent_containers/food/snacks/meat/steak/mirelurk
	tastes = list("crab" = 1)
	slice_path = null
	foodtype = MEAT

/obj/item/reagent_containers/food/snacks/meat/slab/squirrel
	name = "squirrel meat"
	desc = "Squirrel meat, the staple of many wasteland dishes."
	list_reagents = list(/datum/reagent/consumable/nutriment = 6, /datum/reagent/consumable/nutriment/vitamin = 2)
	bitesize = 2
	filling_color = "#FA8072"
	cooked_type = /obj/item/reagent_containers/food/snacks/meat/steak/squirrel
	slice_path = null
	foodtype = MEAT

/obj/item/reagent_containers/food/snacks/meat/slab/ant_meat
	name = "ant meat"
	desc = "A slab of ant meat."
	icon_state = "antmeat"
	list_reagents = list(/datum/reagent/consumable/nutriment = 2,  /datum/reagent/consumable/nutriment/vitamin = 1)
	tastes = list("insect guts" = 1)
	cooked_type = /obj/item/reagent_containers/food/snacks/meat/steak/ant_meat
	slice_path = null
	foodtype = MEAT

/obj/item/reagent_containers/food/snacks/meat/slab/radroach_meat
	name = "radroach meat"
	desc = "A slab of radroach meat."
	icon_state = "mothmeat"
	list_reagents = list(/datum/reagent/consumable/nutriment = 2,  /datum/reagent/consumable/nutriment/vitamin = 1)
	tastes = list("insect guts" = 1)
	cooked_type = /obj/item/reagent_containers/food/snacks/meat/steak/radroach_meat
	slice_path = null
	foodtype = MEAT

/obj/item/reagent_containers/food/snacks/meat/slab/radscorpion_meat
	name = "radscorpion meat"
	desc = "A slab of radscorpion meat."
	icon_state = "mothmeat"
	list_reagents = list(/datum/reagent/consumable/nutriment = 2,  /datum/reagent/consumable/nutriment/vitamin = 1)
	tastes = list("insect guts" = 1)
	cooked_type = /obj/item/reagent_containers/food/snacks/meat/steak/radscorpion_meat
	slice_path = null
	foodtype = MEAT

/obj/item/reagent_containers/food/snacks/meat/slab/cazador_meat
	name = "cazador meat"
	desc = "A slab of cazador meat."
	icon_state = "mothmeat"
	list_reagents = list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/consumable/nutriment/vitamin = 2, /datum/reagent/toxin/carpotoxin = 2)
	tastes = list("insect guts" = 1)
	cooked_type = /obj/item/reagent_containers/food/snacks/meat/steak/cazador_meat
	slice_path = null
	foodtype = MEAT

//WASTELAND STEAKS

/obj/item/reagent_containers/food/snacks/meat/steak/gecko
	name = "gecko steak"
	desc = "A delicious steak made of finest gecko meat.<br>Tastes like chicken!"
	foodtype = MEAT

/obj/item/reagent_containers/food/snacks/meat/steak/molerat
	name = "molerat steak"
	desc = "A smelly molerat steak.<br>What did you expect from roasted mutant rodent meat?"
	foodtype = MEAT

/obj/item/reagent_containers/food/snacks/meat/steak/wolf
	name = "dog steak"
	desc = "A dog steak does not look attractive, but some people eat worse things when it comes to survival.<br>What did you expect from roasted dog?"
	foodtype = MEAT

/obj/item/reagent_containers/food/snacks/meat/steak/deathclaw
	name = "deathclaw steak"
	desc = "A piece of hot spicy meat, eaten by only the most worthy hunters - or the most rich clients."
	list_reagents = list(/datum/reagent/consumable/nutriment = 10)
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/nutriment/vitamin = 10) //It wouldn't make sense for it to be worse than the normal
	foodtype = MEAT

/obj/item/reagent_containers/food/snacks/meat/steak/squirrel
	name = "squirrel steak"
	desc = "A steak made from a small slab of squirrel meat. It is, unsurprisingly, small."
	list_reagents = list(/datum/reagent/consumable/nutriment = 9)
	bonus_reagents = list(/datum/reagent/consumable/nutriment/vitamin = 4)
	foodtype = MEAT

/obj/item/reagent_containers/food/snacks/meat/steak/mirelurk
	name = "mirelurk roast"
	desc = "Meat from a Mirelurks shell, cracked open and roasted to perfection."
	icon_state = "Mirelurk_roast"
	list_reagents = list(/datum/reagent/consumable/nutriment = 9)
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/nutriment/vitamin = 3)
	foodtype = MEAT

/obj/item/reagent_containers/food/snacks/meat/steak/radroach_meat
	name = "radroach steak"
	desc = "A juicy radroach steak, ew."
	icon_state = "mothmeat"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/nutriment/vitamin = 3)
	tastes = list("cooked insect guts" = 1)
	foodtype = MEAT

/obj/item/reagent_containers/food/snacks/meat/steak/ant_meat
	name = "ant steak"
	desc = "A chunk of fried ant flesh."
	icon_state = "cookedantmeat"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/nutriment/vitamin = 3)
	tastes = list("cooked insect guts" = 1)
	foodtype = MEAT

/obj/item/reagent_containers/food/snacks/meat/steak/radscorpion_meat
	name = "radscorpion steak"
	desc = "A radscorpion steak. A dish for seasoned wastelanders."
	icon_state = "mothmeat"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/nutriment/vitamin = 3)
	tastes = list("cooked insect guts" = 1)
	foodtype = MEAT

/obj/item/reagent_containers/food/snacks/meat/steak/cazador_meat
	name = "cazador steak"
	desc = "A steak of cazador meat. If the poison didn't finish the job, this just might..."
	icon_state = "mothmeat"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/nutriment/vitamin = 3)
	tastes = list("spicy cooked insect guts" = 1)
	foodtype = MEAT
