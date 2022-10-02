/datum/species/smutant
	name = "Super Mutant"
	icon_limbs = 'icons/mob/mutie_parts.dmi'
	id = "smutant"
	say_mod = "yells"
	limbs_id = "smutant"
	species_traits = list(EYECOLOR, NOTRANSSTING, NOGENITALS, NOAROUSAL)
	inherent_traits = list(TRAIT_RADIMMUNE)
	inherent_biotypes = list(MOB_HUMANOID)
	whitelisted = 1
	whitelist = list("honto335", "pisshole", "goldrobo", "prawn04", "jkjudgex", "theburningflame", "theeternalflame",
					"clearedobject", "magentaformula0", "ollieoxen", "fayettefrost", "allakai", "alanparkermasters",
					"marrone", 	"melodicdeity", "alasania", "mirkoloio", "novaskelly", "usotsukihime", "cythisia",
					"asterixcodix", "zestyspy", "psychoticcone", "julwalters", "thegreatcoward", "gurking", "whobeder04",
					"yecrowbarman", "yeehawguvnah", "hallow96", "ourlordspungus", "muhsollini"
					) // When adding someone to this list, make sure to add them to the "ckeywhitelist" in _supermutant.dm
	offset_features = list (
		OFFSET_HEAD = list(1,5),
		OFFSET_SUIT = list(0,0),
		OFFSET_BELT = list(5,0),
		OFFSET_EYES = list(1,6)
		)
	punchstunthreshold = 15
	punchdamagelow = 5
	punchdamagehigh = 20
	use_skintones = 0
	sexes = 0
	armor = 10
	liked_food = JUNKFOOD | FRIED | RAW

/datum/species/smutant/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	..()
	for(var/obj/item/bodypart/b in C.bodyparts)
		b.max_damage += 50
	C.faction = "supermutant"
	C.mind.teach_crafting_recipe(/datum/crafting_recipe/mutiesalvagedarmorconversion)
	C.mind.teach_crafting_recipe(/datum/crafting_recipe/mutiehelmsalvagedarmorconversion)

/datum/species/smutant/on_species_loss(mob/living/carbon/C)
	..()
	C.faction -= "supermutant"
	for(var/obj/item/bodypart/b in C.bodyparts)
		b.max_damage = initial(b.max_damage)

/datum/species/smutant/qualifies_for_rank(rank, list/features)
	if(rank in GLOB.legion_positions) // haha, no
		return 0
	if(rank in GLOB.brotherhood_positions) //no.
		return 0
	return ..()

/datum/species/smutant/nightkin
	name = "Nightkin"
	id = "nightkin"
	limbs_id = "nightkin"
