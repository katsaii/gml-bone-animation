#macro sk_class_symbol sk_object_build_symbol
#macro sk_symbol_var_destructor sk_object_var_args+0
#macro sk_symbol_var_apply sk_object_var_args+1
#macro sk_symbol_var_availableAttachments sk_object_var_args+2
#macro sk_symbol_var_defaultAttachmentKey sk_object_var_args+3
#macro sk_symbol_var_defaultColour sk_object_var_args+4
#macro sk_symbol_var_defaultAlpha sk_object_var_args+5
#macro sk_symbol_var_defaultBone sk_object_var_args+6
#macro sk_symbol_var_defaultAttachment sk_object_var_args+7
#macro sk_symbol_var_colour sk_object_var_args+8
#macro sk_symbol_var_alpha sk_object_var_args+9
#macro sk_symbol_var_bone sk_object_var_args+10
#macro sk_symbol_var_attachment sk_object_var_args+11
/// @desc creates an attachment object
/// @param type
/// @param name
/// @param destructor
/// @param apply
var sk_obj = sk_object_build(argument0,argument1,sk_class_symbol);
sk_obj[@ sk_symbol_var_destructor] = sk_obtain_script(argument2);
sk_obj[@ sk_symbol_var_apply] = sk_obtain_script(argument3);
sk_obj[@ sk_symbol_var_availableAttachments] = ds_map_create();
return sk_obj;