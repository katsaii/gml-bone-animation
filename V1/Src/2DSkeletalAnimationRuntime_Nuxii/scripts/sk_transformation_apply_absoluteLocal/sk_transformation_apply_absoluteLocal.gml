/// @desc applys transformations between a bone and parent
/// @param bone
/// @param boneParent
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
if(sk_bone[SK_BONE.badApplied]){
	sk_bone_updateAppliedTransform(sk_bone);
}
var sk_bone_ax = sk_bone[SK_BONE.XApplied];
var sk_bone_ay = sk_bone[SK_BONE.YApplied];
var sk_bone_axscale = sk_bone[SK_BONE.XScaleApplied];
var sk_bone_ayscale = sk_bone[SK_BONE.YScaleApplied];
var sk_bone_ayshear = sk_bone[SK_BONE.YShearApplied];
var sk_bone_arotation = sk_bone[SK_BONE.rotationApplied];
// set translate
var sk_translateMix = argument8;
if(sk_translateMix!=0){
	sk_bone_ax = lerp(sk_bone_ax,sk_target[SK_BONE.XApplied]+argument2,sk_translateMix);
	sk_bone_ay = lerp(sk_bone_ay,sk_target[SK_BONE.YApplied]+argument3,sk_translateMix);
}
// set scale
var sk_scaleMix = argument9;
if(sk_scaleMix!=0){
	sk_bone_axscale = lerp(sk_bone_axscale,sk_target[SK_BONE.XScaleApplied]+argument4,sk_scaleMix);
	sk_bone_ayscale = lerp(sk_bone_ayscale,sk_target[SK_BONE.YScaleApplied]+argument5,sk_scaleMix);
}
// set shear
var sk_shearMix = argument10;
if(sk_shearMix!=0){
	sk_bone_ayshear += -angle_difference(sk_bone_ayshear,sk_target[SK_BONE.YShearApplied]+argument6)*sk_shearMix;
}
// set rotation
var sk_rotationMix = argument11;
if(sk_rotationMix!=0){
	sk_bone_arotation += -angle_difference(sk_bone_arotation,sk_target[SK_BONE.rotationApplied]+argument7)*sk_rotationMix;
}
// apply
sk_bone_updateWorldTransform_ext(
	sk_bone,
	sk_bone_ax,sk_bone_ay,
	sk_bone_axscale,sk_bone_ayscale,
	sk_bone[SK_BONE.XShearApplied],sk_bone_ayshear,
	sk_bone_arotation,
	sk_bone[SK_BONE.transformMode]
);