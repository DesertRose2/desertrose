
// SMITHED ITEMS NOTES: The base items made from hammering the ingot is here. Code is adapted TG smithing module, some stuff added & changed, some formulas changed, new mechanics such as quenching and various light/sound stuff added.
// TG remnant stuff like the dwarf smithing thing, diamond sheets and ratvar etc remains but is not really supported. Logic of the code is : hammer on ingot, make base item, dip the base item in coolant, slap on finisher, and there you go, new item.
// Power level of weapons should be more or less in line with "normal" weapons, but the idea is to push in more amusing gimmicks. Quality should make a big difference but not be necessary to have maxed for the item to be useful.
// Items such as rings and the ball&chain are pretty basic, but can be expanded, and other suitable items adapted or new ones added. Point is to make smithing viable for not just weapons, at least some nice fluff.


//////////////////////////////////////////
//										//
//		SMITHED ITEMS BASE CODE			//
//										//
//////////////////////////////////////////


/obj/item/smithing
	name = "base class /obj/item/smithing"
	icon = 'code/modules/smithing/icons/blacksmith.dmi'
	icon_state = "unfinished"
	material_flags = MATERIAL_COLOR | MATERIAL_ADD_PREFIX
	var/quality = 0 //quality. Changed by the smithing process.
	var/obj/item/finishingitem = /obj/item/blacksmith/woodrod //What this item needs to be hit by to create finalitem
	var/obj/item/finalitem
	var/artifact = FALSE
	var/toohot = TRUE

/obj/item/smithing/Initialize()
	add_overlay(image(icon= 'code/modules/smithing/icons/blacksmith.dmi',icon_state="[icon_state]_hot"))
	update_icon()
	return ..()

/obj/item/smithing/proc/istempered()
	cut_overlay(image(icon= 'code/modules/smithing/icons/blacksmith.dmi',icon_state="[icon_state]_hot"))
	update_icon()
	return

/obj/item/smithing/attackby(obj/item/I, mob/user)
	if(toohot == TRUE)
		to_chat(user, "<span class='warning'>You need to quench the [src] before finishing it!</span>")
		return
	else if(istype(I, /obj/item/stack/sheet/leatherstrips))
		use(1)
		startfinish()
	else if(istype(I, finishingitem))
		qdel(I)
		startfinish()
	else
		return ..()

/obj/item/smithing/proc/startfinish()
	dofinish()

/obj/item/smithing/proc/dofinish()
	var/qualname
	switch(quality)
		if(-1000 to -5)
			qualname = "awful"
		if(-1000 to -2)
			qualname = "shoddy"
		if(-1000 to -1)
			qualname =  "poor"
		if(-1 to 1)
			qualname = "normal"
		if(10 to INFINITY)
			qualname = "legendary"
		if(7.5 to 10)
			qualname = "masterwork"
		if(5.5 to 7.5)
			qualname = "excellent"
		if(3.5 to 5.5)
			qualname = "good"
		if(0 to 3.5)
			qualname = "above-average"
	var/datum/material/mat = custom_materials[1]
	finalitem.set_custom_materials(custom_materials)
	mat = mat.name
	if(artifact)
		dwarfyartifact(finalitem, mat)
	else
		finalitem.name = "[qualname] [mat] [initial(finalitem.name)]"
	finalitem.forceMove(get_turf(src))
	qdel(src)




// -------- INGOTS -------- //

/obj/item/ingot
	name = "ingot"
	icon = 'code/modules/smithing/icons/blacksmith.dmi'
	icon_state = "ingot"
	material_flags = MATERIAL_COLOR | MATERIAL_ADD_PREFIX
	var/workability = 0
//	light_system = MOVABLE_LIGHT // added var TEMPORARY bc DR
	light_range = 2
	light_power = 0.75
	light_color = LIGHT_COLOR_FIRE
//	light_on = FALSE // added var TEMPORARY bc DR

/obj/item/ingot/on_attack_hand(mob/user)
	var/mob/living/carbon/human/H
	if(workability != "shapeable")
		set_light(0)   //TEMPORARY Dr code yep
		return ..()
	var/prot = 0
	if(ishuman(user))
		H = user
		if(H.gloves)
			var/obj/item/clothing/gloves/G = H.gloves
			if(G.max_heat_protection_temperature)
				prot = (G.max_heat_protection_temperature > 360)
		else
			prot = 0
	if(prot > 0 || HAS_TRAIT(user, TRAIT_RESISTHEAT) || HAS_TRAIT(user, TRAIT_RESISTHEATHANDS))
		to_chat(user, "<span class='notice'>You pick up the [src].</span>")
		return ..()
	else
		to_chat(user, "<span class='warning'>You try to move the [src], but you burn your hand on it!</span>")
	if(H)
		var/obj/item/bodypart/affecting = H.get_bodypart("[(user.active_hand_index % 2 == 0) ? "r" : "l" ]_arm")
		if(affecting && affecting.receive_damage( 0, 5 ))		// 5 burn damage
			H.update_damage_overlays()
		var/list/hand_items = list(H.get_active_held_item(),H.get_inactive_held_item())
		if(src in hand_items)
			H.dropItemToGround(src)

