/obj/machinery/telecomms/bus/preset_three
	freq_listening = list(FREQ_SECURITY, FREQ_COMMAND, FREQ_VAULT, FREQ_NCR, FREQ_BOS, FREQ_ENCLAVE, FREQ_DEN, FREQ_LEGION, FREQ_RANGER, FREQ_KHANS)
	autolinkers = list("processor3", "security", "command", "vault", "ncr", "bos", "enclave", "town", "legion", "ranger", "khans")

/obj/machinery/telecomms/hub/preset
	autolinkers = list("hub", "relay", "s_relay", "m_relay", "r_relay", "h_relay", "science", "medical", 
	"supply", "service", "vault", "ncr", "bos", "enclave", "town", "legion", "common", "command", "engineering", "security", "ranger", "khans",
	"receiverA", "receiverB", "broadcasterA", "broadcasterB")

/obj/machinery/telecomms/receiver/preset_right
	freq_listening = list(FREQ_COMMAND, FREQ_ENGINEERING, FREQ_SECURITY, FREQ_VAULT, FREQ_NCR, FREQ_BOS, FREQ_ENCLAVE, FREQ_DEN, FREQ_LEGION, FREQ_RANGER, FREQ_KHANS)

/obj/machinery/telecomms/server/presets/vault
	id = "Vault Server"
	freq_listening = list(FREQ_VAULT)
	autolinkers = list("vault")

/obj/machinery/telecomms/server/presets/ncr
	id = "NCR Server"
	freq_listening = list(FREQ_NCR)
	autolinkers = list("ncr")

/obj/machinery/telecomms/server/presets/bos
	id = "BOS Server"
	freq_listening = list(FREQ_BOS)
	autolinkers = list("bos")

/obj/machinery/telecomms/server/presets/enclave
	id = "Enclave Server"
	freq_listening = list(FREQ_ENCLAVE)
	autolinkers = list("enclave")

/obj/machinery/telecomms/server/presets/den
	id = "Town Server"
	freq_listening = list(FREQ_DEN)
	autolinkers = list("town")

/obj/machinery/telecomms/server/presets/legion
	id = "Legion Server"
	freq_listening = list(FREQ_LEGION)
	autolinkers = list("legion")

/obj/machinery/telecomms/server/presets/ranger
	id = "Ranger Server"
	freq_listening = list(FREQ_RANGER)
	autolinkers = list("ranger")

/obj/machinery/telecomms/server/presets/khans
	id = "Khans Server"
	freq_listening = list(FREQ_KHANS)
	autolinkers = list("khans")

// Encryption keys

/obj/item/encryptionkey/headset_vault
	name = "vault radio encryption key"
	desc = "An encryption key for a radio headset.  To access the vault channel, use :v."
	icon_state = "cypherkey"
	channels = list(RADIO_CHANNEL_VAULT = 1)

/obj/item/encryptionkey/headset_vault_security
	name = "\proper the Security encryption key"
	desc = "An encryption key for a radio headset.  Channels are as follows: :v - vault, :s - security."
	icon_state = "sec_cypherkey"
	channels = list(RADIO_CHANNEL_VAULT = 1, RADIO_CHANNEL_SECURITY = 1)

/obj/item/encryptionkey/headset_vault_science
	name = "\proper the Science encryption key"
	icon_state = "sci_cypherkey"
	channels = list(RADIO_CHANNEL_VAULT = 1, RADIO_CHANNEL_SCIENCE = 1)

/obj/item/encryptionkey/headset_vault_preacher
	name = "\proper the Preacher encryption key"
	icon_state = "cypherkey"
	channels = list(RADIO_CHANNEL_VAULT = 1, RADIO_CHANNEL_SERVICE = 1)

/obj/item/encryptionkey/headset_vault_merchant
	name = "\proper the Merchant encryption key"
	icon_state = "cypherkey"
	channels = list(RADIO_CHANNEL_VAULT = 1, RADIO_CHANNEL_SUPPLY = 1)

/obj/item/encryptionkey/headset_overseer
	name = "\proper the Overseer's encryption key"
	desc = "An encryption key for a radio headset.  Channels are as follows: c - command."
	icon_state = "cap_cypherkey"
	channels = list(RADIO_CHANNEL_COMMAND = 1)

/obj/item/encryptionkey/headset_vault_hos
	name = "\proper the Head of Security's encryption key"
	desc = "An encryption key for a radio headset.  Channels are as follows: :v - vault, :c - command, :s - security."
	icon_state = "hos_cypherkey"
	channels = list(RADIO_CHANNEL_VAULT = 1, RADIO_CHANNEL_COMMAND = 1, RADIO_CHANNEL_SECURITY = 1)

