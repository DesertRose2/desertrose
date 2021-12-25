/datum/reagent/medicine/stimpak
	name = "Stimpak Fluid"
	description = "Rapidly heals damage when injected. Deals minor toxin damage if ingested."
	reagent_state = LIQUID
	color = "#eb0000"
	taste_description = "grossness"
	metabolization_rate = 0.5 * REAGENTS_METABOLISM
	overdose_threshold = 35
	addiction_threshold = 25
	value = REAGENT_VALUE_COMMON

/datum/reagent/medicine/stimpak/reaction_mob(mob/living/M, method=TOUCH, reac_volume, show_message = 1)
	if(iscarbon(M) && M.stat != DEAD)
		if(method in list(INGEST, VAPOR))
			M.adjustToxLoss(3.75*reac_volume*REAGENTS_EFFECT_MULTIPLIER) //increased from 0.5*reac_volume, which was amusingly low since stimpak heals toxins. now a pill at safe max crits and then heals back up to low health within a few seconds
			if(show_message)
				to_chat(M, SPAN_WARNING("You don't feel so good..."))
	..()

/datum/reagent/medicine/stimpak/on_mob_life(mob/living/carbon/M)
	if(M.health < 0)					//Functions as epinephrine.
		M.adjustToxLoss(-0.5*REAGENTS_EFFECT_MULTIPLIER, 0)
		M.adjustBruteLoss(-0.5*REAGENTS_EFFECT_MULTIPLIER, 0)
		M.adjustFireLoss(-0.5*REAGENTS_EFFECT_MULTIPLIER, 0)
	if(M.oxyloss > 35)
		M.setOxyLoss(35, 0)
	if(M.losebreath >= 4)
		M.losebreath -= 2
	if(M.losebreath < 0)
		M.losebreath = 0
	M.adjustStaminaLoss(-0.5*REAGENTS_EFFECT_MULTIPLIER, 0)
	. = 1
	if(prob(20))
		M.AdjustAllImmobility(-20, 0)
		M.AdjustUnconscious(-20, 0)
	if(M.getBruteLoss() == 0 && M.getFireLoss() == 0 && M.getToxLoss() == 0)
		metabolization_rate = 1000 * REAGENTS_METABOLISM //instant metabolise if it won't help you, prevents prehealing before combat
	if(!M.reagents.has_reagent(/datum/reagent/medicine/healing_powder)) // We don't want these healing items to stack, so we only apply the healing if these chems aren't found.We only check for the less powerful chems, so the least powerful one always heals.
		M.adjustBruteLoss(-4*REAGENTS_EFFECT_MULTIPLIER)
		M.adjustFireLoss(-4*REAGENTS_EFFECT_MULTIPLIER)
		M.adjustToxLoss(-1*REAGENTS_EFFECT_MULTIPLIER)
		M.AdjustStun(-5*REAGENTS_EFFECT_MULTIPLIER, 0)
		M.AdjustKnockdown(-5*REAGENTS_EFFECT_MULTIPLIER, 0)
		M.adjustStaminaLoss(-2*REAGENTS_EFFECT_MULTIPLIER)
		. = TRUE
	..()

/datum/reagent/medicine/stimpak/overdose_start(mob/living/M)
	to_chat(M, "<span class='userdanger'>Your chest gets heavier as your heart starts racing for its very life.</span>")
	SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "[type]_overdose", /datum/mood_event/overdose, name)

/datum/reagent/medicine/stimpak/overdose_process(mob/living/M)
	M.adjustToxLoss(5*REAGENTS_EFFECT_MULTIPLIER)
	M.adjustOxyLoss(8*REAGENTS_EFFECT_MULTIPLIER)
	M.drowsyness += 2*REAGENTS_EFFECT_MULTIPLIER
	M.jitteriness += 3
	..()
	. = TRUE

/datum/reagent/medicine/super_stimpak
	name = "super stim chemicals"

	description = "Chemicals found in pre-war stimpaks."
	reagent_state = LIQUID
	color = "#e50d0d"
	metabolization_rate = 0.5 * REAGENTS_METABOLISM
	overdose_threshold = 20
	addiction_threshold = 16

