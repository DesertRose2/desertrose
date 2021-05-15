/mob/living/simple_animal/hostile/xray
	name = "x-ray grunt"
	desc = "A once proud member of the NCR turned mercenary."
	icon = 'icons/mob/wastemobs.dmi'
	icon_state = "deserter_melee"
	icon_living = "deserter_melee"
	icon_dead = null
	icon_gib = "syndicate_gib"
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	speak = list("Better this than the Mojave, I guess...", "The fuck am I doing here?", "Nowhere to go... not east... nor west...", "Hope the pay's better than the Army's...")
	speak_chance = 4
	turns_per_move = 5
	response_help_simple = "pokes"
	response_disarm_simple = "shoves"
	response_harm_simple = "hits"
	speed = 1
	maxHealth = 200
	health = 200
	harm_intent_damage = 8
	melee_damage_lower = 25
	melee_damage_upper = 50
	attack_verb_simple = "punches"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	a_intent = INTENT_HARM
	loot = list(/obj/effect/mob_spawn/human/corpse/xray_grunt, /obj/item/shovel/trench)
	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 15
	faction = list("xray")
	check_friendly_fire = 1
	status_flags = CANPUSH
	del_on_death = 1

/obj/effect/mob_spawn/human/corpse/xray_grunt
	id_job = "X-Ray Company Grunt"
	hair_style = "Bald"
	facial_hair_style = "Shaved"
	outfit = /datum/outfit/xraycompanygrunt

/datum/outfit/xraycompanygrunt
	name = "x-ray grunt"
	head = /obj/item/clothing/head/f13/ncr/old
	uniform = /obj/item/clothing/under/f13/exile
	suit = /obj/item/clothing/suit/armor/f13/exile/ncrexile
	shoes = /obj/item/clothing/shoes/f13/military/ncr
	gloves = /obj/item/clothing/gloves/f13/leather/fingerless
	id = /obj/item/card/id/rusted
	mask = /obj/item/clothing/mask/ncr_facewrap
	glasses = /obj/item/clothing/glasses/f13/biker
	belt = /obj/item/storage/belt/military/alt

/mob/living/simple_animal/hostile/xray/ranged
	icon_state = "deserter_pistol"
	icon_living = "deserter_pistol"
	loot = list(/obj/effect/mob_spawn/human/corpse/xray_grunt, /obj/item/gun/ballistic/automatic/pistol/beretta)
	ranged = 1
	maxHealth = 200
	health = 200
	retreat_distance = 4
	minimum_distance = 6
	projectiletype = /obj/item/projectile/bullet/c9mm/op
	projectilesound = 'sound/f13weapons/9mm.ogg'

/mob/living/simple_animal/hostile/xray/ranged/rifle
	icon_state = "deserter_rifle"
	icon_living = "deserter_rifle"
	projectiletype = /obj/item/projectile/bullet/a556/match
	projectilesound = 'sound/f13weapons/varmint_rifle.ogg'
	loot = list(/obj/effect/mob_spawn/human/corpse/xray_grunt, /obj/item/gun/ballistic/automatic/service)

/mob/living/simple_animal/hostile/xray/ranged/rifle/burst
	extra_projectiles = 3
	loot = list(/obj/effect/mob_spawn/human/corpse/xray_grunt, /obj/item/gun/ballistic/automatic/service/automatic)

/mob/living/simple_animal/hostile/xray/ranged/shotgun
	icon_state = "deserter_shotgun"
	icon_living = "deserter_shotgun"
	projectiletype = /obj/item/projectile/bullet/shotgun_slug
	projectilesound = 'sound/f13weapons/shotgun.ogg'
	loot = list(/obj/effect/mob_spawn/human/corpse/xray_grunt, /obj/item/gun/ballistic/shotgun/trench)

/mob/living/simple_animal/hostile/xray/marauder
	name = "x-ray marauder"
	desc = "A once proud member of the NCR turned mercenary. This one is clad in riot gear."
	icon_state = "marauder_pistol"
	icon_living = "marauder_pistol"
	ranged = 1
	maxHealth = 450
	health = 450
	retreat_distance = 0
	minimum_distance = 4
	projectiletype = /obj/item/projectile/bullet/a127mm
	loot = list(/obj/effect/mob_spawn/human/corpse/xray_marauder, /obj/item/gun/ballistic/automatic/pistol/pistol127)
	projectilesound = 'sound/f13weapons/magnum_fire.ogg'
	stat_attack = UNCONSCIOUS

