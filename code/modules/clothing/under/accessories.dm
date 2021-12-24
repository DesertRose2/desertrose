/obj/item/clothing/accessory //Ties moved to neck slot items, but as there are still things like medals and armbands, this accessory system is being kept as-is
	name = "Accessory"
	desc = "Something has gone wrong!"
	icon = 'icons/obj/clothing/accessories.dmi'
	icon_state = "plasma"
	item_state = ""	//no inhands
	slot_flags = 0
	w_class = WEIGHT_CLASS_SMALL
	var/above_suit = FALSE
	var/minimize_when_attached = TRUE // TRUE if shown as a small icon in corner, FALSE if overlayed
	var/datum/component/storage/detached_pockets

/obj/item/clothing/accessory/proc/attach(obj/item/clothing/under/U, user)
	var/datum/component/storage/storage = GetComponent(/datum/component/storage)
	if(storage)
		if(SEND_SIGNAL(U, COMSIG_CONTAINS_STORAGE))
			return FALSE
		U.TakeComponent(storage)
		detached_pockets = storage
	U.attached_accessory = src
	forceMove(U)
	layer = FLOAT_LAYER
	plane = FLOAT_PLANE
	if(minimize_when_attached)
		transform *= 0.5	//halve the size so it doesn't overpower the under
		pixel_x += 8
		pixel_y -= 8
	U.add_overlay(src)

	if (islist(U.armor) || isnull(U.armor)) 										// This proc can run before /obj/Initialize has run for U and src,
		U.armor = getArmor(arglist(U.armor))	// we have to check that the armor list has been transformed into a datum before we try to call a proc on it
																					// This is safe to do as /obj/Initialize only handles setting up the datum if actually needed.
	if (islist(armor) || isnull(armor))
		armor = getArmor(arglist(armor))

	U.armor = U.armor.attachArmor(armor)

	if(isliving(user))
		on_uniform_equip(U, user)

	return TRUE

/obj/item/clothing/accessory/proc/detach(obj/item/clothing/under/U, user)
	if(detached_pockets && detached_pockets.parent == U)
		TakeComponent(detached_pockets)

	U.armor = U.armor.detachArmor(armor)

	if(isliving(user))
		on_uniform_dropped(U, user)

	if(minimize_when_attached)
		transform *= 2
		pixel_x -= 8
		pixel_y += 8
	layer = initial(layer)
	plane = initial(plane)
	U.cut_overlays()
	U.attached_accessory = null
	U.accessory_overlay = null

/obj/item/clothing/accessory/proc/on_uniform_equip(obj/item/clothing/under/U, user)
	return

/obj/item/clothing/accessory/proc/on_uniform_dropped(obj/item/clothing/under/U, user)
	return

/obj/item/clothing/accessory/AltClick(mob/user)
	. = ..()
	if(istype(user) && user.canUseTopic(src, BE_CLOSE, ismonkey(user)))
		if(initial(above_suit))
			above_suit = !above_suit
			to_chat(user, "[src] will be worn [above_suit ? "above" : "below"] your suit.")
			return TRUE

/obj/item/clothing/accessory/examine(mob/user)
	. = ..()
	. += SPAN_NOTICE("\The [src] can be attached to a uniform. Alt-click to remove it once attached.")
	if(initial(above_suit))
		. += SPAN_NOTICE("\The [src] can be worn above or below your suit. Alt-click to toggle.")

/obj/item/clothing/accessory/waistcoat
	name = "waistcoat"
	desc = "For some classy, murderous fun."
	icon_state = "waistcoat"
	item_state = "waistcoat"
	minimize_when_attached = FALSE

/obj/item/clothing/accessory/waistcoat/sheepskin
	name = "sheepskin vest"
	desc = "A warm, homemade, bighorner skin vest."
	icon_state = "sheepskin_vest"
	item_state = "sheepskin_vest"

/obj/item/clothing/accessory/waistcoat/cowboy
	name = "ranger cowboy vest"
	desc = "A thick, protective vest made out of leather with a badge tied to it."
	icon_state = "cowboyrangervest"
	item_state = "cowboyrangervest"

