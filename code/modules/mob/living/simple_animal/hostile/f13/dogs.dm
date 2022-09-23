// DOGS // In this document: Wolves, Feral dogs, pet dogs


////////////
// WOLVES //
////////////	Pack animals, low hp, medium aggro, colder climates, runs away when near death

// Don't map wolves in the desert please. It's for non desert maps or maybe some experiments.
/mob/living/simple_animal/hostile/wolf
	name = "wolf"
	desc = "A ravenous wolf."
	icon = 'icons/fallout/mobs/animals/dogs.dmi'
	icon_state = "wolf"
	icon_living = "wolf"
	icon_dead = "wolf_dead"
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	turns_per_move = 1
	response_help_simple = "pets"
	response_disarm_simple = "pushes aside"
	response_harm_simple = "kicks"
	maxHealth = 75
	health = 75
	faction = list("hostile", "wolf", "raider")
	environment_smash = 0
	butcher_results = list(/obj/item/stack/sheet/animalhide/f13/dog = 1, \
	/obj/item/reagent_containers/food/snacks/meat/slab/wolf = 1)
	melee_damage_lower = 20
	melee_damage_upper = 25
	aggro_vision_range = 5
	attack_verb_simple = "bites"
	attack_sound = 'sound/weapons/bite.ogg'
	move_to_delay = 2
	emote_taunt_sound = list('sound/f13npc/dog/dog_charge1.ogg', 'sound/f13npc/dog/dog_charge2.ogg', 'sound/f13npc/dog/dog_charge3.ogg', 'sound/f13npc/dog/dog_charge4.ogg', 'sound/f13npc/dog/dog_charge5.ogg', 'sound/f13npc/dog/dog_charge6.ogg', 'sound/f13npc/dog/dog_charge7.ogg',)
	emote_taunt = list("growls", "barks", "snarls")
	taunt_chance = 30
	aggrosound = list('sound/f13npc/dog/dog_alert1.ogg', 'sound/f13npc/dog/dog_alert2.ogg', 'sound/f13npc/dog/dog_alert3.ogg')
	idlesound = list('sound/f13npc/dog/dog_bark1.ogg', 'sound/f13npc/dog/dog_bark2.ogg', 'sound/f13npc/dog/dog_bark3.ogg')
	death_sound = 'sound/f13npc/centaur/centaur_death.ogg'
	/// Message for when the wolf decides to start running away
	var/retreat_message_said = FALSE

/* This is run away code for dogs stolen from space ice wolf, tried to make it work, couldn't. Keeping it here in case someone can solve it.
/mob/living/simple_animal/hostile/wolf/Move(atom/newloc)
	if(newloc && newloc.z == z && (islava(newloc) || ischasm(newloc)))
		return FALSE
	return ..()

/mob/living/simple_animal/hostile/wolf/adjustHealth(amount, updating_health = TRUE, forced = FALSE)
	. = ..()
	if(stat == DEAD || health > maxHealth*0.1)
		retreat_distance = initial(retreat_distance)
		return
	if(!retreat_message_said && target)
		visible_message(SPAN_DANGER("The [name] tries to flee from [target]!"))
		retreat_message_said = TRUE
	retreat_distance = 12

/mob/living/simple_animal/hostile/wolf/BiologicalLife(seconds, times_fired)
	if(!(. = ..()))
		return
	if(target)
		return
	adjustHealth(-maxHealth*0.025)
	retreat_message_said = FALSE
*/
/mob/living/simple_animal/hostile/wolf/playable
	health = 150
	maxHealth = 150
	emote_taunt_sound = null
	emote_taunt = null
	aggrosound = null
	idlesound = null
	see_in_dark = 8
	wander = 0
	anchored = FALSE
	possible_a_intents = list(INTENT_HELP, INTENT_HARM)

/mob/living/simple_animal/hostile/wolf/alpha
	name = "alpha feral dog"
	aggro_vision_range = 6
	maxHealth = 85
	health = 85
	melee_damage_lower = 25
	melee_damage_upper = 35

/mob/living/simple_animal/hostile/wolf/alpha/Aggro()
	..()
	summon_backup(15)
	say("Awoo!")


////////////////
// FERAL DOGS //
////////////////	Pack animals, low hp, low-medium aggro, runs away when near death

/mob/living/simple_animal/hostile/wolf/feral_dog
	name = "feral dog"
	desc = "The feral dogs of the wastes are mangy and malnourished, but mean and tough."
	icon_state = "dog_feral"
	icon_living = "dog_feral"
	icon_dead = "dog_feral_dead"
	icon_gib = "gib"
	aggro_vision_range = 4
	melee_damage_lower = 20
	melee_damage_upper = 20

/mob/living/simple_animal/hostile/wolf/feral_dog/alpha
	name = "feral dog alpha"
	desc = "The feral dogs of the wastes are mangy and malnourished, but mean and tough. <br>This one is a little larger and more alert than its packmates. "
	icon_state = "dog_alpha"
	icon_living = "dog_alpha"
	icon_dead = "dog_alpha_dead"
	icon_gib = "gib"
	aggro_vision_range = 5
	maxHealth = 75
	health = 75
	melee_damage_lower = 25
	melee_damage_upper = 35
	butcher_results = list(/obj/item/stack/sheet/animalhide/f13/dog = 1, \
	/obj/item/reagent_containers/food/snacks/meat/slab/wolf = 1, \
	/obj/item/stack/sheet/bone = 1)

/mob/living/simple_animal/hostile/wolf/feral_dog/alpha/Aggro()
	..()
	summon_backup(15)
	say("Woof!")

/mob/living/simple_animal/hostile/wolf/feral_dog/alpha/playable
	health = 150
	maxHealth = 150
	emote_taunt_sound = null
	emote_taunt = null
	aggrosound = null
	idlesound = null
	see_in_dark = 8
	wander = 0
	anchored = FALSE
	possible_a_intents = list(INTENT_HELP, INTENT_HARM)


//////////////
// PET DOGS //
//////////////

//Unique Dogs - Guerilla for Khans is a Rottweiler, Brutus and Lupa german shepherds, Sniffs-the-Earth a sheepdog. 
//Feel free to move or add code for different behaviours like sleep, some unused sprites prepped for that sort of thing.

/mob/living/simple_animal/hostile/wolf/playable/rottweiler
	icon_state = "rottweiler"
	icon_living = "rottweiler"
	icon_dead = "rottweiler_dead"
	icon_gib = "gib"

/mob/living/simple_animal/hostile/wolf/playable/sheepdog
	icon_state = "tippen"
	icon_living = "tippen"
	icon_dead = "tippen_dead"
	icon_gib = "gib"

/mob/living/simple_animal/hostile/wolf/playable/shepherd
	icon_state = "shepherd"
	icon_living = "shepherd"
	icon_dead = "shepherd_dead"
	icon_gib = "gib"