/obj/effect/mob_spawn/human/corpse/xray_marauder
	id_job = "X-Ray Company Marauder"
	outfit = /datum/outfit/xraycompanymarauder

/datum/outfit/xraycompanymarauder
	name = "x-ray marauder"
	head = /obj/item/clothing/head/helmet/f13/ncr/rangercombat/marine
	uniform = /obj/item/clothing/under/f13/dbdu
	suit = /obj/item/clothing/suit/armor/f13/rangercombat/marine
	shoes = /obj/item/clothing/shoes/f13/military/leather
	gloves = /obj/item/clothing/gloves/patrol
	id = /obj/item/card/id/rusted
	belt = /obj/item/storage/belt/military/leather

/mob/living/simple_animal/hostile/xray/marauder/rifle
	icon_state = "marauder_rifle"
	icon_living = "marauder_rifle"
	projectiletype = /obj/item/projectile/bullet/a556/match
	loot = list(/obj/effect/mob_spawn/human/corpse/xray_marauder, /obj/item/gun/ballistic/automatic/marksman)
	projectilesound = 'sound/f13weapons/marksman_rifle.ogg'

/mob/living/simple_animal/hostile/xray/marauder/sniper
	icon_state = "marauder_sniper"
	icon_living = "marauder_sniper"
	projectiletype = /obj/item/projectile/bullet/a762/match
	loot = list(/obj/effect/mob_spawn/human/corpse/xray_marauder, /obj/item/gun/ballistic/automatic/marksman/sniper)
	projectilesound = 'sound/f13weapons/hunting_rifle.ogg'

/mob/living/simple_animal/hostile/xray/marauder/sniper/laser
	icon_state = "marauder_sniper"
	icon_living = "marauder_sniper"
	projectiletype = /obj/item/projectile/beam/laser/wattz2k
	loot = list(/obj/effect/mob_spawn/human/corpse/xray_marauder, /obj/item/gun/energy/laser/wattz2k)
	projectilesound = 'sound/weapons/laser.ogg'

/mob/living/simple_animal/hostile/xray/marauder/assault
	icon_state = "marauder_assault"
	icon_living = "marauder_assault"
	projectiletype = /obj/item/projectile/bullet/a556/match
	extra_projectiles = 3
	loot = list(/obj/effect/mob_spawn/human/corpse/xray_marauder, /obj/item/gun/ballistic/automatic/assault_carbine)
	projectilesound = 'sound/f13weapons/assault_carbine.ogg'

/mob/living/simple_animal/hostile/xray/marauder/boss
	name = "x-ray heavy marauder"
	desc = "A once proud member of the NCR turned mercenary. This one is clad in marine combat armor."
	icon_state = "mmarauder_mg"
	icon_living = "mmarauder_mg"
	maxHealth = 1100
	health = 1100
	projectiletype = /obj/item/projectile/bullet/a50MG/npc
	extra_projectiles = 4
	loot = list(/obj/effect/mob_spawn/human/corpse/xray_marauder_boss, /obj/item/gun/ballistic/automatic/m2a1)
	projectilesound = 'sound/f13weapons/antimaterielfire.ogg'

/mob/living/simple_animal/hostile/xray/marauder/boss/light
	icon_state = "mmarauder_rifle"
	icon_living = "mmarauder_rifle"
	projectiletype = /obj/item/projectile/bullet/a556/match
	extra_projectiles = 3
	loot = list(/obj/effect/mob_spawn/human/corpse/xray_marauder_boss, /obj/item/gun/ballistic/automatic/xl70e3)
	projectilesound = 'sound/f13weapons/assault_carbine.ogg'

/obj/effect/mob_spawn/human/corpse/xray_marauder_boss
	id_job = "X-Ray Company Heavy Marauder"
	outfit = /datum/outfit/xraycompanyheavymarauder

/datum/outfit/xraycompanyheavymarauder
	name = "x-ray heavy marauder"
	head = /obj/item/clothing/head/helmet/f13/combat/marine
	uniform = /obj/item/clothing/under/f13/recon/marine
	suit = /obj/item/clothing/suit/armor/f13/combat/marine
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/combat
	id = /obj/item/card/id/rusted
	belt = /obj/item/storage/belt/military


