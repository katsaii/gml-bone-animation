#macro sk_class_attachment sk_object_build_attachment
#macro sk_attachment_var_destructor sk_object_var_args+0
#macro sk_attachment_var_apply sk_object_var_args+1
/// @desc creates an attachment object
/// @param destructor
/// @param apply
var sk_obj = sk_object_build();
sk_obj[@ sk_object_var_class] = sk_class_attachment;
sk_obj[@ sk_attachment_var_destructor] = sk_obtain_script(argument0);
sk_obj[@ sk_attachment_var_apply] = sk_obtain_script(argument1);
return sk_obj;