/obj/item/book/granter/crafting_recipe/onlearned(mob/living/user)
	..()
	if(oneuse)
		user.visible_message("<span class='caution'>[src] is useless to you now. You throw it away.</span>")
		qdel(src)

/obj/item/book/granter/crafting_recipe/on_reading_finished(mob/user)
	. = ..()
	onlearned(user)

/obj/item/book/granter/crafting_recipe/gunsmith_one
	name = "Guns and Bullets, Part 1"
	desc = "A rare issue of Guns and Bullets detailing the basic manufacture of firearms, allowing the reader to craft firearms. It's barely holding up, and looks like only one person can study the knowledge from it."
	icon_state = "gab1"
	oneuse = TRUE
	remarks = list("Always keep your gun well lubricated...", "Keep your barrel free of grime...", "Perfect fitment is the key to a good firearm...", "Maintain a proper trigger pull length...", "Keep your sights zeroed to proper range...")
	crafting_recipe_types = list(/datum/crafting_recipe/ninemil, /datum/crafting_recipe/widowmaker)

/obj/item/book/granter/crafting_recipe/gunsmith_two
	name = "Guns and Bullets, Part 2"
	desc = "A rare issue of Guns and Bullets following up Part 1, going further indepth into weapon mechanics, allowing the reader to craft certain firearms. It's barely holding up, and looks like only one person can study the knowledge from it."
	icon_state = "gab2"
	oneuse = TRUE
	remarks = list("Always keep your gun well lubricated...", "Keep your barrel free of grime...", "Perfect fitment is the key to a good firearm...", "Maintain a proper trigger pull length...", "Keep your sights zeroed to proper range...")
	crafting_recipe_types = list(/datum/crafting_recipe/n99, /datum/crafting_recipe/huntingrifle, /datum/crafting_recipe/m1911, /datum/crafting_recipe/varmintrifle, /datum/crafting_recipe/colt6520)

/obj/item/book/granter/crafting_recipe/gunsmith_three
	name = "Guns and Bullets, Part 3"
	desc = "A rare issue of Guns and Bullets following up Part 2, explaining difficult ballistics theory and weapon mechanics, allowing the reader to craft weapon attachments. It's barely holding up, and looks like only one person can study the knowledge from it."
	icon_state = "gab3"
	oneuse = TRUE
	remarks = list("Always keep your gun well lubricated...", "Keep your barrel free of grime...", "Perfect fitment is the key to a good firearm...", "Maintain a proper trigger pull length...", "Keep your sights zeroed to proper range...")
	crafting_recipe_types = list(/datum/crafting_recipe/scope, /datum/crafting_recipe/suppressor, /datum/crafting_recipe/burst_improvement, /datum/crafting_recipe/recoil_decrease, /datum/crafting_recipe/bullet_speed)

/obj/item/book/granter/crafting_recipe/gunsmith_four
	name = "Guns and Bullets, Part 4"
	desc = "An extremely rare issue of Guns and Bullets, showing some design flaws of weapons and how to rectify them. It's barely holding up, and looks like only one person can study the knowledge from it."
	icon_state = "gab4"
	oneuse = TRUE
	remarks = list("Always keep your gun well lubricated...", "Keep your barrel free of grime...", "Perfect fitment is the key to a good firearm...", "Maintain a proper trigger pull length...", "Keep your sights zeroed to proper range...")
	//crafting_recipe_types = list(/datum/crafting_recipe/flux, /datum/crafting_recipe/lenses, /datum/crafting_recipe/conductors, /datum/crafting_recipe/receiver, /datum/crafting_recipe/assembly, /datum/crafting_recipe/alloys)

/obj/item/book/granter/crafting_recipe/scav_one
	name = "SCAV! Issue 1"
	desc = "A popular post-war comic series detailing the trials and tribulations of scavengers and their tools."
	oneuse = TRUE
	remarks = list("And it was here that I stabbed a man over a desk fan...", "The paint was chipping, but that didn't matter when he lay dead...", "A tank here, a pipe there...", "A bit of duct tape wrapped around everything...", "My flamethrower spat fire! Wait, where are my eyebrows...")
	crafting_recipe_types = list(/datum/crafting_recipe/steelsaw, /datum/crafting_recipe/entrenching_tool, /datum/crafting_recipe/fraiderscav, /datum/crafting_recipe/raiderscav)

