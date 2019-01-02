/// @desc applys IK between a bone and an end effector
/// @param constraint
var sk_pose = argument0[sk_constraint_ik_var_appliedTransform]
var sk_alpha = sk_pose[1];
if(sk_alpha<0.01) then return;
var sk_bone_effector = argument0[sk_constraint_ik_var_effector];
var sk_bone_joint = argument0[sk_constraint_ik_var_joint];
if((sk_bone_effector!=undefined)&&(sk_bone_joint!=undefined)){
	var sk_targetX = sk_bone_effector[sk_bone_var_x];
	var sk_targetY = sk_bone_effector[sk_bone_var_y];
	if(argument0[sk_constraint_ik_var_chain]){
		sk_bone_ik_chain(sk_bone_joint,sk_targetX,sk_targetY,sk_pose[0],sk_alpha);
	} else {
		sk_bone_ik(sk_bone_joint,sk_targetX,sk_targetY,sk_alpha);
	}
}