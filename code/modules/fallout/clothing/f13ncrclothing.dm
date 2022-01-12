//NCRA
//Army
//Helmets

/obj/item/clothing/head/f13/ncr
	name = "NCR helmet"
	desc = "(IV) A standard issue NCR helmet. Looks like you can write on it and strap a few items on the helmet band."
	icon_state = "ncr_infantry_helmet"
	armor = list("tier" = 4, "energy" = 20, "bomb" = 25, "bio" = 30, "rad" = 20, "fire" = 60, "acid" = 0)
	strip_delay = 50
	obj_flags = UNIQUE_RENAME
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/pothead

/obj/item/clothing/head/f13/ncr/goggles
	name = "NCR storm helmet"
	desc = "(IV) A standard issue NCR helmet, issued with an additional pair of storm goggles for weather resistance."
	icon_state = "ncr_goggles_helmet"
	flags_inv = HIDEEARS
	actions_types = list(/datum/action/item_action/toggle)
	flags_cover = HEADCOVERSEYES
	visor_flags_cover = HEADCOVERSEYES
	dog_fashion = null

/obj/item/clothing/head/f13/ncr/goggles/attack_self(mob/user)
	weldingvisortoggle(user)
	icon_state = "ncr_goggles_helmetup"
	item_state = "ncr_goggles_helmetup"
	armor = list("tier" = 4, "energy" = 20, "bomb" = 25, "bio" = 30, "rad" = 20, "fire" = 60, "acid" = 0)

/obj/item/clothing/head/f13/ncr/steelpot_med
	name = "NCR medic helmet"
	desc = "(IV) A standard issue NCR helmet with the addition of decalling signifying a medic."
	icon_state = "ncr_medical_helmet"

/obj/item/clothing/head/f13/ncr/steelpot_mp
	name = "NCR military police helmet"
	desc = "(IV) A standard issue NCR helmet emblazoned with the initials of the military police."
	icon_state = "ncr_MP"

/obj/item/clothing/head/helmet/f13/combat/ncr
	name = "NCR combat helmet"
	desc = "(V) An old military grade pre-war combat helmet with broken visor, repainted to the colour scheme of the New California Republic."
	icon_state = "ncr_helmet"
	item_state = "ncr_helmet"

/obj/item/clothing/head/helmet/f13/combat/mk2/ncr
	name = "reinforced NCR combat helmet"
	desc = "(VI) An advanced pre-war titanium plated, ceramic coated, kevlar, padded helmet designed to withstand extreme punishment of all forms, repainted to the colour scheme of the New California Republic."
	icon_state = "ncr_helmet_mk2"
	item_state = "ncr_helmet_mk2"

