/obj/item/modkit
	name = "modkit"
	desc = "A small container of parts made to modify a specific item. Use the target item on this kit to convert it."
	icon = 'icons/obj/items_and_weapons.dmi'
	icon_state = "modkit"
	w_class = WEIGHT_CLASS_NORMAL
	var/list/target_items = list()
	var/result_item = null

/obj/item/modkit/pre_attack(obj/item/I, mob/user)
	if(is_type_in_list(I, target_items))
		var/obj/item/R = new result_item(get_turf(user))
		to_chat(user, SPAN_NOTICE("You apply the [src] to [I], using the custom parts to turn it into [R]."))
		remove_item_from_storage(I)
		qdel(I)
		user.put_in_hands(R)
		qdel(src)
		return TRUE
	else
		return ..()

/obj/item/modkit/riotgear
	name = "desert ranger riot gear modkit"
	target_items = list(/obj/item/clothing/suit/armor/f13/rangercombat)
	result_item = /obj/item/clothing/suit/armor/f13/rangercombat/desert

/obj/item/modkit/riotgear_helmet
	name = "desert ranger riot helmet modkit"
	target_items = list(/obj/item/clothing/head/helmet/f13/ncr/rangercombat)
	result_item = /obj/item/clothing/head/helmet/f13/ncr/rangercombat/desert

/obj/item/modkit/riotgear/fox
	name = "sniper riot gear modkit"
	result_item = /obj/item/clothing/suit/armor/f13/rangercombat/foxcustom

/obj/item/modkit/riotgear_helmet/fox
	name = "reclaimed ranger-hunter combat helmet modkit"
	result_item = /obj/item/clothing/head/helmet/f13/ncr/rangercombat/foxcustom

/obj/item/modkit/riotgear/rigs
	name = "11th armored calvary armor modkit"
	result_item = /obj/item/clothing/suit/armor/f13/rangercombat/rigscustom

/obj/item/modkit/riotgear_helmet/rigs
	name = "11th armored calvary helmet modkit"
	result_item = /obj/item/clothing/head/helmet/f13/ncr/rangercombat/rigscustom

/obj/item/modkit/riotgear/price
	name = "spider riot gear modkit"
	result_item = /obj/item/clothing/suit/armor/f13/rangercombat/pricecustom

/obj/item/modkit/riotgear_helmet/price
	name = "spider riot helmet modkit"
	result_item = /obj/item/clothing/head/helmet/f13/ncr/rangercombat/pricecustom

/obj/item/modkit/thax_patrol
	name = "modified patrol armor modkit"
	target_items = list(/obj/item/clothing/suit/armor/f13/combat/ncr_patrol)
	result_item = /obj/item/clothing/suit/armor/f13/combat/ncr_patrol/thax

/obj/item/modkit/shank
	name = "follower's duster modkit"
	target_items = list(/obj/item/clothing/suit/armor/f13/raider)
	result_item = /obj/item/clothing/suit/armor/f13/shankduster

/obj/item/modkit/custom_excess
	name = "Champion of Kanab's Armor modkit"
	target_items = list(/obj/item/clothing/suit/armor/f13/legion/palacent)
	result_item = /obj/item/clothing/suit/armor/f13/legion/palacent/custom_excess

/obj/item/modkit/custom_excess_helmet
	name = "Champion of Kanab's Helm modkit"
	target_items = list(/obj/item/clothing/head/helmet/f13/legion/palacent)
	result_item = /obj/item/clothing/head/helmet/f13/legion/palacent/custom_excess

/obj/item/modkit/piper_hat
	name = "gambler's hat modkit"
	target_items = list(/obj/item/clothing/head/f13/trailranger)
	result_item = /obj/item/clothing/head/f13/flatranger

/obj/item/modkit/piper_vest
	name = "armoured poncho modkit"
	target_items = list(/obj/item/clothing/suit/armor/f13/trailranger)
	result_item = /obj/item/clothing/suit/toggle/armor/f13/cloakranger

