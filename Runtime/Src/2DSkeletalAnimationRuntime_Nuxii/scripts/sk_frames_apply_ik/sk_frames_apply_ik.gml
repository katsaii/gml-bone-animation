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
// check whether the keyframe has been reached
if(sk_time<sk_keyframe_prev_time){ return; }
// interpolate
var sk_interpolation = sk_erp(sk_keyframe_prev_time,sk_keyframe_next_time,sk_time,sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_FRAMES_IK.tweenEasing]);
var sk_bendDir = sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_FRAMES_IK.bendDir];
var sk_weight = lerp(sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_FRAMES_IK.weight],sk_keyframes[| sk_keyframe_next+SK_TIMELINE_FRAMES_IK.weight],sk_interpolation);
// apply
switch(sk_mix){
	case sk_mixPose_mix: case sk_mixPose_add:
		sk_target[@ SK_CONSTRAINT_IK.bendDirFinal] = sk_bendDir;
		sk_target[@ SK_CONSTRAINT_IK.weightFinal] = lerp(sk_target[SK_CONSTRAINT_IK.weightFinal],sk_weight,sk_alpha);
	break;
	case sk_mixPose_overwrite:
		sk_target[@ SK_CONSTRAINT_IK.bendDir] = sk_bendDir;
		sk_target[@ SK_CONSTRAINT_IK.weight] = lerp(sk_target[SK_CONSTRAINT_IK.weight],sk_weight,sk_alpha);
	break;
}