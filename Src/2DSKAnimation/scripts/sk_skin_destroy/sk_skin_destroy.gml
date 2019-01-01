/// @desc destroys the object
/// @param skin
ds_list_destroy(argument0[sk_skin_var_displays]);
ds_map_destroy(argument0[sk_skin_var_remaps]);
ds_list_destroy(argument0[sk_skin_var_remapStack]);
sk_object_wipe(argument0);