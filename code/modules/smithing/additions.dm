// ------------ EFFECTS ------------------

/obj/effect/particle_effect/smithing_sparks
	name = "sparks"
	icon_state = "sparks"

/obj/effect/particle_effect/smithing_sparks/Initialize()
	. = ..()
	flick(icon_state, src) // replay the animation
	anchored = TRUE
	light_power = 1.3
	light_range = MINIMUM_USEFUL_LIGHT_RANGE
	light_color = LIGHT_COLOR_FIRE
	QDEL_IN(src, 20)

/datum/effect_system/smithing_spark_spread
	effect_type = /obj/effect/particle_effect/smithing_sparks

/proc/do_smithing_sparks(n, c, source)
	var/datum/effect_system/smithing_spark_spread/sparks = new
	sparks.set_up(n, c, source)
	sparks.autocleanup = TRUE
	sparks.start()


// ------------- ASSOCIATED CRAFTING -------------------------

// CUTTING LEATHER INTO STRIPS (for further crafting) TO DO - put in hand instead of drop on floor
/obj/item/stack/sheet/leather/attackby(obj/item/W, mob/user, params)
	if(W.get_sharpness())
		playsound(loc, 'sound/weapons/slice.ogg', 50, 1, -1)
		user.visible_message("[user] starts shredding the [src] into strips.", "<span class='notice'>You start shredding the [src] into strips</span>", "<span class='italics'>You hear the sound of leather being ripped.</span>")
		if(do_after(user, 50, target = src))
			to_chat(user, "<span class='notice'>You cut strips from this [src.singular_name].</span>")
//			new /obj/item/stack/sheet/leatherstrips(user.drop_location(), 1)
			new /obj/item/stack/sheet/leatherstrips(user.get_inactive_held_item(), 1)
			use(1)
	else
		return ..()

/obj/item/stack/sheet/leatherstrips
	name = "leather strips"
	desc = "long leather strips that can be used for crafting various things."
	singular_name = "strip of leather"
	icon = 'code/modules/smithing/icons/blacksmith.dmi'
	icon_state = "leatherstrips"
	merge_type = /obj/item/stack/sheet/leatherstrips

GLOBAL_LIST_INIT(leatherstrips_recipes, list ( \
	new/datum/stack_recipe("slave labor outfit", /obj/item/clothing/suit/armor/f13/slavelabor, 2, time = 50),  \
	new/datum/stack_recipe("jabroni outfit", /obj/item/clothing/under/jabroni, 4, time = 80), \
	new/datum/stack_recipe("muzzle", /obj/item/clothing/mask/muzzle, 2, time = 40),  \
	new/datum/stack_recipe("pet collar", /obj/item/clothing/neck/petcollar, 2, time = 40), \
	new/datum/stack_recipe("whip", /obj/item/melee/curator_whip, 10, time = 180), \
))

/obj/item/stack/sheet/leatherstrips/get_main_recipes()
	. = ..()
	. += GLOB.leatherstrips_recipes

// Makes slag more suitable visually for the interactions with the anvil
/obj/item/stack/ore/slag
	icon = 'code/modules/smithing/icons/blacksmith.dmi'
