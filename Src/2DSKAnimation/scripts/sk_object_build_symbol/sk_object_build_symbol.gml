#macro sk_class_symbol sk_object_build_symbol
#macro sk_symbol_var_destructor sk_object_var_args+0
#macro sk_symbol_var_setup sk_object_var_args+1
#macro sk_symbol_var_apply sk_object_var_args+1
/// @desc creates an attachment object
/// @param type
/// @param name
/// @param destructor
/// @param setup
/// @param apply
var sk_obj = sk_object_build(argument0,argument1,sk_class_symbol);
sk_obj[@ sk_symbol_var_destructor] = sk_obtain_script(argument2);
sk_obj[@ sk_symbol_var_setup] = sk_obtain_script(argument3);
sk_obj[@ sk_symbol_var_apply] = sk_obtain_script(argument4);
return sk_obj;