
//removed the generic large trash_list, split it into multiple categories
//this means you can create customizable loot tables for trash piles
GLOBAL_LIST_INIT(trash_food, list(
	/obj/item/reagent_containers/food/snacks/f13/bubblegum = 3,
	/obj/item/reagent_containers/food/snacks/f13/bubblegum/large = 3,
	/obj/item/reagent_containers/food/snacks/f13/cram = 3,
	/obj/item/reagent_containers/food/snacks/f13/cram/large = 3,
	/obj/item/reagent_containers/food/snacks/f13/yumyum = 3,
	/obj/item/reagent_containers/food/snacks/f13/fancylads = 3,
	/obj/item/reagent_containers/food/snacks/f13/sugarbombs = 3,
	/obj/item/reagent_containers/food/snacks/f13/crisps = 3,
	/obj/item/reagent_containers/food/snacks/f13/steak = 3,
	/obj/item/reagent_containers/food/snacks/f13/specialapples = 3,
	/obj/item/reagent_containers/food/snacks/f13/dandyapples = 3,
	/obj/item/reagent_containers/food/snacks/f13/blamco = 3,
	/obj/item/reagent_containers/food/snacks/f13/blamco/large = 3,
	/obj/item/reagent_containers/food/snacks/f13/mechanic = 3,
	/obj/item/reagent_containers/food/snacks/f13/instamash = 3,
	/obj/item/reagent_containers/food/snacks/f13/canned/porknbeans = 3,
	/obj/item/reagent_containers/food/snacks/f13/canned/borscht = 3,
	/obj/item/reagent_containers/food/snacks/f13/canned/dog = 3
))

GLOBAL_LIST_INIT(trash_part, list(
	/obj/item/stock_parts/cell = 5,
	/obj/item/stock_parts/capacitor/adv = 5,
	/obj/item/stock_parts/scanning_module/adv = 5,
	/obj/item/stock_parts/manipulator/nano = 5,
	/obj/item/stock_parts/micro_laser/high = 5,
	/obj/item/stock_parts/matter_bin/adv = 5,
	/obj/item/stock_parts/manipulator/pico = 3,
	/obj/item/stock_parts/matter_bin/super = 3,
	/obj/item/stock_parts/cell/high = 3
))

GLOBAL_LIST_INIT(trash_clothing, list(
	/obj/item/clothing/glasses/sunglasses/big = 5,
	/obj/item/clothing/glasses/sunglasses = 5,
	/obj/item/clothing/glasses/eyepatch = 5,
	/obj/item/clothing/head/helmet/knight/f13/rider = 5,
	/obj/item/clothing/shoes/f13/cowboy = 5,
	/obj/item/clothing/shoes/f13/explorer = 5,
	/obj/item/clothing/shoes/f13/diesel = 5,
	/obj/item/clothing/shoes/f13/diesel/alt = 5,
	/obj/item/clothing/gloves/f13/leather = 5,
	/obj/item/clothing/gloves/f13/military = 5,
	/obj/item/clothing/gloves/f13/leather/fingerless = 5,
	/obj/item/clothing/shoes/f13/tan = 5,
	/obj/item/clothing/suit/armor/f13/punk = 5,
	/obj/item/clothing/suit/armor/f13/kit = 5,
	/obj/item/clothing/head/welding = 5
))

GLOBAL_LIST_INIT(trash_ammo, list(
	/obj/item/ammo_box/a308box = 3,
	/obj/item/ammo_box/a556/sport = 3,
	/obj/item/ammo_box/magazine/m45 = 3,
	/obj/item/ammo_box/magazine/m10mm_adv/simple = 3,
	/obj/item/ammo_box/magazine/m9mm = 3,
	/obj/item/ammo_casing/shotgun/buckshot = 3,
	/obj/item/ammo_box/c45rev = 3,
	/datum/design/ammolathe/a22plink
))

GLOBAL_LIST_INIT(trash_chem, list(
	/obj/item/storage/pill_bottle/chem_tin/f13/mentats = 5,
	/obj/item/storage/pill_bottle/chem_tin/f13/fixer = 5,
	/obj/item/storage/pill_bottle/chem_tin/f13/radx = 5,
	/obj/item/reagent_containers/food/drinks/bottle/orangejuice = 10,
	/obj/item/reagent_containers/food/drinks/bottle/cognac = 10,
	/obj/item/reagent_containers/food/drinks/bottle/whiskey = 10,
	/obj/item/reagent_containers/hypospray/medipen/f13/psycho = 5,
	/obj/item/reagent_containers/pill/patch/f13/healingpowder = 5
))

GLOBAL_LIST_INIT(trash_craft, list(
	/obj/item/crafting/duct_tape = 5,
	/obj/item/crafting/abraxo = 5,
	/obj/item/stack/crafting/metalparts/three = 5,
	/obj/item/stack/crafting/electronicparts/three = 5,
	/obj/item/stack/crafting/goodparts = 5
))

GLOBAL_LIST_INIT(trash_gun, list(
	/obj/item/gun/ballistic/automatic/pistol/ninemil = 1,
	/obj/item/gun/ballistic/revolver/colt6520 = 1,
	/obj/item/gun/ballistic/rifle/enfield = 1,
	/obj/item/gun/ballistic/automatic/pistol/n99 = 1,
	/obj/item/gun/ballistic/automatic/pistol/pistol22 = 1,
	/obj/item/gun/ballistic/revolver/widowmaker = 1
))

