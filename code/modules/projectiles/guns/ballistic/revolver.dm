// In this document: Revolvers, Needlers, Weird revolvers
// See gun.dm for keywords and the system used for gun balance

/obj/item/gun/ballistic/revolver
	slowdown = 0.1
	name = "revolver template"
	desc = "should not exist."
	icon_state = "revolver"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder
	fire_delay = 5
	spread = 1
	force = 12 // Pistol whip
	casing_ejector = FALSE
	spawnwithmagazine = TRUE
	weapon_weight = WEAPON_LIGHT
	w_class = WEIGHT_CLASS_NORMAL
	slot_flags = ITEM_SLOT_BELT
	var/select = 0
	equipsound = 'sound/f13weapons/equipsounds/pistolequip.ogg'

/obj/item/gun/ballistic/revolver/Initialize()
	. = ..()
	if(!istype(magazine, /obj/item/ammo_box/magazine/internal/cylinder))
		verbs += /obj/item/gun/ballistic/revolver/verb/spin

/obj/item/gun/ballistic/revolver/chamber_round(spin = 1)
	if(spin)
		chambered = magazine.get_round(1)
	else
		chambered = magazine.stored_ammo[1]

/obj/item/gun/ballistic/revolver/shoot_with_empty_chamber(mob/living/user as mob|obj)
	..()
	chamber_round(1)

/obj/item/gun/ballistic/revolver/attack_self(mob/living/user)
	var/num_unloaded = 0
	chambered = null
	while (get_ammo() > 0)
		var/obj/item/ammo_casing/CB
		CB = magazine.get_round(0)
		if(CB)
			CB.forceMove(drop_location())
			CB.bounce_away(FALSE, NONE)
			num_unloaded++
	if (num_unloaded)
		to_chat(user, "<span class='notice'>You unload [num_unloaded] shell\s from [src].</span>")
	else
		to_chat(user, "<span class='warning'>[src] is empty!</span>")

/obj/item/gun/ballistic/revolver/verb/spin()
	set name = "Spin Chamber"
	set category = "Object"
	set desc = "Click to spin your revolver's chamber."

	var/mob/M = usr

	if(M.stat || !in_range(M,src))
		return

	if(do_spin())
		usr.visible_message("[usr] spins [src]'s chamber.", "<span class='notice'>You spin [src]'s chamber.</span>")
	else
		verbs -= /obj/item/gun/ballistic/revolver/verb/spin

/obj/item/gun/ballistic/revolver/proc/do_spin()
	var/obj/item/ammo_box/magazine/internal/cylinder/C = magazine
	. = istype(C)
	if(.)
		C.spin()
		chamber_round(0)

/obj/item/gun/ballistic/revolver/can_shoot()
	return get_ammo(0,0)

/obj/item/gun/ballistic/revolver/get_ammo(countchambered = 0, countempties = 1)
	var/boolets = 0 //mature var names for mature people
	if (chambered && countchambered)
		boolets++
	if (magazine)
		boolets += magazine.ammo_count(countempties)
	return boolets

/obj/item/gun/ballistic/revolver/examine(mob/user)
	. = ..()
	. += "[get_ammo(0,0)] of those are live rounds."

/obj/item/gun/ballistic/revolver/detective/screwdriver_act(mob/living/user, obj/item/I)
	if(..())
		return TRUE
	if("38" in magazine.caliber)
		to_chat(user, "<span class='notice'>You begin to reinforce the barrel of [src]...</span>")
		if(magazine.ammo_count())
			afterattack(user, user)	//you know the drill
			user.visible_message("<span class='danger'>[src] goes off!</span>", "<span class='userdanger'>[src] goes off in your face!</span>")
			return TRUE
		if(I.use_tool(src, user, 30))
			if(magazine.ammo_count())
				to_chat(user, "<span class='warning'>You can't modify it!</span>")
				return TRUE
			magazine.caliber = "357"
			desc = "The barrel and chamber assembly seems to have been modified."
			to_chat(user, "<span class='notice'>You reinforce the barrel of [src]. Now it will fire .357 rounds.</span>")
	else
		to_chat(user, "<span class='notice'>You begin to revert the modifications to [src]...</span>")
		if(magazine.ammo_count())
			afterattack(user, user)	//and again
			user.visible_message("<span class='danger'>[src] goes off!</span>", "<span class='userdanger'>[src] goes off in your face!</span>")
			return TRUE
		if(I.use_tool(src, user, 30))
			if(magazine.ammo_count())
				to_chat(user, "<span class='warning'>You can't modify it!</span>")
				return
			magazine.caliber = "38"
			desc = initial(desc)
			to_chat(user, "<span class='notice'>You remove the modifications on [src]. Now it will fire .38 rounds.</span>")
	return TRUE