/obj/item/book/granter/crafting_recipe/scav_two
	name = "SCAV! Issue 2"
	desc = "A popular post-war comic series detailing the trials and tribulations of scavengers and their tools."
	oneuse = TRUE
	remarks = list("And it was here that I stabbed a man over a desk fan...", "The paint was chipping, but that didn't matter when he lay dead...", "A tank here, a pipe there...", "A bit of duct tape wrapped around everything...", "My flamethrower spat fire! Wait, where are my eyebrows...")
	crafting_recipe_types = list(/datum/crafting_recipe/autoaxe, /datum/crafting_recipe/fscav, /datum/crafting_recipe/scav)

// New Blueprints, yay! -Superballs
/obj/item/book/granter/crafting_recipe/blueprint
	name = "blueprint"
	icon = 'icons/fallout/objects/items.dmi'
	icon_state = "blueprint_empty"
	desc = "A detailed schematic for crafting an item."
	w_class = WEIGHT_CLASS_TINY
	oneuse = TRUE
	remarks = list()

/obj/item/book/granter/crafting_recipe/blueprint/r91/ncr
	name = "ncr assault rifle blueprint"
	icon_state = "blueprint2"
	crafting_recipe_types = list(/datum/crafting_recipe/r91/ncr)

/obj/item/book/granter/crafting_recipe/blueprint/maxson
	name = "maxson carbine blueprint"
	icon_state = "blueprint2"
	crafting_recipe_types = list(/datum/crafting_recipe/maxson)

/obj/item/book/granter/crafting_recipe/blueprint/marksman
	name = "marksman carbine blueprint"
	icon_state = "blueprint2"
	crafting_recipe_types = list(/datum/crafting_recipe/marksmancarbine)

/obj/item/book/granter/crafting_recipe/blueprint/r84
	name = "r84 lmg blueprint"
	icon_state = "blueprint2"
	crafting_recipe_types = list(/datum/crafting_recipe/lmg)

/obj/item/book/granter/crafting_recipe/blueprint/service
	name = "service rifle blueprint"
	icon_state = "blueprint2"
	crafting_recipe_types = list(/datum/crafting_recipe/servicerifle)

/obj/item/book/granter/crafting_recipe/blueprint/combat
	name = "combat rifle blueprint"
	icon_state = "blueprint2"
	crafting_recipe_types = list(/datum/crafting_recipe/combatrifle)

/obj/item/book/granter/crafting_recipe/blueprint/aep7
	name = "aep7 blueprint"
	icon_state = "blueprint2"
	crafting_recipe_types = list(/datum/crafting_recipe/AEP7)

/obj/item/book/granter/crafting_recipe/blueprint/leveraction
	name = "lever action shotgun blueprint"
	icon_state = "blueprint2"
	crafting_recipe_types = list(/datum/crafting_recipe/lever_action)

/obj/item/book/granter/crafting_recipe/blueprint/trailcarbine
	name = "trail carbine blueprint"
	icon_state = "blueprint2"
	crafting_recipe_types = list(/datum/crafting_recipe/trail_carbine)

/obj/item/book/granter/crafting_recipe/blueprint/thatgun
	name = ".223 pistol blueprint"
	icon_state = "blueprint2"
	crafting_recipe_types = list(/datum/crafting_recipe/thatgun)

/obj/item/book/granter/crafting_recipe/blueprint/pps
	name = "ppsh41 blueprint"
	icon_state = "blueprint2"
	crafting_recipe_types = list(/datum/crafting_recipe/pps)

/*
/obj/item/book/granter/crafting_recipe/blueprint/mg34
	name = "mg34 blueprint"
	icon_state = "blueprint2"
	crafting_recipe_types = list(/datum/crafting_recipe/mg34)
*/

/obj/item/book/granter/crafting_recipe/blueprint/plasmapistol
	name = "plasma pistol blueprint"
	icon_state = "blueprint2"
	crafting_recipe_types = list(/datum/crafting_recipe/plasmapistol)

/obj/item/book/granter/crafting_recipe/blueprint/uzi
	name = "mini uzi blueprint"
	icon_state = "blueprint2"
	crafting_recipe_types = list(/datum/crafting_recipe/uzi)

