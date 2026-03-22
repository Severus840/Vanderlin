/*
			< ATTENTION >
	If you need to add more map_adjustment, check 'map_adjustment_include.dm'
	These 'map_adjustment.dm' files shouldn't be included in 'dme'
*/

/datum/map_adjustment/whitepalacepass
	map_file_name = "WhitePalacePass.dmm"
	blacklist = list(
		/datum/job/jailor,
		/datum/job/adept,
		/datum/job/absolver,
	)
	// Limited positions to ensure core roles are filled.
	slot_adjust = list(
		/datum/job/feldsher = 1,
		/datum/job/orthodoxist = 1,
		/datum/job/bogwitch = 1,
		/datum/job/bog_apprentice = 1,
	)
	ages_adjust = list(
		/datum/job/forestguard = list(AGE_MIDDLEAGED, AGE_OLD, AGE_IMMORTAL)
	)