/obj/item/clothing/accessory/maidapron
	name = "maid apron"
	desc = "The best part of a maid costume."
	icon_state = "maidapron"
	item_state = "maidapron"
	minimize_when_attached = FALSE

//////////
//Medals//
//////////

/obj/item/clothing/accessory/medal
	name = "bronze medal"
	desc = "A bronze medal."
	icon_state = "bronze"
	custom_materials = list(/datum/material/iron=1000)
	resistance_flags = FIRE_PROOF
	var/medaltype = "medal" //Sprite used for medalbox
	var/commended = FALSE

//Pinning medals on people
/obj/item/clothing/accessory/medal/attack(mob/living/carbon/human/M, mob/living/user)
	if(ishuman(M) && (user.a_intent == INTENT_HELP))

		if(M.wear_suit)
			if((M.wear_suit.flags_inv & HIDEJUMPSUIT)) //Check if the jumpsuit is covered
				to_chat(user, SPAN_WARNING("Medals can only be pinned on jumpsuits."))
				return

		if(M.w_uniform)
			var/obj/item/clothing/under/U = M.w_uniform
			var/delay = 20
			if(user == M)
				delay = 0
			else
				user.visible_message("[user] is trying to pin [src] on [M]'s chest.", \
									SPAN_NOTICE("You try to pin [src] on [M]'s chest."))
			var/input
			if(!commended && user != M)
				input = stripped_input(user,"Please input a reason for this commendation. It will be publicly announced at the end of the round.", ,"", 140)
			if(do_after(user, delay, target = M))
				if(U.attach_accessory(src, user, 0)) //Attach it, do not notify the user of the attachment
					if(user == M)
						to_chat(user, SPAN_NOTICE("You attach [src] to [U]."))
					else
						user.visible_message("[user] pins \the [src] on [M]'s chest.", \
											SPAN_NOTICE("You pin \the [src] on [M]'s chest."))
						if(input)
							SSblackbox.record_feedback("associative", "commendation", 1, list("commender" = "[user.real_name]", "commendee" = "[M.real_name]", "medal" = "[src]", "reason" = input))
							GLOB.commendations += "[user.real_name] awarded <b>[M.real_name]</b> the <span class='medaltext'>[name]</span>! \n- [input]"
							commended = TRUE
							desc += "<br>The inscription reads: [input] - [user.real_name]"
							log_game("<b>[key_name(M)]</b> was given the following commendation by <b>[key_name(user)]</b>: [input]")
							message_admins("<b>[key_name(M)]</b> was given the following commendation by <b>[key_name(user)]</b>: [input]")

		else
			to_chat(user, SPAN_WARNING("Medals can only be pinned on jumpsuits!"))
	else
		..()

/obj/item/clothing/accessory/medal/conduct
	name = "distinguished conduct medal"
	desc = "A bronze medal awarded for distinguished conduct, and not much else."

/obj/item/clothing/accessory/medal/bronze_heart
	name = "bronze heart medal"
	desc = "A bronze heart-shaped medal awarded for sacrifice. It is often awarded posthumously or for severe injury in the line of duty."
	icon_state = "bronze_heart"

/obj/item/clothing/accessory/medal/engineer
	name = "\"Shift's Best Electrician\" award"
	desc = "An award bestowed upon engineers who have excelled at keeping the station running in the best possible condition against all odds."
	icon_state = "engineer"

/obj/item/clothing/accessory/medal/greytide
	name = "\"Greytider of the shift\" award"
	desc = "An award for only the most annoying of assistants. Locked doors mean nothing to you and behaving is not in your vocabulary"
	icon_state = "greytide"

/obj/item/clothing/accessory/medal/ribbon
	name = "ribbon"
	desc = "A ribbon."
	icon_state = "cargo"

/obj/item/clothing/accessory/medal/ribbon/cargo
	name = "\"cargo tech of the shift\" award"
	desc = "An award bestowed only upon those cargotechs who have exhibited devotion to their duty in keeping with the highest traditions of Cargonia."

