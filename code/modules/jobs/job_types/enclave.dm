GLOBAL_VAR_INIT(enclavepassword, generate_enclave_password())

/proc/generate_enclave_password()
	return "[pick(GLOB.word_passwords)]"

/datum/job/enclave
	faction = "Enclave"
	department_flag = ENCLAVE
	forbids = "You are not allowed to have friendly interactions with those outside of the Enclave."
	enforces = "You must follow orders of your superiors and lead the organization to success."
	access = list(ACCESS_ENCLAVE)
	minimal_access = list(ACCESS_ENCLAVE)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/enclave,
		),
		/datum/matchmaking_pref/rival = list(),
		/datum/matchmaking_pref/mentor = list(),
		/datum/matchmaking_pref/disciple = list(),
		/datum/matchmaking_pref/patron = list(),
		/datum/matchmaking_pref/protegee = list(),
	)

/datum/outfit/job/enclave/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/enclavecombatarmor)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/enclavecombathelmet)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/tailor/enclaveuniform)

/* LIEUTENANT */
/datum/job/enclave/lieutenant
	title = "Enclave Lieutenant"
	flag = F13ENCLAVELT
	total_positions = 1
	spawn_positions = 1
	description = "You are the Lieutenant in charge of commanding the remnants of the Enclave forces in the area."
	supervisors = "colonel of the Enclave and its Government."
	selection_color = "#525252"
	exp_requirements = 2400
	exp_type = EXP_TYPE_ENCLAVE

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/enclave/drill,
			/datum/job/enclave/scientist,
		),
		/datum/matchmaking_pref/rival = list(),
		/datum/matchmaking_pref/mentor = list(),
		/datum/matchmaking_pref/disciple = list(
			/datum/job/enclave/drill,
			/datum/job/enclave/sergeant,
		),
		/datum/matchmaking_pref/patron = list(
			/datum/job/enclave,
		),
		/datum/matchmaking_pref/protegee = list(),
	)

	outfit = /datum/outfit/job/enclave/lieutenant

/datum/outfit/job/enclave/lieutenant
	name = "Enclave Lieutenant"
	jobtype = /datum/job/enclave/lieutenant
	backpack = /obj/item/storage/backpack/satchel/enclave
	head = /obj/item/clothing/head/helmet/f13/helmet/enclave/officer
	ears = /obj/item/radio/headset/headset_enclave
	glasses = /obj/item/clothing/glasses/night
	mask = /obj/item/clothing/mask/gas/enclave
	uniform = /obj/item/clothing/under/f13/enclave/officer
	accessory = /obj/item/clothing/accessory/ncr/LT1
	belt = /obj/item/storage/belt/military/assault/enclave
	shoes = /obj/item/clothing/shoes/f13/enclave/serviceboots
	gloves = /obj/item/clothing/gloves/combat
	id = /obj/item/card/id/dogtag/enclave/officer

	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak/super = 2,
		/obj/item/grenade/flashbang = 1,
		/obj/item/pda = 1,
		/obj/item/stock_parts/cell/ammo/ec = 3,
		/obj/item/gun/energy/laser/plasma/glock/extended = 1,
		/obj/item/storage/bag/money/small/enclave/officer = 1,
		/obj/item/melee/onehanded/knife/hunting = 1,
		)

/datum/outfit/job/enclave/lieutenant/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_PA_WEAR, src)

/datum/outfit/job/wasteland/enclavelt/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	if(H.mind)
		var/obj/effect/proc_holder/spell/terrifying_presence/S = new /obj/effect/proc_holder/spell/terrifying_presence
		H.mind.AddSpell(S)

