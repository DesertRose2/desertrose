/mob/living/simple_animal/hostile/ghoul
	name = "feral ghoul"
	desc = "A ghoul that has lost its mind and become aggressive."
	icon = 'icons/mob/wastemobs.dmi'
	icon_state = "feralghoul"
	icon_living = "feralghoul"
	icon_dead = "feralghoul_dead"
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	robust_searching = 1
	turns_per_move = 5
	speak_emote = list("growls")
	emote_see = list("screeches")
	a_intent = INTENT_HARM
	maxHealth = 50
	health = 50
	speed = 3
	harm_intent_damage = 8
	melee_damage_lower = 15
	melee_damage_upper = 15
	attack_verb_simple = "claw"
	attack_sound = 'sound/hallucinations/growl1.ogg'
	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 20
	gold_core_spawnable = HOSTILE_SPAWN
	faction = list("ghoul")
	decompose = TRUE
	sharpness = SHARP_EDGED //They need to cut their finger nails
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab/human/ghoul = 2,
							/obj/item/stack/sheet/animalhide/human = 1,
							/obj/item/stack/sheet/bone = 1)

//	loot = list(/obj/effect/gibspawner/human, /obj/item/stack/f13Cash/random/low)   // not quite ready for cap drops on ghouls

	emote_taunt_sound = list('sound/f13npc/ghoul/taunt.ogg')
	emote_taunt = list("gurgles", "stares")
	taunt_chance = 30
	aggrosound = list('sound/f13npc/ghoul/aggro1.ogg', 'sound/f13npc/ghoul/aggro2.ogg')
	idlesound = list('sound/f13npc/ghoul/idle.ogg')
	death_sound = 'sound/f13npc/ghoul/ghoul_death.ogg'

/mob/living/simple_animal/hostile/ghoul/reaver
	name = "feral ghoul reaver"
	desc = "A ghoul that has lost its mind and become aggressive. This one is strapped with metal armor, and appears far stronger."
	icon = 'icons/mob/wastemobs.dmi'
	icon_state = "ghoulreaver"
	icon_living = "ghoulreaver"
	icon_dead = "ghoulreaver_dead"
	speed = 2
	maxHealth = 115
	health = 115
	harm_intent_damage = 8
	melee_damage_lower = 20
	melee_damage_upper = 20

/mob/living/simple_animal/hostile/ghoul/reaver/Initialize()
	. = ..()

/mob/living/simple_animal/hostile/ghoul/reaver/Aggro()
	..()
	summon_backup(10)

/mob/living/simple_animal/hostile/ghoul/coldferal
	name = "cold ghoul feral"
	desc = "A ghoul that has lost its mind and become aggressive. This one is strapped with metal armor, and appears far stronger."
	icon = 'icons/mob/wastemobs.dmi'
	icon_state = "cold_feral"
	icon_living = "cold_feral"
	icon_dead = "cold_feral_dead"
	speed = 1.5
	maxHealth = 125
	health = 125
	harm_intent_damage = 8
	melee_damage_lower = 15
	melee_damage_upper = 15

/mob/living/simple_animal/hostile/ghoul/frozenreaver
	name = "frozen ghoul reaver"
	desc = "A ghoul that has lost its mind and become aggressive. This one is strapped with metal armor, and appears far stronger."
	icon = 'icons/mob/wastemobs.dmi'
	icon_state = "frozen_reaver"
	icon_living = "frozen_reaver"
	icon_dead = "frozen_reaver_dead"
	speed = 1.5
	maxHealth = 175
	health = 175
	harm_intent_damage = 8
	melee_damage_lower = 15
	melee_damage_upper = 15