//Hats
/obj/item/clothing/head/f13/ncr_cap
	name = "NCR garrison cap"
	desc = "(I) A simple cloth garrison cap to be worn when a helmet isn't necessary."
	icon_state = "ncr_cap"
	armor = list("tier" = 1, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/head/beret/ncr
	name = "NCR infantry beret"
	desc = "(IV) A beret, issued to members of NCR."
	icon_state = "infantryberet"
	armor = list("tier" = 4, "energy" = 20, "bomb" = 25, "bio" = 30, "rad" = 20, "fire" = 60, "acid" = 0)

/obj/item/clothing/head/beret/ncr_lt
	name = "NCR officer beret"
	desc = "(VI) A beret, standard issue for all commissioned NCR Officers."
	icon_state = "ncr_officer"
	armor = list("tier" = 6, "energy" = 20, "bomb" = 25, "bio" = 30, "rad" = 20, "fire" = 60, "acid" = 0)

/obj/item/clothing/head/beret/medical
	name = "NCR medical beret"
	desc = "(IV) A white beret, issued to medical personel of the NCR."
	icon_state = "ncr_medical"
	armor = list("tier" = 4, "energy" = 20, "bomb" = 25, "bio" = 30, "rad" = 20, "fire" = 60, "acid" = 0)

/obj/item/clothing/head/beret/ncr_sapper
	name = "NCR sapper beret"
	desc = "(IV) A grey beret, issued to troopers that have passed Sapper School."
	icon_state = "sapperberet"
	armor = list("tier" = 4, "energy" = 20, "bomb" = 25, "bio" = 30, "rad" = 20, "fire" = 60, "acid" = 0)

/obj/item/clothing/head/f13/ncr_campaign
	name = "NCR campaign hat"
	desc = "(V) A khaki campaign hat, popularly used by senior NCOs in the NCRA."
	icon_state = "ncr_campaign"
	item_state = "ncr_campaign"
	armor = list("tier" = 5, "energy" = 20, "bomb" = 25, "bio" = 30, "rad" = 20, "fire" = 60, "acid" = 0)

/obj/item/clothing/head/beret/ncr_dresscap
	name = "NCR peaked cap"
	desc = "(II) A tan peaked cap with silver pin, designated for enlisted NCRA personnel."
	icon_state = "ncr_dresscap"
	item_state = "ncr_dresscap"
	armor = list("tier" = 2, "energy" = 20, "bomb" = 25, "bio" = 30, "rad" = 20, "fire" = 60, "acid" = 0)

/obj/item/clothing/head/beret/ncr_codresscap
	name = "NCR peaked cap"
	desc = "(II) A tan peaked cap with golden pin, designated for commissioned NCRA personnel."
	icon_state = "ncr_codresscap"
	item_state = "ncr_codresscap"
	armor = list("tier" = 2, "energy" = 20, "bomb" = 25, "bio" = 30, "rad" = 20, "fire" = 60, "acid" = 0)

/obj/item/clothing/head/beret/ncr_recon
	name = "NCR first recon beret"
	desc = "(IV) A red beret, issued to members of the NCR 1st Reconnaissance Battalion often shortened to First Recon."
	icon_state = "reconberet"
	armor = list("tier" = 4, "energy" = 20, "bomb" = 25, "bio" = 30, "rad" = 20, "fire" = 60, "acid" = 0)

/obj/item/clothing/head/beret/ncr_scout
	name = "NCR third scout beret"
	desc = "(IV) A brown beret, issued to members of the NCR 1st Reconnaissance Battalion, 3rd Scout Regiment."
	icon_state = "scoutberet"
	armor = list("tier" = 4, "energy" = 20, "bomb" = 25, "bio" = 30, "rad" = 20, "fire" = 60, "acid" = 0)

/obj/item/clothing/head/f13/ncr_flapcap
	name = "NCR field cap"
	desc = "(IV) A special issue canvas NCR field cap with cotton neckflap, for sun protection in arid climates."
	icon_state = "ncr_flapcap"
	item_state = "ncr_flapcap"
	armor = list("tier" = 4, "energy" = 20, "bomb" = 25, "bio" = 30, "rad" = 20, "fire" = 60, "acid" = 0)

/obj/item/clothing/head/f13/ncr_slouch
	name = "NCR slouch hat"
	desc = "(IV) An irregular issue NCR sun hat, the left side of the brim is pinned to the crown for ease with shouldering rifles."
	icon_state = "ncr_slouch"
	armor = list("tier" = 4, "energy" = 20, "bomb" = 25, "bio" = 30, "rad" = 20, "fire" = 60, "acid" = 0)

//Unused or too meme

/obj/item/clothing/head/f13/ncr_stetson
	name = "NCR air cavalry stetson"
	desc = "(VI) A black brahmin leather stetson, authorized for usage amongst all troopers assigned to Air Cavalry units."
	icon_state = "ncr_stetson"
	armor = list("tier" = 6, "energy" = 20, "bomb" = 25, "bio" = 30, "rad" = 20, "fire" = 60, "acid" = 0)

/obj/item/clothing/head/beret/ncr_sof
	name = "NCR SOF beret"
	desc = "(VII) A tan beret, issued members of the New California Republic Special Operations Command."
	icon_state = "ncr_sof_beret"
	armor = list("tier" = 7, "energy" = 20, "bomb" = 25, "bio" = 30, "rad" = 20, "fire" = 60, "acid" = 0)

//Armour

//PVT PFC - Recruit / Trooper
/obj/item/clothing/suit/armor/f13/ncrarmor
	name = "NCR patrol vest"
	desc = "(IV) A standard issue NCR Infantry vest."
	icon_state = "ncr_infantry_vest"
	item_state = "ncr_infantry_vest"
	body_parts_covered = CHEST|GROIN|ARMS|LEGS
	armor = list("tier" = 4, "energy" = 20, "bomb" = 25, "bio" = 30, "rad" = 20, "fire" = 60, "acid" = 0)

//SPC - Combat Medic / Combat Engineer
/obj/item/clothing/suit/armor/f13/ncrarmor/reinforced
	name = "NCR reinforced patrol vest"
	desc = "(IV) A standard issue NCR Infantry vest reinforced with a groinpad."
	icon_state = "ncr_reinforced_vest"
	item_state = "ncr_reinforced_vest"
	armor = list("tier" = 4, "energy" = 20, "bomb" = 25, "bio" = 30, "rad" = 20, "fire" = 60, "acid" = 0)

//CPL - Corporal
/obj/item/clothing/suit/armor/f13/ncrarmor/mantle
	name = "NCR mantle vest"
	desc = "(IV) A standard issue NCR Infantry vest with a mantle on the shoulder."
	icon_state = "ncr_standard_mantle"
	item_state = "ncr_standard_mantle"
	armor = list("tier" = 4, "energy" = 20, "bomb" = 25, "bio" = 30, "rad" = 20, "fire" = 60, "acid" = 0)

//SGT/SFC - Sergeant / Sergeant First Class
/obj/item/clothing/suit/armor/f13/ncrarmor/mantle/reinforced
	name = "NCR reinforced mantle vest"
	desc = "(V) A standard issue NCR Infantry vest reinforced with a groinpad and a mantle."
	icon_state = "ncr_reinforced_mantle"
	item_state = "ncr_reinforced_mantle"
	armor = list("tier" = 5, "energy" = 20, "bomb" = 30, "bio" = 30, "rad" = 20, "fire" = 60, "acid" = 0)

//2nd LT - Medical Officer
/obj/item/clothing/suit/armor/f13/ncrarmor/labcoat
	name = "NCR medical labcoat"
	desc = "(IV) An armored labcoat typically issued to NCR Medical Officers. It's a standard white labcoat with the Medical Officer's name stitched into the breast and a two headed bear sewn into the shoulder."
	icon_state = "ncr_labcoat"
	item_state = "ncr_labcoat"
	armor = list("tier" = 4, "energy" = 20, "bomb" = 25, "bio" = 30, "rad" = 20, "fire" = 60, "acid" = 0)
	allowed = list(/obj/item/gun, /obj/item/analyzer, /obj/item/stack/medical, /obj/item/dnainjector, /obj/item/reagent_containers/dropper, /obj/item/reagent_containers/syringe, /obj/item/reagent_containers/hypospray, /obj/item/healthanalyzer, /obj/item/flashlight/pen, /obj/item/reagent_containers/glass/bottle, /obj/item/reagent_containers/glass/beaker, /obj/item/reagent_containers/pill, /obj/item/storage/pill_bottle, /obj/item/paper, /obj/item/melee/classic_baton/telescopic, /obj/item/soap, /obj/item/sensor_device, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman)

//1st LT/CPT - Commanding Officer
/obj/item/clothing/suit/armor/f13/ncrarmor/lieutenant
	name = "NCR officer vest"
	desc = "(VI) A reinforced set of NCR mantle armour, with added padding on the groin, neck and shoulders. Intended for use by the officer class."
	icon_state = "ncr_lt_armour"
	item_state = "ncr_lt_armour"
	armor = list("tier" = 6, "energy" = 20, "bomb" = 50, "bio" = 30, "rad" = 20, "fire" = 60, "acid" = 0)

/obj/item/clothing/suit/armor/f13/combat/ncr
	name = "NCR combat armor"
	desc = "(V) An old military grade pre war combat armor repainted to the colour scheme of the New California Republic."
	icon_state = "ncr_armor"
	item_state = "ncr_armor"

/obj/item/clothing/suit/armor/f13/combat/mk2/ncr
	name = "reinforced NCR combat armor"
	desc = "(VI) A reinforced set of bracers and torso plating of prewar design. This one is kitted with additional plates and, repainted to the colour scheme of the New California Republic."
	icon_state = "ncr_armor_mk2"
	item_state = "ncr_armor_mk2"

/obj/item/clothing/suit/armor/f13/ncrarmor/ncr_dressjack
	name = "NCR dress jacket"
	desc = "(II) A brown dress uniform jacket intended for enlisted NCRA personnel."
	icon_state = "ncr_dressjack"
	item_state = "ncr_dressjack"
	armor = list("tier" = 2, "energy" = 20, "bomb" = 25, "bio" = 30, "rad" = 20, "fire" = 60, "acid" = 0)

/obj/item/clothing/suit/armor/f13/ncrarmor/ncr_codressjack
	name = "NCR dress jacket"
	desc = "(II) A brown dress uniform jacket for commissioned NCRA personnel."
	icon_state = "ncr_codressjack"
	item_state = "ncr_codressjack"
	armor = list("tier" = 2, "energy" = 20, "bomb" = 25, "bio" = 30, "rad" = 20, "fire" = 60, "acid" = 0)

/obj/item/clothing/suit/armor/f13/combat/ncr/mutie
	name = "NCR mutant armor"
	desc = "(V) Multiple sets of NCR patrol vests that have been fused, stitched and welded together in order to fit the frame of a Super Mutant."
	icon_state = "mutie_ncr"
	item_state = "mutie_ncr"

//Not used
/obj/item/clothing/suit/armor/f13/ncrarmor/captain
	name = "NCR reinforced officer vest"
	desc = "(VII) A heavily reinforced set of NCR mantle armour, the armor has been heavily patched and given ceramic inserts in vital areas to protect the wearer. The design indicates it belongs to a high ranking NCR officer."
	icon_state = "ncr_captain_armour"
	item_state = "ncr_captain_armour"
	armor = list("tier" = 7, "energy" = 20, "bomb" = 50, "bio" = 30, "rad" = 20, "fire" = 60, "acid" = 0)

//Boots

/obj/item/clothing/shoes/f13/military/ncr
	name = "patrol boots"
	desc = "A pair of standard issue brown boots, with a puttee."
	icon_state = "ncr_boots"
	item_state = "ncr"

/obj/item/clothing/shoes/f13/mutie/boots/ncr
	icon_state = "mutie_boots_ncr"
	icon_state = "mutie_boots_ncr"

//Uniform/ Undersuits

/obj/item/clothing/under/f13/ncr
	name = "NCR desert fatigues"
	desc = "A set of standard issue New California Republic trooper fatigues."
	icon_state = "ncr_uniform"
	can_adjust = TRUE
	item_state = "ncr_uniform"
	item_color = "ncr_uniform"
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 30, "fire" = 20, "acid" = 50)

