/datum/reagent/medicine/stimpak
	name = "Stimpak Fluid"
	description = "Rapidly heals damage when injected. Deals minor toxin damage if ingested."
	reagent_state = LIQUID
	color = "#C8A5DC"
	taste_description = "grossness"
	metabolization_rate = 0.5 * REAGENTS_METABOLISM
	overdose_threshold = 30
	value = REAGENT_VALUE_COMMON

/datum/reagent/medicine/stimpak/reaction_mob(mob/living/M, method=TOUCH, reac_volume, show_message = 1)
	if(iscarbon(M) && M.stat != DEAD)
		if(method in list(INGEST, VAPOR))
			M.adjustToxLoss(3.75*reac_volume*REAGENTS_EFFECT_MULTIPLIER) //increased from 0.5*reac_volume, which was amusingly low since stimpak heals toxins. now a pill at safe max crits and then heals back up to low health within a few seconds
			if(show_message)
				to_chat(M, "<span class='warning'>You don't feel so good...</span>")
	..()

/datum/reagent/medicine/stimpak/on_mob_life(mob/living/carbon/M)
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

/datum/reagent/medicine/stimpak/overdose_process(mob/living/M)
	M.adjustToxLoss(5*REAGENTS_EFFECT_MULTIPLIER)
	M.adjustOxyLoss(8*REAGENTS_EFFECT_MULTIPLIER)
	..()
	. = TRUE

/datum/reagent/medicine/super_stimpak
	name = "super stim chemicals"

	description = "Chemicals found in pre-war stimpaks."
	reagent_state = LIQUID
	color = "#e50d0d"
	metabolization_rate = 0.5 * REAGENTS_METABOLISM
	overdose_threshold = 20

datum/reagent/medicine/super_stimpak/on_mob_life(mob/living/M)
	if(M.getBruteLoss() == 0 && M.getFireLoss() == 0 && M.getToxLoss() == 0 && M.getOxyLoss() == 0)
		metabolization_rate = 1000 * REAGENTS_METABOLISM //instant metabolise if it won't help you, prevents prehealing before combat
	if(!M.reagents.has_reagent(/datum/reagent/medicine/healing_poultice) && !M.reagents.has_reagent(/datum/reagent/medicine/stimpak) && !M.reagents.has_reagent(/datum/reagent/medicine/healing_powder)) // We don't want these healing items to stack, so we only apply the healing if these chems aren't found. We only check for the less powerful chems, so the least powerful one always heals.
		M.adjustBruteLoss(-6*REAGENTS_EFFECT_MULTIPLIER)
		M.adjustFireLoss(-6*REAGENTS_EFFECT_MULTIPLIER)
		M.adjustOxyLoss(-2*REAGENTS_EFFECT_MULTIPLIER)
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
	taste_description = "bitterness"
	metabolization_rate = 0.4 * REAGENTS_METABOLISM //in between powder/stimpaks and poultice/superstims?
	overdose_threshold = 30

datum/reagent/medicine/bitter_drink/on_mob_life(mob/living/M)
	if(M.getBruteLoss() == 0 && M.getFireLoss() == 0)
		metabolization_rate = 1000 * REAGENTS_METABOLISM //instant metabolise if it won't help you, prevents prehealing before combat
	if(!M.reagents.has_reagent(/datum/reagent/medicine/stimpak) && !M.reagents.has_reagent(/datum/reagent/medicine/healing_powder)) //should prevent stacking with healing powder and stimpaks
		M.adjustFireLoss(-3*REAGENTS_EFFECT_MULTIPLIER)
		M.adjustBruteLoss(-3*REAGENTS_EFFECT_MULTIPLIER)
		M.hallucination = max(M.hallucination, 5)
		. = TRUE
	..()

/datum/reagent/medicine/bitter_drink/overdose_process(mob/living/M)
	M.adjustToxLoss(2*REAGENTS_EFFECT_MULTIPLIER)
	M.adjustOxyLoss(4*REAGENTS_EFFECT_MULTIPLIER)
	..()
	. = TRUE