/obj/item/ingot/iron
	custom_materials = list(/datum/material/iron=12000)

/obj/item/ingot/diamond
	custom_materials = list(/datum/material/diamond=12000) //yeah ok

/obj/item/ingot/uranium
	custom_materials = list(/datum/material/uranium=12000)

/obj/item/ingot/plasma
	custom_materials = list(/datum/material/plasma=12000)//yeah ok

/obj/item/ingot/gold
	custom_materials = list(/datum/material/gold=12000)

/obj/item/ingot/silver
	custom_materials = list(/datum/material/silver=12000)

/obj/item/ingot/titanium
	custom_materials = list(/datum/material/titanium=12000)

// Adapted to suit FO so it can be used.
/obj/item/ingot/adamantine
	custom_materials = list(/datum/material/adamantine=12000)
	name = "pre-war steel ingot"
	desc = "Top quality alloyed steel from the old world."
	material_flags = MATERIAL_COLOR

/obj/item/ingot/cult
	custom_materials = list(/datum/material/runedmetal=12000)

/obj/item/ingot/bronze
	custom_materials = list(/datum/material/bronze=12000)

/obj/item/ingot/ratvar
	custom_materials = list(/datum/material/brass=12000)
	desc = "On closer inspection, what appears to be wholly-unsuitable-for-smithing brass is actually primarily replicant alloy. Nezbere must have switched it while you weren't looking."


//////////////////////////////////
//								//
//		BLACKSMITH FINISHERS	//
//								//
//////////////////////////////////

// Root item code
/obj/item/blacksmith
	icon = 'code/modules/smithing/icons/blacksmith.dmi'
	righthand_file = 'code/modules/smithing/icons/onmob/righthand.dmi'
	lefthand_file = 'code/modules/smithing/icons/onmob/lefthand.dmi'
	max_integrity = 50
	w_class = WEIGHT_CLASS_SMALL

// Stick can be made by using a sharp tool on a piece of wood, less time wasted in crafting menu
/obj/item/blacksmith/woodrod
	name = "wooden rod"
	desc = "It's a rod, suitable for use of a handle of a tool. Also could serve as a weapon, in a pinch."
	icon_state = "woodrod"
	force = 7
	resistance_flags = FLAMMABLE

// Using leather strips on a wooden rod to make a sword handle TO DO : make leather strip consumed. Put in hand when done.
/obj/item/blacksmith/woodrod/attackby/(obj/item/W, mob/user, params)
	if (istype(W, /obj/item/stack/sheet/leatherstrips))
		user.visible_message("[user] begins finishing the [src] into a sword handle.", \
				"<span class='notice'>You begin wrapping the [src] with leather strips, and shaping the wood into a sword handle.</span>", \
				"<span class='italics'>You hear faint sounds of handcrafting.</span>")
		// 6 Second Timer
		if(!do_after(user, 40, TRUE, src))
			return
		// Make stick
		var/obj/item/blacksmith/swordhandle/new_item = new(user.loc)
		user.visible_message("[user] finishes making a sword handle from the [src].", \
				"<span class='notice'>You finish making a sword handle from the [src].</span>")
		qdel(src)
		// Prepare to Put xin Hands (if holding wood)
		var/obj/item/stack/sheet/leatherstrips/N = src
		var/replace = (user.get_inactive_held_item() == N)
		// Use up the strips
		N.use(1)
		// If stack depleted, put item in that hand (if it had one)
		if (!N && replace)
			user.put_in_hands(new_item)
	else
		. = ..()


/obj/item/blacksmith/swordhandle
	name = "sword handle"
	desc = "It's a wooden handle with leather strips, making it comfortable to hold."
	icon_state = "swordhandle"
	resistance_flags = FLAMMABLE

/obj/item/blacksmith/chain
	name = "length of chain"
	desc = "It rattles and is pretty useless when not attached to stuff"
	icon_state = "chain"


//////////////////////////////
//							//
//  	SMITHED TOOLS		//
//							//
//////////////////////////////


// -------- HAMMER AND SHOVEL -------- //