/obj/item/book/granter/crafting_recipe/blueprint/smg10mm
	name = "10mm smg blueprint"
	icon_state = "blueprint2"
	crafting_recipe_types = list(/datum/crafting_recipe/smg10mm)

/obj/item/book/granter/crafting_recipe/blueprint/greasegun
	name = "m3a1 grease gun blueprint"
	icon_state = "blueprint2"
	crafting_recipe_types = list(/datum/crafting_recipe/grease_gun)

/obj/item/book/granter/crafting_recipe/blueprint/brushgun
	name = "brush gun blueprint"
	icon_state = "blueprint2"
	crafting_recipe_types = list(/datum/crafting_recipe/brush)

/obj/item/book/granter/crafting_recipe/blueprint/r91
	name = "r91 assault rifle blueprint"
	icon_state = "blueprint2"
	crafting_recipe_types = list(/datum/crafting_recipe/r91)

/obj/item/book/granter/crafting_recipe/blueprint/r91/legion
	name = "pilum rifle blueprint"
	icon_state = "blueprint2"
	crafting_recipe_types = list(/datum/crafting_recipe/r91/legion)

/obj/item/book/granter/crafting_recipe/blueprint/breacher
	name = "breacher shotgun blueprint"
	icon_state = "blueprint2"
	crafting_recipe_types = list(/datum/crafting_recipe/breacher)

/obj/item/book/granter/crafting_recipe/blueprint/sniper
	name = "sniper rifle blueprint"
	icon_state = "blueprint2"
	crafting_recipe_types = list(/datum/crafting_recipe/sniper)

/obj/item/book/granter/crafting_recipe/blueprint/deagle
	name = "desert eagle blueprint"
	icon_state = "blueprint2"
	crafting_recipe_types = list(/datum/crafting_recipe/deagle)

/obj/item/book/granter/crafting_recipe/blueprint/aer9
	name = "aer9 blueprint"
	icon_state = "blueprint2"
	crafting_recipe_types = list(/datum/crafting_recipe/AER9)

/obj/item/book/granter/crafting_recipe/blueprint/plasmarifle
	name = "plasma rifle blueprint"
	icon_state = "blueprint2"
	crafting_recipe_types = list(/datum/crafting_recipe/plasmarifle)

/obj/item/book/granter/crafting_recipe/blueprint/p94
	name = "p94 plasma rifle blueprint"
	icon_state = "blueprint2"
	crafting_recipe_types = list(/datum/crafting_recipe/p94)

/obj/item/book/granter/crafting_recipe/blueprint/tribeam
	name = "tribeam laser rifle blueprint"
	icon_state = "blueprint2"
	crafting_recipe_types = list(/datum/crafting_recipe/tribeam)

/obj/item/book/granter/crafting_recipe/blueprint/am_rifle
	name = "anti-materiel rifle blueprint"
	icon_state = "blueprint2"
	crafting_recipe_types = list(/datum/crafting_recipe/am_rifle)

/obj/item/book/granter/crafting_recipe/blueprint/citykiller
	name = "citykiller blueprint"
	icon_state = "blueprint2"
	crafting_recipe_types = list(/datum/crafting_recipe/city_killer)

/obj/item/book/granter/crafting_recipe/blueprint/rangemaster
	name = "colt rangemaster blueprint"
	icon_state = "blueprint2"
	crafting_recipe_types = list(/datum/crafting_recipe/rangemaster)

/obj/item/book/granter/crafting_recipe/blueprint/bozar
	name = "bozar blueprint"
	icon_state = "blueprint2"
	crafting_recipe_types = list(/datum/crafting_recipe/bozar)

/obj/item/book/granter/crafting_recipe/blueprint/m1garand
	name = "battle rifle blueprint"
	icon_state = "blueprint2"
	crafting_recipe_types = list(/datum/crafting_recipe/m1garand)

/obj/item/book/granter/crafting_recipe/blueprint/infiltrator
	name = "infiltrator blueprint"
	icon_state = "blueprint2"
	crafting_recipe_types = list(/datum/crafting_recipe/infiltrator)

/obj/item/book/granter/crafting_recipe/blueprint/scoutcarbine
	name = "scout carbine blueprint"
	icon_state = "blueprint2"
	crafting_recipe_types = list(/datum/crafting_recipe/scoutcarbine)