GLOBAL_LIST_INIT(trash_money, list(
	/obj/item/stack/f13Cash/random/low = 10,
	/obj/item/stack/f13Cash/random/med = 20,
	/obj/item/stack/f13Cash/random/high = 5,
	/obj/item/stack/f13Cash/random/ncr/med = 10,
	/obj/item/stack/f13Cash/random/ncr/med = 20,
	/obj/item/stack/f13Cash/random/ncr/high = 5,
	/obj/item/stack/f13Cash/random/denarius/low = 10,
	/obj/item/stack/f13Cash/random/denarius/med = 20,
	/obj/item/stack/f13Cash/random/denarius/high = 5,
	/obj/item/stack/f13Cash/random/aureus/low = 5,
	/obj/item/stack/f13Cash/random/aureus/med = 10,
	/obj/item/stack/f13Cash/random/aureus/high = 5
))

GLOBAL_LIST_INIT(trash_tool, list(
	/obj/item/geiger_counter = 5,
	/obj/item/cultivator = 5,
	/obj/item/shovel/spade = 5,
	/obj/item/hatchet = 5,
	/obj/item/scalpel = 5,
	/obj/item/circular_saw = 5,
	/obj/item/surgicaldrill = 5,
	/obj/item/retractor = 5,
	/obj/item/cautery = 5,
	/obj/item/hemostat = 5,
	/obj/item/crowbar = 5,
	/obj/item/flashlight = 5,
	/obj/item/extinguisher = 5,
	/obj/item/multitool = 5,
	/obj/item/analyzer = 5,
	/obj/item/t_scanner = 5,
	/obj/item/weldingtool = 5,
	/obj/item/screwdriver = 5,
	/obj/item/wirecutters = 5,
	/obj/item/wrench = 5,
	/obj/item/stack/cable_coil/random = 5,
	/obj/item/radio/off = 5
))

GLOBAL_LIST_INIT(trash_misc, list(
	/obj/item/pipe = 5,
	/obj/item/trash/f13/electronic/toaster = 5,
	/obj/item/reagent_containers/glass/bucket = 5,
	/obj/item/kitchen/knife = 5,
	/obj/item/kitchen/fork = 5,
	/obj/item/storage/bag/tray = 5,
	/obj/item/reagent_containers/glass/bowl = 5,
	/obj/item/reagent_containers/food/drinks/drinkingglass = 5,
	/obj/item/reagent_containers/food/drinks/drinkingglass/shotglass = 5,
	/obj/item/reagent_containers/glass/beaker = 5,
	/obj/item/reagent_containers/glass/beaker/large = 5,
	/obj/item/taperecorder/empty = 5,
	/obj/item/light/tube = 5,
	/obj/item/light/bulb = 5,
	/obj/item/reagent_containers/syringe = 5,
	/obj/item/restraints/handcuffs = 5,
	/obj/item/crafting/reloader = 5,
	/obj/item/crafting/lunchbox = 5,
	/obj/item/kitchen/knife/butcher = 5,
	/obj/item/toy/crayon/spraycan = 5
))

GLOBAL_LIST_INIT(loot_prewar_clothing, list(
	/obj/item/clothing/under/misc/overalls,
	/obj/item/clothing/head/flatcap,
	/obj/item/clothing/under/dress/skirt/plaid/green,
	/obj/item/clothing/under/dress/skirt/plaid/purple,
	/obj/item/clothing/under/dress/blacktango,
	/obj/item/clothing/under/dress/redeveninggown,
	/obj/item/clothing/under/rank/civilian/janitor/maid,
	/obj/item/clothing/suit/jacket/leather,
	/obj/item/clothing/gloves/fingerless,
	/obj/item/clothing/suit/jacket/puffer/vest,
	/obj/item/clothing/under/pants/jeans,
	/obj/item/clothing/neck/mantle/gray,
	/obj/item/clothing/under/suit/charcoal,
	/obj/item/clothing/head/that,
	/obj/item/clothing/under/suit/checkered,
	/obj/item/clothing/under/suit/burgundy,
	/obj/item/clothing/neck/mantle/brown,
	/obj/item/clothing/under/suit/white_on_white,
	/obj/item/clothing/shoes/sneakers/white,
	/obj/item/clothing/head/beanie/black,
	/obj/item/clothing/suit/hooded/chaplain_hoodie,
	/obj/item/clothing/under/pants/camo,
	/obj/item/clothing/neck/apron/bartender,
	/obj/item/clothing/under/rank/civilian/bartender/purple,
	/obj/item/clothing/under/dress/skirt/plaid/blue,
	/obj/item/clothing/under/dress/skirt/plaid,
	/obj/item/clothing/under/suit/navy,
	/obj/item/clothing/under/suit/black/skirt,
	/obj/item/clothing/under/f13/erpdress,
	/obj/item/clothing/shoes/laceup
))

