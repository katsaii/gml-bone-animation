#macro sk_class_symbol sk_object_build_symbol
#macro sk_symbol_var_destructor sk_object_var_args+0
#macro sk_symbol_var_apply sk_object_var_args+1
#macro sk_symbol_var_availableAttachments sk_object_var_args+2
#macro sk_symbol_var_defaultAttachmentKey sk_object_var_args+3
#macro sk_symbol_var_setupState sk_object_var_args+4
#macro sk_symbol_var_worldState sk_object_var_args+5
/// @desc creates an attachment object
/// @param type
/// @param name
/// @param destructor
/// @param apply
var sk_obj = sk_object_build(argument0,argument1,sk_class_symbol);
sk_obj[@ sk_symbol_var_setupState] = [undefined];
sk_obj[@ sk_symbol_var_worldState] = [undefined];
sk_obj[@ sk_symbol_var_destructor] = sk_obtain_script(argument2);
sk_obj[@ sk_symbol_var_apply] = sk_obtain_script(argument3);
sk_obj[@ sk_symbol_var_availableAttachments] = ds_map_create();
return sk_obj;