/obj/item/clothing/under/f13/ncr/ncr_officer
	name = "NCR officer fatigues"
	desc = "A standard service uniform for commissioned officers of the New California Republic."
	can_adjust = TRUE
	icon_state = "ncr_officer"
	item_state = "ncr_officer"
	item_color = "ncr_officer"

/obj/item/clothing/under/f13/ncr/pants
	name = "NCR fatigue pants"
	desc = "A set of standard issue fatigue pants without the upper overcoat. For when you really need to show off your guns."
	can_adjust = FALSE
	icon_state = "ncr_fatigue_pants"
	item_state = "ncr_fatigue_pants"
	item_color = "ncr_fatigue_pants"

/obj/item/clothing/under/f13/ncr/ncr_shorts
	name = "NCR fatigue shorts"
	desc = "A set of uniform shorts and lightweight shirt for NCR troopers deployed in hot climates."
	can_adjust = TRUE
	icon_state = "ncr_shorts"
	item_state = "ncr_shorts"
	item_color = "ncr_shorts"

//Sprite by Pisshole
/obj/item/clothing/under/f13/ncr_sniper
	name = "NCR sniper fatigues"
	desc = "A set of fatigues with padded compression sleeves for long periods of getting on your hands and knees. The top is a little open to beat the heat. Warning: The NCR does not condone the use of Steady chems."
	can_adjust = FALSE
	icon_state = "ncr_snipermgs"
	item_state = "ncr_snipermgs"
	item_color = "ncr_snipermgs"

