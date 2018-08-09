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
var sk_body = argument1; if(!SK_CONFIG_RELEASE_MODE&&!sk_struct_exists(sk_body,sk_type_event)){ return; }
var sk_time = argument2;
var sk_timeLast = argument3;
var sk_keyframe_prev = argument4;
var sk_keyframe_next = argument5;
var sk_keyframe_prev_time = argument6;
var sk_keyframe_next_time = argument7;
var sk_mix = argument8;
var sk_alpha = argument9;
if(sk_alpha>=0.5){
	if(sk_timeLast==sk_time){
		// don't call any events
		return;
	} else if(sk_timeLast<sk_time){
		if((sk_timeLast<=sk_keyframe_prev_time)&&(sk_time>sk_keyframe_prev_time)){
			// last frame time is below the event time and current time is beyond the event time
			sk_event_call(
				sk_body,
				sk_keyframes[| sk_keyframe_prev+sk_keyframe_event.bone],
				sk_keyframes[| sk_keyframe_prev+sk_keyframe_event.str],
				sk_keyframes[| sk_keyframe_prev+sk_keyframe_event.float],
				sk_keyframes[| sk_keyframe_prev+sk_keyframe_event.int],
				sk_keyframes[| sk_keyframe_prev+sk_keyframe_event.sound]
			);
		}
	} else {
		// throw edge events
		/*var sk_first_time = sk_keyframes[| sk_keyframe_first+SK_TIMELINE_EVENT.kf_time];
		var sk_last_time = sk_keyframes[| sk_keyframe_last+SK_TIMELINE_EVENT.kf_time];
		if(sk_first_time < sk_time){
			if((sk_keyframe_first!=sk_keyframe_last)&&(sk_last_time >= sk_timeLast)){
				// throw last frame if it is unique
				sk_event_call(
					sk_body,
					sk_keyframes[| sk_keyframe_last+SK_TIMELINE_EVENT.kf_bone],
					sk_keyframes[| sk_keyframe_last+SK_TIMELINE_EVENT.kf_string],
					sk_keyframes[| sk_keyframe_last+SK_TIMELINE_EVENT.kf_real],
					sk_keyframes[| sk_keyframe_last+SK_TIMELINE_EVENT.kf_int],
					sk_keyframes[| sk_keyframe_last+SK_TIMELINE_EVENT.kf_sound]
				);
				// NOTE: the last frame gets thrown before the first frame because it is more useful that way, for example:
				//			- you could end all sounds before playing another at the start of the animation
			}
			// throw first frame
			sk_event_call(
				sk_body,
				sk_keyframes[| sk_keyframe_first+SK_TIMELINE_EVENT.kf_bone],
				sk_keyframes[| sk_keyframe_first+SK_TIMELINE_EVENT.kf_string],
				sk_keyframes[| sk_keyframe_first+SK_TIMELINE_EVENT.kf_real],
				sk_keyframes[| sk_keyframe_first+SK_TIMELINE_EVENT.kf_int],
				sk_keyframes[| sk_keyframe_first+SK_TIMELINE_EVENT.kf_sound]
			);
		} else if(sk_last_time >= sk_timeLast){
			// throw last frame
			sk_event_call(
				sk_body,
				sk_keyframes[| sk_keyframe_last+SK_TIMELINE_EVENT.kf_bone],
				sk_keyframes[| sk_keyframe_last+SK_TIMELINE_EVENT.kf_string],
				sk_keyframes[| sk_keyframe_last+SK_TIMELINE_EVENT.kf_real],
				sk_keyframes[| sk_keyframe_last+SK_TIMELINE_EVENT.kf_int],
				sk_keyframes[| sk_keyframe_last+SK_TIMELINE_EVENT.kf_sound]
			);
		}*/
	}
}