//Custom item - Rebel0 / Mariya Sankinova
/obj/item/clothing/suit/armor/f13/power_armor/t45d/mari
	name = "modified midwestern power armor"
	desc = "(VIII) This set of power armor once belonged to the Midwestrn branch of the Brotherhood. Though now it appears to be modified and sporting a new paintjob, the words 'Fighting Girlfriend' painted onto its right shoulder alongside its new chapter colors."
	icon_state = "mariarmor"
	item_state = "mariarmor"

/obj/item/clothing/suit/armor/f13/power_armor/t45d/mari/update_icon_state()
	icon_state = "marihelm[on]"
	item_state = "marihelm[on]"

//Custom item - svenja / John Thaxton
/obj/item/clothing/suit/armor/f13/combat/ncr_patrol/thax
	name = "modified patrol armor"
	desc = "A customized and moderately-worn suit of patrol ranger armor. A sun-worn thick olive duster is worn over the armor."
	icon_state = "thaxarmor"
	item_state = "thaxarmor"

//Custom item - PurplePineapple / Piper Rivera
/obj/item/clothing/suit/hooded/f13/hooded_recon
	name = "hooded ranger jacket"
	desc = "(IV) A thicker than average duster worn by NCR recon rangers out in the field. This particular duster has been modified heavily with striped down riot gear and homemade kneepads. A leather hood has been stitched in place of the original collar."
	icon_state = "hooded_recon"
	item_state = "hooded_recon"
	armor = list("tier" = 4, "energy" = 20, "bomb" = 25, "bio" = 30, "rad" = 20, "fire" = 60, "acid" = 0)
	slowdown = -0.1
	hoodtype = /obj/item/clothing/head/hooded/cloakhood/f13/hooded_recon
	heat_protection = CHEST|GROIN|LEGS|ARMS|HANDS //Since this uses the hooded object, needs to be set to match armor/f13
	body_parts_covered = CHEST|GROIN|LEGS|ARMS|HANDS

//Custom items - Pisshole / Valentina Vega
/obj/item/clothing/suit/armor/f13/tina_jacket
	name = "trail coat"
	desc = "A dark red ranger's trenchcoat, replete with a belt and a trail ranger scarf dyed the color of harebells. It smells a little like flowers, lemon juice and gunpowder."
	icon_state = "tina_jacket"
	item_state = "tina_jacket"
	armor = list("tier" = 4, "energy" = 20, "bomb" = 25, "bio" = 30, "rad" = 20, "fire" = 60, "acid" = 0)
	slowdown = -0.2


