/// @desc gets the index of the keyframe using the supplied time
/// @param timeline
/// @param time
var sk_keyframes = argument0[sk_timeline_header_keyframes];
var sk_keyframe_ENTRIES = argument0[sk_timeline_header_keyframe_ENTRIES];
var sk_keyframe_last = ds_list_size(sk_keyframes)-sk_keyframe_ENTRIES;
if(sk_keyframe_last<0){
	// not enough frames
	return -1;
}	return sk_list_search_binary(sk_keyframes,argument1,sk_keyframe_ENTRIES,0,sk_keyframe_last);