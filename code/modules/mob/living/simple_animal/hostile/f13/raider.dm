/mob/living/simple_animal/hostile/raider
	name = "Raider"
	desc = "Another murderer churned out by the wastes."
	icon = 'icons/mob/wastemobs.dmi'
	icon_state = "raidermelee"
	icon_living = "raidermelee"
	icon_dead = "raider_dead"
	icon_gib = "syndicate_gib"
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	speak_chance = 0
	turns_per_move = 5
	response_help_simple = "pokes"
	response_disarm_simple = "shoves"
	response_harm_simple = "hits"
	speed = 1
	maxHealth = 100
	health = 100
	harm_intent_damage = 8
	melee_damage_lower = 25
	melee_damage_upper = 50
	attack_verb_simple = "punches"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	a_intent = INTENT_HARM
	loot = list(/obj/item/kitchen/knife/combat/survival)
	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 15
	faction = list("raider")
	check_friendly_fire = 1
	status_flags = CANPUSH
	del_on_death = 0
	decompose = TRUE
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab/human = 2,
							/obj/item/stack/sheet/animalhide/human = 1)

/mob/living/simple_animal/hostile/raider/thief

/mob/living/simple_animal/hostile/raider/thief/movement_delay()
	return -2

/mob/living/simple_animal/hostile/raider/thief/AttackingTarget()
	if(ishuman(target))
		var/mob/living/carbon/human/H = target
		var/back_target = H.back
		if(back_target)
			H.dropItemToGround(back_target, TRUE)
			src.transferItemToLoc(back_target, src, TRUE)
		var/belt_target = H.belt
		if(belt_target)
			H.dropItemToGround(belt_target, TRUE)
			src.transferItemToLoc(belt_target, src, TRUE)
		var/shoe_target = H.shoes
		if(shoe_target)
			H.dropItemToGround(shoe_target, TRUE)
			src.transferItemToLoc(shoe_target, src, TRUE)
	retreat_distance = 50
	addtimer(CALLBACK(src, .proc/undo_retreat), 5 MINUTES)

/mob/living/simple_animal/hostile/raider/thief/proc/undo_retreat()
	retreat_distance = null

/mob/living/simple_animal/hostile/raider/thief/death(gibbed)
	for(var/obj/I in contents)
		src.dropItemToGround(I)
	. = ..()

/mob/living/simple_animal/hostile/raider/ranged
	icon_state = "raiderranged"
	icon_living = "raiderranged"
	loot = list(/obj/item/gun/ballistic/automatic/pistol/sig)
	ranged = 1
	maxHealth = 100
	health = 100
	retreat_distance = 4
	minimum_distance = 6
	projectiletype = /obj/item/projectile/bullet/c9mm/op
	projectilesound = 'sound/f13weapons/ninemil.ogg'

/mob/living/simple_animal/hostile/raider/legendary
	loot = list(/obj/item/kitchen/knife/combat/survival)
	name = "Legendary Raider"
	desc = "Another murderer churned out by the wastes - this one seems a bit faster than the average..."
	color = "#FFFF00"
	maxHealth = 350
	health = 350
	speed = 1.2
	obj_damage = 300
	aggro_vision_range = 15

/mob/living/simple_animal/hostile/raider/ranged/legendary
	name = "Legendary Raider"
	desc = "Another murderer churned out by the wastes, wielding a decent pistol and looking very strong"
	color = "#FFFF00"
	icon_state = "raiderranged"
	icon_living = "raiderranged"
	loot = list(/obj/item/gun/ballistic/revolver/m29)
	ranged = 1
	maxHealth = 500
	health = 500
	retreat_distance = 1
	minimum_distance = 2
	projectiletype = /obj/item/projectile/bullet/m44
	projectilesound = 'sound/f13weapons/44mag.ogg'
	extra_projectiles = 1
	aggro_vision_range = 15
	obj_damage = 300

/mob/living/simple_animal/hostile/raider/ranged/metal
	icon_state = "metal_raider"
	icon_living = "metal_raider"
	icon_dead = "metal_raider_dead"
	loot = list(/obj/item/gun/ballistic/automatic/pistol/m1911)
	ranged = 1
	maxHealth = 180
	health = 180
	projectiletype = /obj/item/projectile/bullet/c45/op
	projectilesound = 'sound/weapons/gunshot.ogg'

