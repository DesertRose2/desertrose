/obj/machinery/computer/terminal
	name = "desktop terminal"
	desc = "A RobCo Industries terminal, widely available for commercial and private use before the war."
	icon_state = "terminal"
	icon_keyboard = "terminal_key"
	icon_screen = "terminal_on_alt"
	connectable = FALSE
	light_color = LIGHT_COLOR_GREEN
	circuit = /obj/item/circuitboard/computer/robco_terminal
	var/broken = FALSE // Used for pre-broken terminals
	var/prog_notekeeper = TRUE // Almost all consoles have the word processor installed, but we can remove it if we want to
	var/termtag = "Home" // We use this for flavor.
	var/termnumber = null // Flavor
	var/mode = 0 // What page we're on. 0 is the main menu.

// Notekeeper vars
	var/notehtml = ""
	var/note = "ERR://null-data #236XF51"

/obj/machinery/computer/terminal/Initialize()
	. = ..()

	if(!broken)
		desc = "[initial(desc)] Remarkably, it still works."
		termnumber = rand(69,420) // Unlikely to get two identical numbers.
	else
		desc = "[initial(desc)] Unfortunately, this one seems to have broken down."

/obj/machinery/computer/terminal/ui_interact(mob/user)
	. = ..()
	if(broken)
		return

	var/dat = ""
	dat += "<head><style>body {padding: 0; margin: 15px; background-color: #062113; color: #4aed92; line-height: 170%;} a, button, a:link, a:visited, a:active, .linkOn, .linkOff {color: #4aed92; text-decoration: none; background: #062113; border: none; padding: 1px 4px 1px 4px; margin: 0 2px 0 0; cursor:default;} a:hover {color: #062113; background: #4aed92; border: 1px solid #4aed92} a.white, a.white:link, a.white:visited, a.white:active {color: #4aed92; text-decoration: none; background: #4aed92; border: 1px solid #161616; padding: 1px 4px 1px 4px; margin: 0 2px 0 0; cursor:default;} a.white:hover {color: #062113; background: #4aed92;} .linkOn, a.linkOn:link, a.linkOn:visited, a.linkOn:active, a.linkOn:hover {color: #4aed92; background: #062113; border-color: #062113;} .linkOff, a.linkOff:link, a.linkOff:visited, a.linkOff:active, a.linkOff:hover{color: #4aed92; background: #062113; border-color: #062113;}</style></head><font face='courier'>"
	dat += "<center><b>ROBCO INDUSTRIES UNIFIED OPERATING SYSTEM v.85</b><br>"
	dat += "<b>COPYRIGHT 2075-2077 ROBCO INDUSTRIES</b><br>"

	switch (mode) // This originally had more than 0 and 1, so it's still a switch.
		if (0) // If we're on the home page
			dat += "= [termtag] Terminal [termnumber] =</center>"
		if (1) // If we're in the word processor
			dat += "= RobCo Word Processor V.22 =</center>"
	dat += "<br>"
	switch (mode)
		if (0)
			if(prog_notekeeper)
				dat += "TERMINAL FUNCTIONS"
				dat += "<br><a href='byond://?src=[REF(src)];choice=Notes'>\>  Word Processor</a>"
				dat += "<br><br>"
			dat += "FILE SYSTEM"
			dat += "<br>  <i>No files found!</i>"

		if (1)
			dat += "</center><font face=\"Courier\">[(!notehtml ? note : notehtml)]</font>"
			dat += "<br><br><center>=============================================================================</center>"
			dat += "<a href='byond://?src=[REF(src)];choice=Edit'>\>  Edit</a><br>"
			dat += "<a href='byond://?src=[REF(src)];choice=Return'>\>  Return</a>"


	dat += "</font></div>"

	var/datum/browser/popup = new(user, "terminal", null, 600, 400)
	popup.set_content(dat)
	popup.open()

/obj/machinery/computer/terminal/Topic(href, href_list)
	..()
	var/mob/living/U = usr

	if(!istype(U) || !U.canUseTopic(src) || href_list["close"])
		return
	add_fingerprint(U)
	U.set_machine(src)

	switch(href_list["choice"])
		if ("Edit") // Notekeeper
			var/n = stripped_multiline_input(U, "Please enter message", name, note, max_length=MAX_MESSAGE_LEN * 4) //Probably not abusable?? I'd be surprised if anyone managed to crash anything with this
			if (in_range(src, U))
				if (mode == 1 && n)
					note = n
					notehtml = parsemarkdown(n, U)
			else
				return
		if("Return") // Return
			if(mode) // If we're not on the home page...
				mode = 0 // Take us there
		if ("Notes") // Menu
			mode = 1

	updateUsrDialog()

/obj/item/circuitboard/computer/robco_terminal
	name = "RobCo Terminal Mainboard (Computer board)"
	build_path = /obj/machinery/computer/terminal
