/// @desc locates a structure
/// @param armature
/// @param type
/// @param nameOrID
var sk_struct_container = sk_armature_get_container(argument0,argument1);
if(ds_exists(sk_struct_container,ds_type_list)){
	return ds_list_find_sk(sk_struct_container,argument2,argument1);
}	return undefined;