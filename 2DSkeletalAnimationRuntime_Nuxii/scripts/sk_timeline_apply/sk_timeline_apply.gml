/// @desc applies the pose at the given time in the timeline
/// @param timeline
/// @param time (the time to search for)
/// @param timeLast (the previous frame time)
/// @param timeStart (the time to start from)
/// @param timeEnd (the time end from)
/// @param mixPose
/// @param alpha
/// @param loop
var sk_target = argument0[SK_TIMELINE.target];
var sk_keyframes = argument0[SK_TIMELINE.keyframes];
var sk_keyframe_ENTRIES = argument0[SK_TIMELINE.keyframe_ENTRIES];
var sk_script_apply = argument0[SK_TIMELINE.keyframe_applyScript];
if(sk_script_apply!=-1){
	// compile frames
	var sk_time = argument1;
	var sk_timeLast = argument2;
	var sk_timeStart = argument3;
	var sk_timeEnd = argument4;
	var sk_mix = argument5;
	var sk_alpha = argument6;
	var sk_loop = argument7;
	// get current and future frame ids
	var sk_keyframe_last = ds_list_size(sk_keyframes)-sk_keyframe_ENTRIES;
	var sk_keyframe = sk_list_search_binary(sk_keyframes,sk_time,sk_keyframe_ENTRIES,0,sk_keyframe_last);
	var sk_keyframe_next = min(sk_keyframe+sk_keyframe_ENTRIES,sk_keyframe_last);
	// get times
	var sk_keyframe_time = sk_keyframes[| sk_keyframe+sk_timeline_keyframe_time];
	var sk_keyframe_time_next = sk_keyframes[| sk_keyframe_next+sk_timeline_keyframe_time];
	// control looping state
	if(sk_loop){
		// tba...
	} else if(sk_keyframe_time>sk_time){
		// keyframe has not been reached yet
		return;
	}
	// submit
	script_execute(
		sk_script_apply,
		sk_keyframes, // keyframes
		sk_target, // target structure
		sk_time, // time
		sk_timeLast, // timeLast
		sk_keyframe, // frameA
		sk_keyframe_next, // frameB
		sk_keyframe_time, // frameA_time
		sk_keyframe_time_next, // frameB_time
		sk_mix, // mixPose
		sk_alpha // alpha
	);
}