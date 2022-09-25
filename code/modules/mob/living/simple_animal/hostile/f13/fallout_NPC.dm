/mob/living/simple_animal/hostile/vault
	name = "Vault Dweller"
	desc = "Just a Vault Dweller"
	icon = 'icons/fallout/mobs/humans/fallout_npc.dmi'
	icon_state = "vault_dweller"
	icon_living = "vault_dweller"
	icon_dead = "vault_dweller"
	speak_chance = 0
	turns_per_move = 5
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	response_help_simple = "pokes"
	response_disarm_simple = "shoves"
	response_harm_simple = "hits"
	speed = 1
	stat_attack = 1
	robust_searching = 1
	maxHealth = 100
	health = 100
	harm_intent_damage = 8
	melee_damage_lower = 10
	melee_damage_upper = 10
	attack_verb_simple = "punches"
	attack_sound = 'sound/weapons/punch1.ogg'
	a_intent = INTENT_HARM
	loot = list(/obj/effect/mob_spawn/human/corpse/vault)
	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 15
	faction = list("vault", "city")
	check_friendly_fire = 1
	status_flags = CANPUSH
	del_on_death = 1
	speak_chance = 1

/obj/effect/mob_spawn/human/corpse/vault
	name = "Vault Dweller"
	uniform = /obj/item/clothing/under/f13/vault/v13
	//suit = /obj/item/clothing/suit/armor/vest
	shoes = /obj/item/clothing/shoes/sneakers/brown
	//gloves = /obj/item/clothing/gloves/combat
	//radio = /obj/item/device/radio/headset
	//mask = /obj/item/clothing/mask/gas
	//head = /obj/item/clothing/head/head/swat
	//back = /obj/item/weapon/storage/backpack


/mob/living/simple_animal/hostile/vault/dweller
	minimum_distance = 10
	retreat_distance = 10
	obj_damage = 0
	environment_smash = 0

/mob/living/simple_animal/hostile/vault/dweller/Aggro()
	..()
	summon_backup(15)
	say("HELP!!")

/mob/living/simple_animal/hostile/vault/dweller/dweller1
	icon_state = "vault_dweller1"
	icon_living = "vault_dweller1"
	icon_dead = "vault_dweller1"
	icon_gib = "vault_dweller1"

/mob/living/simple_animal/hostile/vault/dweller/dweller2
	icon_state = "vault_dweller2"
	icon_living = "vault_dweller2"
	icon_dead = "vault_dweller2"
	icon_gib = "vault_dweller2"

/mob/living/simple_animal/hostile/vault/dweller/dweller3
	icon_state = "vault_dweller3"
	icon_living = "vault_dweller3"
	icon_dead = "vault_dweller3"
	icon_gib = "vault_dweller3"

/mob/living/simple_animal/hostile/vault/dweller/dweller4
	icon_state = "vault_dweller4"
	icon_living = "vault_dweller4"
	icon_dead = "vault_dweller4"
	icon_gib = "vault_dweller4"

/mob/living/simple_animal/hostile/vault/dweller/dweller5
	icon_state = "vault_dweller5"
	icon_living = "vault_dweller5"
	icon_dead = "vault_dweller5"
	icon_gib = "vault_dweller5"

/mob/living/simple_animal/hostile/vault/security
	name = "Vault Security"
	desc = "Just a Vault Security"
	icon_state = "vault_dweller_sec"
	icon_living = "vault_dweller_sec"
	icon_dead = "vault_dweller_sec"
	icon_gib = "vault_dweller_sec"
	maxHealth = 200
	health = 200
	retreat_distance = 5
	minimum_distance = 5
	loot = list(/obj/effect/mob_spawn/human/corpse/vault/security)
	healable = 1
	ranged = 1
	projectiletype = /obj/item/projectile/beam
	projectilesound = 'sound/weapons/resonator_fire.ogg'
	speak_chance = 1


/mob/living/simple_animal/hostile/vault/security/Aggro()
	..()
	summon_backup(15)

