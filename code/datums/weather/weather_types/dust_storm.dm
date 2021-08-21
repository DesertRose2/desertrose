//Dust storms happen frequently on the wasteland. They heavily obscure vision to anyone caught outside.
/datum/weather/dust_storm
	name = "dust storm"
	desc = "An intense atmospheric storm lifts sand off of the planet's surface and billows it down across the area, diminishing eyesight."
	probability = 3
	
	telegraph_message = "<span class='boldwarning'>An eerie moan rises on the wind. Sheets of sand darken the horizon.</span>"
	telegraph_duration = 300
	telegraph_overlay = "light_ash"

	weather_message = "<span class='userdanger'><i>Thick rolling clouds of sand billow down around you!</i></span>"
	weather_duration_lower = 600
	weather_duration_upper = 1200
	weather_overlay = "ash_storm"

	end_message = "<span class='boldannounce'>The shrieking wind whips away the last of the sand and falls to its usual murmur.</span>"
	end_duration = 300
	end_overlay = "light_ash"

	area_types = list(/area/f13/wasteland, /area/f13/desert, /area/f13/farm, /area/f13/forest, /area/f13/ruins)
	protected_areas = list(/area/shuttle)
	target_trait = ZTRAIT_STATION

	immunity_type = "water"

	barometer_predictable = TRUE

	var/datum/looping_sound/active_outside_ashstorm/sound_ao = new(list(), FALSE, TRUE)
	var/datum/looping_sound/active_inside_ashstorm/sound_ai = new(list(), FALSE, TRUE)
	var/datum/looping_sound/weak_outside_ashstorm/sound_wo = new(list(), FALSE, TRUE)
	var/datum/looping_sound/weak_inside_ashstorm/sound_wi = new(list(), FALSE, TRUE)

/datum/weather/ash_storm/start()
	. = ..()
	sound_wo.stop()
	sound_wi.stop()

	sound_ao.start()
	sound_ai.start()

/datum/weather/ash_storm/wind_down()
	. = ..()
	sound_ao.stop()
	sound_ai.stop()

	sound_wo.start()
	sound_wi.start()

/datum/weather/ash_storm/end()
	. = ..()
	sound_wo.stop()
	sound_wi.stop()

