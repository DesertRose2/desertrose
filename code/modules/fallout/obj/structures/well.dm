//Fallout 13 water well

/obj/structure/sink/well
    name = "water well"
    desc = "A structure used to provide a source of fresh water - nothing out of the ordinary."
    icon_state = "wellwheel"
    var/moving = 0
    //var/use_sound = 'sound/machines/door_open.ogg' // if we want a sound for it later
    icon = 'icons/obj/Ritas.dmi'
    var/using_time = 2

/obj/structure/sink/well/proc/Use(animate)
    //playsound(src.loc, use_sound, 30, 0, 0)
    if(animate)
        moving = 1
        flick("wellwheel-filling", src)
        sleep(using_time)
        moving = 0
    set_opacity(0)
    density = 0
    icon_state = "wellwheel"

/obj/structure/sink/well/attackby(obj/item/O, mob/living/user, params)
	if(istype(O, /obj/item/reagent_containers))
		var/obj/item/reagent_containers/RG = O
		if(RG.is_refillable())
			if(!RG.reagents.holder_full())
				RG.reagents.add_reagent(dispensedreagent, min(RG.volume - RG.reagents.total_volume, RG.amount_per_transfer_from_this))
				to_chat(user, "<span class='notice'>You fill [RG] from [src].</span>")
				Use(TRUE)
		return FALSE