/* DRILL INSTRUCTOR */
/datum/job/enclave/drill
	title = "Enclave Drill Instructor"
	flag = F13ENCLAVELT
	total_positions = 0 // Navarro only
	spawn_positions = 0
	description = "You are the Drill Sergeant within the ranks of Enclave. You are in charge of training the troopers and maintaing order in the army."
	supervisors = "lieutenant of the Enclave."
	selection_color = "#525252"
	exp_requirements = 1800
	exp_type = EXP_TYPE_ENCLAVE

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/enclave/lieutenant,
			/datum/job/enclave/sergeant,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/enclave/sergeant,
		),
		/datum/matchmaking_pref/mentor = list(
			/datum/job/enclave/sergeant,
		),
		/datum/matchmaking_pref/disciple = list(),
		/datum/matchmaking_pref/patron = list(
			/datum/job/enclave/sergeant,
			/datum/job/enclave/private,
			/datum/job/enclave/recruit,
		),
		/datum/matchmaking_pref/protegee = list(
			/datum/job/enclave/lieutenant,
		),
	)

	outfit = /datum/outfit/job/enclave/drill

/datum/outfit/job/enclave/drill
	name = "Enclave Drill Instructor"
	jobtype = /datum/job/enclave/drill
	backpack = /obj/item/storage/backpack/satchel/enclave
	ears = /obj/item/radio/headset/headset_enclave
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses
	uniform = /obj/item/clothing/under/f13/enclave/intel
	accessory = /obj/item/clothing/accessory/ncr/SGT/drill
	belt = /obj/item/storage/belt/military/assault/enclave
	shoes = /obj/item/clothing/shoes/f13/enclave/serviceboots
	gloves = /obj/item/clothing/gloves/combat
	id = /obj/item/card/id/dogtag/enclave/officer

	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak/super = 2,
		/obj/item/grenade/flashbang = 1,
		/obj/item/storage/bag/money/small/enclave/officer = 1,
		/obj/item/melee/onehanded/knife/hunting = 1,
		)

/datum/outfit/job/enclave/drill/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_PA_WEAR, src)

/* SERGEANT */
/datum/job/enclave/sergeant
	title = "Enclave Sergeant"
	flag = F13ENCLAVESGT
	total_positions = 1
	spawn_positions = 1
	description = "You are a second in command in those lands, and as such, you directly answer for training and maintaining order within the ranks of privates and new recruits."
	supervisors = "lieutenant of the Enclave."
	selection_color = "#525252"
	exp_requirements = 1200
	exp_type = EXP_TYPE_FALLOUT

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/enclave/drill,
			/datum/job/enclave/sergeant,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/enclave/drill,
			/datum/job/enclave/sergeant,
		),
		/datum/matchmaking_pref/mentor = list(
			/datum/job/enclave/private,
			/datum/job/enclave/recruit,
		),
		/datum/matchmaking_pref/disciple = list(
			/datum/job/enclave/drill,
		),
		/datum/matchmaking_pref/patron = list(
			/datum/job/enclave/private,
			/datum/job/enclave/recruit,
		),
		/datum/matchmaking_pref/protegee = list(
			/datum/job/enclave/lieutenant,
			/datum/job/enclave/drill,
		),
	)

	outfit = /datum/outfit/job/enclave/sergeant

/datum/outfit/job/enclave/sergeant
	name = "Enclave Sergeant"
	jobtype = /datum/job/enclave/sergeant
	backpack = /obj/item/storage/backpack/satchel/enclave
	ears = 			/obj/item/radio/headset/headset_enclave
	glasses = 		/obj/item/clothing/glasses/night
	uniform =		/obj/item/clothing/under/f13/enclave/officer
	accessory =     /obj/item/clothing/accessory/ncr/SGT
	belt = 			/obj/item/storage/belt/military/assault/enclave
	shoes = 		/obj/item/clothing/shoes/f13/enclave/serviceboots
	gloves = 		/obj/item/clothing/gloves/combat
	id = 			/obj/item/card/id/dogtag/enclave/officer

	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/grenade/flashbang = 1,
		/obj/item/storage/bag/money/small/enclave/officer = 1,
		/obj/item/melee/onehanded/knife/hunting = 1,
		)

