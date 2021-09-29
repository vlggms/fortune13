/datum/skill_list_bay
	var/name = "Default"
	/// Increases unarmed damage.
	var/unarmed = 0
	/// Increases weapon damage + block chance with shields.
	var/melee = 0
	/// Affects speed of do_afters with engi tools.
	var/engineering = 0
	/// Affects drop-rates of salvage.
	var/salvaging = 0
	/// Smithing. Affects quality of smithed weapons.
	var/smithing = 0
	/// If too low you'll have a delay before using chemistry machines.
	var/chemistry = 0
	/// First Aid. Affects speed of applying sutures/gauzes and fixing wounds.
	var/medical = 0
	/// Surgery Steps speed.
	var/surgery = 0
	/// How fast you craft items.
	var/crafting = 0
	/// How fast you craft food.
	var/culinary = 0
	/// If too low you'll have a delay before using some scientific machines.
	var/science = 0

/datum/skill_list_bay/proc/getRating(rating)
	return vars[rating]

/datum/skill_list_bay/proc/getList()
	return list(
		"unarmed" = unarmed,
		"melee" = melee,
		"engineering" = engineering,
		"salvaging" = salvaging,
		"smithing" = smithing,
		"chemistry" = chemistry,
		"medical" = medical,
		"surgery" = surgery,
		"crafting" = crafting,
		"culinary" = culinary,
		"science" = science,
		)

/datum/skill_list_bay/proc/ModifyValue(type="engineering", amount=0)
	vars[type] += amount

/*						Skill Notes about Machinery
*************************************************************************************
*	Chemistry 2 is required to use most of the chemical machines.					*
*	Chemistry 4 is required to use PANDEMIC with no delay.							*
*	Science 2 is required for bunch of science machines to use without a delay.		*
*************************************************************************************
*/

/* Procs */
// An additional value to existing do_after variables.
// PLEASE, DO NOT SET DIFFICULTY BELOW 6 ANYWHERE OR YOU WILL DIE!!!!
/proc/SKILL_CHECK_VALUE(mob/living/user, type="engineering", difficulty=6)
	if(!user.mind)
		return 1 // AI monkey trying to do stuff, I guess.
	if(issilicon(user))
		return 1.4 // Cyborgs are superior in everything! Sort of.
	var/ret_value = (1 + (user.mind.bay_skills.getRating(type) / difficulty))
	if(ishuman(user))
		return ret_value

	return 1 // NONHUMAN ALERT!!!!!!

// Get rating for mob, regardless of mind.
/proc/get_skill_rating(mob/living/user, type="engineering")
	if(!user.mind)
		return 0
	if(issilicon(user))
		return 4 // Cyborgs, amirite?
	var/ret_value = user.mind.bay_skills.getRating(type)
	if(ishuman(user))
		return ret_value

	return 0 // How.
