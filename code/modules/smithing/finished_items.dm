//////////////////////////////////////////
//										//
//		SMITHED ITEMS BASE CODE			//
//										//
//////////////////////////////////////////
// Values in brackets [37/39 (40) AP 0.2 Parry] are one handed, wielded, thrown, armour piercing, and abilitie, for Masterwork Iron weapons.  

/obj/item/melee/smith
	name = "base class obj/item/melee/smith"
	desc = "cringe"
	icon = 'code/modules/smithing/icons/blacksmith.dmi'
	icon_state = "claymore"
	lefthand_file = 'code/modules/smithing/icons/onmob/lefthand.dmi'
	righthand_file = 'code/modules/smithing/icons/onmob/righthand.dmi'
	mob_overlay_icon = 'code/modules/smithing/icons/onmob/slot.dmi'
	material_flags = MATERIAL_COLOR | MATERIAL_AFFECT_STATISTICS
	total_mass = TOTAL_MASS_MEDIEVAL_WEAPON
	slot_flags = ITEM_SLOT_BELT
	w_class = WEIGHT_CLASS_NORMAL
	force = 6
	obj_flags = UNIQUE_RENAME
	var/quality
	var/overlay_state = "woodenrod"
	var/mutable_appearance/overlay
	var/wielded_mult = 1
	var/wield_force = 15

/obj/item/melee/smith/Initialize()
	. = ..()
	if(desc == "cringe")
		desc = "A handmade [name]."
	overlay = mutable_appearance(icon, overlay_state)
	overlay.appearance_flags = RESET_COLOR
	add_overlay(overlay)
	if(force < 0)
		force = 0


/obj/item/melee/smith/twohand
	icon = 'code/modules/smithing/icons/blacksmith.dmi'
	lefthand_file = 'code/modules/smithing/icons/onmob/lefthand.dmi'
	righthand_file = 'code/modules/smithing/icons/onmob/righthand.dmi'
	mob_overlay_icon = 'code/modules/smithing/icons/onmob/slot.dmi'
	sharpness = SHARP_EDGED
	material_flags = MATERIAL_COLOR | MATERIAL_AFFECT_STATISTICS
	force = 10
	wielded_mult = 1.8
	w_class = WEIGHT_CLASS_BULKY
	var/icon_prefix = null
	var/wielded = FALSE
	var/x_offset = null
	var/y_offset = null

/obj/item/melee/smith/twohand/Initialize()
	. = ..()
	RegisterSignal(src, COMSIG_TWOHANDED_WIELD, .proc/on_wield)
	RegisterSignal(src, COMSIG_TWOHANDED_UNWIELD, .proc/on_unwield)

/obj/item/melee/smith/twohand/proc/on_wield(obj/item/source, mob/user)
	wielded = TRUE

/obj/item/melee/smith/twohand/proc/on_unwield(obj/item/source, mob/user)
	wielded = FALSE

/obj/item/melee/smith/twohand/update_icon_state()
	icon_state = "[icon_prefix]"


//////////////////////
//					//
//  SMITHED TOOLS	//
//					//
//////////////////////

// -------- BLACKSMITHING HAMMER -------- //
/obj/item/melee/smith/hammer
	name = "smithing hammer"
	icon = 'code/modules/smithing/icons/blacksmith.dmi'
	icon_state = "hammer"
	lefthand_file = 'code/modules/smithing/icons/onmob/lefthand.dmi'
	righthand_file = 'code/modules/smithing/icons/onmob/righthand.dmi'
	mob_overlay_icon = 'code/modules/smithing/icons/onmob/slot.dmi'
	item_state = "hammer"
	overlay_state = "hammerhandle"
	slot_flags = ITEM_SLOT_BELT
	var/qualitymod = 0

/obj/item/melee/smith/hammer/premade
	quality = 3
	qualitymod = 1
	custom_materials = list(/datum/material/iron = 1000)

// Debugging Hammer
/obj/item/melee/smith/hammer/debug
	name = "debugging hammer"
	desc = "A DEBUGGING HAMMER!! EPIC!!."
	qualitymod = 10