GLOBAL_LIST_INIT(loot_prewar_costume, list(
	/obj/item/clothing/head/ushanka,
	/obj/item/clothing/under/costume/soviet,
	/obj/item/clothing/neck/mantle/gray,
	/obj/item/clothing/under/costume/geisha,
	/obj/item/clothing/shoes/sandal,
	/obj/item/clothing/under/dress/blacktango,
	/obj/item/clothing/under/dress/redeveninggown,
	/obj/item/clothing/head/sombrero,
	/obj/item/clothing/neck/mantle/poncho,
	/obj/item/clothing/under/costume/sailor,
	/obj/item/clothing/under/costume/schoolgirl/red,
	/obj/item/clothing/under/costume/schoolgirl,
	/obj/item/clothing/head/f13/bandit,
	/obj/item/clothing/head/f13/gambler,
	/obj/item/clothing/under/costume/jabroni,
	/obj/item/clothing/glasses/sunglasses/blindfold,
	/obj/item/clothing/under/costume/gladiator,
	/obj/item/clothing/shoes/roman,
	/obj/item/clothing/under/costume/maid,
	/obj/item/clothing/under/costume/draculass,
	/obj/item/clothing/neck/mantle/gray,
	/obj/item/clothing/under/costume/kilt,
	/obj/item/clothing/under/costume/pirate,
	/obj/item/clothing/suit/pirate
))

GLOBAL_LIST_INIT(loot_t1_armor, list(
	/obj/item/clothing/suit/armor/f13/leather_jacket,
	/obj/item/clothing/suit/armor/f13/kit,
	/obj/item/clothing/suit/armor/f13/raider/supafly,
	/obj/item/clothing/head/helmet/f13/raider,
	/obj/item/clothing/suit/armor/f13/raider/sadist,
	/obj/item/clothing/head/helmet/f13/raider/arclight,
	/obj/item/clothing/suit/armor/f13/raider/blastmaster,
	/obj/item/clothing/head/helmet/f13/raider/blastmaster,
	/obj/item/clothing/suit/armor/f13/raider/yankee,
	/obj/item/clothing/head/helmet/f13/raider/yankee,
	/obj/item/clothing/head/helmet/f13/fiend,
	/obj/item/clothing/suit/armor/f13/raider/painspike,
	/obj/item/clothing/head/helmet/f13/raider/psychotic,
	/obj/item/clothing/suit/armor/f13/raider/supafly,
	/obj/item/clothing/head/helmet/f13/raider,
	/obj/item/clothing/suit/f13/duster,
	/obj/item/clothing/suit/armor/f13/raider/iconoclast
))

GLOBAL_LIST_INIT(loot_t2_armor, list(
	/obj/item/clothing/suit/armor/f13/metalarmor,
	/obj/item/clothing/head/helmet/knight/f13/metal,
	/obj/item/clothing/suit/armor/f13/metalarmor,
	/obj/item/clothing/head/helmet/f13/metalmask,
	/obj/item/clothing/suit/armor/f13/leatherarmor,
	/obj/item/clothing/suit/armor/f13/leather_jacket/combat,
	/obj/item/clothing/suit/armor/f13/leather_jacket/combat/coat
))

GLOBAL_LIST_INIT(loot_t3_armor, list(
	/obj/item/clothing/suit/armor/f13/metalarmor/reinforced,
	/obj/item/clothing/head/helmet/f13/metalmask/mk2,
	/obj/item/clothing/suit/armor/f13/leather_jacket/combat/coat,
	/obj/item/clothing/head/helmet/f13/combat/swat,
	/obj/item/clothing/suit/armor/f13/combat/swat,
	/obj/item/clothing/suit/armor/f13/combat,
	/obj/item/clothing/head/helmet/f13/combat,
	/obj/item/clothing/suit/armor/bulletproof,
	/obj/item/clothing/head/helmet/alt,
	/obj/item/clothing/suit/armor/f13/combat/dark,
	/obj/item/clothing/head/helmet/f13/combat/dark,
	/obj/item/clothing/suit/armor/f13/combat/mk2/dark,
	/obj/item/clothing/head/helmet/f13/combat/mk2/dark,
	/obj/item/clothing/suit/armor/f13/sulphitearmor,
	/obj/item/clothing/head/helmet/f13/sulphitehelm
))

GLOBAL_LIST_INIT(loot_t4_armor, list(
	/obj/item/clothing/head/helmet/f13/power_armor/t45b,
	/obj/item/clothing/suit/armor/f13/power_armor/t45b,
	/obj/item/clothing/suit/armor/f13/leather_jacket/combat/riotpolice,
	/obj/item/clothing/head/helmet/f13/rangerbroken,
	/obj/item/clothing/suit/armor/f13/combat/mk2,
	/obj/item/clothing/head/helmet/f13/combat/mk2,
	/obj/item/clothing/suit/armor/f13/power_armor/raiderpa,
	/obj/item/clothing/head/helmet/f13/power_armor/raiderpa_helm,
	/obj/item/clothing/suit/armor/f13/power_armor/hotrod,
	/obj/item/clothing/head/helmet/f13/power_armor/hotrod
))

GLOBAL_LIST_INIT(loot_t5_armor, list(
	/obj/item/clothing/suit/armor/f13/power_armor/t45d,
	/obj/item/clothing/head/helmet/f13/power_armor/t45d,
	/obj/item/clothing/suit/armor/f13/power_armor/t51b,
	/obj/item/clothing/head/helmet/f13/power_armor/t51b
))