/mob/living/simple_animal/hostile/ghoul/legendary
	name = "legendary ghoul"
	desc = "A ghoul that has lost its mind and become aggressive. This one has exceptionally large, bulging muscles. It looks quite strong."
	icon_state = "glowinghoul"
	icon_living = "glowinghoul"
	icon_dead = "glowinghoul_dead"
	color = "#FFFF00"
	maxHealth = 500
	health = 500
	speed = 2.5
	harm_intent_damage = 8
	melee_damage_lower = 30
	melee_damage_upper = 35
	mob_size = 5
	faction = list("hostile")
	wound_bonus = 0
	bare_wound_bonus = 0

/mob/living/simple_animal/hostile/ghoul/glowing
	name = "glowing feral ghoul"
	desc = "A feral ghoul that has absorbed massive amounts of radiation, causing them to glow in the dark and radiate constantly."
	icon_state = "glowinghoul"
	icon_living = "glowinghoul"
	icon_dead = "glowinghoul_dead"
	maxHealth = 130
	health = 130
	speed = 2
	harm_intent_damage = 8
	melee_damage_lower = 25
	melee_damage_upper = 25

/mob/living/simple_animal/hostile/ghoul/glowing/Initialize()
	. = ..()
	set_light(2)

/mob/living/simple_animal/hostile/ghoul/glowing/Aggro()
	..()
	summon_backup(10)

/mob/living/simple_animal/hostile/ghoul/glowing/AttackingTarget()
	. = ..()
	if(. && ishuman(target))
		var/mob/living/carbon/human/H = target
		H.apply_effect(20, EFFECT_IRRADIATE, 0)

/mob/living/simple_animal/hostile/ghoul/ranged
	name = "fiend ghoul"
	desc = "A ghoul that has lost its mind and become aggressive. It appears to be wearing fiend equipemnt and using a Carl Gustav."
	icon_state = "fiend_ghoul"
	icon_living = "fiend_ghoul"
	icon_dead = "fiend_ghoul_dead"
	maxHealth = 100
	health = 100
	speed = 3
	harm_intent_damage = 8
	melee_damage_lower = 15
	melee_damage_upper = 15
	retreat_distance = 2
	minimum_distance = 6
	check_friendly_fire = 1
	ranged = 1
	ranged_cooldown_time = 40
	projectiletype = /obj/item/projectile/bullet/a357
	projectilesound = 'sound/f13weapons/cowboyrepeaterfire.ogg'
	extra_projectiles = 2

/mob/living/simple_animal/hostile/ghoul/ranged/raider
	name = "raider ghoul"
	desc = "A ghoul that has lost its mind and become aggressive. It appears to be wearing raider equipemnt and using a Brushgun."
	icon_state = "raider_ghoul"
	icon_living = "raider_ghoul"
	icon_dead = "raider_ghoul_dead"
	maxHealth = 140
	health = 140
	ranged_cooldown_time = 30
	projectiletype = /obj/item/projectile/bullet/c4570/swc
	projectilesound = 'sound/f13weapons/brushgunfire.ogg'
	extra_projectiles = 1

/mob/living/simple_animal/hostile/ghoul/ranged/desperado
	name = "desperado ghoul"
	desc = "A ghoul that has lost its mind and become aggressive. It appears to be almost naked and toting two .44 revolvers."
	icon_state = "desperado_ghoul"
	icon_living = "desperado_ghoul"
	icon_dead = "desperado_ghoul_dead"
	maxHealth = 80
	health = 80
	ranged_cooldown_time = 30
	projectiletype = /obj/item/projectile/bullet/m44/simple
	projectilesound = 'sound/f13weapons/44mag.ogg'
	extra_projectiles = 5

/mob/living/simple_animal/hostile/ghoul/ranged/vault
	name = "vault ghoul"
	desc = "A ghoul that has lost its mind and become aggressive. It appears to be dressed in vault gear and using a 10mm SMG."
	icon_state = "vault_ghoul"
	icon_living = "vault_ghoul"
	icon_dead = "vault_ghoul_dead"
	maxHealth = 110
	health = 110
	ranged_cooldown_time = 25
	projectiletype = /obj/item/projectile/bullet/c10mm
	projectilesound = 'sound/f13weapons/10mm_fire_03.ogg'
	extra_projectiles = 2

