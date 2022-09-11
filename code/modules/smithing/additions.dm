
#define GLOW_BRIGHT 1.5
#define GLOW_MODERATE 0.75
#define GLOW_WEAK 0.25

#define WOODEN_ROD /obj/item/blacksmith/woodenrod
#define SWORD_HANDLE /obj/item/blacksmith/swordhandle
#define LEATHER_STRIP /obj/item/stack/sheet/leatherstrips
#define CHAIN /obj/item/blacksmith/chain

#define QUALITY_MODIFIER quality
#define FAST_ATTACK 7
#define SLOW_ATTACK 9

//////////////////////////////////////
//									//
//		QUENCHING TROUGH			//
//									//
//////////////////////////////////////

/obj/structure/blacksmith/quenching
	name = "quenching trough"
	desc = "Water in a open box, for tempering hot metal in."
	icon = 'code/modules/smithing/icons/blacksmith.dmi'
	icon_state = "quench"
	density = TRUE
	anchored = TRUE
	var/toohot

/obj/structure/blacksmith/quenching/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/smithing))
		var/obj/item/smithing/untempered = I
		if(untempered.toohot == FALSE)
			playsound(src, 'sound/effects/water_wade4.ogg',50, 1)
			return
		to_chat(user, "You temper the [untempered] by quenching it in the water. There is a loud hiss and a puff of steam.")
		playsound(src, 'sound/machines/clockcult/steam_whoosh.ogg', 50, TRUE)
		flick("quench_boil",src)
		var/datum/effect_system/steam_spread/puff = new /datum/effect_system/steam_spread/()
		puff.effect_type = /obj/effect/particle_effect/steam
		puff.set_up(2, 0, src)
		puff.start()
		if(!do_after(user, 15, TRUE, src))
			return
		untempered.toohot = FALSE
		untempered.istempered()
		I.on_attack_hand(user)
	else
		. = ..()

/obj/structure/blacksmith/quenching/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/blacksmith/ingot))
		var/obj/item/blacksmith/ingot/notsword = I
		if(notsword.workability == FALSE)
			playsound(src, 'sound/effects/water_wade4.ogg',50, 1)
			return
		to_chat(user, "You cool the [notsword] in the water.")
		playsound(src, 'sound/f13effects/steam_short.ogg',80, 1)
		flick("quench_boil",src)
		var/datum/effect_system/steam_spread/puff = new /datum/effect_system/steam_spread/()
		puff.effect_type = /obj/effect/particle_effect/steam
		puff.set_up(1, 0, src)
		puff.start()
		notsword.workability = FALSE
		notsword.icon_state = "ingot"
		notsword.set_light(0)
		I.on_attack_hand(user)
	else
		. = ..()


// ------------ EFFECTS ------------------

/obj/effect/particle_effect/smithing_sparks
	name = "sparks"
	icon_state = "sparks"

/obj/effect/particle_effect/smithing_sparks/Initialize()
	. = ..()
	flick(icon_state, src) // replay the animation
	anchored = TRUE
	light_power = 1.3
	light_range = MINIMUM_USEFUL_LIGHT_RANGE
	light_color = LIGHT_COLOR_FIRE
	QDEL_IN(src, 20)

/datum/effect_system/smithing_spark_spread
	effect_type = /obj/effect/particle_effect/smithing_sparks

/proc/do_smithing_sparks(n, c, source)
	var/datum/effect_system/smithing_spark_spread/sparks = new
	sparks.set_up(n, c, source)
	sparks.autocleanup = TRUE
	sparks.start()


// ------------- ASSOCIATED CRAFTING -------------------------

// CUTTING LEATHER INTO STRIPS (for further crafting) TO DO - put in hand instead of drop on floor
/obj/item/stack/sheet/leather/attackby(obj/item/W, mob/user, params)
	if(W.get_sharpness())
		playsound(loc, 'sound/weapons/slice.ogg', 50, 1, -1)
		user.visible_message("[user] starts shredding the [src] into strips.", "<span class='notice'>You start shredding the [src] into strips</span>", "<span class='italics'>You hear the sound of leather being ripped.</span>")
		if(do_after(user, 40, target = src))
			to_chat(user, "<span class='notice'>You cut strips from this [src.singular_name].</span>")
			new /obj/item/stack/sheet/leatherstrips(user.drop_location(), 1)
			use(1)
	else
		return ..()


/obj/item/stack/sheet/leatherstrips
	name = "leather strips"
	desc = "long leather strips that can be used for crafting various things."
	singular_name = "strip of leather"
	icon = 'code/modules/smithing/icons/blacksmith.dmi'
	icon_state = "leatherstrips"
	merge_type = /obj/item/stack/sheet/leatherstrips