/obj/item/modkit/digger_helm
	name = "salvaged riot armor modkit"
	target_items = list(/obj/item/clothing/suit/armor/f13/raider)
	result_item = /obj/item/clothing/suit/armor/f13/herbertranger

/obj/item/modkit/wormsuit
	name = "badland bolero modkit"
	target_items = list(/obj/item/clothing/suit/armor/f13/raider)
	result_item = /obj/item/clothing/suit/armor/f13/raider/wormjacket

/obj/item/modkit/wormhat
	name = "brahmin slouch hat modkit"
	target_items = list(/obj/item/clothing/head/helmet/f13/raider)
	result_item = /obj/item/clothing/head/helmet/f13/raider/wormhat

/obj/item/modkit/wormuniform
	name = "old fashioned suit modkit"
	target_items = list(/obj/item/clothing/under/f13/caravan)
	result_item = /obj/item/clothing/under/f13/wormsuit

/obj/item/modkit/digger_vest
	name = "salvaged riot helmet modkit"
	target_items = list(/obj/item/clothing/head/helmet/f13/raider)
	result_item = /obj/item/clothing/head/helmet/f13/herbertranger

/obj/item/modkit/diohelmet
	name = "galerum lacertarex"
	target_items = list(/obj/item/clothing/head/helmet/f13/legion/venator)
	result_item = /obj/item/clothing/head/helmet/f13/legion/venator/diohelmet

/obj/item/modkit/trenchcoatfollowers
	name = "followers trenchcoat modkit"
	target_items = list(/obj/item/clothing/suit/armor/vest)
	result_item = /obj/item/clothing/suit/armor/vest/trench

/obj/item/modkit/patrolduster
	name = "Patrol Duster modkit"
	target_items = list(/obj/item/clothing/suit/armor/f13/raider)
	result_item = /obj/item/clothing/suit/armor/f13/raider/combatduster/patrolduster

/obj/item/modkit/wolfvest
	name = "subdued ranger vest modkit"
	target_items = list(/obj/item/clothing/suit/armor/f13/combat/ncr_patrol)
	result_item = /obj/item/clothing/suit/armor/f13/modif_r_vest

/obj/item/modkit/erinarmor
	name = "chest gear harness modkit"
	target_items = list(/obj/item/clothing/suit/hooded/f13/hooded_recon)
	result_item = /obj/item/clothing/suit/armor/f13/rangerrig

/obj/item/modkit/kainatarmor
	name = "ranger scout armor modkit"
	target_items = list(/obj/item/clothing/suit/armor/f13/combat/ncr_patrol)
	result_item = /obj/item/clothing/suit/armor/f13/combat/ncr_patrol/scout

/obj/item/modkit/birdarmor
	name = "Salvaged claw cloak modkit"
	target_items = list(/obj/item/clothing/suit/hooded/cloak/goliath)
	result_item = /obj/item/clothing/suit/hooded/cloak/birdarmor

/obj/item/modkit/feuferarmor
	name = "T-51b Reforged WBoS Body modkit"
	target_items = list(/obj/item/clothing/suit/armor/f13/power_armor/t51b)
	result_item = /obj/item/clothing/suit/armor/f13/power_armor/t51b/reforgedwbos

/obj/item/modkit/feuferhelmet
	name = "T-51b Reforged WBoS Helmet modkit"
	target_items = list(/obj/item/clothing/head/helmet/f13/power_armor/t51b)
	result_item = /obj/item/clothing/head/helmet/f13/power_armor/t51b/reforgedwbos

/obj/item/modkit/marlowhat
	name = "Marlow Hat modkit"
	target_items = list(/obj/item/clothing/head/helmet/f13/raider)
	result_item = /obj/item/clothing/head/helmet/f13/marlowhat