/obj/item/book/granter/crafting_recipe/blueprint/wattz2k
	name = "wattz 2000 laser rifle blueprint"
	icon_state = "blueprint2"
	crafting_recipe_types = list(/datum/crafting_recipe/wattz2k)

/obj/item/book/granter/crafting_recipe/blueprint/type93
	name = "type93 assault rifle blueprint"
	icon_state = "blueprint2"
	crafting_recipe_types = list(/datum/crafting_recipe/type93)

/obj/item/book/granter/crafting_recipe/blueprint/bar
	name = "bar 1918 blueprint"
	icon_state = "blueprint2"
	crafting_recipe_types = list(/datum/crafting_recipe/bar)

/obj/item/book/granter/trait/lowsurgery
	name = "Surgery for Wastelanders"
	desc = "A useful book on surgery."
	oneuse = TRUE
	granted_trait = TRAIT_SURGERY_LOW
	traitname = "minor surgery"
	remarks = list("Don't forget your instruments inside patients...", "Be careful when cutting...", "Don't operate with dirty hands...")

/obj/item/book/granter/trait/midsurgery
	name = "Surgery for Experts"
	desc = "A useful book on surgery."
	oneuse = TRUE
	granted_trait = TRAIT_SURGERY_MID
	traitname = "intermediate surgery"
	remarks = list("Don't forget your instruments inside patients...", "Be careful when cutting...", "Don't operate with dirty hands...")

/obj/item/book/granter/trait/highsurgery
	name = "Advanced Surgery Manual"
	desc = "A very useful book on surgery."
	oneuse = TRUE
	granted_trait = TRAIT_SURGERY_HIGH
	traitname = "advanced surgery"
	remarks = list("Negligence lawsuits are bad for buisness...", "Chlorine gas is not a healthy sedative...", "Pharmacists are just drug dealers with a license...")

/obj/item/book/granter/trait/spirit_teachings
	name = "Teachings of the Machine Spirits"
	desc = "A book all about tribal life among the Machine Spirits."
	icon_state = "ms_teachings"
	oneuse = TRUE
	granted_trait = TRAIT_MACHINE_SPIRITS
	traitname = "The Machine Spirits"
	remarks = list("There are five Machine Spirits...", "Each govern an aspect of life...", "Always respect the Machine Spirits", "Never use them for selfish reasons", "Honor and love those blessed by the machine spirits.")

/obj/item/book/granter/trait/mars_teachings
	name = "Teachings of Mars"
	desc = "A book all about Mars and the teachings he gives to the wise."
	icon_state = "mars_teachings"
	oneuse = TRUE
	granted_trait = TRAIT_MARS_TEACH
	traitname = "Mars' Teachings"
	remarks = list("Remember the aeternit imperi of the Caesar's Legion...", "Do not abuse the knowledge of Mars to break his will, or be broken...", "Remember: In hoc signo taurus vinces.")

/obj/item/book/granter/trait/techno
	name = "Craftsmanship Monthly"
	desc = "A book on how to use advanced tools and production machinery. It's pretty complicated."
	oneuse = TRUE
	granted_trait = TRAIT_TECHNOPHREAK
	traitname = "craftsmanship"
	remarks = list("Try turning it off and on again...", "Always craft in good form.", "Don't forget PPE.", "Keep your mechanisms OILED.", "Stay organized.")

/obj/item/book/granter/trait/pa_wear
	name = "Advanced Armor and You"
	desc = "An in-depth look into how power armor functions."
	oneuse = TRUE
	granted_trait = TRAIT_PA_WEAR
	traitname = "Power Armor"
	remarks = list("Don't forget to do daily maintenance...","Keep your armor well guarded..","Slow and steady wins the race...","Positioning is important while moving slow...","Tired? Take a nap in your suit...","Saftey comes first when wearing your gear...")

/obj/item/book/granter/trait/trekking
	name = "Ranger's Guide to the Wasteland"
	desc = "An extensive guide about trekking through the wastes. Written by Allesandra Hall, former NCR Ranger."
	oneuse = TRUE
	granted_trait = TRAIT_HARD_YARDS
	traitname = "trekking"
	remarks = list("It never hurts to take the road less traveled...", "Proper movement is key to your survival...", "Whether during combat or for simple travel, the desert can be your friend...", "Without proper knowledge, it can be hard to traverse the desert on foot...", "A Ranger is always prepared...")