/mob/living/simple_animal/hostile/ghoul/ranged/vault/shotgun
	desc = "A ghoul that has lost its mind and become aggressive. It appears to be dressed in vault gear and using a browing auto5."
	icon_state = "vault_ghoul_b"
	icon_living = "vault_ghoul_b"
	ranged_cooldown_time = 25
	projectiletype = /obj/item/projectile/bullet/shotgun_slug
	projectilesound = 'sound/f13weapons/auto5.ogg'
	extra_projectiles = 1

/mob/living/simple_animal/hostile/ghoul/ranged/vault/musket
	desc = "A ghoul that has lost its mind and become aggressive. It appears to be dressed in vault gear and using a musket."
	icon_state = "vault_ghoul_c"
	icon_living = "vault_ghoul_c"
	ranged_cooldown_time = 35
	projectiletype = /obj/item/projectile/beam/laser/musket
	projectilesound = 'sound/f13weapons/lasmusket_fire.ogg'
	extra_projectiles = 0

/mob/living/simple_animal/hostile/ghoul/ranged/mercenary
	name = "mercenary ghoul"
	desc = "A ghoul clad in full combat armor seemingly with his mind still intact. Weilds an assault carbine."
	icon_state = "mercenary_ghoul"
	icon_living = "mercenary_ghoul"
	icon_dead = "mercenary_ghoul_dead"
	maxHealth = 260
	health = 260
	ranged_cooldown_time = 30
	projectiletype = /obj/item/projectile/bullet/a556/match
	projectilesound = 'sound/f13weapons/varmint_rifle.ogg'
	extra_projectiles = 3

/mob/living/simple_animal/hostile/ghoul/ranged/mercenary/laser
	desc = "A ghoul clad in full combat armor seemingly with his mind still intact. Weilds an AER-9."
	icon_state = "mercenary_ghoul_b"
	icon_living = "mercenary_ghoul_b"
	ranged_cooldown_time = 30
	projectiletype = /obj/item/projectile/beam/laser/lasgun
	projectilesound = 'sound/f13weapons/aer9fire.ogg'
	extra_projectiles = 1

/mob/living/simple_animal/hostile/ghoul/ranged/mercenary/breacher
	desc = "A ghoul clad in full combat armor seemingly with his mind still intact. Weilds a riot shotgun."
	icon_state = "mercenary_ghoul_c"
	icon_living = "mercenary_ghoul_c"
	ranged_cooldown_time = 40
	projectiletype = /obj/item/projectile/bullet/shotgun_slug
	projectilesound = 'sound/f13weapons/riot_shotgun.ogg'
	extra_projectiles = 4

/mob/living/simple_animal/hostile/ghoul/ranged/mercenary/amr
	desc = "A ghoul clad in full combat armor seemingly with his mind still intact. Weilds an anti-materiel rifle."
	icon_state = "mercenary_ghoul_d"
	icon_living = "fmercenary_ghoul_d"
	ranged_cooldown_time = 35
	projectiletype = /obj/item/projectile/bullet/a50MG
	projectilesound = 'sound/f13weapons/antimaterielfire.ogg'
	extra_projectiles = 0

/mob/living/simple_animal/hostile/ghoul/soldier
	name = "ghoul soldier"
	desc = "Have you ever seen a living ghoul before?<br>Ghouls are necrotic post-humans - decrepit, rotting, zombie-like mutants."
	icon = 'icons/mob/wastemobs.dmi'
	icon_state = "soldier_ghoul"
	icon_living = "soldier_ghoul"
	icon_dead = "soldier_ghoul_d"
	icon_gib = "syndicate_gib"
	maxHealth = 90
	health = 90

