/obj/item/shishkebabpack
	name = "shishkebab backpack"
	desc = "A backpack containing a large quantity of fuel and a pipe attaching it to a long, deadly blade. You ever wanted to set fire to people with a sword?"
	icon = 'icons/fallout/objects/melee/weapons.dmi'
	icon_state = "shishkebabpack"
	item_state = "shishkebabpack"
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	actions_types = list(/datum/action/item_action/toggle_shishkebab)
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 30)
	resistance_flags = FIRE_PROOF

	var/obj/item/sword

/obj/item/shishkebabpack/Initialize()
	. = ..()
	sword = make_sword()

/obj/item/shishkebabpack/ui_action_click(mob/user)
	toggle_shishkebab(user)

/obj/item/shishkebabpack/item_action_slot_check(slot, mob/user)
	if(slot == user.getBackSlot())
		return 1

/obj/item/shishkebabpack/proc/toggle_shishkebab(mob/living/user)
	if(!istype(user))
		return
	if(user.get_item_by_slot(user.getBackSlot()) != src)
		to_chat(user, "<span class='warning'>The backpack must be worn properly to use!</span>")
		return
	if(user.incapacitated())
		return

	if(QDELETED(sword))
		sword = make_sword()
	if(sword in src)
		//Detach the sword into the user's hands
		if(!user.put_in_hands(sword))
			to_chat(user, "<span class='warning'>You need a free hand to hold the shishkebab!</span>")
			return
	else
		//Remove from their hands and put back "into" the tank
		remove_sword()

/obj/item/shishkebabpack/verb/toggle_shishkebab_verb()
	set name = "Toggle Shishkebab"
	set category = "Object"
	toggle_shishkebab(usr)

/obj/item/shishkebabpack/proc/make_sword()
	return new /obj/item/weapon/melee/shishkebab(src)

/obj/item/shishkebabpack/equipped(mob/user, slot)
	..()
	if(slot != SLOT_BACK)
		remove_sword()

/obj/item/shishkebabpack/proc/remove_sword()
	if(ismob(sword.loc))
		var/mob/M = sword.loc
		M.temporarilyRemoveItemFromInventory(sword, TRUE)
	sword.forceMove(src)

/obj/item/shishkebabpack/Destroy()
	QDEL_NULL(sword)
	return ..()

/obj/item/shishkebabpack/attack_hand(mob/user)
	if (user.get_item_by_slot(user.getBackSlot()) == src)
		toggle_shishkebab(user)
	else
		return ..()

/obj/item/shishkebabpack/MouseDrop(obj/over_object)
	var/mob/M = loc
	if(istype(M) && istype(over_object, /obj/screen/inventory/hand))
		var/obj/screen/inventory/hand/H = over_object
		M.putItemFromInventoryInHandIfPossible(src, H.held_index)
	return ..()

/obj/item/shishkebabpack/attackby(obj/item/W, mob/user, params)
	if(W == sword)
		remove_sword()
		return 1
	else
		return ..()

/obj/item/shishkebabpack/dropped(mob/user)
	..()
	remove_sword()

/obj/item/weapon/melee/shishkebab //This should never exist without the backpack.
	name = "shishkebab"
	desc = "A deadly flaming sword covered in fuel. You're not sure this is entirely safe."
	icon = 'icons/fallout/objects/melee/weapons.dmi'
	icon_state = "shishkebab"
	item_state = "shishkebab"
	lefthand_file = 'icons/mob/inhands/weapons/swords_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/swords_righthand.dmi'
	w_class = WEIGHT_CLASS_BULKY
	item_flags = ABSTRACT  // don't put in storage
	slot_flags = 0
	force = 55
	damtype = "fire"
	tool_behaviour = TOOL_WELDER
	toolspeed = 0.3

	var/obj/item/shishkebabpack/tank

/obj/item/weapon/melee/shishkebab/Initialize()
	. = ..()
	tank = loc
	if(!istype(tank))
		return INITIALIZE_HINT_QDEL

/obj/item/weapon/melee/shishkebab/attack_self()
	return

/obj/item/weapon/melee/shishkebab/doMove(atom/destination)
	if(destination && (destination != tank.loc || !ismob(destination)))
		if (loc != tank)
			to_chat(tank.loc, "<span class='notice'>The shishkebab slides back into the backpack tank.</span>")
		destination = tank
	..()