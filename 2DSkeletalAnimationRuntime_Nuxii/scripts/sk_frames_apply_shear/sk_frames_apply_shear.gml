/// @desc applies the pose at the given time in the timeline
/// @param keyframes
/// @param target
/// @param time (the time to search for)
/// @param timeLast (the previous frame time)
/// @param frameA
/// @param frameB
/// @param frameA_time
/// @param frameB_time
/// @param mixPose
/// @param alpha
var sk_keyframes = argument0;
var sk_target = argument1;
var sk_time = argument2;
var sk_timeLast = argument3;
var sk_keyframe_prev = argument4;
var sk_keyframe_next = argument5;
var sk_keyframe_prev_time = argument6;
var sk_keyframe_next_time = argument7;
var sk_mix = argument8;
var sk_alpha = argument9;
// interpolate
var sk_interpolation = sk_erp(sk_keyframe_prev_time,sk_keyframe_next_time,sk_time,sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_FRAMES_SHEAR.tweenEasing]);
var sk_x = lerp(sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_FRAMES_SHEAR.dx],sk_keyframes[| sk_keyframe_next+SK_TIMELINE_FRAMES_SHEAR.dx],sk_interpolation);
var sk_y = lerp(sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_FRAMES_SHEAR.dy],sk_keyframes[| sk_keyframe_next+SK_TIMELINE_FRAMES_SHEAR.dy],sk_interpolation);
// apply
switch(sk_mix){
	case sk_mixPose_mix:
		var sk_xshear = sk_target[SK_BONE.XShearApplied];
		var sk_yshear = sk_target[SK_BONE.YShearApplied];
		sk_target[@ SK_BONE.XShearApplied] = sk_xshear-angle_difference(sk_xshear,sk_target[SK_BONE.XShear]+sk_x)*sk_alpha;
		sk_target[@ SK_BONE.YShearApplied] = sk_yshear-angle_difference(sk_yshear,sk_target[SK_BONE.YShear]+sk_y)*sk_alpha;
	break;
	case sk_mixPose_add: 
		sk_target[@ SK_BONE.XShearApplied] = sk_target[SK_BONE.XShearApplied]+sk_x*sk_alpha;
		sk_target[@ SK_BONE.YShearApplied] = sk_target[SK_BONE.YShearApplied]+sk_y*sk_alpha;
	break;
	case sk_mixPose_overwrite:
		sk_target[@ SK_BONE.XShear] = sk_target[SK_BONE.XShear]+sk_x*sk_alpha;
		sk_target[@ SK_BONE.YShear] = sk_target[SK_BONE.YShear]+sk_y*sk_alpha;
	break;
}