/datum/outfit/job/enclave/sergeant/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_PA_WEAR, src)

/* SCIENTIST */
/datum/job/enclave/scientist
	title = "Enclave Scientist"
	flag = F13ENCLAVESCIENTIST
	total_positions = 1
	spawn_positions = 1
	description = "You're responsible for the maintenance of the base, the knowledge you've accumulated over the years is the only thing keeping the remnants alive. You've dabbled in enough to be considered a Professor in proficiency, but they call you Doctor. Support your dwindling forces and listen to the Lieutenant."
	supervisors = "lieutenant of the Enclave."
	selection_color = "#525252"
	exp_requirements = 1800
	exp_type = EXP_TYPE_FALLOUT
	access = list(ACCESS_ENCLAVE)
	minimal_access = list(ACCESS_ENCLAVE)

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/enclave/lieutenant,
		),
		/datum/matchmaking_pref/rival = list(),
		/datum/matchmaking_pref/mentor = list(),
		/datum/matchmaking_pref/disciple = list(),
		/datum/matchmaking_pref/patron = list(),
		/datum/matchmaking_pref/protegee = list(
			/datum/job/enclave/lieutenant,
		),
	)

	outfit = /datum/outfit/job/enclave/scientist

/datum/outfit/job/enclave/scientist
	name = "Enclave Scientist"
	jobtype = /datum/job/enclave/scientist
	backpack = 		/obj/item/storage/backpack/satchel/enclave
	head = 			/obj/item/clothing/head/helmet/f13/envirosuit
	ears = 			/obj/item/radio/headset/headset_enclave
	glasses = 		/obj/item/clothing/glasses/night
	mask =			/obj/item/clothing/mask/breath/medical
	gloves = 		/obj/item/clothing/gloves/color/latex/nitrile
	uniform =		/obj/item/clothing/under/f13/enclave/science
	suit = 			/obj/item/clothing/suit/armor/f13/environmentalsuit
	belt = 			/obj/item/storage/belt/medical
	shoes = 		/obj/item/clothing/shoes/f13/enclave/serviceboots
	id = 			/obj/item/card/id/dogtag/enclave/officer
	suit_store =  	/obj/item/tank/internals/oxygen

	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/grenade/chem_grenade/cleaner = 1,
		/obj/item/gun/energy/laser/ultra_pistol = 1,
		/obj/item/stock_parts/cell/ammo/ec = 2,
		/obj/item/storage/bag/money/small/enclave = 1,
		/obj/item/melee/onehanded/knife/survival = 1,
		)

/datum/outfit/job/enclave/scientist/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_MEDICALEXPERT, src)
	ADD_TRAIT(H, TRAIT_CYBERNETICIST_EXPERT, src)
	ADD_TRAIT(H, TRAIT_SURGERY_HIGH, src)
	ADD_TRAIT(H, TRAIT_CHEMWHIZ, src)
	ADD_TRAIT(H, TRAIT_MASTER_GUNSMITH, src)
	ADD_TRAIT(H, TRAIT_UNETHICAL_PRACTITIONER, src) // Brainwashing

/* PRIVATE */
/datum/job/enclave/private
	title = "Enclave Private"
	flag = F13ENCLAVEPRIVATE
	total_positions = 1
	spawn_positions = 1
	description = "You are a soldier within the ranks of Enclave. You must follow all and any legitimate orders issued to you by command, including scientists."
	supervisors = "officers and scientists of the Enclave."
	selection_color = "#525252"
	exp_type = EXP_TYPE_ENCLAVE
	exp_requirements = 600

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/enclave/private,
			/datum/job/enclave/recruit,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/enclave/private,
			/datum/job/enclave/recruit,
		),
		/datum/matchmaking_pref/mentor = list(),
		/datum/matchmaking_pref/disciple = list(
			/datum/job/enclave/sergeant,
		),
		/datum/matchmaking_pref/patron = list(),
		/datum/matchmaking_pref/protegee = list(
			/datum/job/enclave/drill,
			/datum/job/enclave/sergeant,
		),
	)

	outfit = /datum/outfit/job/enclave/private

