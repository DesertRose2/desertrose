//Custom item - Rebel0 / Mariya Sankinova
/obj/item/clothing/head/helmet/f13/power_armor/t45d/mari
	name = "modified midwestern power helmet"
	desc = "(VIII) This helmet once belonged to the Midwestern branch of the Brotherhood of Steel. Though it appears to sport a new paintjob now as well as a few modifications to its helmet; specified to fit the wearer."
	icon_state = "marihelm"
	item_state = "marihelm"

/obj/item/clothing/suit/armor/f13/power_armor/t45d/mari/update_icon_state()
	icon_state = "marihelm[on]"
	item_state = "marihelm[on]"

//Custom item - PurplePineapple / Piper Rivera
/obj/item/clothing/head/hooded/cloakhood/f13/hooded_recon
	name = "recon hood"
	icon_state = "reconhood"
	item_state = "reconhood"
	desc = "(V) A thicker than average leather hood, seamlessly stitched to the jacket you're wearing."
	armor = list("tier" = 5, "energy" = 20, "bomb" = 25, "bio" = 30, "rad" = 20, "fire" = 60, "acid" = 0)
	flags_inv = HIDEEARS|HIDEEYES|HIDEHAIR

//Custom items - Pisshole / Valentina Vega
/obj/item/clothing/head/beret/tina_beret
	name = "Harebell Scout Beret"
	desc = "(IV) A worn beret darkened by use, it appears to be the old symbol of Scout Corporals in the 1st Battalion, 3rd Infantry Regiment of the NCRA. The petals of a harebell appear to be threaded around the flash. Someone likes flowers."
	icon_state = "tina_beret"
	item_state = "tina_beret"
	armor = list("tier" = 4, "energy" = 30, "bomb" = 25, "bio" = 40, "rad" = 40, "fire" = 80, "acid" = 0)

