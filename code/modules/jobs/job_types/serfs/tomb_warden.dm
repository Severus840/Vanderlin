
/datum/job/tomb_warden
	title = "Tomb Warden"
	department_flag = SERFS
	faction = FACTION_TOWN
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	total_positions = 1
	spawn_positions = 1

	allowed_races = RACES_PLAYER_NO_KOBOLD
	allowed_ages = list(AGE_OLD, AGE_IMMORTAL)
	blacklisted_species = list(SPEC_ID_HALFLING)

	tutorial = ""

	display_order = JDO_TOMBWARDEN
	cmode_music = 'sound/music/cmode/towner/CombatGaffer.ogg'
	outfit = /datum/outfit/tomb_warden
	give_bank_account = 20
	bypass_lastclass = TRUE
	selection_color = "#3b150e"

	spells = list(/datum/action/cooldown/spell/undirected/list_target/convert_role/mercenary)

	exp_type = list(EXP_TYPE_LIVING, EXP_TYPE_ADVENTURER, EXP_TYPE_MERCENARY, EXP_TYPE_LEADERSHIP)
	exp_types_granted = list(EXP_TYPE_ADVENTURER, EXP_TYPE_MERCENARY, EXP_TYPE_LEADERSHIP)
	exp_requirements = list(
		EXP_TYPE_LIVING = 1200,
		EXP_TYPE_ADVENTURER = 360,
		EXP_TYPE_MERCENARY = 420,
	)

	//These are intentionally quite low.
	jobstats = list(
		STATKEY_INT = 1,
		STATKEY_CON = 1,
		STATKEY_PER = 1,
		STATKEY_STR = 1, // only so they can actually wield most basic swords
		STATKEY_END = 1,
		STATKEY_SPD = -1,
	)

	skills = list(
		/datum/skill/combat/axesmaces = 5,
		/datum/skill/combat/bows = 3,
		/datum/skill/combat/crossbows = 3,
		/datum/skill/combat/knives = 3,
		/datum/skill/combat/polearms = 5,
		/datum/skill/combat/shields = 4,
		/datum/skill/combat/swords = 5,
		/datum/skill/combat/unarmed = 4,
		/datum/skill/combat/whipsflails = 4,
		/datum/skill/combat/wrestling = 3,
		/datum/skill/craft/armorsmithing = 1,
		/datum/skill/craft/cooking = 2,
		/datum/skill/craft/sewing = 2,
		/datum/skill/craft/traps = 2,
		/datum/skill/craft/weaponsmithing = 1,
		/datum/skill/misc/climbing = 1,
		/datum/skill/misc/medicine = 2,
		/datum/skill/misc/reading = 3,
		/datum/skill/misc/riding = 4,
		/datum/skill/misc/sneaking = 2,
		/datum/skill/misc/swimming = 1,
	)

	// Gets crazy multipliers for teaching people
	trainable_skills = list(
		/datum/skill/combat/axesmaces = 0.4,
		/datum/skill/combat/bows = 0.35,
		/datum/skill/combat/crossbows = 0.3,
		/datum/skill/combat/knives = 0.3,
		/datum/skill/combat/polearms = 0.4,
		/datum/skill/combat/unarmed = 0.4,
		/datum/skill/combat/shields = 0.4,
		/datum/skill/combat/swords = 0.4,
		/datum/skill/combat/whipsflails = 0.3,
		/datum/skill/combat/wrestling = 0.3
	)
	apprentice_name = "Aspiring Warrior"
	max_apprentices = 6

	traits = list(
		TRAIT_SEEPRICES,
		TRAIT_STEELHEARTED,
		TRAIT_OLDPARTY
	)
	forced_flaw = list(
		/datum/quirk/vice/old_war_wound, // fucks with their ability to wear armor
		/datum/quirk/boon/folk_hero
	)

/datum/job/tomb_warden/after_spawn(mob/living/carbon/human/spawned, client/player_client)
	. = ..()
	if(spawned.age != AGE_OLD) // this prevents the aasimar power game
		var/prev_age = spawned.age
		spawned.age = AGE_OLD
		spawned.set_stat_mods()
		spawned.age = prev_age


/datum/outfit/tomb_warden
	name = "Tomb Warden"
	backl = /obj/item/storage/backpack/satchel
	backpack_contents = list(
		/obj/item/merctoken = 2,
		/obj/item/natural/feather,
		/obj/item/paper = 1,
	)
	beltr = /obj/item/storage/belt/pouch/coins/rich
	belt = /obj/item/storage/belt/leather/plaquesilver
	beltl = /obj/item/weapon/sword/arming
	neck = /obj/item/clothing/neck/mercmedal
	ring = /obj/item/clothing/ring/gold
	shirt = /obj/item/clothing/shirt/tunic/colored/black
	wrists = /obj/item/storage/keyring/tombwarden
	armor = /obj/item/clothing/armor/leather/heavy/coat
	pants = /obj/item/clothing/pants/trou/leather
	shoes = /obj/item/clothing/shoes/boots
	cloak = /obj/item/clothing/cloak/raincloak/furcloak
	head = /obj/item/clothing/head/roguehood/leather
	l_hand = /obj/item/weapon/mace/cane
	scabbards = list(/obj/item/weapon/scabbard/sword)