/obj/item/modkit/marlowsuit_ike
	name = "Gunfighters Overcoat modkit"
	target_items = list(/obj/item/clothing/suit/armor/f13/raider)
	result_item = /obj/item/clothing/suit/armor/f13/marlowsuit/ikesuit

/obj/item/modkit/marlowsuit_mason
	name = "Vagabond Vest modkit"
	target_items = list(/obj/item/clothing/suit/armor/f13/raider)
	result_item = /obj/item/clothing/suit/armor/f13/marlowsuit/masonsuit

/obj/item/modkit/marlowsuit
	name = "Marlow Overcoat modkit"
	target_items = list(/obj/item/clothing/suit/armor/f13/raider)
	result_item = /obj/item/clothing/suit/armor/f13/marlowsuit

/obj/item/modkit/officercoat
	name = "NCR Officer Coat modkit"
	target_items = list(/obj/item/clothing/suit/armor/f13/ncrarmor/lieutenant)
	result_item = /obj/item/clothing/suit/armor/f13/ncrarmor/lieutenant/ncr_officer_coat

/obj/item/modkit/modkhancombat
	name = "Modified Khan Combat Armour modkit"
	target_items = list(/obj/item/clothing/suit/toggle/labcoat/f13/khan_jacket)
	result_item = /obj/item/clothing/suit/toggle/labcoat/f13/chinese_khan

/obj/item/modkit/modkhanjumpsuit
	name = "Modified Khan Jumpsuit modkit"
	target_items = list(/obj/item/clothing/under/f13/khan)
	result_item = /obj/item/clothing/under/f13/chinese_khan

/obj/item/modkit/luger
	name = "P08 luger modkit"
	target_items = list(/obj/item/gun/ballistic/automatic/pistol/ninemil)
	result_item = /obj/item/gun/ballistic/automatic/pistol/ninemil/luger

/obj/item/modkit/talon
	name = "Talon armor modkit"
	target_items = list(/obj/item/clothing/suit/armor/f13/raider)
	result_item = /obj/item/clothing/suit/armor/f13/talon

/obj/item/modkit/talon/duster
	name = "Talon duster modkit"
	result_item = /obj/item/clothing/suit/armor/f13/talon/duster

/obj/item/modkit/markedmen
	name = "Marked patrol modkit"
	target_items = list(/obj/item/clothing/suit/armor/f13/raider)
	result_item = /obj/item/clothing/suit/armor/f13/marked_patrol

/obj/item/modkit/ncr_trenchcloak
	name = "Ranger trenchcloak modkit"
	target_items = list(/obj/item/clothing/suit/hooded/f13/hooded_recon)
	result_item = /obj/item/clothing/suit/armor/f13/ncr_trenchcloak

/obj/item/modkit/rangerjacket
	name = "Ranger jacket modkit"
	target_items = list(/obj/item/clothing/suit/hooded/f13/hooded_recon)
	result_item = /obj/item/clothing/suit/armor/f13/rangerrecon_jacket

/obj/item/modkit/ursuslegion
	name = "Ursus Homicida modkit"
	target_items = list(/obj/item/clothing/suit/armor/f13/legion/venator)
	result_item = /obj/item/clothing/suit/armor/f13/legion/venator/ursus

/obj/item/modkit/harebellscout
	name = "Harebell scout beret modkit"
	target_items = list(/obj/item/clothing/head/beret/ncr_scout)
	result_item = /obj/item/clothing/head/beret/tina_beret

/obj/item/modkit/trailcoat
	name = "Trail coat modkit"
	target_items = list(/obj/item/clothing/suit/armor/f13/trailranger)
	result_item = /obj/item/clothing/suit/armor/f13/tina_jacket

/obj/item/modkit/hoodedrecon
	name = "Hooded recon modkit"
	target_items = list(/obj/item/clothing/suit/armor/f13/rangercombat/sergeant)
	result_item = /obj/item/clothing/suit/hooded/f13/hooded_recon