GLOBAL_LIST_INIT(loot_medical_tool, list(
	/obj/item/hemostat,
	/obj/item/surgicaldrill,
	/obj/item/retractor,
	/obj/item/cautery,
	/obj/item/scalpel,
	/obj/item/clothing/suit/hooded/f13/surgical,
	/obj/item/clothing/gloves/color/latex,
	/obj/item/clothing/mask/surgical,
	/obj/item/surgical_drapes,
	/obj/item/circular_saw
))

GLOBAL_LIST_INIT(loot_medical_medicine, list(
	/obj/item/reagent_containers/pill/patch/f13/healingpowder,
	/obj/item/storage/pill_bottle/chem_tin/f13/radx,
	/obj/item/reagent_containers/blood/radaway,
	/obj/item/storage/pill_bottle/chem_tin/f13/mentats,
	/obj/item/storage/pill_bottle/chem_tin/f13/fixer,
	/obj/item/reagent_containers/hypospray/medipen/f13/stimpak,
	/obj/item/reagent_containers/medspray/styptic,
	/obj/item/reagent_containers/medspray/silver_sulf,
	/obj/item/reagent_containers/medspray/sterilizine
))

GLOBAL_LIST_INIT(loot_medical_drug, list(
	/obj/item/reagent_containers/pill/patch/f13/jet,
	/obj/item/reagent_containers/pill/patch/f13/turbo,
	/obj/item/reagent_containers/pill/patch/f13/healingpowder,
	/obj/item/reagent_containers/pill/stimulant,
	/obj/item/reagent_containers/hypospray/medipen/f13/medx
))

GLOBAL_LIST_INIT(loot_t1_melee, list(
	/obj/item/crowbar,
	/obj/item/extinguisher,
	/obj/item/hatchet,
	/obj/item/pickaxe/mini,
	/obj/item/wrench,
	/obj/item/kitchen/knife,
	/obj/item/kitchen/rollingpin,
))

GLOBAL_LIST_INIT(loot_t2_melee, list(
	/obj/item/gavelhammer,
	/obj/item/oar,
	/obj/item/pickaxe,
	/obj/item/shovel,
	/obj/item/switchblade,
	/obj/item/throwing_star/spear,
	/obj/item/surgicaldrill,
	/obj/item/kitchen/knife/combat,
	/obj/item/kitchen/knife/combat/survival,
	/obj/item/kitchen/knife/combat/bone,
	/obj/item/instrument/guitar,
	/obj/item/instrument/violin,
	/obj/item/instrument/saxophone,
	/obj/item/claymore/machete/pipe,
	/obj/item/kitchen/knife/cosmicdirty,
	/obj/item/melee/unarmed/brass,
	/obj/item/melee/unarmed/brass/spiked
))

GLOBAL_LIST_INIT(loot_t3_melee, list(
	/obj/item/weldingtool,
	/obj/item/twohanded/spear,
	/obj/item/bostaff,
	/obj/item/twohanded/baseball,
	/obj/item/kitchen/knife/butcher,
	/obj/item/claymore/machete/golf,
	/obj/item/claymore/machete,
	/obj/item/claymore/machete/reinforced,
	/obj/item/shield/legion/buckler,
	/obj/item/melee/unarmed/tigerclaw,
	/obj/item/melee/unarmed/bladed,
	/obj/item/melee/unarmed/sappers
))

GLOBAL_LIST_INIT(loot_t4_melee, list(
	/obj/item/twohanded/fireaxe,
	/obj/item/twohanded/sledgehammer,
	/obj/item/twohanded/fireaxe/bmprsword,
	/obj/item/melee/unarmed/lacerator,
	/obj/item/melee/unarmed/maceglove,
	/obj/item/melee/unarmed/punchdagger,
	/obj/item/shield/riot
))

GLOBAL_LIST_INIT(loot_t5_melee, list(
	/obj/item/twohanded/thermic_lance,
	/obj/item/twohanded/chainsaw,
	/obj/item/kinetic_crusher,
	/obj/item/nullrod/claymore/chainsaw_sword,
	/obj/item/melee/powerfist,
	/obj/item/melee/transforming/energy/axe,
	/obj/item/gun/ballistic/revolver/ballisticfist,
	/obj/item/twohanded/sledgehammer/supersledge,
	/obj/item/shishkebabpack,
	/obj/item/melee/unarmed/deathclawgauntlet,
	/obj/item/melee/powerfist/moleminer
))

GLOBAL_LIST_INIT(loot_t1_range, list(
	/obj/item/gun/ballistic/revolver/single_shotgun,
	/obj/item/ammo_box/shotgun/bean,
	/obj/item/gun/ballistic/revolver/caravan_shotgun,
	/obj/item/ammo_box/shotgun/bean,
	/obj/item/gun/ballistic/rifle/enfield,
	/obj/item/ammo_box/a762,
	/obj/item/gun/ballistic/revolver/zipgun,
	/obj/item/gun/ballistic/revolver/pipe_rifle,
	/obj/item/gun/ballistic/rifle/remington,
	/obj/item/ammo_box/a308,
	/obj/item/gun/ballistic/automatic/pistol/n99,
	/obj/item/ammo_box/magazine/m10mm_adv/simple,
	/obj/item/gun/ballistic/automatic/pistol/m1911,
	/obj/item/ammo_box/magazine/m45,
	/obj/item/gun/ballistic/automatic/pistol/ninemil,
	/obj/item/ammo_box/magazine/m9mm,
	/obj/item/gun/ballistic/revolver/colt6520,
	/obj/item/ammo_box/magazine/m10mm_adv/simple,
	/obj/item/gun/ballistic/rifle/mag/varmint,
	/obj/item/ammo_box/magazine/m556/rifle/small
))