/obj/item/smithing/hammerhead
	name = "smithed hammer head"
	finalitem = /obj/item/melee/smith/hammer
	icon_state = "hammer"

/obj/item/smithing/hammerhead/startfinish()
	var/obj/item/melee/smith/hammer/finalforreal = new /obj/item/melee/smith/hammer(src)
	finalforreal.force += quality/2
	finalforreal.qualitymod = quality/2
	finalitem = finalforreal
	..()

/obj/item/smithing/shovelhead
	name = "smithed shovel head"
	finalitem = /obj/item/shovel/smithed
	icon_state = "shovel"

/obj/item/smithing/shovelhead/startfinish()
	finalitem = new /obj/item/shovel/smithed(src)
	finalitem.force += quality/2
	if(quality > 0)
		finalitem.toolspeed = max(0.05,(1-(quality/10)))
	else
		finalitem.toolspeed *= max(1, (quality * -1))
	..()

/obj/item/smithing/pickaxehead
	name = "smithed pickaxe head"
	finalitem = /obj/item/pickaxe/smithed
	icon_state = "pickaxe"

/obj/item/smithing/pickaxehead/startfinish()
	var/obj/item/pickaxe/smithed/finalforreal = new /obj/item/pickaxe/smithed(src)
	finalforreal.force += quality/2
	if(quality > 0)
		finalforreal.toolspeed = max(0.05,(1-(quality/10)))
	else
		finalforreal.toolspeed *= max(1, (quality * -1))
	switch(quality)
		if(10 to INFINITY)
			finalforreal.digrange = 2
		if(5 to 9)
			finalforreal.digrange = 2
		if(3,4)
			finalforreal.digrange = 1
		else
			finalforreal.digrange = 1
	finalitem = finalforreal
	..()

/obj/item/smithing/prospectingpickhead
	name = "smithed prospector's pick head"
	icon_state = "prospect_smith"
	finalitem = /obj/item/mining_scanner/prospector
	var/cooldown = null
	var/range = null


/obj/item/smithing/prospectingpickhead/startfinish()
	var/obj/item/mining_scanner/prospector/finalforreal = new /obj/item/mining_scanner/prospector(src)
	finalforreal.range = 2 + quality
	if(quality)
		finalforreal.cooldown = 100/quality
	finalforreal.force += quality
	finalitem = finalforreal
	..()

// -------- CROWBARS -------- //

/obj/item/smithing/crowbar
	name = "unwrapped crowbar"
	desc = "Wrap with leather strips."
	icon_state = "crowbar_smith"
	finishingitem = /obj/item/stack/sheet/leatherstrips
	finalitem = /obj/item/crowbar/smithed

/obj/item/smithing/crowbar/startfinish()
	var/obj/item/crowbar/smithed/finalforreal = new /obj/item/crowbar/smithed(src)
	finalforreal.force += quality
	if(quality > 0)
		finalforreal.toolspeed = max(0.05,(1-(quality/10)))
	else
		finalforreal.toolspeed *= max(1, (quality * -1))	
	finalitem = finalforreal
	..()

// TO DO : Force isnt changed by quality as its supposed to.
/obj/item/smithing/unitool
	name = "unwrapped universal tool"
	desc = "Wrap with leather strips."
	icon_state = "unitool_smith"
	finishingitem = /obj/item/stack/sheet/leatherstrips
	finalitem = /obj/item/crowbar/smithedunitool

/obj/item/smithing/unitool/startfinish()
	var/obj/item/crowbar/smithedunitool/finalforreal = new /obj/item/crowbar/smithedunitool(src)
	finalforreal.force += quality
	finalitem = finalforreal
	..()

// -------- KITCHEN KNIFE -------- // ISSUE


/obj/item/smithing/knifeblade
	name = "smithed knife blade"
	icon_state = "knife_smith"
	finishingitem = /obj/item/blacksmith/swordhandle
	finalitem = /obj/item/kitchen/knife/smithed

/obj/item/smithing/knifeblade/startfinish()
	var/obj/item/kitchen/knife/smithed/finalforreal = new /obj/item/kitchen/knife/smithed(src)
	finalforreal.force += quality*2
	finalitem = finalforreal
	..()

//////////////////////////////////////////////////
//												//
//  	BLING - smithed and finished both		//
//												//
//////////////////////////////////////////////////

/obj/item/smithing/special
	mob_overlay_icon = 'code/modules/smithing/icons/onmob/slot.dmi'
	gender = NEUTER
	w_class = WEIGHT_CLASS_SMALL

