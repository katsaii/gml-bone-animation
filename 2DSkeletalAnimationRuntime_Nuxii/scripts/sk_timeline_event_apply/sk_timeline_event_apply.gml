/// @desc applies the pose at the given time in the timeline
/// @param timeline
/// @param timeLast
/// @param time
/// @param alpha
if(argument3>=0.5){
	var sk_keyframes = argument0[sk_timeline_header_keyframes];
	var sk_body = argument0[sk_timeline_header_body];
	if(!sk_struct_exists(sk_body,sk_type_event)){ return; }
	var sk_timeLast = argument1;
	var sk_time = argument2;
	// determine whether to throw the event
	var sk_keyframe_first = 0;
	var sk_keyframe_last = ds_list_size(sk_keyframes)-SK_TIMELINE_EVENT.kf_ENTRIES; if(sk_keyframe_last<0){ return; }
	if(sk_timeLast<sk_time){
		var sk_keyframe = sk_list_search_binary(sk_keyframes,sk_time,SK_TIMELINE_EVENT.kf_ENTRIES,0,sk_keyframe_last);
		var sk_keyframe_time = sk_keyframes[| sk_keyframe+SK_TIMELINE_EVENT.kf_time];
		if((sk_timeLast<=sk_keyframe_time)&&(sk_time>sk_keyframe_time)){
			// last frame time is below the event time and current time is beyond the event time
			sk_event_call(
				sk_body,
				sk_keyframes[| sk_keyframe+SK_TIMELINE_EVENT.kf_bone],
				sk_keyframes[| sk_keyframe+SK_TIMELINE_EVENT.kf_string],
				sk_keyframes[| sk_keyframe+SK_TIMELINE_EVENT.kf_real],
				sk_keyframes[| sk_keyframe+SK_TIMELINE_EVENT.kf_int],
				sk_keyframes[| sk_keyframe+SK_TIMELINE_EVENT.kf_sound]
			);
		}
	} else {
		// throw edge events
		var sk_first_time = sk_keyframes[| sk_keyframe_first+SK_TIMELINE_EVENT.kf_time];
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
		}
	}
}