/obj/item/gun/energy/e_gun/advtaser/mounted
	name = "mounted taser"
	desc = "An arm mounted dual-mode weapon that fires electrodes and disabler shots."
	icon = 'icons/obj/items_cyborg.dmi'
	icon_state = "taser"
	item_state = "armcannonstun4"
	force = 5
	selfcharge = EGUN_SELFCHARGE
	can_flashlight = 0
	trigger_guard = TRIGGER_GUARD_ALLOW_ALL // Has no trigger at all, uses neural signals instead

/obj/item/gun/energy/laser/mounted
	name = "mounted laser"
	desc = "An arm mounted cannon that fires lethal lasers."
	icon = 'icons/obj/items_cyborg.dmi'
	icon_state = "laser_cyborg"
	item_state = "armcannonlase"
	force = 5
	selfcharge = EGUN_SELFCHARGE
	trigger_guard = TRIGGER_GUARD_ALLOW_ALL

/obj/item/gun/energy/laser/plasma/mounted
	name = "mounted plasma-caster"
	desc = "An arm mounted cannon that fires streams of plasma."
	icon = 'icons/obj/items_cyborg.dmi'
	icon_state = "laser_cyborg"
	item_state = "armcannonplasma"
	force = 8
	burst_size = 3
	burst_shot_delay = 2.5
	selfcharge = EGUN_SELFCHARGE
	can_charge = 0
	cell_type = /obj/item/stock_parts/cell/ammo/internal
	ammo_type = list(/obj/item/ammo_casing/energy/plasma/mounted_caster)
	trigger_guard = TRIGGER_GUARD_ALLOW_ALL
