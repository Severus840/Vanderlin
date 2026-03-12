
/obj/structure/keyrack
	name = "key rack"
	desc = "A rack for holding keys."
	icon = 'icons/roguetown/misc/structure.dmi'
	icon_state = "keyrack"
	SET_BASE_PIXEL(0, 32)
	var/list/keys = list()

/obj/structure/keyrack/Initialize()
	. = ..()
	AddComponent(/datum/component/storage/concrete/grid/keyrack)
	if(!length(keys))
		return
	if(length(keys) > 8)
		stack_trace("Keyring [src] has too many keys and the list will get cut short!")
	keys = fill_with_ones(keys)
	for(var/X as anything in keys)
		for(var/i in 1 to keys[X])
			var/obj/item/key/new_key = new X(loc)
			if(!SEND_SIGNAL(src, COMSIG_TRY_STORAGE_INSERT, new_key, null, TRUE, FALSE))
				qdel(new_key)
		LAZYREMOVE(keys, X)
	update_appearance(UPDATE_ICON_STATE | UPDATE_DESC)


/obj/structure/keyrack/mercenary
	keys = list(/obj/item/key/mercenary = 8)

/obj/structure/keyrack/tomb
	keys = list(/obj/item/key/tomb = 8)