GLOBAL_LIST_INIT(loot_t2_range, list(
	/obj/item/gun/ballistic/shotgun/hunting,
	/obj/item/ammo_box/shotgun/buck,
	/obj/item/gun/ballistic/revolver/m29,
	/obj/item/ammo_box/m44,
	/obj/item/ammo_box/a308,
	/obj/item/ammo_box/m44,
	/obj/item/gun/ballistic/rifle/automatic/hunting/cowboy,
	/obj/item/ammo_box/a357,
	/obj/item/ammo_box/a357,
	/obj/item/gun/ballistic/revolver/colt357,
	/obj/item/ammo_box/a357,
	/obj/item/gun/ballistic/automatic/service,
	/obj/item/ammo_box/magazine/m556/rifle,
	/obj/item/gun/ballistic/revolver/police,
	/obj/item/ammo_box/a357,
	/obj/item/gun/energy/laser/pistol,
	/obj/item/stock_parts/cell/ammo/ec,
	/obj/item/gun/ballistic/automatic/m1carbine,
	/obj/item/ammo_box/magazine/m10mm_adv/simple,
	/obj/item/gun/ballistic/rifle/mag/commando,
	/obj/item/ammo_box/magazine/m45
))

GLOBAL_LIST_INIT(loot_t3_range, list(
	/obj/item/gun/ballistic/automatic/mini_uzi,
	/obj/item/ammo_box/magazine/uzim9mm,
	/obj/item/gun/ballistic/automatic/smg10mm,
	/obj/item/ammo_box/magazine/m10mm_adv/ext,
	/obj/item/gun/ballistic/automatic/smg/greasegun,
	/obj/item/ammo_box/magazine/greasegun,
	/obj/item/gun/ballistic/shotgun/trench,
	/obj/item/ammo_box/shotgun/buck,
	/obj/item/gun/energy/laser/wattz,
	/obj/item/stock_parts/cell/ammo/ec,
	/obj/item/gun/ballistic/revolver/needler,
	/obj/item/ammo_box/needle,
	/obj/item/gun/ballistic/rifle/automatic/hunting/trail,
	/obj/item/ammo_box/tube/m44,
	/obj/item/ammo_box/tube/m44,
	/obj/item/gun/energy/laser/aer9,
	/obj/item/stock_parts/cell/ammo/mfc
))

GLOBAL_LIST_INIT(loot_t4_range, list(
	/obj/item/gun/ballistic/automatic/assault_rifle,
	/obj/item/ammo_box/magazine/m556/rifle/assault,
	/obj/item/gun/ballistic/automatic/marksman,
	/obj/item/ammo_box/magazine/m556/rifle,
	/obj/item/gun/ballistic/automatic/pistol/deagle,
	/obj/item/ammo_box/magazine/m44,
	/obj/item/gun/energy/laser/rcw,
	/obj/item/stock_parts/cell/ammo/ecp,
	/obj/item/gun/energy/laser/plasma/pistol,
	/obj/item/stock_parts/cell/ammo/ec,
	/obj/item/gun/energy/laser/aer9,
	/obj/item/stock_parts/cell/ammo/mfc,
	/obj/item/gun/ballistic/automatic/assault_rifle/infiltrator,
	/obj/item/ammo_box/magazine/m556/rifle,
	/obj/item/gun/ballistic/rifle/automatic/hunting/brush,
	/obj/item/ammo_box/tube/c4570,
	/obj/item/ammo_box/tube/c4570,
	/obj/item/gun/ballistic/rifle/mag/antimateriel,
	/obj/item/ammo_box/a50MG,
	/obj/item/gun/ballistic/automatic/rangemaster,
	/obj/item/ammo_box/magazine/m762,
	/obj/item/ammo_box/magazine/d12g,
	/obj/item/gun/energy/ionrifle,
	/obj/item/stock_parts/cell/ammo/mfc,
	/obj/item/gun/energy/laser/plasma/glock,
	/obj/item/stock_parts/cell/ammo/ec,
	/obj/item/gun/medbeam
))

GLOBAL_LIST_INIT(loot_t5_range, list(
	/obj/item/gun/energy/laser/plasma,
	/obj/item/gun/ballistic/automatic/smg/tommygun,
	/obj/item/gun/ballistic/automatic/shotgun/riot,
	/obj/item/gun/energy/laser/scatter,
	/obj/item/gun/ballistic/revolver/hunting,
	/obj/item/gun/ballistic/automatic/bozar,
	/obj/item/gun/energy/gammagun
))

