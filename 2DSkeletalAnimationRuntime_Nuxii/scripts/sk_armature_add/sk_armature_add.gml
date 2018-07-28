/// @desc appends a structure
/// @param armature
/// @param id
var sk_struct = argument1;
var sk_struct_container = sk_armature_get_container(argument0,sk_struct_get_type(sk_struct));
if(ds_exists(sk_struct_container,ds_type_list)){
	// struct exists
	ds_list_add(sk_struct_container,sk_struct);
}