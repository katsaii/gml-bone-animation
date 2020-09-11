__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_skin_exists(argument0);
/// @desc append display data to the skin
/// @param skin
/// @param slot
/// @param attachment
/// @param key
if(sk_renderable_exists(argument1)){
	ds_list_add(argument0[sk_data_skin.displays],[
		argument1,
		sk_attachment_exists(argument2) ? argument2 : undefined,
		argument3
	]);
}