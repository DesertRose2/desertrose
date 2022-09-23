#define WORKPIECE_PRESENT 1
#define WORKPIECE_INPROGRESS 2
#define WORKPIECE_FINISHED 3
#define WORKPIECE_SLAG 5

#define RECIPE_PICKAXE "bff" //bend fold fold
#define RECIPE_SHOVEL "buu" //bend upset upset
#define RECIPE_HAMMER "bpp" //bend punch punch
#define RECIPE_PROSPECTPICK "bfs" //bend fold shrink
#define RECIPE_KITCHENKNIFE "bsd" //bend shrink draw
#define RECIPE_CROWBAR "bbb" //bend bend bend

#define RECIPE_RING "sss" //shrink shrink shrink
#define RECIPE_BALLANDCHAIN "pbu" //punch bend upset

#define RECIPE_BOWIE "dds" //draw draw shrink
#define RECIPE_MACHETE "fdf" //fold draw fold
#define RECIPE_WAKI "ffsu" //fold fold shrink upset
#define RECIPE_MACE "uusp" //upset upset shrink punch
#define RECIPE_SABRE "ffdd" //fold fold draw draw

#define RECIPE_KATANA "fffff" //fold fold fold fold fold
#define RECIPE_AXE "uupp" //upset upset punch punch
#define RECIPE_SPEAR "dddf" //draw draw draw fold

#define RECIPE_JAVELIN "sdu" //shrink draw upset
#define RECIPE_THROWING  "sdd" //shrink draw draw
#define RECIPE_BOLA "suu" //shrink upset upset

//Tablevil specific
#define RECIPE_UNITOOL "bbb"  //bend bend bend
#define RECIPE_MACHREFORG "fdf" //fold draw fold
#define RECIPE_SWORD "ffdd" // fold fold draw draw
#define RECIPE_SAW "ffsu" //fold fold shrink upset
#define RECIPE_SCRAP "fffff" //fold fold fold fold fold
#define RECIPE_CRUSHER "uupp" //upset upset punch punch
#define RECIPE_TRIDENT "dddf" //draw draw draw fold

//Legion specific
#define RECIPE_DAGGER "dds" //draw draw shrink
#define RECIPE_GLADIUS "fdf" //fold draw fold
#define RECIPE_SPATHA "ffdd" // fold fold draw draw
#define RECIPE_LONGSWORD "fffff" //fold fold fold fold fold
#define RECIPE_WARAXE "uupp" //upset upset punch punch
#define RECIPE_LANCE "dddf" //draw draw draw fold

/obj/structure/anvil
	name = "anvil"
	desc = "Base class of anvil. This shouldn't exist, but is useable."
	icon = 'code/modules/smithing/icons/blacksmith.dmi'
	icon_state = "anvil"
	density = TRUE
	anchored = TRUE
	light_range = 2
	light_power = 0
	light_color = LIGHT_COLOR_FIRE
	var/light_on = FALSE
	var/busy = FALSE //If someone is already interacting with this anvil
	var/workpiece_state = FALSE
	var/datum/material/workpiece_material
	var/anvilquality = 0
	var/currentquality = 0 //lolman? what the fuck do these vars do?
	var/currentsteps = 0 //even i don't know
	var/outrightfailchance = 1 //todo: document this shit
	var/stepsdone = ""
	var/rng = FALSE
	var/debug = FALSE //vv this if you want an artifact
	var/artifactrolled = FALSE
	var/itemqualitymax = 10
	var/list/smithrecipes = list(RECIPE_HAMMER = /obj/item/smithing/hammerhead,
	RECIPE_SHOVEL = /obj/item/smithing/shovelhead,
	RECIPE_PICKAXE = /obj/item/smithing/pickaxehead,
	RECIPE_PROSPECTPICK = /obj/item/smithing/prospectingpickhead,
	RECIPE_KITCHENKNIFE = /obj/item/smithing/knifeblade,
	RECIPE_CROWBAR = /obj/item/smithing/crowbar,
	RECIPE_RING = /obj/item/smithing/special/jewelry/ring,
	RECIPE_BALLANDCHAIN = /obj/item/smithing/ballandchain,
	RECIPE_BOWIE = /obj/item/smithing/bowieblade,
	RECIPE_MACHETE = /obj/item/smithing/macheteblade,
	RECIPE_SABRE = /obj/item/smithing/sabreblade,
	RECIPE_WAKI = /obj/item/smithing/wakiblade,
	RECIPE_KATANA = /obj/item/smithing/katanablade,
	RECIPE_MACE = /obj/item/smithing/macehead,
	RECIPE_AXE = /obj/item/smithing/axehead,
	RECIPE_SPEAR = /obj/item/smithing/spearhead,
	RECIPE_JAVELIN = /obj/item/smithing/javelinhead,
	RECIPE_THROWING = /obj/item/smithing/throwingknife,
	RECIPE_BOLA = /obj/item/smithing/bola,	
)