/datum/reagent/medicine/super_stimpak/on_mob_life(mob/living/M)
	if(M.health < 0)					//Functions as epinephrine.
		M.adjustToxLoss(-0.5*REAGENTS_EFFECT_MULTIPLIER, 0)
		M.adjustBruteLoss(-0.5*REAGENTS_EFFECT_MULTIPLIER, 0)
		M.adjustFireLoss(-0.5*REAGENTS_EFFECT_MULTIPLIER, 0)
	if(M.oxyloss > 35)
		M.setOxyLoss(35, 0)
	if(M.losebreath >= 4)
		M.losebreath -= 2
	if(M.losebreath < 0)
		M.losebreath = 0
	M.adjustStaminaLoss(-0.5*REAGENTS_EFFECT_MULTIPLIER, 0)
	. = 1
	if(prob(20))
		M.AdjustAllImmobility(-20, 0)
		M.AdjustUnconscious(-20, 0)
	if(M.getBruteLoss() == 0 && M.getFireLoss() == 0 && M.getToxLoss() == 0 && M.getOxyLoss() == 0)
		metabolization_rate = 1000 * REAGENTS_METABOLISM //instant metabolise if it won't help you, prevents prehealing before combat
	if(!M.reagents.has_reagent(/datum/reagent/medicine/healing_powder/poultice) && !M.reagents.has_reagent(/datum/reagent/medicine/stimpak) && !M.reagents.has_reagent(/datum/reagent/medicine/healing_powder)) // We don't want these healing items to stack, so we only apply the healing if these chems aren't found. We only check for the less powerful chems, so the least powerful one always heals.
		M.adjustBruteLoss(-8*REAGENTS_EFFECT_MULTIPLIER)
		M.adjustFireLoss(-8*REAGENTS_EFFECT_MULTIPLIER)
		M.adjustToxLoss(-2*REAGENTS_EFFECT_MULTIPLIER)
		M.AdjustStun(-10*REAGENTS_EFFECT_MULTIPLIER, 0)
		M.AdjustKnockdown(-10*REAGENTS_EFFECT_MULTIPLIER, 0)
		M.adjustStaminaLoss(-4*REAGENTS_EFFECT_MULTIPLIER)
		. = TRUE
	..()

/datum/reagent/medicine/super_stimpak/overdose_process(mob/living/M)
	M.adjustToxLoss(10*REAGENTS_EFFECT_MULTIPLIER)
	M.adjustOxyLoss(12*REAGENTS_EFFECT_MULTIPLIER)
	..()
	. = TRUE

/datum/reagent/medicine/bitter_drink
	name = "bitter drink"
	description = "An herbal healing concoction which enables wounded soldiers and travelers to tend to their wounds without stopping during journeys."
	reagent_state = LIQUID
	color ="#A9FBFB"
	taste_description = "bitterness and liquid pain"
	metabolization_rate = 0.7 * REAGENTS_METABOLISM //in between powder/stimpaks and poultice/superstims?
	overdose_threshold = 11

/datum/reagent/medicine/bitter_drink/on_mob_life(mob/living/M)
	if(M.getBruteLoss() == 0 && M.getFireLoss() == 0)
		metabolization_rate = 1000 * REAGENTS_METABOLISM //instant metabolise if it won't help you, prevents prehealing before combat
	if(!M.reagents.has_reagent(/datum/reagent/medicine/stimpak) && !M.reagents.has_reagent(/datum/reagent/medicine/healing_powder)) //should prevent stacking with healing powder and stimpaks
		M.adjustFireLoss(-3*REAGENTS_EFFECT_MULTIPLIER)
		M.adjustBruteLoss(-3*REAGENTS_EFFECT_MULTIPLIER)
		M.Dizzy(5)
		M.set_disgust(10)
		. = TRUE
	..()

/datum/reagent/medicine/bitter_drink/overdose_start(mob/living/M)
	to_chat(M, "<span class='userdanger'>You feel your stomach rejecting the disgusting concoction.</span>")
	SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "[type]_overdose", /datum/mood_event/overdose, name)

/datum/reagent/medicine/bitter_drink/overdose_process(mob/living/M)
	M.set_disgust(60)
	M.Dizzy(10)
	M.adjustFireLoss(3*REAGENTS_EFFECT_MULTIPLIER)
	M.adjustBruteLoss(3*REAGENTS_EFFECT_MULTIPLIER)
	..()
	. = TRUE

