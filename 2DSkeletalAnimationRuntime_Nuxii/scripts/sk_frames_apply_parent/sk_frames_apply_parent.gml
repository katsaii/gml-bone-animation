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
if(sk_alpha>=0.5){
	// get bone parent
	var sk_bone = sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_FRAMES_PARENT.bone];
	// apply
	switch(sk_mix){
		case sk_mixPose_mix: case sk_mixPose_add:
			sk_target[@ SK_SLOT.boneFinal] = sk_bone;
		break;
		case sk_mixPose_overwrite:
			sk_target[@ SK_SLOT.bone] = sk_bone;
		break;
	}
}