// -------- PROSPECTORS PICK -------- // Knock on rock to scan for minerals. Lowest quality too shitty to test.
/obj/item/mining_scanner/prospector
	name = "prospectors pick"
	material_flags = MATERIAL_COLOR | MATERIAL_AFFECT_STATISTICS
	obj_flags = UNIQUE_RENAME
	icon = 'code/modules/smithing/icons/blacksmith.dmi'
	icon_state = "prospect_smith"
	lefthand_file = 'code/modules/smithing/icons/onmob/lefthand.dmi'
	righthand_file = 'code/modules/smithing/icons/onmob/righthand.dmi'
	mob_overlay_icon = 'code/modules/smithing/icons/onmob/slot.dmi'
	item_state = "prospect_smith"
	sharpness = SHARP_POINTY
	slot_flags = ITEM_SLOT_BELT

/obj/item/mining_scanner/prospector/Initialize()
	..()
	var/mutable_appearance/overlay
	desc = "A sounding pick, by tapping the rockface and listening to the reverberation, a skilled user can determine where to dig to find deposits of minerals."
	overlay = mutable_appearance(icon, "handle_prospect")
	overlay.appearance_flags = RESET_COLOR
	add_overlay(overlay)

/obj/item/mining_scanner/prospector/afterattack(atom/A, mob/living/user, proximity)
	. = ..()
	if(!proximity || IS_STAMCRIT(user))
		return
	if(istype(A, /turf/closed/mineral))
		mineral_scan_pulse(get_turf(user), range)
		playsound(src, 'sound/f13items/pickaxe_2.ogg', 70, 1)

/obj/item/mining_scanner/prospector/attack_self(mob/user)
	return


// -------- SMITHED PICKAXE -------- //
/obj/item/pickaxe/smithed
	name = "pickaxe"
	desc = "A handmade pickaxe."
	material_flags = MATERIAL_COLOR | MATERIAL_AFFECT_STATISTICS
	obj_flags = UNIQUE_RENAME
	icon = 'code/modules/smithing/icons/blacksmith.dmi'
	icon_state = "pickaxe"
	lefthand_file = 'code/modules/smithing/icons/onmob/lefthand.dmi'
	righthand_file = 'code/modules/smithing/icons/onmob/righthand.dmi'
	mob_overlay_icon = 'code/modules/smithing/icons/onmob/slot.dmi'
	item_state = "pickaxe"
	slot_flags = ITEM_SLOT_BELT | ITEM_SLOT_BACK
	sharpness = SHARP_POINTY

/obj/item/pickaxe/smithed/Initialize()
	..()
	desc = "A handmade [name]."
	var/mutable_appearance/overlay
	overlay = mutable_appearance(icon, "handle_pickaxe")
	overlay.appearance_flags = RESET_COLOR
	add_overlay(overlay)
	if(force < 0)
		force = 0

/obj/item/pickaxe/smithed/attack_self(mob/user)
		to_chat(user, "<span class='notice'>Tool does not have a configureable dig range.</span>")


// -------- SMITHED SHOVEL -------- //
/obj/item/shovel/smithed
	name = "shovel"
	desc = "A shovel."
	icon = 'code/modules/smithing/icons/blacksmith.dmi'
	icon_state = "shovel"
	righthand_file = 'code/modules/smithing/icons/onmob/righthand.dmi'
	lefthand_file = 'code/modules/smithing/icons/onmob/lefthand.dmi'
	mob_overlay_icon = 'code/modules/smithing/icons/onmob/slot.dmi'
	item_state = "shovel"
	obj_flags = UNIQUE_RENAME
	material_flags = MATERIAL_COLOR | MATERIAL_AFFECT_STATISTICS
	sharpness = SHARP_EDGED //it cuts through the earth

/obj/item/shovel/smithed/Initialize()
	..()
	desc = "A handmade [name]."
	var/mutable_appearance/overlay
	overlay = mutable_appearance(icon, "shovelhandle")
	overlay.appearance_flags = RESET_COLOR
	add_overlay(overlay)
	if(force < 0)
		force = 0


// -------- SMITHED CROWBAR -------- // Tops out at 0.2 Toolspeed, which while very fast, is for a crowbar, so meh. TO DO Force qualmod
/obj/item/crowbar/smithed
	icon = 'code/modules/smithing/icons/blacksmith.dmi'
	icon_state = "crowbar_smith"
	item_state = "crowbar"
	obj_flags = UNIQUE_RENAME
	toolspeed = 0.8
	force = 15
	material_flags = MATERIAL_COLOR | MATERIAL_AFFECT_STATISTICS

