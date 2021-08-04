#define JOB_MODIFICATION_MAP_NAME "Navarro"
/* Removed jobs */
/datum/job/CaesarsLegion/config_check()
	return 0

/datum/job/oasis/config_check()
	return 0

/datum/job/wasteland/f13detective/config_check()
	return 0

/datum/job/wasteland/f13mobboss/config_check()
	return 0

/datum/job/wasteland/f13enforcer/config_check()
	return 0

/datum/job/bos/f13initiate/config_check()
	return 0

/* Modified jobs */
// Enclave
/datum/job/enclave/drill
	..()
	total_positions = 1
	spawn_positions = 1

/datum/job/enclave/sergeant/New()
	..()
	total_positions = 2
	spawn_positions = 2

/datum/job/enclave/scientist/New()
	..()
	total_positions = 3
	spawn_positions = 3

/datum/job/enclave/private/New()
	..()
	total_positions = 5
	spawn_positions = 5

/datum/job/enclave/recruit/New()
	..()
	total_positions = 3
	spawn_positions = 3

// Brotherhood
/datum/job/bos/f13paladin/New()
	..()
	total_positions = 2
	spawn_positions = 2

/datum/job/bos/f13seniorknight/New()
	..()
	total_positions = 2
	spawn_positions = 2

/datum/job/bos/f13knight/New()
	..()
	total_positions = 4
	spawn_positions = 4
