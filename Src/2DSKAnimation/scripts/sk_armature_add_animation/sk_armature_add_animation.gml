/// @desc adds a structure to the armature
/// @param armature
/// @param animation
if(sk_object_oftype(argument1,sk_type_animation)) then ds_list_add(argument0[sk_armature_var_animations],argument1);