/obj/item/encryptionkey/headset_ncr
	name = "NCR radio encryption key"
	desc = "An encryption key for a radio headset.  To access the NCR channel, use :w."
	icon_state = "cypherkey"
	channels = list(RADIO_CHANNEL_NCR = 1)

/obj/item/encryptionkey/headset_ranger
	name = "Ranger radio encryption key"
	desc = "An encryption key for a radio headset. To access the NCR channel, use :w. To access the Ranger channel, use :r."
	icon_state = "cypherkey"
	channels = list(RADIO_CHANNEL_NCR = 1, RADIO_CHANNEL_RANGER = 1)

/obj/item/encryptionkey/headset_bos
	name = "Brotherhood radio encryption key"
	desc = "An encryption key for a radio headset.  To access the Enclave channel, use :q."
	icon_state = "cypherkey"
	channels = list(RADIO_CHANNEL_BOS = 1)

/obj/item/encryptionkey/headset_enclave
	name = "Enclave radio encryption key"
	desc = "An encryption key for a radio headset.  To access the Brotherhood channel, use :z."
	icon_state = "cypherkey"
	channels = list(RADIO_CHANNEL_ENCLAVE = 1)

/obj/item/encryptionkey/headset_den
	name = "Town radio encryption key"
	desc = "An encryption key for a radio headset.  To access the Town channel, use :f."
	icon_state = "cypherkey"
	channels = list(RADIO_CHANNEL_TOWN = 1)

/obj/item/encryptionkey/headset_legion
	name = "Legion radio encryption key"
	desc = "An encryption key for a radio headset.  To access the Legion channel, use :l."
	icon_state = "cypherkey"
	channels = list(RADIO_CHANNEL_LEGION = 1)

/obj/item/encryptionkey/headset_cent
	name = "\improper CentCom radio encryption key"
	desc = "An encryption key for a radio headset.  To access the CentCom channel, use :y."
	icon_state = "cent_cypherkey"
	independent = TRUE
	channels = list(RADIO_CHANNEL_CENTCOM = 1)

/obj/item/encryptionkey/headset_khans
	name = "Khan radio encryption key"
	desc = "An encryption key for a radio headset.  To access the Khan channel, use :j."
	icon_state = "cypherkey"
	channels = list(RADIO_CHANNEL_KHANS = 1)

/obj/item/encryptionkey/ai //ported from NT, this goes 'inside' the AI.
	channels = list(RADIO_CHANNEL_COMMAND = 1, RADIO_CHANNEL_SECURITY = 1, RADIO_CHANNEL_ENGINEERING = 1, RADIO_CHANNEL_SCIENCE = 1, RADIO_CHANNEL_MEDICAL = 1, RADIO_CHANNEL_SUPPLY = 1, RADIO_CHANNEL_SERVICE = 1, RADIO_CHANNEL_AI_PRIVATE = 1)

/obj/item/encryptionkey/secbot
	channels = list(RADIO_CHANNEL_AI_PRIVATE = 1, RADIO_CHANNEL_SECURITY = 1)

// Headsets
GLOBAL_LIST_INIT(channel_tokens, list(
	RADIO_CHANNEL_COMMON = RADIO_KEY_COMMON,
	RADIO_CHANNEL_SCIENCE = RADIO_TOKEN_SCIENCE,
	RADIO_CHANNEL_COMMAND = RADIO_TOKEN_COMMAND,
	RADIO_CHANNEL_MEDICAL = RADIO_TOKEN_MEDICAL,
	RADIO_CHANNEL_ENGINEERING = RADIO_TOKEN_ENGINEERING,
	RADIO_CHANNEL_SECURITY = RADIO_TOKEN_SECURITY,
	RADIO_CHANNEL_CENTCOM = RADIO_TOKEN_CENTCOM,
	RADIO_CHANNEL_SYNDICATE = RADIO_TOKEN_SYNDICATE,
	RADIO_CHANNEL_SUPPLY = RADIO_TOKEN_SUPPLY,
	RADIO_CHANNEL_SERVICE = RADIO_TOKEN_SERVICE,
	MODE_BINARY = MODE_TOKEN_BINARY,
	RADIO_CHANNEL_AI_PRIVATE = RADIO_TOKEN_AI_PRIVATE,
	RADIO_CHANNEL_VAULT = RADIO_TOKEN_VAULT,
	RADIO_CHANNEL_NCR = RADIO_TOKEN_NCR,
	RADIO_CHANNEL_BOS = RADIO_TOKEN_BOS,
	RADIO_CHANNEL_ENCLAVE = RADIO_TOKEN_ENCLAVE,
	RADIO_CHANNEL_TOWN = RADIO_TOKEN_TOWN,
	RADIO_CHANNEL_LEGION = RADIO_TOKEN_LEGION,
	RADIO_CHANNEL_RANGER = RADIO_TOKEN_RANGER,
	RADIO_CHANNEL_KHANS = RADIO_TOKEN_KHANS
))

