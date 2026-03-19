/*
			< ATTENTION >
	If you need to add more map_adjustment, check 'map_adjustment_include.dm'
	These 'map_adjustment.dm' files shouldn't be included in 'dme'
*/

/datum/map_adjustment/whitepalacepass
	map_file_name = "WhitePalacePass.dmm"
	blacklist = list(
		/datum/job/forestguard,
		/datum/job/forestwarden,
		/datum/job/jailor,
		/datum/job/adept,
	)
	// Limited positions to ensure core roles are filled.
	slot_adjust = list(
		/datum/job/feldsher = 1,
		/datum/job/tapster = 2,
		/datum/job/cook = 2,
		/datum/job/servant = 3,
		/datum/job/carpenter = 2,
		/datum/job/hunter = 2,
		/datum/job/bard = 3,
		/datum/job/bapprentice = 3,
		/datum/job/miner = 4,
		/datum/job/fisher = 2,
		/datum/job/farmer = 3,
		/datum/job/orphan = 6,
		/datum/job/men_at_arms = 6,
		/datum/job/guardsman = 6,
		/datum/job/mercenary = 4,
		/datum/job/artificer = 2,
		/datum/job/orthodoxist = 1,
	)
	ages_adjust = list(
		/datum/job/forestguard = list(AGE_MIDDLEAGED, AGE_OLD, AGE_IMMORTAL)
	)
