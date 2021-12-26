/obj/item/storage/trash_stack
	name = "pile of garbage"
	desc = "a pile of garbage. Smells as good, as it looks, though it may contain something useful. Or may not"
	icon = 'icons/fallout/objects/crafting.dmi'
	icon_state = "trash_1"
	anchored = TRUE
	density = FALSE
	var/list/loot_players = list()
	var/list/lootable_trash = list()
	var/list/garbage_list = list()

/obj/item/storage/trash_stack/proc/initialize_lootable_trash()
	garbage_list = list(GLOB.trash_ammo, GLOB.trash_chem, GLOB.trash_clothing, GLOB.trash_craft,
						GLOB.trash_food, GLOB.trash_gun, GLOB.trash_misc, GLOB.trash_money,
						GLOB.trash_part, GLOB.trash_tool)
	lootable_trash = list() //we are setting them to an empty list so you can't double the amount of stuff
	for(var/i in garbage_list)
		for(var/ii in i)
			lootable_trash += ii

/obj/item/storage/trash_stack/Initialize()
	. = ..()
	icon_state = "trash_[rand(1,3)]"
	GLOB.trash_piles += src
	initialize_lootable_trash()

/obj/item/storage/trash_stack/Destroy()
	GLOB.trash_piles -= src
	. = ..()

/obj/item/storage/trash_stack/attack_hand(mob/user)
	var/turf/ST = get_turf(src)
	if(user?.a_intent != INTENT_HARM)
		if(user in loot_players)
			to_chat(user, "<span class='notice'>You already have looted [src].</span>")
			return
		for(var/i=0, i<rand(1,4), i++)
			var/itemtype= pickweight(lootable_trash)
			if(itemtype)
				to_chat(user, "<span class='notice'>You scavenge through [src].</span>")
				var/obj/item/item = new itemtype(ST)
				if(istype(item))
					item.from_trash = TRUE
		loot_players += user
	else
		return ..()
