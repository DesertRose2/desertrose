/datum/chemical_reaction/space_drugs
	name = "Miscellaneous Drugs"
	id = /datum/reagent/drug/space_drugs
	results = list(/datum/reagent/drug/space_drugs = 3)
	required_reagents = list(/datum/reagent/mercury = 1, /datum/reagent/consumable/sugar = 1, /datum/reagent/lithium = 1)

/datum/chemical_reaction/heroin
	name = "Heroin"
	id = /datum/reagent/drug/heroin
	results = list(/datum/reagent/drug/heroin = 6)
	required_reagents = list(/datum/reagent/medicine/morphine = 1, /datum/reagent/medicine/spaceacillin = 1, /datum/reagent/hydrogen = 1)
	mix_message = "The mixture dries turns into a pale white powder and then melts into a honey gold liquid."
	required_temp = 500

/datum/chemical_reaction/methamphetamine
	name = "methamphetamine"
	id = /datum/reagent/drug/methamphetamine
	results = list(/datum/reagent/drug/methamphetamine = 4)
	required_reagents = list(/datum/reagent/medicine/ephedrine = 1, /datum/reagent/iodine = 1, /datum/reagent/phosphorus = 1, /datum/reagent/hydrogen = 1)
	required_temp = 374

/datum/chemical_reaction/aranesp
	name = "aranesp"
	id = /datum/reagent/drug/aranesp
	results = list(/datum/reagent/drug/aranesp = 3)
	required_reagents = list(/datum/reagent/medicine/epinephrine = 1, /datum/reagent/medicine/atropine = 1, /datum/reagent/medicine/morphine = 1)

/datum/chemical_reaction/happiness
	name = "Happiness"
	id = /datum/reagent/drug/happiness
	results = list(/datum/reagent/drug/happiness = 4)
	required_reagents = list(/datum/reagent/nitrous_oxide = 2, /datum/reagent/medicine/epinephrine = 1, /datum/reagent/consumable/ethanol = 1)
	required_catalysts = list(/datum/reagent/toxin/plasma = 5)