GLOBAL_LIST_INIT(loot_unique_range, list(
	/obj/item/gun/ballistic/revolver/colt357/lucky,
	/obj/item/gun/ballistic/automatic/pistol/ninemil/maria,
	/obj/item/gun/ballistic/rifle/remington/paciencia,
	/obj/item/gun/energy/laser/solar,
	/obj/item/gun/energy/laser/plasma/alien
))

GLOBAL_LIST_INIT(loot_t1_ammo, list(
	/obj/item/ammo_box/magazine/m9mm,
	/obj/item/ammo_box/shotgun/buck,
	/obj/item/ammo_box/shotgun/bean,
	/obj/item/ammo_box/magazine/m10mm_adv/simple,
	/obj/item/ammo_box/magazine/m556/rifle/small
))

GLOBAL_LIST_INIT(loot_t2_ammo, list(
	/obj/item/ammo_box/magazine/m45,
	/obj/item/ammo_box/a762,
	/obj/item/ammo_box/a308,
	/obj/item/ammo_box/magazine/m10mm_adv/simple,
	/obj/item/ammo_box/magazine/m556/rifle,
	/obj/item/ammo_box/magazine/m9mm,
	/obj/item/ammo_box/m44,
	/obj/item/ammo_box/tube/a357,
	/obj/item/ammo_box/a357,
	/obj/item/ammo_box/magazine/m556/rifle/small
))

GLOBAL_LIST_INIT(loot_t3_ammo, list(
	/obj/item/ammo_box/shotgun/buck,
	/obj/item/ammo_box/magazine/uzim9mm,
	/obj/item/ammo_box/magazine/m10mm_adv/simple,
	/obj/item/ammo_box/magazine/greasegun,
	/obj/item/ammo_box/needle,
	/obj/item/ammo_box/magazine/tommygunm45,
	/obj/item/ammo_box/tube/m44,
	/obj/item/ammo_box/magazine/m10mm_adv/ext,
	/obj/item/stock_parts/cell/ammo/ec
))

GLOBAL_LIST_INIT(loot_t4_ammo, list(
	/obj/item/ammo_box/magazine/d12g,
	/obj/item/ammo_box/magazine/m44,
	/obj/item/ammo_box/magazine/m556/rifle,
	/obj/item/ammo_box/c4570,
	/obj/item/ammo_box/tube/c4570,
	/obj/item/ammo_box/a50MG,
	/obj/item/ammo_box/a762/doublestacked,
	/obj/item/stock_parts/cell/ammo/mfc
))

GLOBAL_LIST_INIT(loot_t5_ammo, list(
	/obj/item/ammo_box/a50MG,
	/obj/item/ammo_box/a50MG/incendiary,
	/obj/item/ammo_box/magazine/m556/rifle/extended,
	/obj/item/ammo_box/magazine/m762/ext,
	/obj/item/ammo_box/magazine/d12g
))

GLOBAL_LIST_INIT(loot_garbage, list(
	/obj/item/broken_bottle,
	/obj/item/poster/random_official,
	/obj/item/multitool,
	/obj/item/cigbutt/cigarbutt,
	/obj/item/razor,
	/obj/item/candle,
	/obj/item/rollingpaper,
	/obj/item/trash/coal,
	/obj/item/soap/homemade,
	/obj/item/bikehorn,
	/obj/item/stack/cable_coil/random,
	/obj/item/stack/medical/bruise_pack,
	/obj/item/trash/popcorn,
	/obj/item/valentine,
	/obj/item/taperecorder,
	/obj/item/bikehorn/airhorn,
	/obj/item/tape/random,
	/obj/item/stack/medical/gauze,
	/obj/item/trash/plate,
	/obj/item/storage/box/snappops,
	/obj/item/bikehorn/rubberducky,
	/obj/item/stack/packageWrap,
	/obj/item/storage/box/matches,
	/obj/item/reagent_containers/food/snacks/deadmouse,
	/obj/item/toner,
	/obj/item/tank/internals/oxygen,
	/obj/item/storage/box/papersack,
	/obj/item/storage/box/lights/mixed,
	/obj/item/storage/box/beakers,
	/obj/item/storage/belt/fannypack/black,
	/obj/item/camera,
	/obj/item/bodypart/l_arm,
	/obj/item/toy/dummy,
	/obj/item/toy/eightball,
	/obj/item/toy/cards/deck,
	/obj/item/trash/tray,
	/obj/item/toy/xmas_cracker,
	/obj/item/reagent_containers/glass/bowl,
	/obj/item/reagent_containers/spray/cleaner,
	/obj/item/reagent_containers/glass/bucket,
	/obj/item/poster/random_contraband
))

