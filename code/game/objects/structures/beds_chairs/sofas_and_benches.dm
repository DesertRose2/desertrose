// In this document: Booth, Sofas, Benches

///////////
// BOOTH //
///////////

/obj/structure/chair/booth
	name = "single booth"
	desc = "A lone-some diner-styled booth."
	icon = 'icons/fallout/objects/furniture/sofas_and_benches.dmi'
	icon_state = "booth_single"
	resistance_flags = FLAMMABLE
	max_integrity = 70
	item_chair = null
	var/mutable_appearance/overlay

/obj/structure/chair/booth/proc/update_overlay()
		add_overlay(overlay)

/obj/structure/chair/booth/Initialize()
	overlay = GetOverlay()
	overlay.layer = ABOVE_ALL_MOB_LAYER
	return ..()

/obj/structure/chair/booth/Destroy()
	QDEL_NULL(overlay)
	return ..()

/obj/structure/chair/booth/proc/GetOverlay()
	return mutable_appearance('icons/fallout/objects/furniture/sofas_and_benches.dmi', "booth_single_overlay")
//-----
/obj/structure/chair/booth_left
	name = "booth"
	desc = "A diner-styled end booth."
	icon = 'icons/fallout/objects/furniture/sofas_and_benches.dmi'
	icon_state = "booth_leftend"
	resistance_flags = FLAMMABLE
	max_integrity = 70
	item_chair = null
	var/mutable_appearance/overlay

/obj/structure/chair/booth_left/proc/update_overlay()
		add_overlay(overlay)

/obj/structure/chair/booth_left/Initialize()
	overlay = GetOverlay()
	overlay.layer = ABOVE_ALL_MOB_LAYER
	return ..()

/obj/structure/chair/booth_left/Destroy()
	QDEL_NULL(overlay)
	return ..()

/obj/structure/chair/booth_left/proc/GetOverlay()
	return mutable_appearance('icons/fallout/objects/furniture/sofas_and_benches.dmi', "booth_leftend_overlay")
//-------
/obj/structure/chair/booth_middle
	name = "booth"
	desc = "A diner-styled middle booth."
	icon = 'icons/fallout/objects/furniture/sofas_and_benches.dmi'
	icon_state = "booth_middle"
	resistance_flags = FLAMMABLE
	max_integrity = 70
	item_chair = null
	var/mutable_appearance/overlay

/obj/structure/chair/booth_middle/proc/update_overlay()
		add_overlay(overlay)

/obj/structure/chair/booth_middle/Initialize()
	overlay = GetOverlay()
	overlay.layer = ABOVE_ALL_MOB_LAYER
	return ..()

/obj/structure/chair/booth_middle/Destroy()
	QDEL_NULL(overlay)
	return ..()

/obj/structure/chair/booth_middle/proc/GetOverlay()
	return mutable_appearance('icons/fallout/objects/furniture/sofas_and_benches.dmi', "booth_middle_overlay")
//---
/obj/structure/chair/booth_right
	name = "booth"
	desc = "A diner-styled end booth."
	icon = 'icons/fallout/objects/furniture/sofas_and_benches.dmi'
	icon_state = "booth_rightend"
	resistance_flags = FLAMMABLE
	max_integrity = 70
	item_chair = null
	var/mutable_appearance/overlay

/obj/structure/chair/booth_right/proc/update_overlay()
		add_overlay(overlay)

/obj/structure/chair/booth_right/Initialize()
	overlay = GetOverlay()
	overlay.layer = ABOVE_ALL_MOB_LAYER
	return ..()

/obj/structure/chair/booth_right/Destroy()
	QDEL_NULL(overlay)
	return ..()

/obj/structure/chair/booth_right/proc/GetOverlay()
	return mutable_appearance('icons/fallout/objects/furniture/sofas_and_benches.dmi', "booth_rightend_overlay")


///////////
// SOFAS //
///////////

// ----------
// OLD SOFA 
// ----------

/obj/structure/chair/sofa
	name = "old ratty sofa"
	icon = 'icons/fallout/objects/furniture/sofas_and_benches.dmi'
	icon_state = "sofamiddle"
	buildstackamount = 1
	item_chair = null
	var/mutable_appearance/armrest

/obj/structure/chair/sofa/Initialize()
	armrest = mutable_appearance(icon, "[icon_state]_overlay", ABOVE_MOB_LAYER)
	return ..()

/obj/structure/chair/sofa/post_buckle_mob(mob/living/M)
	. = ..()
	update_armrest()

/obj/structure/chair/sofa/proc/update_armrest()
	if(has_buckled_mobs())
		add_overlay(armrest)
	else
		cut_overlay(armrest)

/obj/structure/chair/sofa/post_unbuckle_mob()
	. = ..()
	update_armrest()

/obj/structure/chair/sofa/left
	icon_state = "sofaend_left"

/obj/structure/chair/sofa/right
	icon_state = "sofaend_right"

/obj/structure/chair/sofa/corner
	icon_state = "sofa_corner"