/obj/structure/anvil/Initialize()
	. = ..()
	currentquality = anvilquality

/obj/structure/anvil/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/blacksmith/ingot))
		var/obj/item/blacksmith/ingot/notsword = I
		if(workpiece_state)
			to_chat(user, "There's already a workpiece! Finish it or take it off.")
			return FALSE
		if(notsword.workability == "shapeable")
			workpiece_state = WORKPIECE_PRESENT
			workpiece_material = notsword.custom_materials
			to_chat(user, "You place the [notsword] on the [src].")
			currentquality = anvilquality
			var/skillmod = 4
			if(workpiece_state == WORKPIECE_PRESENT)
				add_overlay(image(icon= 'code/modules/smithing/icons/blacksmith.dmi',icon_state="workpiece"))
				set_light(l_power = GLOW_MODERATE)
			if(user.mind.skill_holder)
				skillmod = user.mind.get_skill_level(/datum/skill/level/dwarfy/blacksmithing)/2
			currentquality += skillmod
			qdel(notsword)
		else
			to_chat(user, "The ingot isn't workable yet!")
			return FALSE
		return
	else if(istype(I, /obj/item/melee/smith/hammer))
		var/obj/item/melee/smith/hammer/hammertime = I
		if(!(workpiece_state == WORKPIECE_PRESENT || workpiece_state == WORKPIECE_INPROGRESS))
			to_chat(user, "You can't work an empty anvil!")
			return FALSE
		var/mob/living/carbon/human/F = user
		if(busy)
			to_chat(user, "This anvil is already being worked!")
			return FALSE
		if(F.busy)
			to_chat(user, "You are already working another anvil!")
			return FALSE
		do_shaping(user, hammertime.qualitymod)
		return
	else if(istype(I, /obj/item/twohanded/sledgehammer/simple))
		var/obj/item/twohanded/sledgehammer/simple/hammertime = I
		if(!(workpiece_state == WORKPIECE_PRESENT || workpiece_state == WORKPIECE_INPROGRESS))
			to_chat(user, "You can't work an empty anvil!")
			return FALSE
		var/mob/living/carbon/human/F = user
		if(busy)
			to_chat(user, "This anvil is already being worked!")
			return FALSE
		if(F.busy)
			to_chat(user, "You are already working another anvil!")
			return FALSE
		do_shaping(user, hammertime.qualitymod)
		return
	return ..()


