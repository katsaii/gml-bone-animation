/// @desc applies the pose at the given time in the timeline
/// @param timeline
/// @param time (the time to search for)
/// @param timeLast (the previous frame time)
/// @param timeStart (the time to start from)
/// @param timeEnd (the time end from)
/// @param mixPose
/// @param alpha
var sk_timeline = argument0;
var sk_time = argument1;
var sk_timeLast = argument2;
var sk_timeStart = argument3;
var sk_timeEnd = argument4;
var sk_mix = argument5;
var sk_alpha = argument6;
var sk_keyframes = sk_timeline[SK_TIMELINE.keyframes];
var sk_body = sk_timeline[SK_TIMELINE.body];
var sk_keyframe_ENTRIES = sk_timeline[SK_TIMELINE.keyframe_ENTRIES];
var sk_updateScript = sk_timeline[SK_TIMELINE.updateScript];
if(script_exists(sk_updateScript)){
	// compile frames
	var sk_loop = sk_timeStart<sk_timeEnd;
	// find frames
	var sk_keyframe_last = ds_list_size(sk_keyframes)-sk_keyframe_ENTRIES; if(sk_keyframe_last<0){ return; } // not enough frames
	var sk_keyframe_prev = sk_list_search_binary(sk_keyframes,sk_time,sk_keyframe_ENTRIES,0,sk_keyframe_last);
	var sk_keyframe_next = min(sk_keyframe_prev+sk_keyframe_ENTRIES,sk_keyframe_last);
	// get times
	var sk_keyframe_prev_time = sk_keyframes[| sk_keyframe_prev+sk_timeline_keyframe_time];
	var sk_keyframe_next_time = sk_keyframes[| sk_keyframe_next+sk_timeline_keyframe_time];
	// control looping state
	if(sk_loop){
		// tba...
	} else {
		if(sk_keyframe_prev_time>sk_time){
			// keyframe has not been reached yet
			return;
		}
	}
	// submit
	script_execute(
		sk_updateScript,
		sk_keyframes, // keyframes
		sk_body, // body
		sk_time, // time
		sk_timeLast, // timeLast
		sk_keyframe_prev, // frameA
		sk_keyframe_next, // frameB
		sk_keyframe_prev_time, // frameA_time
		sk_keyframe_next_time, // frameB_time
		sk_mix, // mixPose
		sk_alpha // alpha
	);
}