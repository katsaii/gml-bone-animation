#macro sk_class_timeline sk_object_build_timeline
#macro sk_timeline_var_destructor sk_object_var_args+0
#macro sk_timeline_var_apply sk_object_var_args+1
#macro sk_timeline_var_target sk_object_var_args+2
#macro sk_timeline_var_keyframes sk_object_var_args+3
#macro sk_timeline_var_ENTRIES sk_object_var_args+4
/// @desc creates an timeline object
/// @param destructor
/// @param apply
/// @param target
/// @param alignment (number of entries per record)
var sk_obj = sk_object_build();
sk_obj[@ sk_object_var_class] = sk_class_timeline;
sk_obj[@ sk_timeline_var_destructor] = sk_obtain_script(argument0);
sk_obj[@ sk_timeline_var_apply] = sk_obtain_script(argument1);
sk_obj[@ sk_timeline_var_target] = argument2;
sk_obj[@ sk_timeline_var_keyframes] = ds_list_create();
sk_obj[@ sk_timeline_var_ENTRIES] = max(real(argument3),1);
return sk_obj;