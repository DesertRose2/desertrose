// In this document: Fermenting barrels, compost bin, loom, seed extractor

///////////////////////
// FERMENTING BARREL //
///////////////////////

/obj/structure/fermenting_barrel
	name = "wooden barrel"
	desc = "A large wooden barrel. You can ferment fruits and such inside it, or just use it to hold liquid."
	icon = 'icons/fallout/objects/farming/farming_structures.dmi'
	icon_state = "barrel"
	density = TRUE
	anchored = FALSE
	pressure_resistance = 2 * ONE_ATMOSPHERE
	max_integrity = 300
	var/open = FALSE
	var/speed_multiplier = 1 //How fast it distills. Defaults to 100% (1.0). Lower is better.

/obj/structure/fermenting_barrel/Initialize()
	create_reagents(300, DRAINABLE | AMOUNT_VISIBLE) //Bluespace beakers, but without the portability or efficiency in circuits.
	. = ..()

/obj/structure/fermenting_barrel/examine(mob/user)
	. = ..()
	. += SPAN_NOTICE("It is currently [open?"open, letting you pour liquids in.":"closed, letting you draw liquids from the tap."]")

/obj/structure/fermenting_barrel/proc/makeWine(obj/item/reagent_containers/food/snacks/grown/fruit)
	var/amount = fruit.seed.potency / 4
	if(fruit.distill_reagent)
		reagents.add_reagent(fruit.distill_reagent, amount)
	else
		var/data = list()
		data["names"] = list("[initial(fruit.name)]" = 1)
		data["color"] = fruit.filling_color
		data["boozepwr"] = fruit.wine_power
		if(fruit.wine_flavor)
			data["tastes"] = list(fruit.wine_flavor = 1)
		else
			data["tastes"] = list(fruit.tastes[1] = 1)
		reagents.add_reagent(/datum/reagent/consumable/ethanol/fruit_wine, amount, data)
	qdel(fruit)
	playsound(src, 'sound/effects/bubbles.ogg', 50, TRUE)

/obj/structure/fermenting_barrel/attackby(obj/item/I, mob/user, params)
	var/obj/item/reagent_containers/food/snacks/grown/fruit = I
	if(istype(fruit))
		if(!fruit.can_distill)
			to_chat(user, SPAN_WARNING("You can't distill this into anything..."))
			return TRUE
		else if(!user.transferItemToLoc(I,src))
			to_chat(user, SPAN_WARNING("[I] is stuck to your hand!"))
			return TRUE
		to_chat(user, SPAN_NOTICE("You place [I] into [src] to start the fermentation process."))
		addtimer(CALLBACK(src, .proc/makeWine, fruit), rand(80, 120) * speed_multiplier)
		return TRUE
	var/obj/item/W = I
	if(W)
		if(W.is_refillable())
			return FALSE //so we can refill them via their afterattack.
	else
		return ..()

/obj/structure/fermenting_barrel/on_attack_hand(mob/user, act_intent = user.a_intent, unarmed_attack_flags)
	open = !open
	if(open)
		DISABLE_BITFIELD(reagents.reagents_holder_flags, DRAINABLE)
		ENABLE_BITFIELD(reagents.reagents_holder_flags, REFILLABLE)
		to_chat(user, SPAN_NOTICE("You open [src], letting you fill it."))
	else
		DISABLE_BITFIELD(reagents.reagents_holder_flags, REFILLABLE)
		ENABLE_BITFIELD(reagents.reagents_holder_flags, DRAINABLE)
		to_chat(user, SPAN_NOTICE("You close [src], letting you draw from its tap."))
	update_icon()

/obj/structure/fermenting_barrel/update_icon_state()
	if(open)
		icon_state = "barrel_open"
	else
		icon_state = "barrel"


//////////
// LOOM //
//////////

#define FABRIC_PER_SHEET 4
///This is a loom. It's usually made out of wood and used to weave fabric like durathread or cotton into their respective cloth types.
/obj/structure/loom
	name = "loom"
	desc = "A simple device used to weave cloth and other thread-based fabrics together into usable material."
	icon = 'icons/fallout/objects/farming/farming_structures.dmi'
	icon_state = "loom"
	density = TRUE
	anchored = TRUE

/obj/structure/loom/attackby(obj/item/I, mob/user)
	if(weave(I, user))
		return
	return ..()

/obj/structure/loom/wrench_act(mob/living/user, obj/item/I)
	..()
	default_unfasten_wrench(user, I, 5)
	return TRUE

///Handles the weaving.
/obj/structure/loom/proc/weave(obj/item/stack/sheet/cotton/W, mob/user)
	if(!istype(W))
		return FALSE
	if(!anchored)
		user.show_message(SPAN_NOTICE("The loom needs to be wrenched down."), MSG_VISUAL)
		return FALSE
	if(W.amount < FABRIC_PER_SHEET)
		user.show_message(SPAN_NOTICE("You need at least [FABRIC_PER_SHEET] units of fabric before using this."), MSG_VISUAL)
		return FALSE
	user.show_message(SPAN_NOTICE("You start weaving \the [W.name] through the loom.."), MSG_VISUAL)
	if(W.use_tool(src, user, W.pull_effort))
		if(W.amount >= FABRIC_PER_SHEET)
			new W.loom_result(drop_location())
			W.use(FABRIC_PER_SHEET)
			user.show_message(SPAN_NOTICE("You weave \the [W.name] into a workable fabric."), MSG_VISUAL)
	return TRUE