GLOBAL_LIST_INIT(loot_seed, list(
	/obj/item/seeds/ambrosia,
	/obj/item/seeds/apple,
	/obj/item/seeds/banana,
	/obj/item/seeds/cotton,
	/obj/item/seeds/berry,
	/obj/item/seeds/poppy/broc,
	/obj/item/seeds/cabbage,
	/obj/item/seeds/carrot,
	/obj/item/seeds/carrot/parsnip,
	/obj/item/seeds/cherry,
	/obj/item/seeds/chanterelle,
	/obj/item/seeds/chili,
	/obj/item/seeds/cocoapod,
	/obj/item/seeds/coffee,
	/obj/item/seeds/corn,
	/obj/item/seeds/eggplant,
	/obj/item/seeds/grape,
	/obj/item/seeds/grass,
	/obj/item/seeds/lemon,
	/obj/item/seeds/lime,
	/obj/item/seeds/onion,
	/obj/item/seeds/orange,
	/obj/item/seeds/rainbow_bunch,
	/obj/item/seeds/pineapple,
	/obj/item/seeds/potato,
	/obj/item/seeds/poppy,
	/obj/item/seeds/pumpkin,
	/obj/item/seeds/wheat/rice,
	/obj/item/seeds/soya,
	/obj/item/seeds/sugarcane,
	/obj/item/seeds/sunflower,
	/obj/item/seeds/tea,
	/obj/item/seeds/tobacco,
	/obj/item/seeds/tomato,
	/obj/item/seeds/tower,
	/obj/item/seeds/watermelon,
	/obj/item/seeds/wheat,
	/obj/item/seeds/whitebeet,
	/obj/item/seeds/xander,
	/obj/item/seeds/mutfruit,
	/obj/item/seeds/amanita,
	/obj/item/seeds/glowshroom,
	/obj/item/seeds/liberty,
	/obj/item/seeds/nettle,
	/obj/item/seeds/plump,
	/obj/item/seeds/reishi,
	/obj/item/seeds/cannabis,
	/obj/item/seeds/starthistle,
	/obj/item/seeds/random
))

GLOBAL_LIST_INIT(loot_food, list(
	/obj/item/storage/box/ingredients/american,
	/obj/item/reagent_containers/food/snacks/f13/crisps,
	/obj/item/reagent_containers/food/snacks/f13/crisps,
	/obj/item/reagent_containers/food/snacks/f13/bubblegum,
	/obj/item/reagent_containers/food/snacks/f13/cram,
	/obj/item/reagent_containers/food/snacks/f13/yumyum,
	/obj/item/reagent_containers/food/snacks/f13/fancylads,
	/obj/item/reagent_containers/food/snacks/f13/sugarbombs,
	/obj/item/reagent_containers/food/snacks/cheesiehonkers,
	/obj/item/reagent_containers/food/snacks/f13/steak,
	/obj/item/reagent_containers/food/snacks/f13/dandyapples,
	/obj/item/reagent_containers/food/snacks/f13/blamco,
	/obj/item/reagent_containers/food/snacks/f13/instamash ,
	/obj/item/reagent_containers/food/snacks/f13/canned/porknbeans,
	/obj/item/storage/box/ingredients/carnivore,
	/obj/item/storage/box/ingredients/delights,
	/obj/item/storage/box/ingredients/exotic,
	/obj/item/storage/box/ingredients/fiesta,
	/obj/item/storage/box/ingredients/fruity,
	/obj/item/storage/box/ingredients/grains,
	/obj/item/storage/box/ingredients/italian,
	/obj/item/storage/box/ingredients/sweets,
	/obj/item/storage/box/ingredients/vegetarian,
	/obj/item/storage/box/ingredients/wildcard,
	/obj/item/reagent_containers/food/condiment/flour,
	/obj/item/reagent_containers/food/condiment/rice,
	/obj/item/reagent_containers/food/condiment/yeast,
	/obj/item/reagent_containers/food/condiment/soymilk,
	/obj/item/reagent_containers/food/condiment/ketchup,
	/obj/item/reagent_containers/food/condiment/sugar,
	/obj/item/reagent_containers/food/condiment/milk,
	/obj/item/reagent_containers/food/condiment/saltshaker,
	/obj/item/reagent_containers/food/condiment/peppermill,
	/obj/item/reagent_containers/food/condiment/soysauce,
	/obj/item/reagent_containers/food/snacks/beans,
	/obj/item/reagent_containers/food/snacks/cracker,
	/obj/item/reagent_containers/food/snacks/lollipop,
))

GLOBAL_LIST_INIT(loot_craft_basic, list(
	/obj/item/crafting/abraxo,
	/obj/item/stack/crafting/metalparts/three,
	/obj/item/stack/crafting/metalparts/five,
	/obj/item/stack/crafting/goodparts/three,
	/obj/item/stack/crafting/goodparts/five,
	/obj/item/stack/crafting/electronicparts/three,
	/obj/item/stack/crafting/electronicparts/five,
	/obj/item/reagent_containers/glass/bottle/blackpowder,
	/obj/item/crafting/wonderglue,
	/obj/item/crafting/duct_tape
))

GLOBAL_LIST_INIT(loot_alcohol, list(
	/obj/item/reagent_containers/food/drinks/beer,
	/obj/item/reagent_containers/food/drinks/ale,
	/obj/item/reagent_containers/food/drinks/bottle/gin,
	/obj/item/reagent_containers/food/drinks/bottle/hcider,
	/obj/item/reagent_containers/food/drinks/bottle/whiskey,
	/obj/item/reagent_containers/food/drinks/bottle/vodka,
	/obj/item/reagent_containers/food/drinks/bottle/tequila,
	/obj/item/reagent_containers/food/drinks/bottle/rum,
	/obj/item/reagent_containers/food/drinks/bottle/vermouth,
	/obj/item/reagent_containers/food/drinks/bottle/kahlua,
	/obj/item/reagent_containers/food/drinks/bottle/cognac,
	/obj/item/reagent_containers/food/drinks/bottle/wine,
	/obj/item/reagent_containers/food/drinks/bottle/absinthe,
	/obj/item/reagent_containers/food/drinks/bottle/lizardwine,
	/obj/item/reagent_containers/food/drinks/bottle/hcider,
	/obj/item/reagent_containers/food/drinks/bottle/grappa,
	/obj/item/reagent_containers/food/drinks/bottle/sake,
	/obj/item/reagent_containers/food/drinks/bottle/fernet
))