/datum/reagent/medicine/healing_powder
	name = "healing powder"
	description = "A healing powder derived from a mix of ground broc flowers and xander roots. Consumed orally, and produces a euphoric high."
	reagent_state = SOLID
	color = "#A9FBFB"
	taste_description = "bitterness"
	metabolization_rate = 0.6 * REAGENTS_METABOLISM
	overdose_threshold = 31
	var/heal_factor = -1.5 //Subtractive multiplier if you do not have the perk.
	var/heal_factor_perk = -3 //Multiplier if you have the right perk.

/datum/reagent/medicine/healing_powder/on_mob_life(mob/living/carbon/M)
	var/is_technophobe = FALSE
	if(HAS_TRAIT(M, TRAIT_TECHNOPHOBE))
		is_technophobe = TRUE
	if(M.getBruteLoss() == 0 && M.getFireLoss() == 0)
		metabolization_rate = 1000 * REAGENTS_METABOLISM //instant metabolise if it won't help you, prevents prehealing before combat
	var/heal_rate = (is_technophobe ? heal_factor_perk : heal_factor) * REAGENTS_EFFECT_MULTIPLIER
	M.adjustFireLoss(heal_rate)
	M.adjustBruteLoss(heal_rate)
	M.hallucination = max(M.hallucination, is_technophobe ? 0 : 5)
	. = TRUE
	..()

/datum/reagent/medicine/healing_powder/reaction_mob(mob/living/M, method=TOUCH, reac_volume, show_message = 1)
	if(iscarbon(M) && M.stat != DEAD)
		if(method in list(INGEST, VAPOR, INJECT))
			M.adjustToxLoss(3*reac_volume*REAGENTS_EFFECT_MULTIPLIER) //also increased from 0.5, reduced from 6
			if(show_message)
				to_chat(M, SPAN_WARNING("You don't feel so good..."))
	..()

/datum/reagent/medicine/healing_powder/overdose_start(mob/living/M)
	to_chat(M, "<span class='userdanger'>You notice its harder to breathe and your senses becoming more dull.</span>")
	SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "[type]_overdose", /datum/mood_event/overdose, name)

/datum/reagent/medicine/healing_powder/overdose_process(mob/living/M)
	M.confused +=20
	M.blur_eyes(30)
	M.losebreath += 4
	M.adjustToxLoss(2*REAGENTS_EFFECT_MULTIPLIER)
	M.adjustOxyLoss(4*REAGENTS_EFFECT_MULTIPLIER)
	..()
	. = TRUE

/datum/reagent/medicine/healing_powder/poultice
	name = "healing poultice"
	description = "Restores limb condition and heals rapidly."
	color = "#C8A5DC"
	metabolization_rate = 0.5 * REAGENTS_METABOLISM
	overdose_threshold = 30
	heal_factor = -2
	heal_factor_perk = -4

/datum/reagent/medicine/healing_powder/poultice_zombie
	name = "zombie poultice"
	description = "Highly refined powder, usually only utilized by members of Caesar's Legion, for its effects on mind of its user."
	color = "#a64adb"
	metabolization_rate = 0.2 * REAGENTS_METABOLISM
	overdose_threshold = 11
	heal_factor = 0
	heal_factor_perk = -5

/datum/reagent/medicine/healing_powder/poultice_zombie/on_mob_life(mob/living/carbon/M)
	var/is_technophobe = FALSE
	if(HAS_TRAIT(M, TRAIT_TECHNOPHOBE))
		is_technophobe = TRUE
	if(M.getBruteLoss() == 0 && M.getFireLoss() == 0)
		metabolization_rate = 0.8 * REAGENTS_METABOLISM //Allows you to preheal but it will process much faster to prevent abuse
	var/heal_rate = (is_technophobe ? heal_factor_perk : heal_factor) * REAGENTS_EFFECT_MULTIPLIER
	M.adjustFireLoss(heal_rate)
	M.adjustBruteLoss(heal_rate)
	M.hallucination = max(M.hallucination, is_technophobe ? 5 : 40)
	. = TRUE
	..()

/datum/reagent/medicine/healing_powder/poultice_zombie/overdose_start(mob/living/M)
	to_chat(M, "<span class='userdanger'>You feel your brain flicking off as the powder slowly puts you into coma!</span>")
	SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "[type]_overdose", /datum/mood_event/overdose, name)

