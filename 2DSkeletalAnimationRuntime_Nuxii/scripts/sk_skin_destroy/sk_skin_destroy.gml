/// @desc deletes the supplied structure and unhooks its array
/// @param skin
array_unhook_sk_structure(argument0);
// destroy dynamic data structures
ds_list_destroy(argument0[SK_SKIN.displays]);
ds_map_destroy(argument0[SK_SKIN.remaps]);
ds_list_destroy(argument0[SK_SKIN.remapStack]);