/// @desc applies the pose at the given time in the timeline
/// @param timeline
/// @param time
/// @param mixPose
/// @param alpha
/// @param duration ? leave this as -1 if not required
if(argument3>=0.5){
	var sk_keyframes = argument0[sk_timeline_header_keyframes];
	var sk_body = argument0[sk_timeline_header_body];
	if(!sk_struct_exists(sk_body,sk_type_symbol)){ return; }
	var sk_time = argument1;
	var sk_mix = argument2;
	// find frames
	var sk_keyframe_last = ds_list_size(sk_keyframes)-SK_TIMELINE_SYMBOL.kf_ENTRIES; if(sk_keyframe_last<0){ return; }
	var sk_keyframe_prev = sk_list_search_binary(sk_keyframes,sk_time,SK_TIMELINE_SYMBOL.kf_ENTRIES,0,sk_keyframe_last);
	// get times
	if(sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_SYMBOL.kf_time]>sk_time){ return; } // keyframe has not been reached yet
	// interpolate
	var sk_bone = sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_SYMBOL.kf_bone];
	// apply
	switch(sk_mix){
		case sk_mixPose_mix: case sk_mixPose_add:
			sk_body[@ SK_SYMBOL.boneFinal] = sk_bone;
		break;
		case sk_mixPose_overwrite:
			sk_body[@ SK_SYMBOL.bone] = sk_bone;
		break;
	}
}
// apply nested timelines
sk_timeline_translate_apply(argument0[SK_TIMELINE_SYMBOL.NESTED_TIMELINE_TRANSLATE],argument1,argument2,argument3,argument4);
sk_timeline_scale_apply(argument0[SK_TIMELINE_SYMBOL.NESTED_TIMELINE_SCALE],argument1,argument2,argument3,argument4);
sk_timeline_shear_apply(argument0[SK_TIMELINE_SYMBOL.NESTED_TIMELINE_SHEAR],argument1,argument2,argument3,argument4);
sk_timeline_rotate_apply(argument0[SK_TIMELINE_SYMBOL.NESTED_TIMELINE_ROTATE],argument1,argument2,argument3,argument4);
sk_timeline_display_apply(argument0[SK_TIMELINE_SYMBOL.NESTED_TIMELINE_DISPLAY],argument1,argument2,argument3);
sk_timeline_colour_apply(argument0[SK_TIMELINE_SYMBOL.NESTED_TIMELINE_COLOUR],argument1,argument2,argument3,argument4);