/obj/item/clothing/accessory/medal/ribbon/medical_doctor
	name = "\"doctor of the shift\" award"
	desc = "An award bestowed only upon the most capable doctors who have upheld the Hippocratic Oath to the best of their ability."
	icon_state = "medical_doctor"

/obj/item/clothing/accessory/medal/silver
	name = "silver medal"
	desc = "A silver medal."
	icon_state = "silver"
	medaltype = "medal-silver"
	custom_materials = list(/datum/material/silver=1000)

/obj/item/clothing/accessory/medal/silver/valor
	name = "medal of valor"
	desc = "A silver medal awarded for acts of exceptional valor."

/obj/item/clothing/accessory/medal/silver/security
	name = "robust security award"
	desc = "An award for distinguished combat and sacrifice in defense of a Vault. Often awarded to security staff."

/obj/item/clothing/accessory/medal/gold
	name = "gold medal"
	desc = "A prestigious golden medal."
	icon_state = "gold"
	medaltype = "medal-gold"
	custom_materials = list(/datum/material/gold=1000)

/obj/item/clothing/accessory/medal/gold/captain
	name = "Vault overseer's medal"
	desc = "A golden medal awarded exclusively to those promoted to the rank of captain. It signifies the codified responsibilities of a Vault overseer, and their undisputable authority over the Vault's denizens."
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF

/obj/item/clothing/accessory/medal/gold/captain/family
	name = "old Vault overseer's medal"
	desc = "A rustic badge pure gold, has been through hell and back by the looks, the syndcate have been after these by the looks of it for generations..."
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 10) //Pure gold
	custom_materials = list(/datum/material/gold=2000)

/obj/item/clothing/accessory/medal/gold/heroism
	name = "medal of exceptional heroism"
	desc = "An extremely rare golden medal awarded only by CentCom. To receive such a medal is the highest honor and as such, very few exist. This medal is almost never awarded to anybody but commanders."

/obj/item/clothing/accessory/medal/plasma
	name = "plasma medal"
	desc = "An eccentric medal made of plasma."
	icon_state = "plasma"
	medaltype = "medal-plasma"
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = -10, "acid" = 0) //It's made of plasma. Of course it's flammable.
	custom_materials = list(/datum/material/plasma=1000)

/obj/item/clothing/accessory/medal/plasma/temperature_expose(datum/gas_mixture/air, exposed_temperature, exposed_volume)
	if(exposed_temperature > 300)
		atmos_spawn_air("plasma=20;TEMP=[exposed_temperature]")
		visible_message(SPAN_DANGER(" \The [src] bursts into flame!"),"<span class='userdanger'>Your [src] bursts into flame!</span>")
		qdel(src)

/obj/item/clothing/accessory/medal/plasma/nobel_science
	name = "nobel sciences award"
	desc = "A plasma medal which represents significant contributions to the field of science or engineering."

/obj/item/clothing/accessory/medal/californian_cross
	name = "The Californian Cross"
	desc = "This medal is given to those who have endured the hardships of captivity and all it entails, we honor their courage and resolve in those dark times and shall never forget what they gave."
	icon_state = "californian_cross"
	item_state = "californian_cross"

////////////
//Armbands//
////////////

/obj/item/clothing/accessory/armband
	name = "red armband"
	desc = "An fancy red armband!"
	icon_state = "redband"

/obj/item/clothing/accessory/armband/deputy
	name = "security deputy armband"
	desc = "An armband, worn by personnel authorized to act as a deputy of station security."

/obj/item/clothing/accessory/armband/cargo
	name = "cargo bay guard armband"
	desc = "An armband, worn by the station's security forces to display which department they're assigned to. This one is brown."
	icon_state = "cargoband"

/obj/item/clothing/accessory/armband/engine
	name = "engineering guard armband"
	desc = "An armband, worn by the station's security forces to display which department they're assigned to. This one is orange with a reflective strip!"
	icon_state = "engieband"