GLOBAL_LIST_INIT(leatherstrips_recipes, list ( \
	new/datum/stack_recipe("slave labor outfit", /obj/item/clothing/suit/armor/f13/slavelabor, 2, time = 50),  \
	new/datum/stack_recipe("jabroni outfit", /obj/item/clothing/under/jabroni, 4, time = 80), \
	new/datum/stack_recipe("muzzle", /obj/item/clothing/mask/muzzle, 2, time = 40),  \
	new/datum/stack_recipe("pet collar", /obj/item/clothing/neck/petcollar, 2, time = 40), \
	new/datum/stack_recipe("whip", /obj/item/melee/curator_whip, 10, time = 180), \
))

/obj/item/stack/sheet/leatherstrips/get_main_recipes()
	. = ..()
	. += GLOB.leatherstrips_recipes

// Bronze less retarded
/datum/material/bronze
	strength_modifier = 1

// Makes slag more suitable visually for the interactions with the anvil
/obj/item/stack/ore/slag
	icon = 'code/modules/smithing/icons/blacksmith.dmi'


/obj/item/clothing/gloves/blacksmith
	name = "blacksmith mittens"
	desc = "A pair of heavy duty leather mittens designed to protect the wearer when metalforging. Unsuited for tasks requiring manual dexterity."
	icon = 'code/modules/smithing/icons/blacksmith.dmi'
	icon_state = "blacksmith_mittens"
	mob_overlay_icon = 'code/modules/smithing/icons/onmob/slot.dmi'
	item_state = "blacksmith_mittens"
	transfer_prints = FALSE
	strip_delay = 10
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	heat_protection = HANDS
	max_heat_protection_temperature = GLOVES_MAX_TEMP_PROTECT
	armor = list(melee = 10, bullet = 10, laser = 10, energy = 10, bomb = 10, bio = 10, rad = 10, fire = 10, acid = 10)

/obj/item/clothing/gloves/blacksmith/equipped(mob/user, slot)
	. = ..()
	if(ishuman(user) && user.mind && slot == SLOT_HANDS)
		ADD_TRAIT(user, TRAIT_CLUMSY, CLOTHING_TRAIT)

/obj/item/clothing/gloves/blacksmith/dropped(mob/user)
	. = ..()
	REMOVE_TRAIT(user, TRAIT_CLUMSY, CLOTHING_TRAIT)



///////////////////////////////////
// ADVICE FOR BLACKSMITH ROOKIES //
///////////////////////////////////