/////////////////////
// 10 MM REVOLVERS //
/////////////////////

//Colt 6520			 							Keywords: 10mm, Double action, 12 rounds cylinder
/obj/item/gun/ballistic/revolver/colt6520
	name = "Colt 6520"
	desc = "The Colt 6520 10mm double action revolver is a highly durable weapon developed by Colt Firearms prior to the Great War. It proved to be resistant to the desert-like conditions of the post-nuclear wasteland and is a fine example of workmanship and quality construction."
	icon_state = "colt6520"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/rev6520
	fire_sound = 'sound/f13weapons/10mm_fire_02.ogg'
	extra_damage = 3
	fire_delay = 4

//Zhurong										Keywords: UNIQUE, 10mm, Double action, 12 round cylinder
/obj/item/gun/ballistic/revolver/zhurong
	name = "Zhu-Rong v417"
	desc = "The earlier model of the Chinese pistol found in the East Coast, which was known to be the model before all the simplifications of the design, making it smoother, packing a harderer punch. Chambered in 10mm."
	icon_state = "zhurong"
	w_class = WEIGHT_CLASS_SMALL
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/zhurong
	fire_delay = 0
	extra_damage = 20
	extra_penetration = 0.1
	fire_sound = 'sound/f13weapons/ninemil.ogg'

//10mm Ranger Revolver
/obj/item/gun/ballistic/revolver/colt6520/ranger
	name = "10mm 'Hard-Boiled' Special"
	desc = "A shiny big iron that was popular among tax collectors and insurance investigators before the war. While technically based on a law-enforcement variant of the 6520, it is outfitted uniquely with modifications including a larger trigger guard and heavier weight to counterbalance its fire rate."
	icon_state = "ranger6520"
	obj_flags = UNIQUE_RENAME
	unique_reskin = list("Classic" = "colt6520",
						"10mm 'Hard-Boiled' Special" = "ranger6520"
						)

///////////////////////
// .45 ACP REVOLVERS //
///////////////////////

/obj/item/gun/ballistic/revolver/revolver45
	name = "Colt .45"
	desc = "An old Single Action Army retooled for .45 ACP. Classic Americana, its wooden grip is worn and the steel dark from many years of use, though it is in relatively good condition."
	item_state = "45revolver"
	icon_state = "45revolver"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/rev45
	extra_damage = 5
	fire_delay = 4
	fire_sound = 'sound/f13weapons/45revolver.ogg'

//.45 Ranger Revolver
/obj/item/gun/ballistic/revolver/revolver45/ranger
	name = "Casull Cowboy .45"
	desc = "A rare .454 Casull revolver in incredibly well-maintained condition, polished to a mirror sheen. It's been rechambered to fit .45 ACP for some reason. Most of these have been lost to the mists of time."
	icon_state = "ranger45"
	obj_flags = UNIQUE_RENAME
	unique_reskin = list("Classic" = "45revolver",
						"Casull Cowboy .45" = "ranger45"
						)

////////////////////
// .357 REVOLVERS //
////////////////////

//Police revolver					Keywords: .38, Double action, 6 rounds cylinder
/obj/item/gun/ballistic/revolver/police
	name = ".38 police revolver"
	desc = "Pre-war double action police revolver in .357 calibre."
	icon_state = "police"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/rev357
	w_class = WEIGHT_CLASS_SMALL
	fire_sound = 'sound/f13weapons/policepistol.ogg'
	fire_delay = 5

//357 Magnum					Keywords: .357, Double action, 6 rounds cylinder
/obj/item/gun/ballistic/revolver/colt357
	name = ".357 magnum revolver"
	desc = "A relatively primitive .357 magnum revolver."
	item_state = "357colt"
	icon_state = "357colt"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/rev357
	fire_delay = 4
	fire_sound = 'sound/f13weapons/357magnum.ogg'

