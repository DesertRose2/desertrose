////////Dogtag types/////////
//All one subtype for making item path pretty/easily telling what ID cards are dogtags, for gravemarkers

/obj/item/card/id/dogtag
	name = "holo dogtag"
	desc = "An advanced holographic dogtag, that shows the duty of a BoS member."
	icon_state = "holodogtag"
	assignment = "ID tags"
	uses_overlays = FALSE

/obj/item/card/id/selfassign/attack_self(mob/user)
	if(isliving(user))
		var/mob/living/living_user = user
		if(alert(user, "Action", "Agent ID", "Show", "Forge") == "Forge")
			registered_name = living_user.real_name
			assignment = living_user.job
			update_label()
			to_chat(user, SPAN_NOTICE("You successfully forge the ID card."))
			return
	..()

/obj/item/card/id/selfassign
	icon_state = "silver"
	item_state = "silver_id"
	desc = "A rewritable card that allows you to put your name and assignment on it."

/obj/item/card/id/dogtag/deputy
	name = "deputy's badge"
	desc = "A silver badge which shows honour and dedication."
	assignment = "badge"
	assignment = "Deputy"
	icon_state = "deputy"
	item_state = "badge-deputy"
	access = list(ACCESS_BAR, ACCESS_GATEWAY)

/obj/item/card/id/dogtag/deputy/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/card/id/dogtag/sheriff))
		var/newname = stripped_input(user, "Who do you want to designate as your deputy?", , "", MAX_NAME_LEN)
		if(newname)
			to_chat(user, "You scribble the [registered_name] for the name on the badge.")
			registered_name = newname
			update_label()
	return ..()

/obj/item/card/id/dogtag/sheriff
	name = "sheriff's badge"
	desc = "A golden Sheriff's badge."
	assignment = "badge"
	icon_state = "sheriff"
	item_state = "badge-sheriff"

/obj/item/card/id/dogtag/town
	name = "citizenship permit"
	desc = "A permit identifying the holder as a citizen of a nearby town."
	icon_state = "doctor"
	item_state = "card-doctor"
	assignment = "citizenship permit"
	access = list(ACCESS_BAR)

/obj/item/card/id/dogtag/town/mafia
	name = "citizenship permit"
	desc = "A permit identifying the holder as a citizen of a nearby town."
	icon_state = "doctor"
	item_state = "card-doctor"
	assignment = "citizenship permit"
	assignment = "Settler"
	obj_flags = UNIQUE_RENAME
	access = list(ACCESS_BAR)

/obj/item/card/id/dogtag/town/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/card/id/silver/mayor))
		var/newname = stripped_input(user, "Who do you want to grant citizenship to?", , "", MAX_NAME_LEN)
		if(newname)
			to_chat(user, "You scribble the [registered_name] for the name on the permit.")
			registered_name = newname
			update_label()
	return ..()

/obj/item/card/id/dogtag/ncrambassador
	name = "ambassador's permit"
	desc = "An silver encrusted ambassador's permit in a plastic holder."
	icon_state = "silver"
	item_state = "silver"
	assignment = "ambassador's permit"

/obj/item/card/id/dogtag/ncradmin
	name = "Administrators ID"
	desc = "An silver encrusted admins ID in a plastic holder."
	icon_state = "silver"
	item_state = "silver"

/obj/item/card/id/dogtag/ncrtrooper
	name = "trooper's tags"
	desc = "A dog tag proving enlistment."
	icon_state = "ncrdogtagrecruit"

/obj/item/card/id/dogtag/ncrmp
	name = "military police tags"
	desc = "A dog tag that associates one with the NCROSI."
	icon_state = "ncrdogtagrecruit"

/obj/item/card/id/dogtag/ncrht
	name = "heavy trooper's tags"
	desc = "A dog tag proving the elite status of the heavy trooper."
	icon_state = "ncrdogtagrecruit"

/obj/item/card/id/dogtag/ncrsergeant
	name = "sergeant's tags"
	desc = "A chevron decorated dog tag showing NCO-ship."
	icon_state = "ncrdogtagsergeant"

/obj/item/card/id/dogtag/ncrlieutenant
	name = "commanding officer's tags"
	desc = "A silver bar dog tag that denotes a member of the NCR military with an officer's commission."
	icon_state = "ncrdogtagofficer"

/obj/item/card/id/dogtag/ncrcaptain
	name = "captain's tags"
	desc = "A dog tag that demands respect from all those subordinate to it. This one belongs to an NCR captain."
	icon_state = "ncrdogtagcaptain"