/*
/obj/item/book/granter/trait/iron_fist
	name = "Brawler's Guide to Fisticuffs"
	desc = "An advanced manual on fistfighting. It has pictures, too!"
	oneuse = TRUE
	granted_trait = TRAIT_IRONFIST
	traitname = "punching"
	remarks = list("Keep your fists up...", "Don't clench your thumb in your fist, or you might break it...", "Turn into your punch, and put your body weight behind it...", "Footwork is everything, make sure to step into your punches...", "Aim for their jaw for an easy K-O...")
*/

/obj/item/book/granter/trait/big_leagues
	name = "Swatters Guide to Hard-Hitting Homeruns"
	desc = "A manual on how to maximize one's potential at scoring that well-needed homerun! Complete with 1950s styled baseball ads."
	oneuse = TRUE
	granted_trait = TRAIT_BIG_LEAGUES
	traitname = "hitting things"
	remarks = list("Line up your bat...", "Judge target travel speed...", "Buy a premium swatter to maximize ball hit rate - or to break skulls...", "Apply blunt object to head...")

/obj/item/book/granter/trait/chem_user
	name = "Cook-Cook's guide to enjoying your cook-up"
	desc = "A manual on how to take chems and not suffer too many adverse effects."
	oneuse = TRUE
	granted_trait = TRAIT_CHEM_USER
	traitname = "chem use"
	remarks = list("Clean your needles...", "Ensure you have quality product...", "Don't mix drugs...", "Only buy from trusted dealers...")

/obj/item/book/granter/trait/chemistry
	name = "Chemistry for Wastelanders"
	desc = "A useful book on chemistry."
	oneuse = TRUE
	granted_trait = TRAIT_CHEMWHIZ
	traitname = "chemistry"
	remarks = list("Always have a safe working environment...", "Don't give chems to strangers...", "Never drink any chemicals straight from the dispenser...", "Always wear your labcoat...", "Never forget your goggles...")
	var/crafting_recipe_types = list(/datum/crafting_recipe/jet, /datum/crafting_recipe/turbo, /datum/crafting_recipe/psycho, /datum/crafting_recipe/medx, /datum/crafting_recipe/buffout)

/obj/item/book/granter/trait/demolitions
	name = "Anarchist's Cookbook"
	desc = "A manual on how to construct homemade explosives without losing your fingers, now with pictures."
	oneuse = TRUE
	granted_trait = TRAIT_DEMOLITION_EXPERT
	traitname = "explosives"
	remarks = list("Have a sturdy table...", "Ensure you have quality ingredients...", "Don't do this while drunk...", "Make sure you aren't watched...")
	var/crafting_recipe_types = list(/datum/crafting_recipe/explosive/chemical, /datum/crafting_recipe/explosive/dynamite, /datum/crafting_recipe/explosive/frag, /datum/crafting_recipe/explosive/explosive, /datum/crafting_recipe/explosive/nitro, /datum/crafting_recipe/explosive/flashbang, /datum/crafting_recipe/explosive/smoke, /datum/crafting_recipe/explosive/emp, /datum/crafting_recipe/explosive/c4, /datum/crafting_recipe/explosive/c4chem)



/obj/item/book/granter/trait/selection
	name = "Private Diary"
	desc = "Your private diary, reminding you of the knowledge you previously had."
	granted_trait = null

/obj/item/book/granter/trait/selection/attack_self(mob/user)
	var/list/choices = list("Hard Yards","Minor Surgery","Power Armor","Chemistry","Salvager","Melee Expert", "Tinkerer", "Iron Fist", "Explosive Expert")
	if(granted_trait == null)
		var/choice = input("Choose a trait:") in choices
		switch(choice)
			if(null)
				return 0
			if("Hard Yards")
				granted_trait = TRAIT_HARD_YARDS
				traitname = "trekking"
			if("Minor Surgery")
				granted_trait = TRAIT_SURGERY_LOW
				traitname = "minor surgery"
			if("Chemistry")
				qdel(src)
				user.put_in_hands(new /obj/item/book/granter/trait/chemistry)
				return
			if("Salvager")
				granted_trait = TRAIT_TECHNOPHREAK
				traitname = "salvaging"
			if("Melee Expert")
				granted_trait = TRAIT_BIG_LEAGUES
				traitname = "hitting things"
			if("Power Armor")
				granted_trait = TRAIT_PA_WEAR
				traitname = "advanced armor"
			if("Iron Fist")
				granted_trait = TRAIT_IRONFIST
				traitname = "punching"
			if("Explosive Expert")
				qdel(src)
				user.put_in_hands(new /obj/item/book/granter/trait/demolitions)
				return
	else
		. = ..()

