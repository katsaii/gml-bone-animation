/// @desc adds a structure to the armature
/// @param armature
/// @param attachment
if(sk_object_ofclass(argument1,sk_class_attachment)) then ds_list_add(argument0[sk_armature_var_attachments],argument1);