/obj/structure/chair/sofa/corner/handle_layer() //only the armrest/back of this chair should cover the mob.
	return


// Credit for the sprites goes to CEV Eris. The sprites were taken from Hyper Station and modified to fit with armrests which were also added.
// ----------
// FANCY SOFA 
// ----------

/obj/structure/chair/sofa/fancy
	name = "fancy sofa"
	desc = "Soft, cushy and cozy. These sofas are a rare luxury in the wasteland."
	icon_state = "fancy_sofamiddle"

/obj/structure/chair/sofa/left/fancy
	icon_state = "fancy_sofaend_left"

/obj/structure/chair/sofa/right/fancy
	icon_state = "fancy_sofaend_right"

/obj/structure/chair/sofa/corner/fancy
	icon_state = "fancy_sofacorner"


// OBSOLETE stuff, incorrect pathing for the sides to inherit the overlays bla bla, replace with 
/obj/structure/chair/sofa/corp
	name = "fancy sofa"
	desc = "Soft, cushy and cozy. These sofas are a rare luxury in the wasteland."
	icon_state = "fancy_sofamiddle"

/obj/structure/chair/sofa/corp/left
	icon_state = "fancy_sofaend_left"

/obj/structure/chair/sofa/corp/right
	icon_state = "fancy_sofaend_right"

/obj/structure/chair/sofa/corp/corner
	icon_state = "fancy_sofa_corner"


// ------
// PEW 
// ------

/obj/structure/chair/pew
	name = "wooden pew"
	desc = "Kneel here and pray."
	icon = 'icons/fallout/objects/furniture/sofas_and_benches.dmi'
	icon_state = "pewmiddle"
	resistance_flags = FLAMMABLE
	max_integrity = 70
	buildstacktype = /obj/item/stack/sheet/mineral/wood
	buildstackamount = 3
	item_chair = null
//---
/obj/structure/chair/pew/left
	name = "wooden pew end"
	icon_state = "pewend_left"
	var/mutable_appearance/leftpewarmrest

/obj/structure/chair/pew/left/Initialize()
	leftpewarmrest = GetLeftPewArmrest()
	leftpewarmrest.layer = ABOVE_MOB_LAYER
	return ..()

/obj/structure/chair/pew/left/proc/GetLeftPewArmrest()
	return mutable_appearance(	icon = 'icons/fallout/objects/furniture/sofas_and_benches.dmi', "pewend_left_overlay")

/obj/structure/chair/pew/left/Destroy()
	QDEL_NULL(leftpewarmrest)
	return ..()

/obj/structure/chair/pew/left/post_buckle_mob(mob/living/M)
	. = ..()
	update_leftpewarmrest()

/obj/structure/chair/pew/left/proc/update_leftpewarmrest()
	if(has_buckled_mobs())
		add_overlay(leftpewarmrest)
	else
		cut_overlay(leftpewarmrest)

/obj/structure/chair/pew/left/post_unbuckle_mob()
	. = ..()
	update_leftpewarmrest()
//---
/obj/structure/chair/pew/right
	name = "wooden pew end"
	icon_state = "pewend_right"
	var/mutable_appearance/rightpewarmrest

/obj/structure/chair/pew/right/Initialize()
	rightpewarmrest = GetRightPewArmrest()
	rightpewarmrest.layer = ABOVE_MOB_LAYER
	return ..()

/obj/structure/chair/pew/right/proc/GetRightPewArmrest()
	return mutable_appearance('icons/fallout/objects/furniture/sofas_and_benches.dmi', "pewend_right_overlay")

/obj/structure/chair/pew/right/Destroy()
	QDEL_NULL(rightpewarmrest)
	return ..()

/obj/structure/chair/pew/right/post_buckle_mob(mob/living/M)
	. = ..()
	update_rightpewarmrest()

/obj/structure/chair/pew/right/proc/update_rightpewarmrest()
	if(has_buckled_mobs())
		add_overlay(rightpewarmrest)
	else
		cut_overlay(rightpewarmrest)

/obj/structure/chair/pew/right/post_unbuckle_mob()
	. = ..()
	update_rightpewarmrest()


// ---------
// BENCH 
// ---------

/obj/structure/bench
	name = "bench"
	desc = "Plain wooden bench"
	icon = 'icons/fallout/objects/furniture/sofas_and_benches.dmi'
	icon_state = "bench"
	anchored = TRUE
	can_buckle = TRUE
	buckle_lying = FALSE
	resistance_flags = NONE
	max_integrity = 150
	integrity_failure = 0.1
	layer = OBJ_LAYER
	var/mutable_appearance/benchoverlay

/obj/structure/bench/Initialize()
	benchoverlay = Getbenchoverlay()
	benchoverlay.layer = ABOVE_MOB_LAYER
	return ..()

/obj/structure/bench/proc/Getbenchoverlay()
	return mutable_appearance('icons/fallout/objects/furniture/sofas_and_benches.dmi', "bench_overlay")