/obj/item/crowbar/smithed/Initialize()
	..()
	desc = "A handmade [name]."
	var/mutable_appearance/overlay
	overlay = mutable_appearance(icon, "handle_crowbar")
	overlay.appearance_flags = RESET_COLOR
	add_overlay(overlay)


// -------- UNIVERSAL TOOL -------- // Crowbar with more force, wood chopping and butchering
/obj/item/crowbar/smithedunitool
	name = "universal tool"
	desc = "A bizarre combination of a crowbar and some sort of blade."
	icon = 'code/modules/smithing/icons/blacksmith.dmi'
	icon_state = "unitool_smith"
	lefthand_file = 'code/modules/smithing/icons/onmob/lefthand.dmi'
	righthand_file = 'code/modules/smithing/icons/onmob/righthand.dmi'
	item_state = "unitool_smith"
	obj_flags = UNIQUE_RENAME
	sharpness = SHARP_POINTY
	material_flags = MATERIAL_COLOR | MATERIAL_AFFECT_STATISTICS
	force = 30

/obj/item/crowbar/smithedunitool/Initialize()
	..()
	var/mutable_appearance/overlay
	overlay = mutable_appearance(icon, "handle_unitool")
	overlay.appearance_flags = RESET_COLOR
	add_overlay(overlay)

/obj/item/crowbar/smithedunitool/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/butchering, 150, 80) //terrible. just terrible.

// -------- KITCHEN KNIFE -------- //
/obj/item/kitchen/knife/smithed
	name = "kitchen knife"
	desc = "A handmade kitchen knife, best suited to cut stuff that doesn't cut back."
	icon = 'code/modules/smithing/icons/blacksmith.dmi'
	icon_state = "knife_smith"
	lefthand_file = 'code/modules/smithing/icons/onmob/lefthand.dmi'
	righthand_file = 'code/modules/smithing/icons/onmob/righthand.dmi'
	item_state = "knife_smith"
	obj_flags = UNIQUE_RENAME
	material_flags = MATERIAL_COLOR | MATERIAL_AFFECT_STATISTICS
	force = 23

/obj/item/kitchen/knife/smithed/Initialize()
	. = ..()
	AddComponent(/datum/component/butchering, 70, 100, 40)
	var/mutable_appearance/overlay
	overlay = mutable_appearance(icon, "hilt_knife")
	overlay.appearance_flags = RESET_COLOR
	add_overlay(overlay)


//////////////////////////
//						//
//  	OTHER ITEMS		//
//						//
//////////////////////////

// ------------ BALL AND CHAIN ------------ //
/obj/item/clothing/shoes/ballandchain
	name = "ball and chain"
	icon = 'code/modules/smithing/icons/blacksmith.dmi'
	icon_state = "ballandchain"
	mob_overlay_icon = 'code/modules/smithing/icons/onmob/slot.dmi'
	item_state = "ballandchain"
	obj_flags = UNIQUE_RENAME
	strip_delay = 300
	equip_delay_other = 100
	can_be_tied = FALSE
	w_class = WEIGHT_CLASS_BULKY
	slowdown = 8
	material_flags = MATERIAL_COLOR | MATERIAL_ADD_PREFIX
	body_parts_covered = null
	hitsound = 'sound/weapons/chainhit.ogg'
	var/quality = null

/obj/item/clothing/shoes/ballandchain/on_attack_hand(mob/user, act_intent = user.a_intent, unarmed_attack_flags)
	if(loc == user && user.get_item_by_slot(SLOT_SHOES))
		playsound(usr.loc, 'sound/weapons/chainhit.ogg', 75, 1)
		to_chat(user, "<span class='warning'>The ball and chain are too hard to remove by yourself! You'll need help taking this off!</span>")
		return
	return ..()


//////////////////////////////////
//								//
//  		KNIVES				//
//								//
//////////////////////////////////

// ------------ DAGGER ------------ // [31 AP 0.35 Eyestab]
/obj/item/melee/smith/dagger
	name = "dagger"
	icon_state = "dagger_smith"
	overlay_state = "hilt_dagger"
	w_class = WEIGHT_CLASS_SMALL
	sharpness = SHARP_EDGED
	force = 21
	throwforce = 23
	hitsound = 'sound/weapons/rapierhit.ogg'
	armour_penetration = 0.05
	attack_speed = FAST_ATTACK