/obj/item/clothing/under/f13/caravaneer
	name = "caravaneer outfit"
	desc = "A soft outfit used by NCR caravaneers."
	icon_state = "caravaneer"
	item_state = "caravaneer"
	item_color = "caravaneer"

/obj/item/clothing/under/f13/ncr/ncr_dress
	name = "NCR dress uniform"
	desc = "A crisp tan NCRA dress uniform, complete with tie."
	can_adjust = TRUE
	icon_state = "ncr_dress"
	item_state = "ncr_dress"
	item_color = "ncr_dress"

/obj/item/clothing/under/f13/ncrcf
	name = "caravaneer outfit"
	desc = "A cheap blue shirt and slacks, the letters 'NCRCF' emblazened on the back. A meek reminder of who owns you."
	can_adjust = TRUE
	icon_state = "ncrcf"
	item_state = "ncrcf"
	item_color = "ncrcf"

/obj/item/clothing/under/f13/ncr/ncr_dress/skirt
	name = "NCR skirt"
	desc = "A crisp tan NCRA dress miniskirt uniform, complete with tie."
	can_adjust = FALSE
	icon_state = "ncr_skirt"
	item_state = "ncr_skirt"
	item_color = "ncr_skirt"

/obj/item/clothing/under/f13/ncr/shi
	name = "NCR shi fatigues"
	desc = "A pair of tan capri pants tied together with a chinese blue shirt."
	can_adjust = FALSE
	icon_state = "shi"
	item_state = "shi"
	item_color = "shi"