/obj/structure/bench/Destroy()
	QDEL_NULL(benchoverlay)
	return ..()

/obj/structure/bench/post_buckle_mob(mob/living/M)
	. = ..()
	update_benchoverlay()

/obj/structure/bench/proc/update_benchoverlay()
	if(has_buckled_mobs())
		add_overlay(benchoverlay)
	else
		cut_overlay(benchoverlay)

/obj/structure/bench/post_unbuckle_mob()
	. = ..()
	update_benchoverlay()


// -------------
// PADDED BENCH 
// -------------

/obj/structure/bench/padded
	name = "padded bench"
	desc = "metal frame and leather seat."
	icon_state = "bench_padded"
	var/mutable_appearance/benchpadoverlay

/obj/structure/bench/padded/Initialize()
	benchpadoverlay = Getbenchpadoverlay()
	benchpadoverlay.layer = ABOVE_MOB_LAYER
	return ..()

/obj/structure/bench/padded/proc/Getbenchpadoverlay()
	return mutable_appearance('icons/fallout/objects/furniture/sofas_and_benches.dmi', "bench_padded_overlay")

/obj/structure/bench/padded/Destroy()
	QDEL_NULL(benchpadoverlay)
	return ..()

/obj/structure/bench/padded/post_buckle_mob(mob/living/M)
	. = ..()
	update_benchpadoverlay()

/obj/structure/bench/padded/proc/update_benchpadoverlay()
	if(has_buckled_mobs())
		add_overlay(benchpadoverlay)
	else
		cut_overlay(benchpadoverlay)

/obj/structure/bench/padded/post_unbuckle_mob()
	. = ..()
	update_benchpadoverlay()
//---(use overlay to make nice edges to the padded bench)
/obj/effect/overlay/bench_padded
	name = "padded bench"
	desc = "metal frame and leather seat."
	icon = 'icons/fallout/objects/furniture/sofas_and_benches.dmi'
	icon_state = "bench_padded_edge_overlay"


// OBSOLETE
/obj/structure/chair/bench
	name = "bench"
	desc = "A classic wooden bench. It has some dried wax on it..."
	icon = 'icons/fallout/objects/furniture/sofas_and_benches.dmi'
	icon_state = "church"
	item_chair = null
	buildstacktype = /obj/item/stack/sheet/mineral/wood

//OBSOLETE replace with booth_left
/obj/structure/chair/left
	name = "booth"
	desc = "A diner-styled end booth."
	icon = 'icons/fallout/objects/furniture/sofas_and_benches.dmi'
	icon_state = "booth_leftend"
	item_chair = null
	var/mutable_appearance/overlay

/obj/structure/chair/left/proc/update_overlay()
		add_overlay(overlay)

/obj/structure/chair/left/Initialize()
	overlay = GetOverlay()
	overlay.layer = ABOVE_ALL_MOB_LAYER
	return ..()

/obj/structure/chair/left/Destroy()
	QDEL_NULL(overlay)
	return ..()

/obj/structure/chair/left/proc/GetOverlay()
	return mutable_appearance('icons/fallout/objects/furniture/sofas_and_benches.dmi', "booth_leftend_overlay")

//OBSOLETE replace with booth_middle
/obj/structure/chair/middle
	name = "booth"
	desc = "A diner-styled middle booth."
	icon = 'icons/fallout/objects/furniture/sofas_and_benches.dmi'
	icon_state = "booth_middle"
	resistance_flags = FLAMMABLE
	max_integrity = 70
	item_chair = null
	var/mutable_appearance/overlay

/obj/structure/chair/middle/proc/update_overlay()
		add_overlay(overlay)

/obj/structure/chair/middle/Initialize()
	overlay = GetOverlay()
	overlay.layer = ABOVE_ALL_MOB_LAYER
	return ..()

/obj/structure/chair/middle/Destroy()
	QDEL_NULL(overlay)
	return ..()

/obj/structure/chair/middle/proc/GetOverlay()
	return mutable_appearance('icons/fallout/objects/furniture/sofas_and_benches.dmi', "booth_middle_overlay")


//OBSOLETEeplace with booth_right
/obj/structure/chair/right
	name = "booth"
	desc = "A diner-styled end booth."
	icon = 'icons/fallout/objects/furniture/sofas_and_benches.dmi'
	icon_state = "booth_rightend"
	resistance_flags = FLAMMABLE
	max_integrity = 70
	item_chair = null
	var/mutable_appearance/overlay

/obj/structure/chair/right/proc/update_overlay()
		add_overlay(overlay)

/obj/structure/chair/right/Initialize()
	overlay = GetOverlay()
	overlay.layer = ABOVE_ALL_MOB_LAYER
	return ..()

/obj/structure/chair/right/Destroy()
	QDEL_NULL(overlay)
	return ..()

/obj/structure/chair/right/proc/GetOverlay()
	return mutable_appearance('icons/fallout/objects/furniture/sofas_and_benches.dmi', "booth_rightend_overlay")