// go for the eyes Boo
/obj/item/melee/smith/dagger/attack(mob/living/carbon/M, mob/living/carbon/user)
	if(!istype(M))
		return ..()
	if(user.zone_selected == BODY_ZONE_PRECISE_EYES)
		M.apply_damage(7, BRUTE, BODY_ZONE_HEAD)
		playsound(M, 'sound/effects/meatslap.ogg', 80, 1)
		return eyestab(M,user)
	else
		return ..()

/obj/item/melee/smith/dagger/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/butchering, 90, 90, 20)

// ------------ BOWIE KNIFE ------------ // [33 AP 0.3 Eyestab]
/obj/item/melee/smith/dagger/bowie 
	name = "bowie knife"
	icon_state = "bowie_smith"
	overlay_state = "hilt_bowie"
	force = 23
	hitsound = 'sound/weapons/rapierhit.ogg'
	attack_speed = FAST_ATTACK


//////////////////////////////////
//								//
//  	ONE HANDED SWORDS		//
//								//
//////////////////////////////////

// ------------ MACHETE ------------ // [39 AP 0.1]
/obj/item/melee/smith/machete
	name = "machete"
	icon_state = "machete_smith"
	overlay_state = "hilt_machete"
	force = 29
	throwforce = 15
	sharpness = SHARP_EDGED
	wound_bonus = 10
	block_chance = 20
	armour_penetration = 0.1

/obj/item/melee/smith/machete/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/butchering, 100, 85, 10) //decent in a pinch.
	AddElement(/datum/element/sword_point)

// ------------ GLADIUS ------------ // [39 AP 0.1]
/obj/item/melee/smith/machete/gladius
	name = "gladius"
	icon_state = "gladius_smith"
	overlay_state = "hilt_gladius"

// ------------ REFORGED MACHETE ------------ // [39 AP 0.1]
/obj/item/melee/smith/machete/reforged
	name = "reforged machete"
	icon_state = "macheter_smith"
	overlay_state = "hilt_macheter"


//////////////////////////////////
//								//
//  	MIXED ONEHANDERS		//
//								//
//////////////////////////////////

// ------------ WAKIZASHI ------------ // [35 AP 0 Parry]
/obj/item/melee/smith/wakizashi
	name = "wakizashi"
	icon_state = "waki_smith"
	overlay_state = "hilt_waki"
	sharpness = SHARP_EDGED
	force = 25
	throwforce = 12
	item_flags = ITEM_CAN_PARRY
	block_parry_data = /datum/block_parry_data/waki
	hitsound = 'sound/weapons/rapierhit.ogg'
	block_chance = 5
	wound_bonus = 5
	bare_wound_bonus = 20

/datum/block_parry_data/waki
	parry_stamina_cost = 8
	parry_time_windup = 0
	parry_time_active = 15
	parry_time_spindown = 0
	parry_time_perfect = 2
	parry_time_perfect_leeway = 0.75
	parry_imperfect_falloff_percent = 7.5
	parry_efficiency_to_counterattack = 100
	parry_efficiency_considered_successful = 80
	parry_efficiency_perfect = 120
	parry_failed_stagger_duration = 2 SECONDS
	parry_data = list(PARRY_COUNTERATTACK_MELEE_ATTACK_CHAIN = 1.9)

/obj/item/melee/smith/wakizashi/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/butchering, 110, 70) //decent in a pinch, but pretty bad.

// ------------ SCRAP SAW ------------ // [35 AP 0 Parry]
/obj/item/melee/smith/wakizashi/scrapsaw
	name = "scrap saw"
	icon_state = "saw_smith"
	overlay_state = "handle_saw"
	hitsound = 'sound/effects/butcher.ogg'
	tool_behaviour = TOOL_SAW
	toolspeed = 1
	wound_bonus = -5
	bare_wound_bonus = 35

// ------------ MACE ------------ // [32 AP 0.4]
/obj/item/melee/smith/mace
	name = "mace"
	icon_state = "mace_smith"
	overlay_state = "shaft_mace"
	force = 22
	throwforce = 12
	armour_penetration = 0.3
	wound_bonus = 10