/obj/item/clothing/accessory/armband/science
	name = "science guard armband"
	desc = "An armband, worn by the station's security forces to display which department they're assigned to. This one is purple."
	icon_state = "rndband"

/obj/item/clothing/accessory/armband/hydro
	name = "hydroponics guard armband"
	desc = "An armband, worn by the station's security forces to display which department they're assigned to. This one is green and blue."
	icon_state = "hydroband"

/obj/item/clothing/accessory/armband/med
	name = "medical guard armband"
	desc = "An armband, worn by the station's security forces to display which department they're assigned to. This one is white."
	icon_state = "medband"

/obj/item/clothing/accessory/armband/medblue
	name = "medical guard armband"
	desc = "An armband, worn by the station's security forces to display which department they're assigned to. This one is white and blue."
	icon_state = "medblueband"

//////////////
//OBJECTION!//
//////////////

/obj/item/clothing/accessory/lawyers_badge
	name = "attorney's badge"
	desc = "Fills you with the conviction of JUSTICE. Lawyers tend to want to show it to everyone they meet."
	icon_state = "lawyerbadge"

/obj/item/clothing/accessory/lawyers_badge/attack_self(mob/user)
	if(prob(1))
		user.say("The testimony contradicts the evidence!", forced = "attorney's badge")
	user.visible_message("[user] shows [user.p_their()] attorney's badge.", SPAN_NOTICE("You show your attorney's badge."))

/obj/item/clothing/accessory/lawyers_badge/on_uniform_equip(obj/item/clothing/under/U, user)
	var/mob/living/L = user
	if(L)
		L.bubble_icon = "lawyer"

/obj/item/clothing/accessory/lawyers_badge/on_uniform_dropped(obj/item/clothing/under/U, user)
	var/mob/living/L = user
	if(L)
		L.bubble_icon = initial(L.bubble_icon)

////////////////
//HA HA! NERD!//
////////////////
/obj/item/clothing/accessory/pocketprotector
	name = "pocket protector"
	desc = "Can protect your clothing from ink stains, but you'll look like a nerd if you're using one."
	icon_state = "pocketprotector"
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/pocketprotector

/obj/item/clothing/accessory/pocketprotector/full/Initialize()
	. = ..()
	new /obj/item/pen/red(src)
	new /obj/item/pen(src)
	new /obj/item/pen/blue(src)

/obj/item/clothing/accessory/pocketprotector/cosmetology/Initialize()
	. = ..()
	for(var/i in 1 to 3)
		new /obj/item/lipstick/random(src)

////////////////
//OONGA BOONGA//
////////////////

/obj/item/clothing/accessory/talisman
	name = "bone talisman"
	desc = "A hunter's talisman, some say the old gods smile on those who wear it."
	icon_state = "talisman"
	armor = list("linemelee" = 1, "linebullet" = 1, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 5, "fire" = 0, "acid" = 0)

/obj/item/clothing/accessory/skullcodpiece
	name = "skull codpiece"
	desc = "A skull shaped ornament, intended to protect the important things in life."
	icon_state = "skull"
	above_suit = TRUE
	armor = list("linemelee" = 1, "linebullet" = 1, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 5, "fire" = 0, "acid" = 0)

/obj/item/clothing/accessory/skullcodpiece/fake
	name = "false codpiece"
	desc = "A plastic ornament, intended to protect the important things in life. It's not very good at it."
	icon_state = "skull"
	above_suit = TRUE
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/////////////////////
//Syndie Accessories//
/////////////////////

/obj/item/clothing/accessory/padding
	name = "protective padding"
	desc = "A soft padding meant to cushion the wearer from melee harm."
	icon_state = "padding"
	armor = list("linemelee" = 40, "linebullet" = 20, "laser" = 0, "energy" = 0, "bomb" = 5, "bio" = 0, "rad" = 0, "fire" = -20, "acid" = 45)
	flags_inv = HIDEACCESSORY //hidden from indiscrete mob examines.