/obj/item/modkit/lieutenantplatecarrier
	name = "Lieutenant platecarrier modkit"
	target_items = list(/obj/item/clothing/suit/armor/f13/ncrarmor/lieutenant)
	result_item = /obj/item/clothing/suit/armor/f13/ncrarmor/lieutenant/ltcarrier

/obj/item/modkit/mariarmor
	name = "Modified Wid-west BoS Body modkit"
	target_items = list(/obj/item/clothing/suit/armor/f13/power_armor/t45d,
						/obj/item/clothing/suit/armor/f13/power_armor/t51b)
	result_item = /obj/item/clothing/suit/armor/f13/power_armor/t45d/mari

/obj/item/modkit/marihelmet
	name = "Modified Wid-west BOS Helmet modkit"
	target_items = list(/obj/item/clothing/head/helmet/f13/power_armor/t45d,
						/obj/item/clothing/head/helmet/f13/power_armor/t51b)
	result_item = /obj/item/clothing/head/helmet/f13/power_armor/t45d/mari

/obj/item/modkit/riotgear/mutievet
	name = "Mutant Veteran Ranger Armour modkit"
	result_item = /obj/item/clothing/suit/armor/f13/rangercombat/mutie

/obj/item/modkit/riotgear_helmet/mutievet
	name = "Mutant Veteran Ranger Helmet modkit"
	result_item = /obj/item/clothing/head/helmet/f13/ncr/rangercombat/mutie

/obj/item/modkit/legionvetpalhunter
	name = "Veteran Paladin Hunter Modkit"
	target_items = list(/obj/item/clothing/suit/armor/f13/legion/vet)
	result_item = /obj/item/clothing/suit/armor/f13/legion/vet/pal

/obj/item/modkit/legionvetpalhunterhelm
	name = "Veteran Paladin Hunter Helmet Modkit"
	target_items = list(/obj/item/clothing/head/helmet/f13/legion/vet)
	result_item = /obj/item/clothing/head/helmet/f13/legion/vet/pal

/obj/item/modkit/houndmasterhelm
	name = "Houndmaster Decon Modkit"
	target_items = list (/obj/item/clothing/head/helmet/f13/legion/recruit/decan, /obj/item/clothing/head/helmet/f13/legion/prime)
	result_item = /obj/item/clothing/head/helmet/f13/legion/recruit/decan/houndmaster

/obj/item/modkit/trailponcho
	name = "Trail Ranger Poncho Modkit"
	target_items = list(/obj/item/clothing/suit/armor/f13/trailranger)
	result_item = /obj/item/clothing/suit/armor/f13/trailranger/clyde

/obj/item/modkit/shicoat
	name = "Chinese Trenchcoat Modkit"
	target_items = list(/obj/item/clothing/suit/armor/f13/ncrarmor/mantle)
	result_item = /obj/item/clothing/suit/armor/f13/ncrarmor/mantle/shi

/obj/item/modkit/deth
	name = "Midwestern BOS Modkit"
	target_items = list(/obj/item/clothing/suit/armor/f13/power_armor/t45d,
						/obj/item/clothing/suit/armor/f13/power_armor/t51b)
	result_item = /obj/item/clothing/suit/armor/f13/power_armor/t45d/deth

/obj/item/modkit/dethelm
	name = "Midwestern BOS Helmet Modkit"
	target_items = list(/obj/item/clothing/head/helmet/f13/power_armor/t45d,
						/obj/item/clothing/head/helmet/f13/power_armor/t51b)
	result_item = /obj/item/clothing/head/helmet/f13/power_armor/t45d/deth

/obj/item/modkit/montanahelmet
	name = "Reclaimed Ranger Sergeant Helmet Modkit"
	target_items = list(/obj/item/clothing/head/f13/ranger/sergeant)
	result_item = /obj/item/clothing/head/f13/ranger/montana

/obj/item/modkit/montanascarf
	name = "Worn scout scarf modkit"
	target_items = list(/obj/item/clothing/mask/gas/sechailer)
	result_item = /obj/item/clothing/mask/gas/montana

