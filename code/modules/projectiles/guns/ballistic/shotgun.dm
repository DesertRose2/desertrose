//IN THIS DOCUMENT: Shotgun template, Double barrel shotguns, Pump-action shotguns, Semi-auto shotgun
// See gun.dm for keywords and the system used for gun balance


//////////////////////
// SHOTGUN TEMPLATE //
//////////////////////


/obj/item/gun/ballistic/shotgun
	slowdown = 0.4 //Bulky gun slowdown with rebate since generally smaller than assault rifles
	name = "shotgun template"
	desc = "Should not exist"
	icon = 'icons/obj/guns/projectile.dmi'
	lefthand_file = 'icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/guns_righthand.dmi'
	icon_state = "shotgun"
	item_state = "shotgun"
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	slot_flags = ITEM_SLOT_BACK
	mag_type = /obj/item/ammo_box/magazine/internal/shot
	force = 15 //Decent clubs generally speaking
	fire_delay = 6 //Typical pump action, pretty fast.
	spread = 2
	recoil = 0.1
	can_scope = FALSE
	flags_1 =  CONDUCT_1
	casing_ejector = FALSE
	var/recentpump = 0 // to prevent spammage
	spawnwithmagazine = TRUE
	var/pump_sound = 'sound/weapons/shotgunpump.ogg'
	fire_sound = 'sound/f13weapons/shotgun.ogg'


/obj/item/gun/ballistic/shotgun/process_chamber(mob/living/user, empty_chamber = 0)
	return ..() //changed argument value

/obj/item/gun/ballistic/shotgun/can_shoot()
	return !!chambered?.BB

/obj/item/gun/ballistic/shotgun/attack_self(mob/living/user)
	if(recentpump > world.time)
		return
	if(IS_STAMCRIT(user))//CIT CHANGE - makes pumping shotguns impossible in stamina softcrit
		to_chat(user, SPAN_WARNING("You're too exhausted for that."))//CIT CHANGE - ditto
		return//CIT CHANGE - ditto
	pump(user, TRUE)
	if(HAS_TRAIT(user, TRAIT_FAST_PUMP))
		recentpump = world.time + 2
	else
		recentpump = world.time + 10
		if(istype(user))//CIT CHANGE - makes pumping shotguns cost a lil bit of stamina.
			user.adjustStaminaLossBuffered(2) //CIT CHANGE - DITTO. make this scale inversely to the strength stat when stats/skills are added
	return

/obj/item/gun/ballistic/shotgun/blow_up(mob/user)
	. = 0
	if(chambered && chambered.BB)
		process_fire(user, user, FALSE)
		. = 1

/obj/item/gun/ballistic/shotgun/proc/pump(mob/M, visible = TRUE)
	if(visible)
		M.visible_message(SPAN_WARNING("[M] racks [src]."), SPAN_WARNING("You rack [src]."))
	playsound(M, pump_sound, 60, 1)
	pump_unload(M)
	pump_reload(M)
	update_icon()	//I.E. fix the desc
	return 1

/obj/item/gun/ballistic/shotgun/proc/pump_unload(mob/M)
	if(chambered)//We have a shell in the chamber
		chambered.forceMove(drop_location())//Eject casing
		chambered.bounce_away()
		chambered = null

/obj/item/gun/ballistic/shotgun/proc/pump_reload(mob/M)
	if(!magazine.ammo_count())
		return 0
	var/obj/item/ammo_casing/AC = magazine.get_round() //load next casing.
	chambered = AC

/obj/item/gun/ballistic/shotgun/examine(mob/user)
	. = ..()
	if (chambered)
		. += "A [chambered.BB ? "live" : "spent"] one is in the chamber."

/obj/item/gun/ballistic/shotgun/lethal
	mag_type = /obj/item/ammo_box/magazine/internal/shot/lethal


////////////////////////////////////////
//DOUBLE BARREL & PUMP ACTION SHOTGUNS//
////////////////////////////////////////