/datum/reagent/medicine/healing_powder/poultice_zombie/overdose_process(mob/living/M)
	if(prob(50))
		M.emote(pick("twitch", "shiver"))
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 2)
	M.Unconscious(300)
	M.adjustToxLoss(2*REAGENTS_EFFECT_MULTIPLIER)
	M.adjustOxyLoss(4*REAGENTS_EFFECT_MULTIPLIER)
	..()
	. = TRUE

/datum/reagent/medicine/radshroom
	name = "Mushroom extract"
	description = "A combination of punga and cave fungus to help dealing with radiation."
	reagent_state = LIQUID
	color = "#533404c5"
	metabolization_rate = 1.2 * REAGENTS_METABOLISM

/datum/reagent/radshroom/radx/on_mob_life(mob/living/carbon/M)
	if(M.radiation > 0)
		M.radiation -= min(M.radiation, 12)
	. = TRUE
	..()

/datum/reagent/medicine/radx
	name = "Rad-X"
	description = "Reduces massive amounts of radiation and some toxin damage."
	reagent_state = LIQUID
	color = "#ff6100"
	metabolization_rate = 0.5 * REAGENTS_METABOLISM

/datum/reagent/medicine/radx/on_mob_life(mob/living/carbon/M)
	if(M.radiation > 0)
		M.radiation -= min(M.radiation, 8)
	M.adjustToxLoss(-0.5*REAGENTS_EFFECT_MULTIPLIER)
	. = TRUE
	..()

/datum/reagent/medicine/radaway
	name = "Radaway"

	description = "A potent anti-toxin drug."
	reagent_state = LIQUID
	color = "#ff7200"
	metabolization_rate = 2 * REAGENTS_METABOLISM

/datum/reagent/medicine/radaway/on_mob_life(mob/living/carbon/M)
	M.adjustToxLoss(-3*REAGENTS_EFFECT_MULTIPLIER)
	M.radiation -= min(M.radiation, 16)
	if(ishuman(M) && prob(7))
		var/mob/living/carbon/human/H = M
		H.confused = max(M.confused, 3)
	. = TRUE
	..()

/datum/reagent/medicine/medx
	name = "Med-X"

	description = "Med-X is a potent painkiller, allowing users to withstand high amounts of pain and continue functioning. Addictive. Prolonged presence in the body can cause seizures and organ damage."
	reagent_state = LIQUID
	color = "#6D6374"
	metabolization_rate = 0.25 * REAGENTS_METABOLISM
	overdose_threshold = 21
	addiction_threshold = 11

/datum/reagent/medicine/medx/on_mob_add(mob/living/carbon/human/M)
	..()
	if(isliving(M))
		to_chat(M, SPAN_NOTICE("You feel tougher, able to shrug off pain more easily."))
		M.maxHealth += 50
		M.health += 50
		ADD_TRAIT(M, TRAIT_IGNOREDAMAGESLOWDOWN, "[type]")

/datum/reagent/medicine/medx/on_mob_delete(mob/living/carbon/human/M)
	if(isliving(M))
		to_chat(M, SPAN_NOTICE("You feel as vulnerable to pain as a normal person."))
		M.maxHealth -= 50
		M.health -= 50
		REMOVE_TRAIT(M, TRAIT_IGNOREDAMAGESLOWDOWN, "[type]")
	switch(current_cycle)
		if(1 to 25)
			M.confused += 10
			M.blur_eyes(20)
			to_chat(M, SPAN_NOTICE("Your head is pounding. Med-X is hard on the body. "))
		if(26 to 50)
			M.confused +=20
			M.blur_eyes(30)
			M.losebreath += 8
			M.set_disgust(12)
			M.adjustStaminaLoss(30*REAGENTS_EFFECT_MULTIPLIER)
			to_chat(M, SPAN_DANGER("Your stomach churns, your eyes cloud and you're pretty sure you just popped a lung. You shouldn't take so much med-X at once. "))
		if(51 to INFINITY)
			M.confused +=40
			M.blur_eyes(30)
			M.losebreath += 10
			M.Unconscious (15)
			M.set_disgust(25)
			M.adjustStaminaLoss(40*REAGENTS_EFFECT_MULTIPLIER)
			M.vomit(30, 1, 1, 5, 0, 0, 0, 60)
			M.Jitter(1000)
			M.playsound_local(M, 'sound/effects/singlebeat.ogg', 100, 0)
			M.visible_message("<span class='userdanger'>[M] clutches their stomach and vomits violently onto the ground, bloody froth covering their lips!</span>")
			to_chat(M, "<span class='userdanger'>You throw up everything you've eaten in the past week and some blood to boot. You're pretty sure your heart just stopped for a second, too. </span>")