/obj/item/smithing/special/jewelry
	icon_state = "ring"
	item_state = "ring"
	strip_delay = 20
	equip_delay_other = 40
	var/strip_mod = 1 //how much they alter stripping items time by, higher is quicker
	var/strip_silence = TRUE
//	var/mood_event_on_equip = /datum/mood_event/equipped_ring/gold TEMPORARY commented out due to DR code out of date

/obj/item/smithing/special/jewelry/ring
	name = "ring"
	slot_flags = ITEM_SLOT_GLOVES
	attack_verb = list("proposed")

/*  TEMPORARY commented out due to outdated DR code
/obj/item/smithing/special/jewelry/ring/equipped(mob/user, slot)
	. = ..()
	if (slot == SLOT_GLOVES && istype(user))
		SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "ringbuff", mood_event_on_equip)
	else
		SEND_SIGNAL(user, COMSIG_CLEAR_MOOD_EVENT, "ringbuff")

/obj/item/smithing/special/jewelry/ring/dropped(mob/user)
	. = ..()
	SEND_SIGNAL(user, COMSIG_CLEAR_MOOD_EVENT, "ringbuff")
*/

/obj/item/smithing/ballandchain
	name = "unchained ball"
	desc = "Finish by attaching a chain to it."
	icon_state = "ball"
	finishingitem = /obj/item/blacksmith/chain
	finalitem = /obj/item/clothing/shoes/ballandchain

/obj/item/smithing/ballandchain/startfinish()
	var/obj/item/smithing/ballandchain/finalforreal = new /obj/item/clothing/shoes/ballandchain(src)
	finalitem = new /obj/item/clothing/shoes/ballandchain(src)
	finalforreal.force += quality*2
	finalitem = finalforreal
	finalitem.icon = 'code/modules/smithing/icons/blacksmith.dmi'
	finalitem.icon_state = "ballandchain"
	finalitem.name = "ball and chain"
	finalitem.desc = "Clamp it on the prisoners bare feet. They won't be able to remove it themselves."
	finalitem.material_flags = MATERIAL_COLOR | MATERIAL_AFFECT_STATISTICS
	..()


// -------- 1-H WEAPONS -------- //

/obj/item/smithing/daggerblade
	name = "smithed dagger blade"
	icon_state = "dagger_smith"
	finishingitem = /obj/item/blacksmith/swordhandle
	finalitem = /obj/item/melee/smith/dagger

/obj/item/smithing/daggerblade/startfinish()
	finalitem = new /obj/item/melee/smith/dagger(src)
	finalitem.force += quality*1.5
	finalitem.armour_penetration += quality*0.0375
	..()


/obj/item/smithing/macheteblade
	name = "smithed machete blade"
	icon_state = "machete_smith"
	finishingitem = /obj/item/blacksmith/swordhandle
	finalitem = /obj/item/melee/smith/machete

/obj/item/smithing/macheteblade/startfinish()
	finalitem = new /obj/item/melee/smith/machete(src)
	finalitem.force += quality*1.5
	..()


/obj/item/smithing/swordblade
	name = "smithed swordblade"
	icon_state = "sword_smith"
	finishingitem = /obj/item/blacksmith/swordhandle
	finalitem = /obj/item/melee/smith/sword

/obj/item/smithing/swordblade/startfinish()
	finalitem = new /obj/item/melee/smith/sword(src)
	finalitem.force += quality*1.5
	..()

/obj/item/smithing/sabreblade
	name = "smithed sabre blade"
	finishingitem = /obj/item/blacksmith/swordhandle
	finalitem = /obj/item/melee/smith/sword/sabre
	icon_state = "sabre_smith"

/obj/item/smithing/sabreblade/startfinish()
	finalitem = new /obj/item/melee/smith/sword/sabre(src)
	finalitem.force += quality*1.5
	..()

/obj/item/smithing/spathablade
	name = "smithed spathablade"
	icon_state = "spatha_smith"
	finishingitem = /obj/item/blacksmith/swordhandle
	finalitem = /obj/item/melee/smith/sword/spatha

/obj/item/smithing/spathablade/startfinish()
	finalitem = new /obj/item/melee/smith/sword/spatha(src)
	finalitem.force += quality*1.5
	..()

/obj/item/smithing/gladiusblade
	name = "smithed gladius blade"
	icon_state = "gladius_smith"
	finishingitem = /obj/item/blacksmith/swordhandle
	finalitem = /obj/item/melee/smith/machete/gladius

/obj/item/smithing/gladiusblade/startfinish()
	finalitem = new /obj/item/melee/smith/machete/gladius(src)
	finalitem.force += quality*1.5
	..()


