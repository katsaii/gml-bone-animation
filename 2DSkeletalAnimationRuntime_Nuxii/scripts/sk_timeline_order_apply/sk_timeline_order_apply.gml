/// @desc applies the pose at the given time in the timeline
/// @param timeline
/// @param time
/// @param alpha
if(argument2>=0.5){
	var sk_keyframes = argument0[sk_timeline_header_keyframes];
	var sk_body = argument0[sk_timeline_header_body];
	if(!ds_exists(sk_body,ds_type_list)){ return; }
	var sk_time = argument1;
	// find frames
	var sk_keyframe_last = ds_list_size(sk_keyframes)-SK_TIMELINE_ORDER.kf_ENTRIES; if(sk_keyframe_last<0){ return; }
	var sk_keyframe_prev = sk_list_search_binary(sk_keyframes,sk_time,SK_TIMELINE_ORDER.kf_ENTRIES,0,sk_keyframe_last);
	// get times
	if(sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_ORDER.kf_time]>sk_time){ return; } // keyframe has not been reached yet
	// apply
	sk_cache_reorganise(sk_body,sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_ORDER.kf_itemOffsetTuple]);
}