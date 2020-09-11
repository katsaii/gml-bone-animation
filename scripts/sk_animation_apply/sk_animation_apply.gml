__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_animation_exists(argument0);
/// @desc applies the animation by searching the mainline
/// @param animation
/// @param timeLast
/// @param time
/// @param mixPose
/// @param alpha
/// @param wrap
/// @param events
if(argument4<0.001) then return;
// wrap times
var sk_duration = argument0[sk_data_animation.duration];
var sk_timeLast = argument1;
var sk_time = argument2;
if(sk_duration>0){
	if(argument5){
		sk_timeLast = ((sk_timeLast%sk_duration)+sk_duration)%sk_duration;
		sk_time = ((sk_time%sk_duration)+sk_duration)%sk_duration;
	}else{
		if(sk_timeLast>sk_duration) then sk_timeLast = sk_duration;
		if(sk_time>sk_duration) then sk_time = sk_duration;
	}
}
// iterate through mainline
var sk_mainline = argument0[sk_data_animation.mainline];
var sk_mainline_size = ds_list_size(sk_mainline);
if(sk_mainline_size<SK_ANIMATION_MAINLINE_ENTRIES) then return; // empty
var sk_mainline_keyframe_id = 0;
var sk_mainline_keyframe_last_id = sk_mainline_keyframe_id;
if(sk_mainline_size>SK_ANIMATION_MAINLINE_ENTRIES){
	// search for mainline keyframe using sk_time + binary search
	sk_mainline_keyframe_id = __sk_search_binary(sk_mainline,sk_time,SK_ANIMATION_MAINLINE_ENTRIES,0,sk_mainline_size-1);
	sk_mainline_keyframe_last_id = (sk_timeLast==sk_time) ? (
		sk_mainline_keyframe_id
	): (
		__sk_search_binary(sk_mainline,sk_timeLast,SK_ANIMATION_MAINLINE_ENTRIES,0,sk_mainline_size-1)
	);
}
var sk_mainline_timelines = sk_mainline[| sk_mainline_keyframe_id+SK_ANIMATION_MAINLINE_TIMELINES];
var sk_mainline_timelines_last = sk_mainline[| sk_mainline_keyframe_last_id+SK_ANIMATION_MAINLINE_TIMELINES];
var sk_mainline_timeline_count = ds_list_size(sk_mainline_timelines);
for(var sk_mainline_timeline_id = 0; sk_mainline_timeline_id<=(sk_mainline_timeline_count-5); sk_mainline_timeline_id+=5){
	var sk_mainline_timeline = sk_mainline_timelines[| sk_mainline_timeline_id+0];
	var sk_mainline_keyframeA = sk_mainline_timelines[| sk_mainline_timeline_id+1];
	var sk_mainline_keyframeB = sk_mainline_timelines[| sk_mainline_timeline_id+2];
	var sk_mainline_keyframePrevious = sk_mainline_keyframeA;
	if(sk_mainline_timelines!=sk_mainline_timelines_last){
		var sk_mainline_timeline_last_id = ds_list_find_index(sk_mainline_timelines_last,sk_mainline_timeline);
		sk_mainline_keyframePrevious = (sk_mainline_timeline_last_id!=-1) ? sk_mainline_timelines_last[| sk_mainline_timeline_last_id+1] : -1;
	}
	var sk_mainline_timeA = sk_mainline_timelines[| sk_mainline_timeline_id+3];
	var sk_mainline_timeB = sk_mainline_timelines[| sk_mainline_timeline_id+4];
	var sk_interpolation = (sk_mainline_timeA==sk_mainline_timeB) ? 0 : clamp((sk_time-sk_mainline_timeA)/(sk_mainline_timeB-sk_mainline_timeA),0,1);
	sk_timeline_apply(sk_mainline_timeline,sk_mainline_keyframePrevious,sk_mainline_keyframeA,sk_mainline_keyframeB,sk_interpolation,argument3,argument4,argument6);
}