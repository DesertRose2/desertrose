// In this document: Junk. Fixed stuff thats in the way, or just decorative. For ruins.

/////////
//JUNK //
/////////    Stuff to fill ruins with. Can't be built. Can slow down, block, contain resources.

/obj/structure/junk
	icon = 'icons/fallout/objects/furniture/junk.dmi'
	icon_state = "junk_dresser"
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

/obj/structure/junk/jukebox
	name = "ancient jukebox"
	desc = "Utterly ruined."
	icon_state = "junk_jukebox"
	buildstacktype = /obj/item/stack/crafting/electronicparts
	buildstackamount = 1

/obj/structure/junk/arcade
	name = "broken down arcade machine"
	desc = "Some sort of entertainment machine, broken down."
	icon_state = "junk_arcade"
	buildstacktype = /obj/item/stack/crafting/electronicparts
	buildstackamount = 1


// Small junk = intended to not block movement or give cover, just slowdown. Slowdown var not functioning though.

/obj/structure/junk/small
	name = "rotting planks"
	desc = "Remains of small furniture"
	icon_state = "junk_bench"
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

/obj/structure/junk/small/disco
	name = "smashed optical machine"
	desc = "A very broken, strange machine"
	icon_state = "junk_disco"


//////////////////
//JUNK OVERLAYS //
//////////////////   - Basically decorative stuff that has no gameplay issue. Decals. 

/obj/effect/overlay/junk
	name = "junk"
	icon = 'icons/fallout/objects/furniture/junk.dmi'
	icon_state = "junk_clock"

/obj/effect/overlay/junk/toilet
	icon_state = "junk_toilet"

/obj/effect/overlay/junk/sink
	icon_state = "junk_sink"

/obj/effect/overlay/junk/urinal
	icon_state = "junk_urinal"

/obj/effect/overlay/junk/shower
	icon_state = "junk_shower"

/obj/effect/overlay/junk/mirror
	icon_state = "junk_mirror"

/obj/effect/overlay/junk/curtain
	icon_state = "junk_curtain"

/obj/effect/overlay/junk/telescreen
	icon_state = "junk_telescreen"

/obj/effect/overlay/junk/tire
	icon_state = "tire"

/obj/effect/overlay/junk/tire_buried
	icon_state = "tire_buried"

//Old piping
/obj/effect/overlay/junk/oldpipes
	name = "old pipes"
	desc = "Rusty old pipes."
	icon_state = "rustpipe"

/obj/effect/overlay/junk/oldpipes/manifold
	icon_state = "rustpipe-manifold"

/obj/effect/overlay/junk/oldpipes/manifold/fourway
	icon_state = "rustpipe-fourway"

/obj/effect/overlay/junk/oldpipes/end
	icon_state = "rustpipe-end"

/obj/effect/overlay/junk/oldpipes/vent
	icon_state = "rustpipe-vent"

/obj/effect/overlay/turfs/decoration/oldpipes/valve
	icon_state = "rustpipe-valve"