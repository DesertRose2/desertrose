/obj/effect/proc_holder/changeling/linglink
	name = "Hivemind Link"
	desc = "Link your victim's mind into the hivemind for personal interrogation."
	chemical_cost = 0
	dna_cost = -1
	req_human = 1
	action_icon = 'icons/mob/actions/actions_changeling.dmi'
	action_icon_state = "ling_link"
	action_background_icon_state = "bg_ling"

/obj/effect/proc_holder/changeling/linglink/can_sting(mob/living/carbon/user)
	if(!..())
		return
	var/datum/antagonist/changeling/changeling = user.mind.has_antag_datum(/datum/antagonist/changeling)
	if(changeling.islinking)
		to_chat(user, SPAN_WARNING("We have already formed a link with the victim!"))
		return
	if(!user.pulling)
		to_chat(user, SPAN_WARNING("We must be tightly grabbing a creature to link with them!"))
		return
	if(!iscarbon(user.pulling))
		to_chat(user, SPAN_WARNING("We cannot link with this creature!"))
		return
	var/mob/living/carbon/target = user.pulling

	if(!target.mind)
		to_chat(user, SPAN_WARNING("The victim has no mind to link to!"))
		return
	if(target.stat == DEAD)
		to_chat(user, SPAN_WARNING("The victim is dead, you cannot link to a dead mind!"))
		return
	if(target.mind.has_antag_datum(/datum/antagonist/changeling))
		to_chat(user, SPAN_WARNING("The victim is already a part of the hivemind!"))
		return
	if(user.grab_state <= GRAB_AGGRESSIVE)
		to_chat(user, SPAN_WARNING("We must have a tighter grip to link with this creature!"))
		return
	return changeling.can_absorb_dna(target)

/obj/effect/proc_holder/changeling/linglink/sting_action(mob/user)
	var/datum/antagonist/changeling/changeling = user.mind.has_antag_datum(/datum/antagonist/changeling)
	var/mob/living/carbon/human/target = user.pulling
	changeling.islinking = 1
	for(var/i in 1 to 3)
		switch(i)
			if(1)
				to_chat(user, SPAN_NOTICE("This creature is compatible. We must hold still..."))
			if(2)
				to_chat(user, SPAN_NOTICE("We stealthily stab [target] with a minor proboscis..."))
				to_chat(target, "<span class='userdanger'>You experience a stabbing sensation and your ears begin to ring...</span>")
			if(3)
				to_chat(user, SPAN_NOTICE("We mold the [target]'s mind like clay, granting [target.p_them()] the ability to speak in the hivemind!"))
				to_chat(target, "<span class='userdanger'>A migraine throbs behind your eyes, you hear yourself screaming - but your mouth has not opened!</span>")
				for(var/mi in GLOB.mob_list)
					var/mob/M = mi
					if(M.lingcheck() == LINGHIVE_LING)
						to_chat(M, "<i><font color=#800080>We can sense a foreign presence in the hivemind...</font></i>")
				target.mind.linglink = 1
				target.say("[MODE_TOKEN_CHANGELING] AAAAARRRRGGGGGHHHHH!!")
				to_chat(target, "<font color=#800040><span class='boldannounce'>You can now communicate in the changeling hivemind, say \"[MODE_TOKEN_CHANGELING] message\" to communicate!</span>")
				target.reagents.add_reagent(/datum/reagent/medicine/salbutamol, 40) // So they don't choke to death while you interrogate them
				sleep(1800)
		SSblackbox.record_feedback("nested tally", "changeling_powers", 1, list("[name]", "[i]"))
		if(!do_mob(user, target, 20))
			to_chat(user, SPAN_WARNING("Our link with [target] has ended!"))
			changeling.islinking = 0
			target.mind.linglink = 0
			return

	changeling.islinking = 0
	target.mind.linglink = 0
	to_chat(user, SPAN_NOTICE("You cannot sustain the connection any longer, your victim fades from the hivemind."))
	to_chat(target, "<span class='userdanger'>The link cannot be sustained any longer, your connection to the hivemind has faded!</span>")