/mob/living/simple_animal/hostile/ghoul/soldier/armored
	name = "armored ghoul soldier"
	desc = "Have you ever seen a living ghoul before?<br>Ghouls are necrotic post-humans - decrepit, rotting, zombie-like mutants."
	icon = 'icons/mob/wastemobs.dmi'
	icon_state = "soldier_ghoul_a"
	icon_living = "soldier_ghoul_a"
	icon_dead = "soldier_ghoul_a_d"
	icon_gib = "syndicate_gib"
	maxHealth = 100
	health = 100

/mob/living/simple_animal/hostile/ghoul/scorched
	name = "scorched ghoul soldier"
	desc = "Have you ever seen a living ghoul before?<br>Ghouls are necrotic post-humans - decrepit, rotting, zombie-like mutants."
	icon = 'icons/mob/wastemobs.dmi'
	icon_state = "scorched_m"
	icon_living = "scorched_m"
	icon_dead = "scorched_m_d"
	icon_gib = "syndicate_gib"
	speak_chance = 1
	turns_per_move = 5
	environment_smash = 0
	response_help_simple = "hugs"
	response_disarm_simple = "pushes aside"
	response_harm_simple = "growl"
	move_to_delay = 4
	maxHealth = 80
	health = 80
	faction = list("scorched", "hostile")
	death_sound = null
	melee_damage_lower = 15
	melee_damage_upper = 20
	aggro_vision_range = 10
	attack_verb_simple = "punches"
	attack_sound = "punch"

/mob/living/simple_animal/hostile/ghoul/scorched/ranged
	name = "Ranged Ghoul Solder"
	desc = "Have you ever seen a living ghoul before?<br>Ghouls are necrotic post-humans - decrepit, rotting, zombie-like mutants."
	icon = 'icons/mob/wastemobs.dmi'
	icon_state = "scorched_r"
	icon_living = "scorched_r"
	icon_dead = "scorched_r_d"
	icon_gib = "syndicate_gib"
	speak_chance = 1
	turns_per_move = 5
	environment_smash = 0
	response_help_simple = "hugs"
	response_disarm_simple = "pushes aside"
	response_harm_simple = "ow"
	move_to_delay = 4
	maxHealth = 80
	health = 80
	ranged = 1
	ranged_cooldown_time = 200
	projectiletype = /obj/item/projectile/bullet/c9mm/simple
	projectilesound = 'sound/f13weapons/hunting_rifle.ogg'
	faction = list("scorched", "hostile")
	melee_damage_lower = 15
	melee_damage_upper = 20
	aggro_vision_range = 10
	attack_verb_simple = "shoots"
	attack_sound = "punch"

/mob/living/simple_animal/hostile/ghoul/wyomingghost
	name = "ghost soldier"
	desc = "A figure clad in armor that stands silent except for the slight wheezing coming from them, a dark orange and black liquid pumps through a clear tube into the gas mask. The armor they wear seems to be sealed to their skin."
	icon = 'icons/mob/wastemobs.dmi'
	icon_state = "wyomingghost"
	icon_living = "wyomingghost"
	icon_dead = "wyomingghost_dead"
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	robust_searching = 1
	turns_per_move = 5
	speak_emote = list("wheezes")
	emote_see = list("stares")
	a_intent = INTENT_HARM
	maxHealth = 150
	health = 150
	speed = 2
	harm_intent_damage = 8
	melee_damage_lower = 15
	melee_damage_upper = 15
	attack_verb_simple = "attacks"
	attack_sound = 'sound/hallucinations/growl1.ogg'
	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 20
	gold_core_spawnable = HOSTILE_SPAWN
	faction = list("supermutant","ghoul")
	decompose = FALSE
	sharpness = SHARP_EDGED //They need to cut their finger nails

