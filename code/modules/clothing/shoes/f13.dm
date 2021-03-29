//Fallout 13 shoes directory
/*
/obj/item/clothing/shoes
	var/stepsound = TRUE
*/
/obj/item/clothing/shoes/f13
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/shoes

/obj/item/clothing/shoes/f13/rag
	name = "footcloths"
	desc = "A footcloths made of ripped cloth.<br>It has soaked in smelly sweat, and it is rather repulsive.<br>Only the poorest of settlers, mostly the drug addicts or slaves wear something like that."
	icon_state = "rag"
	item_state = "rag"

/obj/item/clothing/shoes/f13/tan
	name = "tan shoes"
	desc = "A pair of tanned leather shoes."
	icon_state = "tan"
	item_state = "tan"

/obj/item/clothing/shoes/f13/brownie //Make a craft recipe, and delete this comment.
	name = "brown shoes"
	desc = "A pair of brown leather shoes made of wasteland animals hides."
	icon_state = "brownie"
	item_state = "brownie"

/obj/item/clothing/shoes/f13/fancy
	name = "black shoes"
	desc = "A pair of fancy black shoes." //Nice shoes!
	icon_state = "fancy"
	item_state = "fancy"

/obj/item/clothing/shoes/f13/cowboy
	name = "cowboy boots"
	desc = "A pair of cowhide boots with spurs.<br>They have a Cuban heel, rounded to pointed toe, high shaft, and, traditionally, no lacing."
	icon_state = "cowboy"
	item_state = "cowboy"

/obj/item/clothing/shoes/f13/explorer
	name = "worn boots"
	desc = "A pair of slightly worn, steel-toed work boots.<br>Good at keeping toes safe from falling junk you find amid the ruins."
	icon_state = "explorer"
	armor = list(melee = 10, bullet = 10, laser = 0, energy = 0, bomb = 10, bio = 0, rad = 0, fire = 10, acid = 0)

/obj/item/clothing/shoes/f13/raidertreads
	name = "raider treads"
	desc = "A decrepit boot on one foot, fuckall on the other, the height of raider fashion."
	icon_state = "raidertreads"
	item_state = "raidertreads"

/obj/item/clothing/shoes/f13/diesel
	name = "male diesel boots"
	desc = "Fancy mens' steel-toed boots."
	icon_state = "diesel_m"
	item_state = "diesel_m"
	armor = list(melee = 20, bullet = 10, laser = 10, energy = 10, bomb = 10, bio = 0, rad = 0, fire = 0, acid = 0)
	cold_protection = FEET
	min_cold_protection_temperature = SHOES_MIN_TEMP_PROTECT

/obj/item/clothing/shoes/f13/diesel/alt
	name = "female diesel boots"
	desc = "Fancy womens' knee-high platform boots with shiny steel clasps."
	icon_state = "diesel_f"
	item_state = "diesel_f"

/obj/item/clothing/shoes/f13/military
	name = "military boots"
	desc = "High speed, no-drag combat boots designed for use by the U.S. Army before the Great War."
	icon_state = "military"
	item_state = "military"
	permeability_coefficient = 0.05
	clothing_flags = NOSLIP
	armor = list(melee = 10, bullet = 10, laser = 0, energy = 0, bomb = 10, bio = 0, rad = 0, fire = 10, acid = 0)
	strip_delay = 40
	resistance_flags = NONE
	cold_protection = FEET
	min_cold_protection_temperature = SHOES_MIN_TEMP_PROTECT
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/shoes

/obj/item/clothing/shoes/f13/military/ncr
	name = "patrol boots"
	desc = "A pair of standard issue brown boots, with a puttee."
	icon_state = "ncr_boots"
	item_state = "ncr"

/obj/item/clothing/shoes/f13/military/plated
	name = "plated metal boots"
	desc = "A pair of leather boots that have been patched heavily and reinforced with light metal plates around the heel and ankles to protect the user."
	icon_state = "legionmetal"
	item_state = "legionmetal"
	armor = list(melee = 20, bullet = 20, laser = 10, energy = 10, bomb = 20, bio = 0, rad = 0, fire = 20, acid = 0)

/obj/item/clothing/shoes/f13/military/legate
	name = "heavy metal boots"
	desc = "A pair of heavy leather boots with overlapping steel plates affixed to the front, sides, and back of them, in size 14. These belong to a Legatus of Caesar's Legion."
	icon_state = "legionlegate"
	item_state = "legionlegate"
	armor = list(melee = 30, bullet = 30, laser = 20, energy = 20, bomb = 30, bio = 0, rad = 10, fire = 30, acid = 10)

/obj/item/clothing/shoes/f13/military/leather
	name = "leather combat boots"
	desc = "A pair of laced, heavy-duty leather boots designed for hard combat."
	icon_state = "laced"
	item_state = "laced"

//Fluff

/obj/item/clothing/shoes/f13/swimfins
	name = "swimming fins"
	desc = "You see, Ivan, when you wear fin in desert, they help you swim good if you find much water."
	icon_state = "flippers"
	item_state = "flippers"
	clothing_flags = NOSLIP

/obj/item/clothing/shoes/f13/moon
	name = "moon boots"
	desc = "These boots are constructed with a thin rubber exterior and cellular rubber midsole covered by colorful nylon fabrics and using polyurethane foams.<br>To the Moon!"
	icon_state = "moon"
	item_state = "moon"
	armor = list(melee = 40, bullet = 20, laser = 20, energy = 20, bomb = 20, bio = 10, rad = 50, fire = 0, acid = 0)
	cold_protection = FEET
	min_cold_protection_temperature = SHOES_MIN_TEMP_PROTECT
	heat_protection = FEET
	max_heat_protection_temperature = SHOES_MAX_TEMP_PROTECT
	clothing_flags = NOSLIP

/obj/item/clothing/shoes/f13/doom
	name = "mars boots"
	desc = "These boots are constructed with a titanium alloy. There are some runes engraved on the side.<br>To Mars!"
	icon_state = "mars"
	item_state = "mars"
	armor = list(melee = 40, bullet = 20, laser = 20, energy = 20, bomb = 20, bio = 80, rad = 80, fire = 80, acid = 50)
	cold_protection = FEET
	min_cold_protection_temperature = SHOES_MIN_TEMP_PROTECT
	heat_protection = FEET
	max_heat_protection_temperature = SHOES_MAX_TEMP_PROTECT
	clothing_flags = NOSLIP

/obj/item/clothing/shoes/f13/miner
	name = "mining boots"
	desc = "Heavy-duty work boots with steel-reinforced toes and some fluffy wool for extra warmth."
	icon_state = "miner"
	item_state = "miner"
	armor = list(melee = 20, bullet = 0, laser = 0, energy = 0, bomb = 20, bio = 0, rad = 0, fire = 0, acid = 0)
	cold_protection = FEET
	min_cold_protection_temperature = SHOES_MIN_TEMP_PROTECT

/obj/item/clothing/shoes/f13/jamrock
	name = "Green Snakeskin Shoes"
	desc = "They may have lost some of their lustre over the years, but these green crocodile leather shoes fit you perfectly."
	icon_state = "jamrock_skins"
	item_state = "jamrock_skins"
	armor = list(melee = 20, bullet = 0, laser = 0, energy = 0, bomb = 20, bio = 0, rad = 0, fire = 0, acid = 0)
	cold_protection = FEET
	min_cold_protection_temperature = SHOES_MIN_TEMP_PROTECT