/obj/effect/mob_spawn/human/corpse/vault/security
	name = "Vault Security"
	uniform = /obj/item/clothing/under/f13/vault/v13
	suit = /obj/item/clothing/suit/armor/bulletproof
	shoes = /obj/item/clothing/shoes/sneakers/brown
	//gloves = /obj/item/clothing/gloves/combat
	//radio = /obj/item/device/radio/headset
	//mask = /obj/item/clothing/mask/gas
	head = /obj/item/clothing/head/helmet/riot
	//back = /obj/item/weapon/storage/backpack


/////////////////
// ENCLAVE NPC //
/////////////////

/mob/living/simple_animal/hostile/enclave
	name = "enclave specialist"
	desc = "An Enclave officer of some description wielding a rifle. Watch out, they're using ballistics!"
	icon = 'icons/fallout/mobs/humans/fallout_npc.dmi'
	icon_state = "enclave_specialist"
	icon_living = "enclave_specialist"
	maxHealth = 275
	health = 275
	melee_damage_lower = 35
	melee_damage_upper = 40
	retreat_distance = 6
	minimum_distance = 6
	extra_projectiles = 2
	ranged_cooldown_time = 22
	loot = list(/obj/effect/mob_spawn/human/corpse/enclave)
	healable = 1
	ranged = 1
	attack_verb_simple = "gun-butts"
	projectiletype = /obj/item/projectile/bullet/c46x30mm
	projectilesound = 'sound/weapons/gunshot_smg.ogg'
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	speak_chance = 0
	turns_per_move = 5
	response_help_simple = "pokes"
	response_disarm_simple = "shoves"
	response_harm_simple = "hits"
	speed = 0
	stat_attack = 1
	robust_searching = 1
	harm_intent_damage = 8
	attack_verb_simple = "thrusts"
	attack_sound = 'sound/weapons/punch1.ogg'
	a_intent = INTENT_HARM
	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 15
	faction = list("enclave")
	check_friendly_fire = 1
	status_flags = CANPUSH
	del_on_death = 1
	speak = list("For the Enclave!", "Stars and Stripes!", "Liberty or death!")
	speak_emote = list("says", "lectures", "rants", "talks down", "goes on")
	speak_chance = 0

// Enclave Scientist
/mob/living/simple_animal/hostile/enclave/scientist
	name = "enclave scientist"
	desc = "An Enclave Scientist wearing an advanced radiation suit. While they may run from you, that does not exempt them from the evil they have committed."
	icon_state = "enclave_scientist"
	icon_living = "enclave_scientist"
	maxHealth = 150
	health = 150
	melee_damage_lower = 25
	melee_damage_upper = 25
	minimum_distance = 10
	retreat_distance = 10
	obj_damage = 0
	environment_smash = 0
	loot = list(/obj/effect/mob_spawn/human/corpse/enclave/scientist)
	ranged_cooldown_time = 30
	projectiletype = /obj/item/projectile/energy/declone
	projectilesound = 'sound/weapons/wave.ogg'

// Enclave Armored Infantry
/mob/living/simple_animal/hostile/enclave/armoredinfantry
	name = "enclave armored infantry"
	desc = "An Enclave Soldier wearing Advanced Power Armor and a plasma caster. Play time's over, mutie."
	icon_state = "enclave_armored"
	icon_living = "enclave_armored"
	icon_dead = "enclave_soldier"
	maxHealth = 750
	health = 750
	melee_damage_lower = 55
	melee_damage_upper = 55
	extra_projectiles = 5 //6 projectiles. oh lord.
	retreat_distance = 3
	minimum_distance = 5
	ranged_cooldown_time = 12
	loot = list(/obj/effect/mob_spawn/human/corpse/enclave/armored)
	attack_verb_simple = "power-fists"
	projectiletype = /obj/item/projectile/f13plasma/repeater
	projectilesound = 'sound/f13weapons/plasmarifle.ogg'

// Enclave corpses
/obj/effect/mob_spawn/human/corpse/enclave
	name = "enclave specialist"
	uniform = /obj/item/clothing/under/f13/enclave_officer
	suit = /obj/item/clothing/suit/armor/f13/combat/enclave
	head = /obj/item/clothing/head/soft/f13/enclave

