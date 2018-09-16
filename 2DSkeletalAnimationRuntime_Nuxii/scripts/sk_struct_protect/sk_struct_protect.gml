/// @desc protects a structure from being deleted
/// @param struct
/// @param guardian
if(!sk_struct_protected(argument0)){
	argument0[1,SK_STRUCT_H.protector] = argument1;
}