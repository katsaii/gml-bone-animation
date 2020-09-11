__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_ik_constraint_exists(argument0);
/// @desc applys IK between a bone and an end effector
/// @param constraint
var sk_alpha = argument0[sk_data_ik_constraint.appliedWeight];
if(sk_alpha<0.01) then return;
var sk_bone_effector = argument0[sk_data_ik_constraint.effector];
var sk_bone_joint = argument0[sk_data_ik_constraint.joint];
if((sk_bone_effector!=undefined)&&(sk_bone_joint!=undefined)){
	var sk_targetX = sk_bone_effector[sk_data_bone.worldX];
	var sk_targetY = sk_bone_effector[sk_data_bone.worldY];
	if(argument0[sk_data_ik_constraint.chain]){
		sk_bone_ik_chain(sk_bone_joint,sk_targetX,sk_targetY,argument0[sk_data_ik_constraint.appliedBendDir],sk_alpha);
	} else {
		sk_bone_ik(sk_bone_joint,sk_targetX,sk_targetY,sk_alpha);
	}
}