/obj/item/cultivator/wood
	name = "rake"
	desc = "A two-handed wooden rake, for removing weeds or scratching your back. It has a leather grip."
	icon_state = "rake"
	flags_1 = NONE // not conductive
	force = 3 // it's made of wood
	throwforce = 5
	custom_materials = list(/datum/material/wood = 3 * MINERAL_MATERIAL_AMOUNT) // three sheets of wood

/obj/item/hatchet/woodaxe
	name = "felling axe"
	desc = "A forged axe blade mounted on a short wooden handle made from a shaved branch. Good for chopping things, like trees."
	icon_state = "woodaxe"
	custom_materials = list(/datum/material/iron = 8 * MINERAL_MATERIAL_AMOUNT, /datum/material/wood = 1 * MINERAL_MATERIAL_AMOUNT) // 8 sheets of iron and 1 sheet of wood
	force = 15
	flags_1 = NONE // also not conductive
	throwforce = 18

/obj/item/hatchet/suicide_act(mob/user)
	user.visible_message("<span class='suicide'>[user] is chopping at [user.p_them()]self with [src]! It looks like [user.p_theyre()] trying to commit suicide!</span>")
	playsound(src, 'sound/weapons/bladeslice.ogg', 50, 1, -1)
	return (BRUTELOSS)