/obj/item/melee/smith/mace/afterattack(mob/living/M, mob/living/user)
	. = ..()
	if(!istype(M))
		return
	M.apply_damage(15, STAMINA, "chest", M.run_armor_check("chest", "melee"))


//////////////////////////////////
//								//
//  	ONE HANDED SWORDS		//
//								//
//////////////////////////////////

// ------------ SWORD ------------ // [37 AP 0.2 Parry]
/obj/item/melee/smith/sword
	name = "sword"
	icon_state = "sword_smith"
	item_state = "sword_smith"
	overlay_state = "hilt_sword"
	armour_penetration = 0.1
	force = 27
	throwforce = 10
	sharpness = SHARP_EDGED
	item_flags = ITEM_CAN_PARRY
	block_parry_data = /datum/block_parry_data/sword
	w_class = WEIGHT_CLASS_BULKY
	wound_bonus = 5
	block_chance = 10
	armour_penetration = 0.1

/datum/block_parry_data/sword
	parry_stamina_cost = 12
	parry_time_windup = 0.5
	parry_time_active = 4
	parry_time_spindown = 1
	parry_time_perfect = 0.75
	parry_time_perfect_leeway = 0.75
	parry_imperfect_falloff_percent = 30
	parry_efficiency_perfect = 100
	parry_failed_stagger_duration = 3 SECONDS
	parry_failed_clickcd_duration = 2 SECONDS

/obj/item/melee/smith/sword/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/butchering, 120, 70) //decent in a pinch, but pretty bad.
	AddElement(/datum/element/sword_point)

// ------------ SPATHA ------------ // [37 AP 0.2 Parry]
/obj/item/melee/smith/sword/spatha
	name = "spatha"
	icon_state = "spatha_smith"
	item_state = "spatha_smith"
	overlay_state = "hilt_spatha"
	block_chance = 15

// ------------ SABRE ------------ // [35 AP 0.25 Parry]
/obj/item/melee/smith/sword/sabre
	name = "sabre"
	icon_state = "sabre_smith"
	item_state = "sabre_smith"
	overlay_state = "hilt_sabre"
	armour_penetration = 0.25
	force = 25
	block_chance = 20
	block_parry_data = /datum/block_parry_data/smithsaber
	armour_penetration = 0.15

/datum/block_parry_data/smithsaber
	parry_stamina_cost = 10
	parry_time_active = 8
	parry_time_perfect = 2
	parry_time_perfect_leeway = 2
	parry_failed_stagger_duration = 3 SECONDS
	parry_failed_clickcd_duration = 3 SECONDS
	parry_time_windup = 0
	parry_time_spindown = 0
	parry_imperfect_falloff_percent = 0
	parry_efficiency_to_counterattack = 100
	parry_efficiency_considered_successful = 100
	parry_efficiency_perfect = 120
	parry_data = list(PARRY_COUNTERATTACK_MELEE_ATTACK_CHAIN = 4)


//////////////////////////////////
//								//
//  		LONG SWORDS			//
//								//
//////////////////////////////////

// ------------ KATANA ------------ // [35/49 AP 0.2 Parry]
/obj/item/melee/smith/twohand/katana
	name = "katana"
	icon_state = "katana_smith"
	icon_prefix = "katana_smith"
	overlay_state = "hilt_katana"
	force = 25
	throwforce = 8
	wielded_mult = 1.5
	item_flags = ITEM_CAN_PARRY | NEEDS_PERMIT
	block_parry_data = /datum/block_parry_data/smithkatana
	hitsound = 'sound/weapons/rapierhit.ogg'
	slot_flags = ITEM_SLOT_BELT
	block_chance = 15
	wound_bonus = 5
	bare_wound_bonus = 30
	armour_penetration = 0.2

/datum/block_parry_data/smithkatana
	parry_stamina_cost = 10
	parry_time_active = 6
	parry_time_perfect = 3
	parry_time_perfect_leeway = 3
	parry_failed_stagger_duration = 3 SECONDS
	parry_failed_clickcd_duration = 3 SECONDS
	parry_time_windup = 0
	parry_time_spindown = 0
	parry_imperfect_falloff_percent = 0
	parry_efficiency_to_counterattack = 100
	parry_efficiency_considered_successful = 120
	parry_efficiency_perfect = 120
	parry_data = list(PARRY_COUNTERATTACK_MELEE_ATTACK_CHAIN = 4)

