/// @desc applies the pose at the given time in the timeline
/// @param timeline
/// @param time
/// @param mixPose
/// @param alpha
if(argument3>=0.5){
	var sk_keyframes = argument0[sk_timeline_header_keyframes];
	var sk_body = argument0[sk_timeline_header_body];
	if(!sk_struct_exists(sk_body,sk_type_slot)){ return; }
	var sk_time = argument1;
	var sk_mix = argument2;
	// find frames
	var sk_keyframe_last = ds_list_size(sk_keyframes)-SK_TIMELINE_PARENT.kf_ENTRIES; if(sk_keyframe_last<0){ return; }
	var sk_keyframe_prev = sk_list_search_binary(sk_keyframes,sk_time,SK_TIMELINE_PARENT.kf_ENTRIES,0,sk_keyframe_last);
	// get times
	if(sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_PARENT.kf_time]>sk_time){ return; } // keyframe has not been reached yet
	// interpolate
	var sk_bone = sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_PARENT.kf_bone];
	// apply
	switch(sk_mix){
		case sk_mixPose_mix: case sk_mixPose_add:
			sk_body[@ SK_SLOT.boneFinal] = sk_bone;
		break;
		case sk_mixPose_overwrite:
			sk_body[@ SK_SLOT.bone] = sk_bone;
		break;
	}
}