/obj/item/radio/headset/headset_overseer
	name = "\proper the overseer's radio headset"
	desc = "This is used by the vault overseer.\nChannels are as follows: :v - vault, :c - command, :s - security, :e - engineering, :m - medical, :n - science."
	icon_state = "com_headset"
	keyslot = new /obj/item/encryptionkey/headset_overseer

/obj/item/radio/headset/headset_vault_hos
	name = "\proper the chief of security's radio headset"
	desc = "The headset of the man in charge of keeping order and protecting the vault.\nChannels are as follows: :v - vault, :c - command, :s - security."
	icon_state = "com_headset"
	keyslot = new /obj/item/encryptionkey/headset_vault_hos

/obj/item/radio/headset/headset_vault_hos/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(SLOT_EARS))

/obj/item/radio/headset/headset_vault
	name = "\proper vault radio headset"
	desc = "A vault-tec radio.\nChannels are as follows: :v - vault."
	keyslot = new /obj/item/encryptionkey/headset_vault

/obj/item/radio/headset/headset_vault/cogcity
	name = "\improper Cog City radio headset"
	bowman = TRUE

/obj/item/radio/headset/headset_vault/cogcity/sci
	name = "\improper Cog City science radio headset"
	icon_state = "sci_headset"
	keyslot = new /obj/item/encryptionkey/headset_vault_science

/obj/item/radio/headset/headset_vault/cogcity/sec
	name = "\improper Cog City security radio headset"
	icon_state = "sec_headset_alt"
	item_state = "sec_headset_alt"
	keyslot = new /obj/item/encryptionkey/headset_vault_security

/obj/item/radio/headset/headset_vault/cogcity/priest
	name = "\improper Cog City preacher radio headset"
	icon_state = "srv_headset"
	keyslot = new /obj/item/encryptionkey/headset_vault_preacher

/obj/item/radio/headset/headset_vault/cogcity/merch
	name = "\improper Cog City merchant radio headset"
	icon_state = "cargo_headset"
	keyslot = new /obj/item/encryptionkey/headset_vault_merchant

/obj/item/radio/headset/headset_vault/cogcity/overseer
	name = "\improper Cog City command radio headset"
	icon_state = "com_headset"
	keyslot = new /obj/item/encryptionkey/headset_vault
	keyslot2 = new /obj/item/encryptionkey/headset_overseer

/obj/item/radio/headset/headset_vault/cogcity/sec_lead
	name = "\improper Cog City security command radio headset"
	icon_state = "com_headset_alt"
	item_state = "com_headset_alt"
	keyslot = new /obj/item/encryptionkey/headset_vault_security
	keyslot2 = new /obj/item/encryptionkey/headset_overseer

/obj/item/radio/headset/headset_vault/cogcity/sci_lead
	name = "\improper Cog City research command radio headset"
	icon_state = "com_headset"
	keyslot = new /obj/item/encryptionkey/headset_vault_science
	keyslot2 = new /obj/item/encryptionkey/headset_overseer

/obj/item/radio/headset/headset_vault/cogcity/merch_lead
	name = "\improper Cog City merchant command radio headset"
	icon_state = "com_headset"
	keyslot = new /obj/item/encryptionkey/headset_vault_merchant
	keyslot2 = new /obj/item/encryptionkey/headset_overseer

/obj/item/radio/headset/headset_vault/followers
	name = "\improper Followers radio headset"
	keyslot = new /obj/item/encryptionkey/headset_vault
	keyslot2 = new /obj/item/encryptionkey/headset_med


/obj/item/radio/headset/headset_vaultsec
	name = "security radio headset"
	desc = "This is used by your elite security force.\nTo access the security channel, use :s. To access the vault channel, use :v."
	icon_state = "sec_headset"
	keyslot = new /obj/item/encryptionkey/headset_vault_security

