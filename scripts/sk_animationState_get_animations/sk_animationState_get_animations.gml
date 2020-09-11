__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_animationState_exists(argument0);
/// @desc returns a property
/// @param state
/// @param id
var sk_animationMap = argument0[sk_data_animationState.animations];
ds_list_clear(argument1);
var sk_key = ds_map_find_first(sk_animationMap);
repeat(ds_map_size(sk_animationMap)){
	ds_list_add(argument1,sk_animationMap[? sk_key]);
	// next
	sk_key = ds_map_find_next(sk_animationMap,sk_key);
}