/obj/structure/anvil/proc/do_shaping(mob/user, qualitychange)
	var/mob/living/carbon/human/F = user
	F.busy = TRUE
	busy = TRUE
	currentquality += qualitychange
	var/list/shapingsteps = list("weak hit", "strong hit", "heavy hit", "fold", "draw", "shrink", "bend", "punch", "upset") //weak/strong/heavy hit affect quality. All the other steps shape.
	workpiece_state = WORKPIECE_INPROGRESS
	var/stepdone = input(user, "How would you like to work the metal?") in shapingsteps
	var/steptime = 35
	switch(stepdone)
		if("weak hit")
			playsound(src, 'code/modules/smithing/sound/anvil_weak.ogg',100)
			user.visible_message("<span class='notice'>[user] carefully hammers out imperfections in the metal.</span>", \
						"<span class='notice'>You carefully hammer out imperfections in the metal.</span>")
		if("strong hit")
			playsound(src, 'code/modules/smithing/sound/anvil_strong.ogg',80)
			do_smithing_sparks(1, TRUE, src) 
			user.visible_message("<span class='notice'>[user] hammers out imperfections in the metal.</span>", \
						"<span class='notice'>You hammer out imperfections in the metal.</span>")
		if("heavy hit")
			playsound(src, 'code/modules/smithing/sound/anvil_heavy.ogg',90)
			do_smithing_sparks(2, TRUE, src) 
			user.visible_message("<span class='notice'>[user] forcefully hammers out imperfections in the metal.</span>", \
						"<span class='notice'>You forcefuly hammer out imperfections in the metal.</span>")
		if("fold")
			playsound(src, 'code/modules/smithing/sound/anvil_double1.ogg',90)
			do_smithing_sparks(1, TRUE, src) 
			user.visible_message("<span class='notice'>[user] folds the metal.</span>", \
						"<span class='notice'>You fold the metal.</span>")
		if("draw")
			playsound(src, 'code/modules/smithing/sound/anvil_double2.ogg',90)
			do_smithing_sparks(1, TRUE, src) 
			user.visible_message("<span class='notice'>[user] hammers both sides of the metal, drawing it out.</span>", \
						"<span class='notice'>You hammer both sides of the metal, drawing it out.</span>")
		if("shrink")
			playsound(src, 'code/modules/smithing/sound/anvil_rapid.ogg',110)
			do_smithing_sparks(1, TRUE, src)
			user.visible_message("<span class='notice'>[user] flattens the metal, shrinking it.</span>", \
						"<span class='notice'>You flatten the metal, shrinking it.</span>")
		if("bend")
			playsound(src, 'code/modules/smithing/sound/anvil_single1.ogg',80)
			do_smithing_sparks(1, TRUE, src) 
			user.visible_message("<span class='notice'>[user] bends the metal, using the rounded end of the anvil.</span>", \
						"<span class='notice'>You bend the metal, using the rounded end of the anvil.</span>")
		if("punch")
			playsound(src, 'code/modules/smithing/sound/anvil_single2.ogg',90)
			do_smithing_sparks(1, TRUE, src) 
			user.visible_message("<span class='notice'>[user] uses the puncher to make holes in the metal.</span>", \
						"<span class='notice'>You use the puncher to make holes in the metal.</span>")
		if("upset")
			playsound(src, 'code/modules/smithing/sound/anvil_double3.ogg',90)
			do_smithing_sparks(1, TRUE, src) 
			user.visible_message("<span class='notice'>[user] upsets the metal by hammering the thick end.</span>", \
						"<span class='notice'>You upset the metal by hammering the thick end.</span>")
	if(!locate(src) in range(1, user))
		busy = FALSE
		F.busy = FALSE
		return FALSE
	if(user.mind.skill_holder)
		var/skillmod = user.mind.get_skill_level(/datum/skill/level/dwarfy/blacksmithing)/10 + 1
		steptime = 30 / skillmod
	if(!do_after(user, steptime, target = src))
		busy = FALSE
		F.busy = FALSE
		return FALSE
	switch(stepdone)
		if("weak hit")
			currentsteps += 1
			outrightfailchance += 5
			currentquality += 1
		if("strong hit")
			currentsteps += 2
			outrightfailchance += 9.5
			currentquality += 2
		if("heavy hit")
			currentsteps += 3
			outrightfailchance += 12.5
			currentquality += 3
		if("fold")
			stepsdone += "f"
			currentsteps += 1
			currentquality -= 1
		if("draw")
			stepsdone += "d"
			currentsteps += 1
			currentquality -= 1
		if("shrink")
			stepsdone += "s"
			currentsteps += 1
			currentquality -= 1
		if("bend")
			stepsdone += "b"
			currentsteps += 1
			currentquality -= 1
		if("punch")
			stepsdone += "p"
			currentsteps += 1
			currentquality -= 1
		if("upset")
			stepsdone += "u"
			currentsteps += 1
			currentquality -= 1
	if(length(stepsdone) >= 3)
		tryfinish(user)
	busy = FALSE
	F.busy = FALSE

