__SK_OBJECT_DEBUG_ASSERT_EXISTENCE = !sk_animation_exists(argument0);
/// @desc applies the animation by searching the mainline
/// @param animation
/// @param timeLast - this is required for events
/// @param time
/// @param mixPose
/// @param alpha
/// @param wrap
if(argument4<0.001) then return;
// wrap times
var sk_duration = argument0[sk_data_animation.duration];
var sk_timeLast = argument1;
var sk_time = argument2;
if(sk_duration>0){
	var sk_wrap = argument5;
	if(sk_wrap){
		sk_timeLast = sk_timeLast mod sk_duration;
		sk_time = sk_time mod sk_duration;
	} else {
		if(sk_timeLast>sk_duration) then sk_timeLast = sk_duration;
		if(sk_time>sk_duration) then sk_time = sk_duration;
	}
}
// iterate through mainline
var sk_mainline = argument0[sk_data_animation.mainline];
var sk_mainline_size = ds_list_size(sk_mainline);
if(sk_mainline_size<2) then return; // empty
var sk_mainline_keyframe_id = 0;
if(sk_mainline_size>2){
	// search for mainline keyframe using sk_time
}
var sk_mainline_time = sk_mainline[| sk_mainline_keyframe_id+0];
if(sk_time>=sk_mainline_time){
	var sk_mainline_timelines = sk_mainline[| sk_mainline_keyframe_id+1];
	var sk_mainline_timeline_last = ds_list_size(sk_mainline_timelines);
	for(var sk_mainline_timeline_id = 0; sk_mainline_timeline_id<sk_mainline_timeline_last; sk_mainline_timeline_id+="x"){
		var sk_mainline_timeline = sk_mainline_timelines[| sk_mainline_timeline_id+0];
		var sk_mainline_keyframeA = sk_mainline_timelines[| sk_mainline_timeline_id+1];
		var sk_mainline_keyframeB = sk_mainline_timelines[| sk_mainline_timeline_id+2];
		var sk_mainline_timeA = sk_mainline_timelines[| sk_mainline_timeline_id+3];
		var sk_mainline_timeB = sk_mainline_timelines[| sk_mainline_timeline_id+4];
		var sk_interpolation = (sk_mainline_timeA==sk_mainline_timeB) ? 0 : clamp((sk_time-sk_mainline_timeA)/(sk_mainline_timeB-sk_mainline_timeA),0,1);
		sk_timeline_apply(sk_mainline_timeline,sk_mainline_keyframeA,sk_mainline_keyframeB,sk_interpolation,argument3,argument4);
	}
}