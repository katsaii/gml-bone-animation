__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_transformation_constraint_exists(argument0);
/// @desc sort target bone, so that its world transform is calculated before the child bones
/// @param constraint
/// @param id
var sk_constraint_id = ds_list_find_index(argument1,argument0);
if(sk_constraint_id==-1){
	var sk_target = argument0[sk_data_transformation_constraint.target];
	var sk_children = argument0[sk_data_transformation_constraint.children];
	if(sk_target!=undefined) then sk_bone_cache(sk_target,argument1);
	// sort child bones
	var sk_child_count = ds_list_size(sk_children);
	for(var sk_child_id = 0; sk_child_id<sk_child_count; sk_child_id++){
		sk_bone_cache(sk_children[| sk_child_id],argument1);
	}
	// add self
	ds_list_add(argument1,argument0);
}