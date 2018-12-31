#macro sk_class_updatable sk_object_build_updatable
#macro sk_updatable_var_destructor sk_object_var_args+0
#macro sk_updatable_var_setup sk_object_var_args+1
#macro sk_updatable_var_update sk_object_var_args+2
#macro sk_updatable_var_cache sk_object_var_args+3
/// @desc creates an updatable object
/// @param type
/// @param name
/// @param destructor
/// @param setup
/// @param update
/// @param cache
var sk_obj = sk_object_build(argument0,argument1,sk_class_updatable);
sk_obj[@ sk_updatable_var_destructor] = sk_obtain_script(argument2);
sk_obj[@ sk_updatable_var_setup] = sk_obtain_script(argument3);
sk_obj[@ sk_updatable_var_update] = sk_obtain_script(argument4);
sk_obj[@ sk_updatable_var_cache] = sk_obtain_script(argument5);
return sk_obj;