/obj/item/melee/smith/twohand/katana/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/butchering, 130, 60) //pretty bad.
	AddElement(/datum/element/sword_point)

// ------------ LONGSWORD ------------ // [35/49 AP 0.2 Parry]
/obj/item/melee/smith/twohand/katana/longsword
	name = "longsword"
	icon_state = "longsword_smith"
	icon_prefix = "longsword_smith"
	overlay_state = "hilt_longsword"

// ------------ SCRAP BLADE ------------ // [33/46.2 AP 0.1 Wounding]
/obj/item/melee/smith/twohand/katana/scrapblade
	name = "scrap blade"
	icon_state = "scrap_smith"
	icon_prefix = "scrap_smith"
	overlay_state = "hilt_scrap"
	force = 23
	throwforce = 30
	wielded_mult = 1.4
	armour_penetration = 0.1
	wound_bonus = 20
	attack_speed = SLOW_ATTACK
	slot_flags = ITEM_SLOT_BELT

/obj/item/melee/smith/twohand/axe/scrapblade/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/butchering, 110, 75) //decent in a pinch, but pretty bad.


//////////////////////////////////
//								//
// 		 		AXES			//
//								//
//////////////////////////////////

// ------------ HEAVY AXE ------------ // [28/56 AP 0.05 Doorbusting]
/obj/item/melee/smith/twohand/axe
	name = "heavy axe"
	icon_state = "axe_smith"
	icon_prefix = "axe_smith"
	overlay_state = "shaft_axe"
	total_mass = TOTAL_MASS_MEDIEVAL_WEAPON * 2
	force = 18
	throwforce = 15
	wielded_mult = 2
	slot_flags = ITEM_SLOT_BACK
	wound_bonus = 10
	bare_wound_bonus = 10
	armour_penetration = 0.05

/obj/item/melee/smith/twohand/axe/afterattack(atom/A, mob/living/user, proximity)
	. = ..()
	if(!proximity || !wielded || IS_STAMCRIT(user))
		return
	if(istype(A, /obj/machinery/door))
		var/obj/machinery/door/D = A
		D.take_damage(20, BRUTE, "melee", 0)
	else if(istype(A, /obj/structure/simple_door))
		var/obj/structure/simple_door/M = A
		M.take_damage(20, BRUTE, "melee", 0)

// ------------ LEGION WAR AXE ------------ // [28/56 AP 0.05 Doorbusting]
/obj/item/melee/smith/twohand/axe/waraxe
	name = "war axe"
	icon_state = "waraxe_smith"
	icon_prefix = "waraxe_smith"
	overlay_state = "shaft_waraxe"
	throwforce = 30

/obj/item/melee/smith/twohand/axe/waraxe/afterattack(atom/A, mob/living/user, proximity)
	. = ..()
	if(!proximity || !wielded || IS_STAMCRIT(user))
		return
	if(istype(A, /obj/machinery/door))
		var/obj/machinery/door/D = A
		D.take_damage(20, BRUTE, "melee", 0)
	else if(istype(A, /obj/structure/simple_door))
		var/obj/structure/simple_door/M = A
		M.take_damage(20, BRUTE, "melee", 0)

// ------------ GHOUL CRUSHER ------------ // [32/48 AP 0.1 Ghoul bonus] - for those dry twig like limbs, snap snap..
/obj/item/melee/smith/twohand/crusher
	name = "crusher"
	icon_state = "crusher_smith"
	icon_prefix = "crusher_smith"
	overlay_state = "shaft_crusher"
	sharpness = SHARP_NONE
	force = 22
	throwforce = 5
	wound_bonus = 20
	bare_wound_bonus = 30
	wielded_mult = 1.5
	hitsound = 'sound/weapons/genhit3.ogg'
	slot_flags = null
	armour_penetration = 0.1
	attack_speed = SLOW_ATTACK

/obj/item/melee/smith/twohand/crusher/Initialize()
	. = ..()
	desc = "Affectionally known as the ghoul crusher, this club is easiest to swing two handed."

