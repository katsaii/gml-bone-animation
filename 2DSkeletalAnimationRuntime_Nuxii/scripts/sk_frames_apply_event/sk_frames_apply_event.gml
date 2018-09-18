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
	if(sk_timeLast<sk_time){
		// throw the current event frame
		if((sk_timeLast<=sk_keyframe_prev_time)&&(sk_time>sk_keyframe_prev_time)){
			sk_event_call(
				sk_target,
				sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_FRAMES_EVENT.bone],
				sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_FRAMES_EVENT.str],
				sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_FRAMES_EVENT.float],
				sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_FRAMES_EVENT.int],
				sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_FRAMES_EVENT.sound]
			);
		}
	} else if(sk_timeLast>sk_time){
		// throw edge events
		var sk_keyframe_last = ds_list_size(sk_keyframes)-1;
		var sk_keyframe_first = 0;
		if(sk_keyframes[| sk_keyframe_last+SK_TIMELINE_FRAMES_EVENT.time]>sk_timeLast){
			sk_event_call(
				sk_target,
				sk_keyframes[| sk_keyframe_last+SK_TIMELINE_FRAMES_EVENT.bone],
				sk_keyframes[| sk_keyframe_last+SK_TIMELINE_FRAMES_EVENT.str],
				sk_keyframes[| sk_keyframe_last+SK_TIMELINE_FRAMES_EVENT.float],
				sk_keyframes[| sk_keyframe_last+SK_TIMELINE_FRAMES_EVENT.int],
				sk_keyframes[| sk_keyframe_last+SK_TIMELINE_FRAMES_EVENT.sound]
			);
		}
		if(sk_keyframes[| sk_keyframe_first+SK_TIMELINE_FRAMES_EVENT.time]<sk_time){
			sk_event_call(
				sk_target,
				sk_keyframes[| sk_keyframe_first+SK_TIMELINE_FRAMES_EVENT.bone],
				sk_keyframes[| sk_keyframe_first+SK_TIMELINE_FRAMES_EVENT.str],
				sk_keyframes[| sk_keyframe_first+SK_TIMELINE_FRAMES_EVENT.float],
				sk_keyframes[| sk_keyframe_first+SK_TIMELINE_FRAMES_EVENT.int],
				sk_keyframes[| sk_keyframe_first+SK_TIMELINE_FRAMES_EVENT.sound]
			);
		}
	}
}