//Rebound
/mob/living/simple_animal/hostile/ghoul/rebound
	name = "rebound feral ghoul"
	desc = "A feral ghoul of the Rebound, has few straps of leather armor tied over itself and a shock collar to keep it in line."
	icon_state = "rebound"
	icon_living = "rebound"
	icon_dead = null
	icon_gib = "syndicate_gib"
	maxHealth = 120
	health = 120
	speed = 3
	harm_intent_damage = 30
	melee_damage_lower = 30
	melee_damage_upper = 30
	faction = list("rebound")
	loot = list(/obj/effect/mob_spawn/human/corpse/rebound)
	status_flags = CANPUSH
	del_on_death = 1

	emote_taunt_sound = list('sound/f13npc/ghoul/taunt.ogg')
	emote_taunt = list("gurgles", "stares", "growls", "yells")
	taunt_chance = 30

/obj/effect/mob_spawn/human/corpse/rebound
	name = "rebound feral ghoul corpse"
	uniform = /obj/item/clothing/under/pants/tan
	suit = /obj/item/clothing/suit/armor/f13/kit
	shoes = /obj/item/clothing/shoes/f13/raidertreads
	neck = /obj/item/electropack/shockcollar
	id = /obj/item/card/id/rusted/rebound
	id_job = "Rebound Army Feral"
	hair_style = "Bald"
	facial_hair_style = "Shaved"
	mob_species = /datum/species/ghoul

/mob/living/simple_animal/hostile/ghoul/rebound/regular
	name = "rebound ghoul initiate"
	desc = "A ghoul serving under the banner of the Rebound. They hold a rusted hunting rifle shining against their metal chestplate."
	icon_state = "rebound_initiate"
	icon_living = "rebound_initiate"
	icon_dead = null
	icon_gib = "syndicate_gib"
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	decompose = FALSE
	speak = list("Destroy the non-believers....", "You will make fine addition to our army....", "There will be nothing left for them to bury...", "Glory to the All-Seeing One...")
	speak_chance = 4
	turns_per_move = 5
	speed = 1.2
	maxHealth = 150
	health = 150
	retreat_distance = 2
	minimum_distance = 5
	harm_intent_damage = 10
	melee_damage_lower = 10
	melee_damage_upper = 10
	attack_verb_simple = "slices"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	a_intent = INTENT_HARM
	loot = list(/obj/effect/mob_spawn/human/corpse/rebound/regular)
	faction = list("rebound")
	check_friendly_fire = 1
	status_flags = CANPUSH
	del_on_death = 1
	ranged = 1
	ranged_cooldown_time = 35
	projectiletype = /obj/item/projectile/bullet/a762/match
	projectilesound = 'sound/f13weapons/hunting_rifle.ogg'
	taunt_chance = 0

/obj/effect/mob_spawn/human/corpse/rebound/regular
	name = "rebound ghoul initiate corpse"
	uniform = /obj/item/clothing/under/f13/combat_shirt
	suit = /obj/item/clothing/suit/armor/f13/metalarmor/reinforced
	shoes = /obj/item/clothing/shoes/f13/military
	gloves = /obj/item/clothing/gloves/combat
	belt = /obj/item/storage/belt/military/army
	id = /obj/item/card/id/rusted/rebound
	id_job = "Rebound Army Initiate"
	hair_style = "Bald"
	facial_hair_style = "Shaved"
	mob_species = /datum/species/ghoul

/mob/living/simple_animal/hostile/ghoul/rebound/regular/thompson
	desc = "A ghoul serving under the banner of the Rebound. They hold a rusted thompson M1A1 shining against their metal chestplate."
	icon_state = "rebound_initiate_b"
	icon_living = "rebound_initiate_b"
	ranged_cooldown_time = 35
	projectiletype = /obj/item/projectile/bullet/c45/op
	projectilesound = 'sound/weapons/gunshot_smg.ogg'
	extra_projectiles = 4

/mob/living/simple_animal/hostile/ghoul/rebound/regular/sniper
	desc = "A ghoul serving under the banner of the Rebound. They hold a tinkered sniper rifle and are clad in a duster with a gasmask."
	icon_state = "rebound_initiate_c"
	icon_living = "rebound_initiate_c"
	retreat_distance = 3
	minimum_distance = 6
	ranged_cooldown_time = 60
	projectiletype = /obj/item/projectile/bullet/a50MG
	projectilesound = 'sound/f13weapons/antimaterielfire.ogg'
	extra_projectiles = 0

