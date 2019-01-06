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
if(sk_bone[sk_data_bone.invalidAppliedTransform]){
	sk_bone_update_applied(sk_bone);
}
// set translate
var sk_translateMix = argument8;
if(sk_translateMix!=0){
	sk_bone[@ sk_data_bone.appliedX] = lerp(sk_bone[sk_data_bone.appliedX],sk_target[sk_data_bone.appliedX]+argument2,sk_translateMix);
	sk_bone[@ sk_data_bone.appliedY] = lerp(sk_bone[sk_data_bone.appliedY],sk_target[sk_data_bone.appliedY]+argument3,sk_translateMix);
}
// set scale
var sk_scaleMix = argument9;
if(sk_scaleMix!=0){
	sk_bone[@ sk_data_bone.appliedXScale] = lerp(sk_bone[sk_data_bone.appliedXScale],sk_target[sk_data_bone.appliedXScale]+argument4,sk_scaleMix);
	sk_bone[@ sk_data_bone.appliedYScale] = lerp(sk_bone[sk_data_bone.appliedYScale],sk_target[sk_data_bone.appliedYScale]+argument5,sk_scaleMix);
}
// set shear
var sk_shearMix = argument10;
if(sk_shearMix!=0){
	sk_bone[@ sk_data_bone.appliedYShear] += -angle_difference(sk_bone[sk_data_bone.appliedYShear],sk_target[sk_data_bone.appliedYShear]+argument6)*sk_shearMix;
}
// set rotation
var sk_rotationMix = argument11;
if(sk_rotationMix!=0){
	sk_bone[@ sk_data_bone.appliedRotation] += -angle_difference(sk_bone[sk_data_bone.appliedRotation],sk_target[sk_data_bone.appliedRotation]+argument7)*sk_rotationMix;
}
// apply
sk_bone_update(sk_bone);