//In this document: Pistol calibre cartridges values for damage and penetration.

//////////////////////
// AMMUNITION TYPES //
//////////////////////
/*
FMJ (full metal jacket)		=	Baseline
AP (armor piercing)			=	-20% damage. AP increased by 0.2. Wound bonus -50%
JHP (jacketed hollow point)	=	+15% damage. AP reduced by 0.2 (not below zero). Wound bonus + 50%
SWC (semi wadcutter)		=	AP reduced by 0.1. Wound bonus +50%
P+ (overpressure)			=	extra speed 500. AP +25%
Match						=	extra speed 200. AP +10%. Wound bonus -10%
Civilian round				=	-10% damage. AP reduced by 50%
*/

// Explanation: Two major ammo stats, AP and Damage. Bullets placed in classes. Light rounds for example balanced with each other, one more AP, one more Damage.
// Balance between classes mostly done on the gun end, bigger rounds typically fire slower and have more recoil. They are not supposed to be totally equal either.

////////////////////
// .22 LONG RIFLE //
////////////////////		-very light round

/obj/item/projectile/bullet/c22
	name = ".22lr bullet"
	damage = 15
	armour_penetration = 0.05
	wound_bonus = 6
	bare_wound_bonus = -6

/obj/item/projectile/bullet/c22/hp
	name = ".22lr HP bullet"
	damage = 18
	armour_penetration = -0.2
	wound_bonus = -12
	bare_wound_bonus = 12

/obj/item/projectile/bullet/c22/plinking
	name = ".22lr plinking bullet"
	damage = 12
	armour_penetration = 0.05
	wound_bonus = 4
	bare_wound_bonus = -4


/////////////////
// .38 SPECIAL //
/////////////////		-Light round, slight damage focus

/obj/item/projectile/bullet/c38
	name = ".38 bullet"
	damage = 30
	armour_penetration = 0
	wound_bonus = 10


//////////
// 9 MM //
//////////				-Light round, allround

/obj/item/projectile/bullet/c9mm
	name = "9mm FMJ bullet"
	damage = 26
	armour_penetration = 0.16
	wound_bonus = 15

/obj/item/projectile/bullet/c9mm/ap
	name = "9mm AP bullet"
	damage = 22
	armour_penetration = 0.25
	wound_bonus = 8
	bare_wound_bonus = -8

/obj/item/projectile/bullet/c9mm/jhp
	name = "9mm JHP bullet"
	damage = 31
	armour_penetration = 0
	wound_bonus = -23
	bare_wound_bonus = 23

/obj/item/projectile/bullet/c9mm/op
	name = "9mm +P bullet"
	damage = 30 //39
	armour_penetration = 0.35 //0.4
	wound_bonus = 30
	bare_wound_bonus = 30

/obj/item/projectile/bullet/c9mm/simple //for simple mobs, separate to allow balancing
	name = "9mm bullet"


///////////
// 10 MM //
///////////				-Medium round, AP focus

/obj/item/projectile/bullet/c10mm
	name = "10mm FMJ bullet"
	damage = 29
	armour_penetration = 0.18
	wound_bonus = 18

/obj/item/projectile/bullet/c10mm/ap
	name = "10mm AP bullet"
	damage = 24
	armour_penetration = 0.32
	wound_bonus = 9
	bare_wound_bonus = -9

/obj/item/projectile/bullet/c10mm/hp
	name = "10mm JHP bullet"
	damage = 35
	armour_penetration = 0
	wound_bonus = -27
	wound_bonus = 27


/////////////
// .45 ACP //
/////////////			-Medium round, damage focus

/obj/item/projectile/bullet/c45
	name = ".45 FMJ bullet"
	damage = 32
	armour_penetration = 0.1
	wound_bonus = 20

/obj/item/projectile/bullet/c45/jhp
	name = ".45 JHP bullet"
	damage = 37
	armour_penetration = 0
	wound_bonus = -30
	bare_wound_bonus = 30

/obj/item/projectile/bullet/c45/op
	name = ".45 +P bullet"
	damage = 32
	armour_penetration = 0.2
	pixels_per_second = TILES_TO_PIXELS(20)


/////////////////
// .357 MAGNUM //
/////////////////		-High power round

/obj/item/projectile/bullet/a357
	name = ".357 FMJ bullet"
	damage = 37
	armour_penetration = 0.18
	wound_bonus = 14
	bare_wound_bonus = -14