/obj/item/book/granter/trait/selection/Initialize()
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, TRAIT_GENERIC)


/obj/item/book/granter/trait/selection/waster

/obj/item/book/granter/trait/selection/waster/attack_self(mob/user)
	var/list/choices = list("Minor Surgery","Chemistry","Salvager", "Tinkerer", "Chem User")
	if(granted_trait == null)
		var/choice = input("Choose a trait:") in choices
		switch(choice)
			if(null)
				return 0
			if("Minor Surgery")
				granted_trait = TRAIT_SURGERY_LOW
				traitname = "minor surgery"
			if("Chemistry")
				qdel(src)
				user.put_in_hands(new /obj/item/book/granter/trait/chemistry)
				return
			if("Salvager")
				granted_trait = TRAIT_TECHNOPHREAK
				traitname = "salvaging"
			if("Chem User")
				granted_trait = TRAIT_CHEM_USER
				traitname = "chem use"
	else
		. = ..()

/obj/item/book/granter/trait/selection/waster/Initialize()
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, TRAIT_GENERIC)

/* Since these books did not disappear after reading, replaced with a version that uses the standard format for now. Keep this subtype?

/obj/item/book/granter/trait/crafting
	var/list/crafting_recipe_types = list()

/obj/item/book/granter/trait/crafting/on_reading_finished(mob/user)
	to_chat(user, SPAN_NOTICE("You finish reading [name]!"))
	to_chat(user, SPAN_NOTICE("You feel like you've got a good handle on [traitname]!"))
	ADD_TRAIT(user, granted_trait, BOOK_TRAIT)
	if(!user.mind)
		return
	for(var/crafting_recipe_type in crafting_recipe_types)
		var/datum/crafting_recipe/R = crafting_recipe_type
		user.mind.teach_crafting_recipe(crafting_recipe_type)
		to_chat(user,SPAN_NOTICE("You learned how to make [initial(R.name)]."))


/obj/item/book/granter/trait/crafting/chemistry
	name = "Chemistry for Wastelanders"
	desc = "A useful book on chemistry."
	oneuse = TRUE
	granted_trait = TRAIT_CHEMWHIZ
	traitname = "chemistry"
	remarks = list("Always have a safe working environment...", "Don't give chems to strangers...", "Never drink any chemicals straight from the dispenser...", "Always wear your labcoat...", "Never forget your goggles...")
	crafting_recipe_types = list(/datum/crafting_recipe/jet, /datum/crafting_recipe/turbo, /datum/crafting_recipe/psycho, /datum/crafting_recipe/medx, /datum/crafting_recipe/buffout)

/obj/item/book/granter/trait/crafting/demolitions
	name = "Anarchist's Cookbook"
	desc = "A manual on how to construct homemade explosives without losing your fingers, now with pictures."
	oneuse = TRUE
	granted_trait = TRAIT_DEMOLITION_EXPERT
	traitname = "explosives"
	remarks = list("Have a sturdy table...", "Ensure you have quality ingredients...", "Don't do this while drunk...", "Make sure you aren't watched...")
	crafting_recipe_types = list(/datum/crafting_recipe/explosive/chemical, /datum/crafting_recipe/explosive/dynamite, /datum/crafting_recipe/explosive/frag, /datum/crafting_recipe/explosive/explosive, /datum/crafting_recipe/explosive/nitro, /datum/crafting_recipe/explosive/flashbang, /datum/crafting_recipe/explosive/smoke, /datum/crafting_recipe/explosive/emp, /datum/crafting_recipe/explosive/c4, /datum/crafting_recipe/explosive/c4chem)
*/
