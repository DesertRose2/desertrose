
/datum/chemical_reaction/formaldehyde
	name = "formaldehyde"
	id = /datum/reagent/toxin/formaldehyde
	results = list(/datum/reagent/toxin/formaldehyde = 3)
	required_reagents = list(/datum/reagent/consumable/ethanol = 1, /datum/reagent/oxygen = 1, /datum/reagent/silver = 1)
	required_temp = 420

/datum/chemical_reaction/fentanyl
	name = "fentanyl"
	id = /datum/reagent/toxin/fentanyl
	results = list(/datum/reagent/toxin/fentanyl = 1)
	required_reagents = list(/datum/reagent/drug/space_drugs = 1)
	required_temp = 674

/datum/chemical_reaction/cyanide
	name = "Cyanide"
	id = /datum/reagent/toxin/cyanide
	results = list(/datum/reagent/toxin/cyanide = 3)
	required_reagents = list(/datum/reagent/oil = 1, /datum/reagent/ammonia = 1, /datum/reagent/oxygen = 1)
	required_temp = 380

/datum/chemical_reaction/facid
	name = "Fluorosulfuric acid"
	id = /datum/reagent/toxin/acid/fluacid
	results = list(/datum/reagent/toxin/acid/fluacid = 4)
	required_reagents = list(/datum/reagent/toxin/acid = 1, /datum/reagent/fluorine = 1, /datum/reagent/hydrogen = 1, /datum/reagent/potassium = 1)
	required_temp = 380

/datum/chemical_reaction/lipolicide
	name = "lipolicide"
	id = /datum/reagent/toxin/lipolicide
	results = list(/datum/reagent/toxin/lipolicide = 3)
	required_reagents = list(/datum/reagent/mercury = 1, /datum/reagent/diethylamine = 1, /datum/reagent/medicine/ephedrine = 1)

/datum/chemical_reaction/mutagen
	name = "Unstable mutagen"
	id = /datum/reagent/toxin/mutagen
	results = list(/datum/reagent/toxin/mutagen = 3)
	required_reagents = list(/datum/reagent/radium = 1, /datum/reagent/phosphorus = 1, /datum/reagent/chlorine = 1)

/datum/chemical_reaction/mindbreaker
	name = "Mindbreaker Toxin"
	id = /datum/reagent/toxin/mindbreaker
	results = list(/datum/reagent/toxin/mindbreaker = 5)
	required_reagents = list(/datum/reagent/silicon = 1, /datum/reagent/hydrogen = 1, /datum/reagent/medicine/charcoal = 1)

/datum/chemical_reaction/mimesbane
	name = "Mime's Bane"
	id = /datum/reagent/toxin/mimesbane
	results = list(/datum/reagent/toxin/mimesbane = 3)
	required_reagents = list(/datum/reagent/radium = 1, /datum/reagent/toxin/mutetoxin = 1, /datum/reagent/consumable/nothing = 1)

/datum/chemical_reaction/bonehurtingjuice
	name = "Bone Hurting Juice"
	id = /datum/reagent/toxin/bonehurtingjuice
	results = list(/datum/reagent/toxin/bonehurtingjuice = 5)
	required_reagents = list(/datum/reagent/toxin/mutagen = 1, /datum/reagent/toxin/itching_powder = 3, /datum/reagent/consumable/milk = 1)
	mix_message = "<span class='danger'>The mixture suddenly becomes clear and looks a lot like water. You feel a strong urge to drink it.</span>"
