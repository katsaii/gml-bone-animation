#macro sk_constraint_transform_cache sk_updatable_cache
/// @desc sort target bone, so that its world transform is calculated before the child bones
/// @param constraint
/// @param id
var sk_constraint_id = ds_list_find_index(argument1,argument0);
if(sk_constraint_id==-1){
	var sk_bone_target = argument0[sk_constraint_transform_var_target];
	var sk_bones = argument0[sk_constraint_transform_var_children];
	sk_bone_cache(sk_bone_target,argument1);
	// sort child bones
	var sk_bone_count = ds_list_size(sk_bones);
	for(var sk_bone_id = 0; sk_bone_id < sk_bone_count; sk_bone_id++){
		var sk_bone_child = sk_bones[| sk_bone_id];
		sk_bone_cache(sk_bone_child,argument1);
	}
}