//Lucky							Keywords: UNIQUE, .357, Double action, 6 rounds cylinder, Block chance,
/obj/item/gun/ballistic/revolver/colt357/lucky
	name = "Lucky 37"
	desc = "One of the few weapons designed and created purely in the post-war world, it takes .38 ad .357 rounds, adjusting the rifling and boring based upon which is loaded."
	item_state = "357colt"
	icon_state = "lucky37"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/lucky37
	block_chance = 20

//.357 Ranger Revolver
/obj/item/gun/ballistic/revolver/colt357/ranger
	name = "Lawman Autorevolver"
	desc = "A pre-war conceptualized .357 never manufactured due to niche design, it's become a semi-common sight among NCR ranger big-irons. Its weight is a little more than it looks - and it already looks a bit oversized. Even so, the most interesting thing about it (aside from the golden bear design imprinted upon an embedded medallion in the grip) is that it is break-open style."
	icon_state = "ranger357"
	obj_flags = UNIQUE_RENAME
	unique_reskin = list("Classic" = "357colt",
						"Lawman Autorevolver" = "ranger357"
						)

///////////////////
// .44 REVOLVERS //
///////////////////

//.44 Magnum revolver		 	Keywords: .44, Double action, 6 rounds cylinder
/obj/item/gun/ballistic/revolver/m29
	name = ".44 magnum revolver"
	desc = "Being that this is the most powerful handgun in the world, and can blow your head clean-off, you've got to ask yourself one question. Do I feel lucky? Well, do ya punk? "
	item_state = "colt44"
	icon_state = "m29"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/rev44
	fire_sound = 'sound/f13weapons/44mag.ogg'
	recoil = 0.1
	can_scope = TRUE
	scope_state = "revolver_scope"
	scope_x_offset = 6
	scope_y_offset = 24

/obj/item/gun/ballistic/revolver/m29/alt
	item_state = "44magnum"
	icon_state = "mysterious_m29"
	can_scope = FALSE

/obj/item/gun/ballistic/revolver/m29/coltwalker
	name = "Colt Walker 1847"
	desc = "A legendary gun of the west. The Colt Walker bears a fearsome reputation for a very good reason, finding itself in the hands of everyone from ancient army officials to outlaws throughout the years. An antique when the bombs dropped, the weapon is now incredibly outdated. Still, that doesn't make it any less lethal."
	item_state = "coltwalker"
	icon_state = "coltwalker"
	can_scope = FALSE

//Peacekeeper					 Keywords: UNIQUE, .44, Double action, 6 rounds cylinder, Extra Firemode
/obj/item/gun/ballistic/revolver/m29/peacekeeper
	name = "Peacekeeper"
	desc = "Even desert roses have thorns. This .44 revolver has been modified with a special hammer mechanism, allowing for slow, powerful shots, or fanning the hammer for a flurry of more inaccurate shots."
	item_state = "m29peace"
	icon_state = "m29peace"
	extra_damage = 15
	extra_penetration = 0.1
	fire_delay = 10
	burst_size = 1
	actions_types = list(/datum/action/item_action/toggle_firemode)
	can_scope = FALSE

/obj/item/gun/ballistic/revolver/m29/peacekeeper/ui_action_click()
	burst_select()

/obj/item/gun/ballistic/revolver/m29/peacekeeper/proc/burst_select()
	var/mob/living/carbon/human/user = usr
	switch(select)
		if(0)
			select += 1
			burst_size = 3 //fan the hammer
			spread = 15
			extra_damage = 0
			extra_penetration = 0
			fire_delay = 1
			to_chat(user, "<span class='notice'>You prepare to fan the hammer for a rapid burst of shots.</span>")
		if(1)
			select = 0
			burst_size = 1
			spread = 0
			extra_damage = 15
			extra_penetration = 0.1
			to_chat(user, "<span class='notice'>You switch to single-shot fire.</span>")
	update_icon()

