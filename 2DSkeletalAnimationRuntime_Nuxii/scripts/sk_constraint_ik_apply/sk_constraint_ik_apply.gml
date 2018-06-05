/// @desc applys IK between a bone and an end effector
/// @param constraint
var sk_alpha = argument0[SK_CONSTRAINT_IK.weightFinal];
if(sk_alpha<0.01){
	// negligable
	return;
}
var sk_bone_effector = argument0[SK_CONSTRAINT_IK.boneEffector];
var sk_bone_joint = argument0[SK_CONSTRAINT_IK.boneJoint];
if(sk_struct_exists(sk_bone_effector,sk_type_bone)&&sk_struct_exists(sk_bone_joint,sk_type_bone)){
	var sk_targetX = sk_bone_effector[SK_BONE.XWorld];
	var sk_targetY = sk_bone_effector[SK_BONE.YWorld];
	if(argument0[SK_CONSTRAINT_IK.chain]){
		sk_ik_apply_chain(sk_bone_joint,sk_targetX,sk_targetY,argument0[SK_CONSTRAINT_IK.bendDirFinal],sk_alpha);
	} else {
		sk_ik_apply(sk_bone_joint,sk_targetX,sk_targetY,sk_alpha);
	}
}