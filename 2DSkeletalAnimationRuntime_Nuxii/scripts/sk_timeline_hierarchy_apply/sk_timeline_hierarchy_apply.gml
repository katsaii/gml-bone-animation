/// @desc applies the pose at the given time in the timeline
/// @param keyframes
/// @param body
/// @param time (the time to search for)
/// @param timeLast (the previous frame time)
/// @param frameA
/// @param frameB
/// @param frameA_time
/// @param frameB_time
/// @param mixPose
/// @param alpha
var sk_keyframes = argument0;
var sk_body = argument1; if(!sk_struct_exists(sk_body,sk_type_constraint_hierarchy)){ return; }
var sk_time = argument2;
var sk_timeLast = argument3;
var sk_keyframe_prev = argument4;
var sk_keyframe_next = argument5;
var sk_keyframe_prev_time = argument6;
var sk_keyframe_next_time = argument7;
var sk_mix = argument8;
var sk_alpha = argument9;
if(sk_alpha>=0.5){
	// get tuple index
	var sk_tupleId = sk_keyframes[| sk_keyframe_prev+sk_keyframe_hierarchy.tupleKey];
	// apply
	switch(sk_mix){
		case sk_mixPose_mix: case sk_mixPose_add:
			sk_body[@ SK_CONSTRAINT_HIERARCHY.tupleKeyFinal] = sk_tupleId;
		break;
		case sk_mixPose_overwrite:
			sk_body[@ SK_CONSTRAINT_HIERARCHY.tupleKey] = sk_tupleId;
		break;
	}
}