/obj/item/smithing/macheterblade
	name = "reforged machete blade"
	icon_state = "macheter_smith"
	finishingitem = /obj/item/blacksmith/swordhandle
	finalitem = /obj/item/melee/smith/machete/reforged

/obj/item/smithing/macheterblade/startfinish()
	finalitem = new /obj/item/melee/smith/machete/reforged(src)
	finalitem.force += quality*1.5
	..()


/obj/item/smithing/wakiblade
	name = "smithed wakizashi blade"
	icon_state = "waki_smith"
	finishingitem = /obj/item/blacksmith/swordhandle
	finalitem = /obj/item/melee/smith/wakizashi

/obj/item/smithing/wakiblade/startfinish()
	finalitem = new /obj/item/melee/smith/wakizashi(src)
	finalitem.force += quality*1.5
	..()

/obj/item/smithing/katanablade
	name = "smithed katana blade"
	icon_state = "katana_smith"
	finishingitem = /obj/item/blacksmith/swordhandle
	finalitem = /obj/item/melee/smith/twohand/katana

/obj/item/smithing/katanablade/startfinish()
	var/obj/item/melee/smith/twohand/katana/finalforreal = new /obj/item/melee/smith/twohand/katana(src)
	finalforreal.force += quality*1.5
	finalforreal.wield_force = finalforreal.force*finalforreal.wielded_mult
	finalforreal.AddComponent(/datum/component/two_handed, force_unwielded=finalforreal.force, force_wielded=finalforreal.wield_force, icon_wielded="[icon_state]2")
	finalitem = finalforreal
	..()


// -------- 2-H WEAPONS --------- //

/obj/item/smithing/axehead
	name = "smithed axehead"
	icon_state = "axe_smith"
	finalitem = /obj/item/melee/smith/twohand/axe

/obj/item/smithing/axehead/startfinish()
	var/obj/item/melee/smith/twohand/axe/finalforreal = new /obj/item/melee/smith/twohand/axe(src)
	finalforreal.force += quality*1.5
	finalforreal.wield_force = finalforreal.force*finalforreal.wielded_mult
	finalforreal.AddComponent(/datum/component/two_handed, force_unwielded=finalforreal.force, force_wielded=finalforreal.wield_force, icon_wielded="[icon_state]2")
	finalitem = finalforreal
	..()

/obj/item/smithing/warhonedhead
	name = "smithed axehead"
	icon_state = "warhoned_smith"
	finalitem = /obj/item/melee/smith/twohand/axe/warhoned

/obj/item/smithing/warhonedhead/startfinish()
	var/obj/item/melee/smith/twohand/axe/warhoned/finalforreal = new /obj/item/melee/smith/twohand/axe/warhoned(src)
	finalforreal.force += quality*1.5
	finalforreal.wield_force = finalforreal.force*finalforreal.wielded_mult
	finalforreal.AddComponent(/datum/component/two_handed, force_unwielded=finalforreal.force, force_wielded=finalforreal.wield_force, icon_wielded="[icon_state]2")
	finalitem = finalforreal
	..()

/obj/item/smithing/scrapblade
	name = "smithed scrap blade"
	icon_state = "scrap_smith"
	finishingitem = /obj/item/blacksmith/swordhandle
	finalitem = /obj/item/melee/smith/twohand/axe/scrapblade

/obj/item/smithing/scrapblade/startfinish()
	var/obj/item/melee/smith/twohand/axe/scrapblade/finalforreal = new /obj/item/melee/smith/twohand/axe/scrapblade(src)
	finalforreal.force += quality*1.5
	finalforreal.wield_force = finalforreal.force*finalforreal.wielded_mult
	finalforreal.AddComponent(/datum/component/two_handed, force_unwielded=finalforreal.force, force_wielded=finalforreal.wield_force, icon_wielded="[icon_state]2")
	finalitem = finalforreal
	..()


// -------- POLEARMS -------- //

/obj/item/smithing/spearhead
	name = "smithed spearhead"
	finalitem = /obj/item/melee/smith/twohand/spear
	icon_state = "spear_smith"

/obj/item/smithing/spearhead/startfinish()
	var/obj/item/melee/smith/twohand/spear/finalforreal = new /obj/item/melee/smith/twohand/spear(src)
	finalforreal.force += quality*1.5
	finalforreal.wield_force = finalforreal.force*finalforreal.wielded_mult
	finalforreal.AddComponent(/datum/component/two_handed, force_unwielded=finalforreal.force, force_wielded=finalforreal.wield_force, icon_wielded="[icon_state]2")
	finalforreal.throwforce = finalforreal.force/10
	finalitem = finalforreal
	..()


