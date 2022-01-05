/* Parent Types */
/obj/item/reagent_containers/pill/patch/f13
	icon = 'icons/fallout/objects/medicine/chemical.dmi'

/obj/item/storage/pill_bottle/chem_tin/f13
	icon = 'icons/fallout/objects/medicine/chemical.dmi'

/obj/item/reagent_containers/pill/f13
	icon = 'icons/fallout/objects/medicine/chemical.dmi'

/obj/item/reagent_containers/hypospray/medipen/f13
	icon = 'icons/fallout/objects/medicine/syringe.dmi'


// -----------------
// HEALING POWDER
// ------------------

/obj/item/reagent_containers/pill/patch/f13/healingpowder
	name = "healing powder"
	desc = "A powder used to heal physical wounds derived from ground broc flowers and xander roots, commonly used by tribals."
	list_reagents = list(/datum/reagent/medicine/healing_powder = 10)
	icon_state = "healingpowder"
	self_delay = 0

/obj/item/reagent_containers/pill/patch/f13/healingpowder/custom
	name = "medicinal powder"
	desc = "A uncommon mix of powdered roots or chemicals."
	list_reagents = null
	icon_state = "healingpowder"
	self_delay = 0


// -----------------
// HEALING POULTICE
// -----------------

/obj/item/reagent_containers/pill/patch/f13/healpoultice
	name = "healing poultice"
	desc = "A concoction of broc flower, cave fungus, agave fruit and xander root."
	list_reagents = list(/datum/reagent/medicine/healing_powder/poultice = 10)
	icon_state = "healingpoultice"
	self_delay = 0


// -----------------
// ZOMBIE POULTICE
// -----------------

/obj/item/reagent_containers/pill/patch/f13/poultice_zombie
	name = "zombie poultice"
	desc = "A well refined powder, mostly in use by Caesar's Legion for its side effects which it causes in first time users."
	list_reagents = list(/datum/reagent/medicine/healing_powder/poultice_zombie = 10, /datum/reagent/medicine/coagulant = 10)
	icon_state = "healingpoulticezombie"
	self_delay = 50


// -----------------
// BITTER DRINK
// ------------------

/obj/item/reagent_containers/pill/patch/f13/bitterdrink
	name = "bitter drink"
	desc = "A disgusting drink favored by legion during their long marches. Slow working, but cures most ailments.<br> Mixing with other medicines or drinking more than one bottle is not wise."
	list_reagents = list(/datum/reagent/medicine/bitter_drink = 10)
	icon_state = "bitter"
	self_delay = 0


// -----------
// STIMPAK
// -----------

/obj/item/reagent_containers/hypospray/medipen/f13/stimpak
	name = "stimpak"
	desc = "A handheld delivery system for medicine, used to rapidly heal physical damage to the body."
	icon_state = "stimpak"
	volume = 10
	amount_per_transfer_from_this = 10
	list_reagents = list(/datum/reagent/medicine/stimpak = 10)

/obj/item/reagent_containers/hypospray/medipen/f13/stimpak/on_reagent_change(changetype)
	update_icon()

/obj/item/reagent_containers/hypospray/medipen/f13/stimpak/update_overlays()
	. = ..()
	var/mutable_appearance/stimpak_overlay = mutable_appearance('icons/fallout/objects/medicine/overlays.dmi', "stim", color = mix_color_from_reagents(reagents.reagent_list))
	if(reagents.total_volume)
		. += stimpak_overlay

/obj/item/reagent_containers/hypospray/medipen/f13/stimpak/custom
	desc = "A handheld delivery system for medicine, this particular one will deliver a tailored cocktail."
	icon_state = "stim"
	list_reagents = null

/obj/item/reagent_containers/hypospray/medipen/f13/stimpak/custom/update_overlays()
	. = ..()
	var/mutable_appearance/custom_stimpak_overlay = mutable_appearance('icons/fallout/objects/medicine/overlays.dmi', "stimfilling", color = mix_color_from_reagents(reagents.reagent_list))
	if(reagents.total_volume)
		. += custom_stimpak_overlay

// -------------
// SUPER STIMPAK
// -------------

/obj/item/reagent_containers/hypospray/medipen/f13/stimpak/super
	name = "super stimpak"
	desc = "The super version comes in a hypodermic, but with an additional vial containing more powerful drugs than the basic model and a leather belt to strap the needle to the injured limb."
	icon_state = "superstimpak"
	amount_per_transfer_from_this = 10
	list_reagents = list(/datum/reagent/medicine/super_stimpak = 10)

