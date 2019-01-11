/// @desc dispose
/// @param variable
ds_map_destroy(argument0[sk_data_animationState.animations]);
ds_map_destroy(argument0[sk_data_animationState.mixTable]);
ds_list_destroy(argument0[sk_data_animationState.animationQueue]);