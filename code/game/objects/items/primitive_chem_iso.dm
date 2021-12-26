/obj/item/reagent_containers/glass/primitive_chem_isolator
	name = "primitive chemical isolator"
	desc = "A small cup that allows you to slowly spin out the chemicals you do not want."
	icon_state = "chem_iso"
	amount_per_transfer_from_this = 10
	possible_transfer_amounts = list(5, 10, 15, 20, 25, 30, 50)
	item_flags = NO_MAT_REDEMPTION
	reagent_flags = OPENCONTAINER
	spillable = TRUE

/obj/item/reagent_containers/glass/primitive_chem_isolator/examine(mob/user)
	. = ..()
	. += "<span class='notice'>Ctrl + Click to take out chemicals.</span>"

/obj/item/reagent_containers/glass/primitive_chem_isolator/CtrlClick(mob/user)
	if(!reagents)
		to_chat(user, "<span class='warning'>There are no chemicals to spin out.</span>")
		return
	to_chat(user, "<span class='notice'>You see some chemicals you can spin out of [src].</span>")
	var/datum/reagent/choice = input(user, "Which chemical would you like to remove?") as null|anything in reagents.reagent_list
	if(!choice)
		return
	to_chat(user, "<span class='notice'>You slowly start to spin [src], attempting to remove the chemical.</span>")
	if(!do_after(user, 5 SECONDS, target = src))
		return
	to_chat(user, "<span class='notice'>You successfully spin out the chemical from [src].</span>")
	reagents.remove_reagent(choice.type, 1000)
