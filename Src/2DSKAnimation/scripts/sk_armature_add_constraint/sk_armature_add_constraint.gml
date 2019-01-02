/// @desc adds a structure to the armature
/// @param armature
/// @param constraint
if(sk_object_ofclass(argument1,sk_class_updatable)) then ds_list_add(argument0[sk_armature_var_constraints],argument1);