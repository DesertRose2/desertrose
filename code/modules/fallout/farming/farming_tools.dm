// In this document: Spade, Cultivator, Rake, Hatchet, Wicker basket, Newbie farmer guide

///////////
// SPADE //
/////////// - slower shovel, but can remove plants without removing the soil too

/obj/item/shovel/spade
	name = "spade"
	desc = "A small tool for digging and removing plant roots."
	icon = 'icons/fallout/objects/farming/farming_tools.dmi'
	icon_state = "spade"
	item_state = "spade"
	lefthand_file = 'icons/fallout/onmob/items/farming_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/items/farming_righthand.dmi'
	toolspeed = 0.5
	force = 5
	throwforce = 7
	custom_materials = list(/datum/material/iron=50)
	w_class = WEIGHT_CLASS_SMALL


////////////////
// CULTIVATOR //
////////////////

/obj/item/cultivator
	name = "cultivator"
	desc = "It's used for removing weeds, stepping on it might hurt."
	icon = 'icons/fallout/objects/farming/farming_tools.dmi'
	icon_state = "cultivator"
	item_state = "cultivator"
	lefthand_file = 'icons/fallout/onmob/items/farming_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/items/farming_righthand.dmi'
	resistance_flags = FLAMMABLE
	flags_1 = CONDUCT_1
	force = 5
	throwforce = 7
	w_class = WEIGHT_CLASS_SMALL
	custom_materials = list(/datum/material/iron=50)
	attack_verb = list("slashed", "sliced", "cut", "clawed")
	hitsound = 'sound/weapons/bladeslice.ogg'

/obj/item/cultivator/suicide_act(mob/user)
	user.visible_message("<span class='suicide'>[user] is scratching [user.p_their()] back as hard as [user.p_they()] can with \the [src]! It looks like [user.p_theyre()] trying to commit suicide!</span>")
	return (BRUTELOSS)


// ------
// RAKE
// ------

/obj/item/cultivator/rake 
	name = "rake"
	icon_state = "rake"
	item_state = "rake"
	lefthand_file = 'icons/fallout/onmob/items/farming_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/items/farming_righthand.dmi'
	flags_1 = null
	force = 8
	w_class = WEIGHT_CLASS_BULKY
	custom_materials = null


/////////////
// HATCHET //
/////////////

/obj/item/hatchet
	name = "hatchet"
	desc = "A very sharp axe blade upon a short fibremetal handle. It has a long history of chopping things, but now it is used for chopping wood."
	icon = 'icons/fallout/objects/farming/farming_tools.dmi'
	icon_state = "hatchet"
	item_state = "hatchet"
	lefthand_file = 'icons/fallout/onmob/items/farming_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/items/farming_righthand.dmi'
	flags_1 = CONDUCT_1
	force = 18
	w_class = WEIGHT_CLASS_SMALL
	throwforce = 15
	throw_speed = 3
	throw_range = 4
	custom_materials = list(/datum/material/iron = 15000)
	attack_verb = list("chopped", "torn", "cut")
	hitsound = 'sound/weapons/bladeslice.ogg'
	sharpness = SHARP_EDGED

/obj/item/hatchet/Initialize()
	. = ..()
	AddComponent(/datum/component/butchering, 70, 100)

/obj/item/hatchet/suicide_act(mob/user)
	user.visible_message("<span class='suicide'>[user] is chopping at [user.p_them()]self with [src]! It looks like [user.p_theyre()] trying to commit suicide!</span>")
	playsound(src, 'sound/weapons/bladeslice.ogg', 50, 1, -1)
	return (BRUTELOSS)


///////////////////
// WICKER BASKET //
///////////////////

//Wicker Basket (Crate)
/obj/structure/closet/crate/wicker
	name = "basket"
	desc = "A handmade wicker basket."
	icon = 'icons/fallout/objects/farming/farming_tools.dmi'
	icon_state = "basket"
	resistance_flags = FLAMMABLE


////////////////////////////////
// ADVICE FOR FARMING ROOKIES //
////////////////////////////////

