gml_pragma("forceinline");
/// @desc destroys the timeline
/// @param timeline
script_execute(argument0[sk_timeline_var_destructor],argument0);
ds_list_destroy(argument[sk_timeline_var_keyframes]);
sk_object_wipe(argument0);