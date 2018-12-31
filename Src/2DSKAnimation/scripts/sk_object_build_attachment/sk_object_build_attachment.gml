#macro sk_class_attachment sk_object_build_attachment
#macro sk_attachment_var_destructor sk_object_var_args+0
#macro sk_attachment_var_apply sk_object_var_args+1
/// @desc creates an attachment object
/// @param type
/// @param name
/// @param destructor
/// @param apply
var sk_obj = sk_object_build(argument0,argument1,sk_class_attachment);
sk_obj[@ sk_attachment_var_destructor] = sk_obtain_script(argument2);
sk_obj[@ sk_attachment_var_apply] = sk_obtain_script(argument3);
return sk_obj;