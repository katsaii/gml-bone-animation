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
if(sk_bone[sk_bone_var_invalidAppliedTransform]){
	sk_bone_updateAppliedTransform(sk_bone);
}
var sk_target_appliedTransform = sk_target[sk_bone_var_appliedTransform];
var sk_bone_appliedTransform = sk_bone[sk_bone_var_appliedTransform];
// set translate
var sk_translateMix = argument8;
if(sk_translateMix!=0){
	sk_bone_appliedTransform[@ 0] += (sk_target_appliedTransform[0]+argument2)*sk_translateMix;
	sk_bone_appliedTransform[@ 1] += (sk_target_appliedTransform[1]+argument3)*sk_translateMix;
}
// set scale
var sk_scaleMix = argument9;
if(sk_scaleMix!=0){
	sk_bone_appliedTransform[@ 2] *= lerp(1,sk_target_appliedTransform[2]+argument4,sk_scaleMix);
	sk_bone_appliedTransform[@ 3] *= lerp(1,sk_target_appliedTransform[3]+argument5,sk_scaleMix);
}
// set shear
var sk_shearMix = argument10;
if(sk_shearMix!=0){
	sk_bone_appliedTransform[@ 5] += (sk_target_appliedTransform[5]+argument6)*sk_shearMix;
}
// set rotation
var sk_rotationMix = argument11;
if(sk_rotationMix!=0){
	sk_bone_appliedTransform[@ 6] += (sk_target_appliedTransform[6]+argument7)*sk_rotationMix;
}
// apply
sk_bone_updateWorldTransform(sk_bone);