/mob/living/simple_animal/hostile/ghoul/rebound/reaver
	name = "rebound ghoul reaver"
	desc = "A heavy ghoul serving under the banner of the Rebound. They weild an AK-112 and clad in a set of a combat armor."
	icon_state = "rebound_reaver"
	icon_living = "rebound_reaver"
	icon_dead = null
	icon_gib = "syndicate_gib"
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	decompose = FALSE
	speak = list("Remember Necropolis....", "You will suffer just as they did....", "Glory to the All-Seeing One...")
	speak_chance = 4
	turns_per_move = 5
	speed = 1.4
	maxHealth = 300
	health = 300
	retreat_distance = 2
	minimum_distance = 4
	harm_intent_damage = 15
	melee_damage_lower = 15
	melee_damage_upper = 15
	attack_verb_simple = "slices"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	a_intent = INTENT_HARM
	loot = list(/obj/effect/mob_spawn/human/corpse/rebound/reaver)
	faction = list("rebound")
	check_friendly_fire = 1
	status_flags = CANPUSH
	del_on_death = 1
	ranged = 1
	ranged_cooldown_time = 30
	projectiletype = /obj/item/projectile/bullet/c5mm
	projectilesound = 'sound/f13weapons/assault_carbine.ogg'
	extra_projectiles = 4
	taunt_chance = 0

/obj/effect/mob_spawn/human/corpse/rebound/reaver
	name = "rebound ghoul reaver corpse"
	head = /obj/item/clothing/head/helmet/f13/combat
	uniform = /obj/item/clothing/under/f13/combat_shirt
	suit = /obj/item/clothing/suit/armor/f13/combat
	shoes = /obj/item/clothing/shoes/f13/military
	gloves = /obj/item/clothing/gloves/combat
	belt = /obj/item/storage/belt/military/army
	id = /obj/item/card/id/rusted/rebound
	id_job = "Rebound Army Reaver"
	hair_style = "Bald"
	facial_hair_style = "Shaved"
	mob_species = /datum/species/ghoul

/mob/living/simple_animal/hostile/ghoul/rebound/reaver/shotgun
	desc = "A heavy ghoul serving under the banner of the Rebound. They weild a citykiller and clad in a set of a combat armor."
	icon_state = "rebound_reaver_b"
	icon_living = "rebound_reaver_b"
	ranged_cooldown_time = 30
	projectiletype = /obj/item/projectile/bullet/shotgun_slug
	projectilesound = 'sound/f13weapons/riot_shotgun.ogg'
	extra_projectiles = 2

/mob/living/simple_animal/hostile/ghoul/rebound/reaver/wattz
	desc = "A heavy ghoul serving under the banner of the Rebound. They weild a wattz 2000 and clad in a set of a combat armor."
	icon_state = "rebound_reaver_c"
	icon_living = "rebound_reaver_c"
	retreat_distance = 4
	minimum_distance = 8
	ranged_cooldown_time = 20
	projectiletype = /obj/item/projectile/beam/laser/wattz2k
	projectilesound = 'sound/weapons/laser3.ogg'
	extra_projectiles = 0