/obj/effect/mob_spawn/human/corpse/enclave/scientist
	name = "enclave scientist"
	uniform = /obj/item/clothing/under/f13/enclave_officer/enclave_under
	suit = /obj/item/clothing/suit/envirosuit
	shoes = /obj/item/clothing/shoes/f13/military
	gloves = /obj/item/clothing/gloves/f13/military
	head = /obj/item/clothing/head/envirosuit

/obj/effect/mob_spawn/human/corpse/enclave/armored
	name = "enclave armored infantry"
	uniform = /obj/item/clothing/under/syndicate/combat
	suit = /obj/item/clothing/suit/armor/f13/power_armor/advanced
	head = /obj/item/clothing/head/helmet/f13/power_armor/advanced/mk2

//////////////////////
//    SNEEDCLAVE   //
/////////////////////

/mob/living/simple_animal/hostile/modernenclave
	name = "enclave infantryman"
	desc = "A mysterious soldier wearing heavily modified combat armor very much ressembling a power armor at this point, he holds a G11."
	icon = 'icons/fallout/mobs/humans/fallout_npc.dmi'
	icon_state = "sneedclave_infantry"
	icon_living = "sneedclave_infantry"
	icon_dead = "sneedclave_dead"
	maxHealth = 500
	health = 500
	melee_damage_lower = 35
	melee_damage_upper = 40
	extra_projectiles = 3
	ranged_cooldown_time = 20
	decompose = 0
	healable = 1
	ranged = 1
	attack_verb_simple = "gun-butts"
	projectiletype = /obj/item/projectile/bullet/a473
	projectilesound = 'sound/f13weapons/assaultrifle_fire.ogg'
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	turns_per_move = 5
	response_help_simple = "pokes"
	response_disarm_simple = "shoves"
	response_harm_simple = "hits"
	speed = 1
	stat_attack = UNCONSCIOUS
	robust_searching = 1
	a_intent = INTENT_HARM
	faction = list("enclave")
	check_friendly_fire = 1
	status_flags = CANPUSH
	del_on_death = 0
	speak = list("For the Enclave!", "Stars and Stripes!", "Liberty or death!")
	speak_emote = list("says", "lectures", "rants", "talks down", "goes on")
	speak_chance = 4
	taunt_chance = 0
	retreat_distance = 2
	minimum_distance = 4
	check_friendly_fire = 1

/mob/living/simple_animal/hostile/modernenclave/bullet_act(obj/item/projectile/Proj)
	if(!Proj)
		CRASH("[src] sentrybot invoked bullet_act() without a projectile")
	if(prob(70) || Proj.damage > 35)
		return ..()
	else
		visible_message(SPAN_DANGER("\The [Proj] bounces off \the [src]'s armor plating!"))
		return FALSE

/mob/living/simple_animal/hostile/modernenclave/xl7
	desc = "A mysterious soldier wearing heavily modified combat armor very much ressembling a power armor at this point, he holds a XL70E3."
	icon_state = "sneedclave_infantry_b"
	icon_living = "sneedclave_infantry_b"
	retreat_distance = 4
	minimum_distance = 6
	projectiletype = /obj/item/projectile/bullet/a762/match
	projectilesound = 'sound/f13weapons/m14.ogg'
	ranged_cooldown_time = 25
	extra_projectiles = 1

/mob/living/simple_animal/hostile/modernenclave/rocket
	desc = "A mysterious soldier wearing heavily modified combat armor very much ressembling a power armor at this point, he holds a rocket launcher."
	icon_state = "sneedclave_infantry_c"
	icon_living = "sneedclave_infantry_c"
	retreat_distance = 6
	minimum_distance = 8
	projectiletype = /obj/item/projectile/bullet/a40mm
	projectilesound = 'sound/weapons/grenadelaunch.ogg'
	ranged_cooldown_time = 75
	extra_projectiles = 0

