/// @desc applys IK between a bone and an end effector
/// @param bone
/// @param targetx
/// @param targety
/// @param alpha
var sk_bone = argument0;
var sk_parent = sk_bone[SK_BONE.parent];
// confirm applied state
if(sk_bone[SK_BONE.badApplied]){
	sk_bone_updateAppliedTransform(sk_bone);
}
// get bone data
var sk_bone_ax = sk_bone[SK_BONE.XApplied];
var sk_bone_ay = sk_bone[SK_BONE.YApplied];
var sk_bone_axscale = sk_bone[SK_BONE.XScaleApplied];
var sk_bone_ayscale = sk_bone[SK_BONE.YScaleApplied];
var sk_bone_axshear = sk_bone[SK_BONE.XShearApplied];
var sk_bone_ayshear = sk_bone[SK_BONE.YShearApplied];
var sk_bone_arotation = sk_bone[SK_BONE.rotationApplied];
// calculate the parent's inverse rotation matrix
var sk_parent_m00 = sk_parent[SK_BONE.m00];
var sk_parent_m01 = sk_parent[SK_BONE.m01];
var sk_parent_m10 = sk_parent[SK_BONE.m10];
var sk_parent_m11 = sk_parent[SK_BONE.m11];
var sk_determinant = sk_parent_m00*sk_parent_m11 - sk_parent_m01*sk_parent_m10;
if(abs(sk_determinant)<0.001){
	// the parent matrix has a lower rank than is required (rank 2, for 2 dimensions), and thus has no solution
	return;
}
sk_determinant = 1/sk_determinant;
var sk_im00 = sk_parent_m11*sk_determinant;
var sk_im01 = -sk_parent_m01*sk_determinant;
var sk_im10 = -sk_parent_m10*sk_determinant;
var sk_im11 = sk_parent_m00*sk_determinant;
var sk_xx = argument1 - sk_parent[SK_BONE.XWorld];
var sk_yy = argument2 - sk_parent[SK_BONE.YWorld];
// use inverse matrix to calculate the local position of the end effector
var sk_tx = sk_im00*sk_xx+sk_im10*sk_yy - sk_bone_ax;
var sk_ty = sk_im01*sk_xx+sk_im11*sk_yy - sk_bone_ay;
// use local position to set new rotation
var sk_rotationIK = -darctan2(sk_ty,sk_tx)-sk_bone_arotation-sk_bone_axshear;
if(sk_bone_axscale<0){ // make sure whatever the scale the bone points towards the effector
	sk_rotationIK += 180;
}
// apply
sk_bone_updateWorldTransform_ext(
	sk_bone,
	sk_bone_ax,
	sk_bone_ay,
	sk_bone_axscale,
	sk_bone_ayscale,
	sk_bone_axshear,
	sk_bone_ayshear,
	sk_bone_arotation+sk_rotationIK*argument3,
	sk_transformMode_normal
);