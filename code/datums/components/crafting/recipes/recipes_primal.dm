/datum/crafting_recipe/tribal_torch
	name = "Tribal Torch"
	result = /obj/item/candle/tribal_torch
	time = 30
	reqs = list(/obj/item/stack/sheet/mineral/wood = 4)
	category = CAT_PRIMAL

/datum/crafting_recipe/handheld_torch
	name = "Handheld Torch"
	result = /obj/item/flashlight/flare/torch
	time = 30
	reqs = list(/obj/item/stack/sheet/mineral/wood = 3,
				/obj/item/stack/sheet/cloth = 1)
	category = CAT_PRIMAL

/datum/crafting_recipe/bonfire
	name = "Bonfire"
	time = 60
	reqs = list(/obj/item/grown/log = 5)
	result = /obj/structure/bonfire
	category = CAT_PRIMAL

/datum/crafting_recipe/headpikelegion
	name = "Spike Head (Throwing Spear)"
	time = 65
	reqs = list(/obj/item/throwing_star/spear = 1,
				/obj/item/bodypart/head = 1)
	parts = list(/obj/item/bodypart/head = 1,
			/obj/item/throwing_star/spear = 1)
	result = /obj/structure/headpike
	category = CAT_PRIMAL

/datum/crafting_recipe/headpike
	name = "Spike Head (Glass Spear)"
	time = 65
	reqs = list(/obj/item/twohanded/spear = 1,
				/obj/item/bodypart/head = 1)
	parts = list(/obj/item/bodypart/head = 1,
			/obj/item/twohanded/spear = 1)
	result = /obj/structure/headpike
	category = CAT_PRIMAL

/datum/crafting_recipe/headpikebone
	name = "Spike Head (Bone Spear)"
	time = 65
	reqs = list(/obj/item/twohanded/spear/bonespear = 1,
				/obj/item/bodypart/head = 1)
	parts = list(/obj/item/bodypart/head = 1,
			/obj/item/twohanded/spear/bonespear = 1)
	result = /obj/structure/headpike/bone
	category = CAT_PRIMAL

/datum/crafting_recipe/bow_tablet
	name = "Sandstone Bow Making Manual"
	result = /obj/item/book/granter/crafting_recipe/bone_bow
	time = 200 //Scribing // don't care
	always_availible = FALSE
	reqs = list(/obj/item/stack/rods = 1,
				/obj/item/stack/sheet/mineral/sandstone = 4)
	category = CAT_PRIMAL

/datum/crafting_recipe/rib
	name = "Collosal Rib"
	always_availible = FALSE
	reqs = list(
			/obj/item/stack/sheet/bone = 10,
			/datum/reagent/oil = 5)
	result = /obj/structure/statue/bone/rib
	subcategory = CAT_PRIMAL

/datum/crafting_recipe/skull
	name = "Skull Carving"
	always_availible = FALSE
	reqs = list(
			/obj/item/stack/sheet/bone = 6,
			/datum/reagent/oil = 5)
	result = /obj/structure/statue/bone/skull
	category = CAT_PRIMAL

/datum/crafting_recipe/halfskull
	name = "Cracked Skull Carving"
	always_availible = FALSE
	reqs = list(
			/obj/item/stack/sheet/bone = 3,
			/datum/reagent/oil = 5)
	result = /obj/structure/statue/bone/skull/half
	category = CAT_PRIMAL

/datum/crafting_recipe/boneshovel
	name = "Serrated Bone Shovel"
	always_availible = FALSE
	reqs = list(
			/obj/item/stack/sheet/bone = 4,
			/datum/reagent/oil = 5,
			/obj/item/shovel/spade = 1)
	result = /obj/item/shovel/serrated
	category = CAT_PRIMAL
