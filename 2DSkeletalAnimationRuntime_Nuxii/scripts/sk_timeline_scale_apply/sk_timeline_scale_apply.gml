/// @desc applies the pose at the given time in the timeline
/// @param timeline
/// @param time
/// @param mixPose
/// @param alpha
/// @param duration ? leave this as -1 if not required
var sk_keyframes = argument0[sk_timeline_header_keyframes];
var sk_body = argument0[sk_timeline_header_body];
if(!sk_struct_exists(sk_body,sk_type_bone)){ return; }
var sk_time = argument1;
var sk_mix = argument2;
var sk_alpha = argument3;
var sk_loop = argument4>0; // not -1
var sk_duration = argument4;
// find frames
var sk_keyframe_last = ds_list_size(sk_keyframes)-SK_TIMELINE_SCALE.kf_ENTRIES; if(sk_keyframe_last<0){ return; } // not enough frames
var sk_keyframe_prev = sk_list_search_binary(sk_keyframes,sk_time,SK_TIMELINE_SCALE.kf_ENTRIES,0,sk_keyframe_last);
var sk_keyframe_next = sk_keyframe_prev+SK_TIMELINE_SCALE.kf_ENTRIES;
// get times
var sk_t1 = sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_SCALE.kf_time]; if(sk_t1>sk_time){ return; } // keyframe has not been reached yet
var sk_t2 = 0;
if(sk_loop&&(sk_keyframe_next>sk_keyframe_last)){
	sk_keyframe_next = 0; // first frame
	sk_t2 = sk_duration;
} else {
	sk_keyframe_next = min(sk_keyframe_next,sk_keyframe_last);
	sk_t2 = sk_keyframes[| sk_keyframe_next+SK_TIMELINE_SCALE.kf_time];
}
// interpolate
var sk_interpolation = sk_erp(sk_t1,sk_t2,sk_time,sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_SCALE.kf_tweenEasing]);
var sk_x = lerp(sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_SCALE.kf_x],sk_keyframes[| sk_keyframe_next+SK_TIMELINE_SCALE.kf_x],sk_interpolation);
var sk_y = lerp(sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_SCALE.kf_y],sk_keyframes[| sk_keyframe_next+SK_TIMELINE_SCALE.kf_y],sk_interpolation);
// apply
switch(sk_mix){
	case sk_mixPose_mix:
		sk_body[@ SK_BONE.XScaleApplied] = lerp(sk_body[SK_BONE.XScaleApplied],sk_body[SK_BONE.XScale]*sk_x,sk_alpha);
		sk_body[@ SK_BONE.YScaleApplied] = lerp(sk_body[SK_BONE.YScaleApplied],sk_body[SK_BONE.YScale]*sk_y,sk_alpha);
	break;
	case sk_mixPose_add: 
		sk_body[@ SK_BONE.XScaleApplied] = sk_body[SK_BONE.XScaleApplied]*lerp(1,sk_x,sk_alpha);
		sk_body[@ SK_BONE.YScaleApplied] = sk_body[SK_BONE.YScaleApplied]*lerp(1,sk_y,sk_alpha);
	break;
	case sk_mixPose_overwrite:
		sk_body[@ SK_BONE.XScale] = sk_body[SK_BONE.XScale]*lerp(1,sk_x,sk_alpha);
		sk_body[@ SK_BONE.YScale] = sk_body[SK_BONE.YScale]*lerp(1,sk_y,sk_alpha);
	break;
}