// Add stuff to this if you change or discover vital farming stuff (No bloat, just simple, short stuff). If you change how farming works and not update this I will have to kill you.
/obj/item/paper/advice_farming
	name = "Advice on farming from Uncle Bo"
	desc = "A thin book, handwritten after the Great War and copied in various forms many times."
	icon = 'icons/fallout/objects/farming/farming_tools.dmi'
	icon_state = "advice_farming"
	throw_range = 6
	info = {"Some tricks every farmer should know.
	<br>
	<b>Dummy basics</b>
	<br>
	This is obvious stuff. You need something like a rake to whack the weeds with, a bucket or such for water and fertiziler, and to save you pain, a plant bag.
	<br>
	<b>Dressing for the part</b>
	<br>
	A denim overall usually comes with straps so you can carry your tools on it easily. Same goes for the leather straps the legion farmers use. Useful for rakes and the like.
	<br>
	Buckets hold plenty, metal or wooden doesn't matter, so no need to get flimsy glass beakers. Best is a big plastic bucket though, they don't make buckets like they used to.
	<br>
	<b>Fertilizing from the compost bin</b>
	<br>
	Don't worry about running out. Just stuff in seeds, eggs, burned messes, or even better, grown fruits and vegetables, or meat, and you will soon have plenty of compost. 
	<br>
	<b>Fertilizing directly</b>
	<br> 
	You can stuff things directly into the soil to get various effects. Ghoul meat, or ground up insect chitin makes the plants grow in strange ways. Ground bone is great fertilizer. Try various things and see what works.
	<br>
	<b>Plant improvement</b>
	<br>
	Plants usually grow more potent with generations if you take good care of them. Keep track of the better, larger fruits and make seeds from them in the extractor for the next crop."}


// ------------------------------------
// Scythe - lacks a real purpose in FO
// ------------------------------------

/obj/item/scythe
	name = "scythe"
	desc = "A sharp and curved blade on a long fibremetal handle, this tool makes it easy to reap what you sow."
	icon = 'icons/fallout/objects/farming/farming_tools.dmi'
	icon_state = "scythe"
	lefthand_file = 'icons/mob/inhands/weapons/polearms_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/polearms_righthand.dmi'
	force = 15
	throwforce = 5
	throw_speed = 2
	throw_range = 3
	attack_speed = CLICK_CD_MELEE
	w_class = WEIGHT_CLASS_BULKY
	flags_1 = CONDUCT_1
	armour_penetration = 0.4
	slot_flags = ITEM_SLOT_BACK
	attack_verb = list("chopped", "sliced", "cut", "reaped")
	hitsound = 'sound/weapons/bladeslice.ogg'
	var/swiping = FALSE

/obj/item/scythe/Initialize()
	. = ..()
	AddComponent(/datum/component/butchering, 90, 105)

/obj/item/scythe/suicide_act(mob/user)
	user.visible_message("<span class='suicide'>[user] is beheading [user.p_them()]self with [src]! It looks like [user.p_theyre()] trying to commit suicide!</span>")
	if(iscarbon(user))
		var/mob/living/carbon/C = user
		var/obj/item/bodypart/BP = C.get_bodypart(BODY_ZONE_HEAD)
		if(BP)
			BP.drop_limb()
			playsound(src,pick('sound/misc/desceration-01.ogg','sound/misc/desceration-02.ogg','sound/misc/desceration-01.ogg') ,50, 1, -1)
	return (BRUTELOSS)

/obj/item/scythe/pre_attack(atom/A, mob/living/user, params, attackchain_flags, damage_multiplier)
	. = ..()
	if(. & STOP_ATTACK_PROC_CHAIN)
		return
	if(swiping || !istype(A, /obj/structure/spacevine) || get_turf(A) == get_turf(user))
		return
	else
		var/turf/user_turf = get_turf(user)
		var/dir_to_target = get_dir(user_turf, get_turf(A))
		var/stam_gain = 0
		swiping = TRUE
		var/static/list/scythe_slash_angles = list(0, 45, 90, -45, -90)
		for(var/i in scythe_slash_angles)
			var/turf/T = get_step(user_turf, turn(dir_to_target, i))
			for(var/obj/structure/spacevine/V in T)
				if(user.Adjacent(V))
					melee_attack_chain(user, V, attackchain_flags = ATTACK_IGNORE_CLICKDELAY)
					stam_gain += 5					//should be hitcost
		swiping = FALSE
		stam_gain += 2								//Initial hitcost
		user.adjustStaminaLoss(-stam_gain)
		user.DelayNextAction()
