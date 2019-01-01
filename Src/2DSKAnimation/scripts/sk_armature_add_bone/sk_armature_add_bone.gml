/// @desc adds a structure to the armature
/// @param armature
/// @param bone
if(sk_object_oftype(argument1,sk_type_bone)) then ds_list_add(argument0[sk_armature_var_bones],argument1);