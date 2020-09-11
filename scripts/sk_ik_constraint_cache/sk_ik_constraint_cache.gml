__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_ik_constraint_exists(argument0);
/// @desc sort constraint in hierarchy
/// @param constraint
/// @param id
var sk_constraint_id = ds_list_find_index(argument1,argument0);
if(sk_constraint_id==-1){
	// sort bones
	var sk_joint = argument0[sk_data_ik_constraint.joint];
	var sk_effector = argument0[sk_data_ik_constraint.effector];
	if(sk_joint!=undefined) then sk_bone_cache(sk_joint,argument1);
	if(sk_effector!=undefined) then sk_bone_cache(sk_effector,argument1);
	// add self
	ds_list_add(argument1,argument0);
}