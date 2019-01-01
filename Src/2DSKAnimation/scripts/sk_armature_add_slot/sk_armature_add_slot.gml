/// @desc adds a structure to the armature
/// @param armature
/// @param slot
if(sk_object_oftype(argument1,sk_type_slot)) then ds_list_add(argument0[sk_armature_var_slots],argument1);