/mob/living/simple_animal/hostile/ghoul/rebound/commisar
	name = "rebound ghoul commisar"
	desc = "A heavy ghoul serving under the banner of the Rebound. These ones serve as NCOs and disciplinary commisars. Equiped with a coat, fashionable hat and a suprisingly well maintained FN-Fal"
	icon_state = "rebound_commisar"
	icon_living = "rebound_commisar"
	icon_dead = null
	icon_gib = "syndicate_gib"
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	decompose = FALSE
	speak = list("Your ignorance will be your death....", "I will cleanse this world of filth like you....", "If it isn't another one for the meatgrinder...", "Your skull will serve as another stepping stone to our greatness...", "Glory to the All-Seeing One...")
	speak_chance = 4
	turns_per_move = 5
	speed = 1.4
	maxHealth = 800
	health = 800
	harm_intent_damage = 20
	melee_damage_lower = 20
	melee_damage_upper = 20
	attack_verb_simple = "slices"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	a_intent = INTENT_HARM
	loot = list(/obj/effect/mob_spawn/human/corpse/rebound/commisar)
	faction = list("rebound")
	status_flags = CANPUSH
	del_on_death = 1
	retreat_distance = 2
	minimum_distance = 6
	check_friendly_fire = 1
	ranged = 1
	ranged_cooldown_time = 25
	projectiletype = /obj/item/projectile/bullet/a762/match
	projectilesound = 'sound/f13weapons/marksman_rifle.ogg'
	extra_projectiles = 2
	taunt_chance = 0

/obj/effect/mob_spawn/human/corpse/rebound/commisar
	name = "rebound ghoul commisar corpse"
	head = /obj/item/clothing/head/soft/f13/utility/tan
	glasses = /obj/item/clothing/glasses/sunglasses
	uniform = /obj/item/clothing/under/f13/combat_shirt
	suit = /obj/item/clothing/suit/armor/f13/leather_jacket/combat/coat
	shoes = /obj/item/clothing/shoes/f13/military
	gloves = /obj/item/clothing/gloves/combat
	belt = /obj/item/storage/belt/military/army
	id = /obj/item/card/id/rusted/rebound
	id_job = "Rebound Army Commisar"
	hair_style = "Bald"
	facial_hair_style = "Shaved"
	mob_species = /datum/species/ghoul

/mob/living/simple_animal/hostile/ghoul/rebound/commisar/battle
	desc = "A heavy ghoul serving under the banner of the Rebound. These ones serve as NCOs and disciplinary commisars. Equiped with a coat, fashionable hat and a rechambered M-14."
	icon_state = "rebound_commisar_b"
	icon_living = "rebound_commisar_b"
	ranged_cooldown_time = 35
	projectiletype = /obj/item/projectile/bullet/a127mm
	projectilesound = 'sound/f13weapons/m14.ogg'
	extra_projectiles = 0

/mob/living/simple_animal/hostile/ghoul/rebound/elite
	name = "rebound ghoul chosen"
	desc = "A chosen ghoul from ranks of the Rebound. These elite hulks wear T-45b power armor and are equiped with a RCW."
	icon_state = "rebound_chosen"
	icon_living = "rebound_chosen"
	icon_dead = "rebound_chosen"
	icon_gib = "syndicate_gib"
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	decompose = FALSE
	speak = list("You will regret stepping into my shadow...", "I eat normies like you for breakfast...", "I will grind your bones to dust...", "Reaper has arrived...", "Your pathetic death will amuse me...", "Glory to the All-Seeing One...", "DIE ALREADY YOU PATHETIC WORM!")
	speak_chance = 10
	turns_per_move = 5
	del_on_death = 0
	speed = 1
	maxHealth = 1500
	health = 1500
	retreat_distance = 2
	minimum_distance = 4
	harm_intent_damage = 30
	melee_damage_lower = 30
	melee_damage_upper = 30
	attack_verb_simple = "power slams"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	a_intent = INTENT_HARM
	loot = list(/obj/effect/decal/cleanable/robot_debris)
	faction = list("rebound")
	check_friendly_fire = 1
	status_flags = CANPUSH
	ranged = 1
	ranged_cooldown_time = 25
	projectiletype = /obj/item/projectile/beam/laser/rcw
	projectilesound = 'sound/f13weapons/rcwfire.ogg'
	extra_projectiles = 5
	stat_attack = UNCONSCIOUS
	taunt_chance = 0

