/// @desc adds a structure to the armature
/// @param armature
/// @param skin
if(sk_object_oftype(argument1,sk_type_skin)) then ds_list_add(argument0[sk_armature_var_skins],argument1);