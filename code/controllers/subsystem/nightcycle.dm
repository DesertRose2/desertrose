/*  6:00 AM 	- 	21600
	6:45 AM 	- 	24300
	11:45 AM 	- 	42300
	4:45 PM 	- 	60300
	9:45 PM 	- 	78300
	10:30 PM 	- 	81000 */
#define CYCLE_SUNRISE 	216000
#define CYCLE_MORNING 	243000
#define CYCLE_DAYTIME 	423000
#define CYCLE_AFTERNOON 603000
#define CYCLE_SUNSET 	783000
#define CYCLE_NIGHTTIME 810000

GLOBAL_LIST_INIT(nightcycle_turfs, typecacheof(list(
	/turf/open/indestructible/ground/outside)))

SUBSYSTEM_DEF(nightcycle)
	name = "Day/Night Cycle"
	wait = 5 //5 ticks in between checks, this thing doesn't need to fire so fast, as it's tied to gameclock not its own ticker
	//This will also give the game time to light up the columns and not choke
	//var/flags = 0			//see MC.dm in __DEFINES Most flags must be set on world start to take full effect. (You can also restart the mc to force them to process again
	can_fire = TRUE
	//var/list/timeBrackets = list("SUNRISE" = , "MORNING" = , "DAYTIME" = , "EVENING" = , "" = ,)
	var/currentTime
	var/sunColour
	var/sunPower
	var/sunRange
	var/currentColumn
	var/working = 0
	var/doColumns //number of columns to do at a time
	var/newTime

/datum/controller/subsystem/nightcycle/fire(resumed = FALSE)
	if(nextBracket())
		working = 1
		currentColumn = 1

	CHECK_TICK
	if (working)
		doWork()

/datum/controller/subsystem/nightcycle/proc/nextBracket()
	var/Time = station_time()

	switch (Time)
		if (CYCLE_SUNRISE 	to CYCLE_MORNING - 1)
			newTime = "SUNRISE"
		if (CYCLE_MORNING 	to CYCLE_DAYTIME 	- 1)
			newTime = "MORNING"
		if (CYCLE_DAYTIME 	to CYCLE_AFTERNOON	- 1)
			newTime = "DAYTIME"
		if (CYCLE_AFTERNOON to CYCLE_SUNSET 	- 1)
			newTime = "AFTERNOON"
		if (CYCLE_SUNSET 	to CYCLE_NIGHTTIME - 1)
			newTime = "SUNSET"
		else
			newTime = "NIGHTTIME"

	if (newTime != currentTime)
		currentTime = newTime
		updateLight(currentTime)
		if(newTime == "MORNING") //Only change lamps when we need to
			for(var/obj/structure/lamp_post/LP in GLOB.lamppost)
				LP.icon_state = "[initial(LP.icon_state)]"
				LP.set_light(0)
		else if(newTime == "SUNSET")
			for(var/obj/structure/lamp_post/LP in GLOB.lamppost)
				LP.icon_state = "[initial(LP.icon_state)]-on"
				LP.set_light(LP.on_range,LP.on_power,LP.light_color)
		. = TRUE

/datum/controller/subsystem/nightcycle/proc/doWork()
	var/list/currentTurfs = list()
	var/x = min(currentColumn + doColumns, world.maxx)
//	for (var/z in SSmapping.levels_by_trait(ZTRAIT_STATION))
	//HACK. Z level 2 is always surface and nobody sets their fucking traits correctly.
	//This should be done with a ztrait for surface/subsurface
	var/z = 3
	var/start_turf = locate(x,world.maxy,z)
	var/end_turf = locate(x,1,z)

//	currentTurfs = block(locate(currentColumn,1,z), locate(x,world.maxy,z)) //this is probably brutal on the overhead
	currentTurfs = getline(start_turf,end_turf)
	for (var/turf/T in currentTurfs)
		if(T.turf_light_range && !QDELETED(T)) //Turfs are qdeleted on changeturf
			T.set_light(T.turf_light_range, sunPower, sunColour)

	currentColumn = x + 1
	if (currentColumn > world.maxx)
		currentColumn = 1
		working = 0
		return

/datum/controller/subsystem/nightcycle/proc/updateLight(newTime)
	switch (newTime)
		if ("SUNRISE")
			sunColour = "#ffd1b3"
			sunPower = 0.3
		if ("MORNING")
			sunColour = "#fff2e6"
			sunPower = 0.5
		if ("DAYTIME")
			sunColour = "#FFFFFF"
			sunPower = 0.75
		if ("AFTERNOON")
			sunColour = "#fff2e6"
			sunPower = 0.5
		if ("SUNSET")
			sunColour = "#ffcccc"
			sunPower = 0.3
		if("NIGHTTIME")
			sunColour = "#00111a"
			sunPower = 0.20



#undef CYCLE_SUNRISE
#undef CYCLE_MORNING
#undef CYCLE_DAYTIME
#undef CYCLE_AFTERNOON
#undef CYCLE_SUNSET
#undef CYCLE_NIGHTTIME