/obj/item/smithing/lancehead
	name = "smithed lancehead"
	finalitem = /obj/item/melee/smith/twohand/spear/lance
	icon_state = "lance_smith"

/obj/item/smithing/lancehead/startfinish()
	var/obj/item/melee/smith/twohand/spear/lance/finalforreal = new /obj/item/melee/smith/twohand/spear/lance(src)
	finalforreal.force += quality*1.5
	finalforreal.wield_force = finalforreal.force*finalforreal.wielded_mult
	finalforreal.AddComponent(/datum/component/two_handed, force_unwielded=finalforreal.force, force_wielded=finalforreal.wield_force, icon_wielded="[icon_state]2")
	finalforreal.throwforce = finalforreal.force/10
	finalitem = finalforreal
	..()


/obj/item/smithing/macehead
	name = "smithed macehead"
	icon_state = "mace_smith"
	finishingitem = /obj/item/blacksmith/swordhandle
	finalitem = /obj/item/melee/smith/mace

/obj/item/smithing/macehead/startfinish()
	finalitem = new /obj/item/melee/smith/mace(src)
	finalitem.force += quality*1.5
	finalitem.armour_penetration += quality*0.05
	..()

// -------- THROWING WEAPONS --------- //

/obj/item/smithing/throwingknife
	name = "unfinished throwing knife"
	desc = "Add leather strips."
	icon_state = "throwing_smith"
	finishingitem = /obj/item/stack/sheet/leatherstrips
	finalitem = /obj/item/melee/smith/throwingknife

/obj/item/smithing/throwingknife/startfinish()
	var/obj/item/melee/smith/throwingknife/finalforreal = new /obj/item/melee/smith/throwingknife(src)
	finalforreal.force += quality*1.4
	finalforreal.throwforce = finalforreal.force*1.4
	finalitem = finalforreal
	..()

/obj/item/smithing/javelinhead
	name = "smithed javelin head"
	icon_state = "javelin_smith"
	finalitem = /obj/item/melee/smith/javelin

/obj/item/smithing/javelinhead/startfinish()
	var/obj/item/melee/smith/javelin/finalforreal = new /obj/item/melee/smith/javelin(src)
	finalforreal.force += quality*1.5
	finalforreal.throwforce = finalforreal.force*1.5
	finalitem = finalforreal
	..()

// GHOUL CRUSHER - for those dry twig like limbs, snap snap.
/obj/item/smithing/crusherhead
	name = "smithed crusher head"
	finalitem = /obj/item/melee/smith/twohand/crusher
	icon_state = "crusher_smith"

/obj/item/smithing/crusherhead/startfinish()
	var/obj/item/melee/smith/twohand/crusher/finalforreal = new /obj/item/melee/smith/twohand/crusher(src)
	finalforreal.force += quality*1.5
	finalforreal.wield_force = finalforreal.force*finalforreal.wielded_mult
	finalforreal.AddComponent(/datum/component/two_handed, force_unwielded=finalforreal.force, force_wielded=finalforreal.wield_force, icon_wielded="[icon_state]2")
	finalitem = finalforreal
	..()


//////////////////////////////////////
//									//
//		QUENCHING TROUGH			//
//									//
//////////////////////////////////////

/obj/structure/blacksmith/quenching
	name = "quenching trough"
	desc = "Water in a open box, for tempering hot metal in."
	icon = 'code/modules/smithing/icons/blacksmith.dmi'
	icon_state = "quench"
	density = TRUE
	anchored = TRUE
	var/toohot

/obj/structure/blacksmith/quenching/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/smithing))
		var/obj/item/smithing/untempered = I
		if(untempered.toohot == FALSE)
			playsound(src, 'sound/effects/water_wade4.ogg',50, 1)
			return
		to_chat(user, "You temper the [untempered] by quenching it in the water. There is a loud hiss and a puff of steam.")
		playsound(src, 'sound/machines/clockcult/steam_whoosh.ogg', 50, TRUE)
		flick("quench_boil",src)
		var/datum/effect_system/steam_spread/puff = new /datum/effect_system/steam_spread/()
		puff.effect_type = /obj/effect/particle_effect/steam
		puff.set_up(2, 0, src)
		puff.start()
		if(!do_after(user, 20, TRUE, src))
			return
		untempered.toohot = FALSE
		untempered.istempered()
		I.on_attack_hand(user)
	else
		. = ..()


