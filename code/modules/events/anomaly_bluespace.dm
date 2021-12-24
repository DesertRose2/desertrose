/datum/round_event_control/anomaly/anomaly_bluespace
	name = "Anomaly: Quantum"
	typepath = /datum/round_event/anomaly/anomaly_bluespace

	max_occurrences = 1
	weight = 5

/datum/round_event/anomaly/anomaly_bluespace
	startWhen = 3
	announceWhen = 10
	anomaly_path = /obj/effect/anomaly/bluespace

/datum/round_event/anomaly/anomaly_bluespace/announce(fake)
	if(prob(90))
		priority_announce("Unstable quantum anomaly detected on long range scanners. Expected location: [impact_area.name].", "Anomaly Alert")
	else
		print_command_report("Unstable quantum anomaly detected on long range scanners. Expected location: [impact_area.name].", "Unstable quantum anomaly")
