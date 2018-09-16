/// @desc sort end effector, so that its world transform is calculated before the joint (forward kinematics)
/// @param updateOrder
/// @param constraint
if(sk_struct_isof(argument1,sk_type_constraint_ik)){
	var sk_bone_effector = argument1[SK_CONSTRAINT_IK.boneEffector];
	var sk_bone_joint = argument1[SK_CONSTRAINT_IK.boneJoint];
	sk_cache_sort_bone(argument0,sk_bone_effector);
	sk_cache_sort_bone(argument0,sk_bone_joint);
	// add final IK constraint to cache
	ds_list_add(argument0,argument1);
}