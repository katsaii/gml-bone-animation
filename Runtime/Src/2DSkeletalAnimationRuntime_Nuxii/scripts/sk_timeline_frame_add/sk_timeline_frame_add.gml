/// @desc adds a frame to a given timeline
/// @param timeline
/// @param time
/// @param [frameData
/// @param ...]
if(argument_count<2){
	// needs more attributes
	return;
}
var sk_timeline = argument[0];
var sk_time = argument[1];
var sk_keyframes = sk_timeline[SK_TIMELINE.keyframes];
var sk_keyframe_ENTRIES = sk_timeline[SK_TIMELINE.keyframe_ENTRIES];
if((argument_count-1)!=sk_keyframe_ENTRIES){
	// invalid frame data
	return;
}
var sk_keyframe_last = ds_list_size(sk_keyframes);
for(var sk_keyframe_id = 0; sk_keyframe_id < sk_keyframe_last; sk_keyframe_id+=sk_keyframe_ENTRIES){
	var sk_keyframe_time = sk_keyframes[| sk_keyframe_id+sk_timeline_keyframe_time];
	if(sk_keyframe_time==sk_time){
		// update current record
		for(var sk_entry = 1; sk_entry < sk_keyframe_ENTRIES; sk_entry++){
			sk_keyframes[| sk_keyframe_id+sk_timeline_keyframe_body+sk_entry-1] = argument[1+sk_entry];
		}
	} else if(sk_keyframe_time>sk_time){
		// insert new record
		for(var sk_entry = sk_keyframe_ENTRIES-1; sk_entry >= 1; sk_entry--){
			ds_list_insert(sk_keyframes,sk_keyframe_id,argument[1+sk_entry]);
		}	ds_list_insert(sk_keyframes,sk_keyframe_id,sk_time);
	} else {
		continue;
	}	return;
}
// append new record
ds_list_add(sk_keyframes,sk_time);
for(var sk_entry = 1; sk_entry < sk_keyframe_ENTRIES; sk_entry++){
	ds_list_add(sk_keyframes,argument[1+sk_entry]);
}