/obj/item/card/id/dogtag/ncrranger
	name = "ranger badge"
	desc = "A badge formed out of a Legion denarius that invokes fear in those who see it, belonging to someone with a big iron on their hip."
	icon_state = "ranger"

/obj/item/card/id/dogtag/ncrvetranger
	name = "veteran ranger badge"
	desc = "A badge formed out of a Legion aureus that is worn by the most feared men and women of the Republic."
	icon_state = "vetranger"

/obj/item/card/id/dogtag/ncrcolonel
	name = "colonel's tags"
	desc = "A dog tag that demands respect from all those subordinate to it. This one belongs to an NCR colonel."
	icon_state = "ncrdogtagcaptain"

/obj/item/card/id/dogtag/legfollower
	name = "follower medallion"
	desc = "A silver disc stamped with the Legion's Bull insignia. Belongs to a camp follower."
	icon_state = "legionmedallionrecruit"
	assignment = "follower medallion"

/obj/item/card/id/dogtag/legauxilia
	name = "auxilia medallion"
	desc = "A heavily marked silver disc stamped with the Legion's Bull insignia. Belongs to a respected auxilia of the Legion."
	icon_state = "legionmedallionveteran"
	item_state = "card-id_leg"
	assignment = "auxilia medallion"

/obj/item/card/id/dogtag/legrecruit
	name = "recruit medallion"
	desc = "A silver disc stamped with the Legion's Bull insignia. Belongs to a recruit."
	icon_state = "legionmedallionrecruit"
	item_state = "card-id_leg"
	assignment = "recruit medallion"

/obj/item/card/id/dogtag/legprime
	name = "prime medallion"
	desc = "A marked silver disc stamped with the Legion's Bull insignia. Belongs to a prime."
	icon_state = "legionmedallionprime"
	item_state = "card-id_leg"
	assignment = "prime medallion"

/obj/item/card/id/dogtag/legslavemaster
	name = "prefect medallion"
	desc = "A marked silver disc stamped with the Legion's Bull insignia. Belongs to the dreaded Slavemaster."
	icon_state = "legionmedallionprime"
	item_state = "card-id_leg"
	assignment = "slavemaster medallion"

/obj/item/card/id/dogtag/leglibritor
	name = "libritor medallion"
	desc = "A marked silver disc stamped with the Legion's Bull insignia. Belongs to a libritor."
	icon_state = "legionmedallionprime"
	item_state = "card-id_leg"
	assignment = "libritor medallion"

/obj/item/card/id/dogtag/legveteran
	name = "veteran medallion"
	desc = "A heavily marked silver disc stamped with the Legion's Bull insignia. Belongs to a veteran, and reeks of iron."
	icon_state = "legionmedallionveteran"
	item_state = "card-id_leg"
	assignment = "veteran medallion"

/obj/item/card/id/dogtag/legcenturion
	name = "centurion medallion"
	desc = "A golden disc awarded to the most fierce men in the whole legion. If you are close enough to read the insignia you won't be alive much longer."
	icon_state = "legionmedallioncent"
	item_state = "card-id_leg2"
	assignment = "centurion medallion"

/obj/item/card/id/dogtag/legvenator
	name = "venator medallion"
	desc = "A golden disc awarded to the elite hunters of the legion. If you are close enough to read the insignia you won't be alive much longer."
	icon_state = "legionmedallioncent"
	item_state = "card-id_leg2"
	assignment = "venator medallion"

/obj/item/card/id/dogtag/legexplorer
	name = "explorer medallion"
	desc = "A marked silver disc stamped with the Legion's Bull insignia. Belongs to an explorer."
	icon_state = "legionmedallionprime"
	item_state = "card-id_leg"
	assignment = "explorer medallion"

/obj/item/card/id/dogtag/legpriest
	name = "priestess medallion"
	desc = "A golden disc awarded to the trusted spiritual guide to the nearby Legion."
	icon_state = "legionmedallioncent"
	item_state = "card-id_leg2"
	assignment = "priestess medallion"

/obj/item/card/id/dogtag/legorator
	name = "orator medallion"
	desc = "A golden disc awarded to the one who is a dedicated ambassador for Caesar's Legion."
	icon_state = "legionmedallioncent"
	item_state = "card-id_leg2"
	assignment = "orator medallion"

