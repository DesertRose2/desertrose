////////////////////////////////////////////////////////////////////////////////////////////		
//F13 Quirks, all of these are locked behind a skill book or unobtainable by regular means.
////////////////////////////////////////////////////////////////////////////////////////////

/datum/quirk/bigleagues
	name = "Big Leagues"
	desc = "Swing for the fences! You deal additional damage with melee weapons."
	value = null
	mob_trait = TRAIT_BIG_LEAGUES
	gain_text = "<span class='notice'>You feel like swinging for the fences!</span>"
	lose_text = "<span class='danger'>You feel like bunting.</span>"
	locked = TRUE

/datum/quirk/chemwhiz
	name = "Chem Whiz"
	desc = "You've been playing around with chemicals all your life. You know how to use chemistry machinery."
	value = null
	mob_trait = TRAIT_CHEMWHIZ
	gain_text = "<span class='notice'>The mysteries of chemistry are revealed to you.</span>"
	lose_text = "<span class='danger'>You forget how the periodic table works.</span>"
	locked = TRUE

/datum/quirk/pa_wear
	name = "PA Wear"
	desc = "You've being around the wastes and have learned the importance of defense."
	value = null
	mob_trait = TRAIT_PA_WEAR
	gain_text = "<span class='notice'>You realize how to use Power Armor.</span>"
	lose_text = "<span class='danger'>You forget how Power Armor works.</span>"
	locked = TRUE

/datum/quirk/hard_yards
	name = "Hard Yards"
	desc = "You've put them in, now reap the rewards."
	value = null
	mob_trait = TRAIT_HARD_YARDS
	gain_text = "<span class='notice'>Rain or shine, nothing slows you down.</span>"
	lose_text = "<span class='danger'>You walk with a less sure gait, the ground seeming less firm somehow.</span>"
	locked = TRUE

/datum/quirk/lifegiver
	name = "Lifegiver"
	desc = "You embody wellness! Instantly gain +15 maximum Health"
	value = null
	mob_trait = TRAIT_LIFEGIVER
	gain_text = "<span class='notice'>You feel more healthy than usual.</span>"
	lose_text = "<span class='danger'>You feel less healthy than usual.</span>"
	locked = TRUE

/datum/quirk/lifegiver/on_spawn()
	var/mob/living/carbon/human/mob_tar = quirk_holder
	mob_tar.maxHealth += 15
	mob_tar.health += 15

/datum/quirk/iron_fist
	name = "Iron Fist"
	desc = "You have fists of kung-fury! Increases unarmed damage."
	value = null
	mob_trait = TRAIT_IRONFIST
	gain_text = "<span class='notice'>Your fists feel furious!</span>"
	lose_text = "<span class='danger'>Your fists feel calm again.</span>"
	locked = TRUE

/datum/quirk/iron_fist/on_spawn()
	var/mob/living/carbon/human/mob_tar = quirk_holder
	mob_tar.dna.species.punchdamagelow = 4
	mob_tar.dna.species.punchdamagehigh = 11

/datum/quirk/machine_spirits
	name = "Spirit Blessed"
	desc = "You respect the teachings of the Machine Spirits."
	value = null
	mob_trait = TRAIT_MACHINE_SPIRITS
	gain_text = "<span class='notice'>You have recieved the blessing of the Machine Spirits.</span>"
	lose_text = "<span class='danger'>You've lost the  blessing of the Machine Spirits.</span>"
	locked = TRUE

/datum/quirk/demolitions
	name = "Demolition Expert"
	desc = "You have deep knowledge of bomb making and their defusal, you can construct a high yield explosives with only basic materials."
	value = null
	mob_trait = TRAIT_DEMOLITION_EXPERT
	gain_text = "<span class='notice'>You suddenly feel like you could turn a clock into a bomb.</span>"
	lose_text = "<span class='danger'>You suddenly feel like screwing around with clocks might be a bad idea.</span>"
	locked = TRUE

//////////////////////////////////////
//Surgeries, only obtaniable by books
//////////////////////////////////////

/datum/quirk/surgerylow
	name = "Minor Surgery"
	desc = "You are a somewhat adequate medical practicioner, capable of performing minor surgery."
	value = null
	mob_trait = TRAIT_SURGERY_LOW
	gain_text = "<span class='notice'>You feel yourself discovering the basics of the human body.</span>"
	lose_text = "<span class='danger'>You forget how to perform even the simplest surgery.</span>"
	locked = TRUE

/datum/quirk/surgerymid
	name = "Intermediate Surgery"
	desc = "You are a skilled medical practicioner, capable of performing most surgery."
	value = null
	mob_trait = TRAIT_SURGERY_MID
	gain_text = "<span class='notice'>You feel yourself discovering most of the details of the human body.</span>"
	lose_text = "<span class='danger'>You forget how to perform surgery.</span>"
	locked = TRUE

/datum/quirk/surgeryhigh
	name = "Complex Surgery"
	desc = "You are an expert practicioner, capable of performing almost all surgery."
	value = null
	mob_trait = TRAIT_SURGERY_HIGH
	gain_text = "<span class='notice'>You feel yourself discovering the most intricate secrets of the human body.</span>"
	lose_text = "<span class='danger'>You forget your advanced surgical knowledge.</span>"
	locked = TRUE

/////////
//Items
/////////