/mob/living/simple_animal/hostile/modernenclave/heavy
	name = "enclave elite"
	desc = "A massive armored hulk covered up in pristine state of the art power armor, he menacingly wields a plasma rifle."
	icon_state = "sneedclave_heavy"
	icon_living = "sneedclave_heavy"
	icon_dead = "sneedclave_heavy_dead"
	maxHealth = 1500
	health = 1500
	extra_projectiles = 1
	ranged_cooldown_time = 25
	projectiletype = /obj/item/projectile/f13plasma/pistol
	projectilesound = 'sound/f13weapons/plasma_rifle.ogg'
	speed = 0.8
	speak = list("For the Enclave!", "Stars and Stripes!", "Liberty or death!", "Just another naive bimbo to put down!", "I will be enjoying this!")
	retreat_distance = 2
	minimum_distance = 5
	obj_damage = 200
	environment_smash = 2
	armour_penetration = 0.5 //powerfist
	attack_verb_simple = "power-slams"

/mob/living/simple_animal/hostile/modernenclave/heavy/pulse
	desc = "A massive armored hulk covered up in pristine state of the art power armor, he menacingly wields a pulse rifle."
	icon_state = "sneedclave_heavy_b"
	icon_living = "sneedclave_heavy_b"
	extra_projectiles = 0
	ranged_cooldown_time = 20
	projectiletype = /obj/item/projectile/beam/laser/oldpulse
	projectilesound = 'sound/weapons/ionrifle.ogg'

//////////////////////
//       HECU      //
/////////////////////

/mob/living/simple_animal/hostile/hecu
	name = "HECU infantry member"
	desc = "A member of the hazardous enviroment combat unit often shortened to just HECU, they bear West-tek markings and are clearly ready to kill."
	icon = 'icons/fallout/mobs/humans/fallout_npc.dmi'
	icon_state = "hecu"
	icon_living = "hecu"
	icon_dead = "hecu_dead"
	maxHealth = 500
	health = 500
	melee_damage_lower = 80
	melee_damage_upper = 80
	attack_sound = 'sound/f13weapons/max_sawn_off.ogg'
	attack_verb_simple = "point-blanks"
	sharpness = SHARP_EDGED
	armour_penetration = 0.3
	extra_projectiles = 2
	ranged_cooldown_time = 35
	decompose = 0
	ranged = 1
	projectiletype = /obj/item/projectile/bullet/c5mm
	projectilesound = 'sound/f13weapons/marksman_rifle.ogg'
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	turns_per_move = 8
	response_help_simple = "pokes"
	response_disarm_simple = "shoves"
	response_harm_simple = "hits"
	speed = 0.8
	stat_attack = UNCONSCIOUS
	robust_searching = 1
	a_intent = INTENT_HARM
	check_friendly_fire = 1
	status_flags = CANPUSH
	del_on_death = 0
	speak = list("Boogie sighted!", "Got eyes on the target!", "Engaging target!")
	speak_chance = 4
	taunt_chance = 0
	retreat_distance = 2
	minimum_distance = 4
	check_friendly_fire = 1

/mob/living/simple_animal/hostile/hecu/bullet_act(obj/item/projectile/Proj)
	if(!Proj)
		CRASH("[src] sentrybot invoked bullet_act() without a projectile")
	if(prob(10) && health > 1)
		visible_message(SPAN_DANGER("\The [src] drops a frag grenade under their feet!"))
		var/flashbang_turf = get_turf(src)
		if(!flashbang_turf)
			return
		var/obj/item/grenade/f13/frag/sentry/S = new /obj/item/grenade/f13/frag/sentry(flashbang_turf)
		S.preprime(user = null)
	if(prob(90) || Proj.damage > 20)
		return ..()
	else
		visible_message(SPAN_DANGER("\The [Proj] bounces off \the [src]'s armor plating!"))
		return FALSE

/mob/living/simple_animal/hostile/hecu/leader
	name = "HECU infantry squad leader"
	desc = "A member of the hazardous enviroment combat unit often shortened to just HECU, they bear West-tek markings and are clearly ready to kill. This one looks like he is in charge."
	icon = 'icons/fallout/mobs/humans/fallout_npc.dmi'
	icon_state = "hecu_sl"
	icon_living = "hecu_sl"
	icon_dead = "hecu_sl_dead"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	attack_verb_simple = "slashes"
	armour_penetration = 0.2
	extra_projectiles = 0
	ranged_cooldown_time = 25
	projectiletype = /obj/item/projectile/bullet/a50MG
	projectilesound = 'sound/f13weapons/44mag.ogg'