/datum/reagent/medicine/healing_powder
	name = "Healing Powder"

	description = "A healing powder derived from a mix of ground broc flowers and xander roots. Consumed orally, and produces a euphoric high."
	reagent_state = SOLID
	color = "#A9FBFB"
	taste_description = "bitterness"
	metabolization_rate = 0.3 * REAGENTS_METABOLISM
	overdose_threshold = 30

/datum/reagent/medicine/healing_powder/on_mob_life(mob/living/carbon/M)
	if(M.getBruteLoss() == 0 && M.getFireLoss() == 0)
		metabolization_rate = 1000 * REAGENTS_METABOLISM //instant metabolise if it won't help you, prevents prehealing before combat
	M.adjustFireLoss(-3*REAGENTS_EFFECT_MULTIPLIER)
	M.adjustBruteLoss(-3*REAGENTS_EFFECT_MULTIPLIER)
	M.hallucination = max(M.hallucination, 5)
	. = TRUE
	..()

/datum/reagent/medicine/healing_powder/reaction_mob(mob/living/M, method=TOUCH, reac_volume, show_message = 1)
	if(iscarbon(M) && M.stat != DEAD)
		if(method in list(INGEST, VAPOR, INJECT))
			M.adjustToxLoss(3*reac_volume*REAGENTS_EFFECT_MULTIPLIER) //also increased from 0.5, reduced from 6
			if(show_message)
				to_chat(M, "<span class='warning'>You don't feel so good...</span>")
	..()

/datum/reagent/medicine/healing_powder/overdose_process(mob/living/M)
	M.adjustToxLoss(2*REAGENTS_EFFECT_MULTIPLIER)
	M.adjustOxyLoss(4*REAGENTS_EFFECT_MULTIPLIER)
	..()
	. = TRUE

/datum/reagent/medicine/healing_poultice
	name = "healing poultice"

	description = "Restores limb condition and heals rapidly."
	reagent_state = LIQUID
	color = "#C8A5DC"
	metabolization_rate = 0.2 * REAGENTS_METABOLISM
	overdose_threshold = 20

/datum/reagent/medicine/healing_poultice/on_mob_life(mob/living/M)
	if(M.getBruteLoss() == 0 && M.getFireLoss() == 0 && M.getOxyLoss() == 0)
		metabolization_rate = 1000 * REAGENTS_METABOLISM //instant metabolise if it won't help you, prevents prehealing before combat
	if(!M.reagents.has_reagent(/datum/reagent/medicine/stimpak) && !M.reagents.has_reagent(/datum/reagent/medicine/healing_powder)) // We don't want these healing items to stack, so we only apply the healing if these chems aren't found. We only check for the less powerful chems, so the least powerful one always heals.
		M.adjustFireLoss(-4*REAGENTS_EFFECT_MULTIPLIER)
		M.adjustBruteLoss(-4*REAGENTS_EFFECT_MULTIPLIER)
		M.adjustOxyLoss(-2*REAGENTS_EFFECT_MULTIPLIER)
		M.hallucination = max(M.hallucination, 5)
	..()

/datum/reagent/medicine/healing_poultice/reaction_mob(mob/living/M, method=TOUCH, reac_volume, show_message = 1)
	if(iscarbon(M) && M.stat != DEAD)
		if(method in list(INGEST, VAPOR, INJECT))
			M.adjustToxLoss(4.5*reac_volume*REAGENTS_EFFECT_MULTIPLIER) //changed from 0.5*reac_volume, reduced from 6
			if(show_message)
				to_chat(M, "<span class='warning'>You don't feel so good...</span>")
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
	metabolization_rate = 0.5 * REAGENTS_METABOLISM
	overdose_threshold = 20
	addiction_threshold = 6

/datum/reagent/medicine/medx/on_mob_add(mob/living/carbon/human/M)
	..()
	if(isliving(M))
		to_chat(M, "<span class='notice'>You feel tougher, able to shrug off pain more easily.</span>")
		M.maxHealth += 50
		M.health += 50