/obj/item/modkit/kemblehat
	name = "Ranger slouch hat modkit"
	target_items = list(/obj/item/clothing/head/f13/ranger/sergeant)
	result_item = /obj/item/clothing/head/f13/ranger/sergeant/light_riot

/obj/item/modkit/kemblearmor
	name = "Light riot suit modkit"
	target_items = list(/obj/item/clothing/suit/armor/f13/rangercombat/sergeant)
	result_item = /obj/item/clothing/suit/armor/f13/rangercombat/sergeant/light_riot

//Crusader Pistol Modkits

/obj/item/modkit/crusader_10mm
	name = "crusader pistol 10mm conversion kit"
	target_items = list(/obj/item/gun/ballistic/automatic/pistol/crusader_rifle,
						/obj/item/gun/ballistic/automatic/pistol/crusader_rifle_ncr,
						/obj/item/gun/energy/laser/crusader,
						/obj/item/gun/energy/plasma/crusader
	)
	result_item = /obj/item/gun/ballistic/automatic/pistol/crusader_pistol

/obj/item/modkit/crusader_473
	name = "crusader pistol 4.73mm conversion kit"
	target_items = list(/obj/item/gun/ballistic/automatic/pistol/crusader_rifle_ncr,
						/obj/item/gun/ballistic/automatic/pistol/crusader_pistol,
						/obj/item/gun/energy/laser/crusader,
						/obj/item/gun/energy/plasma/crusader
	)
	result_item = /obj/item/gun/ballistic/automatic/pistol/crusader_rifle

/obj/item/modkit/crusader_556
	name = "crusader pistol 5.56mm conversion kit"
	target_items = list(/obj/item/gun/ballistic/automatic/pistol/crusader_rifle_ncr,
						/obj/item/gun/ballistic/automatic/pistol/crusader_rifle,
						/obj/item/gun/ballistic/automatic/pistol/crusader_pistol,
						/obj/item/gun/energy/laser/crusader,
						/obj/item/gun/energy/plasma/crusader
	)
	result_item = /obj/item/gun/ballistic/automatic/pistol/crusader_rifle_ncr

/obj/item/modkit/crusader_laser
	name = "crusader pistol laser conversion kit"
	target_items = list(/obj/item/gun/ballistic/automatic/pistol/crusader_rifle_ncr,
						/obj/item/gun/ballistic/automatic/pistol/crusader_pistol,
						/obj/item/gun/ballistic/automatic/pistol/crusader_rifle,
						/obj/item/gun/energy/plasma/crusader
	)
	result_item = /obj/item/gun/energy/laser/crusader

/obj/item/modkit/crusader_plasma
	name = "crusader pistol plasma conversion kit"
	target_items = list(/obj/item/gun/ballistic/automatic/pistol/crusader_rifle_ncr,
						/obj/item/gun/ballistic/automatic/pistol/crusader_rifle,
						/obj/item/gun/ballistic/automatic/pistol/crusader_pistol,
						/obj/item/gun/energy/laser/crusader,
						/obj/item/gun/ballistic/automatic/pistol/crusader_rifle
	)
	result_item = /obj/item/gun/energy/plasma/crusader

//Maxson Carbine

/obj/item/modkit/maxson
	name = "maxson carbine 5.56 conversion kit"
	target_items = list(/obj/item/gun/ballistic/automatic/service/maxson,
						/obj/item/gun/ballistic/automatic/service/maxson/c5mm
	)
	result_item = /obj/item/gun/ballistic/automatic/service/maxson

/obj/item/modkit/maxson_c5mm
	name = "maxson carbine 5mm conversion kit"
	target_items = list(/obj/item/gun/ballistic/automatic/service/maxson,
						/obj/item/gun/ballistic/automatic/service/maxson/c5mm
	)
	result_item = /obj/item/gun/ballistic/automatic/service/maxson/c5mm