/*		if(101 to INFINITY)
//			M.adjust_eye_damage(30)
			M.Unconscious(400)
			M.Jitter(1000)
			M.set_heartattack(TRUE)
			M.visible_message("<span class='userdanger'>[M] clutches at their chest as if their heart stopped!</span>")
			to_chat(M, SPAN_DANGER("Your vision goes black and your heart stops beating as the amount of drugs in your system shut down your organs one by one. Say hello to Elvis in the afterlife. "))
			*/
	..()

/datum/reagent/medicine/medx/on_mob_delete(mob/living/M)
	var/is_druggie = FALSE
	if(HAS_TRAIT(M, TRAIT_CHEM_USER))
		is_druggie = TRUE
	if(is_druggie == FALSE && isliving(M))
		to_chat(M, SPAN_NOTICE("You are not used to taking drugs."))
		M.confused = 0
	..()

/datum/reagent/medicine/medx/on_mob_life(mob/living/carbon/M)
	var/is_druggie = FALSE
	if(HAS_TRAIT(M, TRAIT_CHEM_USER))
		is_druggie = TRUE
	if(is_druggie == FALSE)
		to_chat(M, "<span class='userdanger'>I don't feel like I should be taking this!</span>")
		M.blur_eyes(50)
		M.Jitter(50)
		M.Dizzy(50)
		M.confused += 25
	M.AdjustStun(-30*REAGENTS_EFFECT_MULTIPLIER, 0)
	M.AdjustKnockdown(-30*REAGENTS_EFFECT_MULTIPLIER, 0)
	M.AdjustUnconscious(-30*REAGENTS_EFFECT_MULTIPLIER, 0)
	M.adjustStaminaLoss(-5*REAGENTS_EFFECT_MULTIPLIER, 0)
	..()
	. = TRUE

/datum/reagent/medicine/medx/overdose_process(mob/living/carbon/human/M)
	M.set_blurriness(30)
	M.Unconscious(400)
	M.Jitter(1000)
	M.set_heartattack(TRUE)
	M.drop_all_held_items()
	M.Dizzy(2)
	M.visible_message("<span class='userdanger'>[M] clutches at their chest as if their heart stopped!</span>")
	if(prob(10))
		to_chat(M, SPAN_DANGER("Your vision goes black and your heart stops beating as the amount of drugs in your system shut down your organs one by one. Say hello to Elvis in the afterlife. "))
	..()

/datum/reagent/medicine/medx/addiction_act_stage1(mob/living/M)
	if(prob(33))
		M.drop_all_held_items()
		M.Jitter(2)
	..()

/datum/reagent/medicine/medx/addiction_act_stage2(mob/living/M)
	if(prob(33))
		M.drop_all_held_items()
		M.adjustToxLoss(1*REAGENTS_EFFECT_MULTIPLIER)
		. = TRUE
		M.Dizzy(3)
		M.Jitter(3)
	..()

/datum/reagent/medicine/medx/addiction_act_stage3(mob/living/M)
	if(prob(33))
		M.drop_all_held_items()
		M.adjustToxLoss(2*REAGENTS_EFFECT_MULTIPLIER)
		. = TRUE
		M.Dizzy(4)
		M.Jitter(4)
	..()

/datum/reagent/medicine/medx/addiction_act_stage4(mob/living/M)
	if(prob(33))
		M.drop_all_held_items()
		M.adjustToxLoss(3*REAGENTS_EFFECT_MULTIPLIER)
		. = TRUE
		M.Dizzy(5)
		M.Jitter(5)
	..()

/datum/reagent/medicine/cateye
	name = "Cateye"

	description = "It's good for your eyes! Maybe.."
	reagent_state = SOLID
	color = "#6D6374"
	metabolization_rate = 0.7 * REAGENTS_METABOLISM
	overdose_threshold = 11
	addiction_threshold = 100

/datum/reagent/medicine/cateye/on_mob_add(mob/living/carbon/human/M)
	..()
	if(isliving(M))
		to_chat(M, SPAN_NOTICE("You feel at ease as everything becomes clearer."))
		ADD_TRAIT(M, TRAIT_PERFECT_ATTACKER, "cateye")
		ADD_TRAIT(M, TRAIT_NICE_SHOT, "cateye")
		ADD_TRAIT(M, TRAIT_NIGHT_VISION, "cateye")