/obj/item/clothing/under/f13/ncr/recon
	name = "NCR recon fatigues"
	desc = "A standard duty uniform for the first recon under the New California Republic."
	icon_state = "reconclothes"
	item_state = "reconclothes"
	item_color = "reconclothes"

/obj/item/clothing/under/f13/ncr/scout
	name = "NCR scout fatigues"
	desc = "A standard duty uniform for scouts of the New California Republic."
	icon_state = "scoutclothes"
	item_state = "scoutclothes"
	item_color = "scoutclothes"

//Rangers
//Hats and Helmets

//Custom item - PurplePineapple / Piper Rivera / Appropriated for this
/obj/item/clothing/head/hooded/cloakhood/f13/hooded_recon
	name = "recon hood"
	icon_state = "reconhood"
	item_state = "reconhood"
	desc = "(V) A thicker than average leather hood, seamlessly stitched to the jacket you're wearing."
	armor = list("tier" = 5, "energy" = 20, "bomb" = 25, "bio" = 30, "rad" = 20, "fire" = 60, "acid" = 0)
	flags_inv = HIDEEARS|HIDEEYES|HIDEHAIR

/obj/item/clothing/head/f13/trailranger
	name = "NCR trail ranger hat"
	desc = "(IV) A rustic, homely style cowboy hat worn by NCR trail rangers. Yeehaw!"
	icon_state = "cowboyrang"
	item_state = "cowboyrang"
	armor = list("tier" = 4, "energy" = 30, "bomb" = 25, "bio" = 40, "rad" = 40, "fire" = 80, "acid" = 0)

/obj/item/clothing/head/f13/ranger
	name = "NCR ranger campaign hat"
	desc = "(VI) An NCR ranger hat, standard issue amongst all but the most elite rangers."
	icon_state = "drillhat"
	item_state = "drillhat"
	armor = list("tier" = 6, "energy" = 40, "bomb" = 25, "bio" = 40, "rad" = 40, "fire" = 80, "acid" = 0)
	always_reskinnable = TRUE
	unique_reskin = list(
						"New" = "drillhat",
						"Old-School" = "drillhat_alternative"
						)

/obj/item/clothing/head/helmet/f13/combat/ncr_patrol
	name = "NCR patrol helmet"
	desc = "(VI) A combat helmet hand-manufactured in the NCR and issued to patrol rangers."
	icon_state = "ncr_patrol_helmet"
	item_state = "ncr_patrol_helmet"
	flags_inv = HIDEEARS|HIDEHAIR
	flags_cover = null
	armor = list("tier" = 6, "energy" = 40, "bomb" = 25, "bio" = 40, "rad" = 40, "fire" = 80, "acid" = 0)

