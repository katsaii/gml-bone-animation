/// @desc adds a structure to the armature
/// @param armature
/// @param struct
if(sk_struct_exists(argument1)){
	ds_list_add(argument0[SK_ARMATURE.attachments],argument1);
}