/obj/item/clothing/accessory/kevlar
	name = "kevlar padding"
	desc = "A layered kevlar padding meant to cushion the wearer from ballistic harm."
	icon_state = "padding"
	armor = list("linemelee" = 20, "linebullet" = 40, "laser" = 0, "energy" = 0, "bomb" = 10, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 25)
	flags_inv = HIDEACCESSORY

/obj/item/clothing/accessory/plastics
	name = "ablative padding"
	desc = "A thin ultra-refractory composite padding meant to cushion the wearer from energy lasers harm."
	icon_state = "plastics"
	armor = list("melee" = 0, "bullet" = 0, "linelaser" = 40, "energy" = 10, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 20, "acid" = -40)
	flags_inv = HIDEACCESSORY

//necklace
/obj/item/clothing/accessory/necklace
	name = "necklace"
	desc = "A necklace."
	icon_state = "locket"
	obj_flags = UNIQUE_RENAME
	custom_materials = list(/datum/material/iron=100)
	resistance_flags = FIRE_PROOF

//BOSRanks

/obj/item/clothing/accessory/bos/initiateK
	name = "Knight-Aspirant pin"
	desc = "A silver pin with blue cloth, worn by Initiates aspiring to be Knights."
	icon_state = "initiateK"
	item_color = "initiateK"
	minimize_when_attached = TRUE

/obj/item/clothing/accessory/bos/initiateS
	name = "Scribe-Aspirant pin"
	desc = "A silver pin with red cloth, worn by Initiates aspiring to be Scribes."
	icon_state = "initiateS"
	item_color = "initiateS"
	minimize_when_attached = TRUE

/obj/item/clothing/accessory/bos/knight
	name = "Knight pins"
	desc = "A silver pin with one device and blue coloring, worn by fully fledged Knights of the Brotherhood."
	icon_state = "knight"
	item_color = "knight"
	minimize_when_attached = TRUE

/obj/item/clothing/accessory/bos/scribe
	name = "Scribe pins"
	desc = "A silver pin with one device and red coloring, worn by fully fledged Scribes of the Brotherhood."
	icon_state = "scribe"
	item_color = "scribe"
	minimize_when_attached = TRUE

/obj/item/clothing/accessory/bos/juniorpaladin
	name = "Junior Paladin pins"
	desc = "A silver pin with one device, and purple coloring. Worn by the Paladin-in-Training of the Brotherhood."
	icon_state = "juniorpaladin"
	item_color = "juniorpaladin"
	minimize_when_attached = TRUE

/obj/item/clothing/accessory/bos/knightcaptain
	name = "Knight Captain pins"
	desc = "A gold-plated, silver lined pin with one device and two outstretched wings on the side; a golden sword centered on blue-cloth. Worn by the Knight Captain."
	icon_state = "knight-captain"
	item_color = "knight-captain"
	minimize_when_attached = TRUE

/obj/item/clothing/accessory/bos/seniorscribe
	name = "Proctor pins"
	desc = "A silver pin with one device gilded in gold, little notches at the top end, and a golden sword in the center of red cloth; worn by the high-ranking Proctor."
	icon_state = "seniorscribe"
	item_color = "seniorscribe"
	minimize_when_attached = TRUE

/obj/item/clothing/accessory/bos/paladin
	name = "Paladin pins"
	desc = "A silver pin with one device, a silver sword centered on the purple coloring, and notches denoting the rank of the Paladin."
	icon_state = "paladin"
	item_color = "paladin"
	minimize_when_attached = TRUE

/obj/item/clothing/accessory/bos/seniorpaladin
	name = "Senior Paladin pins"
	desc = "A silver pin with one device gilded in gold, little notches at the top end, and a golden sword in the center of purple cloth; worn by the high-ranking Senior Paladin."
	icon_state = "seniorpaladin"
	item_color = "seniorpaladin"
	minimize_when_attached = TRUE

/obj/item/clothing/accessory/bos/seniorknight
	name = "Senior Knight pins"
	desc = "A silver pin with one device gilded in gold, little notches at the top end, and a golden sword in the center of purple cloth; worn by the high-ranking Senior Knight."
	icon_state = "seniorknight"
	item_color = "seniorknight"
	minimize_when_attached = TRUE