/datum/reagent/medicine/medx/on_mob_delete(mob/living/carbon/human/M)
	if(isliving(M))
		to_chat(M, "<span class='notice'>You feel as vulnerable to pain as a normal person.</span>")
		M.maxHealth -= 50
		M.health -= 50
	switch(current_cycle)
		if(1 to 25)
			M.confused += 20
			M.blur_eyes(20)
			to_chat(M, "<span class='notice'>Your head is pounding. Med-X is hard on the body. </span>")
		if(26 to 50)
			M.confused +=30
			M.blur_eyes(30)
			M.losebreath += 8
//			M.adjust_eye_damage(6)
			M.set_disgust(12)
			M.adjustStaminaLoss(30*REAGENTS_EFFECT_MULTIPLIER)
			M.vomit(0, 1, 1, 1, 0, 0, 0, 1)
			to_chat(M, "<span class='danger'>Your stomach churns, your eyes cloud and you're pretty sure you just popped a lung. You shouldn't take so much med-X at once. </span>")
		if(51 to 100)
			M.confused +=50
			M.blur_eyes(30)
			M.losebreath += 10
//			M.adjust_eye_damage(12)
			M.set_disgust(25)
			M.adjustStaminaLoss(30*REAGENTS_EFFECT_MULTIPLIER)
			M.vomit(30, 1, 1, 5, 0, 0, 0, 1)
			M.Unconscious(200)
			M.Jitter(1000)
			var/datum/disease/D = new /datum/disease/heart_failure
			M.ForceContractDisease(D)
			M.playsound_local(M, 'sound/effects/singlebeat.ogg', 100, 0)
			M.visible_message("<span class='userdanger'>[M] collapses to the ground, bloody froth covering their lips!</span>")
			to_chat(M, "<span class='userdanger'>You throw up everything you've eaten in the past week and some blood to boot. You're pretty sure your heart just stopped for a second, too. </span>")
		if(101 to INFINITY)
//			M.adjust_eye_damage(30)
			M.Unconscious(400)
			M.Jitter(1000)
			M.set_heartattack(TRUE)
			M.visible_message("<span class='userdanger'>[M] clutches at their chest as if their heart stopped!</span>")
			to_chat(M, "<span class='danger'>Your vision goes black and your heart stops beating as the amount of drugs in your system shut down your organs one by one. Say hello to Elvis in the afterlife. </span>")
	..()

/datum/reagent/medicine/medx/on_mob_life(mob/living/carbon/M)
	M.AdjustStun(-30*REAGENTS_EFFECT_MULTIPLIER, 0)
	M.AdjustKnockdown(-30*REAGENTS_EFFECT_MULTIPLIER, 0)
	M.AdjustUnconscious(-30*REAGENTS_EFFECT_MULTIPLIER, 0)
	M.adjustStaminaLoss(-5*REAGENTS_EFFECT_MULTIPLIER, 0)
	..()
	. = TRUE

/datum/reagent/medicine/medx/overdose_process(mob/living/M)
	if(prob(33))
		M.drop_all_held_items()
		M.Dizzy(2)
		M.Jitter(2)
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

/datum/reagent/medicine/legionmedx
	name = "natural painkiller"

	description = "Med-X is a potent painkiller, allowing users to withstand high amounts of pain and continue functioning."
	reagent_state = LIQUID
	color = "#6D6374"
	metabolization_rate = 0.7 * REAGENTS_METABOLISM
	overdose_threshold = 14
	addiction_threshold = 50

/datum/reagent/medicine/legionmedx/on_mob_add(mob/M)
	..()
	if(isliving(M))
		var/mob/living/carbon/L = M
		L.hal_screwyhud = SCREWYHUD_HEALTHY
		ADD_TRAIT(L, TRAIT_IGNOREDAMAGESLOWDOWN, TRAIT_GENERIC)

/datum/reagent/medicine/legionmedx/on_mob_delete(mob/M)
	if(isliving(M))
		var/mob/living/carbon/L = M
		L.hal_screwyhud = SCREWYHUD_NONE
		REMOVE_TRAIT(M, TRAIT_IGNOREDAMAGESLOWDOWN, TRAIT_GENERIC)
	..()