//.44 Snubnose						Keywords: .44, Double action, 6 rounds cylinder, Short barrel
/obj/item/gun/ballistic/revolver/m29/snub
	name = "snubnose .44 magnum revolver"
	desc = "A snubnose variant of the common place .44 magnum. An excellent holdout weapon for self defense."
	icon_state = "m29_snub"
	w_class = WEIGHT_CLASS_SMALL
	weapon_weight = WEAPON_LIGHT
	extra_damage = -2 //Smaller barrel thus lower bullet velocity
	spread = 3

//.44 Ranger Revolver
/obj/item/gun/ballistic/revolver/revolver44/ranger
	name = "Shorty .44"
	desc = "Noticing a short-barreled .44 on a ranger's hip might mean death will come 10 seconds more. A quality revolver like this makes up for its difference in size."
	icon_state = "ranger44_alt"
	obj_flags = UNIQUE_RENAME
	unique_reskin = list("Classic" = "44colt",
						"Shorty .44" = "ranger44_alt",
						"True Shorty .44" = "ranger44"
						)

//////////////////////
// .45-70 REVOLVERS //
//////////////////////

/obj/item/gun/ballistic/revolver/sequoia
	name = "ranger sequoia"
	desc = "This large, double-action revolver is a rare, scopeless variant of the hunting revolver. It is used exclusively by the New California Republic Rangers. This revolver features a dark finish with intricate engravings etched all around the weapon. Engraved along the barrel are the words 'For Honorable Service,' and 'Against All Tyrants.' The hand grip bears the symbol of the NCR Rangers, a bear, and a brass plate attached to the bottom that reads '20 Years.' "
	icon_state = "sequoia"
	item_state = "sequoia"
	weapon_weight = WEAPON_MEDIUM
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/rev4570
	fire_sound = 'sound/f13weapons/sequoia.ogg'
	recoil = 0.1

/obj/item/gun/ballistic/revolver/sequoia/bayonet
	name = "bayoneted ranger sequoia"
	desc = "This large, double-action revolver is a rare, scopeless variant of the hunting revolver. It is used exclusively by the New California Republic Rangers. This revolver features a dark finish with intricate engravings etched all around the weapon. Engraved along the barrel are the words 'For Honorable Service,' and 'Against All Tyrants.' The hand grip bears the symbol of the NCR Rangers, a bear, and a brass plate attached to the bottom that reads '20 Years.' This one has a bayonet on it."
	icon_state = "sequoia_b"
	item_state = "sequoia"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/rev4570
	fire_sound = 'sound/f13weapons/sequoia.ogg'
	force = 25

/obj/item/gun/ballistic/revolver/hunting
	name = "hunting revolver"
	desc = "A scoped double action revolver chambered in 45-70."
	icon_state = "hunting_revolver"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/rev4570
	fire_sound = 'sound/f13weapons/sequoia.ogg'
	weapon_weight = WEAPON_MEDIUM
	recoil = 0.1
	can_scope = TRUE
	scope_state = "revolver_scope"
	scope_x_offset = 9
	scope_y_offset = 20


//////////////////////
// .223 REVOLVER    //
//////////////////////

/obj/item/gun/ballistic/revolver/thatgun
	name = ".223 pistol"
	desc = "A 556 rifle modified and cut down to a pistol."
	icon_state = "thatgun"
	fire_sound = 'sound/f13weapons/magnum_fire.ogg'
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/thatgun
	extra_penetration = 0.25
	extra_damage = 6.5


//////////////////////
// SHOTGUN REVOLVER //
//////////////////////

/obj/item/gun/ballistic/revolver/shotgunrevolver
	name = "revolver shotgun"
	desc = "A large revolver that fires shotgun shells."
	icon_state = "judge"
	item_state = "gun"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/shotgunrevolver
	fire_sound = 'sound/f13weapons/caravan_shotgun.ogg'
	fire_delay = 3.5
	weapon_weight = WEAPON_MEDIUM
	spread = 40
	untinkerable = TRUE


/////////////
// NEEDLER //
/////////////

//Needler						Keywords: Needler, Double action, 10 rounds internal
/obj/item/gun/ballistic/revolver/needler
	name = "needler pistol"
	desc = "You suspect this Bringham needler pistol was once used in scientific field studies. It uses small hard-plastic hypodermic darts as ammo. "
	icon_state = "needler"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/revneedler
	fire_sound = 'sound/weapons/gunshot_silenced.ogg'
	w_class = WEIGHT_CLASS_SMALL