/obj/item/clothing/head/f13/ranger/sergeant
	name = "ranger sergeant combat helmet"
	desc = "(VI) An old combat helmet, out of use around the time of the war."
	icon_state = "recon_helmet"
	item_state = "recon_helmet"
	armor = list("tier" = 6, "energy" = 50, "bomb" = 39, "bio" = 60, "rad" = 60, "fire" = 90, "acid" = 0)
	actions_types = list(/datum/action/item_action/toggle)

/obj/item/clothing/head/f13/ranger/sergeant/attack_self(mob/user)
	weldingvisortoggle(user)
	icon_state = "recon_helmetup"
	item_state = "recon_helmetup"
	armor = list("tier" = 6, "energy" = 50, "bomb" = 39, "bio" = 60, "rad" = 60, "fire" = 90, "acid" = 0)

/obj/item/clothing/head/f13/ranger/montana/attack_self(mob/user)
	weldingvisortoggle(user)
	icon_state = "rangermontanaup"
	item_state = "rangermontanaup"
	armor = list("tier" = 6, "energy" = 50, "bomb" = 39, "bio" = 60, "rad" = 60, "fire" = 90, "acid" = 0)

/obj/item/clothing/head/helmet/f13/ncr/rangercombat
	name = "ranger combat helmet"
	desc = "(VII) An old combat helmet, out of use around the time of the war."
	icon_state = "ranger"
	item_state = "ranger"
	armor = list("tier" = 7, "energy" = 50, "bomb" = 39, "bio" = 60, "rad" = 60, "fire" = 90, "acid" = 0)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEHAIR|HIDEFACIALHAIR|HIDEFACE
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	resistance_flags = LAVA_PROOF | FIRE_PROOF
	dynamic_hair_suffix = ""
	dynamic_fhair_suffix = ""
	flash_protect = 1
	glass_colour_type = /datum/client_colour/glass_colour/red
	lighting_alpha = LIGHTING_PLANE_ALPHA_NV_TRAIT
	darkness_view = 24

/obj/item/clothing/head/helmet/f13/ncr/rangercombat/mutie
	name = "mutant ranger combat helmet"
	icon_state = "mutie_vet_ranger"
	item_state = "mutie_vet_ranger"


//Armours

//Custom item - PurplePineapple / Piper Rivera / Appropriated for this
/obj/item/clothing/suit/hooded/f13/hooded_recon
	name = "hooded ranger jacket"
	desc = "(V) A thicker than average duster worn by NCR recon rangers out in the field. This particular duster has been modified heavily with striped down riot gear and homemade kneepads. A leather hood has been stitched in place of the original collar."
	icon_state = "hooded_recon"
	item_state = "hooded_recon"
	armor = list("tier" = 5, "energy" = 20, "bomb" = 25, "bio" = 30, "rad" = 20, "fire" = 60, "acid" = 0)
	slowdown = -0.1
	hoodtype = /obj/item/clothing/head/hooded/cloakhood/f13/hooded_recon
	heat_protection = CHEST|GROIN|LEGS|ARMS|HANDS //Since this uses the hooded object, needs to be set to match armor/f13
	body_parts_covered = CHEST|GROIN|LEGS|ARMS|HANDS

/obj/item/clothing/suit/armor/f13/trailranger
	name = "ranger vest"
	desc = "(IV) A quaint little jacket and scarf worn by NCR trail rangers."
	icon_state = "cowboyrang"
	item_state = "cowboyrang"
	armor = list("tier" = 4, "energy" = 20, "bomb" = 25, "bio" = 30, "rad" = 20, "fire" = 60, "acid" = 0)
	slowdown = -0.2

/obj/item/clothing/suit/armor/f13/combat/ncr_patrol
	name = "ranger patrol armor"
	desc = "(VI) A set of standard issue ranger patrol armor that provides defense similar to a suit of pre-war combat armor. It's got NCR markings, making it clear who it was made by."
	icon_state = "ncr_patrol"
	item_state = "ncr_patrol"
	armor = list("tier" = 6, "energy" = 45, "bomb" = 55, "bio" = 60, "rad" = 15, "fire" = 60, "acid" = 30)
	always_reskinnable = TRUE
	unique_reskin = list(
						"New" = "ncr_patrol",
						"Old-School" = "ncr_patrol_alternative"
						)

