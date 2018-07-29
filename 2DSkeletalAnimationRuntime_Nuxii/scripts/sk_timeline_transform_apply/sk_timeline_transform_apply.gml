/// @desc applies the pose at the given time in the timeline
/// @param keyframes
/// @param body
/// @param time (the time to search for)
/// @param timeLast (the previous frame time)
/// @param frameA
/// @param frameB
/// @param frameA_time
/// @param frameB_time
/// @param mixPose
/// @param alpha
var sk_keyframes = argument0;
var sk_body = argument1; if(!sk_struct_exists(sk_body,sk_type_constraint_transform)){ return; }
var sk_time = argument2;
var sk_timeLast = argument3;
var sk_keyframe_prev = argument4;
var sk_keyframe_next = argument5;
var sk_keyframe_prev_time = argument6;
var sk_keyframe_next_time = argument7;
var sk_mix = argument8;
var sk_alpha = argument9;
// interpolate
var sk_interpolation = sk_erp(sk_keyframe_prev_time,sk_keyframe_next_time,sk_time,sk_keyframes[| sk_keyframe_prev+sk_keyframe_transform.tweenEasing]);
var sk_translate = lerp(sk_keyframes[| sk_keyframe_prev+sk_keyframe_transform.translateMix],sk_keyframes[| sk_keyframe_next+sk_keyframe_transform.translateMix],sk_interpolation);
var sk_scale = lerp(sk_keyframes[| sk_keyframe_prev+sk_keyframe_transform.scaleMix],sk_keyframes[| sk_keyframe_next+sk_keyframe_transform.scaleMix],sk_interpolation);
var sk_shear = lerp(sk_keyframes[| sk_keyframe_prev+sk_keyframe_transform.shearMix],sk_keyframes[| sk_keyframe_next+sk_keyframe_transform.shearMix],sk_interpolation);
var sk_rotate = lerp(sk_keyframes[| sk_keyframe_prev+sk_keyframe_transform.rotateMix],sk_keyframes[| sk_keyframe_next+sk_keyframe_transform.rotateMix],sk_interpolation);
// apply
switch(sk_mix){
	case sk_mixPose_mix: case sk_mixPose_add:
		sk_body[@ SK_CONSTRAINT_TRANSFORM.translateMixFinal] = lerp(sk_body[SK_CONSTRAINT_TRANSFORM.translateMixFinal],sk_translate,sk_alpha);
		sk_body[@ SK_CONSTRAINT_TRANSFORM.scaleMixFinal] = lerp(sk_body[SK_CONSTRAINT_TRANSFORM.scaleMixFinal],sk_scale,sk_alpha);
		sk_body[@ SK_CONSTRAINT_TRANSFORM.shearMixFinal] = lerp(sk_body[SK_CONSTRAINT_TRANSFORM.shearMixFinal],sk_shear,sk_alpha);
		sk_body[@ SK_CONSTRAINT_TRANSFORM.rotateMixFinal] = lerp(sk_body[SK_CONSTRAINT_TRANSFORM.rotateMixFinal],sk_rotate,sk_alpha);
	break;
	case sk_mixPose_overwrite:
		sk_body[@ SK_CONSTRAINT_TRANSFORM.translateMix] = lerp(sk_body[SK_CONSTRAINT_TRANSFORM.translateMix],sk_translate,sk_alpha);
		sk_body[@ SK_CONSTRAINT_TRANSFORM.scaleMix] = lerp(sk_body[SK_CONSTRAINT_TRANSFORM.scaleMix],sk_scale,sk_alpha);
		sk_body[@ SK_CONSTRAINT_TRANSFORM.shearMix] = lerp(sk_body[SK_CONSTRAINT_TRANSFORM.shearMix],sk_shear,sk_alpha);
		sk_body[@ SK_CONSTRAINT_TRANSFORM.rotateMix] = lerp(sk_body[SK_CONSTRAINT_TRANSFORM.rotateMix],sk_rotate,sk_alpha);
	break;
}