/obj/item/gun/ballistic/revolver/needler/ultra
	name = "Ultracite needler"
	desc = "An ultracite enhanced needler pistol"
	icon_state = "ultraneedler"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/revneedler
	fire_sound = 'sound/weapons/gunshot_silenced.ogg'
	w_class = WEIGHT_CLASS_SMALL


//////////////////////
// RUSSIAN REVOLVER //
/////////////////////

// A gun to play Russian Roulette!
// You can spin the chamber to randomize the position of the bullet.

/obj/item/gun/ballistic/revolver/russian
	name = "Russian revolver"
	desc = "A Russian-made revolver for drinking games. Uses .357 ammo, and has a mechanism requiring you to spin the chamber before each trigger pull."
	icon_state = "russianrevolver"
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/rus357
	var/spun = FALSE

/obj/item/gun/ballistic/revolver/russian/do_spin()
	. = ..()
	spun = TRUE

/obj/item/gun/ballistic/revolver/russian/Initialize()
	. = ..()
	do_spin()
	spun = TRUE
	update_icon()

/obj/item/gun/ballistic/revolver/russian/attackby(obj/item/A, mob/user, params)
	..()
	if(get_ammo() > 0)
		spin()
		spun = TRUE
	update_icon()
	A.update_icon()
	return

/obj/item/gun/ballistic/revolver/russian/attack_self(mob/user)
	if(!spun)
		spin()
		spun = TRUE
		return
	..()

/obj/item/gun/ballistic/revolver/russian/afterattack(atom/target, mob/living/user, flag, params)
	. = ..(null, user, flag, params)

	if(flag)
		if(!(target in user.contents) && ismob(target))
			if(user.a_intent == INTENT_HARM) // Flogging action
				return

	if(isliving(user))
		if(!can_trigger_gun(user))
			return
	if(target != user)
		if(ismob(target))
			to_chat(user, "<span class='warning'>A mechanism prevents you from shooting anyone but yourself!</span>")
		return

	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(!spun)
			to_chat(user, "<span class='warning'>You need to spin \the [src]'s chamber first!</span>")
			return

		spun = FALSE

		if(chambered)
			var/obj/item/ammo_casing/AC = chambered
			if(AC.fire_casing(user, user))
				playsound(user, fire_sound, 50, 1)
				var/zone = check_zone(user.zone_selected)
				var/obj/item/bodypart/affecting = H.get_bodypart(zone)
				if(zone == BODY_ZONE_HEAD || zone == BODY_ZONE_PRECISE_EYES || zone == BODY_ZONE_PRECISE_MOUTH)
					shoot_self(user, affecting)
				else
					user.visible_message("<span class='danger'>[user.name] cowardly fires [src] at [user.p_their()] [affecting.name]!</span>", "<span class='userdanger'>You cowardly fire [src] at your [affecting.name]!</span>", "<span class='italics'>You hear a gunshot!</span>")
				chambered = null
				return

		user.visible_message("<span class='danger'>*click*</span>")
		playsound(src, "gun_dry_fire", 30, 1)

/obj/item/gun/ballistic/revolver/russian/process_fire(atom/target, mob/living/user, message = TRUE, params = null, zone_override = "", bonus_spread = 0, stam_cost = 0)
	add_fingerprint(user)
	playsound(src, "gun_dry_fire", 30, TRUE)
	user.visible_message("<span class='danger'>[user.name] tries to fire \the [src] at the same time, but only succeeds at looking like an idiot.</span>", "<span class='danger'>\The [src]'s anti-combat mechanism prevents you from firing it at the same time!</span>")

/obj/item/gun/ballistic/revolver/russian/proc/shoot_self(mob/living/carbon/human/user, affecting = BODY_ZONE_HEAD)
	user.apply_damage(300, BRUTE, affecting)
	user.visible_message("<span class='danger'>[user.name] fires [src] at [user.p_their()] head!</span>", "<span class='userdanger'>You fire [src] at your head!</span>", "<span class='italics'>You hear a gunshot!</span>")

/obj/item/gun/ballistic/revolver/russian/soul
	name = "cursed Russian revolver"
	desc = "To play with this revolver requires wagering your very soul."