/mob/living/simple_animal/hostile/raider/ranged/boss
	name = "Raider Boss"
	icon_state = "raiderboss"
	icon_living = "raiderboss"
	icon_dead = "raiderboss_dead"
	maxHealth = 150
	health = 150
	extra_projectiles = 3
	projectiletype = /obj/item/projectile/bullet/c45/op
	loot = list(/obj/item/gun/ballistic/automatic/smg/greasegun, /obj/item/clothing/suit/armor/f13/combat/mk2/raider, /obj/item/clothing/head/helmet/f13/combat/mk2/raider)

/mob/living/simple_animal/hostile/raider/ranged/boss/Aggro()
	..()
	summon_backup(15)
	say("KILL 'EM, FELLAS!")


/mob/living/simple_animal/hostile/raider/sulphite
	name = "Sulphite Brawler"
	desc = "A raider with low military grade armor and a shishkebab"
	icon_state = "melee_sulphitemob"
	icon_living = "melee_sulphitemob"
	icon_dead = "raider_sulphite_dead"
	turns_per_move = 5
	response_help_simple = "pokes"
	response_disarm_simple = "shoves"
	response_harm_simple = "hits"
	speed = 1
	stat_attack = 1
	robust_searching = 1
	maxHealth = 220
	health = 220
	harm_intent_damage = 8
	melee_damage_lower = 40
	melee_damage_upper = 55
	attack_verb_simple = "attacks"
	attack_sound = 'sound/weapons/punch1.ogg'
	a_intent = INTENT_HARM
	loot = list(/obj/item/shishkebabpack, /obj/item/clothing/head/helmet/f13/sulphitehelm, /obj/item/clothing/suit/armor/f13/sulphitearmor)
	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	loot = list()
	unsuitable_atmos_damage = 15
	faction = list("raiders")
	check_friendly_fire = 1
	status_flags = CANPUSH

/mob/living/simple_animal/hostile/raider/sulphite/boss
	name = "Sulphite Boss"
	desc = "A raider with modified power armour and an incinerator"
	icon_state = "boss_mob"
	icon_living = "boss_mob"
	icon_dead = "boss_mob_dead"
	ranged = 1
	stat_attack = 1
	robust_searching = 1
	maxHealth = 400
	health = 400
	retreat_distance = 1
	loot = list(/obj/item/gun/ballistic/rifle/mag/antimateriel/incinerator)
	projectiletype = /obj/item/projectile/incendiary/flamethrower/incinerator
	projectilesound = 'sound/f13weapons/antimaterielfire.ogg'

/mob/living/simple_animal/hostile/raider/Aggro()
	..()
	summon_backup(15)
	say("HURRY, HURRY, HURRY!!!")

/mob/living/simple_animal/hostile/raider/firefighter
	icon_state = "firefighter_raider"
	icon_living = "firefighter_raider"
	icon_dead = "firefighter_raider_dead"
	icon_gib = "firefighter_raider"
	retreat_distance = 0
	minimum_distance = 0
	melee_damage_lower = 50
	melee_damage_upper = 50
	loot = list(/obj/item/twohanded/fireaxe)
	healable = 1
	ranged = 0

/mob/living/simple_animal/hostile/raider/tribal
	icon_state = "tribal_raider"
	icon_living = "tribal_raider"
	icon_dead = "tribal_raider_dead"
	icon_gib = "tribal_raider"
	retreat_distance = 0
	minimum_distance = 0
	melee_damage_lower = 40
	melee_damage_upper = 40
	loot = list(/obj/item/twohanded/spear)
	healable = 1
	ranged = 0

/mob/living/simple_animal/hostile/raider/baseball
	icon_state = "baseball_raider"
	icon_living = "baseball_raider"
	icon_dead = "baseball_raider_dead"
	icon_gib = "baseball_raider"
	retreat_distance = 1
	minimum_distance = 1
	melee_damage_lower = 40
	melee_damage_upper = 40
	maxHealth = 200
	health = 200
	loot = list(/obj/item/twohanded/baseball)
	healable = 1
	ranged = 0

/mob/living/simple_animal/hostile/raider/biker
	icon_state = "biker_raider"
	icon_living = "biker_raider"
	icon_dead = "biker_raider_dead"
	icon_gib = "biker_raider"
	retreat_distance = 4
	minimum_distance = 4
	melee_damage_lower = 20
	melee_damage_upper = 20
	maxHealth = 200
	health = 200
	loot = list(/obj/item/gun/ballistic/revolver/thatgun)
	healable = 1
	ranged = 1
	projectiletype = /obj/item/projectile/bullet/a556/match
	projectilesound = 'sound/f13weapons/magnum_fire.ogg'
	casingtype = /obj/item/ammo_casing/a556