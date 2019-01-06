__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_bone_exists(argument0);
/// @desc applys transformations between a bone and parent
/// @param bone
/// @param target
/// @param xoffset
/// @param yoffset
/// @param xscaleoffset
/// @param yscaleoffset
/// @param yshearoffset
/// @param rotationoffset
/// @param translationMix
/// @param scaleMix
/// @param shearMix
/// @param rotationMix
var sk_bone = argument0;
var sk_target = argument1;
var sk_updated = false;
// determine whether the target bone has a negative scale
var sk_target_m00 = sk_target[sk_data_bone.m00];
var sk_target_m01 = sk_target[sk_data_bone.m01];
var sk_target_m10 = sk_target[sk_data_bone.m10];
var sk_target_m11 = sk_target[sk_data_bone.m11];
var sk_target_reflect = ((sk_target_m00*sk_target_m11 - sk_target_m01*sk_target_m10)<=0) ? 1 : -1;
// set translate
var sk_translateMix = argument8;
if(sk_translateMix!=0){
	var sk_targetX = sk_target[sk_data_bone.worldX]+sk_target_m00*argument2+sk_target_m10*argument3;
	var sk_targetY = sk_target[sk_data_bone.worldY]+sk_target_m01*argument2+sk_target_m11*argument3;
	sk_bone[@ sk_data_bone.worldX] = sk_bone[sk_data_bone.worldX]+sk_targetX*sk_translateMix;
	sk_bone[@ sk_data_bone.worldY] = sk_bone[sk_data_bone.worldY]+sk_targetY*sk_translateMix;
	sk_updated = true;
}
// set scale
var sk_scaleMix = argument9;
if(sk_scaleMix!=0){
	var sk_xscale = lerp(1,point_distance(0,0,sk_target_m00,sk_target_m01)+argument4,sk_scaleMix);
	var sk_yscale = lerp(1,point_distance(0,0,sk_target_m10,sk_target_m11)+argument5,sk_scaleMix);
	sk_bone[@ sk_data_bone.m00] = sk_bone[sk_data_bone.m00]*sk_xscale;
	sk_bone[@ sk_data_bone.m01] = sk_bone[sk_data_bone.m01]*sk_xscale;
	sk_bone[@ sk_data_bone.m10] = sk_bone[sk_data_bone.m10]*sk_yscale;
	sk_bone[@ sk_data_bone.m11] = sk_bone[sk_data_bone.m11]*sk_yscale;
	sk_updated = true;
}
// set shear
var sk_shearMix = argument10;
if(sk_shearMix!=0){
	var sk_deltaShear = (-angle_difference(-darctan2(sk_target_m11,sk_target_m10),-darctan2(sk_target_m01,sk_target_m00))-90+argument6*sk_target_reflect)*sk_shearMix;
	var sk_cosine = dcos(sk_deltaShear);
	var sk_sine = -dsin(sk_deltaShear);
	var sk_dx = sk_bone[sk_data_bone.m10];
	var sk_dy = sk_bone[sk_data_bone.m11];
	sk_bone[@ sk_data_bone.m10] = sk_cosine*sk_dx + sk_sine*sk_dy;
	sk_bone[@ sk_data_bone.m11] = -sk_sine*sk_dx + sk_cosine*sk_dy;
	sk_updated = true;
}
// set rotation
var sk_rotationMix = argument11;
if(sk_rotationMix!=0){
	var sk_deltaRotation = (-angle_difference(-darctan2(sk_target_m01,sk_target_m00),0)+argument7*sk_target_reflect)*sk_rotationMix;
	var sk_cosine = dcos(sk_deltaRotation);
	var sk_sine = -dsin(sk_deltaRotation);
	var sk_a = sk_bone[sk_data_bone.m00];
	var sk_b = sk_bone[sk_data_bone.m01];
	var sk_c = sk_bone[sk_data_bone.m10];
	var sk_d = sk_bone[sk_data_bone.m11];
	sk_bone[@ sk_data_bone.m00] = sk_cosine*sk_a + sk_sine*sk_b;
	sk_bone[@ sk_data_bone.m01] = -sk_sine*sk_a + sk_cosine*sk_b;
	sk_bone[@ sk_data_bone.m10] = sk_cosine*sk_c + sk_sine*sk_d;
	sk_bone[@ sk_data_bone.m11] = -sk_sine*sk_c + sk_cosine*sk_d;
	sk_updated = true;
}
// set flag
if(sk_updated){
	sk_bone[@ sk_data_bone.invalidAppliedTransform] = true;
}