/obj/item/gun/ballistic/revolver/russian/soul/shoot_self(mob/living/user)
	..()
	var/obj/item/soulstone/anybody/SS = new /obj/item/soulstone/anybody(get_turf(src))
	if(!SS.transfer_soul("FORCE", user)) //Something went wrong
		qdel(SS)
		return
	user.visible_message("<span class='danger'>[user.name]'s soul is captured by \the [src]!</span>", "<span class='userdanger'>You've lost the gamble! Your soul is forfeit!</span>")




/////////////////////////////
//   IMPROVISED GUNS	   //
/////////////////////////////

//Zipgun					Keywords: IMPROVISED, 9mm, mag-loaded
/obj/item/gun/ballistic/revolver/zipgun
	name = "zipgun"
	desc = "A crudely-made 9mm pistol. You're not sure this thing is reliable."
	icon_state = "zipgun"
	item_state = "gun"
	fire_sound = 'sound/weapons/Gunshot.ogg'
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/improvised9mm
	spread = 20

//Pipe Rifle				Keywords: IMPROVISED, 10mm, interal loader, single-shot
/obj/item/gun/ballistic/revolver/pipe_rifle
	name = "pipe rifle"
	desc = "A crudely-made 10mm rifle. It's not very accurate."
	icon_state = "pipe_rifle"
	item_state = "improvshotgun"
	fire_sound = 'sound/weapons/Gunshot.ogg'
	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/improvised10mm
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	spread = 15

/obj/item/gun/ballistic/revolver/pipe_rifle/attackby(obj/item/A, mob/user, params)
	..()
	if(A.tool_behaviour == TOOL_SAW || istype(A, /obj/item/gun/energy/plasmacutter))
		sawoff(user)


//Probably worthless code but keeping it here for legacy reasons.
/obj/item/gun/ballistic/revolver/doublebarrel/improvised
	name = "improvised shotgun"
	desc = "A shoddy break-action breechloaded shotgun. Its lacklustre construction shows in its lesser effectiveness."
	icon_state = "ishotgun"
	item_state = "shotgun"
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_MEDIUM // prevents shooting 2 at once, but doesn't require 2 hands
	force = 10
	slot_flags = null
	mag_type = /obj/item/ammo_box/magazine/internal/shot/improvised
	sawn_desc = "I'm just here for the gasoline."
	unique_reskin = null
	var/slung = FALSE
	untinkerable = TRUE

/obj/item/gun/ballistic/revolver/doublebarrel/improvised/attackby(obj/item/A, mob/user, params)
	..()
	if(istype(A, /obj/item/stack/cable_coil) && !sawn_off)
		if(A.use_tool(src, user, 0, 10, skill_gain_mult = EASY_USE_TOOL_MULT))
			slot_flags = ITEM_SLOT_BACK
			to_chat(user, "<span class='notice'>You tie the lengths of cable to the shotgun, making a sling.</span>")
			slung = TRUE
			update_icon()
		else
			to_chat(user, "<span class='warning'>You need at least ten lengths of cable if you want to make a sling!</span>")

/obj/item/gun/ballistic/revolver/doublebarrel/improvised/update_overlays()
	. = ..()
	if(slung)
		. += "[icon_state]sling"

/obj/item/gun/ballistic/revolver/doublebarrel/improvised/sawoff(mob/user)
	. = ..()
	if(. && slung) //sawing off the gun removes the sling
		new /obj/item/stack/cable_coil(get_turf(src), 10)
		slung = 0
		update_icon()

/obj/item/gun/ballistic/revolver/doublebarrel/improvised/sawn
	name = "sawn-off improvised shotgun"
	desc = "The barrel and stock have been sawn and filed down; it can fit in backpacks. You wont want to shoot two of these at once if you value your wrists."
	icon_state = "ishotgun"
	item_state = "gun"
	w_class = WEIGHT_CLASS_NORMAL
	sawn_off = TRUE
	slot_flags = ITEM_SLOT_BELT
	untinkerable = TRUE


/obj/item/gun/ballistic/revolver/reverse //Fires directly at its user... unless the user is a clown, of course.
	clumsy_check = 0