/obj/item/clothing/suit/armor/f13/rangercombat/sergeant
	name = "sergeant ranger combat armor"
	desc = "(VI) The NCR veteran ranger combat armor, or black armor consists of a pre-war L.A.P.D. riot suit under a duster with rodeo jeans. Considered one of the most prestigious suits of armor to earn and wear while in service of the NCR Rangers."
	icon_state = "rangersergeant"
	armor = list("tier" = 6, "energy" = 40, "bomb" = 55, "bio" = 60, "rad" = 60, "fire" = 90, "acid" = 20)

/obj/item/clothing/suit/armor/f13/rangercombat
	name = "veteran ranger combat armor"
	desc = "(VII) The NCR veteran ranger combat armor, or black armor consists of a pre-war L.A.P.D. riot suit under a duster with rodeo jeans. Considered one of the most prestigious suits of armor to earn and wear while in service of the NCR Rangers."
	icon_state = "ranger"
	item_state = "ranger"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS
	armor = list("tier" = 7, "energy" = 40, "bomb" = 55, "bio" = 60, "rad" = 60, "fire" = 90, "acid" = 20)
	slowdown = -0.1

/obj/item/clothing/suit/armor/f13/combat/ncr_patrol/mutie
	name = "mutant ranger armor"
	desc = "(V) A set of standard issue ranger patrol armor that provides defense similar to a suit of pre-war combat armor, only redesigned to fit a super mutant."
	icon_state = "mutie_ranger_armour"
	item_state = "mutie_ranger_armour"

/obj/item/clothing/suit/armor/f13/rangercombat/mutie
	name = "mutant ranger combat armor"
	icon_state = "mutie_vet_ranger"
	item_state = "mutie_vet_ranger"

/obj/item/clothing/suit/armor/f13/ncrcfjacket
	name = "NCRCF jacket"
	icon_state = "ncrcfjacket"
	item_state = "ncrcfjacket"
	desc = "(I) A cheap, standard issue teal canvas jacket issued to poor suckers who find themselves at the butt-end of the NCR's judiciary system."
	armor = list("tier" = 1, "energy" = 0, "bomb" = 15, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

//Uniforms and Undersuits

/obj/item/clothing/under/f13/ranger
	name = "NCR ranger outfit"
	desc = "Simple rustic clothes for a big iron packin' lawman. Worn often by NCR rangers."
	icon_state = "ranger"
	item_state = "ranger"
	item_color = "ranger"
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 30, "fire" = 20, "acid" = 50)
	always_reskinnable = TRUE
	unique_reskin = list(
						"Recon" = "ranger",
						"Trail" = "trailranger",
						"Patrol" = "patrolranger"
						)

/obj/item/clothing/under/f13/ranger/vet
	name = "NCR ranger flannel outfit"
	desc = "Simple rustic clothes for a big iron packin' lawman. Worn often by NCR rangers."
	icon_state = "vetranger"
	item_state = "vetranger"
	item_color = "vetranger"
	always_reskinnable = TRUE
	unique_reskin = list(
						"Red" = "vetranger",
						"Black" = "foxflannel",
						"Lighter" = "thaxflannel"
						)

//Gasmasks

/obj/item/clothing/mask/gas/ranger
	name = "ranger gas mask"
	desc = "A close-fitting tactical mask issued to all NCR Rangers."
	icon_state = "rangermask"
	item_state = "rangermask"
	flags_inv = HIDEFACIALHAIR|HIDEFACE|HIDEEYES|HIDEEARS|HIDEHAIR
	visor_flags_inv = 0

//Boots

/obj/item/clothing/shoes/f13/military/leather/patrol
	name = "patrol ranger leather combat boots"
	desc = "A pair of hardened leather boots made for combat, in use by the NCR Patrol Rangers."
	icon_state = "patrol"
	item_state = "patrol"

/obj/item/clothing/shoes/f13/mutie/boots/ncr/ranger
	icon_state = "mutie_boots_ranger"
	icon_state = "mutie_boots_ranger"