/datum/reagent/medicine/legionmedx/on_mob_life(mob/living/carbon/M)
	M.AdjustStun(-20*REAGENTS_EFFECT_MULTIPLIER, 0)
	M.AdjustKnockdown(-20*REAGENTS_EFFECT_MULTIPLIER, 0)
	M.AdjustUnconscious(-20*REAGENTS_EFFECT_MULTIPLIER, 0)
	M.adjustStaminaLoss(-3*REAGENTS_EFFECT_MULTIPLIER, 0)
	..()
	. = TRUE

/datum/reagent/medicine/legionmedx/overdose_process(mob/living/M)
	if(prob(33))
		M.drop_all_held_items()
		M.Dizzy(2)
		M.Jitter(2)
	..()

/datum/reagent/medicine/legionmedx/addiction_act_stage1(mob/living/M)
	if(prob(33))
		M.drop_all_held_items()
		M.Jitter(2)
	..()

/datum/reagent/medicine/legionmedx/addiction_act_stage2(mob/living/M)
	if(prob(33))
		M.drop_all_held_items()
		M.adjustToxLoss(1*REAGENTS_EFFECT_MULTIPLIER)
		. = TRUE
		M.Dizzy(3)
		M.Jitter(3)
	..()

/datum/reagent/medicine/legionmedx/addiction_act_stage3(mob/living/M)
	if(prob(33))
		M.drop_all_held_items()
		M.adjustToxLoss(2*REAGENTS_EFFECT_MULTIPLIER)
		. = TRUE
		M.Dizzy(4)
		M.Jitter(4)
	..()

/datum/reagent/medicine/legionmedx/addiction_act_stage4(mob/living/M)
	if(prob(33))
		M.drop_all_held_items()
		M.adjustToxLoss(3*REAGENTS_EFFECT_MULTIPLIER)
		. = TRUE
		M.Dizzy(5)
		M.Jitter(5)
	..()

/datum/reagent/medicine/mentat
	name = "Mentat Powder"

	description = "A powerful drug that heals and increases the perception and intelligence of the user."
	color = "#C8A5DC"
	reagent_state = SOLID
	overdose_threshold = 30
	addiction_threshold = 20

/datum/reagent/medicine/mentat/on_mob_life(mob/living/carbon/M)
	M.adjustOxyLoss(-3*REAGENTS_EFFECT_MULTIPLIER)
	var/obj/item/organ/eyes/eyes = M.getorganslot(ORGAN_SLOT_EYES)
	if (!eyes)
		return
/*	if(HAS_TRAIT(M, TRAIT_BLIND, TRAIT_GENERIC))
		if(prob(20))
			to_chat(M, "<span class='warning'>Your vision slowly returns...</span>")
			M.cure_blind(EYE_DAMAGE)
			M.cure_nearsighted(EYE_DAMAGE)
			M.blur_eyes(35)
	else if(HAS_TRAIT(M, TRAIT_NEARSIGHT, TRAIT_GENERIC))
		to_chat(M, "<span class='warning'>The blackness in your peripheral vision fades.</span>")
		M.cure_nearsighted(EYE_DAMAGE)
		M.blur_eyes(10)*/
	else if(M.eye_blind || M.eye_blurry)
		M.set_blindness(0)
		M.set_blurriness(0)
//	else if(eyes.eye_damage > 0)
//		M.adjust_eye_damage(-1)
//	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, -2)
	if (prob(5))
		to_chat(M, "<span class='notice'>You feel way more intelligent!</span>")
	..()
	. = TRUE

/datum/reagent/medicine/mentat/overdose_process(mob/living/M)
	if(prob(33))
		M.Dizzy(2)
		M.Jitter(2)
//		M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 2)
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
		to_chat(M, "<span class='notice'>You feel like you've gotten over your need for [R.name].</span>")
	M.confused = max(M.confused, 4)
	if(ishuman(M) && prob(5))
		var/mob/living/carbon/human/H = M
		H.vomit(10)
	..()
	. = TRUE