/obj/item/gun/ballistic/revolver/reverse/can_trigger_gun(mob/living/user)
	if((HAS_TRAIT(user, TRAIT_CLUMSY)) || (user.mind && HAS_TRAIT(user.mind, TRAIT_CLOWN_MENTALITY)))
		return ..()
	if(process_fire(user, user, FALSE, null, BODY_ZONE_HEAD))
		user.visible_message("<span class='warning'>[user] somehow manages to shoot [user.p_them()]self in the face!</span>", "<span class='userdanger'>You somehow shoot yourself in the face! How the hell?!</span>")
		user.emote("scream")
		user.drop_all_held_items()
		user.DefaultCombatKnockdown(80)













//Legacy shit from Citadel  I'm too lazy to remove because it would make my PR have even more files changed to remove this bullshit.




/obj/item/gun/ballistic/revolver/mateba
	name = "\improper Unica 6 auto-revolver"
	desc = "A retro high-powered autorevolver typically used by officers of the New Russia military. Uses .357 ammo."
	icon_state = "mateba"

/obj/item/gun/ballistic/revolver/golden
	name = "\improper Golden revolver"
	desc = "This ain't no game, ain't never been no show, And I'll gladly gun down the oldest lady you know. Uses .357 ammo."
	icon_state = "goldrevolver"
	fire_sound = 'sound/weapons/resonator_blast.ogg'
	recoil = 8
	pin = /obj/item/firing_pin

/obj/item/gun/ballistic/revolver/nagant
	name = "\improper Nagant revolver"
	desc = "An old model of revolver that originated in Russia. Able to be suppressed. Uses 7.62x38mmR ammo."
	icon_state = "nagant"
	can_suppress = TRUE

	mag_type = /obj/item/ammo_box/magazine/internal/cylinder/rev762

/obj/item/gun/ballistic/revolver/doublebarrel
	name = "double-barreled shotgun"
	desc = "A true classic."
	icon_state = "dshotgun"
	item_state = "shotgun"
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_MEDIUM
	force = 10
	flags_1 = CONDUCT_1
	slot_flags = ITEM_SLOT_BACK
	untinkerable = TRUE
	mag_type = /obj/item/ammo_box/magazine/internal/shot/dual
	sawn_desc = "Omar's coming!"
	obj_flags = UNIQUE_RENAME
	unique_reskin = list("Default" = "dshotgun",
						"Dark Red Finish" = "dshotgun-d",
						"Ash" = "dshotgun-f",
						"Faded Grey" = "dshotgun-g",
						"Maple" = "dshotgun-l",
						"Rosewood" = "dshotgun-p"
						)

/obj/item/gun/ballistic/revolver/doublebarrel/attackby(obj/item/A, mob/user, params)
	..()
	if(istype(A, /obj/item/ammo_box) || istype(A, /obj/item/ammo_casing))
		chamber_round()
	if(A.tool_behaviour == TOOL_SAW || istype(A, /obj/item/gun/energy/plasmacutter))
		sawoff(user)
	if(istype(A, /obj/item/melee/transforming/energy))
		var/obj/item/melee/transforming/energy/W = A
		if(W.active)
			sawoff(user)

/obj/item/gun/ballistic/revolver/doublebarrel/attack_self(mob/living/user)
	var/num_unloaded = 0
	while (get_ammo() > 0)
		var/obj/item/ammo_casing/CB
		CB = magazine.get_round(0)
		chambered = null
		CB.forceMove(drop_location())
		CB.update_icon()
		num_unloaded++
	if (num_unloaded)
		to_chat(user, "<span class='notice'>You break open \the [src] and unload [num_unloaded] shell\s.</span>")
	else
		to_chat(user, "<span class='warning'>[src] is empty!</span>")

/obj/item/gun/ballistic/revolver/syndicate
	unique_reskin = list("Default" = "revolver",
						"Silver" = "russianrevolver",
						"Robust" = "revolvercit")


// -------------- HoS Modular Weapon System -------------
// ---------- Code originally from VoreStation ----------
/obj/item/gun/ballistic/revolver/mws
	name = "MWS-01 'Big Iron'"
	desc = "Modular Weapons System"

	icon = 'icons/obj/guns/projectile.dmi'
	icon_state = "mws"

	fire_sound = 'sound/weapons/Taser.ogg'

	mag_type = /obj/item/ammo_box/magazine/mws_mag
	spawnwithmagazine = FALSE

	recoil = 0

	var/charge_sections = 6

