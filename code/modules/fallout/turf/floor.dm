//Fallout 13 general destructible floor directory

/turf/open/floor/f13
	name = "floor"
	planetary_atmos = 1
	icon_state = "floor"
	icon_regular_floor = "floor"
	icon_plating = "plating"
	icon = 'icons/fallout/turfs/floors.dmi'

/turf/open/floor/f13/ReplaceWithLattice()
	ScrapeAway()

/turf/open/floor/f13/wood
	icon_state = "housewood1" // for map preview
	var/base_icon_state = "housewood"
	var/num_variants = 4
	icon = 'icons/fallout/turfs/ground.dmi'
	floor_tile = /obj/item/stack/tile/wood
	icon_plating = "housebase"
	footstep = FOOTSTEP_WOOD
	barefootstep = FOOTSTEP_WOOD_BAREFOOT
	clawfootstep = FOOTSTEP_WOOD_CLAW
	broken_states = list("housewood1-broken", "housewood2-broken", "housewood3-broken", "housewood4-broken")

/turf/open/floor/f13/wood/Initialize()
	. = ..()
	if(prob(5))
		broken = TRUE
		icon_state = pick(broken_states)
	else
		icon_state = "[base_icon_state][num_variants > 0 ? rand(1,num_variants) : null]"

/turf/open/floor/f13/wood/make_plating()
	return ChangeTurf(/turf/open/floor/plating/wooden)

/turf/open/floor/f13/wood/attackby(obj/item/C, mob/user, params)
	if(..())
		return
	if(istype(C, /obj/item/screwdriver))
		if(broken || burnt)
			new /obj/item/stack/sheet/mineral/wood(src)
		else
			new floor_tile(src)
		to_chat(user, SPAN_DANGER("You unscrew the planks."))
		make_plating()
		playsound(src, C.usesound, 80, 1)
		return