/obj/item/reagent_containers/hypospray/medipen/f13/stimpak/super/custom/update_overlays()
	. = ..()
	var/mutable_appearance/superstimpak_overlay = mutable_appearance('icons/fallout/objects/medicine/overlays.dmi', "stim", color = mix_color_from_reagents(reagents.reagent_list))
	if(reagents.total_volume)
		. += superstimpak_overlay

/obj/item/reagent_containers/hypospray/medipen/f13/stimpak/super/custom
	desc = "The super version comes in a hypodermic, but with an additional vial to inject more drugs than the basic model and a leather belt to strap the needle to a limb. This particular one will deliver a tailored cocktail."
	icon_state = "superstim"
	volume = 20
	amount_per_transfer_from_this = 20
	list_reagents = null

/obj/item/reagent_containers/hypospray/medipen/f13/stimpak/super/custom/update_overlays()
	. = ..()
	var/mutable_appearance/custom_superstimpak_overlay = mutable_appearance('icons/fallout/objects/medicine/overlays.dmi', "stimfilling", color = mix_color_from_reagents(reagents.reagent_list))
	if(reagents.total_volume)
		. += custom_superstimpak_overlay

// --------
// HYDRA
// --------

/obj/item/stack/medical/bone_gel/hydra
	name = "hydra"
	singular_name = "hydra"
	desc = "A large bottle with a hose at the end meant to help deal with fractures in natural way."
	icon = 'icons/fallout/objects/medicine/chemical.dmi'
	icon_state = "hydra"
	self_delay = 10
	amount = 3
	self_delay = 10

/obj/item/stack/medical/bone_gel/hydra/attack(mob/living/M, mob/user)
	to_chat(user, SPAN_WARNING("Hydra can only be used on fractured limbs while aggressively holding someone!"))
	return


// ------------------
// MOURNING DUST   (should be remade to a patch instead of stackable to be in line with other meds at some point)
// ------------------

/obj/item/stack/medical/mourning
	name = "mourning dust"
	singular_name = "mourning dust"
	desc = "A type of primitive herbal poultice.\nWhile traditionally used to prepare corpses for the mourning feast, it can also treat scrapes and burns on the living, however, it is liable to cause shortness of breath when employed in this manner.\nIt is imbued with ancient wisdom."
	icon = 'icons/fallout/objects/medicine/chemical.dmi'
	icon_state = "mourningpoultice"
	amount = 15
	max_amount = 15
	heal_brute = 10
	heal_burn = 10
	self_delay = 40
	other_delay = 10
	repeating = TRUE
	merge_type = /obj/item/stack/medical/mourning
	novariants = TRUE

/obj/item/stack/medical/mourning/five
	amount = 5

/obj/item/stack/medical/mourning/ten
	amount = 10

/obj/item/stack/medical/mourning/heal(mob/living/M, mob/user)
	if(iscarbon(M))
		return heal_carbon(M, user, heal_brute, heal_burn)
	return ..()

/obj/item/stack/medical/mourning/post_heal_effects(amount_healed, mob/living/carbon/healed_mob, mob/user)
	. = ..()
	healed_mob.adjustOxyLoss(amount_healed)

//OBSOLETE replace with /mourning, waiting on Tipton for this one too
/obj/item/stack/medical/poultice/ten
	amount = 10


///////////////
// NARCOTICS //
///////////////

/obj/item/reagent_containers/pill/patch/f13/jet
	name = "jet"
	desc = "A highly addictive meta-amphetamine that produces a fast-acting, intense euphoric high on the user."
	list_reagents = list(/datum/reagent/drug/jet = 10)
	icon_state = "jet"

/obj/item/reagent_containers/pill/patch/f13/turbo
	name = "turbo"
	desc = "A chem that vastly increases the user's reflexes and slows their perception of time."
	list_reagents = list(/datum/reagent/drug/turbo = 5)
	icon_state = "turbo"

/obj/item/reagent_containers/hypospray/medipen/f13/medx
	name = "syringe (med-x)"
	desc = "Contains Med-X, a powerful analgesic drug that increases the user's damage resistance. Highly addictive, and prolonged presence in the body comes with severe side effects."
	list_reagents = list(/datum/reagent/medicine/medx = 10)
	icon_state = "medx"

