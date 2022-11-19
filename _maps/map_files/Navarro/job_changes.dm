#define IF_NAVARRO if(SSmapping.config.map_name == "Navarro")

/* Removed jobs */
/datum/job/CaesarsLegion/New()
	IF_NAVARRO
		total_positions = 0
		spawn_positions = 0
	..()

/datum/job/oasis/New()
	IF_NAVARRO
		total_positions = 0
		spawn_positions = 0
	..()

/datum/job/wasteland/f13detective/New()
	IF_NAVARRO
		total_positions = 0
		spawn_positions = 0
	..()

/datum/job/bos/f13initiate/New()
	IF_NAVARRO
		total_positions = 0
		spawn_positions = 0
	..()

/datum/job/followers/New()
	IF_NAVARRO
		total_positions = 0
		spawn_positions = 0
	..()

/* Modified jobs */
// Enclave
/datum/job/enclave/drill/New()
	..()
	IF_NAVARRO
		total_positions = 1
		spawn_positions = 1

/datum/job/enclave/sergeant/New()
	..()
	IF_NAVARRO
		total_positions = 2
		spawn_positions = 2

/datum/job/enclave/scientist/New()
	..()
	IF_NAVARRO
		total_positions = 3
		spawn_positions = 3

/datum/job/enclave/private/New()
	..()
	IF_NAVARRO
		total_positions = 5
		spawn_positions = 5

/datum/job/enclave/recruit/New()
	..()
	IF_NAVARRO
		total_positions = 3
		spawn_positions = 3

// Brotherhood
/datum/job/bos/f13paladin/New()
	..()
	IF_NAVARRO
		total_positions = 2
		spawn_positions = 2

/datum/job/bos/f13seniorknight/New()
	..()
	IF_NAVARRO
		total_positions = 2
		spawn_positions = 2

/datum/job/bos/f13knight/New()
	..()
	IF_NAVARRO
		total_positions = 4
		spawn_positions = 4

#undef IF_NAVARRO