/obj/item/clothing/accessory/bos/juniorknight
	name = "Junior Knight pins"
	desc = "A silver pin with one device, and blue coloring. Worn by the Knight-in-Training of the Brotherhood."
	icon_state = "juniorknight"
	item_color = "juniorknight"
	minimize_when_attached = TRUE

/obj/item/clothing/accessory/bos/juniorscribe
	name = "Junior Scribe pins"
	desc = "A silver pin with one device, and red coloring. Worn by the Scribe-in-Training of the Brotherhood."
	icon_state = "juniorscribe"
	item_color = "juniorscribe"
	minimize_when_attached = TRUE

/obj/item/clothing/accessory/bos/headscribe
	name = "Head Scribe pins"
	desc = "A gold-plated, silver lined pin with one device and two outstretched wings on the side; a golden sword centered on red-cloth. Worn by the Head Scribe."
	icon_state = "headscribe"
	item_color = "headscribe"
	minimize_when_attached = TRUE

/obj/item/clothing/accessory/bos/sentinel
	name = "Head Paladin pins"
	desc = "A gold-plated, silver lined pin with one device and two outstretched wings on the side; a golden sword centered on purple-cloth. Worn by the Head Paladin."
	icon_state = "sentinel"
	item_color = "sentinel"
	minimize_when_attached = TRUE

/obj/item/clothing/accessory/bos/elder
	name = "Elder pins"
	desc = "A gold-plated, silver lined pin with one device and two outstretched wings on the side; a golden sword centered on green-cloth. It bears notches with gems on the top half, and denotes the rank of Elder."
	icon_state = "elder"
	item_color = "elder"
	minimize_when_attached = TRUE

//NCRRanks

/obj/item/clothing/accessory/ncr
	name = "(O-6) Colonel rank pin"
	desc = "An officer holding the rank of Colonel should wear these."
	icon_state = "colonelrank"
	item_color = "colonelrank"
	minimize_when_attached = TRUE

/obj/item/clothing/accessory/ncr/CPT
	name = "(O-3) Captain rank pin"
	desc = "An officer holding the rank of Captain should wear this."
	icon_state = "captainrank"
	item_color = "captainrank"
	minimize_when_attached = TRUE

/obj/item/clothing/accessory/ncr/LT1
	name = "(O-2) First Lieutenant rank pin"
	desc = "An officer holding the rank of First Lieutenant should wear this."
	icon_state = "firstlieutenantrank"
	item_color = "firstlieutenantrank"
	minimize_when_attached = TRUE

/obj/item/clothing/accessory/ncr/LT2
	name = "(O-1) Second Lieutenant rank pin"
	desc = "An officer holding the rank of Second Lieutenant should wear this."
	icon_state = "secondlieutenantrank"
	item_color = "secondlieutenantrank"
	minimize_when_attached = TRUE

/obj/item/clothing/accessory/armband/med/ncr
	name = "Medical Personnel armband"
	desc = "An armband worn by NCR medical personnel. This one is white."

/obj/item/clothing/accessory/ncr/FSGT
	name = "(E-7) Sergeant First Class rank pins"
	desc = "A trooper holding the rank of Sergeant First Class should wear this."
	icon_state = "ncrenlisted"
	item_color = "ncrenlisted"
	minimize_when_attached = TRUE

/obj/item/clothing/accessory/ncr/SSGT
	name = "(E-6) Staff Sergeant rank pins"
	desc = "A trooper holding the rank of Staff Sergeant should wear this."
	icon_state = "ncrenlisted"
	item_color = "ncrenlisted"
	minimize_when_attached = TRUE

/obj/item/clothing/accessory/ncr/SGT
	name = "(E-5) Sergeant rank pins"
	desc = "A trooper holding the rank of Sergeant should wear this."
	icon_state = "ncrenlisted"
	item_color = "ncrenlisted"
	minimize_when_attached = TRUE