/obj/item/melee/smith/twohand/crusher/afterattack(atom/A, mob/living/user, proximity)
	. = ..()
	if(!proximity || !wielded || IS_STAMCRIT(user))
		return
	if(istype(A, /mob/living/simple_animal/hostile/ghoul))
		var/mob/living/simple_animal/hostile/ghoul/D = A
		D.apply_damage(25, BRUTE)

// Issues with bane/extra wounds on PC ghouls, not functional. Mob bonus damage works.
/*	if(iscarbon(A))
		var/mob/living/carbon/human/species/ghoul/carbon_target = A
		var/obj/item/bodypart/bodypart = pick(carbon_target.bodyparts)
		var/datum/wound/blunt/moderate/moderate_wound = new
		moderate_wound.apply_wound(bodypart)

/obj/item/melee/smith/twohand/crusher/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/bane, /mob/living/carbon/human/species/ghoul, 1.1)
*/

//////////////////////////////////////
//									//
// 		 		POLEARMS			//
//									//
//////////////////////////////////////

// ------------ SPEAR ------------ // [20/36 AP 0.1 Reach]
/obj/item/melee/smith/twohand/spear
	name = "spear"
	icon_state = "spear_smith"
	icon_prefix = "spear_smith"
	overlay_state = "shaft_spear"
	reach = 2
	force = 10
	throwforce = 20
	sharpness = SHARP_POINTY
	armour_penetration = 0.1

// ------------ TRIDENT ------------ // [21/37.8 Reach Embed]
/obj/item/melee/smith/twohand/spear/trident
	name = "trident"
	icon_state = "trident_smith"
	icon_prefix = "trident_smith"
	overlay_state = "shaft_trident"
	force = 11
	attack_speed = SLOW_ATTACK
	throwforce = 30
	embedding = list("pain_mult" = 2, "embed_chance" = 40, "fall_chance" = 30, "ignore_throwspeed_threshold" = TRUE)
	armour_penetration = 0

// ------------ LEGION LANCE ------------ // [20/36 AP 0.1 Reach]
/obj/item/melee/smith/twohand/spear/lance
	name = "legion lance"
	icon_state = "lance_smith"
	icon_prefix = "lance_smith"
	overlay_state = "shaft_lance"
	throwforce = 30


//////////////////////////////////////////////////
//												//
//  			THROWING WEAPONS				//
//												//
//////////////////////////////////////////////////

// ------------ JAVELIN ------------ // [26 (37.5) AP 0.2 Embed]
/obj/item/melee/smith/javelin
	name = "javelin"
	icon_state = "javelin_smith"
	overlay_state = "shaft_javelin"
	item_state = "javelin_smith"
	sharpness = SHARP_POINTY
	embedding = list("pain_mult" = 2, "embed_chance" = 62, "fall_chance" = 20, "ignore_throwspeed_threshold" = TRUE)
	force = 16
	armour_penetration = 0.2

// ------------ THROWING KNIFE ------------ // [25 (33.6) AP 0.1 Embed]
/obj/item/melee/smith/throwingknife
	name = "throwing knife"
	icon_state = "throwing_smith"
	overlay_state = "handle_throwing"
	item_state = "dagger_smith"
	embedding = list("pain_mult" = 2, "embed_chance" = 65, "fall_chance" = 20, "ignore_throwspeed_threshold" = TRUE)
	force = 15
	w_class = WEIGHT_CLASS_SMALL
	armour_penetration = 0.1

// ------------ METAL BOLA ------------ //
/obj/item/restraints/legcuffs/bola/smithed
	name = "bola"
	desc = "All-metal bola for strong prey."
	icon = 'code/modules/smithing/icons/blacksmith.dmi'
	icon_state = "bola_smith"
	lefthand_file = 'code/modules/smithing/icons/onmob/lefthand.dmi'
	righthand_file = 'code/modules/smithing/icons/onmob/righthand.dmi'
	item_state = "bola_smith"
	breakouttime = 40//5 more deciseconds than regular bola
	material_flags = MATERIAL_COLOR | MATERIAL_AFFECT_STATISTICS

/obj/item/restraints/legcuffs/bola/smithed/Initialize()
	..()
	desc = "All-metal bola for strong prey."
	var/mutable_appearance/overlay
	overlay = mutable_appearance(icon, "chain_bola")
	overlay.appearance_flags = RESET_COLOR
	add_overlay(overlay)