/obj/item/gun/ballistic/revolver/mws/examine(mob/user)
	. = ..()
	. += "<span class='notice'>Alt-click to remove the magazine.</span>"

/obj/item/gun/ballistic/revolver/mws/shoot_with_empty_chamber(mob/living/user as mob|obj)
	process_chamber(user)
	if(!chambered || !chambered.BB)
		to_chat(user, "<span class='danger'>*click*</span>")
		playsound(src, "gun_dry_fire", 30, 1)


/obj/item/gun/ballistic/revolver/mws/process_chamber(mob/living/user)
	if(chambered && !chambered.BB) //if BB is null, i.e the shot has been fired...
		var/obj/item/ammo_casing/mws_batt/shot = chambered
		if(shot.cell.charge >= shot.e_cost)
			shot.chargeshot()
		else
			for(var/B in magazine.stored_ammo)
				var/obj/item/ammo_casing/mws_batt/other_batt = B
				if(istype(other_batt,shot) && other_batt.cell.charge >= other_batt.e_cost)
					switch_to(other_batt, user)
					break
	update_icon()

/obj/item/gun/ballistic/revolver/mws/proc/switch_to(obj/item/ammo_casing/mws_batt/new_batt, mob/living/user)
	if(ishuman(user))
		if(chambered && new_batt.type == chambered.type)
			to_chat(user,"<span class='warning'>[src] is now using the next [new_batt.type_name] power cell.</span>")
		else
			to_chat(user,"<span class='warning'>[src] is now firing [new_batt.type_name].</span>")

	chambered = new_batt
	update_icon()

/obj/item/gun/ballistic/revolver/mws/attack_self(mob/living/user)
	if(!chambered)
		return

	var/list/stored_ammo = magazine.stored_ammo

	if(stored_ammo.len == 1)
		return //silly you.

	//Find an ammotype that ISN'T the same, or exhaust the list and don't change.
	var/our_slot = stored_ammo.Find(chambered)

	for(var/index in 1 to stored_ammo.len)
		var/true_index = ((our_slot + index - 1) % stored_ammo.len) + 1 // Stupid ONE BASED lists!
		var/obj/item/ammo_casing/mws_batt/next_batt = stored_ammo[true_index]
		if(chambered != next_batt && !istype(next_batt, chambered.type) && next_batt.cell.charge >= next_batt.e_cost)
			switch_to(next_batt, user)
			break

/obj/item/gun/ballistic/revolver/mws/AltClick(mob/living/user)
	.=..()
	if(magazine)
		user.put_in_hands(magazine)
		magazine.update_icon()
		if(magazine.ammo_count())
			playsound(src, 'sound/weapons/gun_magazine_remove_full.ogg', 70, 1)
		else
			playsound(src, "gun_remove_empty_magazine", 70, 1)
		magazine = null
		to_chat(user, "<span class='notice'>You pull the magazine out of [src].</span>")
		if(chambered)
			chambered = null
		update_icon()

/obj/item/gun/ballistic/revolver/mws/update_overlays()
	.=..()
	if(!chambered)
		return

	var/obj/item/ammo_casing/mws_batt/batt = chambered
	var/batt_color = batt.type_color //Used many times

	//Mode bar
	var/image/mode_bar = image(icon, icon_state = "[initial(icon_state)]_type")
	mode_bar.color = batt_color
	. += mode_bar

	//Barrel color
	var/mutable_appearance/barrel_color = mutable_appearance(icon, "[initial(icon_state)]_barrel", color = batt_color)
	barrel_color.alpha = 150
	. += barrel_color

	//Charge bar
	var/ratio = can_shoot() ? CEILING(clamp(batt.cell.charge / batt.cell.maxcharge, 0, 1) * charge_sections, 1) : 0
	for(var/i = 0, i < ratio, i++)
		var/mutable_appearance/charge_bar = mutable_appearance(icon,  "[initial(icon_state)]_charge", color = batt_color)
		charge_bar.pixel_x = i
		. += charge_bar