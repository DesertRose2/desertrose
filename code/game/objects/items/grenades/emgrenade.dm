/obj/item/grenade/empgrenade
	name = "pulse grenade"
	desc = "An experimental grenade designed to wreak havoc on electronic systems."
	icon_state = "pulse"
	item_state = "emp"

/obj/item/grenade/empgrenade/prime(mob/living/lanced_by)
	. = ..()
	update_mob()
	empulse_using_range(src, 5)
	qdel(src)
