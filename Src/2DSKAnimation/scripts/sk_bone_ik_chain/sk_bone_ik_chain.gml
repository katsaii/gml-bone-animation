/// @desc applys IK between a bone and an end effector
/// @param bone
/// @param targetx
/// @param targety
/// @param bendDir
/// @param alpha
var sk_child = argument0;
var sk_parent = sk_child[sk_bone_var_parent];
var sk_targetX = argument1;
var sk_targetY = argument2;
var sk_bendDir = argument3;
var sk_alpha = argument4;
// confirm applied state
if(sk_parent[sk_bone_var_invalidAppliedTransform]){
	sk_bone_updateAppliedTransform(sk_parent);
}
if(sk_child[sk_bone_var_invalidAppliedTransform]){
	sk_bone_updateAppliedTransform(sk_child);
}
// child local transforms
var sk_child_appliedTransform = sk_child[sk_bone_var_appliedTransform];
var sk_cax = sk_child_appliedTransform[0];
var sk_cay = sk_child_appliedTransform[1];
var sk_caxscale = sk_child_appliedTransform[2];
var sk_cayscale = sk_child_appliedTransform[3];
var sk_caxshear = sk_child_appliedTransform[4];
//var sk_cayshear = sk_child_appliedTransform[5];
var sk_carotation = sk_child_appliedTransform[6];
// parent local transforms
var sk_parent_appliedTransform = sk_parent[sk_bone_var_appliedTransform];
var sk_pax = sk_parent_appliedTransform[0];
var sk_pay = sk_parent_appliedTransform[1];
var sk_paxscale = sk_parent_appliedTransform[2];
var sk_payscale = sk_parent_appliedTransform[3];
var sk_parotation = sk_parent_appliedTransform[6]+sk_parent_appliedTransform[4];
// normalise scales
if(sk_caxscale<0){
	sk_caxscale = -sk_caxscale;
	sk_cayscale = -sk_cayscale;
}
if(sk_paxscale<0){
	sk_paxscale = -sk_paxscale;
	sk_payscale = -sk_payscale;
}
var sk_flipscale = 1;
if(sk_payscale<0){
	sk_payscale = -sk_payscale;
	sk_flipscale = -1;
}
// get the parent's parent matrix
var sk_parentparent = sk_parent[sk_bone_var_parent];
var sk_pp_m00 = sk_parentparent[sk_bone_var_m00];
var sk_pp_m01 = sk_parentparent[sk_bone_var_m01];
var sk_pp_m10 = sk_parentparent[sk_bone_var_m10];
var sk_pp_m11 = sk_parentparent[sk_bone_var_m11];
// get parent bone's parent bone's inverse matrix
var sk_determinant = sk_pp_m00*sk_pp_m11 - sk_pp_m01*sk_pp_m10;
	sk_determinant = (sk_determinant==0) ? 0 : 1/sk_determinant; 
var sk_im00 = sk_pp_m11*sk_determinant;
var sk_im01 = -sk_pp_m01*sk_determinant;
var sk_im10 = -sk_pp_m10*sk_determinant;
var sk_im11 = sk_pp_m00*sk_determinant;
var sk_xx = sk_targetX - sk_parentparent[sk_bone_var_x];
var sk_yy = sk_targetY - sk_parentparent[sk_bone_var_y];
// use inverse matrix to calculate the local position of the end effector
var sk_tx = sk_im00*sk_xx+sk_im10*sk_yy - sk_pax;
var sk_ty = sk_im01*sk_xx+sk_im11*sk_yy - sk_pay;
var sk_dd = sk_tx*sk_tx+sk_ty*sk_ty;
var sk_dir = -darctan2(sk_ty,sk_tx);
// determine whether the parent bone is of uniform scale
if((sk_paxscale-sk_payscale)==0){
	// uniform
	var sk_r1 = point_distance(0,0,sk_cax,sk_cay)*sk_paxscale;
	var sk_r2 = sk_child[sk_bone_var_length]*sk_caxscale*sk_paxscale;
	var sk_a2 = darccos(clamp((sk_dd-sk_r1*sk_r1-sk_r2*sk_r2)/max(2*sk_r1*sk_r2,0.0000001),-1,1))*-sk_bendDir;
	var sk_a1 = sk_dir-darctan2(sk_r2*dsin(sk_a2),sk_r1+sk_r2*dcos(sk_a2));
	// update applied transforms and apply
	var sk_offsetShear = -darctan2(sk_cay,sk_cax);
	var sk_rotationIK = angle_difference(sk_a1-sk_offsetShear,sk_parotation);
	sk_parent_appliedTransform[@ 3] = sk_flipscale*sk_payscale;
	sk_parent_appliedTransform[@ 4] = 0;
	sk_parent_appliedTransform[@ 5] = 0;
	sk_parent_appliedTransform[@ 6] = sk_parotation+sk_rotationIK*sk_alpha;
	sk_parent_appliedTransform[@ 7] = sk_transformMode_normal;
	sk_bone_updateWorldTransform(sk_parent);
	sk_rotationIK = sk_flipscale*sk_a2+sk_offsetShear-sk_carotation-sk_caxshear;
	sk_child_appliedTransform[@ 6] = sk_carotation+sk_rotationIK*sk_alpha;
	sk_child_appliedTransform[@ 7] = sk_transformMode_normal;
	sk_bone_updateWorldTransform(sk_child);
} else {
	// non-uniform
	var sk_scale = sk_paxscale/max(sk_payscale,0.0000001);
	var sk_r1 = sk_parent[sk_bone_var_length]*sk_payscale;
	var sk_r2 = sk_child[sk_bone_var_length]*sk_caxscale*sk_payscale;
	// calculate quadratic roots of ellipse-circle intersection
	var sk_a = 1-sk_scale*sk_scale;
	var sk_b = 2*sk_scale*sk_r1;
	var sk_c = sk_scale*sk_scale*(sk_r1*sk_r1-sk_r2*sk_r2+sk_dd);
	var sk_discriminant = sk_b*sk_b-4*sk_a*sk_c;
	var sk_xroot = -(-sk_b+sqrt(max(0,sk_discriminant)))/(2*sk_a);
	var sk_yroot = -sk_bendDir*sqrt(max(0,sk_dd-sk_xroot*sk_xroot));
	var sk_a1 = -darctan2(sk_yroot,sk_xroot);
	// apply
	var sk_rotationIK = angle_difference(sk_dir+sk_a1,sk_parotation);
	sk_parent_appliedTransform[@ 3] = sk_flipscale*sk_payscale;
	sk_parent_appliedTransform[@ 4] = 0;
	sk_parent_appliedTransform[@ 5] = 0;
	sk_parent_appliedTransform[@ 6] = sk_parotation+sk_rotationIK*sk_alpha;
	sk_parent_appliedTransform[@ 7] = sk_transformMode_normal;
	sk_bone_updateWorldTransform(sk_parent);
	sk_child_appliedTransform[@ 1] = 0; 
	sk_bone_ik(sk_child,sk_targetX,sk_targetY,sk_alpha); // temp solution (a lot slower than setting it directly), but it works!
}