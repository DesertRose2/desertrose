/mob/living/silicon/ai/examine(mob/user)
	. = list("<span class='info'>*---------*\nThis is [icon2html(src, user)] <EM>[src]</EM>!")
	if (stat == DEAD)
		. += "<span class='deadsay'>It appears to be powered-down.</span>"
	else
		if (getBruteLoss())
			if (getBruteLoss() < 30)
				. += SPAN_WARNING("It looks slightly dented.")
			else
				. += SPAN_DANGER("It looks severely dented!")
		if (getFireLoss())
			if (getFireLoss() < 30)
				. += SPAN_WARNING("It looks slightly charred.")
			else
				. += SPAN_DANGER("Its casing is melted and heat-warped!")
		if(deployed_shell)
			. += "The wireless networking light is blinking."
		else if (!shunted && !client)
			. += "[src]Core.exe has stopped responding! NTOS is searching for a solution to the problem..."
	. += "*---------*</span>"

	. += ..()
