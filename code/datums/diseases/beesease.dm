/datum/disease/beesease
	name = "Beesease"
	form = "Infection"
	max_stages = 4
	spread_text = "On contact"
	spread_flags = DISEASE_SPREAD_BLOOD | DISEASE_SPREAD_CONTACT_SKIN | DISEASE_SPREAD_CONTACT_FLUIDS
	cure_text = "Sugar"
	cures = list(/datum/reagent/consumable/sugar)
	agent = "Apidae Infection"
	viable_mobtypes = list(/mob/living/carbon/human, /mob/living/carbon/monkey)
	desc = "If left untreated subject will regurgitate bees."
	severity = DISEASE_SEVERITY_MEDIUM
	infectable_biotypes = MOB_ORGANIC|MOB_UNDEAD //bees nesting in corpses

/datum/disease/beesease/stage_act()
	..()
	switch(stage)
		if(2) //also changes say, see say.dm
			if(prob(2))
				to_chat(affected_mob, SPAN_NOTICE("You taste honey in your mouth."))
		if(3)
			if(prob(10))
				to_chat(affected_mob, SPAN_NOTICE("Your stomach rumbles."))
			if(prob(2))
				to_chat(affected_mob, SPAN_DANGER("Your stomach stings painfully."))
				if(prob(20))
					affected_mob.adjustToxLoss(2)
					affected_mob.updatehealth()
		if(4)
			if(prob(10))
				affected_mob.visible_message(SPAN_DANGER("[affected_mob] buzzes."), \
												"<span class='userdanger'>Your stomach buzzes violently!</span>")
			if(prob(5))
				to_chat(affected_mob, SPAN_DANGER("You feel something moving in your throat."))
			if(prob(1))
				affected_mob.visible_message(SPAN_DANGER("[affected_mob] coughs up a swarm of bees!"), \
													"<span class='userdanger'>You cough up a swarm of bees!</span>")
				new /mob/living/simple_animal/hostile/poison/bees(affected_mob.loc)
	return
