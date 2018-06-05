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
var sk_keys = sk_timeline[sk_timeline_header_keyframes];
var sk_ENTRIES = argument_count-1;
var sk_offset = 0;
if(!ds_list_empty(sk_keys)){
	// find time offset
	sk_offset = sk_list_search_linear(sk_keys,sk_time,sk_ENTRIES,0,ds_list_size(sk_keys));
	var sk_key_time = sk_keys[| sk_offset+sk_timeline_keyframe_time];
	if(sk_key_time==sk_time){
		// update current record
		var sk_attribute = sk_timeline_keyframe_body;
		for(var sk_entry = 2; sk_entry < argument_count; sk_entry++){
			sk_keys[| sk_offset+sk_attribute] = argument[sk_entry];
			sk_attribute++;
		}
		return;
	} else if(sk_key_time<sk_time){
		// goto next record
		sk_offset += sk_ENTRIES;
	}
}
ds_list_insert(sk_keys,sk_offset,sk_time);
var sk_attribute = sk_timeline_keyframe_body;
for(var sk_entry = 2; sk_entry < argument_count; sk_entry++){
	ds_list_insert(sk_keys,sk_offset+sk_attribute,argument[sk_entry]);
	sk_attribute++;
}