/obj/item/reagent_containers/hypospray/medipen/f13/medx/update_overlays()
	. = ..()
	var/mutable_appearance/medx_overlay = mutable_appearance('icons/fallout/objects/medicine/overlays.dmi', "medx", color = mix_color_from_reagents(reagents.reagent_list))
	if(reagents.total_volume)
		. += medx_overlay

/obj/item/reagent_containers/hypospray/medipen/f13/psycho
	name = "psycho"
	desc = "Contains Psycho, a drug that makes the user hit harder and shrug off slight stuns, but causes slight brain damage and carries a risk of addiction."
	icon_state = "psycho"
	volume = 10
	amount_per_transfer_from_this = 10
	list_reagents = list(/datum/reagent/drug/psycho = 10)


///////////
// PILLS //
///////////

/obj/item/reagent_containers/pill/f13/mentat
	name = "Mentat"
	desc = "A chalky pill that induces increased memory and cognitive functions, as well as heightened perception and creative faculties. \
	Also known for fixing eye damage and blindness, for some reason."
	icon_state = "pillmentat"
	list_reagents = list(/datum/reagent/medicine/mentat = 10)

/obj/item/reagent_containers/pill/f13/fixer
	name = "Fixer pill"
	desc = "A bitter pill that is known to rapidly treat the addictions, withdrawal effects, and other drawbacks of other chemicals. \
	Side effects include heavy nausea."
	icon_state = "pillfixer"
	list_reagents = list(/datum/reagent/medicine/fixer = 10)

/obj/item/reagent_containers/pill/f13/radx
	name = "Rad-X pill"
	desc = "A pill that stabilizes radiation levels and treats small amounts of toxin damage."
	icon_state = "pillradx"
	list_reagents = list(/datum/reagent/medicine/radx = 20)

/obj/item/reagent_containers/pill/f13/buffout
	name = "Buffout pill"
	desc = "A metallic tasting pill that greatly increases bloodflow and builds muscle mass. \
	Side effects may include sore muscles and increased irritability."
	icon_state = "pillbuffout"
	list_reagents = list(/datum/reagent/drug/buffout = 10)

/obj/item/reagent_containers/pill/f13/cateye
	name = "Cateye pill"
	desc = "A pill that smells strongly of carrots.. or maybe its fertalizer. It's hard to tell actually."
	icon_state = "pillcateye"
	list_reagents = list(/datum/reagent/medicine/cateye = 10)


//////////////////
// PILL BOTTLES //
//////////////////

/obj/item/storage/pill_bottle/chem_tin/f13/mentats
	name = "Mentats"
	icon_state = "pill_canister_mentat"
	desc = "Contains pills used to increase intelligence and perception."

/obj/item/storage/pill_bottle/chem_tin/f13/mentats/PopulateContents()
	for(var/i in 1 to 5)
		new /obj/item/reagent_containers/pill/f13/mentat(src)

/obj/item/storage/pill_bottle/chem_tin/f13/fixer
	name = "Fixer"
	icon_state = "pill_canister_fixer"
	desc = "Contains pills used to treat addiction and overdose on other chems."

/obj/item/storage/pill_bottle/chem_tin/f13/fixer/PopulateContents()
	for(var/i in 1 to 5)
		new /obj/item/reagent_containers/pill/f13/fixer(src)

/obj/item/storage/pill_bottle/chem_tin/f13/radx
	name = "Rad-X"
	icon_state = "pill_canister_radx"
	desc = "Contains pills used to treat and prevent radiation and minor toxin damage."

/obj/item/storage/pill_bottle/chem_tin/f13/radx/PopulateContents()
	for(var/i in 1 to 5)
		new /obj/item/reagent_containers/pill/f13/radx(src)

/obj/item/storage/pill_bottle/chem_tin/f13/buffout
	name = "Buffout"
	icon_state = "pill_canister_buffout"
	desc = "Contains pills used to increase muscle mass."

/obj/item/storage/pill_bottle/chem_tin/f13/buffout/PopulateContents()
	for(var/i in 1 to 5)
		new /obj/item/reagent_containers/pill/f13/buffout(src)

//Sprite of Cateye done by Yonsi / And updated by Muhsollini and Pebbles
/obj/item/storage/pill_bottle/chem_tin/f13/cateye
	name = "Cateye"
	icon_state = "pill_canister_cateye"
	desc = "Contains pills used to increase one's senses."

/obj/item/storage/pill_bottle/chem_tin/cateye/PopulateContents()
	for(var/i in 1 to 5)
		new /obj/item/reagent_containers/pill/f13/cateye(src)