/obj/structure/anvil/proc/tryfinish(mob/user)
	var/artifactchance = 0
	if(!artifactrolled)
		artifactchance = (1+(user.mind.get_skill_level(/datum/skill/level/dwarfy/blacksmithing)/4))/2500
		artifactrolled = TRUE
	var/artifact = max(prob(artifactchance), debug)
	var/finalfailchance = outrightfailchance
	if(user.mind.skill_holder)
		var/skillmod = user.mind.get_skill_level(/datum/skill/level/dwarfy/blacksmithing)/10 + 1
		finalfailchance = max(0, finalfailchance / skillmod) //lv 2 gives 20% less to fail, 3 30%, etc
	if((currentsteps > 10 || (rng && prob(finalfailchance))) && !artifact)
		to_chat(user, "<span class='warning'>You overwork the metal, causing it to turn into useless slag!</span>")
		cut_overlay(image(icon= 'code/modules/smithing/icons/blacksmith.dmi',icon_state="workpiece"))
		set_light(l_power = 0)
		var/turf/T = get_turf(src)
		workpiece_state = FALSE
		new /obj/item/stack/ore/slag(T)
		currentquality = anvilquality
		stepsdone = ""
		currentsteps = 0
		outrightfailchance = 1
		artifactrolled = FALSE
		if(user.mind.skill_holder)
			user.mind.auto_gain_experience(/datum/skill/level/dwarfy/blacksmithing, 30, 400, silent = FALSE)
	for(var/i in smithrecipes)
		if(i == stepsdone)
			var/turf/T = get_turf(src)
			var/obj/item/smithing/create = smithrecipes[stepsdone]
			var/obj/item/smithing/finisheditem = new create(T)
			to_chat(user, "You finish your [finisheditem]!")
			cut_overlay(image(icon= 'code/modules/smithing/icons/blacksmith.dmi',icon_state="workpiece"))
			set_light(l_power = 0)
			if(artifact)
				to_chat(user, "It is an artifact, a creation whose legacy shall live on forevermore.") 
				currentquality = max(currentquality, 2)
				finisheditem.quality = currentquality * 2
				finisheditem.artifact = TRUE
			else
				finisheditem.quality = min(currentquality, itemqualitymax)
			workpiece_state = FALSE
			finisheditem.set_custom_materials(workpiece_material)
			currentquality = anvilquality
			stepsdone = ""
			currentsteps = 0
			outrightfailchance = 1
			artifactrolled = FALSE
			if(user.mind.skill_holder)
				user.mind.auto_gain_experience(/datum/skill/level/dwarfy/blacksmithing, 100, 10000000, silent = FALSE)
			break


//////////////////////
//					//
//		ANVILS		//
//					//
//////////////////////

// Template
/obj/structure/anvil/obtainable
	name = "anvil template. Punish those who makes this appear."
	anvilquality = 0
	outrightfailchance = 5
	rng = TRUE

// Best base culture anvil, should be hard to find or make more
/obj/structure/anvil/obtainable/basic
	name = "anvil"
	desc = "Made from solid steel, you wont be moving this around any time soon."
	anvilquality = 1