/obj/structure/blacksmith/quenching/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/ingot))
		var/obj/item/ingot/notsword = I
		if(notsword.workability == FALSE)
			playsound(src, 'sound/effects/water_wade4.ogg',50, 1)
			return
		to_chat(user, "You cool the [notsword] in the water.")
		playsound(src, 'sound/f13effects/steam_short.ogg',80, 1)
		flick("quench_boil",src)
		var/datum/effect_system/steam_spread/puff = new /datum/effect_system/steam_spread/()
		puff.effect_type = /obj/effect/particle_effect/steam
		puff.set_up(1, 0, src)
		puff.start()
		notsword.workability = FALSE
		notsword.icon_state = "ingot"
//		notsword.light_on(FALSE)  // TEMPORART replaced w below rd. bc DR code
		notsword.set_light(0)
		I.on_attack_hand(user)
	else
		. = ..()



///////////////////////////////////
// ADVICE FOR BLACKSMITH ROOKIES //
///////////////////////////////////

// Explains some things so you dont have to code dive to learn.
/obj/item/book/manual/advice_blacksmith
	name = "The Forgemasters Primer"
	desc = "A thin book with some basic advice on how to use a hammer and anvil, copied by hand."
	icon = 'code/modules/smithing/icons/blacksmith.dmi'
	icon_state = "advice_smithing"
	author = "Forgemaster Gallius"
	title = "Advice on Blacksmithing - For hotheaded whelps"
	dat = {"<html>
				<head>
				<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
				<style>
				h1 {font-size: 18px; margin: 15px 0px 5px;}
				h2 {font-size: 15px; margin: 15px 0px 5px;}
				li {margin: 2px 0px 2px 15px;}
				ul {list-style: none; margin: 5px; padding: 0px;}
				ol {margin: 5px; padding: 0px 15px;}
				</style>
				</head>
				<body>

				<h3>How to work a hammer and anvil and produce basic tools.</h3>

				The needed tools are: good gloves, metal ingots, a furnace, wood planks, an anvil and a special hammer.
				<p>
				<ol>
				<li>Gloves: Not all gloves can handle red hot metal, Forgemaster gloves, or most others with fingers, or handwraps, are preferable. If you can move the hot metal from the furnace the gloves are good enough.</li>
				<li>Metal ingots: Take the metal stack you want to work in your hand and fashion ingots from it. (inhand crafting) </li>
				<li>Furnace: Needs fuel, welding fuel most commonly. Five measures of fuel burns fast but is enough to heat a couple ingots if you are fast.</li>
				<li>Wooden bits: Cut down planks to rods with something sharp. Then cut leather to strips and wrap it around the rod for making a sword handle, or directly on the metal for some tools. </li>
				<li>Metal bits: On occasion you might need some chain to complete your work, if so, take a metal sheet in your hand and make a length of chain from it. (inhand crafting) </li>
				<li>Anvil: The iron ones are most dependable, but you can use an anvil made from sandstone or a sturdy table in a pinch.(crafting menu forging & blacksmithing)</li>
				<li>Hammer: Most commonly a sledgehammer is used for the first work, which is making a better hammer. Craft one to get going. (crafting menu forging & blacksmithing) </li>
				</ol>
				<p>

				<h3>The process</h3>

				<p>
				<ol>
				<li>Heat the ingot, move it to the anvil.</li>
				<li>Prepare the metal, weak, strong and heavy hits enhance the quality but overworking the metal will produce slag and you have to start over. Try a couple hits then move on to making the item if you have no other ideas. </li>
				<li>Follow the secret smithing recipe for the item you want to make, the end result will depend on how much experience you have smithing, and the quality of your tools and preparations. </li>
				<li>The first item you make should be a good hammer, you might need to repeat the process and replace the previous hammer with a new one in steps. Try to have at least a masterworked iron hammer before moving on to other items to save you headache. </li>
				</ol>
				<p>

	
				<h3>Some secret smithing recipes.</h3>

				These are some of the items that can be made with hot iron and a steady hand. Results are not always the same depending on the anvil used.
				<p>
				<ol>
				<li>Hammer: (BPP) Bend the metal, then punch it like you would a profligates face until the hammerhead is done. Add a rod.</li>
				<li>Crowbar: (BBB) Bend the metal until you got the crowbar done, then wrap it in leather strips. Better than the usual crowbars folks use nowadays.</li>
				<li>Pickaxe: (BFF) Bend the metal, then fold it into shape twice, then add a wooden rod.</li>
				<li>Kitchen knife: (BSD) Bend the metal, shrink and draw it, then add a knife handle. A perfect gift for women.</li>
				<li>Rings: (SSS) Tiny things, my fingers hurt when I try to work it, but if you youngsters want to make one just shrink the metal to shape. Might cheer you up.</li>
				<li>Dagger: (DFS) Draw, fold and shrink it, add a sword handle and you got a tiny little weapon. </li>
				<li>Sabre: (FFDD) Like all swords, you must fold the metal some, then draw it into a proper thin shape. Add a handle and you got a fine blade! </li>
				<li>Sword: (FFDF) Fold, fold, draw, then FOLD SOME MORE. Done right, you get a proper sharp sword, after adding a sword handle.</li>
				<li>Machete: (FDF) Fold the metal, draw it and ugh..yeah, fold it more. Add handle.</li>
				<li>Heavy axe: (UDSP) Upset the hot metal, draw it, then shrink it and give it a solid punch. Add a wooden rod, then go chop down some wood or enemies. Easy. </li>
				<li>Javelin: (DBF) Draw the metal, bend it and fold it, then add a wooden rod and throw it in someones face.</li>
				<li>Throwing knife: (DBD) Draw the metal, bend it and draw it again, then add leather strips and there you go.</li>
				<li>Spear: (DDBF) Draw the metal twice, bend it and fold it. Add a rod, and enjoy a simple but effective weapon.</li>
				<li>Ball and chain: (PBU) Punch the metal, bend and upset it. Add a chain and then snap it on the slaves leg, and laugh while they hobble about. Silly slave.</li>
				</ol>
				<p>

				Know that there are more things to learn, but this is enough to get you started. Know that there are three styles of smithing, each requiring its own kind of anvil. Some items can only me made on the right anvil, experimentation is the key!

				</body>
				</html>
				"}

/datum/crafting_recipe/quenching
	name = "Quenching trough"
	result = /obj/structure/blacksmith/quenching
	time = 200
	reqs = list(
		/obj/item/stack/sheet/mineral/wood = 6,
		/obj/item/stack/sheet/metal = 2,
		/datum/reagent/water = 300,
		)
	tools = list(TOOL_CROWBAR)
//	category = CAT_CRAFTING		TEMPORARY commented out due to DR code out of date
//	subcategory = CAT_FORGING	TEMPORARY commented out due to DR code out of date


// ------------------------------- TG Remnants ------------------------------

/obj/item/smithing/proc/dwarfyartifact(obj/item/finalitem, mat)
	var/finaldesc = "A [initial(finalitem.name)] made of [mat], all craftsmanship is of the highest quality. It "
	switch(pick(1,2,3,4,5))
		if(1)
			finaldesc += "is encrusted with [pick("","synthetic ","multi-faceted ","magical ","sparkling ") + pick("rubies","emeralds","jade","opals","lapiz lazuli")]."
		if(2)
			finaldesc += "is laced with studs of [pick("gold","silver","aluminium","titanium")]."
		if(3)
			finaldesc += "is encircled with bands of [pick("durasteel","metallic hydrogen","ferritic-alloy","plasteel","duranium")]."
		if(4)
			finaldesc += "menaces with spikes of [pick("ytterbium","uranium","white pearl","black steel")]."
		if(5)
			finaldesc += "is encrusted with [pick("","synthetic ","multi-faceted ","magical ","sparkling ") + pick("rubies","emeralds","jade","opals","lapis lazuli")],laced with studs of [pick("gold","silver","aluminium","titanium")], encircled with bands of [pick("durasteel","metallic hydrogen","ferritic-alloy","plasteel","duranium")] and menaces with spikes of [pick("ytterbium","uranium","white pearl","black steel")]."
	finalitem.desc = finaldesc
	finalitem.name = pick("Delersibnir", "Nekolangrir", "Zanoreshik","Öntakrítin", "Nogzatan", "Vunomam", "Nazushagsaldôbar", "Sergeb", "Zafaldastot", "Vudnis", "Dostust", "Shotom", "Mugshith", "Angzak", "Oltud", "Deleratîs", "Nökornomal") //one of these is literally BLOOD POOL CREATE.iirc its Nazushagsaldôbar.


/*

// -------- ARMOR STUFF CONCEPT --------- //

/obj/item/smithing/helmet
	name = "smithed unpadded helmet"
	finalitem = /obj/item/clothing/head/helmet/f13/smithed
	icon_state = "helmet_smith"

/obj/item/smithing/helmet/startfinish()
	var/obj/item/clothing/head/helmet/f13/smithed/finalforreal = new /obj/item/clothing/head/helmet/f13/smithed(src)
	finalforreal.armor += quality*1
	finalforreal.AddComponent(/datum/component/two_handed, force_unwielded=finalforreal.force, force_wielded=finalforreal.wield_force, icon_wielded="[icon_state]2")
	finalitem = finalforreal
	..()
*/