/////////////////////
// BROTHERHOOD NPC //
/////////////////////

/mob/living/simple_animal/hostile/brotherhood
	name = "Brotherhood Knight"
	desc = "The brotherhood never fails."
	icon = 'icons/fallout/mobs/humans/fallout_npc.dmi'
	icon_state = "bs_knight"
	icon_living = "bs_knight"
	speak_chance = 0
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	faction = "BOS"
	turns_per_move = 5
	response_help_simple = "pokes"
	response_disarm_simple = "shoves"
	response_harm_simple = "hits"
	speed = 1
	stat_attack = 1
	robust_searching = 1
	maxHealth = 250
	health = 250
	harm_intent_damage = 8
	melee_damage_lower = 10
	melee_damage_upper = 10
	attack_verb_simple = "áüåò"
	attack_sound = 'sound/weapons/punch1.ogg'
	a_intent = INTENT_HARM
	loot = list(/obj/effect/mob_spawn/human/corpse/bs)
	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 15
	check_friendly_fire = 1
	status_flags = CANPUSH
	del_on_death = 1
	speak = list("Prepare to die!")
	speak_emote = list("rushes")
	speak_chance = 1
	retreat_distance = 5
	minimum_distance = 5
	healable = 1
	ranged = 1
	projectiletype = /obj/item/projectile/beam
	projectilesound = 'sound/weapons/resonator_fire.ogg'

/obj/effect/mob_spawn/human/corpse/bs
	name = "Brotherhood Knight"
	uniform = /obj/item/clothing/under/f13/bdu
	suit = /obj/item/clothing/suit/armor/f13/combat/brotherhood
	shoes = /obj/item/clothing/shoes/f13/military
	gloves = /obj/item/clothing/gloves/f13/military
	head = /obj/item/clothing/head/helmet/f13/combat/brotherhood


/mob/living/simple_animal/hostile/brotherhood/paladin
	name = "Brotherhood Paladin"
	desc = "A Paladin equipped with an AER9 and T-45d power armor."
	icon_state = "bs_paladin"
	icon_living = "bs_paladin"
	loot = list(/obj/effect/mob_spawn/human/corpse/bs/paladin)
	maxHealth = 600
	health = 600
	projectiletype = /obj/item/projectile/beam
	projectilesound = 'sound/weapons/resonator_fire.ogg'

/obj/effect/mob_spawn/human/corpse/bs/paladin
	name = "Brotherhood Paladin"
	suit = /obj/item/clothing/suit/armor/f13/power_armor/t45d
	gloves = /obj/item/clothing/gloves/f13/military



///////////////
// NCR = NPC //
///////////////

/mob/living/simple_animal/hostile/ncr_trooper
	name = "NCR"
	desc = "The Republics finest."
	icon = 'icons/fallout/mobs/humans/fallout_npc.dmi'
	icon_state = "ncr_trooper"
	icon_living = "ncr_trooper"
	faction = list("NCR")
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	speak_chance = 0
	turns_per_move = 5
	response_help_simple = "pokes"
	response_disarm_simple = "shoves"
	response_harm_simple = "hits"
	speed = 1
	stat_attack = 1
	robust_searching = 1
	maxHealth = 150
	health = 150
	harm_intent_damage = 8
	melee_damage_lower = 10
	melee_damage_upper = 10
	attack_verb_simple = "áüåò"
	attack_sound = 'sound/weapons/punch1.ogg'
	a_intent = INTENT_HARM
	loot = list(/obj/effect/mob_spawn/human/corpse/ncr)
	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 15
	check_friendly_fire = 1
	status_flags = CANPUSH
	del_on_death = 1
	speak = list("Patrolling the Mojave almost makes you wish for a nuclear winter.", "When I got this assignment I was hoping there would be more gambling.", "It's been a long tour, all I can think about now is going back home.", "You know, if you were serving, you'd probably be halfway to general by now.", "You oughtta think about enlisting. We need you here.")
	speak_emote = list("says")
	speak_chance = 1
	healable = 1
	ranged = 1
	projectiletype = /obj/item/projectile/bullet/a762
	projectilesound = 'sound/weapons/garandshot.ogg'
	casingtype = /obj/item/ammo_casing/a762
	retreat_distance = 5
	minimum_distance = 5

