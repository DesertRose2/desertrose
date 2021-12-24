#define SINGLE "single"
#define VERTICAL "vertical"
#define HORIZONTAL "horizontal"

#define METAL 1
#define WOOD 2
#define SAND 3

//Junk and Rubbish
//Objects to fill ruins with so it looks decayed on the inside too.
//Junk = Blocks movement, bullets, small resource when destroyed.
//small junk = Slows movement, worthless for cover, cleaned with soap etc. Having difficulty making the slowdown work =(

/obj/structure/junk
	icon = 'icons/obj/stationobjs.dmi'
	obj_integrity = 100
	max_integrity = 100
	anchored = 1
	density = 1
	var/buildstacktype = /obj/item/stack/rods
	var/buildstackamount = 1

/obj/structure/junk/deconstruct()
	// If we have materials, and don't have the NOCONSTRUCT flag
	if(!(flags_1 & NODECONSTRUCT_1))
		if(buildstacktype)
			new buildstacktype(loc,buildstackamount)
		else
			for(var/i in custom_materials)
				var/datum/material/M = i
				new M.sheet_type(loc, FLOOR(custom_materials[M] / MINERAL_MATERIAL_AMOUNT, 1))
	..()

/obj/structure/junk/machinery
	name = "rusting machine"
	desc = "Some sort of machine rusted solid."
	icon_state = "junk_machine"
	obj_integrity = 200
	max_integrity = 200
	buildstacktype = /obj/item/stack/crafting/metalparts
	buildstackamount = 2

/obj/structure/junk/locker
	name = "decayed locker"
	desc = "Broken, rusted junk."
	icon_state = "junk_locker"

/obj/structure/junk/cabinet
	name = "old rotting furniture"
	desc = "Time and the elements has degraded this furniture beyond repair."
	icon_state = "junk_cabinet"
	buildstacktype = /obj/item/stack/sheet/mineral/wood
	buildstackamount = 1

/obj/structure/junk/drawer
	name = "ruined old furniture"
	desc = "Time and the elements has degraded this furniture beyond repair."
	icon_state = "junk_dresser"
	buildstacktype = /obj/item/stack/sheet/mineral/wood
	buildstackamount = 1

/obj/structure/junk/micro
	name = "rusting kitchenmachine"
	desc = "Rusted solid, useless."
	icon_state = "junk_micro"
	buildstacktype = /obj/item/stack/crafting/electronicparts
	buildstackamount = 1

/obj/structure/junk/small
	density = 0
	var/slowdown = 4

/obj/structure/junk/small/table
	name = "ruined old furniture"
	desc = "Time and the elements has degraded this furniture beyond repair."
	icon_state = "junk_table"
	buildstacktype = /obj/item/stack/sheet/mineral/wood
	buildstackamount = 1

/obj/structure/junk/small/tv
	name = "pre-war electronic junk"
	desc = "Broken, a useless relic of the past."
	icon_state = "junk_tv"
	buildstacktype = /obj/item/stack/crafting/electronicparts
	buildstackamount = 1

/obj/structure/junk/small/bed
	name = "rotting bed"
	desc = "Rusted and rotting, useless."
	icon_state = "junk_bed1"
	buildstackamount = 2

/obj/structure/junk/small/bed2
	name = "rusty bedframe"
	desc = "Rusted and rotting, useless."
	icon_state = "junk_bed2"
	buildstackamount = 2

/obj/structure/junk/small/bench
	name = "rotting planks"
	desc = "The remains of what was once a wooden bench of some kind."
	icon_state = "rubbish_bench"
	slowdown = 6

//Barricades/cover

/obj/structure/barricade
	name = "chest high wall"
	desc = "Looks like this would make good cover."
	anchored = 1
	density = 1
	obj_integrity = 100
	max_integrity = 100

/////BARRICADE TYPES///////

// Main code in deployable.dm
/obj/structure/barricade/wooden
	icon = 'icons/obj/fence.dmi'
	icon_state = "woodenbarricade"
	var/can_build = TRUE

/obj/structure/barricade/wooden/attackby(obj/item/weapon/I, mob/living/user, params)
	if(!istype(I, /obj/item/stack/sheet) || !can_build)
		return ..()
	if(!isfloorturf(loc) && !isplatingturf(loc))
		to_chat(user, SPAN_WARNING("You can only build the structure on a solid floor!"))
		return

	var/walltype
	var/windowtype
	var/structname = "a wall"
	if(istype(I, /obj/item/stack/sheet/mineral/wood))
		walltype = /turf/closed/wall/f13/wood
	else if(istype(I, /obj/item/stack/sheet/cloth))
		walltype = /turf/closed/wall/f13/wood/interior
		structname = "an interior wall"
	else if(istype(I, /obj/item/stack/sheet/leather))
		walltype = /turf/closed/wall/f13/wood/house
		structname = "a house wall"
	else if(istype(I, /obj/item/stack/sheet/glass))
		windowtype = /obj/structure/window/fulltile/house
		structname = "a house window"
	else if(istype(I, /obj/item/stack/sheet/rglass))
		windowtype = /obj/structure/window/fulltile/wood
		structname = "a wood framed window"
	else
		return ..()
	
	to_chat(user, SPAN_NOTICE("You start building [structname]..."))
	if(do_after(user, 100, target = src) && I.use(3))
		var/turf/open/T = loc
		if(walltype)
			T.ChangeTurf(walltype)
		else if(windowtype)
			new windowtype(T)
		qdel(src)
	return TRUE
	

/obj/structure/barricade/wooden/strong
	name = "strong wooden barricade"
	desc = "This space is blocked off by a strong wooden barricade."
	obj_integrity = 300
	max_integrity = 300
	proj_pass_rate = 30
	can_build = FALSE

/obj/structure/barricade/bars //FighterX2500 is this you?
	name = "metal bars"
	desc = "Old, corroded metal bars. Ain't got a file on you, right?" //Description by Mr.Fagetti
	icon = 'icons/obj/fence.dmi'
	icon_state = "bars"
	obj_integrity = 400
	max_integrity = 400
	proj_pass_rate = 90
	pass_flags = LETPASSTHROW //Feed the prisoners, or not.

/obj/structure/barricade/sandbags
	name = "sandbags"
	desc = "Bags of sand. Take cover!"
	icon = 'icons/obj/smooth_structures/sandbags.dmi'
	icon_state = "sandbags"
	obj_integrity = 300
	max_integrity = 300
	proj_pass_rate = 20
	pass_flags = LETPASSTHROW
//	material = SAND
	climbable = TRUE
	smooth = SMOOTH_TRUE
	canSmoothWith = list(/obj/structure/barricade/sandbags, /turf/closed/wall, /turf/closed/wall/r_wall, /obj/structure/falsewall, /obj/structure/falsewall/reinforced, /turf/closed/wall/rust, /turf/closed/wall/r_wall/rust, /obj/structure/barricade/security)

#undef SINGLE
#undef VERTICAL
#undef HORIZONTAL

#undef METAL
#undef WOOD
#undef SAND