/mob/living/simple_animal/hostile/ghoul/rebound/elite/death()
	visible_message("The ghoul kneels down, rigging his fusion core to explode, manicially laughing.")
	do_sparks(2, TRUE, src)
	for(var/i in 1 to 3)
		addtimer(CALLBACK(src, .proc/do_death_beep), i * 1 SECONDS)
	addtimer(CALLBACK(src, .proc/self_destruct), 4 SECONDS)
	return ..()

/mob/living/simple_animal/hostile/ghoul/rebound/elite/proc/do_death_beep()
	playsound(src, 'sound/machines/triple_beep.ogg', 75, TRUE)
	visible_message("<span class='warning'>You hear an ominous beep coming from [src]!</span>", "<span class='warning'>You hear an ominous beep!</span>")

/mob/living/simple_animal/hostile/ghoul/rebound/elite/proc/self_destruct()
	explosion(src,1,2,4,4)
	qdel(src)

/mob/living/simple_animal/hostile/ghoul/rebound/elite/plasma
	desc = "A chosen ghoul from ranks of the Rebound. These elite hulks wear T-45b power armor and are equiped with a plasma rifle."
	icon_state = "rebound_chosen_b"
	icon_living = "rebound_chosen_b"
	icon_dead = "rebound_chosen_b"
	ranged_cooldown_time = 20
	projectiletype = /obj/item/projectile/f13plasma
	projectilesound = 'sound/f13weapons/plasma_rifle.ogg'
	extra_projectiles = 1

/mob/living/simple_animal/hostile/ghoul/rebound/captain
	name = "Captain Kavad"
	desc = "A high ranking officer of the rebound, outfitted with a pulse rifle and set of faded T-51a."
	maxHealth = 3000
	health = 3000
	speak = list("Bow before our might...", "You have pestered me with your insolence long enough...", "Your life is now forfeit...", "They will bury you in a lunchbox...", "I will enjoy watching you die...", "Your suffering shall be eternal...", "Soil is thirsty...", "Nothing like culling normies...", "Glory to the All-Seeing One...")
	speak_chance = 15
	icon_state = "rebound_chosen_c"
	icon_living = "rebound_chosen_c"
	icon_dead = "rebound_chosen_c"
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	decompose = FALSE
	turns_per_move = 5
	del_on_death = 0
	speed = 1
	retreat_distance = 2
	minimum_distance = 4
	harm_intent_damage = 40
	melee_damage_lower = 40
	melee_damage_upper = 40
	attack_verb_simple = "power slams"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	a_intent = INTENT_HARM
	loot = list(/obj/effect/decal/cleanable/robot_debris)
	faction = list("rebound")
	check_friendly_fire = 1
	status_flags = CANPUSH
	ranged = 1
	stat_attack = UNCONSCIOUS
	taunt_chance = 0	
	ranged_cooldown_time = 15
	projectiletype = /obj/item/projectile/beam/laser/oldpulse
	projectilesound = 'sound/weapons/ionrifle.ogg'
	extra_projectiles = 2

/mob/living/simple_animal/hostile/ghoul/rebound/captain/death()
	visible_message("In his last dying breath Captain Kavad says '...Semper...Fi....you have...no idea....what you just started...' turning on his self destruct.")
	do_sparks(6, TRUE, src)
	for(var/i in 1 to 3)
		addtimer(CALLBACK(src, .proc/do_death_beep), i * 1 SECONDS)
	addtimer(CALLBACK(src, .proc/self_destruct), 4 SECONDS)
	return ..()

/mob/living/simple_animal/hostile/ghoul/rebound/captain/proc/do_death_beep()
	playsound(src, 'sound/machines/triple_beep.ogg', 75, TRUE)
	visible_message("<span class='warning'>You hear an ominous beep coming from [src]!</span>", "<span class='warning'>You hear an ominous beep!</span>")

/mob/living/simple_animal/hostile/ghoul/rebound/captain/proc/self_destruct()
	explosion(src,2,2,8,8)
	qdel(src)