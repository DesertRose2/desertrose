//Fallout 13 decorative billboards directory

/obj/structure/billboard
	name = "billboard"
	desc = "Shitspawn detected!<br>Please report the admin abuse immediately!<br>Just kidding, nevermind."
	icon_state = "null"
	density = 1
	anchored = 1
	layer = 5
	icon = 'icons/obj/Ritas.dmi'
	resistance_flags = INDESTRUCTIBLE
/*
/obj/structure/billboard/New()
	..()

	var/go/S = new (locate(x+1,y,z))
	S.density = 1
	S.anchored = 1
	S.icon = null
	S.verbs.Cut()
*/
/obj/structure/billboard/ritas
	name = "Rita's Cafe billboard"
	desc = "A defaced pre-War ad for Rita's Cafe.<br>The wasteland has taken its toll on the board."
	icon_state = "ritas1"

/obj/structure/billboard/ritas/New()
	..()
	icon_state = pick("ritas2","ritas3","ritas4")

/obj/structure/billboard/ritas/pristine
	name = "pristine Rita's Cafe billboard"
	desc = "A pre-War ad for Rita's Cafe.<br>Oddly enough, it's good as new."
	icon_state = "ritas1"

/obj/structure/billboard/ritas/pristine/New()
	..()
	icon_state = "ritas1"

/obj/structure/billboard/cola
	name = "Nuka-Cola billboard"
	desc = "A defaced pre-War ad for Nuka-Cola.<br>The wasteland has taken its toll on the board."
	icon_state = "cola1"

/obj/structure/billboard/cola/New()
	..()
	icon_state = pick("cola2","cola3","cola4")

/obj/structure/billboard/cola/pristine
	name = "pristine Nuka-Cola billboard"
	desc = "A pre-War ad for Nuka-Cola.<br>Oddly enough, it's good as new."
	icon_state = "cola1"

/obj/structure/billboard/cola/pristine/New()
	..()
	icon_state = "cola1"

/obj/structure/billboard/cola/cola_shop
	name = "pristine Nuka-Cola billboard"
	desc = "A pre-War ad for Nuka-Cola.<br>Oddly enough, it's good as new."
	icon_state = "cola_shop"

/obj/structure/billboard/cola/cola_shop/New()
	..()
	icon_state = "cola_shop"

//Taken from removed F13billboards.dm
/obj/structure/billboard/den
	name = "Kebab sign"
	desc =  "A sprayed metal sheet that says \"Kebab \"."
	icon_state = "den"

/obj/structure/billboard/klamat
	name = "Klamat sign"
	desc =  "A ruined sign that says \"Klamat \"."
	icon_state = "klamat"

/obj/structure/billboard/hubris1
	name = "Hubris billboard"
	desc = "These types of advertisements used to be popular."
	icon_state = "hubris1"

/obj/structure/billboard/hubris2
	name = "Hubris billboard"
	desc = "These types of advertisements used to be popular. This one appears to be vandalized."
	icon_state = "hubris2"

/obj/structure/billboard/robco
	name = "Robco billboard"
	desc = "An advertisement for RobCo Industries."
	icon_state = "robco1"

/obj/structure/billboard/poseidenenergy1
	name = "Poseidon Energy billboard"
	desc = "An advertisement for Poseidon Energy."
	icon_state = "poseiden1"

/obj/structure/billboard/poseidenenergy2
	name = "Poseidon Energy billboard"
	desc = "An advertisement for Poseidon Energy. This one appears to be vandalized."
	icon_state = "poseiden2"

/obj/structure/billboard/poseidenenergy3
	name = "Poseidon Energy billboard"
	desc = "An advertisement for Poseidon Energy. This one appears to be vandalized."
	icon_state = "poseiden3"

/obj/structure/billboard/sunset
	name = "Sunset Sarsaparilla billboard"
	desc = "An advertisement for Sunset Sarsaparilla."
	icon_state = "sunset1"

/obj/structure/billboard/generalatomics1
	name = "General Atomics billboard"
	desc = "An advertisement for RobCo Industries."
	icon_state = "generalatomics1"

/obj/structure/billboard/generalatomics2
	name = "General Atomics billboard"
	desc = "An advertisement for RobCo Industries. This one appears to be vandalized."
	icon_state = "generalatomics2"

/obj/structure/billboard/radiationking
	name = "Radiation King billboard"
	desc = "An advertisement for Radiation King."
	icon_state = "radiationking1"

/obj/structure/billboard/nukagirl
	name = "Nuka-Cola billboard"
	desc = "An advertisement for Nuka-Cola, featuring Nuka Girl."
	icon_state = "nukagirl1"

/obj/structure/billboard/nukagirl2
	name = "Nuka-Cola billboard"
	desc = "An advertisement for Nuka-Cola, featuring Nuka Girl. This one has been worn down by the wasteland."
	icon_state = "nukagirl2"

/obj/structure/billboard/redrocket1
	name = "Red Rocket billboard"
	desc = "An advertisement for Red Rocket Fuel Station."
	icon_state = "redrocket1"

/obj/structure/billboard/redrocket2
	name = "Red Rocket billboard"
	desc = "An advertisement for Red Rocket Fuel Station. It looks like this one has been tagged by the Khans, and is very worn down."
	icon_state = "redrocket2"

/obj/structure/billboard/superduper1
	name = "Super duper billboard"
	desc = "An advertisement for Super Duper Mart."
	icon_state = "superduper1"

/obj/structure/billboard/superduper2
	name = "Super duper billboard"
	desc = "An advertisement for Super Duper Mart. This one has been vandalized and worn down by the wasteland."
	icon_state = "superduper2"

/obj/structure/billboard/random/New()
	..()
	icon_state = pick("hubris1","hubris2","nukagirl1", "nukagirl2", "radiationking1", "redrocket1","redrocket2", "superduper1", "superduper2", "generalatomics1", "generalatomics2", "cola1", "cola2", "cola3", "cola4", "ritas1", "ritas2", "ritas3", "ritas4", "roboco1", "sunset1", "poseiden1", "poseiden2", "poseiden3" )

/obj/structure/billboard/powerlines1
	name = "broken powerlines"
	desc = "Old broken powerlines, all that remains of the prewar powergrid."
	icon_state = "stolb1"

/obj/structure/billboard/powerlines2
	name = "broken powerlines"
	desc = "Old broken powerlines, all that remains of the prewar powergrid."
	icon_state ="stolb2"

/obj/structure/billboard/boardedwell
	name = "boarded-up well"
	desc = "An old, dried-up well that has been boarded up."
	icon_state = "well"
