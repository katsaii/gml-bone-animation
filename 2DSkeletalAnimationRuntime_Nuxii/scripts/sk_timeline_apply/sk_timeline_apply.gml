/// @desc applies the pose at the given time in the timeline
/// @param timeline
/// @param time (the time to search for)
/// @param timeLast (the previous frame time)
/// @param mixPose
/// @param alpha
/// @param loopTime (the duration of the timeline to loop)
var sk_target = argument0[SK_TIMELINE.target];
var sk_keyframes = argument0[SK_TIMELINE.keyframes];
var sk_keyframe_ENTRIES = argument0[SK_TIMELINE.keyframe_ENTRIES];
var sk_script_apply = argument0[SK_TIMELINE.keyframe_applyScript];
if(sk_script_apply!=-1){
	// get current and future frame ids
	var sk_keyframe_first = 0;
	var sk_keyframe_last = ds_list_size(sk_keyframes)-sk_keyframe_ENTRIES;
	var sk_keyframe = sk_list_search_binary(sk_keyframes,argument1,sk_keyframe_ENTRIES,sk_keyframe_first,sk_keyframe_last);
	var sk_keyframe_next = min(sk_keyframe+sk_keyframe_ENTRIES,sk_keyframe_last);
	// get times
	var sk_keyframe_time = sk_keyframes[| sk_keyframe+sk_timeline_keyframe_time];
	var sk_keyframe_time_next = sk_keyframes[| sk_keyframe_next+sk_timeline_keyframe_time];
	var sk_keyframe_time_first = sk_keyframes[| sk_keyframe_first+sk_timeline_keyframe_time];
	var sk_keyframe_time_last = sk_keyframes[| sk_keyframe_last+sk_timeline_keyframe_time];
	// control looping state
	if(argument5>sk_keyframe_time_last){
		// loop back to the first keyframe
		if(argument1>sk_keyframe_time_last){
			sk_keyframe_next = sk_keyframe_first;
			sk_keyframe_time_next = argument5+sk_keyframe_time_first;
		} else if(argument1<sk_keyframe_time_first){
			sk_keyframe_next = sk_keyframe_first;
			sk_keyframe_time_next = sk_keyframe_time_first;
			sk_keyframe = sk_keyframe_last;
			sk_keyframe_time = -argument5+sk_keyframe_time_last;
		}
	}
	// submit
	script_execute(
		sk_script_apply,
		sk_keyframes, // keyframes
		sk_target, // target structure
		argument1, // time
		argument2, // timeLast
		sk_keyframe, // frameA
		sk_keyframe_next, // frameB
		sk_keyframe_time, // frameA_time
		sk_keyframe_time_next, // frameB_time
		argument3, // mixPose
		argument4 // alpha
	);
}