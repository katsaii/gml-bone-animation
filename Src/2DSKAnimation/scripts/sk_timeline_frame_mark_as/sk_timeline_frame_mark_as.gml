/// @desc marks a frame for a given timeline
/// @param timeline
/// @param time
/// @param [ds_type
/// @param ...]
if(argument_count<2){
	// needs more attributes
	return;
}
var sk_timeline = argument[0];
var sk_time = argument[1];
var sk_keyframes = sk_timeline[sk_timeline_var_keyframes];
var sk_keyframe_ENTRIES = sk_timeline[sk_timeline_var_ENTRIES];
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
			var sk_entry_pos = sk_keyframe_id+sk_timeline_keyframe_body+sk_entry-1;
			switch(argument[1+sk_entry]){
				case ds_type_list: ds_list_mark_as_list(sk_keyframes,sk_entry_pos); break;
				case ds_type_map: ds_list_mark_as_map(sk_keyframes,sk_entry_pos); break;
			}
		}
		return;
	}
}