/datum/outfit/job/enclave/private
	name = "Enclave Private"
	jobtype = /datum/job/enclave/private
	backpack = 		/obj/item/storage/backpack/satchel/leather
	head = 			/obj/item/clothing/head/helmet/f13/combat/mk2/enclave
	ears = 			/obj/item/radio/headset/headset_enclave
	glasses = 		/obj/item/clothing/glasses/night
	uniform =		/obj/item/clothing/under/f13/enclave/peacekeeper
	suit = 			/obj/item/clothing/suit/armor/f13/combat/mk2/enclave
	belt = 			/obj/item/storage/belt/military/army
	shoes = 		/obj/item/clothing/shoes/combat/swat
	id = 			/obj/item/card/id/dogtag/enclave/trooper
	suit_store =  	/obj/item/gun/ballistic/automatic/smg/smg10mm

	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/ammo_box/magazine/m10mm_adv/ext = 2,
		/obj/item/storage/bag/money/small/enclave = 1,
		/obj/item/melee/onehanded/knife/hunting = 1
		)

/datum/outfit/job/enclave/private/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)

/* RECRUIT */
/datum/job/enclave/recruit
	title = "Enclave Recruit"
	flag = F13ENCLAVERECRUIT
	faction = "Wastelander" // So infiltrating Enclave isn't impossible with turrets around.
	total_positions = 1
	spawn_positions = 1
	description = "You are a new recruit within the ranks of the Enclave. You have been sent out to reach the local outpost and finally begin your duties. To enter the base, you've been given a secret password you may find in your backpack."
	supervisors = "officers and scientists of the Enclave."
	selection_color = "#525252"
	exp_type = EXP_TYPE_FALLOUT
	exp_requirements = 1800

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/enclave/private,
			/datum/job/enclave/recruit,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/enclave/private,
			/datum/job/enclave/recruit,
		),
		/datum/matchmaking_pref/mentor = list(),
		/datum/matchmaking_pref/disciple = list(
			/datum/job/enclave/sergeant,
		),
		/datum/matchmaking_pref/patron = list(),
		/datum/matchmaking_pref/protegee = list(
			/datum/job/enclave/drill,
			/datum/job/enclave/sergeant,
		),
	)

	outfit = /datum/outfit/job/enclave/recruit

	access = list()
	minimal_access = list()

	loadout_options = list(
	/datum/outfit/loadout/vault_refugee,
	/datum/outfit/loadout/salvager,
	/datum/outfit/loadout/scavenger,
	/datum/outfit/loadout/merchant,
	/datum/outfit/loadout/medic,
		)

/datum/outfit/job/enclave/recruit // That's basically wastelander, but with funny paper in backpack
	name = "Enclave Recruit"
	jobtype = /datum/job/enclave/recruit

	id = null
	ears = null
	belt = null
	r_hand = /obj/item/book/granter/trait/selection
	l_pocket = /obj/item/storage/bag/money/small/wastelander
	r_pocket = /obj/item/flashlight/flare
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak,
		/obj/item/reagent_containers/hypospray/medipen/stimpak,
		/obj/item/reagent_containers/pill/radx,
		/obj/item/paper/enclave_password,
		/obj/item/melee/onehanded/knife/survival,
		)

/datum/outfit/job/enclave/recruit/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	uniform = pick(
		/obj/item/clothing/under/f13/settler, \
		/obj/item/clothing/under/f13/brahminm, \
		/obj/item/clothing/under/f13/lumberjack, \
		/obj/item/clothing/under/f13/roving)
	suit = pick(
		/obj/item/clothing/suit/armor/f13/kit, \
		/obj/item/clothing/suit/f13/veteran, \
		/obj/item/clothing/suit/toggle/labcoat/f13/wanderer)
