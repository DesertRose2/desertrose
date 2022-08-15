// In this document: Junker gang, Sulphite gang


/////////////////
// JUNKER GANG //
/////////////////

/mob/living/simple_animal/hostile/raider/junker
	name = "Junker"
	desc = "One of the Junkers, raiders who build, rebuild and reprogram robots to suit their own needs."
	icon_state = "junker"
	icon_living = "junker"
	icon_dead = "junker_dead"
	speak = list("Gotta find me some jet...", "I'M GONNA SCRAP YOU FOR PARTS!", "This isn't anything like training... Shooting at plywood? How's that supposed to get me ready for this hell!")
	speak_chance = 10
	retreat_distance = 5
	minimum_distance = 4
	melee_damage_lower = 20
	melee_damage_upper = 20
	maxHealth = 200
	health = 200
	loot = list(/obj/effect/mob_spawn/human/corpse/raider/junker, /obj/item/gun/ballistic/revolver/m29/coltwalker)
	healable = 1
	ranged = 1
	del_on_death = 1
	projectiletype = /obj/item/projectile/bullet/m44/swc
	projectilesound = 'sound/f13weapons/magnum_fire.ogg'
	casingtype = /obj/item/ammo_casing/m44/swc
	faction = list("raider", "junker")

/mob/living/simple_animal/hostile/raider/junker/hijacker
	name = "Junker Hijacker"
	icon_state	=	"junker_hijacker"
	icon_living	=	"junker_hijacker"
	ranged = 0
	melee_damage_lower = 30
	melee_damage_upper = 60
	retreat_distance = 5
	minimum_distance = 0
	loot = list(/obj/effect/mob_spawn/human/corpse/raider/junker, /obj/item/cautery, /obj/item/bodypart/r_arm/robot, /obj/item/hatchet)

/mob/living/simple_animal/hostile/raider/junker/scrapper
	name = "Junker Scrapper"
	icon_state	=	"junker_scrapper"
	icon_living	=	"junker_scrapper"
	projectiletype = /obj/item/projectile/ion/weak
	projectilesound = 'sound/f13weapons/shotgun.ogg'
	loot = list(/obj/effect/mob_spawn/human/corpse/raider/junker/hijacker, /obj/item/gun/ballistic/revolver/ballisticfist)
	maxHealth = 350
	health = 350
	robust_searching = 1
	melee_damage_lower = 50
	melee_damage_upper = 60

/mob/living/simple_animal/hostile/raider/junker/boss
	name = "Junker Boss"
	icon_state	=	"junker_boss"
	icon_living	=	"junker_boss"
	speak = list("GO GET ME JET!", "I'M GONNA SCRAP YOU FOR PARTS!", "We gotta expand soon... Else we're gonna be overrun by that town...")
	maxHealth = 700
	health = 700
	retreat_distance = 8
	minimum_distance = 6
	loot = list(/obj/effect/mob_spawn/human/corpse/raider/junker, /obj/item/gun/ballistic/rifle/mag/antimateriel/incinerator)
	projectiletype = /obj/item/projectile/incendiary/flamethrower/incinerator
	projectilesound = 'sound/f13weapons/antimaterielfire.ogg'

/obj/effect/mob_spawn/human/corpse/raider/junker
	uniform = /obj/item/clothing/under/f13/machinist
	suit = /obj/item/clothing/suit/armor/f13/raider/junker
	shoes = /obj/item/clothing/shoes/f13/military/plated
	gloves = /obj/item/clothing/gloves/f13/handwraps
	head = /obj/item/clothing/head/helmet/f13/raider/eyebot

/obj/effect/mob_spawn/human/corpse/raider/junker/hijacker
	head = /obj/item/clothing/head/helmet/f13/raider/eyebot/assaultron

/obj/effect/mob_spawn/human/corpse/raider/junker/boss
	suit = /obj/item/clothing/suit/armor/f13/raider/junker/boss
	head = /obj/item/clothing/head/helmet/f13/raider/eyebot/sentry


///////////////////
// SULPHITE GANG //
/////////////////// - these guys legit looks terrible compared to junkers, use only if desperate

/mob/living/simple_animal/hostile/raider/sulphite
	name = "Sulphite Brawler"
	desc = "A raider with low military grade armor and a shishkebab"
	icon_state = "sulphite"
	icon_living = "sulphite"
	icon_dead = "sulphite_dead"
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
	icon_state = "sulphite_boss"
	icon_living = "sulphite_boss"
	icon_dead = "sulphite_boss_dead"
	ranged = 1
	stat_attack = 1
	robust_searching = 1
	maxHealth = 400
	health = 400
	retreat_distance = 1
	loot = list(/obj/item/gun/ballistic/rifle/mag/antimateriel/incinerator)
	projectiletype = /obj/item/projectile/incendiary/flamethrower/incinerator
	projectilesound = 'sound/f13weapons/antimaterielfire.ogg'