//Single shotgun							Keywords: shotgun, single barrel, saw-off.
/obj/item/gun/ballistic/revolver/single_shotgun
	name = "single shotgun"
	desc = "A dirt cheap single shot shotgun."
	icon_state = "single_shotgun"
	item_state = "singleshot"
	force = 20
	mag_type = /obj/item/ammo_box/magazine/internal/shot/improvised
	sawn_desc = "At this point, you're basically holding an individual shotgun shell as it goes off."
	fire_sound = 'sound/f13weapons/caravan_shotgun.ogg'
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY

/obj/item/gun/ballistic/revolver/single_shotgun/attackby(obj/item/A, mob/user, params)
	..()
	if(istype(A, /obj/item/circular_saw) || istype(A, /obj/item/gun/energy/plasmacutter))
		sawoff(user)
	if(istype(A, /obj/item/melee/transforming/energy))
		var/obj/item/melee/transforming/energy/W = A
		if(W.active)
			sawoff(user)

/obj/item/gun/ballistic/revolver/single_shotgun/update_icon_state()
	if(sawn_off)
		icon_state = "[initial(icon_state)]-sawn"
	else if(!magazine || !magazine.ammo_count(0))
		icon_state = "[initial(icon_state)]-e"
	else
		icon_state = "[initial(icon_state)]"


//Caravan shotgun							Keywords: Shotgun, Double barrel, saw-off, extra damage +3
/obj/item/gun/ballistic/revolver/caravan_shotgun
	name = "caravan shotgun"
	desc = "An common over-under double barreled shotgun."
	icon_state = "caravan_shotgun"
	item_state = "shotgundouble"
	force = 20
	extra_damage = 3
	mag_type = /obj/item/ammo_box/magazine/internal/shot/dual
	sawn_desc = "Omar's coming!"
	fire_sound = 'sound/f13weapons/caravan_shotgun.ogg'
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	fire_delay = 1

/obj/item/gun/ballistic/revolver/caravan_shotgun/attackby(obj/item/A, mob/user, params)
	..()
	if(istype(A, /obj/item/circular_saw) || istype(A, /obj/item/gun/energy/plasmacutter) | istype(A, /obj/item/twohanded/chainsaw))
		sawoff(user)
	if(istype(A, /obj/item/melee/transforming/energy))
		var/obj/item/melee/transforming/energy/W = A
		if(W.active)
			sawoff(user)

/obj/item/gun/ballistic/revolver/caravan_shotgun/update_icon_state()
	if(sawn_off)
		icon_state = "[initial(icon_state)]-sawn"
	else if(!magazine || !magazine.ammo_count(0))
		icon_state = "[initial(icon_state)]-e"
	else
		icon_state = "[initial(icon_state)]"


//Widowmaker					Keywords: Shotgun, Double barrel, saw-off
/obj/item/gun/ballistic/revolver/widowmaker
	name = "winchester widowmaker"
	desc = "A Winchester Widowmaker double-barreled 12 gauge shotgun, with mahogany furniture."
	icon_state = "widowmaker"
	item_state = "shotgundouble"
	force = 20
	mag_type = /obj/item/ammo_box/magazine/internal/shot/dual
	sawn_desc = "Someone took the time to chop the last few inches off the barrel and stock of this shotgun. Now, the wide spread of this hand-cannon's short-barreled shots makes it perfect for short-range crowd control."
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	fire_delay = 1
	fire_sound = 'sound/f13weapons/max_sawn_off.ogg'
	untinkerable = TRUE

/obj/item/gun/ballistic/revolver/widowmaker/attackby(obj/item/A, mob/user, params)
	..()
	if(istype(A, /obj/item/circular_saw) || istype(A, /obj/item/gun/energy/plasmacutter))
		sawoff(user)
	if(istype(A, /obj/item/melee/transforming/energy))
		var/obj/item/melee/transforming/energy/W = A
		if(W.active)
			sawoff(user)

/obj/item/gun/ballistic/revolver/widowmaker/update_icon_state()
	if(sawn_off)
		icon_state = "[initial(icon_state)]-sawn"
	else if(!magazine || !magazine.ammo_count(0))
		icon_state = "[initial(icon_state)]-e"
	else
		icon_state = "[initial(icon_state)]"

