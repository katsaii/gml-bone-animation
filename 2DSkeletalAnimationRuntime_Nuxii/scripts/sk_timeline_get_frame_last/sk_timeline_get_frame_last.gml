/// @desc gets the first frame of the timeline
/// @param timeline
var sk_keyframes = argument0[SK_TIMELINE.keyframes];
var sk_keyframe_ENTRIES = argument0[SK_TIMELINE.keyframe_ENTRIES];
var sk_keyframe_last = ds_list_size(sk_keyframes)-sk_keyframe_ENTRIES;
if(sk_keyframe_last<0){
	// not enough frames
	return -1;
}	return sk_keyframe_last;