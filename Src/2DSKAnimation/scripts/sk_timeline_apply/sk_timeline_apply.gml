gml_pragma("forceinline");
#macro sk_timeline_keyframe_time 0
#macro sk_timeline_keyframe_body 1
/// @desc applies the attachment to the supplied vbuffer
/// @param attachment
/// @param vbuff
/// @param bone
var sk_target = argument0[sk_timeline_var_target];
var sk_keyframes = argument0[sk_timeline_var_keyframes];
var sk_keyframe_ENTRIES = argument0[sk_timeline_var_ENTRIES];
var sk_script_apply = argument0[sk_timeline_var_apply];
// get current and future frame ids
var sk_keyframe_first = 0;
var sk_keyframe_last = ds_list_size(sk_keyframes)-sk_keyframe_ENTRIES;
var sk_keyframe = sk_search_binary(sk_keyframes,argument1,sk_keyframe_ENTRIES,sk_keyframe_first,sk_keyframe_last);
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
	// (keyframes,target,time,timeLast,frameA,frameB,frameA_time,frameB_time,mixPose,alpha)
	sk_script_apply,
	sk_keyframes,
	sk_target,
	argument1,
	argument2,
	sk_keyframe,
	sk_keyframe_next,
	sk_keyframe_time,
	sk_keyframe_time_next,
	argument3,
	argument4 
);