#undef FABRIC_PER_SHEET


/////////////////
// COMPOST BIN //
/////////////////

/obj/structure/reagent_dispensers/compostbin
	name = "compost bin"
	desc = "A smelly structure made of wooden slats where refuse is thrown. Dump unwanted seeds and produce in, pull usable compost out."
	icon = 'icons/fallout/objects/farming/farming_structures.dmi'
	icon_state = "compostbin"
	anchored = TRUE
	reagent_id = /datum/reagent/compost
	var/seed_value = 4
	var/produce_value = 10

/obj/structure/reagent_dispensers/compostbin/Initialize()
	. = ..()
	reagents.clear_reagents()
	reagents.add_reagent(reagent_id, 100)

/obj/structure/reagent_dispensers/compostbin/attackby(obj/item/W, mob/user, params)
	if(W.is_refillable())
		return 0 //so we can refill them via their afterattack.
	if(reagents.total_volume == tank_volume)
		to_chat(user,SPAN_WARNING("The [src] is filled to capacity!"))
		return
	if(istype(W, /obj/item/seeds) || istype(W, /obj/item/reagent_containers/food/snacks/grown) || istype(W, /obj/item/reagent_containers/food/snacks/meat) || istype(W, /obj/item/reagent_containers/food/snacks/f13/egg) || istype(W, /obj/item/reagent_containers/food/snacks/badrecipe))
		if(user.transferItemToLoc(W, src))
			to_chat(user, SPAN_NOTICE("You load the [W] into the [src]."))
			playsound(loc, 'sound/effects/blobattack.ogg', 25, 1, -1)
			process_compost()
		else
			to_chat(user, SPAN_WARNING("That's not compostable! Try seeds or flowers instead."))
	else if(istype(W, /obj/item/storage/bag/plants))
		var/obj/item/storage/bag/plants/PB = W
		for(var/obj/item/G in PB.contents)// This check can be less than thorough because the bag has already authenticated the contents, hopefully
			if(SEND_SIGNAL(PB, COMSIG_TRY_STORAGE_TAKE, G, src))
				to_chat(user, "<span class='info'>You empty the [PB] into the [src].</span>")
				playsound(loc, 'sound/effects/blobattack.ogg', 25, 1, -1)
				process_compost()

/obj/structure/reagent_dispensers/compostbin/proc/process_compost()
	for(var/obj/item/C in contents)
		if(istype(C, /obj/item/seeds) || istype(C, /obj/item/reagent_containers/food/snacks/f13/egg) || istype(C, /obj/item/reagent_containers/food/snacks/badrecipe))
			reagents.add_reagent(/datum/reagent/compost, seed_value)
			qdel(C)
		else if(istype(C, /obj/item/reagent_containers/food/snacks/grown) || istype(C, /obj/item/reagent_containers/food/snacks/meat))
			reagents.add_reagent(/datum/reagent/compost, produce_value)
			qdel(C)
		else //Not sure how we got here, but there's only one reasonable thing to do.
			qdel(C)


////////////////////
// SEED EXTRACTOR //
////////////////////

/obj/structure/legion_extractor
	name = "seed grinder"
	desc = "A crude grinding machine repurposed from kitchen appliances. Plants go in, seeds come out."
	icon = 'icons/fallout/objects/farming/farming_structures.dmi'
	icon_state = "sextractor_manual"
	density = TRUE
	anchored = TRUE

/obj/structure/legion_extractor/proc/seedify(obj/item/O, t_max, obj/structure/legion_extractor/extractor, mob/living/user)
	var/t_amount = 0
	var/list/seeds = list()
	if(t_max == -1)
		t_max = rand(1,2) //Slightly worse than the actual thing

	var/seedloc = O.loc
	if(extractor)
		seedloc = extractor.loc

	if(istype(O, /obj/item/reagent_containers/food/snacks/grown/))
		var/obj/item/reagent_containers/food/snacks/grown/F = O
		if(F.seed)
			if(user && !user.temporarilyRemoveItemFromInventory(O)) //couldn't drop the item
				return
			while(t_amount < t_max)
				var/obj/item/seeds/t_prod = F.seed.Copy()
				seeds.Add(t_prod)
				t_prod.forceMove(seedloc)
				t_amount++
			qdel(O)
			return seeds

	else if(istype(O, /obj/item/grown))
		var/obj/item/grown/F = O
		if(F.seed)
			if(user && !user.temporarilyRemoveItemFromInventory(O))
				return
			while(t_amount < t_max)
				var/obj/item/seeds/t_prod = F.seed.Copy()
				t_prod.forceMove(seedloc)
				t_amount++
			qdel(O)
		return 1

	return 0

/obj/structure/legion_extractor/attackby(obj/item/O, mob/user, params)

	if(default_unfasten_wrench(user, O)) //So we can move them around
		return

	else if(seedify(O,-1, src, user))
		to_chat(user, SPAN_NOTICE("You extract some seeds."))
		return
	else if(user.a_intent != INTENT_HARM)
		to_chat(user, SPAN_WARNING("You can't extract any seeds from \the [O.name]!"))
	else
		return ..()