/obj/item/projectile/bullet/a357/jhp
	name = ".357 JHP bullet"
	damage = 43
	armour_penetration = 0
	wound_bonus = -21
	bare_wound_bonus = 21

/obj/item/projectile/bullet/a357/jfp
	name = ".357 JFP bullet"
	damage = 40
	armour_penetration = 0.14
	wound_bonus = 20
	bare_wound_bonus = 20


////////////////
// .44 MAGNUM //
////////////////		- High power round

/obj/item/projectile/bullet/m44
	name = ".44 FMJ bullet"
	damage = 38
	armour_penetration = 0.2
	wound_bonus = 20
	bare_wound_bonus = -20

/obj/item/projectile/bullet/m44/jhp
	name = ".44 JHP bullet"
	damage = 44
	armour_penetration = 0
	wound_bonus = -30
	bare_wound_bonus = 30

/obj/item/projectile/bullet/m44/swc
	name = ".44 SWC bullet"
	damage = 38
	armour_penetration = 0.15
	wound_bonus = 30
	bare_wound_bonus = 30

/obj/item/projectile/bullet/m44/simple //for simple mobs, separate to allow balancing
	name = ".44 bullet"

////////////
// .45-70 //
////////////			-Heavy round, AP focus

/obj/item/projectile/bullet/c4570
	name = ".45-70 FMJ bullet"
	damage = 41
	armour_penetration = 0.25
	wound_bonus = 24
	bare_wound_bonus = -24

/obj/item/projectile/bullet/c4570/jhp
	name = ".45-70 JHP bullet"
	damage = 49
	armour_penetration = 0.1
	wound_bonus = -36
	bare_wound_bonus = 36

/obj/item/projectile/bullet/c4570/swc
	name = ".45-70 SWC bullet"
	damage = 42
	armour_penetration = 0.2
	wound_bonus = 36
	bare_wound_bonus = 36

/obj/item/projectile/bullet/c4570/explosive
	damage = 10
	armour_penetration = 1
	pixels_per_second = TILES_TO_PIXELS(20)
	name = ".45-70 explosive bullet"

/obj/item/projectile/bullet/c4570/explosive/on_hit(atom/target, blocked = FALSE)
	..()
	explosion(target, 0, 0, 1, 1, flame_range = 1)


///////////
// 12.7 MM //
///////////				-Heavy round, damage focus

/obj/item/projectile/bullet/a127mm
	name = "12.7mm FMJ bullet"
	damage = 52
	armour_penetration = 0.25
	wound_bonus = 30
	bare_wound_bonus = -30

/obj/item/projectile/bullet/a127mm/jhp
	name = "12.7mm JHP bullet"
	damage = 62
	armour_penetration = 0
	wound_bonus = -56
	bare_wound_bonus = 56


/////////////
// NEEDLER //
/////////////			- AP focus

/obj/item/projectile/bullet/needle
	name = "needle"
	icon_state = "cbbolt"
	damage = 35
	armour_penetration = 0.8
	//makes the needler a dedicated armor piercing weapon instead of useless
	var/piercing = FALSE

/obj/item/projectile/bullet/needle/ap
	name = "armour piercing needle"
	damage = 33
	armour_penetration = 1
	wound_bonus = 0
	bare_wound_bonus = 0
	piercing = TRUE

/obj/item/projectile/bullet/needle/ultra
	name = "ultracite needle"
	damage = 50
	armour_penetration = 0.4
	piercing = TRUE

/*
/obj/item/projectile/bullet/needle/Initialize()
	. = ..()
	create_reagents(50, NO_REACT, NO_REAGENTS_VALUE)

/obj/item/projectile/bullet/needle/on_hit(atom/target, blocked = FALSE, skip = FALSE)
	if(iscarbon(target))
		var/mob/living/carbon/M = target
		if(blocked != 100) // not completely blocked
			if(M.can_inject(null, FALSE, def_zone, piercing)) // Pass the hit zone to see if it can inject by whether it hit the head or the body.
				..()
				if(skip == TRUE)
					return BULLET_ACT_HIT
				reagents.reaction(M, INJECT)
				reagents.trans_to(M, reagents.total_volume)
				return TRUE
			else
				blocked = 100
				target.visible_message(SPAN_DANGER("\The [src] was deflected!"), \
									   "<span class='userdanger'>You were protected against \the [src]!</span>")

	..(target, blocked)
	DISABLE_BITFIELD(reagents.reagents_holder_flags, NO_REACT)
	reagents.handle_reactions()
	return BULLET_ACT_HIT
*/
