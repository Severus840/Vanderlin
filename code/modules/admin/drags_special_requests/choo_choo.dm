

GLOBAL_LIST_EMPTY(active_damsel_tracks)

/proc/choo_choo(mob/living/carbon/damsel)
	set waitfor = FALSE
	damsel.Paralyze(5 SECONDS, TRUE)

	var/turf/initial_T = get_turf(damsel)
	playsound(initial_T, 'sound/effects/train/train_far.ogg', 100, TRUE, 4)


	var/name = damsel.real_name
	GLOB.active_damsel_tracks[name] = list()
	var/turf/start = get_ranged_target_turf(damsel, WEST, 7)
	var/turf/end = get_ranged_target_turf(damsel, EAST, 7)
	var/list/turf/line = get_line(start, end)
	for(var/i in 1 to length(line))
		var/turf/T = line[i]
		if(!can_see(damsel, T, 7) || isclosedturf(T) || T.can_zFall())
			continue
		var/obj/structure/minecart_rail/rail_line = new(T)
		rail_line.setDir(EAST)
		if(T == initial_T)
			rail_line.buckle_mob(damsel, TRUE, FALSE)
		rail_line.pixel_z = 50
		rail_line.alpha = 0
		if(i > 1) // byond's delay for animations breaks on alpha so i gotta do this
			sleep(2)
		animate(rail_line, 2, 1, alpha=255, pixel_z=0)
		GLOB.active_damsel_tracks[name] += rail_line
	sleep(6 SECONDS)
	playsound(initial_T, 'sound/effects/train/train_mid.ogg', 100, TRUE, 4)
	sleep(3 SECONDS)
	for(var/mob/M in range(10, initial_T))
		shake_camera(M, 3 SECONDS, 0.25)
	sleep(3 SECONDS)
	for(var/mob/M in range(10, initial_T))
		shake_camera(M, 10 SECONDS, 1)
	playsound(initial_T, 'sound/effects/train/train_close.ogg', 130, TRUE, 4)

/// See type name
/datum/component/train_that_kills_you
	var/list/obj/structure/minecart_rail/rail_line = list()

/datum/component/train_that_kills_you/Initialize()
	if(!iscarbon(parent))
		return COMPONENT_INCOMPATIBLE

	var/obj/item/rope/arms = new()
	arms.breakouttime *= 2

	var/mob/living/carbon/damsel = parent

	damsel.set_handcuffed(arms)

	damsel.legcuffed = new /obj/item/rope()
	damsel.update_inv_legcuffed()
	damsel.update_inv_handcuffed()


