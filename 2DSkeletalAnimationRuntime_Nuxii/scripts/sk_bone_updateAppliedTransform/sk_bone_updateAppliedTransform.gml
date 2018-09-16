/// @desc uses the world transform of the bone to aproximate the applied transform of the bone relative to the supplied parent
/// @param bone
var sk_mx = argument0[SK_BONE.XWorld];
var sk_my = argument0[SK_BONE.YWorld];
var sk_m00 = argument0[SK_BONE.m00];
var sk_m01 = argument0[SK_BONE.m01];
var sk_m10 = argument0[SK_BONE.m10];
var sk_m11 = argument0[SK_BONE.m11];
var sk_parent = argument0[SK_BONE.parent];
if(sk_struct_isof(sk_parent,sk_type_bone)){
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
	// multiply inverse matrix by child matrix to get local transformation matrix
	var sk_xx = sk_mx - sk_parent[SK_BONE.XWorld];
	var sk_yy = sk_my - sk_parent[SK_BONE.YWorld];
	var sk_a = sk_m00;	var sk_b = sk_m01;
	var sk_c = sk_m10;	var sk_d = sk_m11;
	sk_mx = sk_im00*sk_xx+sk_im10*sk_yy;
	sk_my = sk_im01*sk_xx+sk_im11*sk_yy;
	sk_m00 = sk_im00*sk_a+sk_im10*sk_b;
	sk_m01 = sk_im01*sk_a+sk_im11*sk_b;
	sk_m10 = sk_im00*sk_c+sk_im10*sk_d;
	sk_m11 = sk_im01*sk_c+sk_im11*sk_d;
}
argument0[@ SK_BONE.XApplied] = sk_mx;
argument0[@ SK_BONE.YApplied] = sk_my;
argument0[@ SK_BONE.XScaleApplied] = point_distance(0,0,sk_m00,sk_m01);
argument0[@ SK_BONE.YScaleApplied] = point_distance(0,0,sk_m10,sk_m11);
var sk_rotation = -darctan2(sk_m01,sk_m00);
argument0[@ SK_BONE.XShearApplied] = 0;
argument0[@ SK_BONE.YShearApplied] = angle_difference(-darctan2(sk_m11,sk_m10),sk_rotation-90);
argument0[@ SK_BONE.rotationApplied] = sk_rotation;
// bad applied transform has been corrected
argument0[@ SK_BONE.badApplied] = false;
// set the corrected transformMode to "normal"
argument0[@ SK_BONE.transformModeCorrected] = sk_transformMode_normal;