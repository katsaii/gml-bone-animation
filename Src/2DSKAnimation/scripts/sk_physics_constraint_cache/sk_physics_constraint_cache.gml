__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_physics_constraint_exists(argument0);
/// @desc sort target bone, so that its world transform is calculated before the child bones
/// @param constraint
/// @param id
var sk_constraint_id = ds_list_find_index(argument1,argument0);
if(sk_constraint_id==-1){
	var sk_anchor = argument0[sk_data_physics_constraint.anchor];
	var sk_effector = argument0[sk_data_physics_constraint.effector];
	var sk_system = argument0[sk_data_physics_constraint.system];
	var sk_bone_count = ds_list_size(sk_system);
	for(var sk_bone_id = 0; sk_bone_id < sk_bone_count; sk_bone_id++){
		sk_bone_cache(sk_system[| sk_bone_id],argument1);
	}
	// sort effectors
	if(sk_anchor!=undefined) then sk_bone_cache(sk_anchor,argument1);
	if(sk_effector!=undefined) then sk_bone_cache(sk_effector,argument1);
	// add self
	ds_list_add(argument1,argument0);
}