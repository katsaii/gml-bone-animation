/// @desc deletes the supplied structure and unhooks its array
/// @param animationState
if(array_unhook_sk_structure(argument0)){
	// destroy dynamic data structures
	ds_map_destroy(argument0[SK_ANIMATIONSTATE.animations]);
	ds_map_destroy(argument0[SK_ANIMATIONSTATE.mixTable]);
	ds_list_destroy(argument0[SK_ANIMATIONSTATE.animationQueue]);
}