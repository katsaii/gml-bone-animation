/// @desc adds a structure to the armature
/// @param armature
/// @param event
if(sk_object_ofclass(argument1,sk_class_event)) then ds_list_add(argument0[sk_armature_var_events],argument1);