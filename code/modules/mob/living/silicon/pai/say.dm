/mob/living/silicon/pai/say(message, bubble_type, list/spans = list(), sanitize = TRUE, datum/language/language = null, ignore_spam = FALSE, forced = null)
	if(silent)
		to_chat(src, SPAN_WARNING("Communication circuits remain unitialized."))
	else
		..(message)

/mob/living/silicon/pai/binarycheck()
	return FALSE

/mob/living/silicon/pai/radio(message, message_mode, list/spans, language)
	if((message_mode == "robot") || (message_mode in GLOB.radiochannels))
		if(radio_short)
			to_chat(src, SPAN_WARNING("Your radio is shorted out!"))
			return ITALICS | REDUCE_RANGE
	return ..()
