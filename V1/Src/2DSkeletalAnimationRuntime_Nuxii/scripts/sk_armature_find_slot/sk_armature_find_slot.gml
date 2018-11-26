/// @desc finds a structure by name from the armature
/// @param armature
/// @param struct
/// @param [sk_type]
var sk_list = array_get(argument[0],SK_ARMATURE.slots);
return (argument_count<3) ? ds_list_find_sk(sk_list,argument[1]) : ds_list_find_sk(sk_list,argument[1],argument[2]);