/obj/effect/mob_spawn/human/corpse/ncr
	name = "NCR Trooper"
	uniform = /obj/item/clothing/under/f13/ncr
	suit = /obj/item/clothing/suit/armor/f13/ncrarmor/reinforced
	shoes = /obj/item/clothing/shoes/f13/military/ncr
	gloves = /obj/item/clothing/gloves/f13/leather/fingerless
	head = /obj/item/clothing/head/f13/ncr


/mob/living/simple_animal/hostile/ncr_trooper/sergeant
	name = "NCR Sergeant"
	icon_state = "ncr_sergeant"
	icon_living = "ncr_sergeant"
	loot = list(/obj/effect/mob_spawn/human/corpse/ncr/sergeant)
	maxHealth = 200
	health = 200
	projectiletype = /obj/item/projectile/bullet/a556/simple
	projectilesound = 'sound/f13weapons/assaultrifle_fire.ogg'
	casingtype = /obj/item/ammo_casing/a556

/obj/effect/mob_spawn/human/corpse/ncr/sergeant
	name = "NCR Sergeant"
	suit = /obj/item/clothing/suit/armor/f13/ncrarmor/reinforced
	head = /obj/item/clothing/head/f13/ncr



////////////////
// LEGION NPC //
////////////////

/mob/living/simple_animal/hostile/legion_prime
	name = "Legion Prime"
	desc = "Caesars will be done"
	icon = 'icons/fallout/mobs/humans/fallout_npc.dmi'
	icon_state = "legion_prime"
	icon_living = "legion_prime"
	icon_dead = "legion_prime"
	faction = list("legion")
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	speak_chance = 0
	turns_per_move = 5
	retreat_distance = 5
	minimum_distance = 5
	response_help_simple = "pokes"
	response_disarm_simple = "shoves"
	response_harm_simple = "hits"
	speed = 1
	stat_attack = 1
	robust_searching = 1
	healable = 1
	ranged = 1
	maxHealth = 150
	health = 150
	harm_intent_damage = 8
	melee_damage_lower = 10
	melee_damage_upper = 10
	attack_verb_simple = "attacks"
	attack_sound = 'sound/weapons/punch1.ogg'
	a_intent = INTENT_HARM
	loot = list(/obj/effect/mob_spawn/human/corpse/legion)
	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 15
	check_friendly_fire = 1
	status_flags = CANPUSH
	del_on_death = 1
	speak = list("Ave, true to Caesar.", "True to Caesar.", "Ave, Amicus.", "The new slave girls are quite beautiful.", "Give me cause, Profligate.", "Degenerates like you belong on a cross.")
	speak_emote = list("says")
	speak_chance = 1
	projectiletype = /obj/item/projectile/bullet/a762/sport/simple
	projectilesound = 'sound/weapons/garandshot.ogg'
	casingtype = /obj/item/ammo_casing/a762

/obj/effect/mob_spawn/human/corpse/legion
	name = "Legion Prime"
	uniform = /obj/item/clothing/under/f13/rag
	suit = /obj/item/clothing/suit/armor/f13/legion/recruit
	shoes = /obj/item/clothing/shoes/f13/military/leather
	head = /obj/item/clothing/head/helmet/f13/legion/prime

/mob/living/simple_animal/hostile/legion_prime/decanus
	name = "Legion Decanus"
	icon_state = "legion_decan"
	icon_living = "legion_decan"
	icon_dead = "legion_decan"
	loot = list(/obj/effect/mob_spawn/human/corpse/legion/decan)
	maxHealth = 225
	health = 225

/obj/effect/mob_spawn/human/corpse/legion/decan
	name = "Legion Decanus"
	suit = /obj/item/clothing/suit/armor/f13/legion/vet
	shoes = /obj/item/clothing/shoes/f13/military/leather
	head = /obj/item/clothing/head/helmet/f13/legion/prime/decan
