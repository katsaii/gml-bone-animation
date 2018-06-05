/// @desc applys IK between a bone and an end effector
/// @param bone
/// @param targetx
/// @param targety
/// @param bendDir
/// @param alpha
var sk_child = argument0;
var sk_targetX = argument1;
var sk_targetY = argument2;
var sk_bendDir = argument3;
var sk_alpha = argument4;
var sk_parent = sk_child[SK_BONE.parent];
// confirm applied state
if(sk_parent[SK_BONE.badApplied]){
	sk_bone_updateAppliedTransform(sk_parent);
}
if(sk_child[SK_BONE.badApplied]){
	sk_bone_updateAppliedTransform(sk_child);
}
// child local transforms
var sk_cax = sk_child[SK_BONE.XApplied];
var sk_cay = sk_child[SK_BONE.YApplied];
var sk_caxscale = sk_child[SK_BONE.XScaleApplied];
var sk_cayscale = sk_child[SK_BONE.YScaleApplied];
var sk_caxshear = sk_child[SK_BONE.XShearApplied];
var sk_cayshear = sk_child[SK_BONE.YShearApplied];
var sk_carotation = sk_child[SK_BONE.rotationApplied];
// parent local transforms
var sk_pax = sk_parent[SK_BONE.XApplied];
var sk_pay = sk_parent[SK_BONE.YApplied];
var sk_paxscale = sk_parent[SK_BONE.XScaleApplied];
var sk_payscale = sk_parent[SK_BONE.YScaleApplied];
var sk_parotation = sk_parent[SK_BONE.rotationApplied]+sk_parent[SK_BONE.XShearApplied];
// get parent bone's parent bone's inverse matrix
var sk_parentparent = sk_parent[SK_BONE.parent];
var sk_pp_m00 = sk_parentparent[SK_BONE.m00];
var sk_pp_m01 = sk_parentparent[SK_BONE.m01];
var sk_pp_m10 = sk_parentparent[SK_BONE.m10];
var sk_pp_m11 = sk_parentparent[SK_BONE.m11];
var sk_determinant = sk_pp_m00*sk_pp_m11 - sk_pp_m01*sk_pp_m10;
if(abs(sk_determinant)<0.001){
	// the parent matrix has a lower rank than is required (rank 2, for 2 dimensions), and thus has no solution
	return;
}
sk_determinant = 1/sk_determinant;
var sk_im00 = sk_pp_m11*sk_determinant;
var sk_im01 = -sk_pp_m01*sk_determinant;
var sk_im10 = -sk_pp_m10*sk_determinant;
var sk_im11 = sk_pp_m00*sk_determinant;
var sk_xx = sk_targetX - sk_parentparent[SK_BONE.XWorld];
var sk_yy = sk_targetY - sk_parentparent[SK_BONE.YWorld];
// use inverse matrix to calculate the local position of the end effector
var sk_tx = sk_im00*sk_xx+sk_im10*sk_yy - sk_pax;
var sk_ty = sk_im01*sk_xx+sk_im11*sk_yy - sk_pay;
// determine whether the parent bone is of uniform scale
var sk_uniform = abs(sk_paxscale-sk_payscale) <= 0.01;
if(sk_uniform){
	sk_payscale = sk_paxscale;
	// calculate bone lengths
	var sk_lena = abs(point_distance(0,0,sk_cax,sk_cay)*sk_paxscale);
	var sk_lenb = abs(sk_child[SK_BONE.length]*sk_caxscale*sk_paxscale);
	// set rotations
	var sk_rotb = sk_ik_calculate_b(sk_tx,sk_ty,sk_lena,sk_lenb,sk_bendDir);
	var sk_rota = sk_ik_calculate_a(sk_tx,sk_ty,sk_lena,sk_lenb,sk_rotb);
	// apply
	var sk_offsetShear = -darctan2(sk_cay,sk_cax);
	var sk_rotationIK = angle_difference(sk_rota-sk_offsetShear,sk_parotation);
	if(sk_paxscale<0){
		sk_rotationIK += 180;
	}
	sk_bone_updateWorldTransform_ext(sk_parent,sk_pax,sk_pay,sk_paxscale,sk_payscale,0,0,sk_parotation+sk_rotationIK*sk_alpha,sk_transformMode_normal);
	sk_rotationIK = sk_rotb+sk_offsetShear-sk_carotation-sk_caxshear;
	if(sk_caxscale<0){
		sk_rotationIK += 180;
	}
	sk_bone_updateWorldTransform_ext(sk_child,sk_cax,sk_cay,sk_caxscale,sk_cayscale,sk_caxshear,sk_cayshear,sk_carotation+sk_rotationIK*sk_alpha,sk_transformMode_normal);
} else {
	// DON'T INHERIT SCALES
	//	currently, I don't know how to implement a system where scales are inherited like in Spine, so this is the current middleground
	#region
	// calculate bone lengths
	var sk_lena = abs(point_distance(0,0,sk_cax,sk_cay)*sk_paxscale);
	var sk_lenb = abs(sk_child[SK_BONE.length]*sk_caxscale);
	// set rotations
	var sk_rotb = sk_ik_calculate_b(sk_tx,sk_ty,sk_lena,sk_lenb,sk_bendDir);
	var sk_rota = sk_ik_calculate_a(sk_tx,sk_ty,sk_lena,sk_lenb,sk_rotb);
	// apply
	var sk_offsetShear = -darctan2(sk_cay,sk_cax);
	var sk_rotationIK = angle_difference(sk_rota-sk_offsetShear,sk_parotation);
	if(sk_paxscale<0){
		sk_rotationIK += 180;
	}
	sk_bone_updateWorldTransform_ext(sk_parent,sk_pax,sk_pay,sk_paxscale,sk_payscale,0,0,sk_parotation+sk_rotationIK*sk_alpha,sk_transformMode_normal);
	sk_rotationIK = sk_rotb+sk_offsetShear-sk_carotation-sk_caxshear - darctan2(sk_parent[SK_BONE.m01],sk_parent[SK_BONE.m00]);
	if(sk_caxscale<0){
		sk_rotationIK += 180;
	}
	sk_bone_updateWorldTransform_ext(sk_child,sk_cax,sk_cay,sk_caxscale,sk_cayscale,sk_caxshear,sk_cayshear,sk_carotation+sk_rotationIK*sk_alpha,sk_transformMode_noScaleOrRotation);
	#endregion
}