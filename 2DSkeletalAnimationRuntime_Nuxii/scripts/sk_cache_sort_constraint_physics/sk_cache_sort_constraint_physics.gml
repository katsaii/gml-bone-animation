/// @desc sorts the parent bones in the map before the child so their transforms are ready to be inherited on demand
/// @param updateOrder
/// @param constraint
if(sk_struct_exists(argument1,sk_type_constraint_physics)){
	var sk_boneSystem = argument1[SK_CONSTRAINT_PHYSICS.boneSystem];
	var sk_bone_count = ds_list_size(sk_boneSystem);
	for(var sk_bone_id = 0; sk_bone_id < sk_bone_count; sk_bone_id++){
		sk_cache_sort_bone(argument0,sk_boneSystem[| sk_bone_id]);
	}
	// add final constraint to cache
	ds_list_add(argument0,argument1);
}