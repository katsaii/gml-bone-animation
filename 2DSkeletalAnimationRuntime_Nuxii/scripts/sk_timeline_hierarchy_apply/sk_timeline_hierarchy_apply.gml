/// @desc applies the pose at the given time in the timeline
/// @param timeline
/// @param time
/// @param mixPose
/// @param alpha
if(argument3>=0.5){
	var sk_keyframes = argument0[sk_timeline_header_keyframes];
	var sk_body = argument0[sk_timeline_header_body];
	if(!sk_struct_exists(sk_body,sk_type_constraint_hierarchy)){ return; }
	var sk_time = argument1;
	var sk_mix = argument2;
	// find frames
	var sk_keyframe_last = ds_list_size(sk_keyframes)-SK_TIMELINE_HIERARCHY.kf_ENTRIES; if(sk_keyframe_last<0){ return; }
	var sk_keyframe_prev = sk_list_search_binary(sk_keyframes,sk_time,SK_TIMELINE_HIERARCHY.kf_ENTRIES,0,sk_keyframe_last);
	// get times
	if(sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_HIERARCHY.kf_time]>sk_time){ return; } // keyframe has not been reached yet
	// interpolate
	var sk_parent = sk_keyframes[| sk_keyframe_prev+SK_TIMELINE_HIERARCHY.kf_parentKey];
	// apply
	var sk_constraint_parents = sk_body[SK_CONSTRAINT_HIERARCHY.availableParents];
	switch(sk_mix){
		case sk_mixPose_mix: case sk_mixPose_add:
			sk_body[@ SK_CONSTRAINT_HIERARCHY.boneParentFinal] = sk_constraint_parents[? sk_parent];
		break;
		case sk_mixPose_overwrite:
			sk_body[@ SK_CONSTRAINT_HIERARCHY.defaultParentKey] = sk_parent;
			sk_body[@ SK_CONSTRAINT_HIERARCHY.boneParent] = sk_constraint_parents[? sk_parent];
		break;
	}
}