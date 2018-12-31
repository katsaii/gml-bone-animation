#macro sk_class_timeline sk_object_build_timeline
#macro sk_timeline_var_destructor sk_object_var_args+0
#macro sk_timeline_var_apply sk_object_var_args+1
#macro sk_timeline_var_target sk_object_var_args+2
#macro sk_timeline_var_keyframes sk_object_var_args+3
#macro sk_timeline_var_ENTRIES sk_object_var_args+4
/// @desc creates an timeline object
/// @param type
/// @param name
/// @param destructor
/// @param apply
/// @param target
/// @param alignment (number of entries per record)
var sk_obj = sk_object_build(argument0,argument1,sk_class_timeline);
sk_obj[@ sk_timeline_var_destructor] = sk_obtain_script(argument2);
sk_obj[@ sk_timeline_var_apply] = sk_obtain_script(argument3);
sk_obj[@ sk_timeline_var_target] = argument4;
sk_obj[@ sk_timeline_var_keyframes] = ds_list_create();
sk_obj[@ sk_timeline_var_ENTRIES] = max(real(argument5),1);
return sk_obj;