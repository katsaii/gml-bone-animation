/// @desc sort target bone, so that its world transform is calculated before the child bones
/// @param updateOrder
/// @param constraint
if(sk_struct_exists(argument1,sk_type_constraint_transform)){
	var sk_bone_target = argument1[SK_CONSTRAINT_TRANSFORM.boneTarget];
	var sk_bones = argument1[SK_CONSTRAINT_TRANSFORM.boneChildren];
	sk_cache_sort_bone(argument0,sk_bone_target);
	// sort child bones
	var sk_bone_count = ds_list_size(sk_bones);
	for(var sk_bone_id = 0; sk_bone_id < sk_bone_count; sk_bone_id++){
		var sk_bone_child = sk_bones[| sk_bone_id];
		sk_cache_sort_bone(argument0,sk_bone_child);
	}
	// add final constraint to cache
	ds_list_add(argument0,argument1);
}