//Hunting shotgun					Keywords: Shotgun, Pump-action, 4 rounds, saw-off
/obj/item/gun/ballistic/shotgun/hunting
	name = "hunting shotgun"
	desc = "A traditional hunting shotgun with wood furniture and a four-shell capacity underneath."
	icon_state = "hunting"
	item_state = "shotgunpump"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/lethal
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	sawn_desc = "A concealed hand blaster, for any situation."

/obj/item/gun/ballistic/shotgun/hunting/attackby(obj/item/A, mob/user, params)
	..()
	if(istype(A, /obj/item/circular_saw) || istype(A, /obj/item/gun/energy/plasmacutter))
		sawoff(user)
	if(istype(A, /obj/item/melee/transforming/energy))
		var/obj/item/melee/transforming/energy/W = A
		if(W.active)
			sawoff(user)

/obj/item/gun/ballistic/shotgun/hunting/update_icon_state()
	if(sawn_off)
		icon_state = "[initial(icon_state)]-sawn"
	else if(!magazine || !magazine.ammo_count(0))
		icon_state = "[initial(icon_state)]-e"
	else
		icon_state = "[initial(icon_state)]"


//Trench shotgun					Keywords: Shotgun, Pump-action, 5 rounds, Bayonet, Extra firemode, Extra damage +2
/obj/item/gun/ballistic/shotgun/trench
	name = "trench shotgun"
	desc = "A military shotgun designed for close-quarters sweeping. A relic of WW2, equipped with a bayonet lug for closer quarters combat."
	icon_state = "trench"
	item_state = "shotguntrench"
	can_bayonet = TRUE
	bayonet_state = "rifles"
	extra_damage = 2
	bayonet_state = "trenchgun"
	knife_x_offset = 23
	knife_y_offset = 14
	mag_type = /obj/item/ammo_box/magazine/internal/shot/trench
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	actions_types = list(/datum/action/item_action/toggle_firemode)
	var/select = 1

/obj/item/gun/ballistic/shotgun/trench/update_icon_state()
	if(!magazine || !magazine.ammo_count(0))
		icon_state = "[initial(icon_state)]-e"
	else
		icon_state = "[initial(icon_state)]"

/obj/item/gun/ballistic/shotgun/trench/ui_action_click()
	burst_select()

//has a mode to let it pump much faster, at the cost of terrible accuracy and less damage
/obj/item/gun/ballistic/shotgun/trench/proc/burst_select()
	var/mob/living/carbon/human/user = usr
	switch(select)
		if(0)
			select = 1
			spread = 12
			burst_size = 1
			fire_delay = 3
			burst_shot_delay = 4
			extra_damage = 0
			to_chat(user, SPAN_NOTICE("You prepare to slamfire the shotgun for a rapid burst of shots."))
		if(1)
			select = 0
			burst_size = 1
			spread = 2
			extra_damage = 1
			to_chat(user, SPAN_NOTICE("You go back to firing the shotgun one round at a time."))

///////////////////////////
//SEMI-AUTOMATIC SHOTGUNS//
///////////////////////////

//Semi-auto shotgun template
/obj/item/gun/ballistic/shotgun/automatic/combat
	name = "semi-auto shotgun template"
	fire_delay = 5
	extra_damage = 0
	recoil = 0.1
	spread = 2

/obj/item/gun/ballistic/shotgun/automatic/shoot_live_shot(mob/living/user, pointblank = FALSE, mob/pbtarget, message = 1, stam_cost = 0)
	..()
	src.pump(user)

/obj/item/gun/ballistic/shotgun/automatic/combat/update_icon_state()
	if(!magazine || !magazine.ammo_count(0))
		icon_state = "[initial(icon_state)]-e"
	else
		icon_state = "[initial(icon_state)]"