/datum/reagent/medicine/cateye/on_mob_delete(mob/living/carbon/human/M)
	..()
	if(isliving(M))
		to_chat(M, SPAN_NOTICE("Your eyes feel tired.."))
		REMOVE_TRAIT(M, TRAIT_PERFECT_ATTACKER, "cateye")
		REMOVE_TRAIT(M, TRAIT_NICE_SHOT, "cateye")
		REMOVE_TRAIT(M, TRAIT_NIGHT_VISION, "cateye")

/datum/reagent/medicine/cateye/overdose_process(mob/living/M)
	if(prob(33))
		to_chat(M, SPAN_DANGER("Your vision blurs and doesn't appear to come back!"))
		M.Dizzy(2)
		M.set_blurriness(50)
	..()

/datum/reagent/medicine/cateye/addiction_act_stage1(mob/living/M)
	if(prob(33))
		M.drop_all_held_items()
		M.blur_eyes(40)
	..()

/datum/reagent/medicine/cateye/addiction_act_stage2(mob/living/M)
	if(prob(33))
		M.drop_all_held_items()
		M.adjustToxLoss(1*REAGENTS_EFFECT_MULTIPLIER)
		. = TRUE
		M.blur_eyes(40)
	..()

/datum/reagent/medicine/cateye/addiction_act_stage3(mob/living/M)
	if(prob(33))
		M.drop_all_held_items()
		M.adjustToxLoss(2*REAGENTS_EFFECT_MULTIPLIER)
		. = TRUE
		M.blur_eyes(40)
	..()

/datum/reagent/medicine/cateye/addiction_act_stage4(mob/living/M)
	if(prob(33))
		M.drop_all_held_items()
		M.adjustToxLoss(3*REAGENTS_EFFECT_MULTIPLIER)
		. = TRUE
		M.blur_eyes(40)
	..()

/datum/reagent/medicine/mentat
	name = "Mentat Powder"

	description = "A powerful drug that heals and increases the perception and intelligence of the user."
	color = "#C8A5DC"
	reagent_state = SOLID
	overdose_threshold = 25
	addiction_threshold = 15

/datum/reagent/medicine/mentat/on_mob_life(mob/living/carbon/M)
	M.adjustOxyLoss(-3*REAGENTS_EFFECT_MULTIPLIER)
	var/obj/item/organ/eyes/eyes = M.getorganslot(ORGAN_SLOT_EYES)
	if (!eyes)
		return
	if(M.getOrganLoss(ORGAN_SLOT_BRAIN) == 0)
		M.cure_all_traumas(TRAUMA_RESILIENCE_SURGERY)
/*	if(HAS_TRAIT(M, TRAIT_BLIND, TRAIT_GENERIC))
		if(prob(20))
			to_chat(M, SPAN_WARNING("Your vision slowly returns..."))
			M.cure_blind(EYE_DAMAGE)
			M.cure_nearsighted(EYE_DAMAGE)
			M.blur_eyes(35)
	else if(HAS_TRAIT(M, TRAIT_NEARSIGHT, TRAIT_GENERIC))
		to_chat(M, SPAN_WARNING("The blackness in your peripheral vision fades."))
		M.cure_nearsighted(EYE_DAMAGE)
		M.blur_eyes(10)*/
	else if(M.eye_blind || M.eye_blurry)
		M.set_blindness(0)
		M.set_blurriness(0)
		to_chat(M, SPAN_WARNING("Your vision slowly returns to normal..."))
//	else if(eyes.eye_damage > 0)
//		M.adjust_eye_damage(-1)
//	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, -2)
	if (prob(5))
		to_chat(M, SPAN_NOTICE("You feel way more intelligent!"))
	..()
	. = TRUE

/datum/reagent/medicine/mentat/overdose_process(mob/living/M)
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 15)
	if(prob(33))
		M.Dizzy(2)
		M.Jitter(2)
	..()

/datum/reagent/medicine/mentat/addiction_act_stage1(mob/living/M)
	if(prob(33))
		M.Jitter(2)
	..()

/datum/reagent/medicine/mentat/addiction_act_stage2(mob/living/M)
	if(prob(33))
		. = TRUE
		M.Dizzy(3)
		M.Jitter(3)
	..()

