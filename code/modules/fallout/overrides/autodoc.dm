//Autodocs replacing sleepers was done by Wateronix as well as the sprites. Ultimately very good idea since it keeps with lore consistancy and provides a unique looking sprite.
/obj/machinery/sleeper
	name = "autodoc"
	desc = "An old pre war machine, used to stablize and heal patients."
	icon = 'icons/obj/machines/autodoc.dmi'
	icon_state = "autodoc"
	layer = 3.3

/obj/machinery/sleeper/ui_interact(mob/living/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!isobserver(user))
		if(!HAS_TRAIT(user, TRAIT_CHEMWHIZ))
			to_chat(user, SPAN_WARNING("Try as you might, you have no clue how to work this thing."))
			return
		if(!user.IsAdvancedToolUser())
			to_chat(user, SPAN_WARNING("The legion has no use for drugs! Better to destroy it."))
			return
	if(!ui)
		ui = new(user, src, "Autodoc", name)
		ui.open()