GLOBAL_LIST_INIT(loot_material, list(
	/obj/item/stack/rods/ten,
	/obj/item/stack/sheet/metal/ten,
	/obj/item/stack/sheet/cardboard/fifty,
	/obj/item/stack/sheet/cardboard/twenty,
	/obj/item/stack/sheet/glass/ten,
	/obj/item/stack/sheet/metal/five,
	/obj/item/stack/sheet/plasteel/five,
	/obj/item/stack/sheet/plastic/five,
	/obj/item/stack/sheet/paperframes/twenty,
	/obj/item/stack/sheet/cloth/ten,
	/obj/item/stack/crafting/metalparts/five,
	/obj/item/stack/crafting/goodparts/three
))

GLOBAL_LIST_INIT(loot_t1_money, list(
	/obj/item/stack/f13Cash/random/low,
	/obj/item/stack/f13Cash/random/ncr/low,
	/obj/item/stack/f13Cash/random/denarius/low,
	/obj/item/stack/f13Cash/random/aureus/low,
	/obj/item/stack/f13Cash/random/bawls/low
))

GLOBAL_LIST_INIT(loot_t2_money, list(
	/obj/item/stack/f13Cash/random/med,
	/obj/item/stack/f13Cash/random/ncr/med,
	/obj/item/stack/f13Cash/random/denarius/med,
	/obj/item/stack/f13Cash/random/aureus/med,
	/obj/item/stack/f13Cash/random/bawls/med
))

GLOBAL_LIST_INIT(loot_t3_money, list(
	/obj/item/stack/f13Cash/random/high,
	/obj/item/stack/f13Cash/random/ncr/high,
	/obj/item/stack/f13Cash/random/denarius/high,
	/obj/item/stack/f13Cash/random/aureus/high,
	/obj/item/stack/f13Cash/random/bawls/high
))

GLOBAL_LIST_INIT(loot_skillbook, list(
	/obj/item/book/granter/trait/chemistry,
	/obj/item/book/granter/trait/trekking,
	/obj/item/book/granter/trait/pa_wear,
	/obj/item/book/granter/crafting_recipe/gunsmith_one,
	/obj/item/book/granter/crafting_recipe/gunsmith_two,
	/obj/item/book/granter/crafting_recipe/gunsmith_three,
	/obj/item/book/granter/crafting_recipe/gunsmith_four
))

GLOBAL_LIST_INIT(loot_craft_advanced, list(
	/obj/item/advanced_crafting_components/flux,
	/obj/item/advanced_crafting_components/lenses,
	/obj/item/advanced_crafting_components/conductors,
	/obj/item/advanced_crafting_components/receiver,
	/obj/item/advanced_crafting_components/assembly,
	/obj/item/advanced_crafting_components/alloys
))

GLOBAL_LIST_INIT(loot_attachment, list(
	/obj/item/attachments/scope,
	/obj/item/attachments/burst_improvement,
	/obj/item/attachments/recoil_decrease,
	/obj/item/attachments/auto_sear,
	/obj/item/attachments/bullet_speed
))

GLOBAL_LIST_INIT(loot_t1_blueprint, list(
	/obj/item/book/granter/crafting_recipe/blueprint/marksman,
	/obj/item/book/granter/crafting_recipe/blueprint/plasmapistol,
	/obj/item/book/granter/crafting_recipe/blueprint/brushgun,
	/obj/item/book/granter/crafting_recipe/blueprint/aer9,
	/obj/item/book/granter/crafting_recipe/blueprint/greasegun,
	/obj/item/book/granter/crafting_recipe/blueprint/pps,
))

GLOBAL_LIST_INIT(loot_t2_blueprint, list(
	/obj/item/book/granter/crafting_recipe/blueprint/r91,
	/obj/item/book/granter/crafting_recipe/blueprint/sniper,
	/obj/item/book/granter/crafting_recipe/blueprint/breacher,
	/obj/item/book/granter/crafting_recipe/blueprint/r84,
	/obj/item/book/granter/crafting_recipe/blueprint/type93,
	/obj/item/book/granter/crafting_recipe/blueprint/bar,
	/obj/item/book/granter/crafting_recipe/blueprint/deagle
))

GLOBAL_LIST_INIT(loot_t3_blueprint, list(
	/obj/item/book/granter/crafting_recipe/blueprint/plasmarifle,
	/obj/item/book/granter/crafting_recipe/blueprint/am_rifle,
	/obj/item/book/granter/crafting_recipe/blueprint/citykiller,
	/obj/item/book/granter/crafting_recipe/blueprint/rangemaster,
	/obj/item/book/granter/crafting_recipe/blueprint/bozar
))
