/// @desc applies the pose at the given time in the timeline
/// @param timeline
/// @param time
/// @param mixPose
/// @param alpha
/// @param duration ? leave this as -1 if not required
var sk_keyframes = argument0[sk_timeline_header_keyframes];
var sk_body = argument0[sk_timeline_header_body];
if(!sk_struct_exists(sk_body,sk_type_constraint_transform)){ return; }
var sk_time = argument1;
var sk_mix = argument2;
var sk_alpha = argument3;
var sk_loop = argument4>0; // not -1
var sk_duration = argument4;
// find frames
var sk_keyframe_last = ds_list_size(sk_keyframes)-SK_TIMELINE_TRANSFORM.kf_ENTRIES; if(sk_keyframe_last<0){ return; } // not enough frames
var sk_keyframe_prev = sk_list_search_binary(sk_keyframes,sk_time,SK_TIMELINE_TRANSFORM.kf_ENTRIES,0,sk_keyframe_last);
var sk_keyframe_next = sk_keyframe_prev+SK_TIMELINE_TRANSFORM.kf_ENTRIES;
// get times
var sk_t1 = sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_TRANSFORM.kf_time]; if(sk_t1>sk_time){ return; } // keyframe has not been reached yet
var sk_t2 = 0;
if(sk_loop&&(sk_keyframe_next>sk_keyframe_last)){
	sk_keyframe_next = 0; // first frame
	sk_t2 = sk_duration;
} else {
	sk_keyframe_next = min(sk_keyframe_next,sk_keyframe_last);
	sk_t2 = sk_keyframes[| sk_keyframe_next+SK_TIMELINE_TRANSFORM.kf_time];
}
// interpolate
var sk_interpolation = sk_erp(sk_t1,sk_t2,sk_time,sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_TRANSFORM.kf_tweenEasing]);
var sk_translate = lerp(sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_TRANSFORM.kf_translateMix],sk_keyframes[| sk_keyframe_next+SK_TIMELINE_TRANSFORM.kf_translateMix],sk_interpolation);
var sk_scale = lerp(sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_TRANSFORM.kf_scaleMix],sk_keyframes[| sk_keyframe_next+SK_TIMELINE_TRANSFORM.kf_scaleMix],sk_interpolation);
var sk_shear = lerp(sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_TRANSFORM.kf_shearMix],sk_keyframes[| sk_keyframe_next+SK_TIMELINE_TRANSFORM.kf_shearMix],sk_interpolation);
var sk_rotate = lerp(sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_TRANSFORM.kf_rotateMix],sk_keyframes[| sk_keyframe_next+SK_TIMELINE_TRANSFORM.kf_rotateMix],sk_interpolation);
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