/datum/reagent/medicine/mentat/addiction_act_stage3(mob/living/M)
	if(prob(33))
		M.adjustToxLoss(1*REAGENTS_EFFECT_MULTIPLIER)
//		M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 2)
//		. = TRUE
		M.Dizzy(4)
		M.Jitter(4)
	..()

/datum/reagent/medicine/mentat/addiction_act_stage4(mob/living/M)
	if(prob(33))
		M.drop_all_held_items()
		M.adjustToxLoss(2*REAGENTS_EFFECT_MULTIPLIER)
//		M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 4)
//		. = TRUE
		M.Dizzy(5)
		M.Jitter(5)
	..()

/datum/reagent/medicine/fixer
	name = "Fixer Powder"

	description = "Treats addictions while also purging other chemicals from the body. Side effects include nausea."
	reagent_state = SOLID
	color = "#C8A5DC"

/datum/reagent/medicine/fixer/on_mob_life(mob/living/carbon/M)
//	for(var/datum/reagent/R in M.reagents.reagent_list)
//		if(R != src)
//			M.reagents.remove_reagent(R.id,2)
	for(var/datum/reagent/R in M.reagents.addiction_list)
		M.reagents.addiction_list.Remove(R)
		to_chat(M, SPAN_NOTICE("You feel like you've gotten over your need for [R.name]."))
	M.confused = max(M.confused, 4)
	if(ishuman(M) && prob(5))
		var/mob/living/carbon/human/H = M
		H.vomit(10)
	..()
	. = TRUE

/datum/reagent/medicine/gaia
	name = "Gaia Extract"

	description = "Liquid extracted from a gaia branch. Provides a slow but reliable healing effect"
	reagent_state = LIQUID
	metabolization_rate = 0.25 * REAGENTS_METABOLISM
	taste_description = "deliciousness"
	overdose_threshold = 30
	color = "##DBCE18"

/datum/reagent/medicine/gaia/on_mob_life(mob/living/carbon/M)
	M.adjustToxLoss(-0.75*REAGENTS_EFFECT_MULTIPLIER, 0)
	M.adjustOxyLoss(-0.75*REAGENTS_EFFECT_MULTIPLIER, 0)
	M.adjustBruteLoss(-0.75*REAGENTS_EFFECT_MULTIPLIER, 0)
	M.adjustFireLoss(-0.75*REAGENTS_EFFECT_MULTIPLIER, 0)
	..()

/datum/reagent/medicine/gaia/overdose_start(mob/living/M)
	metabolization_rate = 15 * REAGENTS_METABOLISM
	..()

/datum/reagent/medicine/longpork_stew
	name = "longpork stew"
	description = "A dish sworn by some to have unusual healing properties. To most it just tastes disgusting. What even is longpork anyways?..."
	reagent_state = LIQUID
	color =  "#915818"
	taste_description = "oily water, with bits of raw-tasting tender meat."
	metabolization_rate = 0.15 * REAGENTS_METABOLISM //slow, weak heal that lasts a while. Metabolizies much faster if you are not hurt.
	overdose_threshold = 50 //If you eat too much you get poisoned from all the human flesh you're eating
	var/longpork_hurting = 0
	var/longpork_lover_healing = -2

/datum/reagent/medicine/longpork_stew/on_mob_life(mob/living/carbon/M)
	var/is_longporklover = FALSE
	if(HAS_TRAIT(M, TRAIT_LONGPORKLOVER))
		is_longporklover = TRUE
	if(M.getBruteLoss() == 0 && M.getFireLoss() == 0)
		metabolization_rate = 3 * REAGENTS_METABOLISM //metabolizes much quicker if not injured
	var/longpork_heal_rate = (is_longporklover ? longpork_lover_healing : longpork_hurting) * REAGENTS_EFFECT_MULTIPLIER
	if(!M.reagents.has_reagent(/datum/reagent/medicine/stimpak) && !M.reagents.has_reagent(/datum/reagent/medicine/healing_powder))
		M.adjustFireLoss(longpork_heal_rate)
		M.adjustBruteLoss(longpork_heal_rate)
		M.adjustToxLoss(is_longporklover ? 0 : 3)
		. = TRUE
		..()

/datum/reagent/medicine/longpork_stew/overdose_process(mob/living/M)
	M.adjustToxLoss(2*REAGENTS_EFFECT_MULTIPLIER)
	..()
	. = TRUE