/obj/item/radio/headset/headset_vaultsec/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(SLOT_EARS))

/obj/item/radio/headset/headset_vault_hos/alt
	name = "\proper the head of security's bowman headset"
	desc = "The headset of the man in charge of keeping order and protecting the station. Protects ears from flashbangs.\nTo access the security channel, use :s. For command, use :c. For vault, use :v."
	icon_state = "com_headset_alt"
	item_state = "com_headset_alt"

/obj/item/radio/headset/headset_ncr
	name = "NCR radio headset"
	desc = "This is used by the New California Republic.\nTo access the NCR channel, use :w."
	icon_state = "mine_headset"
	keyslot = new /obj/item/encryptionkey/headset_ncr

/obj/item/radio/headset/headset_ncr/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(SLOT_EARS))

/obj/item/radio/headset/headset_ranger
	name = "Ranger radio headset"
	desc = "This is used by the New California Republic.\nTo access the NCR channel, use :w. \nTo access the Ranger channel, use :r."
	icon_state = "mine_headset"
	keyslot = new /obj/item/encryptionkey/headset_ranger

/obj/item/radio/headset/headset_ranger/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(SLOT_EARS))

/obj/item/radio/headset/headset_ncr_com
	name = "NCR Command radio headset"
	desc = "This is used by the New California Republic.\nTo access the NCR channel, use :w. \nTo access the Ranger channel, use :r."
	icon_state = "com_headset_alt"
	item_state = "com_headset_alt"
	keyslot = new /obj/item/encryptionkey/headset_ranger

/obj/item/radio/headset/headset_ncr_com/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(SLOT_EARS))

/obj/item/radio/headset/headset_legion
	name = "Legion radio headset"
	desc = "This is used by Caesar's Legion.\nTo access the Legion channel, use :l."
	icon_state = "sec_headset"
	item_state = "headset_alt"
	keyslot = new /obj/item/encryptionkey/headset_legion

/obj/item/radio/headset/headset_legion/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(SLOT_EARS))

/obj/item/radio/headset/headset_bos
	name = "brotherhood radio headset"
	desc = "This is used by the brotherhood of steel.\nTo access the BOS channel, use :q."
	icon_state = "cent_headset"
	keyslot = new /obj/item/encryptionkey/headset_bos

/obj/item/radio/headset/headset_bos/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(SLOT_EARS))

/obj/item/radio/headset/headset_enclave
	name = "enclave radio headset"
	desc = "This is used by the enclave.\nTo access the enclave channel, use :z."
	icon_state = "sec_headset"
	keyslot = new /obj/item/encryptionkey/headset_enclave

/obj/item/radio/headset/headset_enclave/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(SLOT_EARS))

/obj/item/radio/headset/headset_khans
	name = "khan radio headset"
	desc = "This is used by the Khans.\nTo access the Khan channel, use :j."
	icon_state = "syndie_headset"
	keyslot = new /obj/item/encryptionkey/headset_khans

/obj/item/radio/headset/headset_khans/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(SLOT_EARS))

/obj/item/radio/headset/headset_den
	name = "town radio headset"
	desc = "This is used by the town.\nTo access the town channel, use :f."
	icon_state = "mine_headset"
	keyslot = new /obj/item/encryptionkey/headset_den

/obj/item/radio/headset/headset_cent
	name = "\improper Vault-Tec headset"
	desc = "A headset used by the upper echelons of Vault-Tec.\nTo access the Vault-Tec channel, use :y."
	icon_state = "cent_headset"
	keyslot = new /obj/item/encryptionkey/headset_com
	keyslot2 = new /obj/item/encryptionkey/headset_cent

/obj/item/radio/headset/headset_cent/empty
	keyslot = null
	keyslot2 = null

/obj/item/radio/headset/headset_cent/commander
	keyslot = new /obj/item/encryptionkey/heads/captain

/obj/item/radio/headset/headset_cent/alt
	name = "\improper Vault-Tec bowman headset"
	desc = "A headset especially for emergency response personnel. Protects ears from flashbangs.\nTo access the Vault-Tec channel, use :y."
	icon_state = "cent_headset_alt"
	item_state = "cent_headset_alt"
	keyslot = null

// Implant Radios
/obj/item/implant/radio/slime
	name = "super mutant radio"
	radio_key = null

/obj/item/implant/radio/slime/ncr
	radio_key = /obj/item/encryptionkey/headset_ncr

// Intercoms
/obj/item/radio/intercom/kebob
	name = "Oasis intercom"