// Don't make this craftable.
/obj/structure/anvil/obtainable/legion
	name = "anvil"
	desc = "A solid steel anvil with a stamped bull on it."
	icon_state = "legvil"
	anvilquality = 1
	anchored = TRUE
	smithrecipes = list(RECIPE_HAMMER = /obj/item/smithing/hammerhead,
	RECIPE_SHOVEL = /obj/item/smithing/shovelhead,
	RECIPE_PICKAXE = /obj/item/smithing/pickaxehead,
	RECIPE_PROSPECTPICK = /obj/item/smithing/prospectingpickhead,
	RECIPE_KITCHENKNIFE = /obj/item/smithing/knifeblade,
	RECIPE_CROWBAR = /obj/item/smithing/crowbar,
	RECIPE_RING = /obj/item/smithing/special/jewelry/ring,
	RECIPE_BALLANDCHAIN = /obj/item/smithing/ballandchain,
	RECIPE_DAGGER = /obj/item/smithing/daggerblade,
	RECIPE_GLADIUS =  /obj/item/smithing/gladiusblade,
	RECIPE_SPATHA = /obj/item/smithing/spathablade,
	RECIPE_MACE = /obj/item/smithing/macehead,
	RECIPE_WARAXE = /obj/item/smithing/waraxehead,
	RECIPE_LANCE = /obj/item/smithing/lancehead,
	RECIPE_JAVELIN = /obj/item/smithing/javelinhead,
	RECIPE_THROWING = /obj/item/smithing/throwingknife,
	RECIPE_BOLA = /obj/item/smithing/bola,
)

// Decent makeshift anvil, can break, mobile. Several unique products
/obj/structure/anvil/obtainable/table
	name = "table anvil"
	desc = "A reinforced table. Usable as an anvil, favored by mad wastelanders and the dregs of the wasteland. Can be loosened from its bolts and moved."
	icon_state = "tablevil"
	anvilquality = -1
	smithrecipes = list(RECIPE_HAMMER = /obj/item/smithing/hammerhead,
	RECIPE_SHOVEL = /obj/item/smithing/shovelhead,
	RECIPE_PICKAXE = /obj/item/smithing/pickaxehead,
	RECIPE_PROSPECTPICK = /obj/item/smithing/prospectingpickhead,
	RECIPE_KITCHENKNIFE = /obj/item/smithing/knifeblade,
	RECIPE_UNITOOL = /obj/item/smithing/unitool,
	RECIPE_RING = /obj/item/smithing/special/jewelry/ring,
	RECIPE_BALLANDCHAIN = /obj/item/smithing/ballandchain,
	RECIPE_BOWIE = /obj/item/smithing/bowieblade,
	RECIPE_MACHREFORG = /obj/item/smithing/macheterblade,
	RECIPE_SWORD = /obj/item/smithing/swordblade,
	RECIPE_MACE = /obj/item/smithing/macehead,
	RECIPE_SAW  = /obj/item/smithing/scrapsaw,
	RECIPE_SCRAP = /obj/item/smithing/scrapblade,
	RECIPE_CRUSHER = /obj/item/smithing/crusherhead,
	RECIPE_TRIDENT = /obj/item/smithing/tridenthead,
	RECIPE_JAVELIN = /obj/item/smithing/javelinhead,
	RECIPE_THROWING = /obj/item/smithing/throwingknife,
	RECIPE_BOLA = /obj/item/smithing/bola,
)

/obj/structure/anvil/obtainable/table/wrench_act(mob/living/user, obj/item/I)
	..()
	default_unfasten_wrench(user, I, 5)
	return TRUE


// Craftable anvil, base culture
/obj/structure/anvil/obtainable/sandstone
	name = "sandstone brick anvil"
	desc = "A big block of sandstone. Useable as an anvil."
	custom_materials = list(/datum/material/sandstone=8000)
	icon_state = "sandvil"
	anvilquality = 0

// Debug anvil
/obj/structure/anvil/debugsuper
	name = "super ultra epic anvil of debugging."
	desc = "WOW. A DEBUG <del>ITEM</DEL> STRUCTURE. EPIC."
	icon_state = "anvil"
	anvilquality = 10
	itemqualitymax = 20
	outrightfailchance = 0

#undef WORKPIECE_PRESENT
#undef WORKPIECE_INPROGRESS
#undef WORKPIECE_FINISHED
#undef WORKPIECE_SLAG
