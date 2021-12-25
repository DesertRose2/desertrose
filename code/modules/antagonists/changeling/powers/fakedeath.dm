/obj/effect/proc_holder/changeling/fakedeath
	name = "Reviving Stasis"
	desc = "We fall into a stasis, allowing us to regenerate and trick our enemies."
	chemical_cost = 15
	dna_cost = 0
	req_dna = 1
	req_stat = DEAD
	ignores_fakedeath = TRUE
	action_icon = 'icons/mob/actions/actions_changeling.dmi'
	action_icon_state = "ling_regenerative_stasis"
	action_background_icon_state = "bg_ling"

//Fake our own death and fully heal. You will appear to be dead but regenerate fully after a short delay.
/obj/effect/proc_holder/changeling/fakedeath/sting_action(mob/living/user)
	to_chat(user, SPAN_NOTICE("We begin our stasis, preparing energy to arise once more."))
	if(user.stat != DEAD)
		user.emote("deathgasp")
		user.tod = STATION_TIME_TIMESTAMP("hh:mm:ss", world.time)
	user.fakedeath("changeling") //play dead
	user.update_stat()

	addtimer(CALLBACK(src, .proc/ready_to_regenerate, user), LING_FAKEDEATH_TIME, TIMER_UNIQUE)
	return TRUE

/obj/effect/proc_holder/changeling/fakedeath/proc/ready_to_regenerate(mob/user)
	if(user && user.mind)
		var/datum/antagonist/changeling/C = user.mind.has_antag_datum(/datum/antagonist/changeling)
		if(C && C.purchasedpowers)
			to_chat(user, SPAN_NOTICE("We are ready to revive."))
			var/obj/effect/proc_holder/changeling/revive/RV =  new /obj/effect/proc_holder/changeling/revive(null)
			C.purchasedpowers += RV
			RV.action.Grant(user)

/obj/effect/proc_holder/changeling/fakedeath/can_sting(mob/living/user)
	if(HAS_TRAIT_FROM(user, TRAIT_DEATHCOMA, "changeling"))
		to_chat(user, SPAN_WARNING("We are already reviving."))
		return
	if(!user.stat) //Confirmation for living changelings if they want to fake their death
		switch(alert("Are we sure we wish to fake our own death?",,"Yes", "No"))
			if("No")
				return
	return ..()