// Explains some things so you dont have to code dive to learn.
/obj/item/book/manual/advice_blacksmith
	name = "The Forgemasters Primer"
	desc = "A thin book with some basic advice on how to use a hammer and anvil, copied by hand."
	icon = 'code/modules/smithing/icons/blacksmith.dmi'
	icon_state = "advice_smithing"
	author = "Forgemaster Gallius"
	title = "Advice on Blacksmithing - For hotheaded whelps"
	dat = {"<html>
				<head>
				<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
				<style>
				h1 {font-size: 18px; margin: 15px 0px 5px;}
				h2 {font-size: 15px; margin: 15px 0px 5px;}
				li {margin: 2px 0px 2px 15px;}
				ul {list-style: none; margin: 5px; padding: 0px;}
				ol {margin: 5px; padding: 0px 15px;}
				</style>
				</head>
				<body>

				<h3>How to work a hammer and anvil and produce basic tools.</h3>

				The needed tools are: good gloves, metal ingots, a furnace, wood planks, an anvil, quenching trough and a special hammer.
				<p>
				<ol>
				<li>Gloves: Not all gloves can handle red hot metal, blacksmith mittens is my personal preference but others work too. If you can move the hot metal from the furnace the gloves are good enough.</li>
				<li>Metal ingots: Take the metal stack you want to work in your hand and fashion ingots from it. (inhand crafting) </li>
				<li>Furnace: Needs fuel, welding fuel most commonly. Five measures of fuel burns fast but is enough to heat a couple ingots if you are fast.</li>
				<li>Wooden bits: Cut down planks to rods with something sharp. Then cut leather to strips and wrap it around the rod for making a sword handle, or directly on the workpiece for some tools. </li>
				<li>Metal bits: On occasion you might need some chain to complete your work, if so, take a metal sheet in your hand and make a length of chain from it. (inhand crafting) </li>
				<li>Anvil: Various traditions in blacksmithing use various anvils. This means following the same recipes on another anvil might produce something unexpected. Bull stamped anvils are used by the Legion, wasters often use reinforced tables, and various settlers use sandstone or metal anvils. (crafting menu forging & blacksmithing)</li>
				<li>Quenching trough: Basically a big tub of water, or oil. (crafting menu forging & blacksmithing) </li>
				<li>Hammer: Most commonly a sledgehammer is used for the first work, which is making a better hammer. Craft one to get going. (crafting menu forging & blacksmithing) </li>
				</ol>
				<p>

				<h3>The process</h3>

				<p>
				<ol>
				<li>Heat the ingot, move it to the anvil.</li>
				<li>Prepare the metal, weak, strong and heavy hits enhance the quality but overworking the metal will produce slag and you have to start over. Try a couple hits then move on to making the item if you have no other ideas. </li>
				<li>Follow the secret smithing recipe for the item you want to make, the end result will depend on how much experience you have smithing, and the quality of your tools and preparations. </li>
				<li>Quenching: when the hot metal piece is finished, you need to temper it in cold fluids in a trough to finish it, before adding fittings such as a wooden rod, sword handle, chain or leather strips. </li>
				<li>The first item you make should be a good hammer, you might need to repeat the process and replace the previous hammer with a new one in steps. Try to have at least a masterworked iron hammer before moving on to other items to save you headache. </li>
				</ol>
				<p>

	
				<h3>Some secret smithing recipes.</h3>

				These are some of the items that can be made with hot iron and a steady hand. Results are not always the same depending on the anvil used.
				<p>
				<ol>
				<li>Hammer: (BPP) Bend the metal, then punch it like you would a profligates face until the hammerhead is done. Add a rod.</li>
				<li>Crowbar: (BBB) Bend the metal until you got the crowbar done, then wrap it in leather strips. Better than the usual crowbars folks use nowadays.</li>
				<li>Pickaxe: (BFF) Bend the metal, then fold it into shape twice, then add a wooden rod.</li>
				<li>Prospecting pick: (BFS) Bend the metal, then fold it into shape and shrink it, then add a wooden rod. Useful for finding mineral deposits.</li>
				<li>Kitchen knife: (BSD) Bend the metal, shrink and draw it, then add a knife handle. A perfect gift for women.</li>
				<li>Rings: (SSS) Tiny things, my fingers hurt when I try to work it, but if you youngsters want to make one just shrink the metal to shape. Might cheer you up.</li>
				<li>Ball and chain: (PBU) Punch the metal, bend and upset it. Add a chain and then snap it on the slaves leg, and laugh while they hobble about. Silly slave.</li>

				<li>Dagger: (DDS) Draw draw and shrink it, add a sword handle and you got a tiny little weapon. </li>
				<li>Machete: (FDF) Fold the metal, draw it and ugh..yeah, fold it more. Add handle.</li>
				<li>Small sword: (FFSU) Fold, shrink, upset, add a handle and you got a small dinky blade. </li>
				<li>Sword: (FFDD) You must fold the metal some, then draw it into a proper thin shape. Add a handle and you got a fine blade! </li>
				<li>Longsword: (FFFF) Fold, fold, then FOLD SOME MORE. Done right, you get a proper sharp sword, after adding a sword handle.</li>
				<li>Heavy axe: (UUPP) Upset the hot metal, then use the puncher to make holes for the fittings. Add a wooden rod, then go chop down some wood or enemies. Easy. </li>
				<li>Spear: (DDDF) Draw the metal thrice then fold it. Add a rod, and enjoy a simple but effective weapon.</li>

				<li>Javelin: (SDU) Shrink, draw, upset, add a wooden rod and throw it in someones face.</li>
				<li>Throwing knife: (SDD) Shrink and draw the metal twice, then add leather strips and there you go.</li>
				<li>Bola: (SUU) Shrink then upset twice, add a chain and you got a nice slavecatcher.</li>

				</ol>
				<p>

				Know that there are more things to learn, but this is enough to get you started. Know that there are three styles of smithing, each requiring its own kind of anvil. Some items can only me made on the right anvil, experimentation is the key!

				</body>
				</html>
				"}



// --------------- DR Code compatiblity temporary addons ---------------------

// Sledgehammer			Keywords: Damage 25/45, Blacksmithing
/obj/item/twohanded/sledgehammer/simple
	var/qualitymod = 0

/obj/item/twohanded/sledgehammer/simple/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/two_handed, force_unwielded = 25, force_wielded = 45, icon_wielded="[icon_prefix]2")

/obj/item/twohanded/sledgehammer/simple/afterattack(atom/A, mob/living/user, proximity)
	. = ..()
	if(!proximity || !wielded || IS_STAMCRIT(user))
		return
	if(istype(A, /obj/structure))
		var/obj/structure/W = A
		W.take_damage(20, BRUTE, "melee", 0)
