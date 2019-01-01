#macro sk_bone_cache sk_updatable_cache
/// @desc sort bones in hierarchy
/// @param bone
/// @param id
var sk_bone_id = ds_list_find_index(argument1,argument0);
if(sk_bone_id==-1){
	// sort parent
	var sk_parent = argument0[sk_bone_var_parent];
	if(sk_parent!=undefined){
		sk_bone_cache(sk_parent,argument1);
	}
}