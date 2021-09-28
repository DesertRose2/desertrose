#define COMSIG_ATTACHMENT_ATTACH "attach-attach"
#define COMSIG_ATTACHMENT_DETACH "attach-detach"
#define ATTACH_DELAY "attach_delay"
#define DETACH_DELAY "detach_delay"
#define OVERLAY_ICON "overlay_icon"
#define COMSIG_ATTACHMENT_EXAMINE "attach-examine"
#define COMSIG_ATTACHMENT_EXAMINE_MORE "attach-examine-more"
#define COMSIG_ATTACHMENT_PRE_ATTACK "attach-pre-attack"
#define COMSIG_ATTACHMENT_ATTACK "attach-attacked"
#define COMSIG_ATTACHMENT_UPDATE_OVERLAY "attach-overlay"

//Basically the parts of guns where shit attaches to.
#define COMSIG_ATTACHMENT_GET_SLOT "attach-slot-who"
#define ATTACHMENT_SLOT_MUZZLE "attach-slot-muzzle"
#define ATTACHMENT_SLOT_SCOPE "attach-slot-scope"
#define ATTACHMENT_SLOT_BARREL "attach-slot-barrel"
#define ATTACHMENT_SLOT_RAIL "attach-slot-rail"
#define ATTACHMENT_SLOT_GRIP "attach-slot-grip"
#define ATTACHMENT_SLOT_LASER_RECEIVER "attach-slot-receiver"
#define ATTACHMENT_SLOT_LASER_LENS "attach-slot-lens"

/proc/attachment_slot_to_bflag(slot)
	switch(slot)
		if(ATTACHMENT_SLOT_MUZZLE)
			return (1<<0)
		if(ATTACHMENT_SLOT_SCOPE)
			return (1<<1)
		if(ATTACHMENT_SLOT_BARREL)
			return (1<<2)
		if(ATTACHMENT_SLOT_RAIL)
			return (1<<3)
		if(ATTACHMENT_SLOT_GRIP)
			return (1<<4)
		if(ATTACHMENT_SLOT_LASER_RECEIVER)
			return (1<<5)
		if(ATTACHMENT_SLOT_LASER_LENS)
			return (1<<6)

/proc/attachment_slot_from_bflag(slot)
	switch(slot)
		if(1<<0)
			return ATTACHMENT_SLOT_MUZZLE
		if(1<<1)
			return ATTACHMENT_SLOT_SCOPE
		if(1<<2)
			return ATTACHMENT_SLOT_BARREL
		if(1<<3)
			return ATTACHMENT_SLOT_RAIL
		if(1<<4)
			return ATTACHMENT_SLOT_GRIP
		if(1<<5)
			return ATTACHMENT_SLOT_LASER_RECEIVER
		if(1<<6)
			return ATTACHMENT_SLOT_LASER_LENS

#define COMSIG_ATTACHMENT_TOGGLE "attach-toggle"

#define TRAIT_ATTACHABLE "attachable"

//If the slot is avaiible or not.
#define ATTACHMENT_DEFAULT_SLOT_AVAILABLE list( \
	ATTACHMENT_SLOT_MUZZLE = 1, \
	ATTACHMENT_SLOT_SCOPE = 1, \
	ATTACHMENT_SLOT_GRIP = 1, \
	ATTACHMENT_SLOT_RAIL = 1, \
	ATTACHMENT_SLOT_LASER_LENS = 1, \
	ATTACHMENT_SLOT_LASER_RECEIVER = 1, \
)

/datum/component/attachment
	var/slot
	var/list/valid_parent_types
	var/datum/callback/on_attach
	var/datum/callback/on_detach
	var/datum/callback/on_toggle
	var/datum/callback/on_preattack
	var/list/datum/action/actions

/datum/component/attachment/Initialize(
		slot = ATTACHMENT_SLOT_RAIL,
		valid_parent_types = list(/obj/item/gun),
		datum/callback/on_attach = null,
		datum/callback/on_detach = null,
		datum/callback/on_toggle = null,
		datum/callback/on_preattack = null,
		list/signals = null,
	)

	if(!isitem(parent))
		return COMPONENT_INCOMPATIBLE

	src.slot = slot
	src.valid_parent_types = valid_parent_types
	src.on_attach = on_attach
	src.on_detach = on_detach
	src.on_toggle = on_toggle
	src.on_preattack = on_preattack

	ADD_TRAIT(parent, TRAIT_ATTACHABLE, src)
	RegisterSignal(parent, COMSIG_ATTACHMENT_ATTACH, .proc/try_attach)
	RegisterSignal(parent, COMSIG_ATTACHMENT_DETACH, .proc/try_detach)
	RegisterSignal(parent, COMSIG_ATTACHMENT_TOGGLE, .proc/try_toggle)
	RegisterSignal(parent, COMSIG_ATTACHMENT_PRE_ATTACK, .proc/relay_pre_attack)
	RegisterSignal(parent, COMSIG_ATTACHMENT_UPDATE_OVERLAY, .proc/update_overlays)
	RegisterSignal(parent, COMSIG_ATTACHMENT_GET_SLOT, .proc/send_slot)

	for(var/signal in signals)
		RegisterSignal(parent, signal, signals[signal])

/datum/component/attachment/Destroy(force, silent)
	REMOVE_TRAIT(parent, TRAIT_ATTACHABLE, src)
	if(actions && length(actions))
		var/obj/item/gun/parent = src.parent
		parent.actions -= actions
		QDEL_LIST(actions)
	return ..()

/datum/component/attachment/proc/try_toggle(obj/item/parent, obj/item/holder, mob/user)
	SIGNAL_HANDLER

	INVOKE_ASYNC(src, .proc/do_toggle, parent, holder, user)


/datum/component/attachment/proc/do_toggle(obj/item/parent, obj/item/holder, mob/user)
	if(on_toggle)
		on_toggle.Invoke( holder, user)
		return TRUE

	parent.attack_self(user)
	return TRUE

/datum/component/attachment/proc/update_overlays(obj/item/parent, list/overlays, list/offset)
	overlays += mutable_appearance(parent.icon, "[parent.icon_state]-attached")

/datum/component/attachment/proc/try_attach(obj/item/parent, obj/item/holder, mob/user)
	SIGNAL_HANDLER

	if(!parent.Adjacent(user) || (length(valid_parent_types) && (holder.type in valid_parent_types)))
		return FALSE

	if(on_attach && !on_attach.Invoke(holder, user))
		return FALSE

	parent.forceMove(holder)
	return TRUE

/datum/component/attachment/proc/try_detach(obj/item/parent, obj/item/holder, mob/user)
	SIGNAL_HANDLER

	if(!parent.Adjacent(user) || (valid_parent_types && (holder.type in valid_parent_types)))
		return FALSE

	if(on_attach && !on_detach.Invoke(holder, user))
		return FALSE

	if(user.can_put_in_hand(parent))
		user.put_in_hand(parent)
		return TRUE

	parent.forceMove(holder.drop_location())
	return TRUE

/datum/component/attachment/proc/relay_pre_attack(obj/item/parent, obj/item/gun, atom/target_atom, mob/user, params)

	if(on_preattack)
		return on_preattack.Invoke(gun, target_atom, user, params)

/datum/component/attachment/proc/send_slot(obj/item/parent)
	SIGNAL_HANDLER
	return attachment_slot_to_bflag(slot)