//For PilotBland's frumentarii custom loadout
/obj/item/card/id/dogtag/legfrumentariiremus
	name = "Remus Amius' frumentarius medallion"
	desc = "A golden disc with a string threaded through the top, displaying official markings confirming a frumentarius' status."
	icon_state = "legionmedallioncent"
	item_state = "card-id_leg2"
	assignment = "frumentarius medallion"

/obj/item/card/id/legionbrand
	name = "Legion's brand"
	desc = "A brand for identifying Caesar's Legion's slaves."
	icon_state = "legionbrand"
	item_state = "slave"
	assignment = "Slave brand"
	uses_overlays = FALSE

/obj/item/card/id/legionbrand/Initialize()
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, TRAIT_GENERIC)

///OUTLAW TAGS////

/obj/item/card/id/rusted
	name = "rusted tags"
	desc = "Decrepit uncared for NCR dogtags, kept as a reminder to something."
	icon_state = "rustedncrtag"
	item_state = "rustedncrtag"
	uses_overlays = FALSE

/obj/item/card/id/rusted/rustedmedallion
	name = "rusted medallion"
	desc = "A battered and unkempt legion medallion, kept as a reminder to something."
	icon_state = "rustedmedallion"
	item_state = "rustedmedallion"
	uses_overlays = FALSE

/obj/item/card/id/rusted/fadedvaultid
	name = "faded id card"
	desc = "A and worn Vault-Tech issued ID card, broken beyond use, kept as a reminder to something."
	icon_state = "fadedvaultid"
	item_state = "fadedvaultid"
	uses_overlays = FALSE

/obj/item/card/id/rusted/brokenholodog
	name = "broken holotag"
	desc = "A BoS issue holotag, it isnt working now though, kept as a reminder to something."
	icon_state = "brokenholodog"
	item_state = "brokenholodog"
	uses_overlays = FALSE

/obj/item/card/id/khantattoo
	name = "Great Khan tattoo"
	desc = "A tattoo of the symbol of the Great Khans."
	icon_state = "skin"
	item_state = "skin"
	assignment = "gang tattoo"
	uses_overlays = FALSE

	access = list(ACCESS_KHAN)

/obj/item/card/id/khantattoo/Initialize()
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, TRAIT_GENERIC)

/obj/item/card/id/bandittattoo
	name = "Bandit tattoo"
	desc = "A tattoo of the symbol of the bandits."
	icon_state = "skin"
	item_state = "skin"
	assignment = "gang tattoo"
	uses_overlays = FALSE

/obj/item/card/id/bandittattoo/Initialize()
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, TRAIT_GENERIC)
/* Tribal Tags
*/

/obj/item/card/id/tribetattoo
	name = "Tattoo of the machine spirits"
	desc = "A tattoo depicting the five machine spirits in harmony."
	icon_state = "talisman"
	item_state = "talisman"
	assignment = "tribe tattoo"
	uses_overlays = FALSE

	access = list(ACCESS_TRIBE)

/obj/item/card/id/tribetattoo/Initialize()
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, TRAIT_GENERIC)

/obj/item/card/id/silver/mayor
	name = "Mayor's mayoral permit"
	desc = "A silver encrusted identification permit reserved for the Mayor of Oasis."
	icon_state = "silver"
	item_state = "silver_id"
	assignment = "mayoral permit"
	uses_overlays = FALSE

/obj/item/card/id/dendoctor
	name = "doctor's name badge"
	desc = "A plastic-sealed name badge certifying the medical expertise of its holder."
	icon_state = "doctor"
	item_state = "card-doctor"
	assignment = "name badge"
	uses_overlays = FALSE

/obj/item/card/id/chief
	name = "crimson identification card"
	desc = "A red card which shows dedication and leadership to the Vaults safety and security."
	icon_state = "chief"
	item_state = "sec_id"
	lefthand_file = 'icons/mob/inhands/equipment/idcards_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/idcards_righthand.dmi'
	uses_overlays = FALSE

/obj/item/card/id/sec
	name = "red identification card"
	desc = "A red card which shows dedication to the Security department."
	icon_state = "sec"
	item_state = "sec_id"
	lefthand_file = 'icons/mob/inhands/equipment/idcards_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/idcards_righthand.dmi'
	uses_overlays = FALSE

/obj/item/card/data/wpermit
	name = "\improper VTCC weapons permit"

//rebound
/obj/item/card/id/rusted/rebound
	name = "rebound medalion"
	desc = "An unfamiliar rectangular medalion made out of steel. It has a dogtag tied to it with 'Bakersfield' stamped on it."
	icon_state = "rebound"
	item_state = "rustedncrtag"
	uses_overlays = FALSE