/obj/item/clothing/accessory/armband/engine/ncr
	name = "engineering armband"
	desc = "An armband worn by NCR engineering personnel. This one is orange with a reflective strip!"

/obj/item/clothing/accessory/ncr/CPL
	name = "(E-4) Corporal rank pins"
	desc = "A Corporal should wear this."
	icon_state = "ncrenlisted"
	item_color = "ncrenlisted"
	minimize_when_attached = TRUE

/obj/item/clothing/accessory/ncr/SPC
	name = "(E-4) Specialist rank pins"
	desc = "A Specialist should wear this."
	icon_state = "ncrenlisted"
	item_color = "ncrenlisted"
	minimize_when_attached = TRUE

/obj/item/clothing/accessory/ncr/TPR
	name = "(E-3) Private First Class rank pins"
	desc = "A trooper should wear this."
	icon_state = "ncrenlisted"
	item_color = "ncrenlisted"
	minimize_when_attached = TRUE

/obj/item/clothing/accessory/ncr/REC
	name = "(E-2) Private rank pins"
	desc = "A recruit should wear this."
	icon_state = "ncrenlisted"
	item_color = "ncrenlisted"
	minimize_when_attached = TRUE

/obj/item/clothing/accessory/armband/black
	name = "MP's armband"
	desc = "An armband issued to NCR Military Police, signifying their alignment with NCROSI rather than the typical chain of command."
	icon_state = "blackband"
	item_color = "blackband"

/obj/item/clothing/accessory/ranger
	name = "'Ranger' rank pins"
	desc = "A ranger should wear this."
	icon_state = "ncrenlisted"
	item_color = "ncrenlisted"

/obj/item/clothing/accessory/ranger/SGT
	name = "'Ranger-Sergeant' rank pins"
	desc = "A Ranger-Sergeant should wear this."

/obj/item/clothing/accessory/ranger/LT
	name = "'Ranger-Lieutenant' rank pins"
	desc = "A Ranger-Lieutenant should wear this."
	icon_state = "firstlieutenantrank"
	item_color = "firstlieutenantrank"

/obj/item/clothing/accessory/ranger/CPT
	name = "'Ranger-Captain' rank pins"
	desc = "A Ranger-Captain should wear this."
	icon_state = "captainrank"
	item_color = "captainrank"

/obj/item/clothing/accessory/ranger/MAJ
	name = "'Ranger-Major' rank pins"
	desc = "A Ranger-Major should wear this."
	icon_state = "majorrank"
	item_color = "majorrank"

/obj/item/clothing/accessory/ranger/ACR
	name = "'Assistant-Chief Ranger' rank pins"
	desc = "An Assistant-Chief Ranger should wear this."
	icon_state = "colonelrank" //TO-DO: Add a new sprite
	item_color = "colonelrank"

/obj/item/clothing/accessory/ranger/CR
	name = "'Chief Ranger' rank pins"
	desc = "A Chief Ranger should wear this."
	icon_state = "colonelrank" //TO-DO: Add a new sprite
	item_color = "colonelrank"

//LegionRanks

/obj/item/clothing/accessory/legion/cent
	name = "Legion Centurion rank pins"
	desc = "A pin for a Centurion."
	icon_state = "off-duty-cent-pin"
	item_color = "off-duty-cent-pin"

/obj/item/clothing/accessory/legion/officer
	name = "Legion Officer rank pins"
	desc = "A pin for the Veterans and Decani within the Legion."
	icon_state = "off-duty-officer-pin"
	item_color = "off-duty-officer-pin"

/obj/item/clothing/accessory/legion/prime
	name = "Legion Prime rank pins"
	desc = "A pin for the Primes within the Legion."
	icon_state = "off-duty-prime-pin"
	item_color = "off-duty-prime-pin"

/obj/item/clothing/accessory/legion/explorer
	name = "Legion Explorer corps pins"
	desc = "A pin for the Explorers and Venators within the Legion."
	icon_state = "off-duty-explorer-corps-pin"
	item_color = "off-duty-explorer-corps-pin"