//Browning Auto-5			Keywords: Shotgun, Semi-auto, 4 rounds internal
/obj/item/gun/ballistic/shotgun/automatic/combat/auto5
	name = "Browning Auto-5"
	desc = "A semi automatic shotgun with a four round tube."
	fire_delay = 6
	icon_state = "auto5"
	item_state = "shotgunauto5"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/com/compact
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	fire_sound = 'sound/f13weapons/auto5.ogg'
	always_reskinnable = TRUE
	unique_reskin = list("Browning Auto" = "auto5",
						"Pre-War Police" = "shotgunpolice"
						)

//Lever action shotgun		Keywords: Shotgun, lever-action, 5 round internal mag.
/obj/item/gun/ballistic/shotgun/lever
	name = "lever action shotgun"
	desc = "A lever action hunting shotgun with a five-shell capacity underneath plus one in chamber."
	icon_state = "lever"
	item_state = "shotgunlever"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/trench
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM
	pump_sound = 'sound/f13weapons/cowboyrepeaterreload.ogg'
	fire_delay = 5
	recoil = 0.5
	slot_flags = ITEM_SLOT_BELT | ITEM_SLOT_BACK
	fire_sound = 'sound/f13weapons/shotgun.ogg'
	can_bayonet = TRUE
	bayonet_state = "bayonet"
	knife_x_offset = 23
	knife_y_offset = 23

//Neostead 2000							Keywords: Shotgun, Semi-auto, 12 rounds internal
/obj/item/gun/ballistic/shotgun/automatic/combat/neostead
	name = "neostead 2000"
	desc = "An advanced shotgun with two separate magazine tubes, allowing you to quickly toggle between ammo types."
	icon_state = "neostead"
	item_state = "shotguncity"
	fire_delay = 5
	mag_type = /obj/item/ammo_box/magazine/internal/shot/tube
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	var/toggled = FALSE
	var/obj/item/ammo_box/magazine/internal/shot/alternate_magazine

/obj/item/gun/ballistic/shotgun/automatic/combat/neostead/examine(mob/user)
	. = ..()
	. += SPAN_NOTICE("Alt-click to switch tubes.")

/obj/item/gun/ballistic/shotgun/automatic/combat/neostead/Initialize()
	. = ..()
	if (!alternate_magazine)
		alternate_magazine = new mag_type(src)

/obj/item/gun/ballistic/shotgun/automatic/combat/neostead/attack_self(mob/living/user)
	. = ..()
	if(!magazine.contents.len)
		toggle_tube(user)

/obj/item/gun/ballistic/shotgun/automatic/combat/neostead/proc/toggle_tube(mob/living/user)
	var/current_mag = magazine
	var/alt_mag = alternate_magazine
	magazine = alt_mag
	alternate_magazine = current_mag
	toggled = !toggled
	if(toggled)
		to_chat(user, "You switch to tube B.")
	else
		to_chat(user, "You switch to tube A.")

/obj/item/gun/ballistic/shotgun/automatic/combat/neostead/AltClick(mob/living/user)
	if(!user.canUseTopic(src, BE_CLOSE, ismonkey(user)))
		return
	toggle_tube(user)


//City-Killer				Keywords: Shotgun, Semi-auto, 12 rounds internal
/obj/item/gun/ballistic/shotgun/automatic/combat/citykiller
	name = "City-Killer Shotgun"
	desc = "A semi automatic shotgun with black tactical furniture made by Winchester Arms. This particular model uses an internal feeding tube instead of a magazine."
	icon_state = "citykiller"
	item_state = "shotguncity"
	mag_type = /obj/item/ammo_box/magazine/internal/shot/com/citykiller
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY

//Riot Shotgun				Keywords: Shotgun, Semi-Auto, 12 round capacity drums.
/obj/item/gun/ballistic/automatic/shotgun/riot
	name = "Riot Shotgun"
	desc = "A compact riot shotgun designed to fight in close quarters."
	icon_state = "riot_shotgun"
	item_state = "shotgunriot"
	fire_sound = 'sound/f13weapons/riot_shotgun.ogg'
	burst_size = 1
	fire_delay = 4
	recoil = 0.75
	mag_type = /obj/item/ammo_box/magazine/d12g
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	force = 20
	automatic_burst_overlay = FALSE
	semi_auto = TRUE
	untinkerable = TRUE
